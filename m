Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010010;
	b=Jo/CzIaRFrIe5vzMnrekLTtB3Lui/9rFytTJyg60slPdjCb8au7Tn+zGRJV+QSOlvCG6
	 UkWxlX7LVttjbigduo5B8Pu4wnNKvJY6qaEizAz6o8QAyX1Bhq6xCTge4ZwwEfZJFn9um
	 VBzYM4fwQz2TFW9hUTszUglfG8E7Zn8CSJxVkTQf21CgGOag/Vv6qAKF6a7Z4Z5BR/9x4
	 srjb5fVPh7wxSlK/tfEloHIqQxVNyjjgj7JqIYxbOTcC4nMtMAxQPIkv0DBN1foxb7hoO
	 MVVW0G4Wo/eObCOqDLJMR3pVVF7x0FxI17U2+akeHHwf3L9F4W33k8V1HlAWmxwlj0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010010;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=;
	b=1mzj3g9MQnyOzI6T3yzeYWoUCVg4uKarlI75ABYDHfH9jCavLLUtTHkLBZUjg7ZzBSNv
	 i9wWxVjjDmQHFvWzWs9nocWc/j9SMJi9uuAbY4DXyS5XwBYwx/2VU8UT+l+4bixyMDw8M
	 gDEaJqsKZydbK93klFCrfkerIQwPVat8AEdjTEHQs2needb6N2FlzrazVSTLrJKlWr3+w
	 dnY3Q1k1jB1Fz0NCT1PBzq2O38icMAgXRL0SRWV7NAMk7LJn2IHcAJ/8TWYh00YeUEs+U
	 gat77M2hqAgK9ZmBGcF4f0kPIp6G+6lbLgLjYouphf+pyffeFxEUzsAu3oHxGKvcseg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jb8hBDAm;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OlNn1TSB;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF251606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF251606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jb8hBDAm;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OlNn1TSB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=;
	b=Jb8hBDAm0JHwIBcBnEGlrMskZWWKmo3T1uWoWwLPtamxQnUjgLaqjJ0ghTUuxc7gsa8MMH
	iVkA80ZQJ9NbPAtUI2BxGHXs4CetkfrCBKt4AxYhEbjJwG0mOrRw0Ok4s0Xx8GB5s4nT//
	rGZy12dhZ6eWXSZD7sQiaYIdUBWinDQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-0uEpFFxPPf2Q71ol-ZsQDw-1; Fri, 06 Nov 2026 19:06:48 -0500
X-MC-Unique: 0uEpFFxPPf2Q71ol-ZsQDw-1
X-Mimecast-MFC-AGG-ID: 0uEpFFxPPf2Q71ol-ZsQDw_1794010007
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53661e036a2so23583531cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010007; x=1794614807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=;
        b=OlNn1TSBp+Q644ps2PD/kg+ZZ1m5BixFajPnQ1ISTrpZNxU6GlpiChrFxEKztSscjx
         H2y4/xkRwJpMVitjkOOgIEFqxqwUWyPzWkaf+E8hVX5N8aEOADvUOk3v1kEknjZ3Fj+r
         nB/4MyBJxc3vEE9VwDFnCtW+NC54hvmzjW+M+hxk+9FYuXZfEp2A+yGU8/ZIWMsk6XSl
         NNwjUjqTY5HyILNctO6raOqBzRvPP8iP2dsTAvSoYcR3VKhK5QEHbdZ1IGHOg85NBNhj
         k+wqqIGbecZkIz5yO3itv5zl1pBJne+aZqGoWmGWIZIWEZl0GZehhjEDdRecTnL05ndU
         mXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010007; x=1794614807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=;
        b=NEZ9PZ6hGLYgXhvo2pzY2zVGK6h46B7Nb4iyLKbSC7msSfnND9F4o1ntbzTxT6c2yL
         n333ZPAAmIx6UCv0/NsT+3i3bjHpDZ3fai+aOLCWBkRwP2pFCqUBMFOgIhMAq/KjF4J+
         NaZgx1WZDVrqtM1XGIwaDTkAulzFpGNLxMuHMfKIWWT0hCCNyC0HOyciwXLBZG3hKSQD
         CnmtQVbMqlvAYaB0uKwdH2p83FdTcSCMCjjt09/qltjLaPQhnieOwHqx7mOHlHspSas3
         chcmezZ+SNbIpA0oxSw8EWdoFqXC1GzEnx4YqRatb0tH69SCVuZLkJtdQtnpQ5kEnO72
         MQ2Q==
