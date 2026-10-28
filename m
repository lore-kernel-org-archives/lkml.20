Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793221344;
	b=4cn0d2VlZvoxoNGhMcuiN+ucJlQG3GYhxkEwQfeC52OGiHMzkeSDDr1zbkAnpEAAcZah
	 ZTvQNSi2Pj/jvrAM7ZLb920ultWbqbZ41Hy6S/yDb2/9N7JIbhugsiCN5dXj9m5AeQLr7
	 LvDW5XHxyAGkEdHxzTb+/GY8pU0E0LAUMTgS9yKjYFn/xAnGd6yzMPffZOTts1uJVGCfO
	 B+GqV6cSn7G0y1Y9ytQN/+pyw4a9PmXuzmRyCejG5IxaB3Qt4dHqFCjVUx772AOxjejz/
	 a0RZY39IzkoXw7YkhVj84w1is8z1PxIPoW1ZUDDGmIzsYn2JiJYzfv4Nlw1OsT+BifA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793221344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=KJq5x4qtFdwftlwjCSnZ3dvBtK7oZVw0oOvZEW6vsM0=;
	b=uiCZA+CwEPK54SMj3Uw2uk5J7PCMniqnVIF2+JkNndur6ARZvAv0dU3eAaTLs318MEfs
	 s+8R5kfua/UDsgSlsb4nr7igxU/dpZFqtH0bQmcrpWese9uq+mwiEbAhXB1BzV8vMPYS/
	 hwaLiAKpnERaRQ3D2eNgkEZr4pEe/fjOFK4jivAcJWDg3CKwVfY1Ivduuw6qZWc8UO+wh
	 yp/dtQZsR9+s5S4xPMPKN/Cn5yklFSZVq72t6fqn5ZvoJtxEsK7NslZ3H0+I5NJp35DRg
	 L3ywf0WDm4tlnXgE/TzGxGaWxk+ZoZVOv0Izoz7ObmAagw7InAW+wIxaoe/ZNX5+LRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I6VdWccZ;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD7B606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DD7B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I6VdWccZ
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so9445755e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793221342; x=1793826142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KJq5x4qtFdwftlwjCSnZ3dvBtK7oZVw0oOvZEW6vsM0=;
        b=I6VdWccZ34lFN1zBZ8fGVTwa71nz0eMGoWRNeR4BOOYTn8XzzMG9EfeUPufPOHIQTw
         bV97F0O5NwU3ZzBmswKA/4FuspwNXjHXzBVQWZv0xk79EPSIe37YNZu36QYkoJjbUOs/
         uE/x7IdQlT1h7Md7hl8S/UAHKX2Ff7iEe3eSbMdddPVBcg2isAGv7gvgEEtf+DVjVs1z
         K1F8qGnruWVGGHMhOzoEjICpjsYCtbr7Iw/8gjcE2iM5Nxn2keJaBQdxWCmjvwj/NRFw
         fGeSWRCd3IJdtg8L9WoeEBxWDokcTpFMyiYakPzwTyoubMcCsHi56R+NZGCVh/qTQ7cG
         YZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793221342; x=1793826142;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KJq5x4qtFdwftlwjCSnZ3dvBtK7oZVw0oOvZEW6vsM0=;
        b=1AWZPVfDfcAD9veqw02aSQYyrUcLamKqexw5Jnr3Kjfv4fVDRALKyapwSNpAYh6Je/
         jPqFnIMlLzXyO64pI83HFk3ZcglfdsCDn1p++6v/JFnNlicCLsTEKeULAjR3UBJo0rrI
         OXzZPiNAF83m0YPDxuE4ZwY8ay9vdKooyC5MNATKgJqo1ieAWRkf409hYPqUXXzdm0Tc
         HkTqX3SI8Bv/Cn10Ic0pJl/Jsg0rj44kKBKb3o/WuWt9zG7hAhOsX3iVUTA84tlxFsex
         4u3IlbwH5wV7zzeZHQsFsa1AyUbuLmweV8+GsXYmYDIIIoQCmFlI+GUDVq1znby/jHCE
         b6yw==
X-Forwarded-Encrypted: i=1; AKwUvBwmUaTtdkPlyM1jh/dhCJNV6u2fEjxpMXv2HOnHMJJFqoS/HzaQZm2FQaRhJ91bTTguVoAH+i6V1rtwfX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKO7bzUUaSMnEJinXeQz1g7fYePqI6IpapftcEVSUfUm94cTH3Z
	ZPmhZxaz4SQMJqWcJkwUczM70SUL7dA3zQA+Pf7cAg9VT+YMg5ttHPcEwMEnqsEIMEDeTQ9nuxa
	sILpM/ntAjA==
X-Gm-Gg: AYBFou0/hs9txNyN2HaJ37hz88TvgHDAiJC59REAq+RzNKm9BaGYcUezIMjiJTAE31c
	ctB6zDn9vlxariKjOyKwHdjy219PXBRGN3msLYXsxM8aezzh48JBq0PrEAKqhsjBrWWjMJ/bG0X
	0RufMPf7PX34Zn5iDX0b3lqdUeJKKdklpTzPw6/xDbdPIKsPZNZ6hdlZnPUiazDSKygaHDyIQli
	r6iVsHvUk7wJbp1NYNUbrWNhdl8SuhOn9Q573i3MnGupFiErKZeRcxG5+KFBhrMcW54+IxAhMgN
	Jj+OSrU1sR1KdqCFpjfc72voVl3xAtgbbjNd45yBMcoEtwcSMc6DftklGTA5i9P9UUYB+YX61v7
	8n3GOjLay5qo07hhhMjz8vBgZHT92hdurgR13p21XBBGDm7498ldPGkMbx/bFQfJPDXIx2NG5Ss
	YEGyrtsFyu3zSMl/AmZ2GVqMHn9nX54EwMa6wyeEm0GJhbpqTsZ4GZiWlOW/yQPr50LsDVTtC8i
	w6PdKIBVguUvhGEODLFsvU6pPkJj74QFQ5nerrdNbQjc4Ma5ruL1uRjFPia+6du7NOToMJ4kZhv
	EWKPo/NdazEe/x1Upq0w8Q==
