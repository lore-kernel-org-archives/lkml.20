Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869287;
	b=KyFs+ogkLHRGy9Upjrz/lbmRpkg/FUswZ20M5/aOvJJfdOBYE/FnUT4ToxwNTv9y8MXT
	 IikY/i7njJhsTyQd8WMDye7RcVAh5YnaIrILbKyepIsbVq124Y5lLTaMyK2U0P75KIR4W
	 wRqrFJ4IN0zzTSKCSkZkfvKyESL0eRBcW6RpHbYxFr/WXLkskJfvmqlpgFZdz7JEfrOUP
	 gJeZU+ABV5rYFZD9OVQOLNOwOT/m/k6QL/h+LwbyIozEMsEYuVJr3A036SFeMap1DpJcf
	 OOv3ocdyRf0qT6Uz5pL9GiLVwGgB12V7m+VXcDBngwlKwot50NQSGE5ZCjwtq9gzZyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sU4YqyP5FNgmymeEWSjJc6o+Mj6OkOMdTqnGg7f2My8=;
	b=n3iOLuFFCRE1qpF8fGl1tFBDq76cYctXJ0l8wKUOGt3IEp/WfIdPMpwHt41ZSUfaxHfD
	 3IOyFThW5PLZRQyJFm2DEdMBzaA0W/AbmNzfWhn4XNcdeN7arte8Q7sho6FvrH8uoM6i1
	 saQWeO/6cuCIlII1K3l+1ExLyWl+YWdDSQ3bY5iQJObHa3GorWAr0fDJVdDYUGOthu89i
	 tBXYq4PjEwMRL8VMV56+Oc57zzCiAAP3EWxnLIjuusyH1b+e5FgAMkQY7rga9TUyPhrJD
	 djenf1CZauCv/Z4KrVkNfrQ4eSEBikFLVSB2BUa6rwaOFoWUlIrvovtFJveNaxnf4YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Tqij0Ls3;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9B0606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC9B0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Tqij0Ls3
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50dd1e2f11so224659166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794869285; x=1795474085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sU4YqyP5FNgmymeEWSjJc6o+Mj6OkOMdTqnGg7f2My8=;
        b=Tqij0Ls35duQSpJgBlkattHZ1rYqD9vGHGegODAx8s5c5oMLV4IOyuCS8Z6dPD3lqx
         hnPC/oaLUWmq2Bhym/evt6pCXSSYhj/o8zOSuKVhBJAk8TIb/sl96q+MHvypsbkNrCuS
         MDToM6G5jI7l91xIOAVpvhvPWCmPDLCTuEVYl2i4WfaeNFHl4iODJlLcvyVMaP0lr+KK
         mkz8OtB4dDfysZtBSV4HTKvQr1tTgE68/ad4cdHaG1TIkUgDPs1SNpIcR/5dM5CfrAKQ
         VojX2sPoNxUO2wwKkLqTeRAJFHqa0p2ThcwxbNYlxZ3E9ELytvnrUCNZNW8mJ9BuVqlA
         3xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869285; x=1795474085;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sU4YqyP5FNgmymeEWSjJc6o+Mj6OkOMdTqnGg7f2My8=;
        b=QtYN+Ncq1/Lp+QzhuAifu1RnfzZjTed/enZ0WlFV1507gNUTDQOUulJcDV0NXLRnHp
         0e3eL/caZgkxWGohRFcFeuTdl917cN+xeAuNvsyXYNER54FpPlQzuj7E98KKejnnzX95
         TSL+6dFl7PQ6QDT/3uougIEL7rHENHRyqGp8O5tisCkasm3wtUwrc9xblXvY4qbWmwaR
         kidgoCgSEJ420bTp6nZR6eJnT366TfzDaKhTjHOLb0wGljFhDPMsLMsoZQnpu10koFEp
         pMruWEs6yKPrEw5yfHek0+A7ocAXGkRthSE9v5fRSRV/809Edg7bSSa06ZUUP5NWnLwE
         pAHg==
X-Forwarded-Encrypted: i=1; AL+hErEU+CV0EFWtfLFZ1iY6lM2Y/qtRzRICmmquahaIYbVJ0EreuxS3cnpK5bZMg/sxxl3YDJsH2Xp1dNo2ZC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ryIECS3s9vtdWeTSUuach37nnxsQ3yVE2wz/PbzCUBolD/P3I
	3EPhxkOajZSZP5h2KjTIcvAiFVHK8fXR0sfkLCz6u4hB1i6w0ZZb18AcrfJTuulCvuo=
X-Gm-Gg: AYBFou0H/05C4e+DFNUkNTBzCAJuZ9yDHPWIj3654UnjkO4ZRYcn1rXIOPtUGJIgAf/
	npXeRyRbFRPKJrXewreDXKqo5mrLVExkBeOjfTopa/3+N50aouaBQTj7yVWBjHsHpchCgyYBbks
	VPZ/SDM629BtqvG81ZEsmdc3FctXdgQo5p28utvjd0oAs6CAaJkwQDUeKpdmHPg3r/c5TFiJLdt
	2IJpEj0PPkmnDY9P+hGqx1NEb3NWw44wSvPgDAjB5YmgcoWIybEeJd1o5HUYYHjCmz9Rw9xbYd/
	VS54ZRDHyqm2ypuhQH+lGmBXgen5dw88infdm2HL9pvU+PWxU8Q94GIeJLe01XIuMKKzt6vpR3B
	WaHXaOzBEPSedmmJsj4LZZjZboQaMM/oH+TyEBfkfvaM9v7DHV1BZbuiG1QOD2Cd/C4lBjG9pA+
	rIinFC+8iI37uY7tSRS90M82cyp69N49Y2OGu/qalPYbuj+yKqX85kOYCgqfY9tlpk9/jiq4dZC
	jVQHP3ljyl2+P3TuAd1pqf58AkzpRy6Abe6PZu3MPNZbjgax+kKje9fXRH4ySZbJxhpq3i71rcZ
	pvV98hz2gHtpI2XyUkbTlw==
