Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260292;
	b=FUye9Ub6luF5Uv6huNrpDjRYsfESB/NQEkUehdRtDcjt3Ss+uiXRJDkjiiHo2N+zjEX/
	 sXzj46MI7LYXhnSe29E8KdWREcO2GFZ7ugSRr/JeW4zpvQp0ENsEuLV2oYWqoWBuVrcTP
	 1GqygJ2fDXXTaAhKWj32yaCvHh8C+6WRXUzEjfoiwgv1LNGtdhgwjF9fgqUnOyZDfAgFz
	 N0uot08SGQNk0jtaaSSuAqPgcV2511xG6iRZaBBiDCWy0LrKbuIIL4ZCW6gbh3DeAKWK2
	 Cjx1ABm0QTLFOHMTT1vFRQCmcroPmyISIz76Bqt+wPMNFIX0WYAunrlihRA+GZen7Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=YNEvUZEqZIDnSORqnBcviTGCY1xg9Q2qeRZLzfoHA6g=;
	b=bN1wyEGTEtxD07CBzbhKxt1v4weyQtQsOaRTMkDtOqBJ42wqRpRUelHbFiDqasBsuMq0
	 1h7Qjbs5BYu2OYHC4eAdqzKZ9vVn76kygC6Rs5KmxC/bSa+NB0BAol02fT7BtJbN7PHy6
	 Ozs/pRVCMaRvNovyVsrJDMl9U4OG6xtt1H/hJ67VKbfnVo3AUorYZI++B2T8MCQZ4y4Jp
	 +Jz/brJ5lnRVU9pr1sAMvCTcSKMr1XTAImYCJ0x+8czQAG5uLJKGO8GM9bvpu/eAqajGW
	 0cpj2dW10VrmNQw3XUe198VcgpMVy/76Ow7IvTWkyqX64V+3VMjiK66kbyOqq+ozymw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OmRE7iJ8;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A703606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A703606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OmRE7iJ8
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ccca948203aso653317a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794260291; x=1794865091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNEvUZEqZIDnSORqnBcviTGCY1xg9Q2qeRZLzfoHA6g=;
        b=OmRE7iJ8GchwzEl+lpjoRy945h+CAdg5qgHqtLYnp7up2SRzATrr69XR+jA+S6sGYQ
         LzI9lvChaXl3ZQ7IwP0tGDe/HfNPmEKRb+rvnckTjZj6m0OjLZm2RGrHOegwfetLzoUo
         jk07+FS6uM0zuUMUykRO88eIOu9UmqCorktI2y2/bf3GW9r6Y6Us8JweLw8nctgF4BAN
         ouRy0ZKuKu3PzBWWa2xfhMG1Ct4wcWqp6XBMl9E8QuSGa2+gVIlSwoB55IfIC2YRlpAc
         VQh7/KVZPGKCcJ7KoGl0MSlU8uzzIoVlhaI17E/Sij+44yUprA1EmkliMpunzoVshJnK
         j1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260291; x=1794865091;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNEvUZEqZIDnSORqnBcviTGCY1xg9Q2qeRZLzfoHA6g=;
        b=yiqKb+mhJPBSbYje0nzPINtdTRpVyBHrY5EQl43yhqa5zITfk9rjeBEeiru3CSUbO9
         qKXyTdnSl//bkeHKjSINsBJKkLmt0rzEP1Nn7PkqnQaesMgS22zhBriJ4gkcv8taSnMz
         5R4kyn1aEs1IN7Cy6n7ooD89P3gBHyndmmd5HT0ATOh253NWjM6EH10Y1QleuNlc3wLs
         Zs6YVUyEjYPw86bWzIZtEiZVyo0ydhTbd2ZMxD0DJWRjLaiPNcDyst2HSQK6I6u/wwNp
         pJiyWq59ocVDyGscQlnR6Ts84h2xFQvCHetGuAe9l99W+ZKoZfHwDprfgCc+HzIJNNfS
         16qg==
