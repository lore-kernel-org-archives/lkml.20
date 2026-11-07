Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011253;
	b=F0oKA1R+/eG+4IU/GKilztjP4tANNyF+Q0l7wVQtWCsXTQYbkdqZ3VW6lirMiL8/IGYv
	 uFxR5lb3IhcUrZyCA5ZYEGTm7ZoW4Cuo270jjM6DyeP7vJCF/hKvV5Yugq0LJS3EjX58S
	 zfGZPE0PlUFmNTQKh/J0oYch/HSoeYtHQ03W8X93ZxJ1ya1s57mpP5PAvpunnmMsS7lVY
	 mcIn3idr7ye/ztxBdVKCkAdbRwiB5O7g2REkDqSJqS56X8L9cdD4BOJuPoy6tty+7e226
	 QTvbhOiuqkRcUqCXCrtesOSyjGRoefb3jLTd23l4fDTHjDLdQlRVuwvzMGTGFLRpX2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011253;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=0jlL+SHvvTR0ZQdsQVmEfpaIkY9fB2XCMI2EZ7p6juM=;
	b=41PhYNZuD02rhXlEhXPxb/j7fubr0VdaoIHralGXNrMb48IC0bHDOY9xVFZdas1JrPCn
	 s1mQvXckDm/aV81TKNIOtsc4zVHAskilXay2a1GILdzPMPA98WG0rB6AsgXjVbxYG98GK
	 7yxC+n2vc7dbnAnMj90cqIcsPLSAT3NshIx4D7EH6bF4H1fuKtY5iP+mFnLv78VxkOnnq
	 fJKbJ+gzA5bVegCeWikRi61ppukUOn2s5oyCrLHN2q4d7Hx21dsm5//xbasM+fl0/hgSy
	 gVN6mWElN1C3v8g6te+CnszRLSWkA2knNsXNbt5gTsv9STy5KMr/zFXH1rFItN0J59w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EKvhCTRE;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NJwEoHvo;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F7A606A33C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F7A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EKvhCTRE;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NJwEoHvo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0jlL+SHvvTR0ZQdsQVmEfpaIkY9fB2XCMI2EZ7p6juM=;
	b=EKvhCTREG4fD3uRFFQmJCMXDOCblWEeZ0NZTOnBB/ISLRmNLiw46TZ8XVNHy/naU5l1pvH
	tE6+eIqX8GuefB69Wp7kjxu1fOq1HzJpJIswD0LbLZc0p43PYd5KHp8dLmdULonx+m7oOH
	IJLnHm1Cn6MpGo6DHSCW94ZH35pDY/A=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-ELjpEBlBPSK6ClX_U3pFmA-1; Fri, 06 Nov 2026 19:27:29 -0500
X-MC-Unique: ELjpEBlBPSK6ClX_U3pFmA-1
X-Mimecast-MFC-AGG-ID: ELjpEBlBPSK6ClX_U3pFmA_1794011249
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so319487785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011249; x=1794616049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jlL+SHvvTR0ZQdsQVmEfpaIkY9fB2XCMI2EZ7p6juM=;
        b=NJwEoHvo2etzU8ANX/62m4Z+uAij13YvCDq1858HFQS7jaXbtE7/bk0Cei6jJzg1ce
         b3TZLlJoFeC9/3xRfF1nLhP5P5+2+osqYpbSGEdyUVJJmak3sfdo/WDBlhpBFN5shyil
         jouKf1u5D8jO42wOoCknNYOi2ov7pzETEyj/vIq8ZEe1UCBMcherKGujmzL6IwMDkXpK
         ESF0YNLfwtoJ+FbhFN2p+hMb6jkulWHNLw14nqWfVedwZtGGw/kFYZVzP3Mqj4rR9DGE
         xiHfzPH/gHhjodyzQGXLC9mcVLbfKTd4hBh4OkrkJLGp2YLxxI6Gq6/+jQnbGbmsfqvZ
         EJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011249; x=1794616049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0jlL+SHvvTR0ZQdsQVmEfpaIkY9fB2XCMI2EZ7p6juM=;
        b=1ZTEYj5bTEg0m4pm9glnf3BK24XpIzeEEj5oY1OME3GEb99JCdC9Q32oHA8M1C0XPM
         X41/mRKcD3vxRUQzMT8NUgrxxWKzZktuXhIObwhLxQhMJJvev5dFZV4JJImJHArGLDh1
         0OGdtfLnW6MxMm9wK1TfcJb29GyqDJGft1yfbT6U+9BF2jR2xulQA8aThZ5pC7Cm/ota
         71AIVWx8mGFgWZ8IgKgj4R3HozIIDJbPqSSuIUIaO6iOcTIFwVenlZogMYHm+daAgeZW
         vUhiT1J3wSx7/YgjAKEbltF0kjY0r8je3n9FZ228JQPVYN5XkiW1hdQNTeboYKBHIZUu
         zmiw==
