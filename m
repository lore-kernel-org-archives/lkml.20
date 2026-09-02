Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B11A4A0157
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356807; cv=none; b=lNQaGZBJAq2exIxT9GTynf2P0T6x2x4GCkjohwmNh0xxKorWXBmXfZV/iDBrTvFjCO2QY6Y7DbGWXlp6zrlmxWl+H0APHTGwWGZYSzIwLr7OuN6P1tPj8MWPKrKtsYzpQRDY1F3hgid/IhsnFUhYvZm9DygMqOSocz9I178v+wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356807; c=relaxed/simple;
	bh=o0rlClM5qugEx/ua4/bp1yTHz7f4XBumez11VDdWuWE=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=EVuG6hYWYrKNxyN1eZZ11pqv0LYmkEYrSe7Kdzit5eFblca9dv88+xC1rK6Kv4oU01muQWkBTUH7zyqv75xEgDDDwJspn5OMVIaB6zUnuFc/TSYOAu3GGI6MA3T/SWFTLJmY4xDHJWmxsV5FD9BMcReyg61aZ7JJlbZo30WYu+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CypwyhgR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CypwyhgR"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49954b88fffso8069265e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788356804; x=1788961604; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uung8BThZMwxg0EHYvlAQa0fyS8hJUcosA00cBSikLk=;
        b=CypwyhgRM1ZFUYjS2MpVnnyMySCGr4NbQqIVQUS+SavmPxzA+9aB1WWxfFNf6a7FoM
         qOT7Z1xYlC+Vjcj+zJhOp3T0nOv/zPZkVEiC11jc1vPMQcKOFabv1168pEm7lSz+YlLu
         SWuH5GHa9jbXysXxyW/GFIxkQVqGIyzWYoksnChwtckcByqaHh5/7ttC5D4zkTpFSBij
         nIbaYrBman9sZ4Ufo2M9uOqmTnLCqt/mg0ziTIR7+L+gu6yzdr12Wrl7fyMRwgyASH3k
         aPBQmgRjoFGb8xtJ4D4UFqC/GDwQUQwp24pF1R01QtR/Vp8mI9Zji46NH94R9Kc2K4W+
         AjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788356804; x=1788961604;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uung8BThZMwxg0EHYvlAQa0fyS8hJUcosA00cBSikLk=;
        b=WxOlvSy0I4T8ElT/e//nOpLke5W9HPLlG4C29wnq3wGslBIwDaOrhayym8H7EKRTuV
         F/TAhamig1k8JWB5jL9jIHB9NUjK39yhM3UzFM5TS9xJRvsiBkKmGT/jyCxLatIkchW/
         8D8ia+Ft+4QbQ9EUjwJmwObJymkTu57u2fK730wv8PFSffNXx0z4EEmPnvWrf7PVEwpH
         Wf166MsFo9A47oZ53YhfCbFod/QsxABUB9KrFO1UhTmglLV0Zo8PoC10DA3fj7zOuMtI
         00W0MYhwrl2cb31ZmP7S2K17baN9eD+GUf4uO+ePrKwFpEY3OLi0lm1YfXJ2O5Q6qYyy
         YvIw==
X-Forwarded-Encrypted: i=1; AHgh+Rp3RaWkwrBY13P3SmjHGvL6Z4vo0EkmBy7XzXTDnAWL7lWHNeZewsXVNPy7UIjLOBcfYtGVZEMuH+dqJYg=@vger.kernel.org
X-Gm-Message-State: AFuF++meu7DRZ735ohqh4VPeWJGKyMyLkwsrW4dJ51KZXt4hyHkEajiQ
	+B4O3h0DK71yWvPFAhk3ek3Hh7+HyF3RFE1tcriFAbuwmpIzaZoo19nH
