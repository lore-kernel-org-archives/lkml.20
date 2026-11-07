Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010154;
	b=o7qcYQbd0cTR8FAZi2/0lo5aPuvx/GX59wv7MJtlszliNekR7k9/MeHsGT6H/QkPF558
	 bDYybhMbbCPlDZJY8wawdc2jOAXhJYXgw4CSeVd0pyjcQzIYHZy530lSZyQ4PCKHHnrC7
	 FBvX7oZuG3eOxR8TmAXeeCv4zWymsqXfE1ieftJe2uY+G01alGpFuoKpL+GUKABLrybti
	 DqrWxiDFqKG6BKmL+4D+SsF6MqKJa88cK/ymiKocs6GbQPuDfMSgge6XQ1u872gNlX4kS
	 SsGuORr65eybBJH7lSuexpLp24x8NQPy6k9YgWSv0iFHOoy9czLKqXi60GHV8IzN6/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010154;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5KZHToixOJT1sSIF1VLXErcQ9JgU3xuOBfoy1PeUWns=;
	b=SDjMxRWeKqNnavqvW/7UfQaSeBlcy0SNk6MqoQzPK5Qr43LHbVxlcuKUxL3Dex1b2Y82
	 nF2LJF5Y6khXAZlOIo+w2i4pEUROibU0l07K40helok/aqX4RNVRPe3jtIi4btMpKPICV
	 9lFBMW8jDKwpVdJVH+JcJTFSBTM6N17vZuGGPurgCO8IKv6z0nmoI9GDpWSlREbCepXIr
	 BM5HYhLyQT1vEdl3Zjcu7UW2zSE7tEqW3VXDmKoFTMyNjriZIXRVSso03OG05lhsMQCHl
	 BfujMd25QKHNgBMVQ8bFtWxWUoPzNaojDL70XiccSHcaBkFoiJVIZafxQoWOwy/k27Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M9G4hoiP;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XB5TBWak;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D894606A338
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D894606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M9G4hoiP;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XB5TBWak
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5KZHToixOJT1sSIF1VLXErcQ9JgU3xuOBfoy1PeUWns=;
	b=M9G4hoiP+ADe6vuqpU5lPshPDNGzlF0+Mgdi4yFFqVX0C/mbldcVMwlYLVYdYadUXj0E67
	ouplZYB7/ZFRUttTAcaJMErUhfW3/twJDtEeKEkwWb5KM0GgEK4FhlAiJvhcIiBt9f5IY4
	TIZ81Iw5k0sXQ4gQXY9e4JWR9wBrwSM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-wpAXUx-0NjK0qRyNg5n12A-1; Fri, 06 Nov 2026 19:09:11 -0500
X-MC-Unique: wpAXUx-0NjK0qRyNg5n12A-1
X-Mimecast-MFC-AGG-ID: wpAXUx-0NjK0qRyNg5n12A_1794010151
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c84af45c8so24389676d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010151; x=1794614951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5KZHToixOJT1sSIF1VLXErcQ9JgU3xuOBfoy1PeUWns=;
        b=XB5TBWakX79FzXai3vWXdfE/rApQcOC1g7+T9a1x31dTzII1/4ZL2Tj0qGpwMAJ0QK
         a4Zpc3RG6V5Ep61Cty2pIX//1RQ72WC8J8zUHY8YZzsgwV0l6iRFtrdwvu321YecH0aw
         EIuI5YSQ8dh/Kpg9wEfYp8KHCbtxM2p/vpiQr2fHCRDeoEG97vnNyymvVHDZq8vfY5eI
         rzIN6o1D1gcYBrgRluekU5yB/9m3seloYoR9hHtvlr/Hh0ufw9nMi4ZCOjbMItkfeBG5
         oMlqzaFCwvp6YUpq2rqBpRiiWjRB8ta3TkG+3QKgW2r3nRkbKxoyX6LpBt12myshP+KX
         DkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010151; x=1794614951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5KZHToixOJT1sSIF1VLXErcQ9JgU3xuOBfoy1PeUWns=;
        b=TvYyycTfjWGoLj5mkzxrAzHCwUhxgSHOu32GAS2+NW3uaHoKuCI3+/Mv1RGllYg+Xp
         tbgLCyBT8N82LX/tsEz0cq3U+oqATcXsM6rdnAqjuYarcMdsi0jkvNeWgxR2QYscPEzi
         s7bAkMa21Qsn8rWG0hifnRt3rtkHDurNL1OeyduaORa9PzsDLnWTtmLIhg/GdswmFvva
         A/6eNdrqaqkZdDi1eBk3Ln1mQQHJ1WWqbBtgceZGmCMM1SBeqqCdmYxzyWJG56eArdUO
         xV5Mpd/UP2m+5TWpXOme7/bYWqgCoRaN8snWCOl3HQeRxerzRaMP1dXV904hNIMMLAwD
         UqYA==