X-Received: by 2002:a17:906:794f:b0:c50:4b7a:de71 with SMTP id a640c23a62f3a-c5096371337mr1005561066b.28.1794869285237;
        Mon, 16 Nov 2026 14:48:05 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a5835bsm4661905ad.41.2026.11.16.14.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:48:04 -0800 (PST)
Message-ID: <6263b557-1f52-407b-90b6-30af6ad3e3c9@suse.com>
Date: Tue, 17 Nov 2026 09:17:59 +1030
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
Subject: Re: [PATCH v2] btrfs: tree-checker: reject file extents with
 oversized disk_num_bytes
To: Cheng Yongkang <teel4res@gmail.com>, David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261116050922.310476-1-teel4res@gmail.com>
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
In-Reply-To: <20261116050922.310476-1-teel4res@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/16 15:39, Cheng Yongkang 写道:
> check_extent_data_item() only checks that disk_num_bytes of a regular or
> preallocated file extent is sector aligned. A crafted image can have a
> compressed extent far larger than anything btrfs writes, and reading it
> goes wrong in different ways:
> 
> - With disk_num_bytes == 4GiB, btrfs_submit_compressed_read() truncates
>    it to a zero compressed_len and submits an empty bio:
> 
>      assertion failed: IS_ALIGNED(logical, blocksize) &&
>      IS_ALIGNED(length, blocksize) && length != 0, in fs/btrfs/bio.c:895
> 
> - With a 4MiB zlib extent whose num_bytes and ram_bytes are above 4GiB,
>    bvec_offset + bv_len wraps in btrfs_decompress_buf2page() and memcpy()
>    reads past the zlib workspace buffer:
> 
>      BUG: KASAN: slab-out-of-bounds in btrfs_decompress_buf2page+0x3e0/0x650
> 
> Compression and encoded writes never create a compressed extent larger
> than BTRFS_MAX_COMPRESSED. An uncompressed extent is at most
> BTRFS_MAX_EXTENT_SIZE for a regular write and 256MiB for preallocation.
> 
> Reject a file extent whose disk_num_bytes is above BTRFS_MAX_COMPRESSED
> if it is compressed, or above 256MiB otherwise.
> 
> Suggested-by: Qu Wenruo <wqu@suse.com>
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
> ---
> Changes in v2:
> - Use SZ_256M directly instead of adding a new macro, and leave
>    inode.c alone.
> - Shorten the comment.
> 
> Note that kernels before v3.9, without 24542bf7ea5e ("btrfs: limit
> fallocate extent reservation to 256MB"), could create preallocated
> extents larger than 256MiB. If such old extents should still be
> accepted, the uncompressed limit needs to be looser.

This is indeed a problem. I think you can limit the disk_num_bytes check 
for uncompressed extents to U32_MAX, just to be extra safe.
The U32_MAX limit should never be reached, but we can still catch 
obviously too large members.

On the other hand, you can add extra checks against the ram bytes too 
for compressed extents. That ram bytes should not exceed the same limits.

> 
> v1: https://lore.kernel.org/linux-btrfs/20261116044543.282187-1-teel4res@gmail.com/
> 
>   fs/btrfs/tree-checker.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
> index f021ac14babf..6bd1dfc58e7d 100644
> --- a/fs/btrfs/tree-checker.c
> +++ b/fs/btrfs/tree-checker.c
> @@ -244,6 +244,7 @@ static int check_extent_data_item(struct extent_buffer *leaf,
>   	struct btrfs_file_extent_item *fi;
>   	u32 sectorsize = fs_info->sectorsize;
>   	u32 item_size = btrfs_item_size(leaf, slot);
> +	u32 max_disk_num_bytes;
>   	u64 extent_end;
>   	u8 fi_type;
>   
> @@ -377,6 +378,19 @@ static int check_extent_data_item(struct extent_buffer *leaf,
>   		     CHECK_FE_ALIGNED(leaf, slot, fi, num_bytes, sectorsize)))
>   		return -EUCLEAN;
>   
> +	/* Compressed extents are at most 128K on disk, preallocated ones 256M. */
> +	if (btrfs_file_extent_compression(leaf, fi) != BTRFS_COMPRESS_NONE)
> +		max_disk_num_bytes = BTRFS_MAX_COMPRESSED;
> +	else
> +		max_disk_num_bytes = SZ_256M;
> +	if (unlikely(btrfs_file_extent_disk_num_bytes(leaf, fi) > max_disk_num_bytes)) {
> +		file_extent_err(leaf, slot,
> +		"invalid disk_num_bytes for file extent, have %llu expect <= %u",
> +				btrfs_file_extent_disk_num_bytes(leaf, fi),
> +				max_disk_num_bytes);
> +		return -EUCLEAN;
> +	}
> +
>   	/* Catch extent end overflow */
>   	if (unlikely(check_add_overflow(btrfs_file_extent_num_bytes(leaf, fi),
>   					key->offset, &extent_end))) {
> 
> base-commit: 3aefd67f08f8ed59ed0fa90619b25856df415031

