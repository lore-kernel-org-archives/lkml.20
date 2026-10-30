Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394174;
	b=Ume9wFjncn8yo8dvw+8ra0XKeiPKiHP/EVTz5nAUkneZ28ZGJFnb/NaXqwoWWrqN+nyp
	 vtYO67spRSvcv8KRLAp6zON4DbwMBnuCu3bEqsqeJk6oHDxZVsRoPZepska1XO+JYSwTh
	 Rf14zENLbOqgee5oPBbHCYNn8iga09y2rWmSRzqdfkLE40g7QvmX/yNEkN8o+s9hNfarD
	 39b3rTa1/FV+IuU6V0MbZTMCmPmXhl2oSOm0li+87tPz6z6XbHL13VBszRX2/wo/dt3yc
	 YEJnMgu39wdOuF81/JKtoAn7QYEJoPG6PPmLWHSr3Lo/nclCfqP3HAyyHLrWfuJh2bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=iHHhsndpKzFs7xmvr7h0NuvDfxvFUZq9HuUCucdH8zI=;
	b=Q/23kgyH4/5uOBxINwnqLPdrLmhQnmeDKYXitIU52l6ACgGYjeEc5qcmp3v8nRVq7D7p
	 oy1O5TSeQaC0a5Yf9Tcxoohb5xLMmikScqeta33x77JJv++nDGFp81sEYT+3b+CAmCcKy
	 NCFMr239xB0rmRlSGwef27ce1A65Z9mkgNd8+1DDiqYpdC9Tbb0v1+SstSAhn6LrF10gC
	 NcqaoEBrhKjaDo7Kq15RrCWsIq/7y6J6QEM4CaQt25qxVl3X4QNSn7Ib/83NqRqf9a+8a
	 AKLywTtOGCNn1IPb/rgPTDmF79wKx0DdjeomGU0PBAf+8gH/no/v6/9JbfOChAsNytg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HjnNo8kD;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065AF606A329
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 065AF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HjnNo8kD
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a215e64962so11540055e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793394172; x=1793998972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHHhsndpKzFs7xmvr7h0NuvDfxvFUZq9HuUCucdH8zI=;
        b=HjnNo8kDn6NYBnxQARp1eI3X++lbm8+9b/7DNp8FOuEQZNupDhfLjtn3TA3O09Nb6/
         pTsMNmnvYWyj5kYN1t1mt/nHvHE2xM8c4d33t50bbKW1HFmPI4x4zx80Rf3hRZds3MII
         2tNlufIEzOIvT94LcB/sETp5GMdThEITBwt5wBKFxv7lN06xiqWNrBtirZC0vItG2TmJ
         KEvpLLv4LKgbV4OtBdPU6WuMZ1cgfzgWH+vT/vaGD2nAWmjefIfEpFakM2y8XIQM9gJm
         O75lVwR1la86hYEmIVoZcYYRfeWGAhB0bLEClfKGufYdCwOJX08uh1SLrOdzscsQ8gMC
         LjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394172; x=1793998972;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHHhsndpKzFs7xmvr7h0NuvDfxvFUZq9HuUCucdH8zI=;
        b=O47I1rIFwaAcY5dofF7T6qOWRjNASO1C8Cku2C2FOrGTWuzVZm91/bsl+MeKFwaqzq
         rIk+0XOpKYzOGj3wi/Anf1U0+vnByQis4uiEh9tfdrYB1k2HBKp306sQc9EwRjeCIC5l
         p6dSIcS2y9+6xkfNDIiyJv91KoNxUoM5XsP7JDZ+tgLDt1HABQ9GwafpxxHDFR6i6u5x
         xymu5E5n2iZA32VPMhGJW3jqNOLMHPAbJwrFnw/j+xOAI096hdCUmEUeYCoqR8Km/w9e
         /pCp4PhrjuFX0EOBC4PPc2EYp7d+eR57QjlTusFZF1l0dQrzg35N9HTcPWiQE8ANCwM6
         pJ9g==
X-Forwarded-Encrypted: i=1; AKwUvBwTJOtKXjLPPpB5Ygh3Udc+ZVCsnrqPoiKJVuPtmV1JA7USytfoz2MF0ehJ0LSpa1wzAPLKOqmLYJd2H7g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJto7XFguaGBOdRBycKX1lhW3MaNULT5yVlPPqMt8w3E90WgiHS
	iDtk+wf162+S6uxEouJs4mo8zOqaAAgRAqJ/Y31wAT7gdS0M8sAf9EeSwXwHrHH2Q5s=
