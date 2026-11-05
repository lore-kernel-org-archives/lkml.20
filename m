Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793916553;
	b=DsejHueG+qmrG68nAZ22yETqMRbWz7qieC4EUVHGNQuB6ucTI9QO7CEq1DznHNzWmKGp
	 iyKJ6ciHVsPSTnFqd+VmGPVXHFaObvsbDAnKY7l3xL1i3wA9z3jR98qRJ7Z3PR9OgTsxZ
	 on5X+/MvO6eSRg/i+15bIeyLaLzDNb0nMwMWHYH1Q9IxCPpd6toy+d2JYAqe/h6vPkyu0
	 STppXi36rp2D5bcUNKL8qY7rZg1Vt0AY1Sp79VkY4vOmBDBzqrGRWrxlEW7bRaxpba2Lb
	 cwAU0Lx4QBIfa74aSC85EOO8TIrel23ba1uImf/OAoNDCzarN2JK8nJHdXqO5ASBRAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793916553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=oRI/qr02oAtiXK1RP7wgyiWcWCQ62GEKrDC35YzunHE=;
	b=oEj5S5BMKn8hPMmrwLUL8hdTvPPdJbeVlkrBXceXm+200JkNivZmxjM7egt/C75L7XLo
	 ruY19SE4IBBmTGAvFLCoQ3z5WSN6DUZPntESxsMXZfrkGfi2Fcixmuaq2wHQSBA9jX595
	 7uVJsD4ZRKqlZmpI7fMk87SWb9qwIq7uewPUrO/nNg641/GL7pcU3NTUSoNx3f+/4Pm8T
	 8aFiSDJiemAcXwocywheKt8W+J9nqeJnPmB+VHFEk6P3sUy0TWHH9w3U/SmqCuWIH2/RH
	 RN+kjVkFTTbARY81WrU9cZvAanUUh0W7LjUmNSqMIbdUQ0E1OSfvmtPFgnxTZVCpRgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LgJwubQB;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645C2606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 645C2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LgJwubQB
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so6660835e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793916552; x=1794521352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRI/qr02oAtiXK1RP7wgyiWcWCQ62GEKrDC35YzunHE=;
        b=LgJwubQB6XTnBGzO+473DIgXgoAG68+ga6QOCtHMNL/FpijqKarU3WEUqC1fesZwPx
         UcfbreJYex1n+0WFywGH25i8c2dLQPK8Ms8aVQNDLZcLyhrfplXqLljrviwUEbQD95n0
         1c5FYpUuwrS3xxUKc6w4W5A94tgnTjYQukO4nkHmSJPZBtJFT/2YJTl/4zHltyBgQLC4
         zqcXuOuRPHCS33zY6OnoPosS8HyK7GRHJUkWp9FKQqx+8/3HE/YmiVemisJG65VzQ7Xl
         YNYl+brMLMZCugNog340S7RWZPPv5VRL907gDqXfKNp/nd2unoSCksRH4/AluA9Lfa4c
         893Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793916552; x=1794521352;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRI/qr02oAtiXK1RP7wgyiWcWCQ62GEKrDC35YzunHE=;
        b=zo7N8rTU2gTXwPneNuHanFOA6Lz2P8koROE7WEFcl2oarMazy+aFdlBvGyirHXO/ZB
         yBclsAUTrsYanhJszFBswoejpD5pwAXN97CATdVwLT+FCWUXQ3sIic6rJNm48tFDqL/3
         UmUKtHIe+zZ814VGWF3iu+dhG7E6dy4NerdnLrhAygaxwWI/gwsK44iD6g3xICwmSo6j
         kg2EiShrYZGw1qjPyC3DxG883VtiQ3uFfUNrqHL6KE6IU6lpN70Edzvqp4vIx6fQo6fk
         seQEb2fMxeSFLetNR/kNgYlezHx0HoIV63f122xwn3nlg6e4se/ZfMqrs4h3v7q+MHo6
         2kkg==
