Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951A93EE1EE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792151202; cv=none; b=mwBTVgLt1zTZK0iBzQGoPyF4sqLDm5lI+vGuv84Nmn6/1uxWx0sZJH+VWUfjb83Y4JS5Mxugrm7Cc7XmDaw+BLpaRE8GMW8J79v+pqwAHPcWGn5OHCh833h1OwCExpj6dsvA9A40+mhi0rivBgtPkVmZ8Fd6qnMGOK2yV6CkglE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792151202; c=relaxed/simple;
	bh=iknpBKL/+fRfSik9M4DCRF1TBz+Dk3rWM0cM+WTvsR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4p4vlgn8K0ibNWxnteKiG3tJQSzBoI6YywUTnZIg7e4aR2vFG1fjMJI5TEW7fIE9KwvcdMoSQyejE2ZS2R4k7VcmCH9NezH6pPS+mvqqMBstlsKuBgSt2WHQ/l1mbCmVj6iavQ4A1wnsxpaLX1xXmWTPWTuTG8nxYHBWeKigKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETeRlj5b; arc=none smtp.client-ip=74.125.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETeRlj5b"
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-35dc2af1f2fso1748805eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792151200; x=1792756000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Guv4YIlbjPaNFX5mQLYcMXfkDV2Jd4+Ri+vbx4z4JM=;
        b=ETeRlj5b+KbHL0pHEvwelj4XhbN/d/n+J+Git68lirSkpemSUOKaxyM5nc15Qo4vqh
         tE+4XZCcxH00gqc20WGS4l37RZM/FAtZZsd5M6ifHPa0XcDAd/oNygB1KZi4smbk5n26
         9/L2Et+FFnnLfKhgt3+4BoOsLkpHpjJfP1SYiqpzR376JZ/ByaVS61N7LgVHaGBvSA+2
         tDgZA8zxRI+ju1dUfVUOAFosbaiy79cwH90Xtveg/QK/c27VIz307U5x7D5DGDWqQKRl
         4vir/2Q3js3ofQjq/HjX34mDThmDjGKPcjaT7Ym6aipxKfTLloTy6X82gIRXb/5pqL9w
         YbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792151200; x=1792756000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Guv4YIlbjPaNFX5mQLYcMXfkDV2Jd4+Ri+vbx4z4JM=;
        b=AgzDekLwPv2V6r+udC7DCxlduqE+TrWUtmWv3n3gHSasnP7scIy2hSOQhz9x33pU7i
         orBrn9Xr1wjjptUdWSY9lEP3hItfGKUo4Vv3B5Vu40CIZT2S0AR3fUff0RjTOc+bW+lW
         QqMVnufg65OvhMSIGCVR3/9XH3NjyhYYnOCm5oWmWhFa0Gq9KsdBjRlYw/pLJI6Hh2H3
         /VCZbJMRQq7aFyKjWYKdIZX868LeIFAIl+KlI94QkO/g0de6pQZ4Jr110b2Wsvcv+4g7
         vd4KWlC8DfiOCI8xWNrt3WVvSgwqyy9wjKXebhDOP+jP4rbOsHppszNT6dUgt4oY/yYs
         z/KA==
X-Forwarded-Encrypted: i=1; AKwUvByPdcnzg69MGop89hdfEo1/aD1OCxYwkdMdR/QBGnHJEj27ufEfN/9LL36PzAqKFSya2dvbkpzEfGw8lYE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvPbTi+4kmptdAMStQ37sqgM2b1kcFVB5fBxlweZKkI5ViY1+e
	SJnrilUMIGjFJI8buoAqz9U/GFP0EerB6fmc9HRp5QX3cOA8aIEoXMN7
X-Gm-Gg: AYBFou0spGS0ETnT79I3sWNLmIi40sneHg8mjUoCevneCfzvKr6EGYq0Qn1sQ3DF81s
	jB3Ja5222WbAZIqch4pWOTGJc5+cKq3XaXpBMunwohRDDJPpfeGN3obmPgqiCPX/cBEDeUn7+D6
	F4TxmZPCW4HaC/5l7DW78Hkwt84D2gJEBkuclQ+UDHaojLXYcNbjX/yq8xllUGM2Meo8pTIp6YE
	+qx6/mMqrvRF0z5bP6pl5/9Hj1NQ+/++HP6uTDobYT41SqFKNKdHEUok7BGDbzBtav7KrjyhTus
	WopNT4Gl/jUlzR8tfssdqD9+AjsVIm2lqDm9nbxqJM6VPkug+ECW/p+fTR0QEWUBIkYkQn4MplH
	iMcOoPWgTdGcDjNmgKavgAHYXx5fLSjO/SDSrro6av40la8s0p6yduBjBfWKT4+ZS28rXjjwPly
	BFJnBDtPziAqcNYvge1m57zPK6PeoiTDoXXd5nENQB534sC2nZF/wWuVOtnDsKEP5ej3+x
X-Received: by 2002:a05:7301:78c9:b0:34e:e7f4:cc78 with SMTP id 5a478bee46e88-3537de1cfd3mr28424762eec.5.1792151199537;
        Fri, 16 Oct 2026 04:46:39 -0700 (PDT)
Received: from fedora ([117.134.210.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b63e1sm7330259eec.8.2026.10.16.04.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:46:39 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: [PATCH 2/2] iio: accel: adis16209: Add OF device ID table
Date: Fri, 16 Oct 2026 16:45:27 +0500
Message-ID: <20261016114527.128364-3-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016114527.128364-1-shehryar.amd@gmail.com>
References: <20261016114527.128364-1-shehryar.amd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add of_device_id table for adis16209 and register it with
MODULE_DEVICE_TABLE() to enable device tree based matching.

Signed-off-by: Shehryar Ahmad <shehryar.amd@gmail.com>
---
 drivers/iio/accel/adis16209.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/accel/adis16209.c b/drivers/iio/accel/adis16209.c
index 07a682d68..2dd140dd5 100644
--- a/drivers/iio/accel/adis16209.c
+++ b/drivers/iio/accel/adis16209.c
@@ -298,6 +298,12 @@ static int adis16209_probe(struct spi_device *spi)
 	return devm_iio_device_register(&spi->dev, indio_dev);
 }
 
+static const struct of_device_id adis16209_of_match[] = {
+	{ .compatible  = "adi,adis16209" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, adis16209_of_match);
+
 static const struct spi_device_id adis16209_ids[] = {
 	{ .name = "adis16209" },
 	{ }
@@ -307,6 +313,7 @@ MODULE_DEVICE_TABLE(spi, adis16209_ids);
 static struct spi_driver adis16209_driver = {
 	.driver = {
 		.name = "adis16209",
+		.of_match_table = adis16209_of_match,
 	},
 	.probe = adis16209_probe,
 	.id_table = adis16209_ids,
-- 
2.56.0