X-Forwarded-Encrypted: i=1; AKwUvBzrNNCoEZnZyCgzmyKe+ejj9hGL1V4bXJ5FtDJUZdxx+ln0Gdwv99XhPtQKZvKlrKH5u6DfK3ecMO3gaMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z88UHjMaFdi0kcEZHfb5+9VlAvHxk1FB0BYU0PAvQTtMeams6Sz
	L3Do1Ttr1LtCPcwDJ9JbzcpPHFRF9NVlep6dM/vBgjhyYdSrrDFzdOQoxV2j3JhDI2SSz5iRhPg
	1JlXgYm0x4vIEPlcEurIBNVz6QMcWBrbTxCOwvfpxp0AlsQMKuTnAl0W4EO4q7XWLFw==
X-Gm-Gg: AYBFou2XUMRKjrBUaCmaqv8Rg0S1zaXhmCDWvTPW83q28ToheqiaNQKWrlH3fSvKKCf
	OYeS+IjXOsKO4/aBGm8/cYyAudd0nY+lBluoET5RzzVmT7Y3W95DvDK8QDZQbQePLOk20hJwmk1
	j591ZYoNXvzWIhzk9mLIHFYxfD4Py4HhShaQD/RgsPP6YLGepifma77bBcIv6CXqIlJnAUmwhYO
	1we5R7kh0hSBIEQbpz6AeQtx3KQ77lCWTeEIrDkhHcd9fzUdNA9QOC9ZCTVwQUVSp3UjK50oFWz
	XRy6qZ/LyJgdpnfDgZQ/t6WyH0yjv8VUjt2I1jKV3mmeUz8LTSMeYky5pydTAQ0SM5SFwm9crFN
	MHzRTMcFSxVIWt3UXhI3XeBbxycOzo4IhiY6o93KqJexJLutE2TdBJwPOIgWYUaE9tMwTQFzWoT
	q0UZ8r5y7NfOwyTj3+
X-Received: by 2002:a05:620a:4405:b0:93e:7dfa:2f3f with SMTP id af79cd13be357-945f35bc739mr674554685a.62.1794011248902;
        Fri, 06 Nov 2026 16:27:28 -0800 (PST)
X-Received: by 2002:a05:620a:4405:b0:93e:7dfa:2f3f with SMTP id af79cd13be357-945f35bc739mr674551485a.62.1794011248389;
        Fri, 06 Nov 2026 16:27:28 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f5a97aa1sm254122985a.8.2026.11.06.16.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:27:27 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:27:13 -0500
Subject: [PATCH 2/2] pinctrl: intel: convert to subsys_platform_driver()
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
Message-Id: <20261106-pinctrl-subsys-v1-2-f17582f32aaf@redhat.com>
References: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com>
In-Reply-To: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com>
To: Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linusw@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=8036; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=UIZLTu2Z4bcde3pyez7vWV2eIO/OoXqje6HHBI1vuCc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFWRbz3ttKm6kelnH0oGvefF+6Y8MLbY7vicFr1t24
 Eq8vsjRjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYS95HhD8ezmJ1sVvKVfEcS
 nAIDVV+eCrmTy8q9kHODX9u1O0I6rIwMPVeqTq/L8pX7dPKp6ix1xYabH3YVR36YeUv9uFE265N
 zvAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/pinctrl/intel/pinctrl-broxton.c      | 12 +-----------
 drivers/pinctrl/intel/pinctrl-cedarfork.c    | 12 +-----------
 drivers/pinctrl/intel/pinctrl-cherryview.c   | 12 +-----------
 drivers/pinctrl/intel/pinctrl-denverton.c    | 12 +-----------
 drivers/pinctrl/intel/pinctrl-geminilake.c   | 12 +-----------
 drivers/pinctrl/intel/pinctrl-lynxpoint.c    | 12 +-----------
 drivers/pinctrl/intel/pinctrl-merrifield.c   | 12 +-----------
 drivers/pinctrl/intel/pinctrl-moorefield.c   | 12 +-----------
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 12 +-----------
 9 files changed, 9 insertions(+), 99 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-broxton.c b/drivers/pinctrl/intel/pinctrl-broxton.c
