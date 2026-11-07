Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011733;
	b=B0C8zxRNOFAHx9JS5Xs+uiKP8UDX7CcFCAJZ8soW+bGfwtyrLlrck4mCL495LVoWhG7z
	 GXyRhVkYKpl4gWr+npTkYIqeGMoIp5WOjlMOQOp0GyibnsEsz33WM9+ToOKX3JhX/Mw9j
	 Sc/RyC4Vjqeh8IT8pPyNiqEYs/kOmOo4GDv14tySXSRZtMmOKSWR4sczd0K0E26IsKNye
	 9ufcjkys3QPAQeV/AgrZXRhIT+Bjh94vzMVwn51KgZVGAwbbrNfKJP54SQHeax8jHu4eH
	 LY20SMuS/9w2LthoFXNQmod+vOY54a24yEyYI10vOqmiW7s78WIzlXUip6IkWtbKAng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011733;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=kx6Qy17jNmFrrPmA3ib6BBgJVPCpfYNFi+oQKnBEyHc=;
	b=w4Ty1iwkmIXJttCJOqJ1P1D2C26mjkbb/8BkYKwBtEHWUCZWp6NsqlDmLBSN96uXFp6O
	 UdOfXiWv9F1nZ7RvdPk9fI3GR/O7BxUpnYlQM880uekvLYnI0Iijt+bbv/JrPQ9gbDAsx
	 2q5cm9oWl+nugOGQGpMu+8X85pTGfu4R3WCbQMEyvVe+2ca23Nu582Jk0tV57twqHT8mU
	 4qA0wubSzHHcFpLQnjd4D35B5Qe5dRKVPkciDpmNMOyBaR4MCGuXETXLc2ygnd7j+EDNp
	 X4pi7VFP3A4uKJ9x4GaoCBgf7ey98ElD1WsyxZ2SHPgBqJWRlYDbUViDhHbDpTxAzyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G+Uy2mdv;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rrXvGKXG;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED2E606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AED2E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G+Uy2mdv;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rrXvGKXG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kx6Qy17jNmFrrPmA3ib6BBgJVPCpfYNFi+oQKnBEyHc=;
	b=G+Uy2mdvzPcBhLWIvtjjfvx2mggLhDXABc45zvm/Cj43w94GWMxi0R4/dPvaDZZfB9nvbM
	UZmQJRNIdc+y5zC9wNj6jcm+u/DLROkiQglCVGxYiTSyYYpnw3GVdBayhdn25t8RBdlhBy
	iP6prr4ocz3zevGdGUYo6yQl2r6hF0A=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-0qAdADBgOUC-GU7my9Pp0Q-1; Fri, 06 Nov 2026 19:35:30 -0500
X-MC-Unique: 0qAdADBgOUC-GU7my9Pp0Q-1
X-Mimecast-MFC-AGG-ID: 0qAdADBgOUC-GU7my9Pp0Q_1794011730
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91e9a0eae11so24413456d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011730; x=1794616530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kx6Qy17jNmFrrPmA3ib6BBgJVPCpfYNFi+oQKnBEyHc=;
        b=rrXvGKXG/49UCai+fCKNtn8xp6wUnLSUOH+IE7qZ+pvB42mZzk1iwN4OqbWH/Y7w+z
         DzY4HvHGE4YUtb7WbOZJB2H80nEMhYbPnN73iGPqRoNpfSJvzz48RExk0qYKXSMeDbsX
         yLfEyJSEyO93BWoqqpU+J2Qan2hyTUeTa0mJPdh8wgSn/fI+Fap29jde+1gIPyxPftaK
         l/CkRY+F6YPMRApKZj6Dhfow//GM1jf/S3jpltuHX+4E6xSrgIQel+EERIBVbmtXulVD
         LTPoV8Sq+ueheTFEkGWnIDCHTf14OrQY/dZzjaFC1DwhYN9KV/FBVOd+Ug/8L1PF+Pwe
         sp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011730; x=1794616530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kx6Qy17jNmFrrPmA3ib6BBgJVPCpfYNFi+oQKnBEyHc=;
        b=ztwbyylQI5OUS/8zb/QF2Y5kD2rjind+VCFCSkHg01ndih5+kqR5CKB49S8hULS+K+
         JJ7+IqbHGoYjwLy+42LmHJFeHONKPdkI1t0rlwVcc27AvDNlpEPC/tVbxr+7iWkANXIr
         vhnSn8r4jiEXSFz4ZXjCztF2E48SWnR3sQqQq7nHmOQ3oXRE3DrWuicjAY4f0mBBXsZ0
         tG28pXVv0X7GhfFetGLmLOAsY12hkeDAv2q+6sgO49SvE4ph4llejIRC22jlHUWVF+6X
         nDy6B/p6rI+NgdtFK2ZI1koSOrAXtpMydbBBAoCoSj61W4hs+/m7Kzx0Weac6WuKtL1k
         ngHA==
