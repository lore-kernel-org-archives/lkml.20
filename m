Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794791140;
	b=NjGh339+gFP5aB/8ms3BX3u6e6hejMG6I5Q/6EYqp8XnsEngci0EjV+ryU0au/J+64s3
	 8f7g1rsLwcvOHbURwPDbWOQPk08xansSoqtOMPiQcKQmTVlSTABwxgBH+G4AmILBQ9+rB
	 tJkHSGfQ7235cir9+QoGhCiAwcMScL7pTBzYKeUz9YWfGyF7Lhk/trHrETpejoE//I0IA
	 2pZ8SfVklAPsLbVYhCtkd04N6cCblG6CfKoT2VLxKmCtCp3d/AAPfzxboB4Y7HLIv8TL6
	 BAsrYDzbhmIbQF2hXd7II1siBpdghrJAll8A+Gt322HU8yB+xzVevtOdDyCniZgckMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794791140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VfdeyaxplMiH0V/bSm9+OA/vno6aUyvvc6YXYJuKXxE=;
	b=oiwrZwtFZ+6Ao7QT+7i8sZJKLYvCY5qwIkomOZM0+ddkPQxXlWKFbxO5gGaEIBlvxcbp
	 zxpeSV5RRd/iNZgEL/43EPfPU0yyt00cdjmi7qB6Li/9Vx5yZQWAf84ZLJKNNakEsM51D
	 bv+c/Rdv+Fi4LeItx0qT9LkTT0K07F4CHOj0Ng2aiIGrYK8ElIOKSNM/ddF+XISyynld2
	 xet2/dUxInkLdk5gRaD1GdCn8YyGy9CjFzpO+tDCwXHxIaCGk5bl+XxzHLPqAq4MkLZZb
	 HOf7OM4M8lAG7CIFemda8fj7Haf5oCRiPLf53LPc2x/RiXHlGLW/rw2gG60E+Fqf5Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PCNgPrpX;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADFA606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ADFA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PCNgPrpX
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso18756765e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794791138; x=1795395938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VfdeyaxplMiH0V/bSm9+OA/vno6aUyvvc6YXYJuKXxE=;
        b=PCNgPrpXuCER8KlKSpvrKkn01UDWBAGDK8lTzjlODRz/rpdMwNUVAgsl/SDduOg9v/
         uWcR194E4JvTnpkQYCFFlJnVarBaH1H+QueBhKqCtoifFOrao2fJxUqjiE+Dx2O+NQjX
         HRRpmFDEpXjZLevqXd3vcRYRZjbVH2LY4LFMVgDgi00UnoUc7MWtcyl2JxK1ZWFlPkAc
         AFZgf2U7nk/9azwBVii1hllHl6oHAFQ26XOg2DkG5jTQQp73/vvomRAFzJwk0exlK3gc
         zUbYJy+wyT/aA6rxnEMhBg48vUhTlhTMJ5EQcaTsUDemmATZNFq1iBIZxPWhGx8HVGBM
         WHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794791138; x=1795395938;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfdeyaxplMiH0V/bSm9+OA/vno6aUyvvc6YXYJuKXxE=;
        b=ay+dxNSfA9D34gUsaFAy8VH0KBEXA6XQjAV4QPgS7qtHnf2mQ+B7kVMPt/6PkYiyxo
         ONdz8bKlUnZsiLYX83fkXJbgz02VAojaFY+RnWJwNB3V3+CRaRJN8JuuFzb/T7Ix01gg
         OXrxN63qbFJMhXFPxE2Xl2byZzQjxBe95pl6EoI47botHF9gb51dn/m3PdPJN7IrBcnZ
         QehPCtWuacGRfcYGYXk2FZd8ZgDt8FWN7QjLADHX8LtdrNJDDsaeVhXxHzfpRqdvdbAr
         FGGFcFGxGbp9YHSVIhTBgCpgTV1Tu+g0KR/GCxDfnFNcrnvjNo7M8amavbwN8d9IZ6lo
         Ucfg==
X-Forwarded-Encrypted: i=1; AL+hErHMSXhzxheh/t1SDE+cok4Uz9jn8LNbBh9iBG+uwKCimc4fXhnNcHiO//GtgDg/JXuczHS7mkcuwWpAW/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y4l08ey2g4svgvJB8CKqryGhpcI4z1iqi916v5zkV+/Swadw5
	vw6hgM5aWFawbzVDiCv4m0IAMT/YLtuZSY5C0Oqmb8y0Q9pzua8KH1RX/uP7h7As6l4=