X-Forwarded-Encrypted: i=1; AKwUvByKxe8s3v+f9ajxc+wkdzjcjTpmpGqwKqq5VrRGSkecEYOMbRTVByqzhONt9D3OFW3ieVGsjDw9k4R78vI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tQjG3FVc/UdrRRXpmw4ylPXy76LnzNWpGO+T48oCzXGvk07hl
	PISzRZAPoHMK57tJ/7uPIizch7mR25LIFL1F/bbdVh/zTBY8jlC4k57jQ/IOpiJIAB/lMW4ixD0
	hB9ptlNDX2w4w+tZgNEyZrPQgt+fICquvbEbzuspvRivW7tk0/Hn2NlsdAMWnLU8WNiu7Hx2x9g
	==
X-Gm-Gg: AYBFou2vlkH1jZ5dJBRHSUSj5xp1AG/Vs9dvpAygSfDxCF+ahZubgIDuPO6NhDiNvIG
	NaTGbWujlorHTGqacGoHlbvdqze8AzDNPQQPXLpZ1SuLtA1YpcHTv7+hMYlo8ICdM/jlzA5jqxs
	NzVnrXTn6hiU59nLNAoyqlbgKad64zsG6srK3fkIY7BDzyjcdXZPEatSgaDEUzpEk9SRGqUk0tf
	SSeL7r9KKSYilFwFgftLq9BgX5/hh0L3qmtehk62jsPzyvd03fH8jKveXFYS3zLZehyJ4Cn32Mx
	flYaGaBuvgyOU2Tu5Ih3BgDXbt9mQL8erNTMXj7JWtsRShrjMn1uuq6v0ZIjD0Kt79yGdA4+YCu
	6wFcroWgLiBfgYkZHXNv4/czDHnFCHtI1fm63Yc9K/tR2E96nqASksqHiLeM+m9nIaxYlzFw3KN
	gUv1CBJ7mB2wPJ0aqn
X-Received: by 2002:a05:622a:114b:b0:537:f05d:881a with SMTP id d75a77b69052e-54e132997ddmr61751681cf.12.1794010007254;
        Fri, 06 Nov 2026 16:06:47 -0800 (PST)
X-Received: by 2002:a05:622a:114b:b0:537:f05d:881a with SMTP id d75a77b69052e-54e132997ddmr61751141cf.12.1794010006668;
        Fri, 06 Nov 2026 16:06:46 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acc4a7sm31624376d6.44.2026.11.06.16.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:06:42 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:06:10 -0500
Subject: [PATCH 3/3] dmaengine: fsldma: convert to subsys_platform_driver()
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
Message-Id: <20261106-dmaengine-subsys-v1-3-780eeddbf3ef@redhat.com>
References: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com>
In-Reply-To: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Zhang Wei <zw@zh-kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-actions@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=hy3g6mWddGYLX6Myo7kSoYtQp+hY5Hbo/vUsysOb4zQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeZbeeNxabtVqgmXFuKMOEE2yy/Scinn4R5Zj7TWhOt
 atoruLqjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACbiOouR4cR1jkNqh68wrEm/
 stlDUKbx8PxggVfG0h+OhJx8eL8//yQjw16uPZumb/y3PVJc7N7WsJVuGVcamc2sSnpsTuX05Pi
 UMQAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Note that this driver previously displayed a log message during init
time, and this change drops that message.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/dma/fsldma.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 99a878ed1444..fd3dca7616a8 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1431,19 +1431,7 @@ static struct platform_driver fsldma_of_driver = {
 /* Module Init / Exit                                                         */
 /*----------------------------------------------------------------------------*/
 
-static __init int fsldma_init(void)
-{
-	pr_info("Freescale Elo series DMA driver\n");
-	return platform_driver_register(&fsldma_of_driver);
-}
-
-static void __exit fsldma_exit(void)
-{
-	platform_driver_unregister(&fsldma_of_driver);
-}
-
-subsys_initcall(fsldma_init);
-module_exit(fsldma_exit);
+subsys_platform_driver(fsldma_of_driver);
 
 MODULE_DESCRIPTION("Freescale Elo series DMA driver");
 MODULE_LICENSE("GPL");

-- 
2.56.0

