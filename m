Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988636;
	b=S6jgwR+yR5n7ki/B5/Bcbc8wIoQLu8+acPf4dyEv4oM5JQXQbuD7JxnBXviUn5hgC6ZW
	 AqP07Dm7Zg9mA2tqSgste7gZm7ew45sFRBuZ3qKUqdXch2/etBu+nrQ8c2UHDLReEfXKy
	 BFHEKMj/ihTrmLAQXuFOG9tFv6VXknjWFIWfdLj7cCoBGUhtqpvePVvhxaDXXArfBprqV
	 3Xq5e9sh9pmBMQjV93ksi305wNveqidR85ejfFrnzND1nBS0htZhnlP9BJS2gSl95dJV+
	 0/cfwrZpvuuQmXK3U2373toxIKM5SPSBCwZxuizcYKO34N6k4QIfCTborGEnLZdD4Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988636;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=H7Xjhzr6DF5SZMmFJEMnASxBGf/Gmuq3UHu0ZMOBjw0=;
	b=kb35V4Z68f5dPTBD8M7ZpfSx0ZlKpJb2Q6VPEU6HBwFI7ZEWV3cz2kyzWHqvZ2XJk+pv
	 mIeKk49dwIo4agom5xJIMbJi8VsDE//XOoYaLT55QPgMv6eIQXgGZksf30SRA9QP4vZKy
	 +SWAzgYhJA54nc0zkxOLlCr/S6aWGdaq2+sne/6xnDDIjiOUlKvq4RNEzhBvtebz4vvfE
	 7HXQllaC5WIu708JDcPndX/Q1NmA6WYaYwwuZzUVNHsF+MtAwZhPRg1WAslG0wiWLcqV4
	 wm7xb40nV+tZ0/cNZp1KFcZl57c6vR7neVXUvMUg91sjxUMWSQ62FTu9359UMKD2fXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDC4606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCDC4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c7f887ac6bso1181087b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:10:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988635; x=1794593435;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H7Xjhzr6DF5SZMmFJEMnASxBGf/Gmuq3UHu0ZMOBjw0=;
        b=Lk9n3KW7nyZncQ5aUM4Xn9QVk22wOFdof0OaNq25cNqL1PKyfoFM4L8gzA9vKhz8x9
         xNV9YllaofoEARzKPfMsOS3HQrvfsUbUnHBk6II9p5u36rahURwF0dHaIUBL5WxYtGhk
         KM7oQGnZNsLTJb4mpMDGNhGJ7eDfZPGxQbTvhseIVdubMNGA/mtkQE4MBJU3NZWA9loM
         3U52aUePHQXHoWIgCiPKxuI1IeE6xxUQijvU1L9TpQR4w9G8dmrCMOiHOTgb4DjDXJLo
         3FJC7tunsPmPFkvCCMDp4HerE04HQoqCwO+i1krprWPwlyEjYg7B0fLBkctkOzgyeYvF
         x2EA==
X-Forwarded-Encrypted: i=1; AKwUvBzuWxCqocEJfaHTrCP6hJTYu/GzkSSAGS1h7yYghROos1Q88Slr1t4FDV2DW0eTdMr+vQZC5CN9qlREQGk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iW9O/rQTxhrD0xpzL6Ck/ONqMk1UWxtW13G/c1W89R7rNzuM0
	lNTlzMx+kZzno3bPFrup2RrqmAcT90xhQ0aoyyTlx++L+LYo3sDhz2GokfqQ5M9QFRGiFwn6xWw
	j+OtZRRtbcuSLavNhBGH6/5Efagsp6DJxZmGUUkSpLl9sQtjjTkQ2p4+zysw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:15a5:b0:55c:928:69d1 with SMTP id
 5614622812f47-567e16594e8mr2338851b6e.56.1793988634984; Fri, 06 Nov 2026
 10:10:34 -0800 (PST)
Date: Fri, 06 Nov 2026 10:10:34 -0800
In-Reply-To: <20261106181031.1446-1-drifabdelmalekmohamedsaid@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aee181a.8be4ead1.3b45e1.019a.GAE@google.com>
Subject: Re: [PATCH] dm cache: fix divide error in too_many_discard_blocks()
From: syzbot <syzbot+7ff3adde89dd795ad4c4@syzkaller.appspotmail.com>
To: drifabdelmalekmohamedsaid@gmail.com
Cc: drifabdelmalekmohamedsaid@gmail.com, dvyukov@google.com, glider@google.com, 
	jack@suse.cz, kmsan-dev@googlegroups.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-upstream-moderation@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test

This crash does not have a reproducer. I cannot test it.

>
> diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
> index 1a5072425c4a..2d40d6047ef1 100644
> --- a/drivers/md/dm-cache-target.c
> +++ b/drivers/md/dm-cache-target.c
> @@ -2383,9 +2383,7 @@ static int create_cache_policy(struct cache *cache, struct cache_args *ca,
>  static bool too_many_discard_blocks(sector_t discard_block_size,
>  				    sector_t origin_size)
>  {
> -	(void) sector_div(origin_size, discard_block_size);
> -
> -	return origin_size > MAX_DISCARD_BLOCKS;
> +	return div64_u64(origin_size, discard_block_size) > MAX_DISCARD_BLOCKS;
>  }
>  
>  static sector_t calculate_discard_block_size(sector_t cache_block_size,
> -- 
> 2.43.0
>
