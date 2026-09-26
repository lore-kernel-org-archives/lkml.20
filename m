Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77070364058
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790420635; cv=none; b=rlpPKsatGA4SdiRlkWgsHpAcAHVJrzKVrdl48OC7ENy875fvBF+8RFxJKAdMiBERvbFO8FuoR2boKsAE1iCS+ZemrBtypC8MzLa/7iipubg730fn9KloTkjktl0kDEf92Wh0tuaWmmwaIhQavM+8Gy1sV0w2h3Xv72VsjNXHpFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790420635; c=relaxed/simple;
	bh=LlgiwfRzoIE3I8OMh+c127pf3rQzOOCuQVdOldcNTVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C33A6k5415HO0KNkJ7hJlBNR4Axd3eqOR3XUD3fXXMEECCs99hWAuzDEi8ePdmG9K3hTfhFYXECcArmrDreoFRdKg4hZrAIoe7ggatYbKPTv8VIpyytR7ABB4SY+LLRZLwlfojbYPibRewMglPBKTCVpkjl51mkhPIIvnibYnBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AwhNXO1/; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AwhNXO1/"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6ab01dda422so671349a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790420632; x=1791025432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MR+p7kdm5Q2w5aYk+kb35qoP6J7GzovzPKCQ9WjAH9M=;
        b=AwhNXO1/nMV7kJhWz/RuDY3buvSXq02VJa1QSkfGSOMz/QKrBp8MEj+vSjynIP/8V+
         troW13iLJG4XxOf437gozud6wF3aNm/7iaH7my1JvKQg2Fx0GgiDLmfVzjtIBJ/9fnVi
         gYMdZaOrj4e4UY2DrmwKlfxRorBSF/gWJk/D3aYJ21046Q8p6zLaMN213fSizVjDwLki
         00+gE9LpIr7D1PddTKlJHD8L29PYZBvveN77JJX8z5dVYN23XxLRIPDh/+I+rCJ5hTRu
         B1XIGapiH1IpLmIxw/rLK6eexazM5L9LQLZR867me3Xgg+RylRZ8iR41UVkGrl3+o3S9
         terw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790420632; x=1791025432;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MR+p7kdm5Q2w5aYk+kb35qoP6J7GzovzPKCQ9WjAH9M=;
        b=X0TqGAAR/E8a9cOAqAsuL6D3zbxZWIiMR1I0vS8jkfJj83OlT+VkEbYeBNZlDXXSPb
         EfB3w5T9TkylqPrxGBcZgB5QSVA77QemryYOjl2vSMmYBI2uIQUnCs/filONCgYiE24a
         4XkCafJcgfcXvomSQKDWw4vFMesoAV46XriL0epM9fDzJWZLWzRmlPZomPE54zDcSWEj
         mON0+l4EhKpKwHvRYDGSaiz1cnbWDJkZO1a8RrcCVKFqq/73NY6IqEHkU/MpaRsCXY1k
         y9S6+eoCcpD569yxC7qGUvjfGbWgJuf9e3MM8CaAZ9wTtY42hlGVSAtrKaGwu1slhKQg
         xeEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJonAS28Wc4+ifMx0Lcr19UCDrm13A9hpp2QRpb4PKxUao5KWV64K2DB6+iBPvZsGYw38gJ5kzdNxIbUQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mWxGSdo5INKCr9Fbnqcmcn8UiE3WoGBayfIxElB4QEEVKpK7Kd
	RkBjPFEDDEJyNjuH5ihhQULj9rdwfsg3mqD5oYB3yJgckprdf3c8JS8+YOvMFV4r5cs=
X-Gm-Gg: AYBFou1mnq6FmE1Nd30p1zQeahyD1adKvRJX+FFkHuGecYS5lUu7i++gDkpOXprB+ww
	jejxm+R/n1nHfgeWrHaDC3g8gGmvYN2Vt7cFlmDq7GQikTOP95aCe7rD4KP3e1oFOnU7d7sof+J
	pp06lLc74tPNaYtCx+bBl7a+BFcjYz3cyMGVt7xsCvDun1L+E7HsJq7hl4pZqEApjQX9ovflYOe
	R3bSHVpm+KihWZx494vGGkO6tkRSQc9+dLFRCO/bUK5pxGqg89+vVWobaaREx8Hs0qUb+CyNjcP
	5rsPJqOfu8BqlGcof4Iz0qMUY0pE9OoL/ugcIzG5hCBbV/vQFCg8nge/OmgcoglBIaDgcPfw/Io
	1amMiw0ygjYS1HzYJ/WwK4doxQ8HtCcPPxnVeoyiYogaLMwwWDzBqP7VEseDO1dHnxfem17I8zg
	IRuF6UKlWVy7PGgNmr2p7X6U0YbHXaGkmIKdecrUCb47ubn4V9rORcweY2KQbwhQ==
X-Received: by 2002:a17:907:6c17:b0:c29:f51b:f75 with SMTP id a640c23a62f3a-c2ac5398d8cmr713326566b.23.1790420631627;
        Sat, 26 Sep 2026 04:03:51 -0700 (PDT)
