Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5296339E184
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907617; cv=none; b=QUewVf3k+wvO9MFT5bnECeZqzOIaxpR+PZwYy4JvEXjtkX3SsRW7jI78iiwDOXUcPaiKfvBJ/Qe6TZPU6zOIHrYQa/wd47Vmw5NtloObGW/b7LjojO0ZHHSr4Sx/4u/l3enm8j2tfkeVtOs05vARN65Wm5B5BLem9+vyqBIE9g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907617; c=relaxed/simple;
	bh=QzTyrp5ZtI9h+7JIfZbJaZg9Ky9cEZndB4nrChNEIME=;
	h=Message-ID:MIME-Version:From:To:Cc:Date:Subject:Content-Type; b=s+D0ZNTj6a7UOh3b3XtlfIRFNlKDGYZ47Umzy5F1LONXQ3LDimkvGYHOZi7YmeNLpDfR5isIQbqyAQrHX3H0F0kgmB9D4BBRAyV+aa/NgdnQdJJwDcMdE84tlELEY/LQCbgdg/CD9E9hn6KHt55idhtKTVBnNMufZ2OIf4jpEJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OcN2PdNV; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OcN2PdNV"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-853c401326eso528745b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787907615; x=1788512415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GBj03YUyO42gKTg2Nn2xcgaGG+u4Z9YmWa87lQqvR2k=;
        b=OcN2PdNVPtAyoq51gmjz56YHAyusWFiyAuOh1Ubdoch/6SqykNYERzxusfm2cTaYsw
         oB+bNCyg19ajeHQ7378lqgxn+Pj2N3/8Djd/va6qsipt9S9i+y1vmfOW3DKdR+PHKUV3
         vnlxm3cY6ZOaJDNakI1jbT3BbtkgLl94KlI3gpN53jbmVGxz3ZEMtW0D6IWOkMWEzPv+
         Ax4zdhV9vjOAqNV8KnKvKIsymuTZLKa0EY8C5TrMX79BNrThG/TiJ8XndQjRYoyDF/J8
         MCUjiHHIETXpm6WxiPrX40pKoOfdWgAsnKoOE9xt2e+XskMsYGzpsn3cCR5uOxNHk9Sv
         Nezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907615; x=1788512415;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GBj03YUyO42gKTg2Nn2xcgaGG+u4Z9YmWa87lQqvR2k=;
        b=JdQpUDG63iphu6kawOrkPmKe/YVVaihjP2oddO9y+u/8V8bnG+5TeAUeQ7nGnVq33A
         CkJUUFEIbeBCKlkKOlGH9t+B9s/OH5IKV8tyqSJFXDOhEXatqEAig5mzEC3pCPptwiBH
         umv4nnwLC7tL6sgSrcJ2QBVOxac2EkpfSOJS3z3lBSKvl5aSogqXfSQPI07gTtrBhfu8
         +bfIxJd6U41JT/MqR4Hk06bn08w0c6oH+IeWrkYzEB+hEAzrYVIcObRMLB4PW93ZtSnI
         c7W+Af3HVUO89CmUBGr2c5DVP0hRaPY/iNNZAiYOxTUtvFIu+GqpludjTxIIgrYWxORq
         KoCw==
X-Forwarded-Encrypted: i=1; AHgh+RrNWCZusMF2FViRqVt+1e172fIezbn5q/Aji0EdpNXxRm1xol+gDwjo+it0RV626DskCUvhZY1YoRIh6bs=@vger.kernel.org
X-Gm-Message-State: AFuF++l4UOpow2b4EBtQa6sq+bekmr4wDfBXLv/qXfHPFnvB0Y5lH03d
	j06TNDSUqU+G91SYebm/Cc5o7KkAc4xBjHokIk4w5ULAZP50Gcn5aSzn
