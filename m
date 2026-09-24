Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283A244C4E3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249031; cv=none; b=XAxvhbrPdqWmVGDOPb5bp0fXOY7+JydaIS5ddZL+Xnd1AeQskKDg8XaFbASezgXIKQyIf0mHRS53wLph8QYJqaBmAoKrN7qf64dRxuEgzIwLkUH7n7cWU9R30dsTy8amngNyDasJ9f1qES+jkIT3ajRndZsS4EMp5R3rhsuWj5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249031; c=relaxed/simple;
	bh=O8kXc/a5cvIVXv5GHjV43+HIoDn4Fmq8JkV2l4Enp4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JWT07uif94/akCtmfw/dfzNGzbwIUzKWeYO/cd4bNHY6COyEu5bDZp9ZevUPRQvCBdipV5HhAH3qAzbfT7jXQA0NCQ1TxIjilhuwW6/ovLrw+NDX3sJgLEvN7K7TNCUB0RdgDTM/WhL95I7Osh/WXxZv1/v/FfYqTLDRmVJkXps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcNnsTwQ; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcNnsTwQ"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df8818fe1eso632845ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790249029; x=1790853829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCxRdNlieCfNGhjYZk26pUpqaG4f6xkrRSGT2nKsEsw=;
        b=hcNnsTwQeQz0+aGKv5uvuPXHeXURFxVglSAQZ2tmE3h24W46+n8BwtrSZhPaFquxuF
         jQeDA4NyIGNWlWzM/7xGCFj9lSyFKet7+wxo79KvdPSbnO/n39zB/seiwBA1AfkjMihZ
         zVfriItQ4GwNTa+xgM8+g/kPR/tO47I/5zkQlH8LN5oLtXdWV3gEjfzOZFF6FcAkSDS+
         R5bz/e1ihVIbSY5MGDfYUQ7PvSboAoXACx8+sIfdMOvUj/UAQLv/8BjpNotMFzC4WNTp
         IzlA+e2ifj4UPsSxtQwI2iGtm1VxHLxuiLSweseOmeOmtZ9DfL4Hz1eyfyWawo7t7QUs
         kT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249029; x=1790853829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JCxRdNlieCfNGhjYZk26pUpqaG4f6xkrRSGT2nKsEsw=;
        b=2Hy/KxMOC6Brgzc2HPvmNlSD8BiQjtonYAwWeqBZli6GEM9u1Uhq/+1QBRy+G6C5+H
         VdlcQF85fZ80fxOX7DB9oXIOMiokSdi/ijxL0riwaZHBpqh/ptTeKhv/BZA0z03RQFJJ
         UotURJvd5xUUWG3iv+OkjgrHoGDWn7rKRIZ4XZhaHwg77t73AhVv3zppSNYMev0DHK0+
         ck6+JEF7uj3ud5SexAe5ESMS2gt2tWwI9Np88JmMvqiupzrYzildIPaCospPs18ulkSA
         pXxo7ALBMHLxkDHaGwbopFbHQVPsOER3/3Uu3Mbs+0LQ9BTwO18Z0994bzBaDd7QH7+F
         uZpw==
X-Forwarded-Encrypted: i=1; AKwUvBwLq9ZML8a9en+6rbOnG8LOesLB670MDI2LuDgoK+GECN4IDqgfA+8y7p90JJJo8590c0oZwa55b668RS4=@vger.kernel.org
X-Gm-Message-State: AFuF++k/es2+Hb3sq1YetjPYxT+RR/9Qv8jJktETbItZ5D5CUsN3mYyY
	tEZFj2dYJy6upfG6yG/uuiIrFWBVu5cpplRHXcyKz+c0bCGnwNdF0Z6d
