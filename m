Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4B146C4C5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389647; cv=none; b=qN0sAV8CRdedBkbmNLnsYGxlFDTOMnUc9SgbrrUsTOcHdQQbk/1f8ezVWpjxSjkSezbn3WTxTckB90sxbBNX6LGCaVM6w782rAY8JxNTUfMp8w0UlYqvZ5uFEpMlLhjJ9tx7lE5FIl0U1pp3pj1G4O+xRwqPN+eDrMpf/1UZ71E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389647; c=relaxed/simple;
	bh=q8bwhVOS2Q2tpx89t9Vl5SDienAaREAdOX3DiRJmeU4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MJmIA6STTC9WkVGspIML0/FsE19ziTNANq5YuOGeGLsMmkjdVQ+qAK9dwHGvo/GJBygFma9AjwPqxl77usUDxnhifsPRrYShWjdTpgrjLEdlhnZtQsugPxADprhBYfkDHis09+hnQ258Lv12l9nstb3ENIAEdz4x0BbTeeYbqaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFuc6nvk; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFuc6nvk"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-80527255583so570108a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789389644; x=1789994444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=718Ayf180iqV39sL4SEKsU5v63hqKWeZ6vfIuYMZ+CA=;
        b=UFuc6nvk0usc0NYbQvNXEb/3/R0WYKXvobdpHyAmqBGfymIMLZZUyl1b8ppPDyfOtt
         DprP/QB8sG3nJS0g/r/LCCR7OsLXxUPy+EvJzlk786HoBdHBzFDrdlatpFfFetcW+X0i
         IfBdWMxQKUtGHsErygAo1bN8yQpljpcxwsFFuBXAwpyiYXMJSwjL0GaXzdH+SABrYHUk
         bcIm1trXMrgcLQxhl95AatItVvAB2DkE4QrZARbAdYy7DNewgAcAhwb3IDck6GBL/wsD
         W2FNWOBUeeInrB6CT/Yti+DMLxfPMKscMPaEOejPaaCYWxOq6f+YyAXPGf70/dOpqkSu
         fosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789389644; x=1789994444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=718Ayf180iqV39sL4SEKsU5v63hqKWeZ6vfIuYMZ+CA=;
        b=rUGLciENME0yDXyXpTLUD/985icCC6TEqG7tqQDm2Anndl+sx+3X89TehrEOoZ6jgX
         wkzxbQ1equgT/6+DfyVd0yW/fURIi3ysU7DQDYAFIZiHvi2odaTMBRf13wVwmTR/+6tf
         RtpxTgyL2YqGQUtw/8ymetmi1WrYPbJbSp5XoxxMzd3GDg/pAR6H4usQeFZaWqHPRk60
         e6f8lzZPWQ4uzNkoYgqUvZpBbeSHO4/XKoIBaEBERLqaV9C1xqBBQj5/YEojJvXK9JE1
         wiWUKmC9rvZt/6qZyQvQOPgPtg6d5aAPs6YuiKTwT0cuT+RN9+PJ3sdXLxRY6/VIH49p
         vXag==
X-Forwarded-Encrypted: i=1; AKwUvBx2FzD6DsdD27/r+aPn2JHAO7tMWoxliMcEorCOnb4acofFCWdzNk0wPPkOhc56OR5mgg9l5mhAVfMgFwU=@vger.kernel.org
X-Gm-Message-State: AFuF++mJ3sv/utIuo0G720MEhOmwEelYHWorsZUpgyYzw0IUaPce5DsC
	kcvdvVGQn33AJ5ASyJl7GF7ncSjfEE1IydB+D3ql9QdnbLnbie5KpKGcAl9lbw==
