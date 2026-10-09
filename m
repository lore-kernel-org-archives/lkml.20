Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584033DFC86
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536117; cv=none; b=U56QiBOCcujy6bi2ee7HuoxF12uznHd9eY/KwzgaWZ8TuyD0Z867uex2WXtyxVf9ZrsLdCWk5jstAA/2yr4H3CNDaOuxx56iPSqRBb3FJ9bE3fx8Rc+bsP1u622ThFyVmRocCvgT03jixX/f/MI/JOl82I7MasW7VADVwwMWoa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536117; c=relaxed/simple;
	bh=Yf79U+Vm9duSd2PkkW95w6ik7BiBc4/GQOH4dJwFfoQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=e8qtekO1Wj/BN92dhM/WOLL4/B0wapBpJ94cu32SdYrcZckwLvcXVpQ7jVZCr2ZX2y9FI2cGq2mks6p52MXnWky6pGZFm5AdX+YqB1pVDZLUcBDFlBiptlnWYI/PPYM3mVHCCQ7TBmHdO9LLvl0ONtvtI4DPwkEdW4O9bzopDr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRcII014; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRcII014"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0AB1F00893;
	Fri,  9 Oct 2026 08:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791536110;
	bh=o+UzLAz30/55bQE/HG+JQhNOGPlk+V9zlOAxlU1PhQo=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=FRcII014FwTy1cxgsXHO/AyCMVyVOnwB4pMaRsKpGsz/Y12aYP2TDh1DAtLTkx9TN
	 BsSgUp4aRPYa70dH3n9y8uAx9d2RUQPTEXOls1S/3FLBZPmDkZgqubPOzGSaejDpuB
	 Aa0o+bIM5QJboRXdhVVVpmRZODQm6hOKFNW6tuNHGfU/Ie3wmBV7wUgaRj/UxnQxPZ
	 M0lQIl8RJLW9cRdqJ06qQ4cE/YqU2JdXNYH9zcPrsMUky34DizlH8Jz5JcsHoZkX5a
	 gl0/yQ3mtyNXCNhHwuFeuKM+gIMPezgfimp9LOfuM5L8QKXNbFkJl80Y8Yw+p6b3pm
	 g8d2TNQVzydxw==
Message-ID: <296d69c0-b284-4186-a71d-9754df409690@kernel.org>
Date: Fri, 9 Oct 2026 16:55:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: convert inline quota files when turning
 quota on
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261004170456.4104287-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261004170456.4104287-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/5/26 01:04, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> With a block size larger than 4KB, the inline data area is large enough
> to hold a freshly created quota file (quotacheck writes 6KB), so
> aquota.user/aquota.group stay inline after quotaon. f2fs does not
> expect quota files to be inline, and this causes two problems:
> 
> 1. Quota file corruption. f2fs_write_single_data_page() sends quota
>    inodes straight to f2fs_do_write_data_page(), which sees NULL_ADDR
>    for index 0, treats the folio as truncated and drops it. Updates to
>    the quota file are lost once the folio is reclaimed, so the quota
>    tree reads stale data: chown/chgrp fail with EIO and quota entries
>    of users disappear. For example, the kernel log shows:
> 
>      find_free_dqentry: Data block full but it shouldn't
>      qtree_write_dquot: Error -5 occurred while creating quota
> 
> 2. Deadlock. Writing a quota file past MAX_INLINE_DATA converts it from
>    f2fs_write_begin() under f2fs_lock_op(). dquot_transfer() is called
>    from f2fs_setattr() with f2fs_lock_op() already held, so chown/chgrp
>    take cp_rwsem for read twice and hang, together with the checkpoint
>    and every other writer, once a checkpoint waits for cp_rwsem in
>    between (seen with generic/232).
> 
> Quota files only grow and there are at most MAXQUOTAS of them, so there
> is no point in keeping them inline. Convert them in f2fs_quota_on() and
> after dquot_quota_on_mount(), which keeps every block size on the same
> path as 4KB blocks, where quota files never fit inline. Quota sysfiles
> are created by mkfs with real blocks and are not affected.
> 

Cc: stable@kernel.org

> Fixes: d7e9a9037de2 ("f2fs: Support Block Size == Page Size")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
