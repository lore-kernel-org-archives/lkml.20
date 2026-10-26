Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974108;
	b=yS2ToipjPusIUSAPkwEr1FBoG34INMPNJ4Edz0fQj64aEvMK165Vc5pAviUeETm9L855
	 RVd7ElEULILiD5idDuJxWbBrTrTm092Tk1JUKUB99RBJBlgeb/BXxe4THjNuN6OVeLpgn
	 GStPoRpNw6plgkAbOU5B3IpnC4m07rtOhcqabJO7lYEwvs3lAispxi6tQxUzf0qHt/Mup
	 R+iZY3ssTMb08UMaJrtenitkTm2sLqytXroz0zUnDD0Tn+XHZL134DSaJ2scwMv/QfjMf
	 K+9D9XJbIOTDMfWb8VLbZxBKK68XDX7SB6/fOy8Egr03hR/lLupe4OozlfLXAXe+cSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pKcKgfb8CvKyXWoirq734eSIdlRSGIIBpTLfxYawV4M=;
	b=K2enkAxaeoTFxyttetblRu35npi6HUk3j4M3glLiW6hPf+mVT0miA5k7dGHX18Rbe//7
	 mrLYYY5XHy4n5c3V7Gc/CGO1/y6CmIM4DgHKKAs+uYSoiqQuJXk9Xf73+qf7HUWd1lPA6
	 8Vx06Rli2IVcjxW0JV9e8TvSFPB/+pB3BXsMd/vOt9Lq68ESbaaQ+zgev1sRwMX5i+WAd
	 AWgXTLKFFRjoyhS2muldq7HPbiaisaLp8NGR5wj3ns2DivKQX47y9rucz/e7ZC84asCdX
	 sVAyp+oniOAcfANE/e7FKgi+JOuX3oE46eQojZPmOb1FoXAFJYLOlHO+iDq/Rtey86w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PaWCDMoZ;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D39606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83D39606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PaWCDMoZ
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ea138a3497so15316995ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974108; x=1793578908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pKcKgfb8CvKyXWoirq734eSIdlRSGIIBpTLfxYawV4M=;
        b=PaWCDMoZw3yyRXDbrZSfczHaQ70JsNzuYgXW5+vKreMrNfKI/R1/pd7t9uJN9wydW1
         NFhsvXTxkU3uJgQxascjIiJomFOFD7q+nqJ/3/wMUCoYxhQ7E5hnOBut+N1Mio8Q5Rlm
         7/zajJYrpMuLKsmFUqztordEMNVM6rm+iQyIo4DxEh881mIvq+e3q08DFPYzIUIdJ4C0
         vDXil6cWPkdSLKlOeNhfKKyyvNbtm63VL4tH4n+JAL7Vgqm1eoQA9SyqG4mtPEhdYnHx
         wvOoNpdd1Ct3X6Emj1HTHX+FWL0I+IRY4DvA0MhSEV3HRfxJUCkfWIBcbR4D700wMH61
         yaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974108; x=1793578908;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKcKgfb8CvKyXWoirq734eSIdlRSGIIBpTLfxYawV4M=;
        b=vQsglQ764w7JXzCQvb/5ZcOBckLfGLQwGzlYLm/qufGW1MdQclKC6YgQu99Tk/hKOu
         V/yLK7Dr8cbU7ZsdV+ZYDYDYvitDrxAHYGOsbTBcAullx5Ya3elMOE5gB8fLauZC+0u1
         CuplEA9oICaOaNpVU+80LKDrimOdxn+5JhGr/XBaB5Sgfyqg1DmtnyDZJQEHjCQeLHbS
         y4rN0ByxIsWKMl5m28CeQLFBsfHIw+Dk42nw9WHFgYyM39zwBGkeiOYUEh8CN0riGC6g
         v6hD0MCtn6O8uEZI4dOmq7FimxFncynLZ5ld05VT6XTWWNMjqTCLagtZYK1Puc7v7mB5
         tb4g==
X-Forwarded-Encrypted: i=1; AKwUvBzLmiYAYZzjVqQnXVJP9iQJ9hdACTY7kFG2O+NEJjIddLsPFGE4mXCF9jwkrJeeGniMqtb+psZegHr4Kek=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrZ9KBriwb3UtN2CblbOC7XGdwQt8osDCCY9eTsfCCj/ErzkQk
	r+0w9GWjnSyX1qCwxF1ZvCl0Nb/FHjhgXoa3GimPP8iNjGthd6+qbL6E
X-Gm-Gg: AYBFou3WxPyxFFnaI/5HmE5IRPA8i5IIMvlsK8cp2NdZwD8IUKJqqqctMNafCVl5Yus
	Y+EGv8i9WwjA/T60GmNqDd8GIpK5LQUJS1GzmhGjBg3oRS/nOR7h+h6t8EERaZFSSNyCbG1cJ8K
	zgpbMn05JRidzh9lEGj9bW0s9gd8PoxB/XOYbLxZ6dZ/lHMPhvckJoG36CoXQEX0Jx+2uV/Yb7f
	pgaIHkFPitIbqiYUVFQEF9GRket4uQenmTJyNEPY+lMLhlsw4TLL6IC1+0TVSERG2RAqNAhKobQ
	BDm5iEWWir3KDD4uugzl2scUHXaL/rphIo89AkZqCtoHI8QHNdL98+t2PNIfRJtJXp3g+QF70Sb
	GefuvqzmiZXpzS2TR2GTb8TGcPg5/koePM6LWnueI7+ybyBwjwX9Pkw8CwYFJphdcDuc0wazqnC
	n06y7j0dUnmAhNK7v8X486zSnKZ8khoaOjgq7/ThDSXoI8Go5Y14LWsPPQecm+vET5ZOVUKElkO
	2zp7HN4oGCvn0ruZTRJ8uSUTaL8sPYhuQ1ft+Igvd0jPXLmlyH4M+EHGZhxY+W0jQnZFnOkAKuc
	v+Hpb1pHjZQEDRA=
X-Received: by 2002:a17:90b:1b0e:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-3adea89942bmr4456329a91.18.1792974107750;
        Sun, 25 Oct 2026 17:21:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6af0dsm6015077a91.5.2026.10.25.17.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:21:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:21:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: hsyemail2@gmail.com
Cc: linux-hwmon@vger.kernel.org, Sheng-Yuan Huang <syhuang3@nuvoton.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: (lm75) Add support for Nuvoton NCT7715
Message-ID: <94bac7e7-9ec2-436e-9612-7e0e62d8e66b@roeck-us.net>
References: <20260918084042.19541-1-syhuang3@nuvoton.com>
 <20260918084042.19541-3-syhuang3@nuvoton.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918084042.19541-3-syhuang3@nuvoton.com>

On Fri, Sep 18, 2026 at 04:40:41PM +0800, hsyemail2@gmail.com wrote:
> From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> 
> The Nuvoton NCT7715 is compatible with the LM75 temperature and
> limit register layout. Its 16-bit configuration register shares the
> TMP112 configuration layout.
> 
> Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>

Applied.

Thanks,
Guenter
