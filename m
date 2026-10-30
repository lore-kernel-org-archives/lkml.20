Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394229;
	b=0i9UOHCesoHNubiYXBKfnPtiVpSCmYk/vhONZ71vf2xHRAXHcM1d2Khnn9UXCchWrbey
	 uEUzoZ7YR3aKJgpS97B06Xn+9e8pgVx++4U50jDDoq3DuH7WN9rTAlQK2Dhh5TuLdLXkI
	 Pj6y7ovyHRy/EjfbhRAW7Q1PW7O8Ehq3GDGn1oRw0y0OY8geJQnEzusCIcAP6B5EQv31z
	 y0XJF9TKjQcYRH44ovw/57eiSbuW2eFuKAdlojcqKDzMUX2skuTNasxyxLNJ/MJRLDKCZ
	 N6Nn9kelOztdVxuFUEqRQiSVv85v2lGzeH2cYw3n5Zi7BUWnDypt5Aj/EReJEske1lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MxI6kIjG4UY4nZOd3/y/oB30lotTLtKeu71+k5vRuRs=;
	b=2TMLBEoBQFx7JZXYJf39xuNB2dRHYkh4XlHPvNnRFw3pUDNXXxTIolzftJQyxqtXx+bo
	 5zh3ZnHDmSO3azHEeOkPtH8/w1RCRTVORjHz/EFDfqI9yvWKukUGzPUl1LmKLdOgmMeZy
	 zO0Tqz5F+1nbHfAFrvcOrzlYa5kN3XZDUDHX+bbYFxckmelOQDE2DvacUOn1UQIhYFFv3
	 OuNEuDoCKQsOcM/knJVQfryXCAi9JpFFmMceOdr6ecc0FFpRE4dTyq6ReJKuloFevCpXN
	 kiixaUAWHKwMmh+Vehb6hruRVjxfqSmPA/YAG0r286By+moBeypVpcYvoOzdZqfojJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="Mmc/pkPL";
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D58606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0D58606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Mmc/pkPL
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c414e5d282eso148014966b.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793394227; x=1793999027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MxI6kIjG4UY4nZOd3/y/oB30lotTLtKeu71+k5vRuRs=;
        b=Mmc/pkPL9keqqwSl+8sH9VqGmrfnkO68L1FwnZohSCpWidqUXMskW/TkOJuiUwPXZ/
         YZwO2OrpBuWAs+/NH2ufaNfUwE8eZgI9l+7LiE/9k4vu04635NtkjbmdZ1jOt308/uGh
         QMSR59QDGWScoLFCB4f0cHs5kILmdXnJOCAEHWgxwX8TC0RmknaDL9pc2jyhMPnJ6Cbn
         xvGsEP0xAJZcyGliI0wn4AhKVLoXiWw38DbP3UiLPQxhU8qCIatusBH59G+1kgRW/Y4O
         jyghO0UFPwy17EaxoYhv7MY0769A7byRryDhvf3viVODPSl4EcmXrvKfDu3aeTojfe3E
         CZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394227; x=1793999027;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MxI6kIjG4UY4nZOd3/y/oB30lotTLtKeu71+k5vRuRs=;
        b=BjG23z2ygVtXegDrdDy3oWZaoaVZ40DU+KiCiOPkzzQClZYmaL5r34MwnVluwTGeDW
         p7uGiDksNsV7UlgzFY3GpE/tLuPTDmrzGXJxrgxHgrk3WGWisuvqxftqkrrTvJHM/nLY
         EU9le49Xa/kjk3Jtsm0bjOiuRVBAwd8iG73U4RnvgvV7UX//TIUOruwIAnhxkJfGMS7j
         G6wLoJ2pqp5ZkjsrcLCw4hCBulAn2X5UkWUUohygD7I4ERjNrU8X74AF1WHuhh/2pxmG
         1qppWRl5rALdIUdOQTsvcRG93Y8imAqH/bfpEGyT6iffnxaDSWUyl3Qkg6jB45HyPYE4
         3IWg==
