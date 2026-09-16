Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F380D3ADBA4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789527060; cv=none; b=t0VOiSYwbzEQabGOhSh0NGevU52+RI5Wy6sEUzcLSn0JDXpPblOdmmDaBB1ljVkjArk49giChBXtgQc3qFIZaEtO/0weEotbqtyrfBfWrIuaLg5SOttrncMthFjbSH2RZ+MaDHGSaqgoPtnRnQl2RA9/6gAl3fy2NnnQ+ObclDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789527060; c=relaxed/simple;
	bh=DciTnBQPff66xkmxfkqD3r4DL7LVWZQu11Ujc1UQytI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jQkun9viwQCKzLvjSJ7WpkN8kFuOf0vRcjUwFMURm7DXLt5XwMSQKNIdljEJo26MmEmfm87muhVLFcQiRCZdBFILXqgQpVd4XFx54XGmcfD+Ugc1LLLepV5XQlqR8p4NEVbCeTUsTNnPers7Odr7azu+/Lxz+fs8GRMEQ+i/7oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JDjkl5sf; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JDjkl5sf"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294af0caa8so66099666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789527056; x=1790131856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bq6WQNK4QKgsbL83cPnHFCm/4eZH3ABH5Hw/0tLTVSI=;
        b=JDjkl5sfcsp77VN9Euv9YpEgBKJ63uA4vTVajjvyJ9KnT7lX6JhmSIwGsSzDTYfPl3
         w8GgR8i6/dIQKfKTb1N1Pabf/zOyd7i/hj6DZPAXZXU2CUgaUT2/KRFVhplcEO2mWxmP
         b4sE30N0rFp9US8NH2xn+KD4GnyeYyUZwdk/e395IFvi70aw+uWnmgF9anI462TLUf30
         J6F/bO7rh5pNomiaB3bxvLdYDP0SGi+k0botLIfUEsmLj7go/a0chEfqlSPSkgOEJQhf
         1bGGhJU+VYpc+xtfI/bB2+nTkL7/F8gyI9uD83PB1/sMBPiru0kUjQEoInyaXtRTDH2I
         hyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789527056; x=1790131856;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bq6WQNK4QKgsbL83cPnHFCm/4eZH3ABH5Hw/0tLTVSI=;
        b=jmFLcJ1NGMCwyKKzBa35SqBIUVNDKpfu0JfRj9EGgR1Y3RsxDo4IaPkP/t5TAgplFl
         zLxmb3+3o18/rF5284HXzjpOSJSHeXDJWn2wz+NaLL+qp4xzEkc6yDqfnFL3Z3bOFQQh
         mFhLtA1HhZ9SfFzakn/AeHiQPQNZVmG31xNonwl16xMkPIeQb4myGST58TmqF3dJvMKS
         UpL5WOi8YIQpeTWgITV7Uii/W+UShswsj5o92kj3aSRZ1+Wg2s9xBp8ILY8cKP12HEm7
         ockIogr5exB9yhDt6uF+ZSPeRm1TlAMtl93zT/FqZCOOXMHgwcYPgjBrxkplFhUSA69c
         DpQA==
X-Forwarded-Encrypted: i=1; AKwUvBza80VlARKcWmIhSWYJRP5UBLMvEznEqNxfsV7SwM6hGWgZ3Q9w8s3zxVsqCahzBrWLONmpEKLkB5lIPzY=@vger.kernel.org
X-Gm-Message-State: AFuF++nREisd+WoFvPjtc/XB6HtQOJw+ngqvaG44k1MsTFd07K/4WHN1
	YK9/RpvQnDG6BtKGqZdMFQ8RpO+Bj3/iYbyAlAOIDR+sIpFwqM1YlbRe5JqiHgToJhI=
X-Gm-Gg: AYBFou2ziWwGtw98ERA/NePWC6hXaGFmouY/HUZ7r2SMr/AM7MlW+c4fCekDcKkJ37y
	HSX+WQgsFMFUdL5wuZLNHezpCo0G5CyfkLego7jJzEcscxWjbAOMXkGRoT7mQGvGWCtKxQ8ung9
	YVc9kueqHBNRhUeDQ2N/5GI8h3VMUhl1ExluQAls0pUArYhcAvKldomg0Ed1q8p+Y6pnY877FdC
	NhUa/JIYTyzdNLzMRphl1C70vYYl2BvuVLLUkMpkQBVAvy5MPJsYhp8MLgqY7QNSfkGTqXDBCkb
	r1d1uF2DZJAa/Cd1ZHFqy24SomW5WchvhxCfmPB7u2ihRTvK7LBS4LEZmWMYX8/mRakGRMPmYo/
	sLSOXHkQiwMuiZvSEK4yaLVOWyTWnSrEX3onaI1iZeLSlhlWE3V2ZmrTjs+DMCUa9tWLgnklgbD
	My90FeVKKGH0L4h4NJxm9q9Od+jZ6oh0wAntzdoI4C2TMdFrL0lEdby89lSpQrqIs=
