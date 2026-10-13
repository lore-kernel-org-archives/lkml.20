Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6583D525B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885484; cv=none; b=bcz5XD6zKCUD2JpiY7IRj3NiotXLpdcXAFMfEqTeDi25fWFguRqjLlwnB8rxuxpuT5FmMVKZQSKdvg/92hc2LTdO22szcw1YtsILvNRASiq92LnOwO0xozoVy0EDaFKtuLpIbVDCgdDMZFjAU2ShBRq6FdghxYObjNVH6126TbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885484; c=relaxed/simple;
	bh=qEnhoB3YyOwXDXR7+xXeJ/gYJ+Nxa3H2gZ3Mni7bP5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dGWil0q8Vh4cgvCHo2y5g2LPgPqirnv8Stzrw3+PIfVlKZR1zXGiRapUXDfgQssFLpvbrEsWj0UcXYF5fObL+/XD8ESTMRQxhYBuI2KGmItFnb1P6LrZTrJ+iFFT0dk7fGMOUet8D7UJrPpvjpLD47reuETsLFfKsaDoOK52pkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCGHyMWD; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCGHyMWD"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1593028f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885481; x=1792490281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uQEWFhbYK6EZsDbloJ25pzWntz9wwdcvgIHcKgGIKMA=;
        b=MCGHyMWDNsUYk9ThI/G5uB5vNnVgRTedm5fkdjmB9X567Gxhfc14D4kz5kH6brQfj/
         PVDBA74UXIhKjjo/rGW+4CPPtcbYkW+nLTyfZ+Sc0ca1vODkQk8XwUgwTrNeKWX5GDoZ
         73o9/rGnW6BW3PoZsP+nXAfbP8iQgfWCKRFhUrPa9ixoqc28YCucgUlKYtHRTON5zN4b
         pkf7TK7cX/WtpqoIo8h1jwMYV33kJh4EUqMezAg8K4kB7eSk+ZWmWBMrEuXvHCddBp5t
         e80BUJIUa5qHnCweCYUc5IDFlbzSk3AxSaRrO6H90Fx8Ctkwmwgw+b6Ro5fSrAE1LFRi
         7DbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885481; x=1792490281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQEWFhbYK6EZsDbloJ25pzWntz9wwdcvgIHcKgGIKMA=;
        b=uNX9IVzw1BLxn7KD3XmCKH4+vSLuReOHVk7/AOZrKznP3eVlQ3uwMlKZo64ngU4lmr
         sCiqI5oU8qgP04y3juvBBQi2ovz35wsDvNxCXzCnYDVbgcv2whTnB6NmTgECvYMObcti
         a9YvHrMEFCzA0cpmMNlAtfVoyDhIB4TTvZldwohoQZWGeXWIqtmeJnD9vrKBymTS026w
         KVmZJF4o3a8jk5NLFRvmx5hFvhPSx95gxRufNXxP5YoUgMbJ5LcJRvdxx1mS88A77gJZ
         ncNyY8mOszQxw9RG8sfhyYqmcy9Ekf3Qw3gJUOAX6mxQ3XqIuspX0GBeSARaYJyYTZkl
         C0wA==
X-Forwarded-Encrypted: i=1; AKwUvBwPOQeWrQdO12+7FL8y2+bPg+Vk+rUOUI6AYuSSaNQCXNNlXjMJqccr/kd2KXJF0pSoa2yfWwMh0dtjL40=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBs2gkqfcq/R6DP7mek4biGbqfE5WxyjFHid3typ24Uy6uIYWh
	37WgGh1pypXzOCgFSDXtg8halx/1EQbkuDdPTwUWiRJQgSnXFXhRDp3W
X-Gm-Gg: AYBFou3X7DSQ5XRxFWuDC3yb6HagJgug2wxVAM46ZY+bRkHz0cOUPvlLNjPWlGc5z5R
	CaGeXEK05ik/Sp96WpseL2ziu1b//HVun5CFsam9Qxh5eMIP3x5Ye7K+eRNwAvoXBVtgxKpHiVe
	Ns5eTCJsBmzlcNmhMaPmVcKRgqvMIskPaD2ccRolVR2g7kuUAPvPnoFrp+ijKZOakL48HJEj/au
	dzDO9YK6HwgsRRYgcBfhZUpiLVO9q6MAkQKvnlt8JP48d3N7LtrbTlhrD6LThPd2HCWRpX8R0z/
	1CjsCN/SauXdGsdKkGCihlwWOoMN1zjl4zV5mdRK10tzDVJCqyUpvm/RC0gu9LWwbaJNxB6GPHg
	vBDP6GCbe6aVzWzrGGJuyzej+tLCW5nL62y2mJlKYroEFbwoU+Lk5Endl+nz7TMeq37oWfloaJe
	93wAy1pCMc6yA7UrZU6gfH8JuNHxtR03pdrPprBSQgQXTz13th/sSRSJVsGo60AWHoiCr43x/GU
	nWInHdjTTqc4wwqxC4ZvSP6ig==
X-Received: by 2002:adf:e014:0:20b0:48b:116d:56fb with SMTP id ffacd0b85a97d-48dba77ce45mr15979271f8f.1.1791885481321;
        Tue, 13 Oct 2026 02:58:01 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:c7f5:a913:e714:a9c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5991sm4466267f8f.29.2026.10.13.02.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:00 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] cache: sifive_ccache: propagate IRQ count errors
Date: Tue, 13 Oct 2026 12:57:56 +0300
Message-ID: <20261013095756.1084568-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

platform_irq_count() returns -EPROBE_DEFER when the
interrupt provider is not ready, but
sifive_ccache_probe() only checks for a zero count.

-EPROBE_DEFER seems to be the only negative return
code possible here (currently).

A negative count skips the IRQ registration loop and
allows the probe to return success without requesting
a deferred retry.

Return negative IRQ counts so the driver is reprobed
when the interrupt provider becomes available.

Fixes: c90847bcbfb6 ("cache: sifive_ccache: Partially convert to a platform driver")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/cache/sifive_ccache.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 2acb8bdf06d52..b4033110f34e5 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -262,6 +262,9 @@ static int sifive_ccache_probe(struct platform_device *pdev)
 	quirks = (unsigned long)device_get_match_data(dev);
 
 	intr_num = platform_irq_count(pdev);
+	if (intr_num < 0)
+		return dev_err_probe(dev, intr_num,
+				     "Failed to count interrupts\n");
 	if (!intr_num)
 		return dev_err_probe(dev, -ENODEV, "No interrupts property\n");
 

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0