X-Gm-Gg: AYBFou0AAO3mlBZCIfR8FMHA+Z1vd1ABiw5nerrBOLp8hR34eJdXAUMTY1bmI1n/9l/
	HPmv/F8osA/eL108f/2XsgIa/8F+JDe5Cj4qJLlITJ4VKL0EQXtMrtwzrX7FRpY3WVKsVf2MNSu
	SWlcA/+2oviM9XM85ILeoTmUQFc/PlXBiLEfglXSDSRbRmTTFl5OIpsXCgC+hfHFwuDNPhxgeG4
	HOWtKy5ZbrcxIg863xpbwBi7CTf6SfPDCDrITCdKSNofJ0lHdbJOW787LJ47cECM2Y6KgfUEkEk
	KCF9QcQJ571OyAVjXbQ6mK4gHy7lxyFccCNqSe9VDZmjXWX0qsnQ40kxWEPokE4p7NIRG2ZpUjS
	68brV+kxf7BO+9CERiXHSOQzRBKOmcX4k9IvxDgMcWkbea0G+9ZMfWyFoDGc1YNIj20uyYGA+NL
	hWWfdcRiYNdYjv5aXIQCxCFbF/QY62PX/s8tl8caUOcwxaeAwqJnulLtk=
X-Received: by 2002:a17:90b:38cc:b0:3a0:9564:2d3c with SMTP id 98e67ed59e1d1-3a09860e008mr1308139a91.8.1790249024756;
        Thu, 24 Sep 2026 04:23:44 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0813318c1sm3586800a91.4.2026.09.24.04.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:23:44 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: broonie@kernel.org,
	heiko@sntech.de,
	william.zhang@broadcom.com,
	kursad.oney@broadcom.com,
	jonas.gorski@gmail.com
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	jon.lin@rock-chips.com,
	bcm-kernel-feedback-list@broadcom.com,
	noltari@gmail.com,
	lgs201920130244@gmail.com
Subject: [PATCH 1/3] spi: fsl: unmap immr_spi_cs on remove
Date: Thu, 24 Sep 2026 19:23:27 +0800
Message-ID: <20260924112329.1566051-2-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924112329.1566051-1-lgs201920130244@gmail.com>
References: <20260924112329.1566051-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_fsl_spi_remove() does not unmap pinfo->immr_spi_cs after a
successful probe when CONFIG_FSL_SOC is enabled and fsl,spisel_boot
causes of_fsl_spi_probe() to map it with ioremap(). The probe error
path already performs the matching iounmap().

Retrieve pinfo from the platform data and call iounmap() when
pinfo->immr_spi_cs is present, pairing normal removal with the mapping
established by of_fsl_spi_probe().

Fixes: 0f0581b24bd0 ("spi: fsl: Convert to use CS GPIO descriptors")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/spi/spi-fsl-spi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/spi/spi-fsl-spi.c b/drivers/spi/spi-fsl-spi.c
index e45816ef7b65..665902703973 100644
--- a/drivers/spi/spi-fsl-spi.c
+++ b/drivers/spi/spi-fsl-spi.c
@@ -702,10 +702,18 @@ static void of_fsl_spi_remove(struct platform_device *ofdev)
 {
 	struct spi_controller *host = platform_get_drvdata(ofdev);
 	struct mpc8xxx_spi *mpc8xxx_spi = spi_controller_get_devdata(host);
+#if IS_ENABLED(CONFIG_FSL_SOC)
+	struct fsl_spi_platform_data *pdata = dev_get_platdata(&ofdev->dev);
+	struct mpc8xxx_spi_probe_info *pinfo = to_of_pinfo(pdata);
+#endif
 
 	spi_unregister_controller(host);
 
 	fsl_spi_cpm_free(mpc8xxx_spi);
+#if IS_ENABLED(CONFIG_FSL_SOC)
+	if (pinfo->immr_spi_cs)
+		iounmap(pinfo->immr_spi_cs);
+#endif
 }
 
 static struct platform_driver of_fsl_spi_driver = {
-- 
2.43.0