X-Gm-Gg: AR+sD13948tmPqEtN9bK3WAYrNxqR8/Ki79WwdZ+kwZeKo6vkO9ijck2ZDVCaof+kSn
	Ph5rC6RsvS0nwweuPcDUMmZWsmdWJ9MTM0VQKWxY4nD+NpE8ayEDZTTVjXjiXAlL2t99fBZfoKF
	JK6BNAOxaloyccNtHUqXPg3J8iiX1ElpwY+d7F64IGZJ8BpTkv+Q06cBk7poR8Qfk4a1bp5k5LG
	vqOBTS3DHty66tGuQ+6q3V6bP2IzZVBKRw0Jv52BBqd/cuEBRe2cYgfu9ZLy/TcVdWOVFJdmLPy
	Utt/xqdJJL6snjJxPfEE2mn6i7cwMOFXTWCdOf+e5kD1FSYw2S7XYidW3i/ZlwTk2pofgWBcZgZ
	8NGlv24bd357cN7C5bfNDJ7eLuGGLHxUPfptS3PnmUdVSw/V4ZuyK1rPS++Fhs6lgqJp22yjphw
	lPMirejssaZNa1WV1kjAa7E3CGM6yStPeXKJJfE95cPY/edDn2c8xnugMrhgeitM3ctuVU9Nq7e
	twx6H6om0/5+mdmetnXnBCcWoV+UPZO5XH5SXo5JD9ceTm9lHwkQUsbeg==
X-Received: by 2002:a05:6a20:7faa:b0:3cc:3d08:da2b with SMTP id adf61e73a8af0-3d2684a3f6emr9285413637.15.1787907615195;
        Fri, 28 Aug 2026 02:00:15 -0700 (PDT)
Received: from manush ([2406:7400:94:7a79:ddde:713d:7785:c4a3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0e0e67dsm3987107c88.15.2026.08.28.02.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:00:14 -0700 (PDT)
Message-ID: <6a914e1e.7d702ed2.1273e8.2a52@mx.google.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: cw00.choi@samsung.com, krzk@kernel.org, lee@kernel.org, pavel@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 dsankouski@gmail.com, sakari.ailus@linux.intel.com
Date: 28 Aug 2026 14:30:13 +0530
Subject: [PATCH v2] leds: max77705: use fwnode_for_each_child_node_scoped()
 in max77705_add_led()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Rework the subled loop in max77705_add_led() around=0D=0Afwnode_f=
or_each_child_node_scoped() instead of adding a manual=0D=0Afwnod=
e_handle_put(child) before the early return on a=0D=0Amax77705_pa=
rse_subled() failure, so the reference on the current=0D=0Achild =
fwnode is released automatically on every exit path from the=0D=0A=
loop. child is never used outside the loop, so the now-unused out=
er=0D=0Achild declaration is dropped along with it.=0D=0A=0D=0ASu=
ggested-by: Krzysztof Kozlowski <krzk@kernel.org>=0D=0AFixes: 3b6=
eaa3db567 ("leds: Use fwnode_for_each_child_node() instead")=0D=0A=
Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>=0D=0A-=
--=0D=0Av2: Rework around fwnode_for_each_child_node_scoped() ins=
tead of the=0D=0A    manual fwnode_handle_put(child) from v1, per=
 Krzysztof=0D=0A    Kozlowski's review.=0D=0A---=0D=0A drivers/le=
ds/leds-max77705.c | 3 +--=0D=0A 1 file changed, 1 insertion(+), =
2 deletions(-)=0D=0A=0D=0Adiff --git a/drivers/leds/leds-max77705=
.c b/drivers/leds/leds-max77705.c=0D=0Aindex 1e2054c..4fd803c 100=
644=0D=0A--- a/drivers/leds/leds-max77705.c=0D=0A+++ b/drivers/le=
ds/leds-max77705.c=0D=0A@@ -160,7 +160,6 @@ static int max77705_a=
dd_led(struct device *dev, struct regmap *regmap, struct fw=0D=0A=
 	struct max77705_led *led;=0D=0A 	struct led_classdev *cdev;=0D=0A=
 	struct mc_subled *info;=0D=0A-	struct fwnode_handle *child;=0D=0A=
 	struct led_init_data init_data =3D {};=0D=0A=0D=0A 	led =3D dev=
m_kzalloc(dev, sizeof(*led), GFP_KERNEL);=0D=0A@@ -191,7 +190,7 @=
@ static int max77705_add_led(struct device *dev, struct regmap *=
regmap, struct fw=0D=0A 		cdev->brightness_set_blocking =3D max77=
705_led_brightness_set_multi;=0D=0A 		cdev->blink_set =3D max7770=
5_rgb_blink;=0D=0A=0D=0A-		fwnode_for_each_child_node(np, child) =
{=0D=0A+		fwnode_for_each_child_node_scoped(np, child) {=0D=0A 		=
	ret =3D max77705_parse_subled(dev, child, &info[i]);=0D=0A 			if=
 (ret < 0)=0D=0A 				return ret;=0D=0A--=0D=0A2.46.2.windows.1

