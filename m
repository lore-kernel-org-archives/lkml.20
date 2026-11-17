Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901675;
	b=IDPGyxLYhOdgcHA+qxWhnzhnexPzRkLsW5Fro1KtRq45BFJMUZZItNW+GwBFPm1jwA5N
	 T8ACWYTvmGUDMasJS1oQOQz4pe2RmTrQ9X8O4P8JNtsgnn0Lnec7aSlFdu5wI4PSP7FM2
	 FihjvgyR0D3QSP0e36vF11fJFoDGdKIMMOsvVthUoJee+CIz7NDtH047yOBYhRuSRWBgP
	 /ke893C7S7NOQQhtmy/fbzxq4bGVmUqQ729EHlsS9tXt2+IAE2dmTV9JKCSfYjgfdSq34
	 Ahrig8dbstXM3JQdO6+Hrt/vYNxXfHhoBXXpkh1YghmHBlpZ+ceQZpJXkOdXzTxu2Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IDOSM+/DYZiQUyWd0XC3i8ZxJJ9ZhZijqLClYPiYOls=;
	b=z8TPbVlkLdDeXqBaP7yLiWWKo8DZJEZU00acRHE3AzblAdqnGnm/XkCABnlpiqoaGRVa
	 /wf+tZp7M1cjd9LP9e3RdTczHSEQ2JZY3R6RmivEcunhZtm5ugfqmQJ45hdfUgo07PBI3
	 +5kD/JVHVw6ljDX78lV2Vy6N5+50wJvP8JJPNApct9bpsFHhp+LgHsBEwXbTk6fzdhjgh
	 Z+8RUVJx9Jw1Dj2Lxs2e9qOt2m+NH9Am5IL8tIPBYWCrT8uUdKPAslBl2TiEJqLCtizFZ
	 Tu3flv2wUjccNlCt0Qh/1vDKtetIMFRiRKLI7mjv4tsnUHYx6lndhkg/Om3PQn3MYdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="B4kG/9Od";
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35079606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35079606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=B4kG/9Od
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50e26763a4so259964266b.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794901674; x=1795506474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDOSM+/DYZiQUyWd0XC3i8ZxJJ9ZhZijqLClYPiYOls=;
        b=B4kG/9Od3L/j8NNF/xTS0FgiXhIyCSz8Jj5A5NFCyV/14UswM/RvfsBc96odIeeMvH
         OOKtSofQDiuh0n7BctYYsuKXQZTe2UUv0xfFABK6ZkFCYfJ6oE+MTwkefBXUPOIQbDWj
         ZkefjgSKb1HjhL9HtYHAhY+wly8bFKK8GEuZeLBQyyt0aBz5AURrLXAcD2gDWEZueq1T
         E19NvgwGVdri7iZFvuP9xG2IcAzHRCY7eS0SEcp7JXctwKx5OaILpXrTS2YEgbtU8js2
         TudF//O/shrP0HuLNOyqWRMbKlmFVrHElGncwTo+MKXbwweXB00E8wjtYg2yvU8UBJwv
         qCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901674; x=1795506474;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IDOSM+/DYZiQUyWd0XC3i8ZxJJ9ZhZijqLClYPiYOls=;
        b=Uvpqo/RjfWjMgAbnNpMxNc1uZ1j/XW7IQ2f4LY0faeSkeCJTYZMXmbd1c9DeeVgHif
         8567gTrn1dD5E0uVFzr3k9bdzABUNZ4334QbkCLw0jZrfoe82gn95lwvWd6Y/rronPpy
         iT38FMH3hgEMzB0Q8V2LXl0iFO35/ZK0WATIyL0epWXqf5l1XRm2nF9vxv8/S5wZpN3D
         S0fTnJMN5MATUNsLNTeuVOFTaoBJFi6ruU9eGgRBpfKpyA8TszIA2llPZNmAZg4wjnR6
         GUkipegJ9+7gju9pQj5DggIlTCH1M6XRR2BMJKMpgaGY1O0n1fj1yqOdeka5lzkCPSQ9
         g7og==
X-Forwarded-Encrypted: i=1; AL+hErE9tD0/skqYT4V9PNeMu/UsWjrt/fQW2R77BAm2HyGg3YhKLmL+2r9bfg3mCl+oaoaDeQrLYIFWKOqTf4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UctX/8NNdyUnDP0d/Spwqv0cc//rKd8OMQLGhkKoxZR2JzGMv
	6U2oFLMfTnlMFcUoUmz9WxQBG15nk92jc2FIHh8rH0P06MofCXy7n0xjW6UMd1tFfco=