index 269b8e25db84..e79e3d6d954f 100644
--- a/drivers/pinctrl/intel/pinctrl-broxton.c
+++ b/drivers/pinctrl/intel/pinctrl-broxton.c
@@ -1010,17 +1010,7 @@ static struct platform_driver bxt_pinctrl_driver = {
 	.id_table = bxt_pinctrl_platform_ids,
 };
 
-static int __init bxt_pinctrl_init(void)
-{
-	return platform_driver_register(&bxt_pinctrl_driver);
-}
-subsys_initcall(bxt_pinctrl_init);
-
-static void __exit bxt_pinctrl_exit(void)
-{
-	platform_driver_unregister(&bxt_pinctrl_driver);
-}
-module_exit(bxt_pinctrl_exit);
+subsys_platform_driver(bxt_pinctrl_driver);
 
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Broxton SoC pinctrl/GPIO driver");
diff --git a/drivers/pinctrl/intel/pinctrl-cedarfork.c b/drivers/pinctrl/intel/pinctrl-cedarfork.c
index 02fd1cc4fd1b..9f0c3b7f746d 100644
--- a/drivers/pinctrl/intel/pinctrl-cedarfork.c
+++ b/drivers/pinctrl/intel/pinctrl-cedarfork.c
@@ -327,17 +327,7 @@ static struct platform_driver cdf_pinctrl_driver = {
 	},
 };
 
-static int __init cdf_pinctrl_init(void)
-{
-	return platform_driver_register(&cdf_pinctrl_driver);
-}
-subsys_initcall(cdf_pinctrl_init);
-
-static void __exit cdf_pinctrl_exit(void)
-{
-	platform_driver_unregister(&cdf_pinctrl_driver);
-}
-module_exit(cdf_pinctrl_exit);
+subsys_platform_driver(cdf_pinctrl_driver);
 
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Cedar Fork PCH pinctrl/GPIO driver");
diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index a33eca5eafc4..800d3e360ba4 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1769,17 +1769,7 @@ static struct platform_driver chv_pinctrl_driver = {
 	},
 };
 
-static int __init chv_pinctrl_init(void)
-{
-	return platform_driver_register(&chv_pinctrl_driver);
-}
-subsys_initcall(chv_pinctrl_init);
-
-static void __exit chv_pinctrl_exit(void)
-{
-	platform_driver_unregister(&chv_pinctrl_driver);
-}
-module_exit(chv_pinctrl_exit);
+subsys_platform_driver(chv_pinctrl_driver);
 
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Cherryview/Braswell pinctrl driver");
diff --git a/drivers/pinctrl/intel/pinctrl-denverton.c b/drivers/pinctrl/intel/pinctrl-denverton.c
index 47636a9719ed..015d0c405c22 100644
--- a/drivers/pinctrl/intel/pinctrl-denverton.c
+++ b/drivers/pinctrl/intel/pinctrl-denverton.c
@@ -264,17 +264,7 @@ static struct platform_driver dnv_pinctrl_driver = {
 	.id_table = dnv_pinctrl_platform_ids,
 };
 
-static int __init dnv_pinctrl_init(void)
-{
-	return platform_driver_register(&dnv_pinctrl_driver);
-}
-subsys_initcall(dnv_pinctrl_init);
-
-static void __exit dnv_pinctrl_exit(void)
-{
-	platform_driver_unregister(&dnv_pinctrl_driver);
-}
-module_exit(dnv_pinctrl_exit);
+subsys_platform_driver(dnv_pinctrl_driver);
 
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Denverton SoC pinctrl/GPIO driver");
diff --git a/drivers/pinctrl/intel/pinctrl-geminilake.c b/drivers/pinctrl/intel/pinctrl-geminilake.c
index 21d0d5051b04..256b39308a93 100644
--- a/drivers/pinctrl/intel/pinctrl-geminilake.c
+++ b/drivers/pinctrl/intel/pinctrl-geminilake.c
@@ -456,17 +456,7 @@ static struct platform_driver glk_pinctrl_driver = {
 	},
 };
 
