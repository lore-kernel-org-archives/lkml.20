Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997773;
	b=nB9YnGIqXh13jxnn7Nnxs3Gi5JE0fW3FqAetzkTB8wNwgafzSzFmp4vqTVXg4GeSOs44
	 1yvjSjdHikUeK9vSHQGVax5b8K+RuIGQ6UoCkCRZawiRTi8Zx6t1ECLyB3Cozf5PKgwOU
	 wZ2dCl6tqlk4irm8EiHQ+mnTaULgEefbxAzWF7eOcJ22vOVKh1HIct2SOb9v8BSS/7433
	 380tJ+eC47Pf4a3Y9FBNBnUULk/xj7bU5VoS5dXcWtk7St96ZCuS3pOPhHBXUZWqkXDcT
	 dSzn4kTIgO4/UYrK2jhIN7CsKZ6iuieZKqgFKNrxglL44M0HyHCQpYCTTBT6Af8itoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=XUKCZGSOsmkTZezLt/menhKq9E8Hwz9jGRuCv99W484=;
	b=rCa+tb8sceQnC9Komz5inMakkJLIzARToE8F6/Nu/zXmtUN/B6mrCCesDYxbUrKrYVfd
	 Jv7x0iywfFbz5RQ6JgR9u7QrG4wu0F9WxNFUgdOUtOmbAphND6hmR35evVIj8DqrMs4ZN
	 Zn+vAS5Sh4auQ5KtP8rnG46LoxpCR38LnnNAV8lCSZ10DTbDHxQHUv8yzxxLTKRO4jszz
	 qQbkgloErXPavXxV4cg8vPeBEXht5s28UanfUrwZ7zQ/deFV9KW9YlmPuBCh5CM/A3mVf
	 S7B1r7N4rLPZO/XKAroHVvRaj5KIKnVTtN79Rl6+0USwixmoUX+rdGmoqqDaainoV7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VSHKA3+s;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84B4606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E84B4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VSHKA3+s
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab3b29a210so24777581fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792997771; x=1793602571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XUKCZGSOsmkTZezLt/menhKq9E8Hwz9jGRuCv99W484=;
        b=VSHKA3+suo3d9YLZr773XYMmGQzlx/2b0Li61/sGho+eLgamx1iYt+chK9NcWE0eHm
         krbcqJOs6wJYZqwFR6i1QJ5yAUANiLAdUwOnpi2DoV0fJeklyG7oHa2Hsvo5/551faA+
         KnGoqjnlnuUCI7QErUVT7YSCdH9meYgaiQwPy/u8LzfKhm2vLH4T1ZC1l3RuHoDjyzU4
         mOFxQHJ5wkwj9SZ3maQqJJDHcT99q0dkadv6mQegg5C6iyfR8TKVDWPV/X7f53VSIJzL
         2tU+TPLIY9Mj2qdBHP6hwI8WR1HTtXEA728yKW2FCfPfzzTAkw4KQ63VTclbrUCToee6
         lvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792997771; x=1793602571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XUKCZGSOsmkTZezLt/menhKq9E8Hwz9jGRuCv99W484=;
        b=trpbWrT9/FjMOfeZ5rLj9SbsjyYg2uUx5gnRDZX9Cr4PgadpZqHVCai7c1jvyVG5Hx
         gThHXOexMM8/PsHHK4Z8X3U6q+Am355i+QslI3E3AWO2Dxa0+ttKCJkPv46Dr4FkmkIf
         8fcrKvYk51UM8/eNoZw5E0YzJC2sI9LtPbg4z5MWGG35wukkJRWUJtFI//BErJzGx7pj
         HTpwQhHxDj6pUjopkQ9mj7uieTaBkNYVzDYAUsLtcQDkc7JrxKr8lnlvRz/khtfGmUew
         lhD4L6j1hSI/41iYftcGaGrg02TiyZ/bH+aAE9Ns5VyCS4sOTMqIOczvuJsU4L1gLa0Z
         4bbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTTFn4U66f3dfdEwmY2hMeUSqMFH3TC5rz9E1qpg+q5DlT+DkpdhJCezTQsOGx02jd9VxBwRwb+IwdYf0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZY6G0/NWNjQTeu7Ywnd+/RHTaROG+qlkPUtHGNL+LkYrj1DuX
	7USSLI5FK9hmGLjE65iO4IqnAoaoiiSBa9b8++fVax3uy99YRkRW6KGvi40puTklkWw=
X-Gm-Gg: AYBFou3uW+OWYEvhnLU4C1OmLWIYOpvFYjs+e8nTXJQs0FIVW54Jl9E+9OJge/6dUU7
	6FoV4ICJ3+2Z+FCakgk+1i44Ddo3fEvmipq4AwGmx386Bz2Qm2NOAyTVbddCqPjk7fkdM/ay4PA
	goFJ8eth/Vjlu2DXiFkj6KgHoVzQd2pyBhjI6fRSe/1kM7OjgyNgVcXhoJXL+pyEqKMGi83cxnd
	vqLTnPvwH59HiykE45HyzJcxalxauttxPVhvpv7mFRPj8JkU2wDCZ8v7Dzb2KVT1u2WTJ9HifCQ
	vlevkH9o4jddqnZt7cmTvZN/YkX92VY5Ynf+V8qqjXsLGLI749E1RAA1e1ZC/xUQPk4CeLMjHm7
	tEBKRKvbSuZqJNU3HnmvFyA540BYFKe+Ziqe1SIl3nmojnP/1GTyqMk8awLK+jVQqOSk5XJEV3l
	OV+yK5QBxVvnEn8C9S6gRWwVKYHfE+DFekXqZDYspSxCMnQjPb3jJQxiH5hZ2SrUjpzobBpXUHJ
	2nrXLyCu58eBIPdm0uuvmxZ2AZTc83Zik2neUheh3Ky51YlZ9z22p3inekgMqepBaLBLchh0H3e
	qdqAm+iDfa+UkGmqZC7js0jkvezWYvkwDnrj
X-Received: by 2002:a2e:9816:0:b0:3a9:8775:5f11 with SMTP id 38308e7fff4ca-3ac6fcbfba3mr9796481fa.4.1792997770891;
        Sun, 25 Oct 2026 23:56:10 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a6b051sm1356960e87.14.2026.10.25.23.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 23:56:08 -0700 (PDT)
Message-ID: <24bf0964-dd2f-4688-bbf4-cc891c674d3e@gmail.com>
Date: Mon, 26 Oct 2026 08:56:07 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/28] mfd: bd96801: Allocate watchdog IRQ resource on the
 heap
To: Lee Jones <lee@kernel.org>,
 cover.1712920132.git.mazziesaccount@gmail.com, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-5-lee@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261021121245.3111563-5-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/10/2026 15:09, Lee Jones wrote:
> bd96801_i2c_probe() declares struct resource wdg_irq on the stack and
> assigns its address to ddata->cells[WDG_CELL].resources.  Although
> mfd_add_device() deep-copies the resource table via
> platform_device_add_resources() before bd96801_i2c_probe() returns, the
> shared cell template and the shallow MFD cell copy attached to the child
> platform device retain a stale pointer to the expired stack frame.
> 
> Allocate wdg_irq on the heap via devm_kzalloc() alongside regulator_res
> so the stored pointer remains valid for the lifetime of the device.
> 
> Signed-off-by: Lee Jones <lee@kernel.org>

Does this warrant a fixes-tag?

Other than that,
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks for fixing this!

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
