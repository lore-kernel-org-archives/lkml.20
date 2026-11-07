Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011609;
	b=Wa+aXh2Qs1mWxEhaR9V3AoSSSy42ovVjffb0PCEwys/X2QIIw1PB/Rtcwg9b787yEor1
	 4w5tOB4Mtat/Ok8AcMCc5I0RdgRXjoH0damC02KDmUhG/d07JVIvOr8lY/yjWt76NnIoN
	 +G+sVnq3+Gu7nbuLacpSRzUYYUmESlm04ttx/fbaLd5m1zSDUy0Cqdm+aWzbPqFm5XaAt
	 w7G2sRbM0wox0EBzwpQmvZy0ycCNfzidLAWw45AXap8r5Zcvlfse5H19efNbquXPHuwwW
	 CHjrvrhLF5q89MmnAI2NyYfG85me1eKkXQUGtCgNHWwZJ9TNshFGyWWHOUbwLU76UWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011609;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=WMUy4txGMl5roDNZhY9tu886qliNRol+/oxaNAbU7p0=;
	b=zxRyZW/P2j6ma6lXftytoLx7fC0DLAQP4ML3ur6kdOr1clGvEm4yAbzO50OtQ5FGeMb5
	 i2jZZYSq4xxhNeVw43DS/VrDwd32mOOMSBJx4Fg617/EZTYnMCNheyfug+QquQ/rc45G5
	 bgm2+MnTB0EjX7rFG6EOchBlR1Tc/AK6VwxhJp4P26rtbeWEK+ecW9cq5qWlSdcKOxH1Z
	 XE5xSNphVkT8hO6w0cfixXKh3xUHPErI/0+P8DHqYuS2uRDkEdmc71McKMhxuVOhPa7mX
	 zaCaz1sXK0tAnOLF9Wd74rE6v9WwuWiQAjDl3o4eH8E8mMZ8I1XIgOnj4MBNq+VhTgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GN0sAbdZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="QJ0wbAe/";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF624606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF624606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GN0sAbdZ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QJ0wbAe/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WMUy4txGMl5roDNZhY9tu886qliNRol+/oxaNAbU7p0=;
	b=GN0sAbdZIqC+bbQKS9wwujWeiiBWGUmhmG2GdeA+Mm7JS2231Z0LGnafs+Q3FxBfG/QDna
	z+ZDrs8kYzCFPj5kaDbSenjQly0idF+GUWSxbrSOS+EoMLrrjWneuGLuIb+Z+zMZoY+5o5
	59EntNS8MsR5Sz9Px6GEuziRzbM7ULc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-dgYF44CrMrmRJ_hVMLk-ew-1; Fri, 06 Nov 2026 19:33:26 -0500
X-MC-Unique: dgYF44CrMrmRJ_hVMLk-ew-1
X-Mimecast-MFC-AGG-ID: dgYF44CrMrmRJ_hVMLk-ew_1794011606
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-54b437451f7so22321151cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011606; x=1794616406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WMUy4txGMl5roDNZhY9tu886qliNRol+/oxaNAbU7p0=;
        b=QJ0wbAe/NRL4qlDgKOETw4Qgdp8vB2i/VcBXGN8wOAZPhq9q2yI8cp0GHo5iftT4KR
         UiwYopmboe4mgfM0fSQktUO/WNHMm7HkEaBK/ogqTs+7BzEplnQITEX9hvlyTxIb+aKe
         yUvAWKP2nLmiVsKVDUk2j6gPIhIe/QpAdsbD7Zs8WfNFSiTJ3OvrnC3TxfomACmM/XWJ
         N5fsBYVo40yBHtoEJCg8fHNe08B1/cqCHhhOV+bevDy0wj3uRqSkyjACSuI9W0UvyM1b
         1H3+brRmAivLhvGKe16BWZUOBSbSYTyXYn8bCo9c9ewVFNpzHaKCSVkjrPFAb6m280MJ
         jyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011606; x=1794616406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WMUy4txGMl5roDNZhY9tu886qliNRol+/oxaNAbU7p0=;
        b=qjreNRNT3urvJuB39h4+vMNBKXSUVJAvk51mAUDkOGeq+ZrfaStkNRJIZQ110b/8bd
         MB+bQVGzMZRlgMS15nT0wHqySddXjjlaxxldE30fRKz7d9eOJOXnGb53s4/Ii0LZbu/o
         C0UM/3SltGt9DIun9fPfFc/n6WH02DTqxQGLE4XE+8ulrXl2miKoDv3lxGX8C/iA8sG8
         excTBGDZaUucdYR6Nd6pEwkEPPOFlhNJaY0tOTdqITNUmQ9Fu03I8HQsXdbK/wyLXdvY
         Nqm07d+wCY+/oM6PV4N9xIRsyk/CxJjsrLMRfmi66A5Cfr6XdjNZnl7d6D6DqAdgGwxO
         yzGg==
