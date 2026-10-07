Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102C726E71F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 04:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791348499; cv=none; b=cNEhb30qFtGDCYXZ+XZK9muxuK6Hs/VrbinXyPkXmINkRSBA6YMzBx4TsqjZ3WDZl3hlnNyON37jshwEBL5FytLuq6F4yFZwnP2swup8oPGNM/ulvEoy8C1/8mwvi8QdxSNMBSTCHD9KkVKd8UeIMl1cEN6cDB9IA8KDi0TvhHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791348499; c=relaxed/simple;
	bh=LUOwIF/+RKSg4yeAuSHwTalkrYAuYrT8ZtBENuizEq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i7IzlBzn7C8B3lB+hLFv/cpT6vn2zUMlyj45ujXhy32bCJnU8wfq+elXXodH34zhwjAUFQz15vRQyWlX/NmaB9ctRpD9rUx3atlpCrmK/0MYC9VOUEIB5AixbzQ6EDxvcfiQYtak1oehSmLlvRCHVzHwiwn7atiHDHZBVRmdH2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c66NvjnN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c66NvjnN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA8A51F0089C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 04:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791348496;
	bh=LI/GifCYkuyachy7bv9KoRPB+5bzVn2Chv8jale9T0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=c66NvjnNcdEWzLOlRO43M/oCgHpFTx5N6QOluYzF2FsuqaqZ9kSlksDekIxYjGa/p
	 IYpPf1UN5oBSRCF7kclHg9yHYtFk3bJf+Bm9MoR04KDz4O3EvKgi2ZsDVkbRMO4yAP
	 tDTGNmfQHK0XXsKVjCQcwXnrHmM9c8Xwl++dXWl8UpBSRFfJ0ABcsc0Sd5gEhw3M+V
	 wwPc/z2YtdeSpIldEl0NGdqc6MSsGSykBah1iY+lr5zcS8lBmy+ziV/XfCSNy/xkpN
	 KqLR60M/DKcqC2dF+Rvfr2C/0tdLaecI9u/m7vhEUPdCI5Z3LqWeYdBqxLDaDiuCJR
	 cZz42FatNFYrw==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2a4e013a44so535964766b.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 21:48:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx6ECvIxNkMJSCcQTf0rDev6ku2BXbQ+lighTv7rYQSCJjeNeoZNuwq+Pa9ZAoVmf5FQs/3kAnqIerTz5M=@vger.kernel.org
X-Gm-Message-State: AFuF++mmeWTqUBWszDxm0S8j3Bpf4DQtiNnMGM3ORCF93ukDugK8jrl+
	7ScqFa48TI7YUOEDxCYzQVD2++c6q3pOj/K9I84z305l58OqoO260bX510Ip+V793t/K+KV3b5F
	fQ0JEPkolmdQkp+f5pJ4LSqpHEC9g4n0=
X-Received: by 2002:a17:907:3e20:b0:c2e:4f16:fbf with SMTP id
 a640c23a62f3a-c317c09e5c1mr89396466b.31.1791348495342; Tue, 06 Oct 2026
 21:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004135638.1888530-1-anmuxixixi@gmail.com> <20261004135638.1888530-2-anmuxixixi@gmail.com>
In-Reply-To: <20261004135638.1888530-2-anmuxixixi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 7 Oct 2026 13:48:02 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9d9qzt2mxQNQoUiwHR6EkzxD2LAPWijY2DxSV8gYLkJQ@mail.gmail.com>
X-Gm-Features: AclHuK9U2Ugsb7y5_33gEeoGDoTuYmFee95M_cfEaV0iY9mMTQN8iU9mA3G9Xco
Message-ID: <CAKYAXd9d9qzt2mxQNQoUiwHR6EkzxD2LAPWijY2DxSV8gYLkJQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] exfat: add a Bloom filter for negative name lookups
To: Yang Wen <anmuxixixi@gmail.com>
Cc: sj1557.seo@samsung.com, chizhiling@163.com, yuezhang.mo@sony.com, 
	exfat@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>  /* read a directory entry from the opened directory */
>  static int exfat_readdir(struct inode *inode, loff_t *cpos, struct exfat_dir_entry *dir_entry)
>  {
> @@ -1035,6 +1216,8 @@ int exfat_find_dir_entry(struct super_block *sb, struct exfat_inode_info *ei,
>
>         if (num_entries < 0)
>                 return num_entries;
> +       if (!exfat_name_filter_maybe_contains(&ei->vfs_inode, p_uniname))
> +               return -ENOENT;
This early return bypasses the normal lookup path, which resets or
rebuilds ei->hint_femp. For example, a prior FS_IOC_GETFSLABEL on a
volume without a label can leave a root-directory hint with cur.size
set to zero. 0002 patch marks that hint as usable for any create
through min_entries = 1. If the first deleted run is too short and the
search crosses a cluster boundary, exfat_chain_advance() sees a zero
length chain and returns -EIO. Could this path invalidate the hint, or
could the volume-label scan avoid publishing an invalid chain hint?
