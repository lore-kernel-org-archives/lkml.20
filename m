Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537686;
	b=MNh2vDDs8EKXjoPSPS3gVRRPuwuWPWNG7aA3F09V3M97+oAihftktS0HG7FrNPL/0Y++
	 2OkkPYhQrIi40IVMd5chB4gQsQa/udl6bhih0Phr4mZWhTax1DAYxMdiI5luLu2w1Na68
	 i+MGFOhdTZpPTjFMJLo7d638Bin8SDuu4bhU786P6byb/76UT8y534hvl//LIOnNu7zpW
	 6gRJI/LHVCiYUZi1o4DUbdbQWbvZYs3Z1jUBGO2f//Mbe5rQcZtzzD/OdEC6GWE76dFm1
	 qrROdw6xvZwl9vfqEl9fBjapigt2pUMIqu4T7z+pxYVvhOm+OJziR/A31dcBMWR4zjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1umUU6E6aYyeT1k/Gpsp+FhAOaMvQ+4/dxDpS4M7kSE=;
	b=ev5gun9FXILcxx56jxYfreeKhgzmLSsZk4WBnwYRYuMfAb24Veo/nssKuwNqDjv96a/j
	 KrfAH9QknU9hKsgz9iAsPTEwezK4BDDZGkH8Ri8BSx3ssmDn2vjmAfnY0ehDo9zvvC5+Z
	 3bz2k0pere25H1XDcSzJC664lUoxByHFWYZ3BuTHilDAEMalHSJ7jX6lnMHWrNg4RdIof
	 tBMmk0bpIAGC6fM1sT+jOgV/JSJtGaq5OpQHo6UEyTGEwXKpbxDog23M1f0QhlwdHIIPj
	 FiTRA++U5x8l1eab6COM4cybnCLxmZlqWzuvopif3DyKcgTz6Hgp7WWarU5Jrbtz5eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dVbRKYny;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F78606A338
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F78606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dVbRKYny
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37605faade6so68559eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537685; x=1795142485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1umUU6E6aYyeT1k/Gpsp+FhAOaMvQ+4/dxDpS4M7kSE=;
        b=dVbRKYnyths2fZT4KghoNuIZOk83gcvy+dZ4HKzIuJHMXqGsWPzgfd5VY6D57x8XSQ
         8Ya0/TtG2vOCmHl7xfWCnhisaRtw89LNcAiqwEPKf822/54psw7oKXoNlEo9ve1Wxf2/
         +1i9XFp00WZYzvsfmAFgurlxG0oLGfKrgyWtULtMcpYUYLTLB14LEQLRatF8p+9dk27R
         d+jjbx46twJuwdv3P1z9MMJtc8ULK4fRwXuA1hmJq+EAZjTt46M1i8mv5umyveZvfJTD
         157xu8biLDMiDh91jfYqjaFrSZ/W+fucYNmp60SSbzkXdWKhQy9M1tRELHhUvNcUKR1l
         Jn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537685; x=1795142485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1umUU6E6aYyeT1k/Gpsp+FhAOaMvQ+4/dxDpS4M7kSE=;
        b=PKPtAJhCA05lhxu0w1lfvw5AProIsP0EcsbDLxI988RR5pxVaOCd9Y+kumBzhoSbjh
         jZvlQpM9DsnuEZlRk3R+ywCGqOwSDx+YH+OLsMk/ZMkrfpxP22s2ERbEo5OBbJyku039
         6tGnozvpIXTiFhceoADG3g1vsoA6dM7kcrp5I+hh+z/1r4RoWG5rxc2gAiIyZtO1ELE6
         u1b9BStDdZfc29uxM5kCloE2Afk45Ok/fxvNd0XhJWCgydKlQ0CyLSTtPSjuk2UNckQ0
         MPs+CPybjAJjs/qVWAL+WbF1clWfdpfE2xPlh7J76O4+ZcnDsNuom+TwIblWgiyAYIhT
         j/6g==
