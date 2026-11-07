Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011736;
	b=JJcMxAUM/QrtzRlikHSF5BErYbLDHapUq1b5k6SSwlHr4j+6d3+L3z282koyx1wUx4mw
	 apSkXOFbxXUMTUGohw8m1qHKl2Zk2LFmAmQ1rik/jk6xa1vXBcxlkjABCWVvJRg5B2JDO
	 m9O6t2xo4H/MSFvCjxmRjcLWmTH5WWiOiyIvUQslJ5EgrOrFY8KqTlhH0XBsm1LvG9EnM
	 BmP+/BriZkQuIo+MHRRDNzsRrCT+VMAx075swIbTnML1Ww0jg4TUi9j60KrVfuuEUBLzD
	 c+TsawUYIIATRQc8JCw+PH80451h7kv6GJgEup+F85BdXZw67KcCcuWd7DI26gSxNJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011736;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=6JkliyVUZAYe9DzLvLZYRlgILzNsCo2gyWXNuVXN4mg=;
	b=PZAFEYtFPCGnjURaWhYtR2OrfPnpR7d8FnD8LBOmBvRd2PGadBdtMURpnF0U4y/Nczw8
	 qe8EjTwCRi6b03A6VG8jkLH/ludGjdvF3WokVdAY3Xxlo/nCevnCmGcjvj5eDT5yKgrnQ
	 bAI4mHj+9CEK6YQOtJP8c+N5lQDG1qki41O5tZC/6MGfRnJPAEUxUGSNwgyk/20EZ6IDl
	 G9iudwY3X3kFBPOg30/iBXpihLgt3rt6Cz9w50VEhdq4u339Dr5Kgz4S2a/eq9Tpl5BiG
	 KeXFVFTcWcj/t517axBP5J33Oy5hVWR+huWk3xIAso5taDKVfFBdtysnjI6alfqzfPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gakii2YF;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qQlPSc2R;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF00B606D824
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF00B606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gakii2YF;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qQlPSc2R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6JkliyVUZAYe9DzLvLZYRlgILzNsCo2gyWXNuVXN4mg=;
	b=gakii2YFYdexlK0HSmK/7BFXghbdNiandbWzV0151Rz6e62N6bT+kooH9SCVXyFg2LhGAK
	5owsehtVFDJAn2wdZyxCT8Ff7Tk8j0Nw8JuTJS2RYp7qmlB7gftqAQLViT+t1jHVwSShey
	Jolq9YSR3OqaHfsr5DtDEIyS2Vdvy6s=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-E1v9gDaSOme6eKLlQkoU8w-1; Fri, 06 Nov 2026 19:35:33 -0500
X-MC-Unique: E1v9gDaSOme6eKLlQkoU8w-1
X-Mimecast-MFC-AGG-ID: E1v9gDaSOme6eKLlQkoU8w_1794011733
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91eb16ea5c3so27575746d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011733; x=1794616533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JkliyVUZAYe9DzLvLZYRlgILzNsCo2gyWXNuVXN4mg=;
        b=qQlPSc2RKQ3e/e2TUwYhEq/gMhe19IntxMyHZBUTaBot2FSqUnlvXMUTefbpM33ukd
         bsS0/OJ5hX5ktKYa2W8kwW1BAB++Y89PcMVKw6YaLyjAl3trl0dMurnf3hTVbvaw8TuO
         GwLjrCb58BMBuSmYrtb3cVA9H25TxOs5pnb3RyPbJj+DgRfqHTfAejcdro6wOLDqLbKu
         Tx8alqXvH5vir61gsi1nQgojycp3gOcXAkwB7uNBP2/0FA0SPuddf4qEWWhz8jSHNOLR
         Tt0U2fQkkobmWtbOIldo7FbkLrkN0THxYFmTVolAgUXCCnX8+SnHMP08Ds7ad0j06yNk
         T7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011733; x=1794616533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JkliyVUZAYe9DzLvLZYRlgILzNsCo2gyWXNuVXN4mg=;
        b=o/6KpkcPkbN2IKwjrgVFQZx0JT+8d6XiaK9jbf4F21xJq5CsGZjVJkeJOPS+M5Wspg
         y9PlTy6UwTvA7TaXh5EdP1geos+wP1G5WchlbjuqjurE4MbZCgVrYBr9WtaVRztdL2uu
         WMenxZKemIUBaJFynZjEhSzIqRS0PlYTHs7v/eEzK/ltvLqLHf1DGa5Joac87XH21D1D
         yXwH09Kq1aO7PmwB7zonJ5coexGEvigBP424DeK28z3+MwAw7n2V+70TUYNec33xxezr
         YEuT7Bbo/TZ7qmInb5KEFuoesAcaYyuWzFfWYvOtNpNyFXOjdcNR70i3xJV02E0sGGu+
         SBlQ==