Received: from [10.86.128.19] ([149.22.87.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0bec30aaasm8519788a91.15.2026.09.26.04.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 04:03:50 -0700 (PDT)
Message-ID: <a7d68d73-3ba1-46d3-a6c9-5ee213e5b551@suse.com>
Date: Sat, 26 Sep 2026 20:33:45 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] btrfs: use helper functions to check if a string has a
 given prefix
To: George Hu <integral@archlinux.org>, David Sterba <dsterba@suse.com>,
 Chris Mason <mason@kernel.org>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260926103651.41722-1-integral@archlinux.org>
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
In-Reply-To: <20260926103651.41722-1-integral@archlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/9/26 20:06, George Hu 写道:
> Replace strncmp() prefix checks with strstarts() when only a boolean result
> is needed, and with str_has_prefix() when the prefix length is needed after
> a successful match.
> 
> This makes prefix checks clearer and more concise.
> 
> Signed-off-by: George Hu <integral@archlinux.org>
> ---
>   fs/btrfs/compression.c | 15 ++++-----------
>   fs/btrfs/compression.h |  2 +-
>   fs/btrfs/props.c       |  2 +-
>   fs/btrfs/super.c       |  5 ++---
>   fs/btrfs/xattr.c       |  3 +--
>   5 files changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
> index c62b5148d5ac..82d0413e6236 100644
> --- a/fs/btrfs/compression.c
> +++ b/fs/btrfs/compression.c
> @@ -70,19 +70,12 @@ static struct compressed_bio *alloc_compressed_bio(struct btrfs_inode *inode,
>   	return to_compressed_bio(bbio);
>   }
>   
> -bool btrfs_compress_is_valid_type(const char *str, size_t len)
> +bool btrfs_compress_is_valid_type(const char *str)
>   {
> -	int i;
> -
> -	for (i = 1; i < ARRAY_SIZE(btrfs_compress_types); i++) {
> -		size_t comp_len = strlen(btrfs_compress_types[i]);
> -
> -		if (len < comp_len)
> -			continue;
> -
> -		if (!strncmp(btrfs_compress_types[i], str, comp_len))
> +	for (int i = 1; i < ARRAY_SIZE(btrfs_compress_types); i++)
> +		if (strstarts(str, btrfs_compress_types[i]))

strstarts() is using strlen(btrfs_compress_types[i]) to do the string 
comparison, but the old code will skip the comparison completely, to 
avoid accessing memory after @len.

Since @str is not NUL terminated, this is very dangerous.

To be honest, I didn't see strstarts() provides any readability benefit 
unless the parameter is NUL terminated.


>   			return true;
> -	}
> +
>   	return false;
>   }
>   
> diff --git a/fs/btrfs/compression.h b/fs/btrfs/compression.h
> index 1022dc53ec51..1d8e12fcd488 100644
> --- a/fs/btrfs/compression.h
> +++ b/fs/btrfs/compression.h
> @@ -131,7 +131,7 @@ extern const struct btrfs_compress_levels btrfs_lzo_compress;
>   extern const struct btrfs_compress_levels btrfs_zstd_compress;
>   
>   const char* btrfs_compress_type2str(enum btrfs_compression_type type);
> -bool btrfs_compress_is_valid_type(const char *str, size_t len);
> +bool btrfs_compress_is_valid_type(const char *str);
>   
>   int btrfs_compress_heuristic(struct btrfs_inode *inode, u64 start, u64 end);
>   
> diff --git a/fs/btrfs/props.c b/fs/btrfs/props.c
> index bb77d46376d4..c33930c58802 100644
> --- a/fs/btrfs/props.c
> +++ b/fs/btrfs/props.c
> @@ -301,7 +301,7 @@ static int prop_compression_validate(const struct btrfs_inode *inode,
>   	if (!value)
>   		return 0;
>   
> -	if (btrfs_compress_is_valid_type(value, len))
> +	if (btrfs_compress_is_valid_type(value))
>   		return 0;
>   
>   	if ((len == 2 && strncmp("no", value, 2) == 0) ||
> diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
> index ddb620ac241b..287cdc45bef8 100644
> --- a/fs/btrfs/super.c
> +++ b/fs/btrfs/super.c
> @@ -263,10 +263,9 @@ static const struct fs_parameter_spec btrfs_fs_parameters[] = {
>   
>   static bool btrfs_match_compress_type(const char *string, const char *type, bool may_have_level)
>   {
> -	const int len = strlen(type);
> +	const size_t len = str_has_prefix(string, type);
>   
> -	return (strncmp(string, type, len) == 0) &&
> -		((may_have_level && string[len] == ':') || string[len] == '\0');
> +	return len && ((may_have_level && string[len] == ':') || string[len] == '\0');
>   }
>   
>   static int btrfs_parse_compress(struct btrfs_fs_context *ctx,
> diff --git a/fs/btrfs/xattr.c b/fs/btrfs/xattr.c
> index ab55d10bd71f..9011d8096e2d 100644
> --- a/fs/btrfs/xattr.c
> +++ b/fs/btrfs/xattr.c
> @@ -239,8 +239,7 @@ int btrfs_setxattr_trans(struct inode *inode, const char *name,
>   		 * block_rsv of the handle and trigger a warning for the start
>   		 * case.
>   		 */
> -		ASSERT(strncmp(name, XATTR_SECURITY_PREFIX,
> -			       XATTR_SECURITY_PREFIX_LEN) == 0);
> +		ASSERT(strstarts(name, XATTR_SECURITY_PREFIX));
>   		trans = current->journal_info;
>   	}
>   

