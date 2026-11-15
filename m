Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776479;
	b=zVfdtBQhgqQpMcWrvB6fuJfqRzCOwHG+DBh8ldoreO6rEQZrrpzumDkoRLHduHsTa2/C
	 rNbktDy62hwFmje1/yW8gJtN45qvJPM6kY110v3ID+bCkXbOSEcd8LvphxeIx0pj6tgPg
	 aR3bO8aLetYMGmFLza3jV7BzKa/yMvXb+MNrlFe6U8n2k8V7cI/xqkvZcFapS1+FpEv7x
	 EISXedFfQUMDU5y0KBvpy1zSrf4XRH8iSSXxesfwpdoPfAQAhzS319eSGQoZtvFzwtdd5
	 sP+Ko63PIdebk2TF1+iUU2BXhKx8+KBqQCgKQ7EcVFhnxQtUSxJhjlzDaHFV4VM56lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bNjov9LgQsesTZjepT2rkVQQ9qOJHCw/ioD8k3rWQj0=;
	b=Vgi0Knpu3SuFeOByaJ9GGg2AImw/P8KgAb4Ev+v4fkFBO7ajEsPJvfR/YJCyXfjbr0go
	 9l7ZapL3zDmQ2DIWQeUy+VyMTFA9qPthqIWB8SLe7itQTYsn927kScgkN3NgnZ7vINGc6
	 jjyxOuc4wiBw7iQGaboHaHhoTjBLyg/tMohKi7po7m1ZDP+ozEC2pjw8ZejHrMm0sKc9L
	 t3YblXI09fZe1mD+gHy1f7uc5/qdhRBrSGJAfdkYEi5LwQACcMEOobmomfnNMUPRu+HwU
	 2ayL8QqWjWUkmitF0iwKZwxN1e9Ba2PCFDCNZODni5K9jfYYFDXq957NG2DLA1Mb2mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HxDp9y+l;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5667606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5667606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HxDp9y+l
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491846221ffso2508754f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794776477; x=1795381277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNjov9LgQsesTZjepT2rkVQQ9qOJHCw/ioD8k3rWQj0=;
        b=HxDp9y+ldGKCrbWNufbbvjRtOnzXim2uY22rMrHfM5gfW77JufqsBtmH21ju59HkCC
         a3fIKiFpb6wGlOrx/xAcK4enZ4bRtivCQsv+cjpoJyJa4mQ149GlDgbqA38EQ6ostZEi
         pebHsKzx5gSj4oNfycHty7rrp8akA9ZzIsyMJOHhvPpiuZNM/MNf4LVszXct+f1YtGAj
         b0yIlUmLyrRhAohPDNHESgncXZvPl/7wsIjQ0aBZxJEWJPzdDtsTVV0YXp0dJZb/LLbc
         5ZtfzYZ7I65BJs52+ngI/W2MrmHXtiRMbMHce3bEaTTfjc2baLo2yy4tXGiDpB5g9AgI
         Tt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776477; x=1795381277;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bNjov9LgQsesTZjepT2rkVQQ9qOJHCw/ioD8k3rWQj0=;
        b=ci6mC+K6spWGEcOE3NuP4fZu+M3oAQLEo4u5F4zMb7t+5Fd0bVpBhEDbwDhHewfmDt
         QuDnFxKEHli7XDRLPZ+0xa1KpYtrVDI2GsjXp5N/lPAV+GR2acdAa2FENddd1i5QEwBa
         sHR+Gh+eqM3p8+xwhsTun1+X4UQXO4Ln+GjSQIRfR0KK6F1yNEdb4Y1ybjdpLD0vPWM7
         i/adcQ5pJQaz8Fx0/HZ9Zu5jb+ou62ITOHFc1MdQ0OfvXyGV8jGIeoUJN/pd2d3KrZ4f
         76VBET0qOm+9vo9SR1q4XSEfvHbkkMZC8A8Gog4PXOGqFhsmTyjd5cN21SXwr4fb3Iec
         AQZQ==
X-Forwarded-Encrypted: i=1; AL+hErHeRc9cIO6FRbqZEPXjQd8EoWEfqZy+tmv/QG/wZioPL5lxzm/T6kpBue8se7/UIAx4QRJsctz5tx7J0GA=@vger.kernel.org
X-Gm-Message-State: APuU4Z90wnPfhSYiduzxP2H1RmIp2eiJqpqG2YPd/lNo7MPGNeUDQbnZ
	t1GVa8E/6J82B11uNykn9p4sSz61qZcfG3/WJjZsIjMHjgXKOa08eADIEId3g7/uxVk=
X-Gm-Gg: AYBFou1nEUPYib7SAwxC+tosq9Xm8hmb5ctXDp8y+Tqc3vfLkCHApP7p9fAltN4AaXz
	QmihA1wXr5nFTaqrkYH9eHMD0gCQHNAMN2O07RBU+C3PpnHokwGCwxn69qQjnMJSlwke0VhgOcg
	vmOqlCKNP2v4wKBQ1mCfQqWSD0/AUvKcCs5rXjuYV22U6CkXAxh1ZV10/RCW1Ig94DfZ3zF0spp
	EedzR2IPMrUWdFJGOLqf+zTrfYcaE1RSr5tE1zCUx3oED/dxvW/A3Nn1rSeXMMwQdR1nvnPcg84
	HlFKlfH1smnkCcMv7Tr+rItse64CXBiKC/dkRLuh3/RPpVqTJ0PYIS99fj8IcQ/yxXbY3fJ92Ey
	3VhwJGSj/Biw3UYrKbPY8OTRvB2OoPgEnNXY94RCFzfJh+4wPYxvzZp567UuHZkREdpMIbDS//p
	AYHtT3jttZ/DPxLeuGMVqEqCG1ZraCWZxgjrDWbF5t41eX5etO/U/a90wiohQth8WJZDR1tpi32
	m+HIY1wUmUjMLt0hMqW6D1HtcwtQC8qQgKR5EmdTVSnLhNRRikYx3qtOQUPpD4kOTto4uuTWEiN
	s5GDdDLup2y60Na7pLS1yeXeQd+PsOnShPQNbnHOvG0=
