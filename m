Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6B8485CF5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873833; cv=none; b=mTW4XqoxYnYy1Oav2tCBf2ikETHGPwBL98plvolLsioB8PoySysVnUVXqF/DWUDE8Ks81rh0cdrOHxZwXraS8nfm7/yKHoiZj63qdlSENiZ8XL4Yv6M2VnIP7K+XM8nw0BFTBkLlzvG5Ud9xIWspK9JU3In4DeqsnknAOP6+/I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873833; c=relaxed/simple;
	bh=T0sTwhNjA7urD/dDmrUooY66jFkiBVRt4kMtyxZutVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YXjGYMu2ZLEhfhswWsGW8xYQyxcegOneNt7OO8pFfpv2WCwD4qT83foMD4ZVNpHOQNZoe7tBiIXgs5D9r8qkryHU51jMduEyR6RnRlrPs6NdIHEEfC3gQfQwh8T52ha1MQ8DambYSRrx+P9ZcQ6S0kJhN9FmJQjHEJIUGM9cipk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgJmCbKn; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgJmCbKn"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so40412555e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873830; x=1791478630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYoMqQ8ZvtqawNNIbF0bmVuGXHmouMQegpP9uov8hrk=;
        b=dgJmCbKn2J7tFK5YLxXRPxlTlkCXKnApq2d/sXYXbESRjlJRVpYK1eKy788j5HiuKh
         YOZHLzntfMb0sKROQBfdpFcFROEtARvKP2TqpPhq1bsTfJck1YED8afDqHQ/roumwg0W
         c4neKJYG7x1acgUn988kapZMHOAyrAJ5iOhMHOnma8PFOmFeLOf5vUPhdcxTWeP4KEZH
         NpcRgQsNpo7kHuTziFs6IcLplTc1VTynAOHUXK0hO2TdXHnkTYj4baUbGa2yNbyjH8kg
         Je6p67hgIMYV1AGF1cMdQk4Zpmpsq7QLIw+XHUzuvzRuumHf3icp0rnxdz5v/x6zWgdr
         RWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873830; x=1791478630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AYoMqQ8ZvtqawNNIbF0bmVuGXHmouMQegpP9uov8hrk=;
        b=TrxXmLOBXTuvfgX4TVb59hSXZw8C9soq1GyHftaXV1msXJor3lFBRGL+jkCrhX62Xg
         KxQ3/2O1tBX5br3Oc/f2dj/4QBlHnqJxcoQP7je2jE/BkJJHVYWKseLyijCragmtHZNK
         yYO7Kd/EAkqkZ8G/HHQy1/FE8SvveQ/RJCsONOtE3s7ldzs0Q2tutXz3GPXS0e673m6V
         sfAUsGH86rEd4sZnsbI38ITndBb9Q3v2gv9AvubKa1J8v0ay7w8Kpeo3M0eUZkcFglbv
         kv4UvQ80RHC74RHNGH0j8MSYrD71oAAAd1PjyJ7YIw8B564y7PeslKmxkd5LDD75jOXQ
         fcvw==
X-Forwarded-Encrypted: i=1; AKwUvBx+pQxbSv0smd7ijQ3FZr/MI2GuwCQAIR24hrNWgS19V69p1gXajNtsl0jgs+4KU2S/suV0F2bBA5t+w68=@vger.kernel.org
X-Gm-Message-State: AFuF++lPTpmyCXyW8LmWY1m14eUHfA2NbbGEnaM6rCKgPtxn5AFlLFTa
	yHSlxcsNShtqye+7r5cmZ/6rNXg40KzzXdFaJBf8TiJV27uLrMUOeQPr
X-Gm-Gg: AYBFou2ORI1C1e3YNnXa7ji3Sn4APF83zj8R+Dc3qmwtfeMZJxy9kCs5qP6yCqCwD+e
	JeCSyGqsbfPcaXsRErJ1uMNyZ8ozkv89/MDizDwonhkCEMioBO/perjar8D3mntUArv5m5IXs3B
	n572S6YqVDxLFU1y7E63yFrndQtee945TsIKBIb9na77jYsAGLb39xvOCFK5B+nUoe3Lr7pTYwj
	hXXJu6jCviS8P6CAbNHR/JwWsmlnWrqQ+Exx7/GjOvktBJV+6ESSByk1/skA3FsB71A9r7fQWUi
	cJodEEAfmU0mnFLmqiczJn1bZSM0z8x84IzI/QckZyH6jh6ZPKHfn03g4jyYBvd2BAx1GjVhZ//
	SBGX68KiDx+RtO+kVI2ynS27j5rb+NKsyzkk/C8jEvMZK4rTy+6JFMkyZV1NKWlQFY07RDF4ujC
	bh8fVolYy5UWgW4hYh2Odi6Hxw94SiACnRMf0U64/96I02Uv5QLhhXf3MpnQOtI1bS1nVM6H8=
X-Received: by 2002:a05:600c:6995:b0:4a0:159b:d283 with SMTP id 5b1f17b1804b1-4a0275857a7mr3761895e9.30.1790873830150;
        Thu, 01 Oct 2026 09:57:10 -0700 (PDT)
Received: from [10.2.0.2] ([159.26.109.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027906a11sm2044415e9.12.2026.10.01.09.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 09:57:09 -0700 (PDT)
Message-ID: <e5f84c5e-e281-45af-8d25-62bbf585c94e@gmail.com>
Date: Thu, 1 Oct 2026 18:57:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: cv1800b-milkv-duo: enable ethernet
To: Hiago De Franco <hfranco@baylibre.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>,
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
 <20261001151447.12076-1-andrey.lalaev@gmail.com> <ar6E4bQAKonCW3st@hiagonb>
Content-Language: en-GB
From: Andrei Lalaev <andrey.lalaev@gmail.com>
In-Reply-To: <ar6E4bQAKonCW3st@hiagonb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hiago,

On 01.10.26 18:08, Hiago De Franco wrote:
> Hi Andrei,
> 
> On Thu, Oct 01, 2026 at 05:14:47PM +0200, Andrei Lalaev wrote:
>> Hi Hiago,
>>
>> Please take a look at the patch [1] and the discussion.
> 
> Thanks for letting me know, I missed this patch. Do you happen to know
> if any overlay was sent? I was not able to find one.

I haven't seen it, so I guess no.

> If none was sent, I am happy to send one. Sorry for all the noise here.
>>>> Thank you!
>>
>> 1 - https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
>>
>> Best regards,
>> Andrei Lalaev
> 
> Best regards,


-- 
Best regards,
Andrei Lalaev
