Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794107553;
	b=O2Y+bwPaPTpMCv2nhvJRUnp7YdieXaFGJ7pLJvhb2aa8iZQEXEjnc++7Mk/XKxuEy9E3
	 gUwfG/N75mwAa8hArtfGLrsDBU4FeWeSRbTPzWCanSZQIBGCphJhJv+JJEiLqrRwl5U9p
	 6zuiv6lyIwJSzRQHFkWJgB2jGB6v7zQ7QRhl3/zDJeJAeOr8mafmZh7NPXaGAKTbX5JQe
	 LsnizuzrF8U909JbVOHP3/rWmBMHKaQSS6pr3L98Oag3mHpqV/pnGhX4Sq58Ce2w/CqVm
	 RMQAqGs2+3Z8wOd+ScKRev1N9DrAWbiKBMcy5UqLVMACsMyhdU7O3r+BGcK6lVGPD8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794107553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LHv2Pqb+TQyXv0BOVUqaNYmcgCOkpulObiMNqyQ/8HE=;
	b=kKul7nN+sym+Af4GyFFsIXpxn6MIYrLVahdgx/dwmcXuE9OwJdo0kFTejonxif3dZV0x
	 n7O6DWXZlDEQbgIl2NN3Es+VizBp6wvZtpePqZqgiva9yB4MgZYBBtYXjYWMS3J6VvmnX
	 2pRynbg/28oxQHhynuC46IteR/xjp18CAWbjNhKXKIkK5i0vk3F0qHdz7JAOeoTd/ZVda
	 MxUC1D/PGh3C3o3nHyw4NyBmHM4si+s1UL1rDaBt4PQQ8IWvVJUHRGmKr9q+MzFjOEchB
	 2VY/MYhNElnDMI1ogrz5Nma7Nl+UgPVydwo4bJ3KqyuFF3c30iLaCyg1txm92tpeD2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q+y03qxD;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295B7606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 03:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 295B7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q+y03qxD
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36f6295304dso197600eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 19:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794107552; x=1794712352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LHv2Pqb+TQyXv0BOVUqaNYmcgCOkpulObiMNqyQ/8HE=;
        b=q+y03qxDUYrNtsRLEn7SCUHaSjWIx2Zcm3MFoLzhheCKkRVFA1yd2sj1P+9B4j9hIc
         zOsVfLTJc+opcS+uD/hzNj57y5iUuGK2JhXuYttM3qM10ZxptkAWH4qSPdSNCyeGzB4I
         G0zhgUsJlz4/K41uliPObecTgGD5VtruXLvLEoQDMBLHPHrN7rphJwNb8WHS5VvCIO0p
         gSyU5VRayDpTPzfjpwA7YGzmh/jY3Yo4gkeqEQoFai9qTaU+nz8P7MZYchDwYL0Hs+/z
         z7MPi5UVuz49ZGdTO6AZD7QHlQdclML8M08/A69D55RyzRc0AAP9JdSwC6vkqZ2EqkNn
         Z5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794107552; x=1794712352;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHv2Pqb+TQyXv0BOVUqaNYmcgCOkpulObiMNqyQ/8HE=;
        b=zBVZVcfmLXWp+1qfDr2fhWO2bQwTaf9HQgP2V8K5Me/gH4mh7riOgPhgt0TH+DXApu
         YdBeklblVDox7qImNm/8N8k9Vm2N29WjaXN00QNq0oRfDozfnWWYuxzfDa3b52UrEH1S
         LE7XbxtmkdileglZI5AuQcK+xRqln/n7YsZ+O6EHs1fgloRSsHq8jJTeKwKGExGkt2nr
         2vdlMXVKQBU9YyrrjEfuRlJO9pwK1ySSOm2dpeL2pYhyU6lGhBRZ1iDL82P4HLSkZc6j
         0ysVfDQlvMCRTIDW+VbucskFrzbwvrRBXgS0XSQ2qodVpHY0ibIh1WaaBvQRjfk4ZOnz
         5ipw==