X-Forwarded-Encrypted: i=1; AL+hErGocD7NUNz++OnqH+d31D/Y9M1LlcHr05h31idT4zq1jXraK8pxO43cFnCDUYNWS+P4S+uWesxWzvyOnE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cBrDxEA80r/EwkZ3nqCpEJElO6q9/132fTQEq1KiqdkeGvW1T
	wEE5IkZZnrDtA6saK/awFl2WYdIyCis5LLpWGfJnGehQgBHu6OlDP2OIN5WT2gWcdBn6UojDi1j
	x7T3sxcgcP+HGT9y8k+8bh1NHm/i2AMwkb23QeE/67Mc5opOaVeW3cNbpOltKPxcRJg==
X-Gm-Gg: AYBFou238NYZaA/s+00ceW1rxZO/RKJHzI7S7t7j/a1pNK/m1MQzwsc0DPwlbzVsYNs
	E+nwU3uVTqEnoIsZZgQm4PbNr07U069iyyWBPTWSG46jN32RCxV9cnm946Kd4hYg4btr5KYbggz
	60vsbxXoGBLFmHoEERxLHFklENcKlkoi9Cdunqk9XEITV5xjIhommqyYhFFhrjdRLk2uD+AVYYD
	oFpiCuuaLYVLu3PgKnUpPWj4zts5hfA62/dKwXIZEGQXKkXAASEVaoh/+1yWqaDEPAhjrayc7RK
	SpOM1mGETOHGUkKO5V5/nhlo7t3sdXdyZ7twps0oVk7TkPNFR3XK4rKMcSLCRGHi9H5XUYuE5NN
	uMsQC7nv3ujqyyE2m6w28YGQQqUFSyj3jJF6d4iRNtZwXUl1ZToIx9MY51sVD5Y/HNYisf5RpdQ
	VJlXwjuq57r8HNf+e6
X-Received: by 2002:a05:6214:53c1:b0:915:e732:33b4 with SMTP id 6a1803df08f44-91ea96a68c5mr60340176d6.19.1794011732974;
        Fri, 06 Nov 2026 16:35:32 -0800 (PST)
X-Received: by 2002:a05:6214:53c1:b0:915:e732:33b4 with SMTP id 6a1803df08f44-91ea96a68c5mr60339856d6.19.1794011732410;
        Fri, 06 Nov 2026 16:35:32 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c5c3sm32967686d6.12.2026.11.06.16.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:35:31 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:35:14 -0500
Subject: [PATCH 3/3] usb: phy: twl6030: convert to subsys_platform_driver()
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
Message-Id: <20261106-usb-subsys-v1-3-3a86369c3f86@redhat.com>
References: <20261106-usb-subsys-v1-0-3a86369c3f86@redhat.com>
In-Reply-To: <20261106-usb-subsys-v1-0-3a86369c3f86@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=996; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=JhlI7VYFUCpnrlF0rhah6YE4TeE6fg139Kd9/dVb16A=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFXnUfphzrUSlYwuvWtaKKyeSd0QUPO5q23Ho1rTXP
 28ve5dp21HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEjPwZ/qet+Xv37pnydSf9
 WRyuqu43fcSv/j6p+9yxb5+WObCz+bkz/FMOm1214ePRHftj7gV2iHhuNjeQ1Jv2wHZuwprExiV
 lj1gB
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/usb/phy/phy-twl6030-usb.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/usb/phy/phy-twl6030-usb.c b/drivers/usb/phy/phy-twl6030-usb.c
index 8c09db750bfd..5b71aa95b779 100644
--- a/drivers/usb/phy/phy-twl6030-usb.c
+++ b/drivers/usb/phy/phy-twl6030-usb.c
@@ -439,17 +439,7 @@ static struct platform_driver twl6030_usb_driver = {
 	},
 };
 
-static int __init twl6030_usb_init(void)
-{
-	return platform_driver_register(&twl6030_usb_driver);
-}
-subsys_initcall(twl6030_usb_init);
-
-static void __exit twl6030_usb_exit(void)
-{
-	platform_driver_unregister(&twl6030_usb_driver);
-}
-module_exit(twl6030_usb_exit);
+subsys_platform_driver(twl6030_usb_driver);
 
 MODULE_ALIAS("platform:twl6030_usb");
 MODULE_AUTHOR("Hema HK <hemahk@ti.com>");

-- 
2.56.0