X-Received: by 2002:a17:906:794f:b0:c29:3aef:f2e2 with SMTP id a640c23a62f3a-c29e53e6187mr32460666b.40.1789527056250;
        Tue, 15 Sep 2026 19:50:56 -0700 (PDT)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e19b9d95bsm589551a91.0.2026.09.15.19.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 19:50:55 -0700 (PDT)
Message-ID: <03fcead5-80fb-480c-ae6a-6cb0ae5d90d4@suse.com>
Date: Wed, 16 Sep 2026 12:20:49 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] btrfs: clear free space tree creation state on rebuild
 failure
To: Guanghui Yang <3497809730@qq.com>, linux-btrfs@vger.kernel.org
Cc: boris@bur.io, dsterba@suse.com, mason@kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <tencent_F71ECF81628C274CC89FDB3304420C2D1506@qq.com>
 <tencent_705010B6315454003C478AE79E1F215E6E08@qq.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
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
In-Reply-To: <tencent_705010B6315454003C478AE79E1F215E6E08@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/9/16 12:08, Guanghui Yang 写道:
> btrfs_rebuild_free_space_tree() sets
> BTRFS_FS_CREATING_FREE_SPACE_TREE before rebuilding the free space tree.
> Several error paths return without clearing this flag.
> 
> The transaction restart failure path can leave the flag set on a live
> filesystem, causing delayed reference processing to be skipped. Clear it
> on all free space tree rebuild failure paths. Keep
> BTRFS_FS_FREE_SPACE_TREE_UNTRUSTED set, since a failed rebuild leaves the
> free space tree untrusted. Callers must fall back to extent-tree caching.
> 
> Fixes: 882af9f13e83 ("btrfs: handle free space tree rebuild in multiple transactions")
> Cc: stable@vger.kernel.org # 6.14+
> Assisted-by: Codex:gpt-5
> Tested: make -j$(nproc) fs/btrfs/free-space-tree.o

Just remove the useless tag, and run a proper full fstests.
> Signed-off-by: Guanghui Yang <3497809730@qq.com>
> ---
>   fs/btrfs/free-space-tree.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/btrfs/free-space-tree.c b/fs/btrfs/free-space-tree.c
> index 1b3d82ae3de8..b7a4a6ade30f 100644
> --- a/fs/btrfs/free-space-tree.c
> +++ b/fs/btrfs/free-space-tree.c
> @@ -1353,7 +1353,7 @@ int btrfs_rebuild_free_space_tree(struct btrfs_fs_info *fs_info)
>   	if (unlikely(ret)) {
>   		btrfs_abort_transaction(trans, ret);
>   		btrfs_end_transaction(trans);
> -		return ret;
> +		goto out_clear;
>   	}
>   
>   	node = rb_first_cached(&fs_info->block_group_cache_tree);
> @@ -1371,14 +1371,16 @@ int btrfs_rebuild_free_space_tree(struct btrfs_fs_info *fs_info)
>   		if (unlikely(ret)) {
>   			btrfs_abort_transaction(trans, ret);
>   			btrfs_end_transaction(trans);
> -			return ret;
> +			goto out_clear;
>   		}
>   next:
>   		if (btrfs_should_end_transaction(trans)) {
>   			btrfs_end_transaction(trans);
>   			trans = btrfs_start_transaction(free_space_root, 1);
> -			if (IS_ERR(trans))
> -				return PTR_ERR(trans);
> +			if (IS_ERR(trans)) {
> +				ret = PTR_ERR(trans);
> +				goto out_clear;
> +			}
>   		}
>   		node = rb_next(node);
>   	}
> @@ -1390,6 +1392,10 @@ int btrfs_rebuild_free_space_tree(struct btrfs_fs_info *fs_info)
>   	ret = btrfs_commit_transaction(trans);
>   	clear_bit(BTRFS_FS_FREE_SPACE_TREE_UNTRUSTED, &fs_info->flags);
>   	return ret;
> +
> +out_clear:
> +	clear_bit(BTRFS_FS_CREATING_FREE_SPACE_TREE, &fs_info->flags);
> +	return ret;
>   }
>   
>   static int __add_block_group_free_space(struct btrfs_trans_handle *trans,
> 
> base-commit: 587858367581b9c55c3690f4e63382ad622719d4

