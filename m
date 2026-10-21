Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573268;
	b=tIFBisO/P6XdHIOSi1lj1umttP/qAs0iPgVUy3R7tKN+wKdbnwcQ+f1T0MNjy8PrM1gS
	 GGUhF2AQ7ciVVqRLJHemNwJx52gkxNgz3Lv7mhjnYjngwIYLsQ1r6xjGvZWQZEFqHKypd
	 Cypoxmu3Ja5BnpTY80Es87LzNQs+TFlkmCWwTDliFgVs6fEiZ+tZURNySlHa1ZDO4TrYS
	 3XyvPjK1J40Arj6D2G596tzLY5HkLzbjl6pQyBwMShltet+pUzKlUWPRYUpL3U4BcK0X9
	 btSbjNKFh9Bhp3N1WQb94eBvO55Jr9AAkw+5ELrWlApqCPhsVQ28kdBkQ2tKnDdHZgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0CvtnevARTRbuMliMhrk92TVJaPzyyAEelWrOhCsJKU=;
	b=oEPksxsJydQoFSQZmMqFdThTEr0fsPqbVLSL/PfhxJIIUu7DRjL0K99mMpziAGPiJXIh
	 rp0SBnfOKsQ5qjZ/jvlZidkhnfsJDUk+MRCt/ulMM88UiQyBfN7wcpcBYnW+CTI4XAYn5
	 gV0e4HMOB2m0O+BRJIgsGKfT6+lXmI4AYTUc842K6gwiPxzWkmuIrhSHnL4Vmxf+GI7A6
	 UvPsHYkKrvLn/9slBGxnAhfrUOKrHbtfPqUpC3D4QG0YxQAJ1PZWzEcWSAr/WV+spnxtb
	 /eiSAaQuGGXE08cn6eI2uJ3NDZoouS9k5hwqn/m3T7zbxeDPUJ1KbzXQlbYTneeKEmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p36Ijg5k;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B42606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B42606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p36Ijg5k
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so5346115e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792573266; x=1793178066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0CvtnevARTRbuMliMhrk92TVJaPzyyAEelWrOhCsJKU=;
        b=p36Ijg5kPuqbbyD/V8hhVaxFL4r2NYyXfG1UuVo5kDW0m80c8r51xU2mEDSDOWlF/b
         BFgBN9v0LJ8PiVG3qFUTyN7jaLLkhl64uh0UwEDfwOinEPHbk3uVXcgg4a9Hr5osN/f9
         1sg7JvDQK8e5PKgQi3iAilxM5Qr5uOsLKMxbFz0llxd+9oLYhL/1yk65nwB9bwohvBlU
         fVItI6ljunAzQ+gW9S7IJOvh28s5WWIM+og1S3aZD/6+bCOs7264QZUUqYE33iYcGXAT
         +svSrRCEJClOzbgL1DBUHj3ef8yba8rbAyhJ5qLxusJi5mREvtKPD48fL+7Kp83t8lmr
         nJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573266; x=1793178066;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0CvtnevARTRbuMliMhrk92TVJaPzyyAEelWrOhCsJKU=;
        b=UflJvdzkIpLJ1R94sPQrEtghZAaaIHIjKCXWSemXMnEZ/ZkTqCQL93ftzdOg8PXmOb
         FUfksfjkC1P20vRVH/s5PHn8lxkR9n9d/PfuxVWbJjONOqwzyYWk24jHw1hmoqXesCVX
         CTD1SgNsA/ZsxAj1OGjsxz9aKBK7qUJG6Knr9aS2r2G2HoqB1Qo7ttSXuUxI+PLICWZy
         FYr4xHoIyrEU8YtCi4vZxS3bclWqIN4VRKJ1nzTzGJqZ16QZphrRnSEJ24fFXElwmaQ+
         gT3I0Zrqf9MMI/cMSXfNVOuXToKH9KGG4g/iXlXQSBXK/wO7H6eGmYHLSdd11aRejZAv
         6LfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdS+gVBh3IgvUkKcdzZrdboFv+4VbGHnlKv7ekv+O6gIGVbcRgEdmzt/HHIcHUiQYFyPBfBV0B9GyI/dg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJooCBBo7ePMZQvZrBbhWOuPnM+vk86/pSw815LhIx9xnRZK24u
	XgNYZKPCrOxxkchfNVuj26dcwDyE/tgJKJ24qgfyB78f5LO2+sDIKNsG
