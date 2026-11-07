Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011611;
	b=3UTYbKA2b5GB80oVIoX/hudSEy+lQmIq14RIv3kVLidpcWBC/lvkwX6bhurTb3suW8QY
	 7v1x5uQNaHC47XkBXogM5wcJflekeb+514bGhg5kI/CguUABlhuFd5C9EjcedaplLri3O
	 gDImKYGGSqtNNRHxJ39NCs+uRbo9Cs53ybHXoN7Uep0IWzN3q9illwoYK83dIXScRNx3y
	 zDb0QUMH+IeXTRrZ/Q2hl4iu/btX+j+nJsd0ekYAL1V3sSYF97uwijpcecL79DKLF61Pr
	 VQvjqwCdD5bvmex6I2ZTBjd8pMtr35cUZKHDOpSnQHQQj+4HHeqyBcjidlHa5rqY6fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011611;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9EpZk2mArj9f3PAZHMhYhxIIajV8999GqCaFVZmGcaQ=;
	b=p/8iSELIcoIu31uRZUoOsNkExVBBEjh5dzzZi9McF9cXtIM+a85d+L65ZZrFEUCFPhn7
	 3tNO1aYcbX/41aLeI86XK2Kx1CRiZhc/yO9bqP76uzNW/oDKtjO5IqWVbaoQwOV+AJE51
	 l+lN9CFirfQ3aJrsYZLnPZpg7Abq96cP0wRG11zF6bP09OBPc3RNTIvB8iDn5gQBxPvMC
	 z3bmwoGRDGL7AhSbNyKx/JQiNw7nrU1MvQXqBPc64t1nk+y+x4vxGtxM0i3rCAEIqgHGw
	 Oc4xcuJBvnJF1538pKvY/LWktF8UDc2lOYxk9t68x7vuWydutohMgZ3gyq6sSsfRY/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jq84orGE;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B2pmfh6N;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A194606A335
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A194606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jq84orGE;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B2pmfh6N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9EpZk2mArj9f3PAZHMhYhxIIajV8999GqCaFVZmGcaQ=;
	b=Jq84orGEbv5gemYodNaS/Zkp8XdpfsiR3DASh0ID9xN6e32GiapCeUe7Exlx5zpmP4z1Lu
	qUByevFMA7FPHEBLZ8d4si6IiBXsoaIAdjX9xlOEup0ZQvjpH3h/L7WiQVKqMwGN4UulHx
	Q9GyBcpRqoo+SIauS1CfuaqirdTVM3U=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-it9qdWLQOniWrjB9Fe63OQ-1; Fri, 06 Nov 2026 19:33:28 -0500
X-MC-Unique: it9qdWLQOniWrjB9Fe63OQ-1
X-Mimecast-MFC-AGG-ID: it9qdWLQOniWrjB9Fe63OQ_1794011608
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-534f3fe0236so23922651cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011608; x=1794616408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EpZk2mArj9f3PAZHMhYhxIIajV8999GqCaFVZmGcaQ=;
        b=B2pmfh6Nw3i0zO1u9134xTRllY+NDiEN5Pc8210FZMXBA8+Ik/k1JbJy694rwpN5Dq
         BTeWtbS10MdwCRAb8vwLsUsClZwczsz8cwntgMmvo/7KsqNsCOK05SZoXm9EVwY1jgC+
         ti1XvjBFWS3ckYuzq7m6T07jMD+1cb2ahIV0PcEtbSQfib2bFPSkliDYRAR6LMuDlvCt
         fGldgvVZm37ih+pCV/9fRwb6iGDsyxM/aZHQTaDiCXzPBC7fjBnYKsro+sXvRonxPMRk
         Qn2zV8q8Ji5JpeWyPdvqR9xorzClj3/SGR840xLDJua9eZClz5iC4npL1zFaSGlcPqn1
         Ax5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011608; x=1794616408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9EpZk2mArj9f3PAZHMhYhxIIajV8999GqCaFVZmGcaQ=;
        b=1ZP6XCKwDBy3CQXlpH5s2LMzkMhG5XIrxryiqT4ECXbLmuYqhJicktUE+o04Lf3yVJ
         Eyfme1e5w3MD6WWgBZf3kyrZ0S6/g1h62rUPsLDYWQvcuipZ/BIgxlSfFwK7VB8eKg1i
         QfqHVDOS/DNJqlzCUqjKnZtd8OeCiSVWhQT+gc+we9Zy8FKTrwz8zxpI9uVWAUFRRjlu
         CYKJ7TPvo920//G8qglPCct9Z08ndOxmrIh0rGmLrPv+F3HyI5x6/mtBCmgbLABXdiL2
         kaeAJI92L5e+m4zLxbWZ/M/045HWviQfHSzYVOQGg+89Iu3WbJDg2h212zq/OE+GkMCn
         Z6tg==
