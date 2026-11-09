Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213883;
	b=n0l6MeZMKWoqkppowhwsEL5XWuoNTwZn7ZCa6Ufje4ALfZORqQ9PizQcvQySOCGadEwy
	 B63pw3DIK3BA9TA3XTrdxhLJnN1D61B44Vyi0m4B/8w1i+S8bYZo6XKw2BmGA1+tPOnVZ
	 zxcQ8JcZG3ljZSjxSqh61rLuzlWR/y6rqvNn5siPGw3EwxdsHcfImVEmMjQCYwY9tV1/P
	 ebVYnduPip8Oo/JEQnqXfwkoQMSUh2L4NxaVp/vWcoMMIpS3ucO78ayloSp0nvh4fL5Hg
	 cyEzA0CwixXgU62uBdvN5auL5IQ/78qis5kHbH5RJEQi8m/Jhnvm1HFUObx/YRxczZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cg2C9sgT2sD7yDisbnfHPJYeRJKqZMharkjHKRD6Qk0=;
	b=RooDoQQLB6BokIi1ZEjPz2/z/Pb+BnKrwqNiIGNJ5IOGmrkVl/+6N91VVRUkfg5mdXAQ
	 aoEzrobgZidiU08veHFXs0GOuaO1lL1sfqt1xiVgSP91MtZqNGDknfdBJPLPGSiGZuQW1
	 YFMihlGQMMAaknWRQae8rbT/yQpB8wqCUNIPLnvsdRgpClR1wGsybc11oj+09XHIXO3HT
	 gi38WPbZIy8i6sQ9/83nAnZaU2rMFLvFAtJNiVNN2deCVGART09xuv0elPSG+hzkxvptf
	 1htJTGRA34TABlxcWNog8QfvqgMzgkdfLWyvctABq3SQm9OT38G1O5poXEsx2U6fXJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kk0+41Ii;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A63606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A63606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kk0+41Ii
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b8ecfa886bso223892b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794213882; x=1794818682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cg2C9sgT2sD7yDisbnfHPJYeRJKqZMharkjHKRD6Qk0=;
        b=Kk0+41IiZ86WrtBrM2QWCnZtHtfihQTO7xbJBbL13BkGagpW//D2ACTv8mpEqVsMkK
         JwsNfWvvenG5VWdl2R0/sRetLSSb9nqfoMfIdwrX5zsGV1R1AgTo3VIz8B8rCvF/hevA
         kT25mQY3Z2sX2AMh0olrTtIrlEuKA39NdF85jfMtkjgiPYt3Ym7nlXuslrIxCTJhiyXs
         k10MdfywZ8tcE3kgKhZYbOD00L+N9hchSGxE2hIlVtX4Jx6kt/eWCs9TEU+1rX/EXzTc
         o7Sn8OeAK6bpcZJgvz2fOyNFyrvXeuEFEE5e1/z5cMT4HlEw+pAr+yKthVb+ljvy7IZZ
         YANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213882; x=1794818682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cg2C9sgT2sD7yDisbnfHPJYeRJKqZMharkjHKRD6Qk0=;
        b=Zh4GP6hAXPZsswj2UOxO2tozmd4jxs9XlCLMVm+gWZGBVZRUf1RP7m0xa2/v50SA1W
         27UkbL9hGh2W74zS1QYldX+GuUuIAuISuW82NfTKw0H1EVQH8uCc9gsSlQX2PamecpDD
         OKvd8MTumFX9JinnVbbglXg069Zwiiyn5soAMhWE7kbx0EZRnhJnDTC67xex/+YggE8g
         XS9dEnwowzM4C2whO11/Suib/Tan7mNmJALoH7mOkTvyhQkB+U3pcopxVdrod8/57itn
         jr1xc8Zm+It/SoOOQcZIYPsRLo2kJy9hvhwrSFeUpsSRpWG4n2DT2RhraRj1q6TF0Cs8
         0goQ==
X-Forwarded-Encrypted: i=1; AL+hErFLEhqQUk/SuOEPGohQQrkI2OeK+OvgBPCVd+P5VesEYV0Z63dF5zUUSmau6XE/sIhYWamFOU+rUfKeN3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/oPuBzXj/iEQIbLrN+1BXTDlWtFhuS1P+ei5S8uMlw3Xdei4r
	LFP+q3l6vLIobH8oB3bynBQHEWw0m8+uWQ1n2Alx0k/HOPcnupoSZIpx