X-Gm-Gg: AYBFou3EIfqIodbcuhUZyCqz4ITX8z1DfbqNOedyKTHhCzlAgomZ21M0c9U50VIu2Mm
	n8L1Im+nTHn3CF01LGLZasX3xtnUqhHij79LoETY7D7U523Rg4enEnpe9Rv0QIPJs8mG8AJtNJe
	naBIxcKQLIuuSWRU3hjDe9vHp1NNi7ntg+G/d3Fd34ztfIgpUUz6rGrLaerxYPmp9GUtsYzivZf
	9URsm3M/DeuFW+OGoPvHTj01E0tpKMaMkB5hLK1+sjmynTUT0avQem1Oikhtp7IpqpcvEgbM2W9
	00YXM3iX2ZVYjGFChBNj7p3pu6mqMVRgoyZ6es2giRCsOuOu9zltA6HJakLT+iQrTmUp1jOI+5t
	DhWMsl3wvPZQs2nWSl2V5lxNgoV5sOWi7q9l+keGI0zTXu5JLdd36LeHf5x6wEW3glBhOlecJau
	mdqjDrvLobQVEuOE0WeaDWgQQa9D1MWqq9buDAJd+mwQwKGKKqfFTn1BiLVkbPTBvYEuPhDMkOC
	WJ//Fi6OoRoKV/DuaySeVjThTREoEzM1R1TEu7FW2Q6xBe3BSZARI4Y9oJGuFrAFvaXuu89oMti
	lnAepi73UNDZ7T/U
X-Received: by 2002:a05:600c:46d3:b0:4a1:97c6:d2e8 with SMTP id 5b1f17b1804b1-4a1fdd234a6mr27427875e9.32.1792573264449;
        Wed, 21 Oct 2026 02:01:04 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f69d9b1esm110340935e9.7.2026.10.21.02.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:01:04 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:01:03 +0100
From: David Laight <david.laight.linux@gmail.com>
To: LiuJunyuan <2058432396@qq.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: use scnprintf in
 tsi148_alloc_resource
Message-ID: <20261021100103.38338356@pumpkin>
In-Reply-To: <tencent_F5EEA06B3CD49F9EFF5C185259BF4134DA0A@qq.com>
References: <tencent_F5EEA06B3CD49F9EFF5C185259BF4134DA0A@qq.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Oct 2026 11:13:49 +0800
LiuJunyuan <2058432396@qq.com> wrote:

> Replace sprintf() with scnprintf() when formatting the resource name.
> 
> Signed-off-by: LiuJunyuan <2058432396@qq.com>
> ---
>  drivers/staging/vme_user/vme_tsi148.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
> index 9447c00bc013..a0a7c8341995 100644
> --- a/drivers/staging/vme_user/vme_tsi148.c
> +++ b/drivers/staging/vme_user/vme_tsi148.c
> @@ -745,8 +745,8 @@ static int tsi148_alloc_resource(struct vme_master_resource *image,
>  		}
>  	}
>  
> -	sprintf((char *)image->bus_resource.name, "%s.%d", tsi148_bridge->name,
> -		image->number);
> +	scnprintf(image->bus_resource.name, VMENAMSIZ + 3, "%s.%d",

That looks like a very strange size...

David

> +		  tsi148_bridge->name, image->number);
>  
>  	image->bus_resource.start = 0;
>  	image->bus_resource.end = (unsigned long)size;