X-Forwarded-Encrypted: i=1; AKwUvBzdIqBGpoI4xT7R1k1QXW9HxH3/kX3oldyzCgafJSWaxyJUaBP9a9FQ3NhdymwvyuaRX9Zi9RG2cfH5KJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z81de6kG2Uhs03tkoh9OJeLEhYxSA58j9npG8MMi2DrswPOFwVe
	i1BKqW33yu3G6Kc//7WUIEhaKIbtzxHmdk0EoLJs0J8yQIR5/YQCkW7QNsXNXeNV2WbrNKG4khx
	7iRYWK7u2nOr4Bj1nO9SDLt9KkLFCKVWQvKJlmx4imQqlCBRUTIF9Jaaen4yjkVqV2g==
X-Gm-Gg: AYBFou1Hv8qCrQaFqleoedq5qVrZ6SenXnPz8nIU5pHPBD38y/MRytoESwd6Woq02bR
	R98G7FSkPsbcZRE86HZSPTBHJ9lbwtu/jAOpCV0MqsnsquApulxGIaWKEOezI4uM5j1EksWhnrH
	GrTCqwHjplHEgT7YeM0uSIj9Neg+ccuW1ePjxFtcd8uODztVIp0RYRQ7gAuQPyO2DimpYesWEmH
	tp2SfrLS3N/nGfBLFaDXezeUsKc/OZrm2WQ2F1jZ/KeidWK9i2UUknTNutiRW6WHXKNMi7wv+SE
	NlvSol6P+wBRXug7QX8s5WU+xrjgHW/UO7Co1dFfbMrUWXPG3NvfB+6a+w7PuN58Emm9NWnw+M2
	kJZYkXx3fHU9bje+NHhNCrZQPM6qUMnHYcrldhj9wfbuVbst4mJpv5d+rlJkqTTvYtyEg9rjFyt
	WqIgpFi0hwajsbcTtv
X-Received: by 2002:ac8:5fc8:0:b0:535:a5fb:6459 with SMTP id d75a77b69052e-54e1576c1f7mr69286691cf.68.1794011606006;
        Fri, 06 Nov 2026 16:33:26 -0800 (PST)
X-Received: by 2002:ac8:5fc8:0:b0:535:a5fb:6459 with SMTP id d75a77b69052e-54e1576c1f7mr69286361cf.68.1794011605554;
        Fri, 06 Nov 2026 16:33:25 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c5d9sm32684126d6.10.2026.11.06.16.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:33:25 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:33:08 -0500
Subject: [PATCH 1/2] spi: omap-uwire: convert to subsys_platform_driver()
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
Message-Id: <20261106-spi-subsys-v1-1-a51a08f21cf2@redhat.com>
References: <20261106-spi-subsys-v1-0-a51a08f21cf2@redhat.com>
In-Reply-To: <20261106-spi-subsys-v1-0-a51a08f21cf2@redhat.com>
To: Mark Brown <broonie@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=971; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=VXOL6bEGlUlQU4NkQQRQnkjQZinD42MMCclT0CLWHzM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFZ5+bJG4e+VlhwvSB85WtURMW2viyDrty4/6P8+Sg
 9OmW64621HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBE2uoZGVoF5vxjPHejLvBj
 6qVNy633+z41zZrMz9QpXS+7XfUzuxcjw7JDNiYOkfEuyipcEwMdnnlcfRJWav7r8IdFnKsKXNi
 K2QE=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/spi/spi-omap-uwire.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/spi/spi-omap-uwire.c b/drivers/spi/spi-omap-uwire.c
index 83e263eb6069..91bd733ca15d 100644
--- a/drivers/spi/spi-omap-uwire.c
+++ b/drivers/spi/spi-omap-uwire.c
@@ -528,19 +528,7 @@ static struct platform_driver uwire_driver = {
 	// resume ... use ck
 };
 
-static int __init omap_uwire_init(void)
-{
-	return platform_driver_register(&uwire_driver);
-}
-
-static void __exit omap_uwire_exit(void)
-{
-	platform_driver_unregister(&uwire_driver);
-}
-
-subsys_initcall(omap_uwire_init);
-module_exit(omap_uwire_exit);
+subsys_platform_driver(uwire_driver);
 
 MODULE_DESCRIPTION("MicroWire interface driver for OMAP");
 MODULE_LICENSE("GPL");
-

-- 
2.56.0

