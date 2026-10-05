Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255A3404BF9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 21:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791236406; cv=none; b=ovpmzOTZQngyTaAXqfyQGY/0lZu7tTl5j9s4UKU+AWlYkaFacOvMYyx4gRwcK9AmwYUskALMxgOe11E17pa3haE5wQ0mcOwhXso/c+8Qa3pTM55AAl4SO4gGHWB/ny+d79g/3Jk52ULXl1VXz0V58krwafa6aESZEZizBs57Yi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791236406; c=relaxed/simple;
	bh=Z4ZbOZ6GWaM5OiMHrmEtwH8TpBtcS9pRBQOJbO023M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8MHmgt6F4WToJzP6CKngCd5ROVH3RAmhe+wJ6bkB77DQC/HloXTAWoUcq09zP5hcratzbG9cnEHzIG2P6EfCksHAo2oipWOwsoB4r4BHFRyRxVEV162aJyGDMF0f0hwRDxUAYOrAjp1xVRvWZRuU1zkvB1NlP3b8HRIPnE0avQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dbqE7+wt; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dbqE7+wt"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c41135so1512041f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 14:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791236403; x=1791841203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38X0bO23Lr2rd4m5q2NA9sQbB1hWKESGcmWPYsENxpY=;
        b=dbqE7+wtUeedYEPU58ILsBpXfzSwbp8tJEb2t2c9MJK5pMjYVpwN+ROuhFPRWo0LB5
         06XaRmusQ5/4GMMCQxv1Y1G2CdNe8PYWwLeqgq14IcoQXfhl1y8JVtZ7Y+2jDD2BxHOe
         dTvXGR9c1unKcETtUzqYrWEdXKy4dtUIouT3Tn9I5w7wlQhEsUc2CXIlcMJjZUn2V1Oe
         n0k1YZaLuMRELpxi6A5Yr3OgQ/x8LsfZBGbIZ8nUJ39DTTIcNG96gWGNmmnzyWLeVGPw
         5pcfVS06o/amVhUbpmuuAvYNwb6ut2suO7xR1loqYvQY3dpAi89KCUhtRywmTqEJDPQH
         CDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791236403; x=1791841203;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=38X0bO23Lr2rd4m5q2NA9sQbB1hWKESGcmWPYsENxpY=;
        b=G1s447G16HLoFnoqZgaJaiUjT0bKnI7ryrfUnZocylXfgF1IaYJ3VBOsX1W8MXYY83
         yhb6eFdB+gWSjiGQ3lkbOZUh+qdQI4pw2b+GiXFwnQ8qcjj+4sVR4/iO+SpIDaarBqJQ
         EPw+ZQFcF889BLiIp2LobEwMdXrm/C80fTAjf+twcvceQMOXOcTaFU/sXv7BZJIn+GuD
         5mR0nDm2DX9l9CAVlJuzgWP5D/D6MRVJQf9rxFSzSgmdMwI+Oi+ODiORZI9zqJ2KId53
         iYvG0qopHj9/ijlzoi3o1H1Ek2ReOQgP2hFrK2T464Ir849sbfeO5hFjK9qicKQQ9LIo
         zjJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzh5ZtuolrS1sQ5t4vqo25ILxnyTTy7vLIHe9nyDnMcr20+03RkiE1gtnRZo2rwTLCS6RT5lmN9V2F4SPw=@vger.kernel.org
X-Gm-Message-State: AFuF++lXsLWHTyc1k5fU5J9hJ8RS9tCgHrkC3PQTgPMvx0mxHT2GybkN
	yP3XueBd6Ksg8XPRmleqiX6cjZ+jO+p1iSQCAO86JIEaukEoCCbv0XNZn03O3Jn81MI=
X-Gm-Gg: AYBFou3ExCKKBfu1lKkCevTOsk7BbZvmR6lpAtodWeEJxOAaoEUb+7L968qDFNoR3T4
	i1kfFTJJND19ePvKh2FgWyC8uUpCwMdjWvbeCk/H8CHOudC3tNyZ0Q8fIQH5O7QFR/hzdmaBf4f
	JQHGfu5AHMEDZ4Bu1WDlJiRdMiPxliPY5bbl7I9RLgpaLmAidiXLf2TEF3/wIKXjUha/6tnDosI
	SDE2v9EQZ61uOYTdKf96cxpdYQYHV96JhG+4WsvA9CSO4Rr1BOqeJuR+N/jahCiCTUAKlsTDMHP
	+GI/zGeaJETyO+E5LlSN/AlMqXnCN+chN/m34ySeiPVE9C78yhnBVH7OO+0/oBqGOgSUHt4hr5K
	DS9PI/SAowlYRMcJUigm+q4LoaaNkRUUsKDxrU0Ws8/aK25s0mYBUxhW/JmiEKZ1hUGFAxITGeU
	6UeS56XZWI+KwpjZ14Qo19p1OiUlCcCDAc9y786SbubaDn6T0XOkVzxGqIlxPuyEI=
