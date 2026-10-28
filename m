Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193198;
	b=HN/zl7gCHCSbcQEDPKNVPikLiGvmMSSngFKgWacwB82edC1WJZ4NqTUJyiyg6Kwdyr4U
	 WJJ+E20s1H+8OrlvUQSbJzbCMPXfDkjtTncoAYEicxVhegVDg477W7slAlHU9z4l5wW+m
	 8zRpH3+wR24oRtXZq7mU4phNEh4Qik28av/nnhFt1h9eov4Uuf52sU3XlOKijl631SZG7
	 OukL1cJx4xi6Af/J7WOeBnleEoJZzHi6DcSBPSvFjSdjlFtV0bhdZubnnP6fBTN4odnuH
	 8owmkqcXa+tdUXtN7q6V6C8wuJ9jN4X2r8KvxqepLwyIK+pa1hIJ/qp+0VNyMt9590Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dOD5XrVmD6y96EgRoiJnai2L/0L+uuMS0Loaa0UEtIU=;
	b=yWtQu/QaM7PtAisvtA1EIhTpzz7hh4Vo533ftOYd3LX8tI3B/PLfMulbYZHo7TNUKyx0
	 1+jbbPBC3IOTkiJJe7PkObH/+8yYxyDurq3HsFoVbFp7xLdCQy6/0se1de0IRCd919sf3
	 a3amYu1LN8rtAfTDUUNNBfC56OP5PU6d7xZ/G1H2QdkxdgP8OzomNfn0/f1lxZ1p0CFrU
	 A+4SI3ObuBi+aKfit/nfQjOr1TK+8/OKjrjcixaXZB3vkWea5KmJcmwvWyjeWXW8QrjAA
	 XU1qHILQY/RQLITKKUOqRI6vo9wT+TL0mc5YmmTIS8Fjzmu9IEbwiFqdiZvW7zzKWbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLTSWpg0;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D03606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9D03606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLTSWpg0
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c43fbcb4393so143678366b.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793193196; x=1793797996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOD5XrVmD6y96EgRoiJnai2L/0L+uuMS0Loaa0UEtIU=;
        b=TLTSWpg0QcRD6pnmJMdorrNNTPYQWxfuLalj6YWlBuppGwMYXh5fjlY86FNeDGDPhb
         m56OgCQ/yhTZBSXXAiJSpuquO5oQMWdsxhmDpxUAv6liWDwFoUlr3HCJR0QoFE2K9cO3
         ieYw7hr8gnwhk6LVH1UVXhlGffImDvPGbzgTcS3cuH2Qv82F5SP3CleD34rP/RM84cxQ
         7a+4Ff9EcJTIu6DK+yWr8G2A79lfS6tr5qidoFRJ4fEXddgTWPx4GEkUhio5QWEf7FPE
         XQJEA//9k78sH19Y085uutoB2etxx60iQWIHzg+/Bj7KlO986+4VgdoW54n0FiBaJKKi
         uwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193196; x=1793797996;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dOD5XrVmD6y96EgRoiJnai2L/0L+uuMS0Loaa0UEtIU=;
        b=XZADAxag74U/TmAtmh+BAsDXAabGreXG2ChmN0Zz/0jLOaYtJROpCyDq0YsWdqqRXf
         7qfnkolsTqiO1GUVIwEuWUPSLWfX4HQ0Ve3hucINLDPMRWBw8BdY1JE8lIb/lr4sKhcb
         BPVNULJAAUqD2/KCxd+xMdATYDLXApps/fqwOKQfjYB7g9PAvWURHGYkiuI7X08ht/UX
         m4yYK+MWdiLzUwdnhKyZZHusNPq0SHGr4YTJDTy5ABW2ylxNIxajdppPVRmZoI8oqZvB
         uXfxlXT9oPM5lw6izHn0VPMIOJQv8PfN348mb22wvX0WQU6rRMi4X8Z4Z1dazV/mMe6G
         d85w==