-static int __init glk_pinctrl_init(void)
-{
-	return platform_driver_register(&glk_pinctrl_driver);
-}
-subsys_initcall(glk_pinctrl_init);
-
-static void __exit glk_pinctrl_exit(void)
-{
-	platform_driver_unregister(&glk_pinctrl_driver);
-}
-module_exit(glk_pinctrl_exit);
+subsys_platform_driver(glk_pinctrl_driver);
 
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Gemini Lake SoC pinctrl/GPIO driver");
diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 299ee4f22bdc..c6a1d36a0536 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -834,17 +834,7 @@ static struct platform_driver lp_gpio_driver = {
 	},
 };
 
-static int __init lp_gpio_init(void)
-{
-	return platform_driver_register(&lp_gpio_driver);
-}
-subsys_initcall(lp_gpio_init);
-
-static void __exit lp_gpio_exit(void)
-{
-	platform_driver_unregister(&lp_gpio_driver);
-}
-module_exit(lp_gpio_exit);
+subsys_platform_driver(lp_gpio_driver);
 
 MODULE_AUTHOR("Mathias Nyman (Intel)");
 MODULE_AUTHOR("Andy Shevchenko (Intel)");
diff --git a/drivers/pinctrl/intel/pinctrl-merrifield.c b/drivers/pinctrl/intel/pinctrl-merrifield.c
index 5cf54bc18f86..2227e8e78a9f 100644
--- a/drivers/pinctrl/intel/pinctrl-merrifield.c
+++ b/drivers/pinctrl/intel/pinctrl-merrifield.c
@@ -363,17 +363,7 @@ static struct platform_driver mrfld_pinctrl_driver = {
 	},
 };
 
-static int __init mrfld_pinctrl_init(void)
-{
-	return platform_driver_register(&mrfld_pinctrl_driver);
-}
-subsys_initcall(mrfld_pinctrl_init);
-
-static void __exit mrfld_pinctrl_exit(void)
-{
-	platform_driver_unregister(&mrfld_pinctrl_driver);
-}
-module_exit(mrfld_pinctrl_exit);
+subsys_platform_driver(mrfld_pinctrl_driver);
 
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Merrifield SoC pinctrl driver");
diff --git a/drivers/pinctrl/intel/pinctrl-moorefield.c b/drivers/pinctrl/intel/pinctrl-moorefield.c
index 59f46b0e2156..5fe034dd7a9e 100644
--- a/drivers/pinctrl/intel/pinctrl-moorefield.c
+++ b/drivers/pinctrl/intel/pinctrl-moorefield.c
@@ -324,17 +324,7 @@ static struct platform_driver mofld_pinctrl_driver = {
 	},
 };
 
-static int __init mofld_pinctrl_init(void)
-{
-	return platform_driver_register(&mofld_pinctrl_driver);
-}
-subsys_initcall(mofld_pinctrl_init);
-
-static void __exit mofld_pinctrl_exit(void)
-{
-	platform_driver_unregister(&mofld_pinctrl_driver);
-}
-module_exit(mofld_pinctrl_exit);
+subsys_platform_driver(mofld_pinctrl_driver);
 
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Moorefield SoC pinctrl driver");
diff --git a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
index 77ac32ab9577..ae3f1ad627a9 100644
--- a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
+++ b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
@@ -580,17 +580,7 @@ static struct platform_driver spt_pinctrl_driver = {
 	},
 };
 
-static int __init spt_pinctrl_init(void)
-{
-	return platform_driver_register(&spt_pinctrl_driver);
-}
-subsys_initcall(spt_pinctrl_init);
-
-static void __exit spt_pinctrl_exit(void)
-{
-	platform_driver_unregister(&spt_pinctrl_driver);
-}
-module_exit(spt_pinctrl_exit);
+subsys_platform_driver(spt_pinctrl_driver);
 
 MODULE_AUTHOR("Mathias Nyman <mathias.nyman@linux.intel.com>");
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");

-- 
2.56.0