X-Received: by 2002:a05:600c:1d0a:b0:4a2:883:4adb with SMTP id 5b1f17b1804b1-4a9678c28ffmr80849565e9.22.1793221341733;
        Wed, 28 Oct 2026 14:02:21 -0700 (PDT)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae57a010basm2292120a91.3.2026.10.28.14.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:02:20 -0700 (PDT)
Message-ID: <4de45a85-6db2-48ce-826a-90dee4e44a5a@suse.com>
Date: Thu, 29 Oct 2026 07:32:15 +1030
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
Subject: Re: [PATCH 1/2] btrfs: account partially completed discards
To: luca.stefani.ge1@gmail.com, David Sterba <dsterba@suse.com>,
 Chris Mason <mason@kernel.org>
Cc: Robbie Ko <robbieko@synology.com>, Filipe Manana <fdmanana@suse.com>,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261028-b4-btrfs-fitrim-interruption-v1-0-bf5c53738b3a@gmail.com>
 <20261028-b4-btrfs-fitrim-interruption-v1-1-bf5c53738b3a@gmail.com>
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
In-Reply-To: <20261028-b4-btrfs-fitrim-interruption-v1-1-bf5c53738b3a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/10/29 04:25, Luca Stefani via B4 Relay 写道:
> From: Luca Stefani <luca.stefani.ge1@gmail.com>
> 
> A discard can complete part of a range before a later chunk is interrupted
> or fails. btrfs_issue_discard() reports the bytes already discarded, but
> its callers only accumulate those bytes when the entire operation succeeds.
> 
> Link: https://lore.kernel.org/20261028-btrfs-fitrim-freezer-v1-1-0ad1d58aa94d@zliang.me/

I don't think this link tag adds any value.

This series is going a completely different, and more sane fix than that 
LLM generated one.

Otherwise looks good to me.

Reviewed-by: Qu Wenruo <wqu@suse.com>

Thanks,
Qu


> Signed-off-by: Luca Stefani <luca.stefani.ge1@gmail.com>
> ---
>   fs/btrfs/extent-tree.c      | 5 ++---
>   fs/btrfs/free-space-cache.c | 5 ++---
>   2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/btrfs/extent-tree.c b/fs/btrfs/extent-tree.c
> index 9b0a5c6b96f3..242db255cf1c 100644
> --- a/fs/btrfs/extent-tree.c
> +++ b/fs/btrfs/extent-tree.c
> @@ -1463,6 +1463,7 @@ int btrfs_discard_extent(struct btrfs_fs_info *fs_info, u64 bytenr,
>   				continue;
>   
>   			ret = do_discard_extent(stripe, &bytes);
> +			discarded_bytes += bytes;
>   			if (ret) {
>   				/*
>   				 * Keep going if discard is not supported by the
> @@ -1471,8 +1472,6 @@ int btrfs_discard_extent(struct btrfs_fs_info *fs_info, u64 bytenr,
>   				if (ret != -EOPNOTSUPP)
>   					break;
>   				ret = 0;
> -			} else {
> -				discarded_bytes += bytes;
>   			}
>   		}
>   		kfree(stripes);
> @@ -6703,6 +6702,7 @@ static int btrfs_trim_free_extents_throttle(struct btrfs_device *device,
>   
>   		ret = btrfs_issue_discard(device->bdev, start, len,
>   					  &bytes);
> +		*trimmed += bytes;
>   		if (!ret)
>   			btrfs_set_extent_bit(&device->alloc_state, start,
>   					     start + bytes - 1, CHUNK_TRIMMED, NULL);
> @@ -6712,7 +6712,6 @@ static int btrfs_trim_free_extents_throttle(struct btrfs_device *device,
>   			break;
>   
>   		start += len;
> -		*trimmed += bytes;
>   		trim_len += len;
>   		if (trim_len >= BTRFS_MAX_TRIM_LENGTH) {
>   			*ret_next_pos = start;
> diff --git a/fs/btrfs/free-space-cache.c b/fs/btrfs/free-space-cache.c
> index bff6e5b372d6..a85806bcf87a 100644
> --- a/fs/btrfs/free-space-cache.c
> +++ b/fs/btrfs/free-space-cache.c
> @@ -2415,10 +2415,9 @@ static int do_trimming(struct btrfs_block_group *block_group,
>   	spin_unlock(&space_info->lock);
>   
>   	ret = btrfs_discard_extent(fs_info, start, bytes, &trimmed, false);
> -	if (!ret) {
> -		*total_trimmed += trimmed;
> +	*total_trimmed += trimmed;
> +	if (!ret)
>   		trim_state = BTRFS_TRIM_STATE_TRIMMED;
> -	}
>   
>   	if (reserved_start < start)
>   		__btrfs_add_free_space(block_group, reserved_start,
> 

