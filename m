Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793393870;
	b=FciRmEItkSSmePpEZTPP2d75qJ4pMrc/oE2/ZXQA69sxRmZUXHbVDPq5MaKBQmZlxpKC
	 Wp+nFjj6T7pVzj5pD7lamJrvqFbmwVhwteWbKiGUofeFgh7NW8k3QmJY3wR+08veuaxz8
	 pKS9cFb89B/GqAlEpoxwctoWoTP2I9dDeH6P1xp25hmM5zjWUfrFrz+6JFsI7ODFIYUjs
	 KCatP62/2NDS2PVhW9T8kg3/GOtB7/z0rYuTwgCWC2ytO684jELjOSNBa+EVREq7kVslQ
	 dNY8jM3PSqKIMxZseiEMGU8Itm7QW1LQU76FOVS18jIxVirmW4Pp0BJk4fyTsurqIRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793393870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=h+46bkDry+sIUzzigKe4U0zYwNBSXXeQxCLzrMv+t7M=;
	b=EnvtpVMeIpJxSi77S712UfVhQqMQVqQxsFaA8PR+Cz6NQikXFSFywYrpl4rN/Kgzcrqq
	 i6M/bO7EgIp0fSn6IEWFabaMCTeGeNJLwkbdH711lXWp3seuXQVpOrUC8VT6KJbhmW/Be
	 xC6Y0Ftoz/6Rjfp8XYrZiZ/ZWU9yz9q7CD4mufMzipKRWFzbgqg0VvexwsQi4MKswV5Vz
	 hPdyDnN7YpENz4diCxkU48B06xA7I2GS3rmTcNKCzDT3fBp3bkLV1XSH2xeH8Vo0f1dyX
	 WkX7/P1RBv8pytSr91iD/uAkcJInRN5EAi+hyZhubbNCiZBfNZK/IFqedyv84/vZDfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GVCw6oRk;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F46606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63F46606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GVCw6oRk
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so12213715e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793393869; x=1793998669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+46bkDry+sIUzzigKe4U0zYwNBSXXeQxCLzrMv+t7M=;
        b=GVCw6oRkNd5STrpyXjA2GUJdkkqV53Xm4yIswuTyFQ9fa8g/P0T4pFIU0TuN/g3/hv
         mSUhmEc/x0xIQP3fZqo8A5tQo3SJ6RNDfpt/U00ziYsn08LwXzLZ7BoK9v0d9LZ11m7I
         GKzLeOtK7OzqSVS+BZzV0uN5Fg69xgmD8o5nAo7wojTNmk+f0g9SOyLbthFsNLtS8nDS
         eVXPTIK0OnFWYgV6hG2bQp2tXaSF5BmNQyiuKeX+yPH54jF8z8eqPrIM94cBp7LhWltp
         Qp6Fm82J/TCLsToIE8Gipgl3LtqkH5o7wWISZsBzGoMVcYFmevqeqcDdnm8HvnHwFl2+
         XL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793393869; x=1793998669;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h+46bkDry+sIUzzigKe4U0zYwNBSXXeQxCLzrMv+t7M=;
        b=ERyMOmVaREi/Hqa5QaNOlTK1bmgMflRP+No6A/4bAVTSVSY3wYib13SXN2t7G5ytKP
         SY3MeNF71MMoxX5dZyBTrxr271aaaEPFT+nF7MFJmEBkqq6qLosD1gkzvxpZ/w/LyPmW
         G2/KhS6LIxqZ9X+BxWR5sGqZwg/tfvNcZaEzDZ/YnPPHJTCvQBQyF5lGi93Ur2BPtTE9
         13IDMf5Mpj/xmTvilW8ECVhm243S2sjWM/fpOlDvy8bHdTZmSfKlvWebqulKWQqQZs4x
         UQO/w32NXNDKQCpOs5o1k84btmah9j/ySjRao/uzeCZuTsryZF7JRA2zpR3GfO7S2QgH
         7o5g==
X-Forwarded-Encrypted: i=1; AKwUvBxLJ75WBIEGUBHAVHorIAlfH3VVJowGadtmVAKUPRJA1prXw1bnlEYabpV5CTppnjjFJnVvtrpu7utBHmI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHJpUVKOzdBNfBn+hyQRv8vkVDEQ3ZO5D/AqvYtEkljC3xD1Bf
	vciRwUsvw4flHeRLvfaNR3hYpAC4g7O4WfMnVDun9PhH3NqTCbviHVikYnHSdH6lfGM=