X-Forwarded-Encrypted: i=1; AKwUvBwjvT05vh4jeqbaFlip1xb3ahhGZXXPP7qlUZT2rRskdP+Egw3XyrqCApXWJ6tzduAAXHZOafr0NavVjUM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K+3uP9LoF05Uv4P0PlETVXn03ieychT/rRXgPhHQ1GD9H484c
	b0U4bkRjAewe18y2VrQtZKJRubIwp1b9S1Pl9gjqHuYEJlbs8sRthAM0Vs5GXCuJYtjZpdEWgIz
	qvppsem3WLR6qUANLmcokakR2iMMuz6+fQbNalvbRpcuTKZFw455hFIhH9USItfvaYg==
X-Gm-Gg: AYBFou3ILPZaqdp9bfuiXrgTUTj607LSkWu8WdyADtU6iQCGyJ/21V+rhJYn11Ani1S
	gZIOoBttVRdDU3DNlg5dXZyWINVTwYGVGt2gGIysfa86RjbFY3V5HJx1SddL9PYumPWJnTA3bNk
	4EM9RdWc4cLCQ1xdmaHngISPmlqKS40HTDR5N16yPl2saOLi0gm9KRplWEVVc5WxRh9jAP8vqlD
	+dJRcOv5uI95epq7hEYK8NZZtF0tVxfNs4FcoUWnCjFi8kAsma1BoZikHyfQn5Gr1vBLyPIwl9T
	3/9nv3Q9XRmnRcfvFm9rjMROzR9V//AgrsHVEjtGzkA/7w/7rdqyhGBx8LdDLhyRAml1enh7Ozf
	/T5/+0V8q1ZJJLnSiEF0geHL93lWU8TDnw67/CgWswYjYPUjeA4MAKVksOCdFRMpdxnZBECzwKg
	FjjxDlwt51tiLx5K7s
X-Received: by 2002:a05:622a:4c1a:b0:536:64c9:b1b0 with SMTP id d75a77b69052e-54e1496d927mr73578411cf.36.1794011607843;
        Fri, 06 Nov 2026 16:33:27 -0800 (PST)
X-Received: by 2002:a05:622a:4c1a:b0:536:64c9:b1b0 with SMTP id d75a77b69052e-54e1496d927mr73578081cf.36.1794011607417;
        Fri, 06 Nov 2026 16:33:27 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c5d9sm32684126d6.10.2026.11.06.16.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:33:26 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:33:09 -0500
Subject: [PATCH 2/2] spi: pxa2xx: convert to subsys_platform_driver()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-spi-subsys-v1-2-a51a08f21cf2@redhat.com>
References: <20261106-spi-subsys-v1-0-a51a08f21cf2@redhat.com>
In-Reply-To: <20261106-spi-subsys-v1-0-a51a08f21cf2@redhat.com>
To: Mark Brown <broonie@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1444; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=g2ewlZkjpkqGNUKfIKVBhFWyd1ww0rgtdqdUZikqli0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFZ79Gnr8VqxV2xXlxut6DlN2X/yyUWh96xJGle9LF
 nbPUbA51VHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBErngyMjzPmXZdcsHZs9/2
 3jzqOjmn+MO0M+ZTSl48PrLIZ6eQvqIdI8OJf/9t3lUfZ6iJl3m6zNZU8EJo/PFFj1fs3Xz9N4d
 mXiYHAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Note that this needs to rename the driver variable to pxa2xx_spi_driver
to avoid a compilation error with the macro.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/spi/spi-pxa2xx-platform.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx-platform.c b/drivers/spi/spi-pxa2xx-platform.c
index 849a14cd0343..2151ed168e57 100644
--- a/drivers/spi/spi-pxa2xx-platform.c
+++ b/drivers/spi/spi-pxa2xx-platform.c
@@ -198,7 +198,7 @@ static const struct of_device_id pxa2xx_spi_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, pxa2xx_spi_of_match);
 
-static struct platform_driver driver = {
+static struct platform_driver pxa2xx_spi_driver = {
 	.driver = {
 		.name	= "pxa2xx-spi",
 		.pm	= pm_ptr(&pxa2xx_spi_pm_ops),
@@ -209,17 +209,7 @@ static struct platform_driver driver = {
 	.remove = pxa2xx_spi_platform_remove,
 };
 
-static int __init pxa2xx_spi_init(void)
-{
-	return platform_driver_register(&driver);
-}
-subsys_initcall(pxa2xx_spi_init);
-
-static void __exit pxa2xx_spi_exit(void)
-{
-	platform_driver_unregister(&driver);
-}
-module_exit(pxa2xx_spi_exit);
+subsys_platform_driver(pxa2xx_spi_driver);
 
 MODULE_AUTHOR("Stephen Street");
 MODULE_DESCRIPTION("PXA2xx SSP SPI Controller platform driver");

-- 
2.56.0