X-Gm-Gg: AYBFou1J8c4fQgZ2vNe7r38J8GsE0WhCgU/7KE/pcXXEKVUxxHJhjlux9TKSmMaCBPx
	Va6TDdL/DCPkn7Tak0i3gwR+OucthevfFPdlqXEkfUDiFvFLb18gwyr6vsNpxCKtqaoFbb9Lu6Q
	CYDZGljOHUGyF0zpGnESuc/mC9/+D21/5nTU/t1ZX4TipnkVM79tYrULXpgo6AWu7ua29iyYtfc
	DBYyuqqQTZbD7PCE3fs76d0kXXkJ0fPQM0efxvB4iQV/rlGI3dCzW4TB0DGM68nw4ugxoCqOdoc
	qHsgyBK0feOT9Gry930x0IR22b2KIB5lFsLZ9hQZf6/nnr04CQgbEwVFoR67BYfpkgK1ZqiAmEE
	PA0JQfZkOaP2UqPw54C1I6j6EdnMJ4LaSAC3sA9qRe4OmqCvL1liNPMtWv9x1sfG82HPiex7kqE
	5QoADu4Zel28be4sDqIrXWsPCvn8m7BvfiLRaCgUUHHrrQ5x9bDIUjhJRxsIcGKEOO9AfDp6Fii
	dnoPJetzxhhP2liwCDLw0WIR85oUj+xss7xovlPu3pUEK8IqwcQ/4ngwB2vhsYZDRJ2TOeyqdMC
	ktaZCTWvq5I5Z+wGbzawrg1olW/ARpT23fyFkWzAEJQ=
X-Received: by 2002:a05:600c:a012:b0:4a2:150f:1609 with SMTP id 5b1f17b1804b1-4ac17b2cdffmr74446405e9.8.1793394172354;
        Fri, 30 Oct 2026 14:02:52 -0700 (PDT)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm5275057a91.6.2026.10.30.14.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:02:51 -0700 (PDT)
Message-ID: <09771899-6a3f-462f-bba6-9243415efefb@suse.com>
Date: Sat, 31 Oct 2026 07:32:45 +1030
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
Subject: Re: [PATCH 5/5] btrfs: don't trim the target of a device replace
To: Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Chris Mason <mason@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Boris Burkov
 <boris@bur.io>, Filipe Manana <fdmanana@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261030-b4-btrfs-data-integrity-v1-0-f4d4196731e6@toxicpanda.com>
 <20261030-b4-btrfs-data-integrity-v1-5-f4d4196731e6@toxicpanda.com>
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
In-Reply-To: <20261030-b4-btrfs-data-integrity-v1-5-f4d4196731e6@toxicpanda.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/10/31 01:08, Josef Bacik 写道:
> FITRIM also discards the space of every device that is not allocated to a
> chunk. btrfs_trim_free_extents() goes over fs_devices->devices and, for
> each device that is writeable, discards the ranges that have neither
> CHUNK_ALLOCATED nor CHUNK_TRIMMED set in device->alloc_state.
> 
> The target device of a running replace operation is on that list and it is
> writeable. But its alloc_state is empty. The allocated ranges of the
> source device are only copied to it by btrfs_set_target_alloc_state(),
> when the replace finishes. Until then the whole device looks unallocated,
> so an fstrim discards everything that was copied to it so far, and what is
> being written to it in parallel to the source device.
> 
> The replace finishes without any error and the source device is dropped.
> With a single device filesystem, 700M of data and fstrim called in a loop
> while the replace runs:
> 
>    BTRFS info: dev_replace from /dev/vdb (devid 1) to /dev/vdc finished
>    BTRFS error: bad tree block start, mirror 1 want 30638080 have 0
>    BTRFS error: bad tree block start, mirror 2 want 30638080 have 0
>    BTRFS info: scrub: not finished on devid 1 with status: -5
> 
> Skip the target device. The flag is cleared with the device list mutex
> held, after the alloc_state was set up, and the trimming code holds that
> mutex while it works on a device.
> 
> Fixes: 499f377f49f0 ("btrfs: iterate over unused chunk space in FITRIM")
> CC: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

Reviewed-by: Qu Wenruo <wqu@suse.com>

Thanks,
Qu

> ---
>   fs/btrfs/extent-tree.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/fs/btrfs/extent-tree.c b/fs/btrfs/extent-tree.c
> index 9b0a5c6b96f3..22155507f905 100644
> --- a/fs/btrfs/extent-tree.c
> +++ b/fs/btrfs/extent-tree.c
> @@ -6641,6 +6641,14 @@ static int btrfs_trim_free_extents_throttle(struct btrfs_device *device,
>   	if (!test_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state) || !device->bdev)
>   		return 0;
>   
> +	/*
> +	 * The target of a running device replace has nothing in its alloc_state
> +	 * until the replace finishes, all of it would look unallocated and we
> +	 * would discard what was already copied to it.
> +	 */
> +	if (test_bit(BTRFS_DEV_STATE_REPLACE_TGT, &device->dev_state))
> +		return 0;
> +
>   	/* Discard not supported = nothing to do. */
>   	if (!bdev_max_discard_sectors(device->bdev))
>   		return 0;
> 

