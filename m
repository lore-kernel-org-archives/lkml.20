Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300814;
	b=Wy5fWeIRUl+Hh28TR8wS5Wi7zjJBpJTpBtlMMdmP16EAQnuK0WJIHlARDvg4eRWkF1BS
	 XtITdD7Y8fpNSpqh6gMruVZfg5+TlkJ+sJ993zmL7F9c1bUD6bqS3Q32s8FScSKdve1R3
	 JAQwzePNWv/w4iSMmSayIjPwjUHML0ZObILfXAI2o8fVCMNGfYH0+07h1WS+MreF5BfQm
	 Z66YQrQFqRL6rWIcbRNY4qNLWAivi1/SxT0ceds7WUs0TAIbUy26C9QiS84aKlLf7809c
	 PwlqRmoRp9q1ASv3pNjfatoqeSp8c4U9te3nu0XqIv8ftLdc44Pl2o4FplYA62Wll+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=EP9nzlx+H2sk50SyAzN5S+n1xSKA5s/U/jjen9Qb6t8=;
	b=phJiq6ZlHF1pHvSlFDJev+TZ17MMluyDxwL6D+b2awqfE18PJTCtkVLPpM+OfYfn7bse
	 Mmv8hcqzxCjO3FzCg6FhRMPjMj1CL31vcgmc1a3jtTogTQVybLWInibBszmB61l4wc1Yk
	 vXW5SgQdGN7v3KWbPGqITnNecfqSgceNEDXrVWGZa2RWSKHgSLvTB883D+jl0afDhZtjT
	 LWr2f4QCcIQxKBCCgYv0p2XjSpxZlzm1vQYYvBRSR5Quyce8humgC4WfSMH+03WTJeXE9
	 HNlyxJmNCK2ejJyyT6Fp73MZVHf0lqnEAS9uZzIu/E/Fpaji3uroUOl1wskXH+5gpvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUCGZhLU;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6053606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6053606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUCGZhLU
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-353804b591eso24955eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300813; x=1793905613; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EP9nzlx+H2sk50SyAzN5S+n1xSKA5s/U/jjen9Qb6t8=;
        b=sUCGZhLUgkrJa6LcpnFAjUi0KZ0UNBhyd29LD+BS3JUsrWzKFXGsQlqTNkLltIqiSo
         mfd5wLdi8VA4TV/rYjdALme2PysjVDVvV8BFIkQK9aCCr6rk/jIMEZe0m419NR2lo1KO
         webr2YxaqRMbHEQV6WaaTx6SlasyGq42m90aeBfL4X+FgrYcgyFMKSWXjRMfBTuK8QAh
         0jABwzKWmMj1hqeTVp1qmfMD2MeeG04Pk6VC4V/evUvRrT4106DBo1xZv9OWmiyqG/uE
         waTnra9hzwxe7Bj41TjMpSjVngpTD9zBZ+fxtcB8lmqgNrAJGEUiah3IHSkZo4+oDu7V
         0yXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300813; x=1793905613;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EP9nzlx+H2sk50SyAzN5S+n1xSKA5s/U/jjen9Qb6t8=;
        b=y+oFwxIPU//dJWIUbwgXgRI3BjB4BioL7l6Bbm2dADdsz+Mm3AeI8RwrpIsLwUPSTh
         lNWqwgwbLQJA/wYwUMbIqqUlGnGB6WVmbgSGKXmsua1tPndwEUhweT02Hxsp7x6HRkJT
         sik2k9m0u86GROmxt3b7FcEY9d9+A9ShWQe6TjfVst51gERb+qAy6E/NRUUeoHQsI2Z1
         rf8DTe/UKYfzlGp7koSTMBy1m7b5v1J+s7/qc6Ep5XYe7Ows0ArR6+7ivr5nunjfYdoH
         OgFEByMBOBta5Is44MQNM7Ra0dIKSXkDzdOMkbNm4FUtwFDbrhKE97A+20rfKPwDOFm0
         VAQw==