X-Gm-Gg: AYBFou02DRD4wyXRjLEK1/6cbTaDPj/eXagG7/oX8lcwS9NAZEpqojM6btUkKev8ASw
	9xe2M7X/BxKWbWbB5R9n6wF+/k4MI/2bUX0Yjm+WFXFX0UQ/Gtsm+dxKbupwUo+w/ee5mHEgDG9
	A+zrHWkSSe7FABKvCd9r2IocPijOVow9+qARe/boLBmjXvvzLUCu4FVcQq2r0MP2XipgdmmNRGZ
	BmcBCNkTqZcickp+ik9tS1Dd4+DIazpZoi6KaXREE/VMMcCeX4fBDCJy3OrHdbEIZOACKF/1nfK
	dNcS+irD41DdNMewLuuCVSo3MD9VIEwdKV5t3YFaot/8gq6/Um8K1PP7Lpar+0UJhX1KI7HB3PE
	qxeH9c+matdp0Kd8yDroYra3R79hm1OUHKLrwWrcCJ6ZV+1eLMNIq6F7qOOlZi5/ORrlQQn0J3N
	oSWp+n7oob5A+14OBmPMKNQgbgS3RXm+K5rDER5F8jcmqA1zcl/yO6qTzuiGr+nH9rSdKzNfRNW
	2lCeGSlhQtNfOAJhBwxJrK1dRYwPGr1FDTpBt59VlhJOnIhFyKNf2YKOmrub/ZRMqUAlYTPLWJV
	mjw83SndSbMdMIhY/EpF3g==
X-Received: by 2002:a05:600c:8518:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb5de1f1fdmr165601035e9.31.1794791138455;
        Sun, 15 Nov 2026 17:05:38 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18adce4sm3367925a12.23.2026.11.15.17.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 17:05:36 -0800 (PST)
Message-ID: <bdef73c6-765e-4ea5-ac9f-6dd1a7296fcc@suse.com>
Date: Mon, 16 Nov 2026 11:35:28 +1030
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
Subject: Re: [PATCH v2] btrfs: Clean up delayed inode items on transaction
 abort
To: pavankumaryalagada@gmail.com, dsterba@suse.com
Cc: mason@kernel.org, fdmanana@suse.com, josef@toxicpanda.com,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, quwenruo.btrfs@gmx.com,
 syzbot+55d1814e49f1fc0ba542@syzkaller.appspotmail.com
References: <20261114154207.73644-1-pavankumaryalagada@gmail.com>
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
In-Reply-To: <20261114154207.73644-1-pavankumaryalagada@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/15 02:12, pavankumaryalagada@gmail.com 写道:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> When a transaction is aborted, btrfs_commit_inode_delayed_inode()
> fails because btrfs_join_transaction() returns an error. This makes
> btrfs_evict_inode() skip btrfs_kill_delayed_inode_items(), leaving
> pending items in the delayed node.
> 
> Clean up delayed inode items when the transaction is aborted, even
> if btrfs_commit_inode_delayed_inode() returns an error.
> 
> Reported-by: syzbot+55d1814e49f1fc0ba542@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/all/6af131f2.44d55313.247daf.0001.GAE@google.com/T/
> Fixes: 2adc75d61203 ("btrfs: move btrfs_kill_delayed_inode_items into evict")
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> ---
> v2:
> - Add a condition to call btrfs_kill_delayed_inode_items() when the
>    transaction is aborted, even if the inode update fails.
> 
> v1: https://lore.kernel.org/linux-btrfs/avMkGGHSH2scfa0t@user/T/#t
> ---
>   fs/btrfs/inode.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
> index abaa33471456..b3a33541b8c8 100644
> --- a/fs/btrfs/inode.c
> +++ b/fs/btrfs/inode.c
> @@ -5623,16 +5623,21 @@ void btrfs_evict_inode(struct inode *inode)
>   	 * the inode update is released.
>   	 */
>   	ret = btrfs_commit_inode_delayed_inode(BTRFS_I(inode));
> -	if (ret)
> -		goto out;
>   
>   	/*
>   	 * This drops any pending insert or delete operations we have for this
>   	 * inode.  We could have a delayed dir index deletion queued up, but
>   	 * we're removing the inode completely so that'll be taken care of in
>   	 * the truncate.
> +	 *
> +	 * We must also clean up delayed inode items when the transaction is
> +	 * aborted.
>   	 */
> -	btrfs_kill_delayed_inode_items(BTRFS_I(inode));
> +	if (!ret || test_bit(BTRFS_FS_STATE_TRANS_ABORTED, &fs_info->fs_state))

Sashiko still found a problem with this method, and it looks valid to me:

https://sashiko.dev/#/patchset/20261114154207.73644-1-pavankumaryalagada%40gmail.com

Thanks,
Qu

> +		btrfs_kill_delayed_inode_items(BTRFS_I(inode));
> +
> +	if (ret)
> +		goto out;
>   
>   	btrfs_init_metadata_block_rsv(fs_info, &rsv, BTRFS_BLOCK_RSV_TEMP);
>   	rsv.size = btrfs_calc_metadata_size(fs_info, 1);