X-Forwarded-Encrypted: i=1; AL+hErEJueDLBo0zgHHeh3anh/ssj1aMVvdfj8lP+sJmB0ebj1QT3K3tqpxUaIcDgcJ9OMlrnD3o/ngx7fXn5e4=@vger.kernel.org
X-Gm-Message-State: APuU4Z99eGbKb7Yizbr9owrOLyp2AiC19ND1uGgojjCPv3f/ocD7keyk
	DullCMSHsEutWQhJm4CN/HL3xXfEG+A/ZAfvfmzoVnABrE/nffa/ojbE
X-Gm-Gg: AYBFou0n/QhfJ3ik47dXkKa/DZywM6WnBArPIWRGj+gM3suVO0q8a22dace9oa8p4uD
	eM67wk3+rfn3dO7UWBz8DdWYngf2MHQVv61G2Wb8eCRO7OtfwYXcYz9RfNWFrhB6NliWKdxGEuC
	YYTMPOeV3WVRWjRUXvYjrjOwzXZ+L5FZJTYnyQssCouGndlduuoCGRF3tD4dPvDhCD3uGiR18aB
	gVryNf/a3DRL+KuGuRRn3NE8OC1W0eGFIHZcUgn8+POMPaVX//7OAHIo2iVZZtHBxOAGMOkYJpu
	bvU725/aIR7Wg8do73jiKhLAkMWJJxIsPEUa0CKOrWK3Ffx0DJTZ7hlrrPELWwmP7r8qJEROUBC
	+mGE+IfYms3L3WLbOgFMtuYRwwchERawJHzg9sawvd6HgoDULbD4A9nudDCTeyLGewuOk9UGJVN
	fvm1Tli2Bzfa8hUirRLnG8c8c2le1krt3EgBdWuJHXW6Rq0dbDlThaGVrMM11z4jU9EZe/iQeOB
	e21yXxtZpKonH6/eE0f3rPvm3C6hJpeAzt23k/qmqNy1lPF5GIcR1eOHfFBDXDCfs9hbuLhK+o+
	kPUqvMtlFCyen+HqGb7psTmHMk1BCCZgn/5S2CI3kyrOnj4WYh3Qg0IGsXwIerV5BdcAIrUReEx
	nTS247jW+KPFzXP0NzvhttDR3uzsk+F57KKJs4Nca9icY/PF9MAgwmtiX5lB40/XHN0F1ZzkRYJ
	XdGYdhimYPcakwAtLDXxMQMwcx5nYnWxU=
X-Received: by 2002:a05:693c:8204:b0:372:c0ee:875b with SMTP id 5a478bee46e88-3796057b529mr1566710eec.0.1794537685511;
        Thu, 12 Nov 2026 18:41:25 -0800 (PST)
Received: from esteban.tail1178e6.ts.net ([240b:c020:623:52c6::44d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm2334704eec.22.2026.11.12.18.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:41:25 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 2/9] media: i2c: ov7251: Fix link frequency index
Date: Fri, 13 Nov 2026 11:40:52 +0900
Message-ID: <20261113024059.1087031-3-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113024059.1087031-1-antoine.pichot@gmail.com>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov7251_check_hwcfg() stores i, the index into the firmware's
link_frequencies array, in link_freq_idx, which the driver then uses to
index its own link_freq[], pixel_rates[] and pll1[] tables. The matching
driver entry is j. Store j.

Observed on a Surface Book 2, where ipu-bridge lists one link frequency,
319.2 MHz, which is link_freq[1]: V4L2_CID_LINK_FREQ reads 240000000,
and the pixel rate and PLL registers are off the same way.

The 319.2 MHz table this selects ran its PLL outside the datasheet
range until the previous patch, so do not apply this fix without it.

Fixes: cc125aaa5a78 ("media: i2c: Provide ov7251_check_hwcfg()")
Cc: stable@vger.kernel.org
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/i2c/ov7251.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index f429de5f1f7c..1f30a01c85b3 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1523,7 +1523,7 @@ static int ov7251_check_hwcfg(struct ov7251 *ov7251)
 		goto out_free_bus_cfg;
 	}
 
-	ov7251->link_freq_idx = i;
+	ov7251->link_freq_idx = j;
 
 out_free_bus_cfg:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
-- 
2.56.0

