Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794208915;
	b=ctT7GG3Ygyw1x2+H2ACM8SPnCBLeyPYPFpHpVu+toVQVuljP5kHnFg0Oh8O8nHlfn3so
	 tIRQ6u0h1rpLC4sg/nSUtOFtx3EEmDMKHDBgqLK6LD7jh9p/QXisIKLFx1mWula/d6B+H
	 E28Is4lMdKQCeAVAE4IY/rh9Umd3kK8kVxqZVdALtZMMICCKP7Y3G6kkbYzFqu5Zezll0
	 I40T9+OF1BkYjzQCZS2k0U8wRYPgqqNBIqs0hYma1upcfrJjHUHW60EeAR7TJNkS3EpKq
	 GYb0UgHyYk7dewTQyJiT5ne/1BX5R4yap5+IlLPv0adSfhV0rMSR1qW+OtRYrO9T9rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ATNZbk8m3Z0iLvwJh9R/0PDOsfgpSkjXKD1zTTxPL4Y=;
	b=jNizFOoSw5rn9vRj/KrxZKvE+MfSBJ70nzt+F4iMCqhyVs1QYW05/TbgkbzqkFHy7KGy
	 8aK7kTNaeN/3A/pNP07IPcURaY1c93GGoiWTzUhHvCRUaUK2/39s2bYlu35YCdoTxdhwV
	 XQc7s6T/ElQBreAzgVPsc/zdhMbgAYDqfm0jeV8MkdulFGMF0rxCFQoTEds9rTq6nVhCp
	 OkWqVTPeQy0hibg+8yztaIrAFel7/qOaV174jIVF4S3ZR7zoeFxa0vji0smZCIns3Mduk
	 nTg/2TrA4nFOogmnBxYmKJmCF4ZCsuLPJKQAMtMEawIRmC/+tjHkaHL0joH619JSyFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h1GPqjOs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46521606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46521606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h1GPqjOs
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e987b4a710so2303695ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:21:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794208915; cv=none;
        d=google.com; s=arc-20260327;
        b=PmnAQhst6UE15eCAOD/T8XcbcUPrlTMVtEpfls3Liv2/E/pqGSs62hdwXjIMQ/3phn
         tCjkVUfWuj/MPQCqSxL5BsHpOZDIARgA7d5i53LjKz1u5dCDdZUuYxdsPc+I8MNPWwAr
         EYl3En4RtABKbGRKn1qWiQ097UmT2vO86rzelQKDsWIjOD1MzoZC2FikQO+SgcxmCli7
         RJR+mAKZjhAXfSlUF12y4Fm5ba+sqNcsrzgrG1r27NIt1yv691imiDIYwO7braygfBUb
         tZRUJECVmXoCGetirAyGbJWfdFAp3GnELYwGA7+wPlKrJDGHXwwpaPXk46/GJJjrSXyp
         22Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ATNZbk8m3Z0iLvwJh9R/0PDOsfgpSkjXKD1zTTxPL4Y=;
        fh=vKtB82slThwthyx2pS6t+m628Fu43Es7c/Qv+lNNoMU=;
        b=UMF9i+fvaN+ClwShvdx1kJoY7UWVnKkQo8NpUuWyFQ2Lw4rAgOnj7Y1DE+tk4jMX53
         lGiUVveOvDcMT8he0g3/24ndPpIISFi5FgslziLEKG+TZdEcmnka7N+S9ZN6Zyq/dErZ
         rUVrY7r65Cn8waiA3mz8gQxbOWLcUSZqkjXHCHB9iUhpXKreXbgNNGJCCbYpS/EJPcCK
         no8NBy7XM9ESmI6faVFKzKPwlrwpu2BWP1940STo+IfuLhiAK7o3vYfDsc2NRPfv4rvz
         aEdDxmO1N5xCBfxM3lv2oneeru1fYTIYp/AZQkCbXXfwVYDC2jcXpVSVwvFw7EpvXdMS
         S91g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208915; x=1794813715; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATNZbk8m3Z0iLvwJh9R/0PDOsfgpSkjXKD1zTTxPL4Y=;
        b=h1GPqjOsz/tCFk6EBkO5pH/mtjgHWel9gZfd+qu8gEACM6+aVxjcC4cgB0DTaMXr5V
         X5IIbyloeJYMwGehY4hEA8S8UZoEAOF7q9bW7JjTPTbn3VBtRmaeel7qyKIrjeI5bFZO
         yuciy56WSdgN/E8qznJ7HEnuFOFSWiy9wqo5Rka6EjokAD3gg3VJUo03i57lLimHQUgI
         tJjpsnZr3QQLbOCwlmR3Fx28sNoGcM5lQyVewpABIt3+HEZ5t/GQVTgdL3mp77wkIbrq
         TlOt2eqcD/jCtPUP1U7QkPvTzZQeE8tlxS5DsVCxNm5kYT+ZJT4rKMBR5MVxeeK7OAuL
         /ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208915; x=1794813715;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ATNZbk8m3Z0iLvwJh9R/0PDOsfgpSkjXKD1zTTxPL4Y=;
        b=VAUmH8QRI1gzCJaHiZoLZS+Yi91f+GtqlAHcIB/mwf3W+t/HtwfYM6bdSzpdDLjnHf
         3zkNZ8BG1HxUIDtMLh2aztnR1Ne1d29XyzlgZam2w/dqpwSDmjI5yLZAZ1oZfCjuQy8Y
         LWFoTk8U7UCqxL8VD37oR8Zvg7IcXsbnRc7w8eBTjpec7T0qKs7nIq8feHTUp1qeU1rh
         Vpi/xcitoJ/PTWG8PHzqyN+0E0ZgVD8FztO4zzqE8H30GUcIg6lASKa8Hzs9tDFAxDRY
         GtuBvapnD9LbzSmbwgb0uZPQAjJbFPjGdeKErpP9EMUhLpJnQ8p2HQ6IOsYR8zAxoFX/
         9rfg==
