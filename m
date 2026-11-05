Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793916392;
	b=DOWXieEP/jhI1Adf7oszj4NrHPayynRRy9rmyOORgmm37zwlx1/1K50aQlFKZXXs5o5Q
	 XbuwVCaDX69COJidvFuWZe546bq5oKWVAbSg1llLzNwTUVCI3KuE6+py/Pxm6VjNhDfQw
	 tqVyjhG1NCY2dc9TW8Asw0rluw9h7id/GldEzQQ0HxN3auiA79jQZ5PxKckny7XDiy4cr
	 M1yt3aqu1txmoY+c9YB6M/lhUFZFW7VQcovoy+9hASQA5sR/TZtzYbzc8OH+ntyFDx5yH
	 7ManGI7v28RF+FrpM6wBZayju1tQ/aGHvzvrdWkSHzEIotNDYaoBMoCppFuWTLBshEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793916392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ddrnZmJB37VdL/q6siqf8NrklVhSy4qXZBmdXTHloB8=;
	b=A+rdSXCxoV/RO7K3fGlI1pXfvFRcnKYHGgj+Occ6ctaprditQXl31qlH7TMEOZU1J6VE
	 Kr17K0f8Fvu8LqdSy5wVsX2KfdhyKhxHAOZi2Uv27pbea1rQSDGj7cbGU5nC/vptvKGjX
	 4MpXq1LOWAdE7MljjjWLn5kAfsa2OGmbjwxv/KpAhUZflbYLIVHAs/xVUXmTi1kkc0mM6
	 bbgFlv5CwpBqC6MRVKRiJqQc5oATvsy4QhyBtEsRI3Q/ojAV0KlTeAN9TfhW4zbeBgA++
	 3V9rM1E2V+xz0UbuJoyIP0r/hLNrjrr5mWSJIXTSHPmNuRgUTeA/yDf6juwSZXhvvKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WWJn3IZu;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB39606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CB39606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WWJn3IZu
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so143545e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793916390; x=1794521190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddrnZmJB37VdL/q6siqf8NrklVhSy4qXZBmdXTHloB8=;
        b=WWJn3IZu7/SBCB169KNJ09KjsviN3ME4cBl1ctqAtT1wnxTAHTXBfL0aVNat86L/Ik
         rew7TuRrNSljKrYLdSvxfQeEb3fagl3RHJ3UT7Pz8SyAGHEJq4aXR76oNzpCPUxSjwVL
         wWLZZvPlDb8FzUiviess2qAH/M/ocI4U8Mz7i7dGJjjv8hgan6iegAGL83dMBWrO1Ezd
         hQCZ6CAZ0xp83fsXLn1NdlOp9obV09taUMZR0sj/hUsRhwbQQ/EyT5j3oMhQT1VqdNP0
         drpqwQftx1DUSbakA9BTc/DLUyWQR8gyeelLNYAS753/pQCSh5iJ2UVBR2d69iWgF3cf
         z1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793916390; x=1794521190;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddrnZmJB37VdL/q6siqf8NrklVhSy4qXZBmdXTHloB8=;
        b=u/+FF3lHmc1e2J7X2A/6P20KIPsMZHcrpX8+SvkVyqnWKM6FpLTWRSHJYrwBOvKs+/
         IK2cEDh3PMJ6XCsvqGNlds/UNrAl0tOBtFbzInM4plQyTAcSZrI6im3gd0fc+zj+JCjo
         L67k6HbOtGhb3QF61ldjqIT3aROA7xVZ2vkBkOZpWo67RbLroOpe10G9/M0GSRBbS7mo
         +0i2xv0hxvcMLleF4SYpDnEgHl41FAy9idVTj8KQ/+VCBm+4zHPJSzQKzSInVnZ7KfuL
         Wj08hFC5H8esmENX0d4pJIcyilzslLsEbzQhZ3lrySBQWoSN4xooRaw7SlXTTGW42+Jl
         DDTA==
X-Forwarded-Encrypted: i=1; AKwUvByf9uZxyXc+/GJ8oalkfTb09nnNS3X3efPh94oeAgtX3tHUn2u5zF2FOVDESSio3Juox7I61mLZ3KpNp9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z98HklMx+joAiqArh9bM4KOn7CK+Jrr4owykPdImWd892IUDpzD
	8bskJBQvAwoMZHTVpUuVtBD6aMMp7C9F4da/4Eit84xJ50VQQGuL0vvYfLZ+NCpHhaQ=
