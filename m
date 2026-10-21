Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562526;
	b=L82wDFteQkDcLD0Cnmr1/67YQkUQxetjIVnRb1IxAECkwZRNjLR/n3TAgLBWCynTLncY
	 9rojkl90Upy2STavxiOOETKxp57rGZIM9cpKFcFrcUa4q3UoWqgfS6q+Dy0/45TbXI1J7
	 y3u5ph3ac4NbwPSrORGyaMxa5S/GATwj36diRQ3CCcjOfwtTsVEDqKCH2DOCweY4N0p66
	 a7d7rwol2cUojQimP/eZz14FMWwTwTvus8nyrqftBmnT/DiPpdpPfipa2stDSWnv1m7UM
	 rnZUXjYtIhZfEkNKC+z3+Uq/R/1dU3y9S7sTMesBrUvunfD6lFbKtuBXEG4eVNEqGLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0sMVChQS6GVQNygvoifUMQG1uQ0IZzpXQhMQ+9mKUZA=;
	b=HXdYKuu3FyX9g/V1/kpPKAMaaj/yCGTRnDQ5oEqtyUuOozJPLhmzJ12tGOCvDvfXgWuM
	 gIqwCZvc+qoVdR6olBjSabhtbyyDTMuxK/oJ+OYoXqwM8SQ3Vp7hi7jF4i3S/1B4Promh
	 bKHRG09D65HPlldUglcizJkn4l3Od5zphYd70OIbo/0Gaauo4Iuw2sG9R4GUVomjd1Q74
	 Mn2b73K8Cpa1Mp3VQRQaKJvikKIA1rwn1cfBwd/wfgAeLBt23w8FepNAW730h5596Xc8/
	 iLm8iUftOA4dIUZfNo07kiGJBG77QhIjPhOYK70bPqXU4mN13+TSnKlwf9hYkIJz7RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B6cmMUSL;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55680606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55680606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B6cmMUSL
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so935866f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562525; x=1793167325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0sMVChQS6GVQNygvoifUMQG1uQ0IZzpXQhMQ+9mKUZA=;
        b=B6cmMUSL4yFNcGJaxyrozE9z4z0856sda0rgsx7QRsdRQ9mCTjXzHZyoiV55UD/uLp
         DVOwg0WM3O/hbWyJiaZ0IkBiPk5GhV1G25HVaDErYgZffGBbVLoAbxXml30KT2+UOQ4r
         Nq2Y6KVrONABogyQAe24olDR2cQyM+LozL67/qNCFMNy+cpMnQy6OgPkgPZWySMrO4u1
         4lEY6sICUoZwg8qe7/TIF+iylfOEwaMZ+knp8ZLCrIy3jOaxRZWaGh8t2PwuaBp56yjS
         8RVAzgFjI+wgyRV9ILH1jI4JTQX2jVJlQ16sTx98LcxkPipIxADzxQlsQG5T2HIg21cu
         6bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562525; x=1793167325;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0sMVChQS6GVQNygvoifUMQG1uQ0IZzpXQhMQ+9mKUZA=;
        b=WjbWZkwXb4gRQ46mtSfcH1lXK0ojv9qtt+UgazxjcVSR0GZ5my94ZR4+0NSlkEVkmi
         Rv4S5zzpEjYk9VeidaSWTakIBfY/wAMYjTXs6Vp7FVuG0CQIJccpuh2A/FOn+e0xi1Ou
         8+m1+hQO0N3MaW5ncQSiwUanC5y1D7Q1o70gdmRwWVHPNvSfEqTq4T9UNHC5HRTbo3rR
         77DKwrp910zF9i2cY/UpsWm/aqITLGXp03szE9UG8hLJtFhNLFA4LVjsZZjR5SZjrscj
         BAKx3TlCzStLQxTJi++bfBMmqu4nk9k3VJbfSYqvx4mzn9qM2YBGxiy7SDylP8yNYKlG
         RZpA==
X-Forwarded-Encrypted: i=1; AKwUvByU+B7wL0X9jqrm1mWVOkleUlnLguPFTG8WRYG/Ce9B91eMqf9ocSw3KkA1cq27fPKhB8YlkFslscnhjoA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMmgC++AD/00GFe6F2Cfcm/Opvq0OTr2k7DDDHt5gSPKK76Cd4
	VqnNsj7LakfaTJg5fGAg2Ezpx8yv2eDXgOTXNtQ7jyvJ22p2YcegDDKj
X-Gm-Gg: AYBFou2EOg8de7qzu6ipqwWx/57DQFtC91c3ueMuRHoXSsbvXB25pbsQbboJln9EgUe
	mWPHukrenMvlMBh/czqGQ8Ij6KV4mJO5wWaiHmzsJgyD+4FVIE4Cvq0InwmpXzkj7Pnb/Rq0PS9
	FZizNtvh63SIp13y9M6i78NqG71mRlZL4qfEa0ZwbpDnsnCv4dSimnjdUzauXq2f4w1/LI8S953
	gDyulCFW8bKGW++8w/OIAxMyrqK8LMh0CDSPzjkRx8C2tkafOffNUn83A4E4tZ+wwsGkmeFP1DW
	RFaUyNRF22tXEUQLLDt3+BaTXJFwOeoH/nFjRkLGgyb63LiNFatwBtsIQGl39RtjOHfKg1hsYsX
	UbLQaguXc9E/7mULRaOchlEYIBLDrc9+UkPosX8s9ttPnRkalHO/unJyHnpw9G4TXnpGCRH5SXq
	9EnR0YLLxuaih3Wryh9yPn2fdjgXC1ubmhtLisKpowNz+0opX3I2H+k9KWB7bjKNqibKqlG/qpQ
	mM0l9yu3gxuj6DJmU24Y6pjqW9rb743WJTzfTS4H8Iy5sXbZXg2
X-Received: by 2002:a05:6000:41c2:b0:48d:bae5:41c with SMTP id ffacd0b85a97d-48e1e7cc62bmr10282873f8f.17.1792562524443;
        Tue, 20 Oct 2026 23:02:04 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25841fe4sm3427338f8f.53.2026.10.20.23.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:02:03 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:02:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: LiuJunyuan <2058432396@qq.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: handle zero image size in read/write
Message-ID: <athVWGRs0HoPO8uH@stanley.mountain>
References: <tencent_FE0C25ACDF20A06CBFD0651E7C4ECD7E5009@qq.com>
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
In-Reply-To: <tencent_FE0C25ACDF20A06CBFD0651E7C4ECD7E5009@qq.com>

On Wed, Oct 21, 2026 at 11:41:38AM +0800, LiuJunyuan wrote:
> vme_get_size() can return zero for an unallocated image. The existing
> image_size - 1 checks underflow in that case and can allow an invalid
> position to proceed, wrapping the subsequent count calculation. Check
> image_size and *ppos directly instead.
> 
> Signed-off-by: LiuJunyuan <2058432396@qq.com>
> ---

This one is a bug fix and needs a Fixes tag.

regards,
dan carpenter

