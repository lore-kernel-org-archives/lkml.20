Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B8D50C280
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060476; cv=none; b=PlkxhFiCVvuUprp7p6yW0XYOoauHTsRrPcAO4wOBv+IHjN803k8WjOa08RBsFytksAgPjGOy8COLbLmMP32/poGvnw/PofZNenRuR6lqyFG6j3hL98L4kgcjvWx54novk0v3qAfnHQKGeiEAQ6rb+hRhDM167QqTcjCulrgJSkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060476; c=relaxed/simple;
	bh=uuA282mbAAsxubVd//hesrkFUMk7A9wWWPpltUN9p9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fibemgnA9PcOun3HPRb3cNCu+JKsowEhIvqG/h+6Fn2UwtPr7XRHDRkr8d4UA/5IHKFzkqzU2BqR+27hbz5cmx0mmNFNGoBJO2L68oIoF3LwjZo5XSfpWHLKGp2wEcLNKlJ5unFG1UWzxnv3hbUN9e6CErsItwtlnZ4/60NAfEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gymOQQaI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gymOQQaI"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso37067715e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792060473; x=1792665273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P3osTZ0BdPAIjeNNLvrEv8uJJ4FA/b0wHvWNDV0Nx5A=;
        b=gymOQQaIIRoElkvVPhqHyVMovxqZ3iQy0BLGbbbSRQNcs8Nk04LzDxcNi310uyQDl4
         cGEuORZ4GyMNNtMUxy2uu6yFYxwDhhF7I4aghNtJZMgwWjFD/+u8av3ZisfFN1Q5kGZA
         VwjzdOm1G8HZldqnyMLCmggWnSgNRs2WuASpPqKGqEW1Uk6DbPFcoYkv1hGM/sPpHaIK
         kiyjRu7YvOGsfnuTSSu8VCcmYEI1ctTG/fxxJrmlOMFfxhPxk02GEYw2jiv728M/abCC
         NHsTFR0wealdxpZOK25X6vkBD1JhnJtXL8tBreBhL2NdooUPB/GTZmN/8Y7b7Y44S5Q9
         MJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792060473; x=1792665273;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3osTZ0BdPAIjeNNLvrEv8uJJ4FA/b0wHvWNDV0Nx5A=;
        b=Ss+hHEzTE7zjhX4vdMYPI72iSZPfbcV6xzWLW0AH/U00kYujasislOzUa4y13Qg2Ug
         fnDfSupUbphE9HKqFSt3xw03a16ahqL3p4/jtMdNwlR0wZ50xim94/VVUYZNRkD+ojiA
         MYClkFnZ2vZZd00YIQhFA7gPOHAXprbScNV10cK8tIFPCjUGxFLldU4JkhhnuXo0timL
         /TMIjxlj0yEVMsTLyd29ZIIHSmjaerMUTE+EYAK1eyzjBWfyuWB74rHr7spg52nzc1xF
         WlUscVZa+3WcaiLn6VEDJXUPBRUk6X7kuzRNM6yTh2vVJAWn8J5wphbb9StePIPrYcKp
         M+0A==
X-Forwarded-Encrypted: i=1; AKwUvBzcE0pU7bj8J3h6937sT3DB5Wpp2ayFiXqLRuthYcSr33U6fy2Ox4xB4q7LqfJI4d906Y6ZT7oLW5Gh+iM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlhFBXUZKcDWLPGikXqFSH/7VhzJsl2gNVYtDwR6hgguPwP95u
	lH+lGEG2n/Zrm+6il7Uqw0IXX3GHYuSvfsC6+Wmaa2QLr2z9PVUmO4tlYzvFf2ddvZRtlXEroJ1
	lntlYqsAbwg==