X-Received: by 2002:a05:600c:b99:b0:4a8:cb23:f71b with SMTP id 5b1f17b1804b1-4bb55a92e7fmr180864905e9.18.1794776477011;
        Sun, 15 Nov 2026 13:01:17 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm25468560c88.11.2026.11.15.13.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:01:15 -0800 (PST)
Message-ID: <500890f2-46f0-4ba6-877a-10ad7a171347@suse.com>
Date: Mon, 16 Nov 2026 07:31:10 +1030
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
Subject: Re: [BUG] btrfs: oversized compressed disk_num_bytes is not rejected
To: Cheng Yongkang <teel4res@gmail.com>, David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261115163724.226922-1-teel4res@gmail.com>
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
In-Reply-To: <20261115163724.226922-1-teel4res@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/16 03:07, Cheng Yongkang 写道:
> Hi David,
> 
> I hit a corner case with crafted images. It needs a compressed file
> extent whose disk_num_bytes is far above what btrfs ever writes, so it
> may not matter much in practice. I found two consequences of the same
> missing check.
> 
> check_extent_data_item() only checks that disk_num_bytes is sector
> aligned, and the zlib read path does not limit its input to
> BTRFS_MAX_COMPRESSED the way lzo_decompress_bio() does. Both cases
> below are on v7.3.
> 
> 1) disk_num_bytes == 0x100000000
> 
> After mounting with rescue=all and reading the file,
> btrfs_submit_compressed_read() stores em->disk_num_bytes in an
> unsigned int compressed_len, which becomes 0. No folio is added, and
> the zero-length bio hits the assertion in btrfs_submit_bbio() (seen
> with CONFIG_BTRFS_ASSERT=y):
> 
>    assertion failed: IS_ALIGNED(logical, blocksize) &&
>    IS_ALIGNED(length, blocksize) && length != 0, in fs/btrfs/bio.c:895
>    (root=5 inode=257 logical=9437184 length=0)
>    kernel BUG at fs/btrfs/bio.c:895!
>     btrfs_submit_compressed_read
>     btrfs_readahead
> 
> 2) zlib extent with disk_num_bytes == 4 MiB
> 
> With num_bytes == ram_bytes == 0x100002000 and a zlib stream that
> inflates to about 4.3 GB, reading the page at file offset 0xFFFFF000
> makes bvec_offset + bv_len wrap to 0 in the u32 arithmetic of
> btrfs_decompress_buf2page(). copy_len is then computed from the
> wrapped value, and memcpy() reads past the 4 KiB zlib workspace
> buffer:
> 
>    BUG: KASAN: slab-out-of-bounds in btrfs_decompress_buf2page+0x3e0/0x650
>    Read of size 4096 at addr ffff8881114049f8 by task kworker/u8:2/41
>     __asan_memcpy
>     btrfs_decompress_buf2page
>     zlib_decompress_bio
>     end_bbio_compressed_read
>     btrfs_check_read_bio
>    Allocated by task 9375:
>     zlib_alloc_workspace
>    The buggy address is located 2552 bytes inside of
>     allocated 4096-byte region [ffff888111404000, ffff888111405000)
> 
> The 4 MiB compressed bio only fit into its 32 vecs when the pages were
> physically contiguous, so before reading I filled 16 pipes with 1 MiB
> each. Without that the read failed with -EIO or SIGBUS instead.
> 
> Both paths are unchanged in next-20261113. zstd no longer calls
> btrfs_decompress_buf2page() there, but zlib and lzo still do.
> 
> Compression and encoded writes never create a compressed extent larger
> than BTRFS_MAX_COMPRESSED, so the tree checker could reject such an
> extent for all compression types, which stops both cases:
> 
>    +	if (unlikely(btrfs_file_extent_compression(leaf, fi) != BTRFS_COMPRESS_NONE &&
>    +		     btrfs_file_extent_disk_num_bytes(leaf, fi) > BTRFS_MAX_COMPRESSED)) {
>    +		file_extent_err(leaf, slot,
>    +	"invalid disk_num_bytes for compressed file extent, have %llu expect <= %u",
>    +				btrfs_file_extent_disk_num_bytes(leaf, fi),
>    +				BTRFS_MAX_COMPRESSED);
>    +		return -EUCLEAN;
>    +	}

IIRC I didn't add that max extent size for both compressed (128K) and 
uncompressed (256M) because we might enlarge those values in the future.

But considering LZO is already rejecting based on MAX_COMPRESSED, I 
think it's time to add such tree-checker.

Please send out the tree-checker patch, not only checking against the 
max compressed size, but also uncompressed ones.

> 
> With this change the tree checker reports the leaf of the first image
> as corrupt and the mount fails with -EIO, and normal zstd, zlib and
> lzo files still read back correctly. I have not run the second image
> on it; its disk_num_bytes is 4 MiB, above the limit. Separately, the
> u32 arithmetic in btrfs_decompress_buf2page() could be done in u64 as
> hardening. I can send patches if you want them.

I prefer not to use u64 for length. With tree-checker it should be enough.

> 
> Thanks,
> Cheng Yongkang