X-Forwarded-Encrypted: i=1; AKwUvBwJFAxmg19jymlcStKqMs9j9Hz6cFMa8AWWIwfxniu9hI1iE93uumqE2S6iLmJklDCkZ+RKQTptMYWfP30=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnjR7675d5BsjuCsTWKAc9gmdQA/WW2vhlivl2t+GJXCRVr9Ax
	OIkaiVbJq8ilmyLM1wu+NKr6mXEZKnKP14JMzrKqxIbnabja+VFsUvWNRNPQOZwU
X-Gm-Gg: AYBFou2FHvYiYMarZy/1jG3V2OyRN86Vs+v7D929ETxSKkgbwRHVZH6wiBiiVsQuaDR
	zM3ZX8D5IItto4DL32n92THLvZnWgxbHoK80uhAjXDSmE7xWwkhpS6LGR3j2N7IUHx6ZrUY4bfE
	UZaoHQRsKguJXCMKYajuARmuEikiVHCg7XSCUX5onaGNOc95jMbLr0vP6eTIe8/wWpnB4zTX6mY
	L/DlzQYeQas9wXfwgzILPP4YSVb6rcNfKNMaQFTx4i/82XGjY/vrCLU6ZGYG0XXPWpWH/XRWph0
	V3YJZ4rPbjmazWRc6eoptxp81mEr/pwiArjl5k9GJHkNu09W7r9S24M3waTt2koFzNLems+VCg0
	bHF9nhzKU/UaxTsy6Xkrl/V4Cb5uXtbd6RaaPMzjbzd6u4kYJ7LnukkR6vK6Z4ELTGu3QDM7fB0
	sRiWPMsEnbJivW0s7AoQrz3WCren0yvaqvb0j8lCtNp88aIOvh+Wy2lFTwScRPbTKAHhnLaBtjC
	t5ijPEU05r9sKq9S1EGmeG4fPvEQa0XErFu2JmSzScGRJcx0eQ7CXIAyO9S0KgGN5Cu7c52uXjb
	Z2DMh2gClNzaRe/QAuixrfxB8Fzri+Oo
X-Received: by 2002:a17:907:5c3:b0:c36:a4b4:b1ed with SMTP id a640c23a62f3a-c49bdf2b4ebmr204254166b.11.1793193196093;
        Wed, 28 Oct 2026 06:13:16 -0700 (PDT)
Received: from [10.0.0.21] ([188.146.170.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd798391sm601342666b.71.2026.10.28.06.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:13:15 -0700 (PDT)
Message-ID: <0d584595-4479-4116-a52b-710e01f20bb3@gmail.com>
Date: Wed, 28 Oct 2026 14:13:14 +0100
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
Subject: Re: [PATCH] iio: chemical: add SGP41 driver
To: Jonathan Cameron <jic23@kernel.org>,
 Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Akshat Chandra <notmissinge@gmail.com>, linux-iio@vger.kernel.org,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-kernel@vger.kernel.org, Andreas Klinger <ak@it-klinger.de>
References: <20260831151235.64076-1-notmissinge@gmail.com>
 <20260831232157.27037a5e@systembl0wer> <20260904042215.0e21cf29@jic23-huawei>
Content-Language: en-US
From: Lukasz Kulga <lukasz.kulga@gmail.com>
In-Reply-To: <20260904042215.0e21cf29@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/4/26 05:22, Jonathan Cameron wrote:
> Whilst it should be a separate patch, the route here to use
> trivial-devices might make sense.  Only thing that might be
> worth documenting would be vdd-supply.
> 
> I'm would be looking for description in the cover letter of how this
> is different from, and not suited to extension of another drive
> such as the sgp40 (obviously there are more channels on one than
> the other so it isn't trivial!)
> 
> Jonathan

Hi Akshat,

I'd like to pick up SGP41 support, taking the approach Jonathan
suggested above and extending the sgp40 driver rather than adding
a separate one. I have SGP40 and SGP41 boards on the way for
testing.

Unless you already have a v2 close to ready, I plan to post a
series in the next few weeks and will Cc you on it. Your review
and testing would be very welcome.

Thanks,
Lukasz Kulga
