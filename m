Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458BD3CDBD7
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792294439; cv=none; b=PZ827c1Gs2hA5DmFBHK0nkMypwep3xaZVUIH0SrWlLD+dysrU5ykMtXPzuiVjW/jyOjI2YmHuiEPre0JRQQwxnKLgyAnzeap8Ye6kZLiWL46T9vpaQIlm5tRSQKlbjZqZYYHuae7DdjM2UXDbj/2jVHsfe4T6UxrEaHmqs/Ft2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792294439; c=relaxed/simple;
	bh=iVbohgY+rmCUkvsLlybYzGH5dGh+hT2gpULT/kkoPak=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OqjfTswSeo3roR2LeuEb/dTzNLSkgiaskKmqmMebMG6ZTat5b+6xMtm13psjYRtcDWaPhzbySB+UNFlFLvQ0WQuMr//u0n2vWsa6mVOiNcQOmoVOOxBlykZJ0U6hcan77HG0uO8iNgSdb35wwuSPqd+AnHKeTY5o2+WcALSh9XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWx3gb9i; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWx3gb9i"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91b8306b9f8so17420566d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792294436; x=1792899236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L0T1mzJG9BohDm53AyHgfyQvkB4J+HKUMcwN4frFX8Q=;
        b=jWx3gb9iDI7aNvOQzqcvrzi5EwXlVAKxhTFtwVEx1kKgPh7C2CtobtwCNEAZo4ee6M
         bUvUDWTijPbZYPMoY3gNPNTGAWVdpnorFzhz//TfhMCs4j7E1nI6ODIJx+McXhaijHcr
         kO2TZfS8XgTtqTi4ZqkNkO/caLn6xcySxBMUtqNLEZS/Yos1D5eN334BueXXK9Kb4sKT
         OXk0ENqmcnDzd0ei/vni62Ml0ZamYCWGRhoP/ThY26DL4N7OfxsScJr3Hq5X/OxhGV/z
         nQZuOE11Ia0E0o5inRChIhMzA/ougpnks0qSDVDXNjZ0xawOcmxuDP7Ts96JYO6Te5Eh
         4nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792294436; x=1792899236;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L0T1mzJG9BohDm53AyHgfyQvkB4J+HKUMcwN4frFX8Q=;
        b=ySu82GwFuiVUFbV6wulVp8VgSxkT00Q9SjnB4VeMjw/8T4oXdAuD817r9UentlanIx
         GjzAk+DfgFatoPN6/0ydCvB9moLmYjZGlGIVnkci3yoQOjxP/hq2m4MXkRJhkhW7KiTV
         a96vmjMpntOJfbhNRxkF1hdFnCcvcy6rJ9tSUkd09Wfffioum+QRwn08R+TatRQO6kni
         bZL/myOE08dskhUgRj/3ocWbGPoH2md93xN0S0HGGd2NpNs0E8cKzs5S4qeCINTq9Be/
         aYvJZ0Ik+G5MEvcPwHoSW62OSc4UaVU/vN2LjgXHGtU9bMBG6M1kC72ORKU6i75WKM9+
         08vQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXKC2S1fpEGbQ9pt2Wz0ONiPJZ5oJ1hFwYN/CvEfNwx1Z5e65i6CmaJgZ3wfGYufOvjSuiKRw5EX/+rFM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaNmnSTwbV+wSjk4+CpaLmSpVDrMavc4ReUUkf793GefWIO2LV
	mgObng+cJBx67u94jnuHacsLDTkBe7Cmr+sUG7btyPaHe0JcS7uTUzL6vWz8zz4=
X-Gm-Gg: AYBFou2YxLACWzc26TneJl7SfDwARka9gEB3Z6Cr766AZivsaP9m85LSIu4AWXscgQm
	74YKYivS+P3uC+VzXG8jqw2gHabIbhsjlVcDEecIvR5gN+xFrux2sQGMVpccP+YH1Ye2eqL54pc
	npoGRleztSvl3pqBC7iyHbxyaDuFm4uZRQNG/VxG9RmsVfeGeuczh90htUlCN62CgDwHbLK699X
	/LPI2K0N1uhTsI4bjRdG/prKDQazZAVHvkMfrF0aBbKMb3qBFWcsWH5xOHwXyBHCWXD6ltVgWXr
	mMqZ9svzVhxslGPpkZWRE6GFiXnSoer1R7x4mPrHWikBK5eKweUX+9EeXE2S6E0GtBcvaaT8iSD
	Z0kh+vhLXGosP2A8BFLfe+/yYgJgKQM/oa08oeZ1Ve8L1IY1J5641d6+mhl7L84myZF6Y3uWQFu
	HOsaOv8/Cu/0LuWVnU2ZAwDCp10TPGjBYxAr1iAzHArlG1La86kq/elV3hdS3hgQ/5O8RPdzEkh
	b0iE1aHR7d0DFGbv5gEgzlQW1PMZIrGMDtpKOnv8fWEAUgop+ZRPuY8nm+a//P7Ogu3OGUk6eg3
	h8mgxNoHOTJg9tglP0O6fhXXKKia
X-Received: by 2002:a05:6214:4521:b0:91b:5d39:e144 with SMTP id 6a1803df08f44-91bdf6392e9mr71140146d6.57.1792294435926;
        Sat, 17 Oct 2026 20:33:55 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba4b9f0sm62831896d6.10.2026.10.17.20.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:33:55 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] platform/x86: gpd pocket fan: Cancel work before releasing GPIOs
Date: Sat, 17 Oct 2026 23:33:53 -0400
Message-ID: <179229442299.3956787.17526066623947466315.gpd-pocket-fan@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fan worker changes the direction of both GPIOs and schedules its
next run. Its managed cancellation action is registered before the GPIOs
are acquired, so devres releases the GPIOs before cancelling the work. A
running worker can therefore change a GPIO after the driver has released
it.

Register the work cancellation action after both GPIO acquisitions. This
makes devres cancel and drain the worker before releasing either GPIO.
No work has been queued yet if GPIO acquisition or action registration
fails.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: b82a7b018b93 ("platform/x86: gpd pocket fan: Clean-up by using managed work init")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Compile-tested with Clang, W=1. No hardware runtime testing.

Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.

diff --git a/drivers/platform/x86/gpd-pocket-fan.c b/drivers/platform/x86/gpd-pocket-fan.c
index c923673..ced9379 100644
--- a/drivers/platform/x86/gpd-pocket-fan.c
+++ b/drivers/platform/x86/gpd-pocket-fan.c
@@ -153,10 +153,6 @@ static int gpd_pocket_fan_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	fan->dev = &pdev->dev;
-	ret = devm_delayed_work_autocancel(&pdev->dev, &fan->work,
-					   gpd_pocket_fan_worker);
-	if (ret)
-		return ret;
 
 	/* Note this returns a "weak" reference which we don't need to free */
 	fan->dts0 = thermal_zone_get_zone_by_name("soc_dts0");
@@ -175,6 +171,11 @@ static int gpd_pocket_fan_probe(struct platform_device *pdev)
 	if (IS_ERR(fan->gpio1))
 		return PTR_ERR(fan->gpio1);
 
+	ret = devm_delayed_work_autocancel(&pdev->dev, &fan->work,
+					   gpd_pocket_fan_worker);
+	if (ret)
+		return ret;
+
 	gpd_pocket_fan_force_update(fan);
 
 	platform_set_drvdata(pdev, fan);