X-Gm-Gg: AYBFou3H5M5ezMVQH3qJNwE0FoX/7S3ciZVxMTcx7rk7WLn0nNMLXBSinIJIKdttNgf
	zV8QdchV0KFt0wsmh5gCSo7IP2k0MhZbK+t9omCtPdB5AT/7HmXv2w6a6TOXr6h/83DKoggj9Zf
	VmRFI207UH+0Cc5YGT6R7vyEmz80Eo7v5cdLhbQw/FVZMtK4ewph61TjW+3UMjOHDWPF0mizALL
	9zLuPSzv90k9RTrevDegr1q71z+35Nj/kQNj/VBtec1uDnDo+MmjbCJGueJfd2/316AMQ9gRdI3
	updjF3KwHJYPFCXuCkLyyJ9Ff2QNhS68LH/EmLr1fTX2S3rrh4+v8qAZ0eIaAdjA22Kmk9f36Xk
	jIFEAB/gshH54Jn8O3In1Bia08QLHcgTzrfMytlVg0NDIUcHfxuOA5B8sT5CZ1A57LFiAPgpU4N
	AHN01Y5fYaUBq3zWpyGzncw+Hwx4k6W81EH7Gmm7fqtMWSIjXEnHyryI9xEoqNJa6JzVIdDpOfh
	AXR4M+jvya05lv7
X-Received: by 2002:a05:6830:380f:b0:7fa:5c68:d053 with SMTP id 46e09a7af769-8089a453a04mr1442257a34.29.1789389644050;
        Mon, 14 Sep 2026 05:40:44 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-805cb5ba734sm6527788a34.0.2026.09.14.05.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:40:43 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: pxa: fix IRQ leak on probe failure after pxa_rtc_open()
Date: Mon, 14 Sep 2026 19:40:37 +0700
Message-Id: <20260914124037.2204337-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pxa_rtc_probe() calls pxa_rtc_open(dev), discarding its return value.
On success that requests both the 1Hz and alarm IRQs. If a later step
fails (sa1100_rtc_init() or devm_rtc_device_register()), probe returns
without releasing them -- and pxa_rtc_irq() then dereferences the
devm-freed pxa_rtc on any pending/spurious interrupt, plus a retry
fails with -EBUSY since the IRQs are never released. Not theoretical:
commit 34127b3632b2 ("rtc: pxa: fix null pointer dereference") documents
sa1100_rtc_init() failing this way on a real Zaurus SL-C1000.

Check pxa_rtc_open()'s return, and route both later failures through
pxa_rtc_release() via a new err_release label, mirroring the existing
remove() cleanup.

Fixes: 3cdf4ad9633e ("rtc: pxa: convert to use shared sa1100 functions")
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/rtc/rtc-pxa.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-pxa.c b/drivers/rtc/rtc-pxa.c
index 62ee6b8f9bcd..e01e683c2f61 100644
--- a/drivers/rtc/rtc-pxa.c
+++ b/drivers/rtc/rtc-pxa.c
@@ -338,7 +338,9 @@ static int __init pxa_rtc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	pxa_rtc_open(dev);
+	ret = pxa_rtc_open(dev);
+	if (ret)
+		return ret;
 
 	sa1100_rtc->rcnr = pxa_rtc->base + 0x0;
 	sa1100_rtc->rtsr = pxa_rtc->base + 0x8;
@@ -347,7 +349,7 @@ static int __init pxa_rtc_probe(struct platform_device *pdev)
 	ret = sa1100_rtc_init(pdev, sa1100_rtc);
 	if (ret) {
 		dev_err(dev, "Unable to init SA1100 RTC sub-device\n");
-		return ret;
+		goto err_release;
 	}
 
 	rtsr_clear_bits(pxa_rtc, RTSR_PIALE | RTSR_RDALE1 | RTSR_HZE);
@@ -357,12 +359,16 @@ static int __init pxa_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(pxa_rtc->rtc)) {
 		ret = PTR_ERR(pxa_rtc->rtc);
 		dev_err(dev, "Failed to register RTC device -> %d\n", ret);
-		return ret;
+		goto err_release;
 	}
 
 	device_init_wakeup(dev, true);
 
 	return 0;
+
+err_release:
+	pxa_rtc_release(dev);
+	return ret;
 }
 
 static void __exit pxa_rtc_remove(struct platform_device *pdev)
-- 
2.25.1