X-Gm-Gg: AR+sD12EoW84wUnEmN/E3mtMUwgrVzo2u5fXyQaKtIJVJMwCREG4iJj1mdNiIsXQHP/
	nSUFmbIIOuE+fmiEExgtMhftp2nFy9eUKhdeZhWX4k5kMKWdo+lVrB+JnUsPqn0rSoJFCowIp68
	6VygfWBCJQg5IUdJ1tQwi93TVHdxuypL7GiVHwnMHq/j8F1zQMwr57MTiDcYfFn05AY/EQai1u3
	9ga5qI/Vet+B8ZGCmtJ3b251aFMNojS6j5Tplt7F9WNvmOoZA0th326iaLxv94s1r5gvMPSn3Zy
	wgV1IY8pQfSHpAEuanUJs2rqsf0Ue9v4wLHUfK5hew8HUll5CgM5XABgv+rHDoRZOrQl3Cf6vvl
	AQqLFrHJgK5O90NeGSW85bduoHDQAPbfTsb/VGOQNlUdBpBUv1lGBxF5VokW/k2CP35FY2NXCBV
	dJvD7No55OMhrA6pSQYYDJgRPIDRavcau+HZSB1Rcogab/l5VtKvPoD/pRycBCJUPtX4iEnvTDs
	ZtNl11fHE2uVkAxgH0Ut5hGwcq84uDxq4oo1BX1kmHZmJYH2QCy5+2WLMOjjQ==
X-Received: by 2002:a05:600c:621b:b0:499:dbae:86be with SMTP id 5b1f17b1804b1-49ce58352ccmr101662915e9.14.1788356804024;
        Wed, 02 Sep 2026 06:46:44 -0700 (PDT)
Received: from valmpani.valmpani (athedsl-11462.home.otenet.gr. [87.202.45.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce7dd5154sm39216155e9.2.2026.09.02.06.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:46:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ihex: Fix 16 bit truncation in ihex_binrec_size()
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vasileios Almpanis <vasilisalmpanis@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 David Woodhouse <dwmw2@infradead.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <2026090256-posture-affirm-f40f@gregkh>
References: <20260902-ihex-v1-1-67fdbf8d97ff@gmail.com>
 <2026090223-napped-nerd-790e@gregkh>
 <178835312958.943169.5134885168571622868.b4-reply@b4>
 <2026090256-posture-affirm-f40f@gregkh>
Date: Wed, 02 Sep 2026 15:46:41 +0200
Message-Id: <178835680142.947452.6844220046489942180.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788356802; l=1143;
 i=vasilisalmpanis@gmail.com; s=20260731; h=from:subject:message-id;
 bh=o0rlClM5qugEx/ua4/bp1yTHz7f4XBumez11VDdWuWE=;
 b=ZTa9yJ/mRy2fMWTJjmNTZkItUoMtxrHg0VZhvXOTrk3eYHYzwubnhdUl5eUntVDto5gGr/+bG
 68ahcPXnkhnDZI93/XaVX3vvM8juXzAGqTb7qRzysPYIsAfgMXi5aOS
X-Developer-Key: i=vasilisalmpanis@gmail.com; a=ed25519;
 pk=gn5Uo6yL8Tlpq5uATxA3nqoq+U8eWLRbjD+bOk0qSpU=

On 2026-09-02 14:56:48+02:00, Greg Kroah-Hartman wrote:
> On Wed, Sep 02, 2026 at 02:45:29PM +0200, Vasileios Almpanis wrote:
> 
> > On 2026-09-02 13:06:27+02:00, Greg Kroah-Hartman wrote:
> > 
> > I used fake images. 14 bytes long for the out-of-bounds bug and 6 bytes
> > for the infinite loop. I passed them through the sysfs fallback loader.
> 
> Cool, so root only, fake firmware, not a real issue?  :)

Okay got it, i'll drop Cc: stable

> 
> > Out-Of-Bounds bug image:
> > 00 00 00 00 ff ff 00 00 00 00 00 00 00 00
> > 
> > Infinite-loop image:
> > 00 00 00 00 ff fa
> > 
> > 
> > Yes its root only. The attributes are accessible only through root
> > and it also needs raw-gadget.
> > 
> > 
> > It does, but the value tops out at 65535 + 6 = 65541, so 17 bits, and
> > size_t is at least 32 bits. I chose size_t because sizeof(*p) is already
> > size_t. If you don't like it I can send v2 with u32.
> 
> Let's be specific, otherwise people will trip over the fact that this is
> different sizes.

I'll change it to u32 in v2 shortly.

> 
> thanks,
> 
> greg k-h

Kind regard,
Vasileios Almpanis