X-Gm-Gg: AYBFou31pF8VZINIoIWLPukHwE89lC7PjWtLmnfU91MQGM6MhRh4skw3sqbiH6vHBkC
	WFUuifKB2eq+t+31a3sS1pb6eyx+CyCa9fSIvn5H/IPQpCJsr6zbpiud0ksDTb1mWj+XI+RZvUP
	HklN06MXnxG7dYS+fBUicx1YB+5XsobwDA8G42/RDmN2CjOCzJeELUwwslN+sFxv/tbclB6yeSI
	B/plEynQSnbYNsRhgd5VI6LtyCgCWoFylBhwMlU552z0NVFrgidBgEffpWQYbnCyMaVXuUC3rlQ
	6NqTbd0DsGKVAkqJedshf1QFMHpC8241qPzYkXTNibwuvpF3M6ZoTBHXYDCYLf3V7g25Z0dabif
	PcNH8A32OcFHKHjfsPUaYkMTScfsdoReG5rNBRuZnJwf9L1MqSjLnI+XKBgwbOVRkC7kaYHf5yP
	AQ0p1a5u/3vrdXZ8n8WjV9e50ppWZSwbZucpvk6h8Wij38wkD2+S7tCMNMeYufdZR/dWXcpMJEo
	VlGLBCIJ78T/pllXozS76XKORAm6UkE1ZP//KahDXnaA/kc0Znh0bO/bhSw+wxvHAKP2es/Y6eE
	kdcs+k+oe1Oxc85TqPIdng==
X-Received: by 2002:a17:906:4788:b0:c49:91a9:c7e4 with SMTP id a640c23a62f3a-c50963434bdmr1151570166b.27.1794901673452;
        Mon, 16 Nov 2026 23:47:53 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad610sm2828211a91.2.2026.11.16.23.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 23:47:52 -0800 (PST)
Message-ID: <8857bbb8-11e2-44b7-a749-4396b88f1977@suse.com>
Date: Tue, 17 Nov 2026 18:17:46 +1030
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
Subject: Re: [PATCH v4] btrfs: tree-checker: reject file extents with
 oversized disk_num_bytes
To: Cheng Yongkang <teel4res@gmail.com>, David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261117064613.771336-1-teel4res@gmail.com>
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
In-Reply-To: <20261117064613.771336-1-teel4res@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/17 17:16, Cheng Yongkang 写道:
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

With all those enhance checks, I do not think the two reports add any 
value now.