X-Gm-Gg: AYBFou0oqorYmFlxbE6Omuo9bfNJjx0RbuDs4cNzlhRldA2PYVDJfXmthEqdve0wndt
	e1p+7FSykhlVLLG26UJ8GkPlwErRTq1AP8/IQ2oiBI8vu7S3NIYcI0w67mYhvEDXQ+LFF+CqTBP
	giUA3VOii3h04GravhKLZN3uuCqLSzTvm72lWVadSUcanC33ETuo3spAs2Fob+8ajao+7thhBuz
	W66i8dhA5j+lj5TDAnVNsqwtGVLmvR5LiBD0kF0s16qr+RcyIRO7jP0hBhCrZiFrPl83rMFpsip
	uqMZ9PhDRag0iYTgpAg642kCWf+0RU6tcVselQ5pkIrBMzGL1DUrpMzWli68/IbFvE0fpiTisaD
	lvKMxhbwyriirzQW/CVjlBYiCc1PAvy3c74lSxvpZzenjz801FjV7b3ZYcZosgx20Mag7ikG4v3
	WklP5mHHk55P8DFYpxfC7cIyenqfF/fH6In1aWtPIUwScs4tzSdE+VIt1IotlH/7Z8f2jAQJnLl
	+CSwswBd4JJBE3Yf6FSU0Ow75YdmfBSEuD14ZdrFn2MMg+sJiH5wRMO4S5AxnEWxvdc8Zs0Crtz
	aylt0Pn9OEgdsJ1R5rCKJX9Zb3aS2t4pODdAWFOt8pw=
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4ac17d168b1mr84999465e9.11.1793393868759;
        Fri, 30 Oct 2026 13:57:48 -0700 (PDT)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fb2c5sm9913650a91.3.2026.10.30.13.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 13:57:47 -0700 (PDT)
Message-ID: <ff0a86d9-51e3-4001-b375-6bc8392cf139@suse.com>
Date: Sat, 31 Oct 2026 07:27:40 +1030
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
Subject: Re: [PATCH 2/5] btrfs: clear dirty blocks after a delalloc failure
To: Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Chris Mason <mason@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Boris Burkov
 <boris@bur.io>, Filipe Manana <fdmanana@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261030-b4-btrfs-data-integrity-v1-0-f4d4196731e6@toxicpanda.com>
 <20261030-b4-btrfs-data-integrity-v1-2-f4d4196731e6@toxicpanda.com>
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
In-Reply-To: <20261030-b4-btrfs-data-integrity-v1-2-f4d4196731e6@toxicpanda.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/10/31 01:08, Josef Bacik 写道:
> If writepage_delalloc() runs the first delalloc ranges of a folio and
> then btrfs_run_delalloc_range() fails, the blocks that already got an
> ordered extent are finished with an error through
> btrfs_mark_ordered_io_finished(), but their dirty bits are left set. The
> next writeback then submits blocks whose ordered extent is gone, or is
> about to be completed a second time.
> 
> Fix by clearing the dirty bits and cycling the writeback state for those
> blocks, as submit_write_sector() does for a block it fails to submit.
> 
> Fixes: 72dad8e377af ("btrfs: fix double accounting race when btrfs_run_delalloc_range() failed")
> CC: stable@vger.kernel.org # 6.14+
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

Reviewed-by: Qu Wenruo <wqu@suse.com>

Thanks,
Qu

> ---
>   fs/btrfs/extent_io.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
> index 5ff630630490..3283835ccb5e 100644
> --- a/fs/btrfs/extent_io.c
> +++ b/fs/btrfs/extent_io.c
> @@ -1746,6 +1746,16 @@ static noinline_for_stack int writepage_delalloc(struct btrfs_inode *inode,
>   			u64 start = page_start + (start_bit << fs_info->sectorsize_bits);
>   			u32 len = (end_bit - start_bit) << fs_info->sectorsize_bits;
>   
> +			/*
> +			 * The blocks are not going to be submitted, so they
> +			 * must not stay dirty. Otherwise they are written back
> +			 * later without an ordered extent, or worse, with this
> +			 * one if it is still around, and invalidating the folio
> +			 * would account for them again.
> +			 */
> +			btrfs_folio_clear_dirty(fs_info, folio, start, len);
> +			btrfs_folio_set_writeback(fs_info, folio, start, len);
> +			btrfs_folio_clear_writeback(fs_info, folio, start, len);
>   			btrfs_mark_ordered_io_finished(inode, start, len, false);
>   		}
>   		return ret;
> 