X-Forwarded-Encrypted: i=1; AKwUvBxct/qxoqEzAOyy0mqzlKYyABaCa1yq1r5MTdtHw3Yru+xUlyiAoVDBVTRjJfIJmHgBahtQyRgng9RFdHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/JXVDQXkRDBdBwq44APKtuVUhOwSVlQmJ5Y97UZ4e/jfS/Qso
	ADE0cj1dRXdc3Qg6sipsOXO0NdHUUY81mmVIbClafOFVzXUdQjRU7hy2p1JZBiBqhv8=
X-Gm-Gg: AYBFou1TlUgGTFnkWt2kQUvNojotVpgpnOeR/ju/ic6DmnJbV4eQmz+bL2GaMfxKQ2z
	g9mD415DYirAo6SlqOHQebb/ubsDKKN18/Wk1765V+tseLbZWCQBJ8uVYRB7qUHvmJzcaERerv2
	mMtBQCKk1N7RGeGAZX2z01tVayH+P36yTAOSY2Zw/yvVXgsKqaWgJUs6Nr15V7SQcGmvWw43HjC
	36gERV+cQuXKmBbbXs+bH9nv3z0ET2F+W5Nvtf09F/lO4RMNZjMUWEPwI8PDPo36PmxM7S/pzhl
	mStrbSdWQmb4HPEH22xDqOjK57IRMc4xFU3rqTaloFUiFVzDni06S4PrDlGqEZ6mqm9FU3Sofxv
	tbyjZQp0wxy+mJoww2z53+LV2FPJkZYNi9Rky1wDWO+cVcjuzyuqi9TCc2j6yCs++/4hxpzcqq4
	nmCNYMZy8c+Krq+N1ga2SVzpcJbePemmwKOSrtTMS9MKwCgHZVybOdlYZU8p5XQeqOYcAESZEvr
	j6GfDqhr88IxABjei0c0fBtuEdhaJPlRBBNXcgyZf0LxJR/6NTcrJUwTdPMFYqqWhw7rahAlsaG
	15MZfMElz2be2cPcs2VgPdYdUxx1sULiLU8W7asEIeM=
X-Received: by 2002:a05:600c:1507:b0:4a2:1002:223e with SMTP id 5b1f17b1804b1-4b5603f9c78mr47181865e9.7.1793916551633;
        Thu, 05 Nov 2026 14:09:11 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f722eabb1sm1326422eec.20.2026.11.05.14.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 14:09:10 -0800 (PST)
Message-ID: <4c59541a-3f19-4ad3-bef3-59b9c42c2e90@suse.com>
Date: Fri, 6 Nov 2026 08:39:01 +1030
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
Subject: Re: [PATCH 1/2] btrfs: overwrite a leftover balance item instead of
 BUG_ON()