X-Gm-Gg: AYBFou0idBIFHY04pvsNK1XvzsmHWEWnDZ/K6qEC7o4XENBlRcd3DLuc0WZZ75vET+N
	1Nm35ozSlhLmOY6gkM5MilIl2jaUTb2Py08z60vX7uASZLvCzSo81ZvZ2fxmfjBlHHJviU6lUHF
	YYp4PKWsO996KuqFPP5eZ5g9qkZsDjc/l43cIJreVj3gCtaF6qZsOVJzi6zwJamOqzrWFIlAiOp
	DdCd4wxLNJwRoug762f5Oab/WxcV7rhX1nEFjOLd8Qi2ATwJh7xNl5MkbVeZh2nXjqEGDlFQT5o
	r6fwlarJL8xlkIZ6YoFMcj52tbYZDDxyOUQDKFk+MAIVUny8AvFyOWTzSZvu6O2VuEZ0k6uViwZ
	NVl/miSgAGXuOBLtzLGc/UWDhYUM+i0hrwP5snIBvb+Jlc/zMxoOnZcHC5u7ZP7RQdYteO/7y0W
	sppjr6sAhn/5Ps5li0/0iBJTlv/DiXvV8b3Nu+EWlbmqC4Qtl0U7i1mW82bWHoiqfwQUXxKzgKS
	dmy9pjgtZnn1LDKhW43SS7jUv9o6ycWePILWK5cy/nF9NNo35a0gXpnm4GUZoCMLHduZsTPy5L+
	VIx916UOEEDaj4lron/f
X-Received: by 2002:a05:600c:310f:b0:4a1:acaa:9d4c with SMTP id 5b1f17b1804b1-4b6de78934bmr7539875e9.25.1793916389942;
        Thu, 05 Nov 2026 14:06:29 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f736a1da4sm1108191eec.7.2026.11.05.14.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 14:06:28 -0800 (PST)
Message-ID: <7595d1e6-b61d-48fc-b616-5562735297d2@suse.com>
Date: Fri, 6 Nov 2026 08:36:23 +1030
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
Subject: Re: [PATCH 2/2] btrfs: tree-checker: add balance item size check
To: Siddharth Mishra <smish149@asu.edu>, dsterba@suse.com
Cc: mason@kernel.org, josef@toxicpanda.com, fdmanana@kernel.org,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105214738.111967-1-smish149@asu.edu>
 <20261105214738.111967-3-smish149@asu.edu>
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
In-Reply-To: <20261105214738.111967-3-smish149@asu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/6 08:17, Siddharth Mishra 写道:
> [BACKGROUND]
> A paused or interrupted balance leaves a balance item in the root tree,
> with the key (BALANCE_OBJECTID TEMPORARY_ITEM 0) and a struct
> btrfs_balance_item of 448 bytes.  At mount btrfs_recover_balance()
> reads the flags and the data, meta and sys args from this item, and
> the balance is resumed with them.

What's the point? The background provides nothing useful.

You should directly say that a too small balance item can make btrfs to 
read beyond item boundary.

> 
> [CAUSE]
> The tree-checker has no check for TEMPORARY_ITEM keys, and
> btrfs_recover_balance() reads the item without checking its size.
> With a balance item that is too short, the reads go past the end of
> the item into the data of the previous item in the leaf,

Or even beyond the leaf boundary if it's at the last slot, which can be 
more problematic.

> and the
> balance is resumed with whatever those bytes hold.  Nothing is
> reported.  For example this balance item is 48 bytes short:
> 
>    item 11 key (DATA_RELOC_TREE ROOT_ITEM 0) itemoff 12545 itemsize 439
>    item 12 key (BALANCE TEMPORARY_ITEM 0) itemoff 12145 itemsize 400
>                                                         ^^^^^^^^^^^^
> 
> The mount succeeds and the balance is resumed:
> 
>    BTRFS info (device vda): balance: resume
>    BTRFS info (device vda): balance: ended with status: 0

I don't think the succeeded case adds any value.