X-Gm-Gg: AYBFou06Xm8Uf0y+5ocKVEDh8xS06Y72j7cqICWb9g/5U6djLztNsV8/MrMtN4PIPux
	cPjUMUDsXhMmgOEhwwEJVb2E7je/BBlaRsc0JkF805ZePhsTtkRMED3RViMDEIcP3f/x6BxZ4Xb
	7DCqEGByGCoHmWPqqRrJfeNTICY9LvOSHs6bMtMcrD73luSQXCwgMAUhkUo9+lts45K0xGDGXkh
	mgOGH4plBHHCFR2TgpsrbRTsjtspiB7pUYadiK1hjR1lkXAtbEBtN8oEaaS1xZpFmUmaUFbCUM9
	JW6dcug58D3oZ/711RGAe5gdI21ObiZ+lLstl0U5fXvHeAF3xyvwluHvs4sTZa/33fWZM7RVnff
	VHAkLgXtzgkruaW6Vw2f3w73tqnEOB5gn1el2Rm/+1I90Qy4Swf0AGPZ7acthsmXEMZTgLTawth
	0ZSQMRRgzUTOGKiKblPu7RetihDXBYmZPBejRIREtsuJLsq/VuCq2gGjhERjCay5gig4yy6ZlC
X-Received: by 2002:a05:600c:608d:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a18e48d45cmr404356995e9.16.1792060472529;
        Thu, 15 Oct 2026 03:34:32 -0700 (PDT)
Received: from [10.86.129.46] ([149.22.87.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944af2f1sm3803007a91.15.2026.10.15.03.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:34:31 -0700 (PDT)
Message-ID: <0928487d-bde6-45e3-868d-8bdf9d22b6c8@suse.com>
Date: Thu, 15 Oct 2026 21:04:26 +1030
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] btrfs: verity: propagate orphan insertion errors when
 enabling verity
To: guolingxing <guolingxing@tju.edu.cn>, David Sterba <dsterba@suse.com>,
 Chris Mason <clm@fb.com>, Boris Burkov <boris@bur.io>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <e3321d2d-d8dc-43e5-8501-31b2d5ae1146@suse.com>
 <20261015095901.4140409-1-guolingxing@tju.edu.cn>
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
In-Reply-To: <20261015095901.4140409-1-guolingxing@tju.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/10/15 20:29, guolingxing 写道:
> btrfs_begin_enable_verity() ignores the return value of
> btrfs_orphan_add() and unconditionally returns 0. If orphan insertion
> fails, btrfs_orphan_add() aborts the transaction, but the generic
> fs-verity code still proceeds with Merkle tree construction because
> the begin_enable_verity callback reported success.
> 
> Return the error so that fs-verity stops immediately instead of
> continuing after the initialization failure.
> 
> The transaction is already aborted by btrfs_orphan_add() and the
> handle is released by btrfs_end_transaction(), so no additional
> cleanup is needed.
> 
> Fixes: 705242538ff3 ("btrfs: verity metadata orphan items")
> Signed-off-by: guolingxing <guolingxing@tju.edu.cn>

Reviewed-by: Qu Wenruo <wqu@suse.com>

Will push to for-next branch soon.

> ---
> Hi Qu, you are right. The claim about leaving the on-disk state
> inconsistent was incorrect.
> 
> btrfs_orphan_add() aborts the transaction on failure, so I do not
> have evidence that ignoring its return value can cause on-disk
> inconsistency. The real issue is that btrfs_begin_enable_verity()
> reports success despite the initialization failure, letting the
> generic fs-verity code proceed with Merkle tree construction only to
> encounter an error later, instead of returning the original error
> immediately. This revision removes the on-disk inconsistency claim and
> describes the error propagation issue instead.
> 
> Thanks for pointing this out.
> 
> Changes in v2:
> - Remove the incorrect claim about on-disk inconsistency.
> - Clarify that the fix propagates the initialization error immediately.
> 
>   fs/btrfs/verity.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
> index 600337a84fbe..d92c9dab0293 100644
> --- a/fs/btrfs/verity.c
> +++ b/fs/btrfs/verity.c
> @@ -615,7 +615,7 @@ static int btrfs_begin_enable_verity(struct file *filp)
>   		set_bit(BTRFS_INODE_VERITY_IN_PROGRESS, &inode->runtime_flags);
>   	btrfs_end_transaction(trans);
>   
> -	return 0;
> +	return ret;
>   }
>   
>   /*

