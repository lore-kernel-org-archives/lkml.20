Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988636;
	b=wlkTGe4eQKfBwdmNMPLquz/yEZXV3h3MTl9OwZco1NVWLsQTor0vhvm2lNgsysIxt4g9
	 Uo7d2jWmw0pCdkMxBGtsU3pZmnDfSOAtKRHwsX7UNNmw/xB6nCRladFY+v8xj19mZGkQ1
	 xojqHh/w04YCim6kWpVAYDnl2bHPNO0r7MvIsSIWd+pwiWebEo45L7/jDGlzERNY5scIY
	 /7k8TAWu8i3TXk90umUDMIjA05VSyud54ZyCgNGTxamBIpOt69YoXw6s6CYql1WoaVUGT
	 HE37i9NSNLkk/Umvn37FOd4XkE2kHzPCZNQQvOJB7mIXfpCG50Vi1AfITfQt3m9eB/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988636;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=H7Xjhzr6DF5SZMmFJEMnASxBGf/Gmuq3UHu0ZMOBjw0=;
	b=0PVRxRMoyteiJwKJlNuQYs7useAFwNpMn4x697Z2c3xjireecxy66idywJqcjHQ/srVn
	 Om2ZURDYWZibMK27d+Bi7z6PDN71uIARYLwjkDjylczgaDIpy1OWopZcvzuKhOmsvc1JX
	 iRspfpBkkae0EODuDmYPYtsqkhacdkB0yiGnSPg2pgSUBjFDFm7EEEfSV2ZebAElF3pDA
	 Ud7J2XuyFelrbPoFeIZepkx/F95otZ7gVoV0YO0G3hlqCXLH4S682zO9s8nckcvEYwZ/h
	 BSVxmkFCkVHJzAMCZRFlgukimngdpzVrehlI6XzRI+VSZ1NJyglaiqguJROpGb84B9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE4D606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AE4D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a45b3f0bdfso1300712b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:10:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988635; x=1794593435;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H7Xjhzr6DF5SZMmFJEMnASxBGf/Gmuq3UHu0ZMOBjw0=;
        b=1OZurupoG0OVqbFPFc8uW3/r/VW+EjH3tRCVEoxxPFSsDTQXSu3e+pNTm/mCvpYy7A
         Pny19n/1to0YIIAr0/+SqtAVzQO8ovjgliPGq5fpdfIclOWQRLJL37E2QaAbzK3Tyts1
         WOaNLJpwvJHSlQS9Z1qd62nuX+53nUaiTxxyUkrYIbseW715MOjvCYdi11/GBvzF7UAu
         Vx/frt6f94tfiVn36NRxKCsuaWEzt9DJ4oxQEHwAkqYFYd6eduJx39TQhN6WMMHWNP8j
         jQ79kL4Ay+4sgyq+jMLkDxvp+3SsERcqAl4AlrEpxf5ykvuAOnZHIaR/AdOy6JpVzQhP
         QBFA==
X-Forwarded-Encrypted: i=1; AKwUvBzodB//AkeCmqN7fDUZ7bYcAvtd4LzsESJMfxeHDk6ko5zymK61Vr4Pf+ol5hVRO/Q9jTydgWz675MqriQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Oc2fpM9PaNjDoJqxuomDlB89U2/OaIozVn2nDfAKz9GMMuffB
	Ifag5BhRNw056imbf0f/nYu5ocfqFBcEhIEDWX3wZVaUmud6ekO1gk7EtKgsVxjeox1HmTZmz0N
	9dwTuZGz3CgwEid7o/JDWfLWgCH4ts825d89GIZ90pw03WeaGBMpDSMTS2Rk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3a0d:b0:4f4:4eef:52cc with SMTP id
 5614622812f47-567e16701c8mr2303497b6e.43.1793988635141; Fri, 06 Nov 2026
 10:10:35 -0800 (PST)
Date: Fri, 06 Nov 2026 10:10:35 -0800
In-Reply-To: <20261106181031.1446-1-drifabdelmalekmohamedsaid@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aee181b.dede2635.b849c.0005.GAE@google.com>
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