X-Forwarded-Encrypted: i=1; AKwUvBzAS2/wQkIFYX11ATWMXGynecRoVPD1JmAS5xJIPxTQkR7QkT+OEqoywIMe/5ESl+hqhYJkHqlfa5Qtpgo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4kmik69LObsCt4mGx0hF1rng+FnIK67oFS8Du3RcAm1/hgdyF
	0EoJqJNT6D5GXa1JqD2GELOTDOUEVI4Pi8LGs/u47BnipjBmVPjR/0nelD3zBFmVCSY=
X-Gm-Gg: AYBFou362JMiNT9OXW1lH2wfq5S8chDnppWsgIgrGy8OYvX4N18KZnWe4+xFjueDhP3
	w93K1eJfzn/NQbolV/UIjwq+3bb9IQ5lu6n6ahocV7GUN74EdYSz6dP/3G0UZlOmZdzg8z+bUCZ
	q/5gep3wzl0ufOJxPwuF1QYbdhiY+/bVOiEKhUMgcz5hP2joU6uBTBe9ng4XQyPE7kIGzwMqqz9
	q/5eGCtdUQTPr/jZr31YSbK2fWVWSkcCbmIHU7WkOSFsH4/mnNLbwCi5IytLRn+uqBfHqTgZE7+
	uGjAPmqNvelQFsxOTQukCVU1d4fpPuUVEyAwziuLq1MVYwoh4u0qzVAUTjcaC5AhS2yUyvD1IZl
	8oA96CcPNl96vUCCn6HIOy8l1JsbCDzjNm+kYfsVi/OWtfxofqdemJWnJ1PF7YewRbk/pFUIOS/
	XQcaM0dhsLCfY52uk80iE7Mho2XGmLbk8mAFvLvVeoDoAZvF9QMZVEFWd0SblioZ5Lg6CBjsYLh
	AXUDkpM9WvFaSvnZu9tQzt63GNau7FCipwjGvMywO+VcdRt/yagmrXtEob3UEvGsoJKmfJO5oAr
	cUBMjBYLJGqtn4USLrcC5maSMvTsWQWZi0lyu2TUZ/c=
X-Received: by 2002:a17:907:a88e:b0:c3f:153a:8663 with SMTP id a640c23a62f3a-c4ca7b20cdcmr346484166b.23.1793394227163;
        Fri, 30 Oct 2026 14:03:47 -0700 (PDT)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963d6acsm403153b3a.18.2026.10.30.14.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:03:46 -0700 (PDT)
Message-ID: <fab0bfc4-3c20-4058-8b39-585b14152f6e@suse.com>
Date: Sat, 31 Oct 2026 07:33:38 +1030
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
Subject: Re: [PATCH 1/5] btrfs: don't drop the error of the last split bio
To: Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Chris Mason <mason@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Boris Burkov
 <boris@bur.io>, Filipe Manana <fdmanana@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261030-b4-btrfs-data-integrity-v1-0-f4d4196731e6@toxicpanda.com>
 <20261030-b4-btrfs-data-integrity-v1-1-f4d4196731e6@toxicpanda.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ujyBQkUpLw5AAoJEMI9kfOh
 Jf6o8OIH/0mqW+TQM4m2x3hCsnK+oB4yJH1qnGvIhFF/Lhs48wI02sGh6/4aA0hkCDfd9LHQ
 +ci4FUepZ9y4VS01+oIExbg/8ytzGYTzLtb44jK2GBOBVSJkMiha6jp22XFt7WUkT/tvbreu
 WWdGsaJIRQaZChy7xsMI8lqQ2WdmluZJ4LT0wD3l/l6QU1ZseMGySebdY9sVOQEOJNV7Qj92
 /KOAFNmeZshV/qDI8Iw1RTs6TvLqCcqmlZLCmJkYSVhT1RonWRren8xIRcFEgMe004IDnt7V
 qdQhk/nhTS9x9MBAhMRl0TTE1VKDLvVALsud3iZLrmmtYvwPApzGJk052f0m28vOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ukKBQkUzDspAAoJEMI9kfOhJf6o
 SNsH/1ysUWOKmzY0rGS3ZdS61QgqMGhSWD/EJ4UiPw+xO4l4+GtX0fOAqxqsmBKqje3vyhBa
 Z5o/1Y+gNiN+E6RBcSz4b1TAd78sQ2bvT5DWOvBjeeVxHdiuQMIn4S8xk5ZpySBw5ifjoiuL
 0M33UVtJOzM8yfAeL+d/Rp4leJw72SutjkLyZTG/gJIp4pJGD/kFHn24OLL0IxEcO0gOekNZ
 os5e1R6jAJ2ILk7+MDnvU8wXHcCiVzuDhJLI1tih1uUIE50muHQJWbYuVBbdJeu8WlIDDssx
 UOCxLylNG3gDXV5MhLubPTOpp9OiFc/XC37nvkgEcrlmlOFBv4/NJCbECpo=
