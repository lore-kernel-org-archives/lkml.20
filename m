Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493DD33A6F7
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791706586; cv=none; b=odq5nJEx83G07L6aBUfeudzfJKMIuVDSI2CTFiUvAubb4xTbBHqolVs9Buwn/oMhK/aSf7xt/7MYBL2mMRebU8jTm0dF0TWoQi61ZZ+oN/+fvm5hlqpdTHDM9TQvsKQPkdBvrAr2oGURddXla1P/9DyePdIp1VF6Tijei7qLdOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791706586; c=relaxed/simple;
	bh=gqlcOcktZ36t3l7g2J+pRFwfuJyP3tE7gZHG1fcJgng=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OKp3+MxiOLzCGTJo4SqFp61f/DccfKgqYGDJx20HbAyRDFp9SWKoaOpOIgm/V6IcsevDTkjcYdd31D3kmOWqUHPjL5T7MGxw5mNyjeXOKLel0IISjuSZwEm5r0Jqpime0YGHKThchzKJOchgURIQzTEnlB1J5g9JDwHXfpY4U/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FxKMtJGa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FxKMtJGa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D7E1F0089C;
	Sun, 11 Oct 2026 08:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791706584;
	bh=4WcCA1E0CSTBkfr6toll4II58krvvlbL+7BiwRn1ctM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=FxKMtJGa03OWcEHZIJL8VNOlf8cGdliveQCweEt85vANZ55UR7DNgCk63TlzlbsUT
	 5Xed5gFDhaDOpQaPJTfes6B5Pf10EN3UtPCTQjx1sbku9a5LktvJBTx1BD/KD5SPhH
	 Jlai2WUK6P/4ngxfTET4Ov3FDyHJPShOoof48dliBb9qrrPnAucBuF3lHJZjkQLRrx
	 /121ePCIkRNbkh+ewsLndifgFQigqoH2TvzEJ4NoRxGVYBXWs1B2HpA26nPoI6ybtq
	 gxqdIj9xM8ZL7ESDZ2edeWYVbC5ztuBFVa16YXxvuNwbv8bfuSc9yT26hC6I6pLOQQ
	 sXM0WFoxgqatA==
Message-ID: <f3f5fe2c-f0f5-4c23-a2f7-6cb5e09ced5a@kernel.org>
Date: Sun, 11 Oct 2026 16:16:21 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, yi.sun@unisoc.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] f2fs: skip further SIT updates for already invalidated
 blocks
To: Seongjae Jeong <jsjlee1020@gmail.com>, jaegeuk@kernel.org
References: <20261004061007.7433-1-jsjlee1020@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261004061007.7433-1-jsjlee1020@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/4/26 14:10, Seongjae Jeong wrote:
> When update_sit_entry_for_release() encounters a block whose bit is
> already cleared in cur_valid_map, it reports the inconsistency and
> corrects se->valid_blocks and del. However, it still proceeds with
> the discard bitmap and checkpoint accounting updates.
> 
> This can clear the discard bit unnecessarily and incorrectly decrement
> the segment and section ckpt_valid_blocks counters when the block is
> not marked in ckpt_valid_map.
> 
> Continue to the next block after correcting se->valid_blocks and del,
> so that an already invalidated block does not trigger further discard
> bitmap or checkpoint counter updates.
> 

Cc stable.

> Fixes: 81ffbd224e5f ("f2fs: update_sit_entry_for_release() supports consecutive blocks.")

This commit didn't change previous logic? IIUC.

Otherwise it looks good to me.

Thanks,

> Signed-off-by: Seongjae Jeong <jsjlee1020@gmail.com>
> ---
>   fs/f2fs/segment.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 51858f64e43e..fc2f0fd8e318 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2560,7 +2560,10 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
>   			f2fs_bug_on(sbi, 1);
>   			se->valid_blocks++;
>   			del += 1;
> -		} else if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> +			continue;
> +		}
> +
> +		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
>   			/*
>   			 * If checkpoints are off, we must not reuse data that
>   			 * was used in the previous checkpoint. If it was used