To: Siddharth Mishra <smish149@asu.edu>, dsterba@suse.com
Cc: mason@kernel.org, josef@toxicpanda.com, fdmanana@kernel.org,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+dc9291cf132691aeb478@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20261105214738.111967-1-smish149@asu.edu>
 <20261105214738.111967-2-smish149@asu.edu>
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
In-Reply-To: <20261105214738.111967-2-smish149@asu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/6 08:17, Siddharth Mishra 写道:
> [BUG]
> A balance ioctl can hit this BUG_ON():
> 
>    kernel BUG at fs/btrfs/volumes.c:5088!
>    Oops: invalid opcode: 0000 [#1] SMP NOPTI
>    RIP: 0010:btrfs_balance (fs/btrfs/volumes.c:5088)
>    Call Trace:
>     <TASK>
>     btrfs_ioctl (fs/btrfs/ioctl.c:3523 fs/btrfs/ioctl.c:5650)
>     __x64_sys_ioctl
>     do_syscall_64
>     entry_SYSCALL_64_after_hwframe
>     </TASK>
> 
> [CAUSE]
> btrfs_balance() expects insert_balance_item() to return -EEXIST only
> when a balance item is on disk, and a balance item to be on disk only
> when fs_info->balance_ctl is set (a paused balance, or one recovered
> at mount). So for a new balance it uses BUG_ON(ret == -EEXIST).
> 
> Both assumptions can be wrong:
> 
> - insert_balance_item() inserts the item, then commits the transaction.
>    btrfs_commit_transaction() can fail without aborting the
>    transaction, for example when btrfs_start_dirty_block_groups() fails
>    to allocate a path.

I think no call site can handle a btrfs_commit_transaction() failure 
without transaction abort.

This is a way bigger problem than what you're fixing.

> Then balance fails with -ENOMEM and
>    balance_ctl is freed, but the item stays in the running transaction.
>    The next balance ioctl finds the item and gets -EEXIST.
> 
> - When the transaction was aborted with -EEXIST, for example after
>    "failed to run delayed ref ... -17" on a corrupted extent tree,
>    btrfs_commit_transaction() returns the abort error, -EEXIST, and
>    there is no balance item at all.
> 
> [FIX]
> Mount turns any balance item on disk into a paused balance, so a new
> balance can only find an item left by a balance of the same mount that
> failed after inserting it.  No balance owns that item, so let a new
> balance overwrite it, run, and delete it at the end as usual, as Filipe
> suggested in [1].
> 
> For a resumed balance -EEXIST is the normal result.  Any other error,
> including the -EEXIST of an aborted transaction for a new balance, now
> goes to the existing error path.
> 
> The BUG_ON() checks on the return value go away, and the one on
> fs_info->balance_ctl becomes an ASSERT().
> 
> Reported-by: syzbot+dc9291cf132691aeb478@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=dc9291cf132691aeb478
> Link: https://lore.kernel.org/linux-btrfs/ZNzE6CFOzu9kDG+G@debian0.Home/ [1]
> Fixes: 1bbc621ef284 ("Btrfs: allow block group cache writeout outside critical section in commit")
> Cc: stable@vger.kernel.org # 4.1+
> Suggested-by: Filipe Manana <fdmanana@kernel.org>
> Signed-off-by: Siddharth Mishra <smish149@asu.edu>
> ---
>   fs/btrfs/volumes.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
> index 3d4ef6725..4a8e5078b 100644
> --- a/fs/btrfs/volumes.c
> +++ b/fs/btrfs/volumes.c
> @@ -3998,6 +3998,8 @@ static int insert_balance_item(struct btrfs_fs_info *fs_info,
>   
>   	ret = btrfs_insert_empty_item(trans, root, path, &key,
>   				      sizeof(*item));
> +	if (ret == -EEXIST && !(bctl->flags & BTRFS_BALANCE_RESUME))
> +		ret = 0;
>   	if (ret)
>   		goto out;
>   
> @@ -5081,17 +5083,17 @@ int btrfs_balance(struct btrfs_fs_info *fs_info,
>   	}
>   
>   	ret = insert_balance_item(fs_info, bctl);
> -	if (ret && ret != -EEXIST)
> +	if (ret == -EEXIST && (bctl->flags & BTRFS_BALANCE_RESUME))
> +		ret = 0;
> +	if (ret)
>   		goto out;
>   
>   	if (!(bctl->flags & BTRFS_BALANCE_RESUME)) {
> -		BUG_ON(ret == -EEXIST);
> -		BUG_ON(fs_info->balance_ctl);
> +		ASSERT(!fs_info->balance_ctl);
>   		spin_lock(&fs_info->balance_lock);
>   		fs_info->balance_ctl = bctl;
>   		spin_unlock(&fs_info->balance_lock);
>   	} else {
> -		BUG_ON(ret != -EEXIST);
>   		spin_lock(&fs_info->balance_lock);
>   		update_balance_args(bctl);
>   		spin_unlock(&fs_info->balance_lock);