X-Forwarded-Encrypted: i=1; AL+hErHdAvoAFum/amLmxC7Fz9mpCRAosiUGsNik9SkJL5utM7iVCEnV4n88+JgyTNODDy+oMsowWaWI4T4GD/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mKYOoPwdhNrfw9ztbs8te5uUbr12DnE7/PETomn9zrR2+6Qc2
	niwn+vMP2oyp5Hi2pARXc7Xu7J6anE3UaqxgFdut4dIPN7oCjgrORoJt
X-Gm-Gg: AYBFou0n+Ka1v+akl1bMDGuWnHuK1wvcZf2PXFCn4enHBcpO3SM/gBFVOJDM19a9npb
	K/DbSBxJzFYi8OfqG8d8Vk04TIEZ5ntsvFnxO2vI938RYRmoA1w24t6rWk02JIKB+7CiLegeNd7
	5nOiL0gnczWTISr0HazHzssB/rdHlOmwTH1TywJ8/M5Rm5J95yukZcIatv1TAaowv4H67DpqkYr
	JQL0KZLWeqHpbdB3s/P/kB+M5QMCM1R9wLGzNiVvdCw3FDjGRfUthaaXCEhkU/NVuvMIV4SEBJP
	/+3HpiPPgrBWyHQeMNOumKEAVYHY5De5el9qg7HjC6WsC/3awVufBERoONBiERlboR42NHLLf9k
	PZDKlgjKoDSgJqEHeRToBsBmVTAD776F2m2JjZ8gtjzWe9ivxxvcFmd29H/cNw97306NrlufkxA
	ZlYq/0+OGmsbPFMahpdEHvmadPSM1HWaKIKJ+/OMg6NQQeRjoLnKc8wiNmpiQEj6viwJfELej8n
	1gE18UCNy9qj+9izy9q7ctRxqTqQXt4si9zFHWv1CHGSuOp9gboZkBQ5bzS7GbBvo/F4cXtX+tl
	bkQ/gtbvj0ZXJf1JjPgQ+sS89FEuEujQJwkjG6L5IIdwds9GUp+D43t4BfsnLdF/VLoPT9ZTh7a
	MhVkMbqg=
X-Received: by 2002:a05:7301:640a:b0:370:d7fe:6585 with SMTP id 5a478bee46e88-37256614894mr1378849eec.11.1794107551969;
        Sat, 07 Nov 2026 19:12:31 -0800 (PST)
Received: from ?IPV6:2600:8800:1aa1:b100:c803:e868:a462:afb5? ([2600:8800:1aa1:b100:c803:e868:a462:afb5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726039c635sm1998121eec.0.2026.11.07.19.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 19:12:30 -0800 (PST)
Message-ID: <097af97e-4d8a-477e-8eae-89f3fe485dc1@gmail.com>
Date: Sat, 7 Nov 2026 20:12:29 -0700
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
Subject: Re: [PATCH 1/5] drm/vkms: make argb_u16_to_RGB565 round resulting
 values
To: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260928005301.367977-1-matheus.aalmeida@inf.ufrgs.br>
 <20260928005301.367977-2-matheus.aalmeida@inf.ufrgs.br>
Content-Language: en-US
From: Sidharth Saha <ssaha2000@gmail.com>
In-Reply-To: <20260928005301.367977-2-matheus.aalmeida@inf.ufrgs.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Matheus,

I wrote a KUnit test for argb_u16_to_RGB565() covering zero and max
values, the channel midpoint (0x8000 -> 16/32/16), the 0->1 rounding
step for a 5-bit channel (1057 -> 0, 1058 -> 1), and distinct values
per channel to catch channel placement.

Without this patch, the midpoint, above-step and distinct cases fail
(e.g. green comes out 31 instead of 32, i.e. truncated). With it, all
six cases pass.

Tested-by: Sidharth Saha ssaha2000@gmail.com

Since this rounding fix was lost once before in a refactor, I'm happy
to send the test as a follow-up patch once this series lands, or you're
welcome to fold it into a v2 if that's easier.

Thanks,
Sidharth

On 9/27/2026 5:52 PM, Matheus Alves de Almeida wrote:
> Currently, argb_u16_to_RGB565() truncates the resulting channel values.