In-Reply-To: <20261030-b4-btrfs-data-integrity-v1-1-f4d4196731e6@toxicpanda.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/10/31 01:08, Josef Bacik 写道:
> When a btrfs_bio had to be split, btrfs_bio_end_io() saves the first error
> of any of its parts in the status field of the original btrfs_bio. The
> part that completes last is supposed to load it into bi_status of the
> original bio before calling the end_io handler, but that is only done if
> that last part was successful:
> 
> 	if (atomic_dec_and_test(&bbio->pending_ios)) {
> 		/* Load split bio's error which might be set above. */
> 		if (status == BLK_STS_OK)
> 			bbio->bio.bi_status = READ_ONCE(bbio->status);
> 
> If the last part failed, the assumption is that bi_status was set at the
> top of the function. That is true if the last part is what is left of the
> original bio. If it is a split bio, the assignment was done to the split
> bio, which was freed right after. If the original bio has completed before
> without an error, its bi_status is BLK_STS_OK and stays like that:
> 
>    original bio (tail)                 split bio (head)
> 
>    btrfs_bio_end_io(orig, OK)
>      orig->bio.bi_status = OK
>      pending_ios 2 -> 1
>                                        btrfs_bio_end_io(split, IOERR)
>                                          split->bio.bi_status = IOERR
>                                          bio_put(split)
>                                          cmpxchg(&orig->status, OK, IOERR)
>                                          pending_ios 1 -> 0
>                                          orig->end_io(), bi_status is OK
> 
> The end_io handler covers the whole range, so for a buffered read all the
> folios are marked uptodate, including the ones that were never filled, and
> read(2) returns their content instead of -EIO. For a write the ordered
> extent is completed as if all the data had reached the device.
> 
> This can be reproduced with raid0 data on two devices, one of them slower
> than the other and with a bad block, by reading a file whose last stripe
> is on the fast device.
> 
> The saved status has the first error of all the parts, or BLK_STS_OK if
> there was none, so always use it.
> 
> Fixes: d48e1dea3931 ("btrfs: fix error propagation of split bios")
> CC: stable@vger.kernel.org # 6.12+
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

Reviewed-by: Qu Wenruo <wqu@suse.com>

Thanks,
Qu

> ---
>   fs/btrfs/bio.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/btrfs/bio.c b/fs/btrfs/bio.c
> index 2c6234f6182f..fc0b021cdefb 100644
> --- a/fs/btrfs/bio.c
> +++ b/fs/btrfs/bio.c
> @@ -127,9 +127,12 @@ void btrfs_bio_end_io(struct btrfs_bio *bbio, blk_status_t status)
>   		cmpxchg(&bbio->status, BLK_STS_OK, status);
>   
>   	if (atomic_dec_and_test(&bbio->pending_ios)) {
> -		/* Load split bio's error which might be set above. */
> -		if (status == BLK_STS_OK)
> -			bbio->bio.bi_status = READ_ONCE(bbio->status);
> +		/*
> +		 * Load the first error, if any. It may come from a split bio,
> +		 * including the one we were called for, in which case nothing
> +		 * stored it in the original bio yet.
> +		 */
> +		bbio->bio.bi_status = READ_ONCE(bbio->status);
>   
>   		if (bbio_has_ordered_extent(bbio)) {
>   			struct btrfs_ordered_extent *ordered = bbio->ordered;
> 