The patch is really hardening the tree-checker, and that's all what we 
need to know.
> 
> Compression and encoded writes never create a compressed extent larger
> than BTRFS_MAX_COMPRESSED on disk or BTRFS_MAX_UNCOMPRESSED in memory,
> and its offset + num_bytes always fits in ram_bytes. Uncompressed
> extents can be larger than 256MiB, for example preallocated extents
> from kernels before v3.9 or extents from direct I/O writes, but they
> should never get close to U32_MAX.
> 
> Reject a file extent whose disk_num_bytes is above BTRFS_MAX_COMPRESSED
> if it is compressed, or above U32_MAX otherwise. For an extent with data
> on disk, also reject:
> 
> - a zero disk_num_bytes, which makes btrfs_submit_compressed_read()
>    submit an empty bio the same way;
> - a ram_bytes above BTRFS_MAX_UNCOMPRESSED if it is compressed, or above
>    U32_MAX otherwise;
> - an offset + num_bytes beyond ram_bytes if it is compressed, as the
>    compressed read path takes the decompressed range from offset and
>    num_bytes.
> 
> Holes are skipped, since without NO_HOLES a hole extent has ram_bytes
> set to the size of the hole.
> 
> Suggested-by: Qu Wenruo <wqu@suse.com>
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
> ---
> Changes in v4:
> - Also check ram_bytes of uncompressed extents against U32_MAX, with
>    max_ram_bytes picked the same way as max_disk_num_bytes.
> - Reject a zero disk_num_bytes for extents with data on disk, and an
>    offset + num_bytes beyond ram_bytes for compressed extents, as
>    Sashiko pointed out on v2 and v3.
> - Skip holes for the new checks, as their ram_bytes is the hole size
>    without NO_HOLES.
> - Correct the commit message: direct I/O writes can also create
>    uncompressed extents larger than 256MiB.
> - Rebase onto misc-next.
> 
> Changes in v3:
> - Relax the uncompressed disk_num_bytes limit from 256MiB to U32_MAX,
>    as preallocated extents created before v3.9 can be larger.
> - Also check ram_bytes of compressed extents against
>    BTRFS_MAX_UNCOMPRESSED.
> 
> Changes in v2:
> - Use SZ_256M directly instead of adding a new macro, and leave
>    inode.c alone.
> - Shorten the comment.
> 
>   fs/btrfs/tree-checker.c | 55 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 55 insertions(+)
> 
> diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
> index f021ac14babf..e7e0bb6be76f 100644
> --- a/fs/btrfs/tree-checker.c
> +++ b/fs/btrfs/tree-checker.c
> @@ -244,7 +244,10 @@ static int check_extent_data_item(struct extent_buffer *leaf,
>   	struct btrfs_file_extent_item *fi;
>   	u32 sectorsize = fs_info->sectorsize;
>   	u32 item_size = btrfs_item_size(leaf, slot);
> +	u32 max_disk_num_bytes;
> +	u32 max_ram_bytes;
>   	u64 extent_end;
> +	u64 ram_end;
>   	u8 fi_type;
>   
>   	if (unlikely(!IS_ALIGNED(key->offset, sectorsize))) {
> @@ -377,6 +380,58 @@ static int check_extent_data_item(struct extent_buffer *leaf,
>   		     CHECK_FE_ALIGNED(leaf, slot, fi, num_bytes, sectorsize)))
>   		return -EUCLEAN;
>   
> +	/*
> +	 * Compressed extents are at most 128K both on disk and uncompressed.
> +	 * Uncompressed extents should never get close to U32_MAX.
> +	 */
> +	if (btrfs_file_extent_compression(leaf, fi) != BTRFS_COMPRESS_NONE) {
> +		max_disk_num_bytes = BTRFS_MAX_COMPRESSED;
> +		max_ram_bytes = BTRFS_MAX_UNCOMPRESSED;
> +	} else {
> +		max_disk_num_bytes = U32_MAX;
> +		max_ram_bytes = U32_MAX;
> +	}
> +	if (unlikely(btrfs_file_extent_disk_num_bytes(leaf, fi) > max_disk_num_bytes)) {
> +		file_extent_err(leaf, slot,
> +		"invalid disk_num_bytes for file extent, have %llu expect <= %u",
> +				btrfs_file_extent_disk_num_bytes(leaf, fi),
> +				max_disk_num_bytes);
> +		return -EUCLEAN;
> +	}
> +
> +	/*
> +	 * The remaining checks only apply to extents with data on disk. Holes
> +	 * are skipped, as without NO_HOLES their ram_bytes is the hole size.
> +	 */
> +	if (btrfs_file_extent_disk_bytenr(leaf, fi)) {

Sashiko mentioned a situation where a dedicated hole can by-pass all 
those checks:

https://sashiko.dev/#/patchset/20261117064613.771336-1-teel4res%40gmail.com

I think a dedicated explicit hole check would be safer, rejecting 
obvious incorrect things like an explicit hole but with compression set.
> +		if (unlikely(btrfs_file_extent_disk_num_bytes(leaf, fi) == 0)) {
> +			file_extent_err(leaf, slot,
> +		"invalid zero disk_num_bytes for file extent with disk_bytenr %llu",
> +					btrfs_file_extent_disk_bytenr(leaf, fi));
> +			return -EUCLEAN;
> +		}
> +		if (unlikely(btrfs_file_extent_ram_bytes(leaf, fi) > max_ram_bytes)) {
> +			file_extent_err(leaf, slot,
> +		"invalid ram_bytes for file extent, have %llu expect <= %u",
> +					btrfs_file_extent_ram_bytes(leaf, fi),
> +					max_ram_bytes);
> +			return -EUCLEAN;
> +		}
> +		/* Reads of compressed extents use offset and num_bytes in ram_bytes. */
> +		if (btrfs_file_extent_compression(leaf, fi) != BTRFS_COMPRESS_NONE &&
> +		    unlikely(check_add_overflow(btrfs_file_extent_offset(leaf, fi),
> +						btrfs_file_extent_num_bytes(leaf, fi),
> +						&ram_end) ||
> +			     ram_end > btrfs_file_extent_ram_bytes(leaf, fi))) {

This overflow check should apply to both compressed and uncompressed 
extents.
This is not limited to compressed extents AFAIK.

> +			file_extent_err(leaf, slot,
> +	"invalid offset + num_bytes for compressed file extent, have %llu + %llu expect <= %llu",
> +					btrfs_file_extent_offset(leaf, fi),
> +					btrfs_file_extent_num_bytes(leaf, fi),
> +					btrfs_file_extent_ram_bytes(leaf, fi));
> +			return -EUCLEAN;
> +		}
> +	}
> +
>   	/* Catch extent end overflow */
>   	if (unlikely(check_add_overflow(btrfs_file_extent_num_bytes(leaf, fi),
>   					key->offset, &extent_end))) {
> 
> base-commit: d45cbbab23d3ca231771e4bff996a6a8118162cf