X-Received: by 2002:a05:600c:8717:b0:4a0:2867:d8a9 with SMTP id 5b1f17b1804b1-4a02867da4cmr200402595e9.30.1791236402962;
        Mon, 05 Oct 2026 14:40:02 -0700 (PDT)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5ec8a28sm12912705ad.44.2026.10.05.14.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 14:40:01 -0700 (PDT)
Message-ID: <4dcfce5e-032b-4f18-b4f1-bde5e29e2292@suse.com>
Date: Tue, 6 Oct 2026 08:09:56 +1030
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] btrfs: preserve caller ownership of anon_dev on root
 insert retry
To: sungbyeongchan <tjdqudcks0424@naver.com>, David Sterba
 <dsterba@suse.com>, Chris Mason <mason@kernel.org>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261005212355.428030-1-tjdqudcks0424@naver.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJqqw0NBQkUl/JeAAoJEMI9kfOh
 Jf6o/xYH/3AaWnGSq58XnY/T3/YYjr6g+TUZxa7MPyiYTELNpNlvmNlbtbAL0nW0LNvkeiqf
 SmYA+xkwY4RbxnZYQK0H5iv2w1eqa9qqFZb4bIBRmTapu26GEEkpad0W0ZhoSPMO8bV2Bwkf
 YdtPZQLaeUKvHZqNqBKnmtRLQj2Cgy3kuXX3bEGvWjzUOxPUSCj/S++JWBewMdMBPT62vZM0
 3156gfn5mHA94s2p+NFJoWkERY+JPTMu9NISkpD7yuGhXN88qd/aqD0RrlhxvKsrQogdPwn9
 vP18FGG3CRlHtOvOLVoY5NKSOWTDc+o+8t2XEETFTGbKYTcqeTzi4SxhvBLtTinOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <20261005212355.428030-1-tjdqudcks0424@naver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/10/6 07:53, sungbyeongchan 写道:
> create_subvol() preallocates an anonymous block-device ID and passes it to
> btrfs_get_new_fs_root(). On a cache miss, btrfs_get_root_ref() assigns that ID
> to a temporary root before attempting to insert the root in the cache.
> 
> If another caller inserts the same root first, the creator gets -EEXIST and
> drops the temporary root. The final put frees root->anon_dev, but the caller's
> *anon_dev still contains the same ID. The retry finds the cached root and
> frees the caller's ID again, producing an ida_free warning.

Please provide the warning message.

> 
> Keep ownership with the caller across the retry by clearing the losing
> temporary root's anon_dev when the ID was supplied by the caller. Roots that
> allocated their own ID retain the existing destruction behavior.
> 
> The unfixed sequence was reproduced in two clean boots.

And reproducer.

> With this change the
> creator-side -EEXIST branch was exercised twice, each caller-owned ID was
> released exactly once on retry, no ida_free warning occurred, and ordinary
> subvolume creation, writes, qgroup display, and clean unmount passed.
> 
> Fixes: 2dfb1e43f57d ("btrfs: preallocate anon block device at first phase of snapshot creation")
> Reported-by: sungbyeongchan <tjdqudcks0424@naver.com>
> Tested-by: sungbyeongchan <tjdqudcks0424@naver.com>
> Assisted-by: LLM
> Signed-off-by: sungbyeongchan <tjdqudcks0424@naver.com>
> Cc: stable@vger.kernel.org
> ---
>   fs/btrfs/disk-io.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
> index dc7ad92876c0..4a5e43dfde6f 100644
> --- a/fs/btrfs/disk-io.c
> +++ b/fs/btrfs/disk-io.c
> @@ -1355,6 +1355,8 @@ again:
>   	ret = btrfs_insert_fs_root(fs_info, root);
>   	if (ret) {
>   		if (ret == -EEXIST) {
> +			if (anon_dev && *anon_dev)
> +				root->anon_dev = 0;
>   			btrfs_put_root(root);
>   			goto again;
>   		}