X-Forwarded-Encrypted: i=1; AKwUvBxR+/4fB/Hyc5XPETd1exitERgHp+UYCDfYyc6kZTn5FjuifL+Ueq89sTbBXXWxN/n9jbSEujhWTqgCZsw=@vger.kernel.org
X-Gm-Message-State: APuU4Z914PnU41i2tUkk7lqQgRgPcNSyfJCwfsCML5vlvu612mGRmxKD
	3xkYMMODWv4pCHZmRefXkWh9CA/kgDA87Ea2RoxB9FpyTSSF5X1ERtbkOwJn1mRC5p43pZ9SRrM
	in3KLrkSdoXbfATPbRXIsMLbKcEIOIFD7cil1rClBOrVeWne25GvIcjnI01m/+eQKTgO4kKoa/A
	==
X-Gm-Gg: AYBFou1AprLVD3y8gqt7In4njIogJfo9gdgoVIvPmLY2y4ea3ZntpRsRTGQMAp//RKe
	j0MXSc1rpF7/FNNGQm2kC+5FCOTy3elxlob8B0+BhkNdzCqI9dxDSaFWFZXKkCFtLrquR3ST3c1
	igGw5JkSIAz30oBqZOftj5dvGslhgMD31fDE2sk0lce77Qo5T/mzR8baj03n6zooszWArRAL7qQ
	+Fd/UNkuBz66MzBS4ZWz9d+/BRfkb4vYxRntM3DK5j15ysO8jUnRMCT8Asjx+OXFVKHw3YlXo6L
	GdMt7Z7dC8JxRIOLEXy6cXic+aZJn85meYPRwHV3DT2C9ErIiiwKiFXNlU/YTSwRekYqhW/Xl3w
	d4OZ14Wu2pcDH3f59ejT2aNDQQcE0VzeFS2/Gw4+GC2TipiOToX+A30OLlqXc33pf95MMVSABGh
	rW7DLIOpfqlD6ElCB5
X-Received: by 2002:a05:6214:5082:b0:91c:133d:4916 with SMTP id 6a1803df08f44-91ea98f7eafmr62550876d6.57.1794010150693;
        Fri, 06 Nov 2026 16:09:10 -0800 (PST)
X-Received: by 2002:a05:6214:5082:b0:91c:133d:4916 with SMTP id 6a1803df08f44-91ea98f7eafmr62550576d6.57.1794010150131;
        Fri, 06 Nov 2026 16:09:10 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c4b8sm31998536d6.15.2026.11.06.16.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:09:08 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:08:44 -0500
Subject: [PATCH 1/2] gpio: htc-egpio: convert to
 subsys_platform_driver_probe()
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
Message-Id: <20261106-gpio-subsys-v1-1-0785e37520ee@redhat.com>
References: <20261106-gpio-subsys-v1-0-0785e37520ee@redhat.com>
In-Reply-To: <20261106-gpio-subsys-v1-0-0785e37520ee@redhat.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=782; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=f3ONUNPq3Nr2ZHFH9NlyRV0HUVOV9rrABq1PmCJzieI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5chOyV7Mcvz39d3mDJmhhQVFp9Yw1Nrsv93Xb1Ifd
 btm34o1HaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkQyzDX9ndKYaMHN9jeZW6
 I++LmJSeWiatqzwtLHHKKp3Gm2zLUxkZ9oWunNlsUG1mouItc2Yn54zi5XvUnCymHFtb/bJw6yI
 vXgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use the
macro subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpio/gpio-htc-egpio.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index 25a4d4494f3c..0e108d4236d2 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -395,9 +395,5 @@ static struct platform_driver egpio_driver = {
 	},
 };
 
-static int __init egpio_init(void)
-{
-	return platform_driver_probe(&egpio_driver, egpio_probe);
-}
 /* start early for dependencies */
-subsys_initcall(egpio_init);
+subsys_platform_driver_probe(egpio_driver, egpio_probe);

-- 
2.56.0

