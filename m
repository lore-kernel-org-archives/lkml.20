Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19FA1C84CB
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791708117; cv=none; b=KjpCJ6s9c3tDCWyx9NrJuOlu1dWd/x3Z0Gg9W6p/jBqIKX65QmE4zJxT21FjaWpn+7aOss0cM0T7NM1RhxReXS/iNNZ3iLwQrITkDiY4c6LMKaw91MRmY8U4Exd0lLIRexEJvr1Rk2BpSs8kJfijq/b14Z9rn1bX7XTCAHZ52Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791708117; c=relaxed/simple;
	bh=VHBHSAQFa3fRTvqYGjhrNi8zlxKZqEhKCPAIG7LjJQs=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=a0Gw5UTLvczkDK059orRgxt2dRnJbURf79YWVHer/MdmIPrTOduq3PE2f7HZn6mZemGrmTx+4LV/BCVgH4ih+4em116YDe0gFf+EDYhyIEs5Vnwc/nFk1CberpWr+nmeVMd8wl9Etf6ftKUbgUZqH7RXroEm2KcNZpAr5iwpp4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=duFx/e3u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="duFx/e3u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7451F0089B;
	Sun, 11 Oct 2026 08:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791708116;
	bh=VlEHJWU8rK1qb2VSJY0s5LgiMqQdCzRFKqBueC3zOXo=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=duFx/e3uTE79a4cra8caXhaKnf/358FA9n/078vwsK9R438CcYuFlMRM7us/HdjSw
	 /vTLCnf6IgdU2YIF0ewpio1BAat1kggY2e5qfeYuUOgKec6KQHNSq4JWIFSa6p7ZLC
	 2y0CuVq68v3DM8hUVWwlrmGbQULbSG6lSF2kcycRq9I1zV1pDn5tn0oQcA6zvS3v78
	 HmqKNlQMhADhWIR0QA9A95VVIbcloAFEgs0PVU3U0DHpMxtiGd9ezJoqsBEwpsiaFS
	 e6tLiN1O7NsblmQbxhcQQB3McVj+29jU6cfuU2CpEn/9hV8zNxwe0bLM6rC3ouazlF
	 OmmEXa21s9zOw==
Message-ID: <00c340f7-723c-4b17-a5db-17906ff2951a@kernel.org>
Date: Sun, 11 Oct 2026 16:41:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, jaegeuk@kernel.org,
 Seongjae Jeong <jsjlee1020@gmail.com>
Subject: Re: [PATCH] f2fs: avoid unnecessary reads in f2fs_update_meta_block()
To: Daeho Jeong <daeho43@gmail.com>
References: <20261002064853.37782-1-jsjlee1020@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261002064853.37782-1-jsjlee1020@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/26 14:48, Seongjae Jeong wrote:
> When the packed SSA feature is enabled, f2fs_update_meta_block()
> uses f2fs_get_meta_cache_retry(), which reads the target block from
> disk if the cache entry is not uptodate.
> 
> However, f2fs_update_meta_block() overwrites the entire filesystem
> block with memcpy(), so the existing contents are not needed.
> Partial updates to packed SSA blocks are handled separately in
> write_sum_block().
> 
> Use f2fs_grab_meta_cache() unconditionally to avoid reading blocks
> that will be fully overwritten. Also remove the error check, since
> f2fs_grab_meta_cache() retries allocation failures internally and
> does not return an error pointer.
> 
> Signed-off-by: Seongjae Jeong <jsjlee1020@gmail.com>
> ---
>   fs/f2fs/segment.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 794e0d99fc7c..51858f64e43e 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2844,13 +2844,7 @@ void f2fs_update_meta_block(struct f2fs_sb_info *sbi,
>   {
>   	struct f2fs_cached_block *entry;
>   
> -	if (!f2fs_sb_has_packed_ssa(sbi))
> -		entry = f2fs_grab_meta_cache(sbi, blk_addr);
> -	else
> -		entry = f2fs_get_meta_cache_retry(sbi, blk_addr);
> -
> -	if (IS_ERR(entry))
> -		return;
> +	entry = f2fs_grab_meta_cache(sbi, blk_addr);

Daeho,

 From code side, I feel this is clean.

But, could you double check this cleanup? in case if we handle this
intentionally in original patch for something.

Thanks,

>   
>   	memcpy(cache_address(entry), src, F2FS_BLKSIZE(sbi));
>   	f2fs_mark_cache_dirty(entry);