X-Gm-Gg: AYBFou1fFY6+76uZHQ/CH6iVevWbicIXAyYdqYWGUoAIhhbZy5varPM5fDq83KDcpy3
	D1j+W7YQZvybT5m3tf36WsXMj7uEiqVhRSCz/5W/RZCkcSRLUaFMG4Pb0roGUOIXbGSvQDaGFEE
	c1HBwJizh3V+PX5FoDY8OpuiwU5mbHVJtdM2EuHY3vgSjkGpXPkC8U/OS4eORhiRQjoaXIteNmW
	ZAduFxCQfFJUK8K4OeHfI3JPsNlBzjR3ZJGEya+8fBNuSQAUV2AWe5Bg0mxvzFiGTLwqAkCY1pA
	B9hz+T+984+Ih3dZPhtURTs3nP07N2L6A5k9bBhm5ksPVbiZ5hElaHFQuVco2LZ4RRm0Wg5rxwd
	c3jlXHYXV78yscQexlyAqi9Qrj4AXyVTOAmfzDEJsD41f9RA3IK+htXCmiT6hJFB0541MyLfatu
	75pgqezBo977C1x2hkgmrpNR1tt3uCmh7DU+SCmn431qO/2oVcW1ZWCmBFoPBU9CUbfG+CKD14P
	0rVQwKgGh1oea0APp7hgCgS8Fyd8b5mtH2VWmv4JZ4D0odJNjCDVuOs+29EUzDCWBLVYIYqL7yS
	6izpBwOtnWdI9os1drvi7r6FcZE+JJcGowb/mkDLE2EleMOF7pIIVe+OT/H0DYAj7OfewiTpNhW
	XnC9pZJr7V8WSrNFgqpdaruCQv9ZEaY8n31t/65Hhl7Ks
X-Received: by 2002:a05:6a21:488b:b0:3e1:3734:63e0 with SMTP id adf61e73a8af0-3eed3a51361mr1937124637.41.1794213882243;
        Mon, 09 Nov 2026 00:44:42 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb96816fc6sm1413751a12.5.2026.11.09.00.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:44:39 -0800 (PST)
From: phucduc.bui@gmail.com
To: wbg@kernel.org,
	andriy.shevchenko@intel.com,
	David Lechner <david@lechnology.com>
Cc: andy@kernel.org,
	dlechner@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	m32285159@gmail.com,
	nuno.sa@analog.com,
	phucduc.bui@gmail.com,
	sozdayvek@gmail.com
Subject: [PATCH v4 2/2] counter: ti-eqep: Use devm_counter_add()
Date: Mon,  9 Nov 2026 15:43:42 +0700
Message-ID: <20261109084342.51865-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109084342.51865-1-phucduc.bui@gmail.com>
References: <20261109084342.51865-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Use devm_counter_add() instead of counter_add() to automatically
unregister the counter when the device is removed or probe fails.

This makes ti_eqep_remove() unnecessary, so remove it.

Suggested-by: William Breathitt Gray <wbg@kernel.org>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/counter/ti-eqep.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/counter/ti-eqep.c b/drivers/counter/ti-eqep.c
index 2326515d5585..1c26008846a0 100644
--- a/drivers/counter/ti-eqep.c
+++ b/drivers/counter/ti-eqep.c
@@ -564,20 +564,13 @@ static int ti_eqep_probe(struct platform_device *pdev)
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable clock\n");
 
-	err = counter_add(counter);
+	err = devm_counter_add(dev, counter);
 	if (err < 0)
 		return dev_err_probe(dev, err, "failed to add counter\n");
 
 	return 0;
 }
 
-static void ti_eqep_remove(struct platform_device *pdev)
-{
-	struct counter_device *counter = platform_get_drvdata(pdev);
-
-	counter_unregister(counter);
-}
-
 static const struct of_device_id ti_eqep_of_match[] = {
 	{ .compatible = "ti,am3352-eqep", },
 	{ .compatible = "ti,am62-eqep", },
@@ -587,7 +580,6 @@ MODULE_DEVICE_TABLE(of, ti_eqep_of_match);
 
 static struct platform_driver ti_eqep_driver = {
 	.probe = ti_eqep_probe,
-	.remove = ti_eqep_remove,
 	.driver = {
 		.name = "ti-eqep-cnt",
 		.of_match_table = ti_eqep_of_match,
-- 
2.43.0