X-Forwarded-Encrypted: i=1; AKwUvBwgtDYRswuoeCt55RGKgPG+9ORPUzDaR+bNf7/cmPyyu2MtmgmRAx5/IDrqlDydtEYpzlvR00yZorPZvgw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l+zwKwkI491e8JYAvVBDsI39JvywRcNPYl5JoXnjsgF5L/k9o
	Qez8FF1Xcx3ZAEcY9UlgFjs0nMtvLdCXWhkEjbEzNJuu3EZZfxTunqBVtCI6uZX2wnLPl9Y0PJR
	s60z1B3qD7Sftvp5dlN3YNPHfbFH36lK61M3ie5BE3nwwtZmkIsLd4AsB8DfVgAfVZw==
X-Gm-Gg: AYBFou0b7MGXHqjHnvZNu3kQ/SNK9CGCflQW2UQTDr5QQOCw9yBO03MzKpKd10ZK3PS
	UEfaFCck1WkiDf5qmLE3KqDxUkBciWw2LzDS6PP9UqvGAjF+5APcv09+anYuawUsCDtm1xMkuww
	Sn96ift+jbp2MFfWxHaI76QC/8nnjpAttGt3jjPiKglInQ0CSjpxyrM6mB0M+BOjh0xgR3h45yW
	CmFMq2sVyorRoMu5hHyCJIHQaMFoSOhDVU3mfcOOUlgXNeEDXEBTOEkkdUZauBCQCL9hS3OSe+h
	IgomzPRRDsMuM7OHZlF+BFKCSbzsM3E/5tNCptIG+tnapU5jrvBLoruo+VKTLt4Enb98f9Ea3jd
	T4ZGJIy6Oiyx109zSBL/KQK1bnSchkZPoYVPbpgqCzXks0RNFYuH14rTh/x2dOGJOV81NXYkibx
	KndasoFJFIWBbPmnsT
X-Received: by 2002:a05:6214:858a:20b0:91e:a545:691b with SMTP id 6a1803df08f44-91eb4fd0da5mr31808166d6.56.1794011729695;
        Fri, 06 Nov 2026 16:35:29 -0800 (PST)
X-Received: by 2002:a05:6214:858a:20b0:91e:a545:691b with SMTP id 6a1803df08f44-91eb4fd0da5mr31807906d6.56.1794011729128;
        Fri, 06 Nov 2026 16:35:29 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c5c3sm32967686d6.12.2026.11.06.16.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:35:27 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:35:12 -0500
Subject: [PATCH 1/3] usb: phy: generic: convert to subsys_platform_driver()
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
Message-Id: <20261106-usb-subsys-v1-1-3a86369c3f86@redhat.com>
References: <20261106-usb-subsys-v1-0-3a86369c3f86@redhat.com>
In-Reply-To: <20261106-usb-subsys-v1-0-3a86369c3f86@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=np8X2zRV/eA+1OsMIBwj13sqlob9MRButNYve81CUuQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFbmt1Xx6eFVx/iSmxNagNcuX+jDxXd7ymadQefYyT
 +8NaqfiOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhIQCDDP9PqdavUY4VzPHdv
 VVLZmKJxImThhfcfj7N2abrJy9x6yMnIsKdYbOuM2jniu66qxNb9bf1dsd347kvuKZruWTNXNjM
 v4wUA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/usb/phy/phy-generic.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index a41671eda2a1..68deb7e52b43 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -329,17 +329,7 @@ static struct platform_driver usb_phy_generic_driver = {
 	},
 };
 
-static int __init usb_phy_generic_init(void)
-{
-	return platform_driver_register(&usb_phy_generic_driver);
-}
-subsys_initcall(usb_phy_generic_init);
-
-static void __exit usb_phy_generic_exit(void)
-{
-	platform_driver_unregister(&usb_phy_generic_driver);
-}
-module_exit(usb_phy_generic_exit);
+subsys_platform_driver(usb_phy_generic_driver);
 
 MODULE_ALIAS("platform:usb_phy_generic");
 MODULE_AUTHOR("Texas Instruments Inc");

-- 
2.56.0