X-Forwarded-Encrypted: i=1; AL+hErHNgtuty/1oCEpuFMolnv+LoG2mhG4kFxhRNc6gD8HWLBC/+THB3yPGLM8bdWvdTVKUG1dAi29APyjAdxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pj21yc4KKFc9J+0woWNrH3k1pC6b35PBSYcijG9gNJyKATg7l
	TBDZHZgKE5tfZd2p8zcUmcqF2DxR6QzxyoxBmA69ntTreUwc1jgm47MV1eIJ5/ogLJCHEnNa66D
	V2jGr
X-Gm-Gg: AYBFou2yv8Mi2QxeyCOcYTaf5ARIDrxYww+sXaLeD5dXadnHXpi9WOQHjR4VXRPybVo
	091e1nZ357kIT0UMCDYDRYsE6ed1sAiB/UxJnmslK3f3NWuGo9/8/vTN7sKxnmunbOgd116bktJ
	/LWBGS3PuJcDh7x1xPr4JVe2nSfUZtPHhXoMDDcZYB1VRt9+bBJyD0+/aYiNNhNsaBJ/oT0A3aV
	WUeEJnb240J/XwIZaiZJYZwsJ+ZKZLLlovx6F3U0hyIITy5IL1U0kJqR+SIVtHqh53aI0xclrT0
	/k6iaNf1b0SYhFRHGeRHeeg3MZAWof3lR58syn2vlQK0MezIYdvNvYjZBtJ9hIi9q05GCh4RXV3
	N9SEVPmxHYN+wEhJmYiLwgZksk1AvRfQzNmhDI9ONhO5sOJdLs2XBsglayawCYxQBxasLGb+ML2
	MgeWUcDKIhUJTq+Evp0Xj4h3TMC0xTgxClF2wqF+YK4137AS3L398gze9aD4YscZVHMJGkv5aYY
	BQqYJLyqXQSmW3ySb8SoYgO0ylbmxOG0UjTujaXw9+g73dL2eIjxsiKozpv/XZentWAmSJU1unh
	xhTx0Au0avsEr9JRIFeHDy6iLZr7qft0s+hF/angpywSn37YTQUknsOoAF97RFWpc26SOnCZJ5w
	nUNiBg5eLduON
X-Received: by 2002:a17:90b:4a0f:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3b166cf450cmr914186a91.34.1794260290895;
        Mon, 09 Nov 2026 13:38:10 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16774309bsm1024629a91.14.2026.11.09.13.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:38:10 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261103211031.592745-1-csander@purestorage.com>
References: <20261103211031.592745-1-csander@purestorage.com>
Subject: Re: [PATCH 0/4] io_uring: improve alloc_cache branch prediction
Message-Id: <179426028968.141878.17464468753491452535.b4-ty@b4>
Date: Mon, 09 Nov 2026 14:38:09 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 03 Nov 2026 14:10:27 -0700, Caleb Sander Mateos wrote:
> A call to io_uring_alloc_async_data() that provides a struct io_alloc_cache
> currently has 2 unnecessary NULL checks in the fast path:
> - Of the struct io_alloc_cache *, even though it points to a struct io_ring_ctx
>   field
> - Of the void * entry popped from the cache, even though all cache entries are
>   non-NULL
> The compiler also incorrectly assumes the success path in io_alloc_cache_get()
> is the unlikely one because it's written as an early return.
> 
> [...]

Applied, thanks!

[1/4] io_uring: split io_uring_alloc_async_data()
      commit: 5b1d75482ccbc6483336d16cec609da2706981ab
[2/4] io_uring/alloc_cache: mark cache success paths as likely
      commit: 2c4f39b09b031c94465e945bea50df5c781fafd4
[3/4] io_uring/alloc_cache: assume io_alloc_cache_get() doesn't return NULL
      commit: e10a5108ae01eb9e166b0c7bc04fad6b0001095c
[4/4] io_uring/futex: avoid ifd NULL check in io_futex_wait()
      commit: ddcc50dd41d331dc66e0e5793492c3fa09941ff9

Best regards,
-- 
Jens Axboe