> 
> [ENHANCEMENT]
> Add check_balance_item() to reject a balance item whose size is not
> the size of struct btrfs_balance_item, so the leaf is refused when it
> is read:
> 
>    BTRFS critical (device vda): corrupt leaf: root=1 block=30654464
>    slot=12, invalid balance item size, have 400 expect 448
>    BTRFS error (device vda): read time tree block corruption detected
>    on logical 30654464 mirror 1
>    BTRFS warning (device vda): couldn't read tree root
>    BTRFS error (device vda): open_ctree failed: -EIO
> 
> Signed-off-by: Siddharth Mishra <smish149@asu.edu>
> ---
> An alternative is to check the size only where the item is read, in
> btrfs_recover_balance(), before bctl is allocated.  That refuses only
> the balance item and fails the mount with -EUCLEAN, instead of refusing
> the whole root tree leaf:
> 
>    BTRFS error (device vda): invalid balance item size, have 400 expect 448
>    BTRFS error (device vda): failed to recover balance: -EUCLEAN
>    BTRFS error (device vda): open_ctree failed: -EUCLEAN
> 
> It was tested the same way as this patch.  The tested diff, indented so
> that it is not applied with this patch, in case it is preferred:
> 
>    diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
>    index 3d4ef6725..97154f59f 100644
>    --- a/fs/btrfs/volumes.c
>    +++ b/fs/btrfs/volumes.c
>    @@ -5230,11 +5230,17 @@ int btrfs_recover_balance(struct btrfs_fs_info *fs_info)
>     		return 0;
>     	}
>     
>    +	leaf = path->nodes[0];
>    +	if (unlikely(btrfs_item_size(leaf, path->slots[0]) != sizeof(*item))) {
>    +		btrfs_err(fs_info, "invalid balance item size, have %u expect %zu",
>    +			  btrfs_item_size(leaf, path->slots[0]), sizeof(*item));
>    +		return -EUCLEAN;
>    +	}
>    +

Don't put another diff part, even with extra spaces to break diff format.

I'm almost hitting the key to send out a comment criticize the 
duplicated code.

All you doing is just to make the whole patch hard to read, not only the 
comments after the "---" but also the cursed alternative.


If you are not sure about what is the correct way to validate such item, 
do read old codes/history of tree-checker and similar patches in the 
mailing list that got rejected.

Then you should not come up with such stupid question of using the 
alternative way.


The patch looks good, but the bad comments after "---" are so bad that 
they make me hesitate to even add my reviewed-by tag.

>     	bctl = kzalloc_obj(*bctl, GFP_NOFS);
>     	if (!bctl)
>     		return -ENOMEM;
>     
>    -	leaf = path->nodes[0];
>     	item = btrfs_item_ptr(leaf, path->slots[0], struct btrfs_balance_item);
>     
>     	bctl->flags = btrfs_balance_flags(leaf, item);
> 
>   fs/btrfs/tree-checker.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
> index f021ac14b..5698845be 100644
> --- a/fs/btrfs/tree-checker.c
> +++ b/fs/btrfs/tree-checker.c
> @@ -2117,6 +2117,19 @@ static int check_qgroup_status_item(const struct extent_buffer *leaf, int slot)
>   	return 0;
>   }
>   
> +static int check_balance_item(const struct extent_buffer *leaf, int slot)
> +{
> +	const u32 item_size = btrfs_item_size(leaf, slot);
> +
> +	if (unlikely(item_size != sizeof(struct btrfs_balance_item))) {
> +		generic_err(leaf, slot,
> +			    "invalid balance item size, have %u expect %zu",
> +			    item_size, sizeof(struct btrfs_balance_item));
> +		return -EUCLEAN;
> +	}
> +	return 0;
> +}
> +
>   static int check_remap_key(const struct extent_buffer *leaf,
>   			   const struct btrfs_key *key, int slot)
>   {
> @@ -2512,6 +2525,10 @@ static enum btrfs_tree_block_status check_leaf_item(struct extent_buffer *leaf,
>   	case BTRFS_QGROUP_STATUS_KEY:
>   		ret = check_qgroup_status_item(leaf, slot);
>   		break;
> +	case BTRFS_TEMPORARY_ITEM_KEY:
> +		if (key->objectid == BTRFS_BALANCE_OBJECTID)
> +			ret = check_balance_item(leaf, slot);
> +		break;
>   	case BTRFS_IDENTITY_REMAP_KEY:
>   	case BTRFS_REMAP_KEY:
>   	case BTRFS_REMAP_BACKREF_KEY:

