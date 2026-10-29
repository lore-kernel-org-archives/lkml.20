Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793307624;
	b=YzpYUglzgUjd/cN5dsp0YSc0z8zOCYoUzA9QDB28GSaqIwaSFSyRT+QED7UczQO5xsdK
	 YpV3QytuCUOvi13NY1WuWzGUbfXTePtGQJ6J0fGKlF0+SB4xIGt1asAHPlK3d0IkKN+W1
	 eVHq/ulz2UKgC2+nxBTuhIkk3s6XW6JDBgf3EisRdT6VMMrKI2I0dMmV8td5GiIs/ZfAW
	 RIEhgJuy8D0VqLhFZzaRV5QrvuXNhGpK3Dyag/yZU5g8kM8lM50EyqQtEdoV/ENX++IOP
	 SiROjtIWxiSqnik2U4qCv4ErvkHHWcSR+bv105oEbNqv3OhYJ3o4Y5ha+Uv7Zcepiyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FZ3xAAoQ7KTxcnFozk8njy0v9vP13bSoxVqgwxzM6N4=;
	b=tEe/bAQ2jGGDZT3KXmQSC1YfReJGZ4HFJ5gCEM7k2Kx/V59rGayKv5RVEZdI8wZ8ati1
	 ezIsjKNvlXU0Iw1lE/Fv/u3lLKX2EXyK3vox5hGuofYzMdKju5UDRhyiNlLQVBGKeeVQG
	 zEro2JzQffGTVPpT3dWXjlUUp/0H4je5DfP9EKtLScetM0o/1i5KvxdBnQUpdEHuWrFZQ
	 LHxjoD2sYCrFFoZkyi7h+yt9sb1uu/TaJotLy9vqJxHMtUP1N56a/Z5PFDJrOZJh7z8V6
	 ATo/SDo0njrvP225euLx77q+CwhqsjlPOx6N/so5dmzSkIcWnTHs3+RCRjSqPFN5SnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NROchiMU;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D18606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1D18606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NROchiMU
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so136415e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793307622; x=1793912422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZ3xAAoQ7KTxcnFozk8njy0v9vP13bSoxVqgwxzM6N4=;
        b=NROchiMUwfPSnMItLWl1ZgnVceM+TLUqZO9ODpjiQPaShn0SN4H8h61I5CRHeiM5GG
         OAJmdT3Mi0ysz/DIKvvmqs/OynOc0ITVrtTthl3ms1LWb3+dZF9KYI1AXJA2hlL12341
         iOvM/YgT2ZYkKR0R3Te+VE+1u5wadYpHTMSAY0+7f9LVJjJzuqK1318MWg6iubhpzMeu
         SqBqJec8Okn6Um0QzrCp2tjqYw0kzH/aGc1YFKzhjwqcr2JJiCwennhX6C5YPCDAwbN/
         xElVj0tTprPBnka3gDT7qNd5dthcpZthXhjKMERVZ80Ck29Usu1fIdhR/OHerv9VBnbM
         Xasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793307622; x=1793912422;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZ3xAAoQ7KTxcnFozk8njy0v9vP13bSoxVqgwxzM6N4=;
        b=JHstiZ7rAjUpYS2qLmsyDx8yCvLTzvNBiPKjeq36idkKcMLwvRyRJQhvShQBzyLwB1
         53sPrM20zHuMQ8O5+tpWyiuSJW/KV2LHhkmVO+2U0bQZeuUODQCmrXQXslBu/mmhDQLC
         DxmgWHnGmpWOPBw9+cIRFCc+t0g3w2JNbTHJTznzImu9zVBvCCotZYchUk4yxS7AWxRy
         MYKIDDvsr2qusOMhgG4Ef7OltCDJE3G4Y72zOjPgkzM4hxnOF4Rbru7pBaX9sePZ3Bsk
         SI0EoIVPwLW9CMDY4OAuSIX9ScXEjNtSkIBvoy/iIl4ze/irL1CyG8CfqqvUEIvAgccN
         wfBg==
X-Forwarded-Encrypted: i=1; AKwUvBxYyX250vfe0F+hlvQLwO+lbQdKwNSUaiJg0jV2tvF0Bez2YiYR7h9SlzSu1LzSyyfVgk2c9wTZaY++dUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgx4vjZiGofuhaCq99yaY5SfdSAbkW305PZDsVpBn7PXcvMoup
	FXpclyowsNwGtPAFCMFkaaaXfuN9432sg57t/r6WbdrYGkf0aMDbStcIWRcnySwjtc0=
X-Gm-Gg: AYBFou1NRwZzv9NfqhJMuaYy37YbXsaixcYRRrUSBPNWxGAQrCERZU6tNOkGPu824/6
	ovenyBP8I8Ra06XCfvVMlQcQt5t6zbwy0coRLfs4XJqE3nzszbPc+EDhUIe0gKw2jFFze2o6Qoz
	AtC540R6ldoFQnfTQC8jPAn+tUJ2LKotTV6+AIilMIsCdwLLXS3OcYegfgKgqUSZdRz8PXVrKmh
	wcXUR+VI+NrNSLUl/PSdJhLvGFieMtCSWjSI1vGePOOej0zKPqfpE1SWtkfc8JDodyZOo65IcD1
	L4skqI52vo99EijAtbEDzM96eg2cLP5Rm1H3rjXAMBnepTw6vLpa1BL5cr4+TrQWGJVP0GKqyxf
	fgSqnBwQwGBggGNbM3d6kezyBz52/dE8AlLNJ/V9i0hz+e6ZnlgL/khheOXsGdzJ0udyetvXQ9K
	YeFCPbdjhsTlbFV193+8omb1ejgi1cjlRou6rkCKxBwwdp7nFAh6T7TxVDBNZxNqJeDhjwxyVNy
	6xdLDEsxj4qbPUtJ0RAfrOENng74iYU794co4q8/ip7eE1ZRMDPBawipngAbi4e99hrkC862G6H
	WBQ0JuWVrOxy5rbqm8QxkA==
X-Received: by 2002:a05:600c:46d1:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4ac17b2c8a7mr3409785e9.25.1793307621934;
        Thu, 29 Oct 2026 14:00:21 -0700 (PDT)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85e4ff4csm366033a91.1.2026.10.29.14.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:00:20 -0700 (PDT)
Message-ID: <6ad220fa-d6a0-4b4c-a313-a0cc052b8637@suse.com>
Date: Fri, 30 Oct 2026 07:30:15 +1030
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
Subject: Re: [PATCH] btrfs: reject zero num_stripes in the system chunk array
To: Cheng Yongkang <teel4res@gmail.com>, David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <179328314071.648427.12527832319954042748@gmail.com>
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
In-Reply-To: <179328314071.648427.12527832319954042748@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/10/30 00:42, Cheng Yongkang 写道:
> validate_sys_chunk_array() reads the on-disk num_stripes and passes it to
> btrfs_chunk_item_size() to check that the chunk item fits in the system
> chunk array.  btrfs_chunk_item_size() has ASSERT(num_stripes), and the
> only num_stripes == 0 rejection is in btrfs_check_chunk_valid(), which is
> called later.  A crafted superblock with a BTRFS_CHUNK_ITEM_KEY entry
> whose btrfs_chunk has num_stripes == 0 therefore trips the assertion
> before the invalid chunk is rejected:

Since it will be checked by btrfs_check_chunk_valid(), why not remove 
the ASSERT(num_stripes) and let it continue to btrfs_check_chunk_valid()?

The whole idea of tree-checker is to concentrate the checks, not 
distribute them again.

> 
>    assertion failed: num_stripes, in fs/btrfs/volumes.h:714
>    kernel BUG at fs/btrfs/volumes.h:714!
>    RIP: 0010:btrfs_validate_super+0x3ce7/0x4210
>    Call Trace:
>     open_ctree
>     btrfs_get_tree
>     vfs_get_tree
>     do_new_mount
> 
> Commit 2a9bb78cfd36 ("btrfs: validate system chunk array at
> btrfs_validate_super()") moved the validation out of
> btrfs_read_sys_array(), which rejected num_stripes == 0 explicitly.
> Reject zero stripes in validate_sys_chunk_array() before calling
> btrfs_chunk_item_size(), so the crafted superblock is rejected with
> -EUCLEAN before the assertion is evaluated.  open_ctree() turns the
> validation failure into -EINVAL for the mount.
> 
> Fixes: 2a9bb78cfd36 ("btrfs: validate system chunk array at btrfs_validate_super()")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
> ---
>   fs/btrfs/disk-io.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
> index c628c50..920ca4b 100644
> --- a/fs/btrfs/disk-io.c
> +++ b/fs/btrfs/disk-io.c
> @@ -2389,6 +2389,19 @@ static int validate_sys_chunk_array(const struct btrfs_fs_info *fs_info,
>   
>   		chunk = (struct btrfs_chunk *)(sb->sys_chunk_array + cur);
>   		num_stripes = btrfs_stack_chunk_num_stripes(chunk);
> +		/*
> +		 * btrfs_chunk_item_size() cannot represent a chunk without
> +		 * stripes; such a chunk is also invalid in the system chunk
> +		 * array (system chunks are never remapped).  Check before
> +		 * btrfs_chunk_item_size() so a crafted super block is rejected
> +		 * with -EUCLEAN instead of tripping its ASSERT().

Please let your agent to drop unnecessary comments.

It only wastes code space without providing any real benefit.

> +		 */
> +		if (unlikely(num_stripes == 0)) {
> +			btrfs_err(fs_info,
> +				  "invalid chunk num_stripes 0 in sys_array at offset %u",
> +				  cur);
> +			return -EUCLEAN;
> +		}
>   		if (unlikely(cur + btrfs_chunk_item_size(num_stripes) > sys_array_size))
>   			goto short_read;
>   		type = btrfs_stack_chunk_type(chunk);