X-Forwarded-Encrypted: i=1; AL+hErFtyLOpB12M8LF1IgEqvMyfaWvwqMIGVh/FdQ4Vp1Mm67Qt64p/4TII69s6IYWfbxmaDLY2Mq+jn2UNn3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l88Bsdn/TvYEtc8zbT1FHSrBugUe2nqX1+3pgXh9i7/7HPxq8
	gHnKIZ7gwtCFbkIEfj5ExRVe5k4Olji5DIMlSUk6zc5kIf7mb9iB2oKxZCFLLFGpcZdnzJDEYGk
	elM7chrhZHpy2Oyxg8Kgay5laf/lISYs=
X-Gm-Gg: AYBFou1nCg96L2lgq4WVMwfmCgIM7xJtXTzXo5VFUNGXcRbAXltCa0J3WeDPLZ6Gr9R
	4Ka2vat+A1mT37+uEi/fjDDMDNwdB1Wc9XFL2MF9Jm8j+xzk6Oage++g4EzdhZMGLMVkov5oytL
	Fd23eH9HOFR0qFfdI+JK3FYwkpTENlTsgCbTeO5keIQ3Y40AD1kyInXJmJW3+fBEj0tb6q32xmZ
	oEe8w/+5XldvOilBPIrWtwTEL8L3m5dcdNsUIITIP2fMex1yrc+8Zks2TAci93SlPrrT0y57M9J
	WZkCJHMnDW+5C7iKu9oY4P1+fOPfs4mOtQXDo+R5TN1K0UcWS0vXUqcclVtznFq+wAXw7/Zwk+W
	vq/9gzWVdhU7yLqCaZqv2AA3Qlk+iM7tZC9sKEdpqKVpGChgUh5Yn//kWbn3oKIflFNBVm2QShn
	3NQhJM0/Dvb7OjZfC4bUUd3OilTj8NO+CZnRyTtINJMt5JmVIhcWqfDrVJOEQhzQuk6y/phw==
X-Received: by 2002:a17:902:c40a:b0:2e5:cd0f:518f with SMTP id
 d9443c01a7336-2ed671fc98amr43058145ad.0.1794208914572; Sun, 08 Nov 2026
 23:21:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102100031.5573-1-phucduc.bui@gmail.com> <20261106193208.4136410-1-wbg@kernel.org>
In-Reply-To: <20261106193208.4136410-1-wbg@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 9 Nov 2026 14:21:41 +0700
X-Gm-Features: AclHuK_GvzxanApqj_qZEY7vEkrkEWr44FH_wFftNIfTWMnEUrAcqCHwPdCxRLw
Message-ID: <CAABR9nELsefCssH=KX-KX0FhvWuDO77WhrsdmChfaJyjpMhRCw@mail.gmail.com>
Subject: Re: [PATCH v3] counter: ti-eqep: use devm for runtime PM to
To: William Breathitt Gray <wbg@kernel.org>
Cc: andriy.shevchenko@intel.com, andy@kernel.org, dlechner@baylibre.com, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, m32285159@gmail.com, 
	nuno.sa@analog.com, sozdayvek@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi William,

> Go ahead and submit a v4 addressing the comments from Andy. Submit a
> follow-up patch as well to eliminate the ti_eqep_remove() callback as
> described in my earlier comment[^1] in this thread.
>
> [^1]: https://lore.kernel.org/all/20260604021902.891327-1-wbg@kernel.org/

Thanks. I'll send v4 and the follow-up patch soon.

Best regards,
Phuc