X-Forwarded-Encrypted: i=1; AKwUvBxBEicPlpgeSNVwjWHxChXmMgxQzL6OBnxDM+bFCtMdizdvz3AftKMmyVsxtZAMPn/F7nfOkp/Yn5MzbF8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqRr3dKoisHFbYKKMdrAbD2see4GjogKPTVkHFQmZobxlytze/
	kbatUW0XgIh90OrZVEJVx+TbP6xomB+hoA2fNEaharJgy0MZmVKtwpFc
X-Gm-Gg: AYBFou1H5gsiYfNW7ZoBOZqrimTwOx6VDYMPr6uuKoVy9gzOj6Iw2PVG+YI4n5P8r6y
	OqGqkvI7f/zmHcU72zWWOWKIlFIj7NNzJX2Ezj+V0zKnoBArG5gSefc5EzssxWP769PkbovhFch
	I6XUty/YS/hJhmVxxLI56j1iuYpZH1W0iplE9pIVTd4m3YexZN/xdLUWHyogL9yOfSdsvb2kkzs
	qB0mJyIKMLg3yZ6uyjwlendJICc19OxjidZQa2BahGtrup+bGT0GKXpJg9udTcBMp/w/b9z/3U9
	BtG6WLzcrcwYIHXx3tgdtasfhKQBASGzrrC9JrHxr9hZop1u/rJ5jdCZoPgZVH/psdSt8D+95fb
	wR/LAn9yDojLhCEThgNnqs6cKC9ZT4uLXIfV3rQsQVyJR4gjqMuA9GLXBi2imKei89fmHFaI6wP
	7xzPydMQpqrxVfT3glADzwcwqqzEkSVLAbSgMBBH1gscXMsekjinR8K84tSIDyDXGtY5T9O8YXN
	vRoRtcdAD8jkBAWal5RtLQbkseZwe+Kl9FNWwhr2COR2W5Gdbks/YGji3J7uJZJADPvL0tEK5ZX
	/eqmyrKAxVEX5IIz1NoZZLEh666JSZLTKeLIa+qLQwPQqiEJn5jZNVZ8AIAK4dRHX/+bzw==
X-Received: by 2002:a05:7022:ea8b:b0:1a0:f970:4f5d with SMTP id a92af1059eb24-1a6ce4ea2a3mr7493584c88.17.1793300812571;
        Thu, 29 Oct 2026 12:06:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:2ebe:8:8310:80a5:1043:3f70])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c2e9dsm766922c88.9.2026.10.29.12.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 12:06:51 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:06:50 -0700
Message-ID: <a23c924469bdccf3417141c904713a6a@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 1/4] gpio: sa1100: register software node for GPIO controller
In-Reply-To: <8bc1c573-bd4f-4dfe-9d7b-8b17d386ada7@app.fastmail.com>
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com> <20260706-sa1100-swnode-v1-1-332759bbd930@gmail.com> <2a561a27-a3bf-4cac-a4dc-bfbc5c859f45@roeck-us.net> <8bc1c573-bd4f-4dfe-9d7b-8b17d386ada7@app.fastmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Arnd, Guenter,

On Thu, Oct 29, 2026 at 10:26:05AM +0100, Arnd Bergmann wrote:
> On Thu, Oct 29, 2026, at 05:23, Guenter Roeck wrote:
> > With this patch in the tree, the qemu "collie" emulation no longer works.
> > There is no console output.
...
> Hopefully Dmitry can spot an obvious fix for the regression, otherwise
> a revert is probably best so we can leave collie working in the LTS
> kernel and not spend much work on that.

sa1100_init_gpio() runs during init_IRQ(), before driver_init() sets up
swnode_kset, so software_node_register() crashed dereferencing a NULL
kset pointer before the console came up.

Only the GPIO IRQ setup needs to happen in init_IRQ(), so I posted a fix
deferring the software node and gpiochip registration to
postcore_initcall (verified with qemu collie):

https://lore.kernel.org/r/20261029-sa1100-swnode-fix-v1-1-112f4d83d191@gmail.com

Thanks.

-- 
Dmitry
