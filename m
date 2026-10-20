Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507206;
	b=nZjx8jVKIh/MOKOvfzzPkf9zS6LnK7tQW/7YIwFwm7/+2VtYtwqOMKwGxEcZreW17MbF
	 B61B+8CMh7TU8vs6pIL3pLYtJ/7i7RUn2IbZk2HUt9NsLVggGLY+VqEx4lPNAS8qPgBBw
	 RCOKrh8ly2JWcsfJcucYiEsNFjNwdXhVGaiwkQXNxx2Cq3ODBZD/NC4ItLzDIJZs4VIFC
	 NiKhhGYDYm9YqyKlN8X4shltqO/kjfuHyUTUhlZ/N91avZais4OKdBoqUijSNyljD7K1K
	 we4LUqO9WV3c4I3Lh2llJCVnXn8X7INHv0K+3FxJtbOgUgwJtw1k4JIldBFv/slmhtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=Q6fIiazwiX9M70R0T78E4hxTPNI+gCf6aNUzhJ/QqFs=;
	b=djT20krJ6wCYSY9/98f1DNISek3PrngtWgifYfwilfSYaZsaIAcz6qiWTWOZeqYD3gWy
	 XdBvfwKQXCbiS2jIR0BgakAMva5cLRY+KxduFerDwCW5tRlJIVL4VffdiQz+S4JlgcKUe
	 o0KIrRchC+OtMnBVgnsHEybJsqOSGIf0BlojsxvNzMGE0N19iIXNamAkc4y1Xt0dR078V
	 FKP18231gfRdb/qwrnTfaY8Jval97jp5i6dSKjjypvpaRQOypPRD1FDIZGbzmZVTuQJDA
	 gMfe9nX7ICMqVLylhhc3Zo2HVE/zDmcT2cb+2KXLriph+8dft6q5QwuxFKYFT3rwnZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=OoDKP4rJ;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4EE606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD4EE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=OoDKP4rJ
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36681e85e87so843352eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792507205; x=1793112005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6fIiazwiX9M70R0T78E4hxTPNI+gCf6aNUzhJ/QqFs=;
        b=OoDKP4rJj8//Fkrqz3cIB4KZYMsqYLQDhx9M/EfrEsQmxL0M1ULhxcqTmAW6jk5gGS
         BfmcnnCDrF9qTdJE2j09nk3nxfnoC5HqTYTRu0khvXapBqv0xH7b7Og6QzI1BKlz6v/z
         dU96054x5lDvajZttrF2ZOnH8DJ6qZnvXN3Dz8ZPyuFXCazwgf+NHTtXcwrxy8mn3src
         3wLPHbCEmoq7p6V6oni+5J8KsHEL+bRp27NoiaP/wjjtlzQH5uOOMVaea0AMcALxSlyJ
         V7ZUp62T4yVKuSWfVTXYyzW/luqlIyWaMSNBYqO1QDtrdjs9qwtvHYfJEwBVY+emPaFW
         k5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507205; x=1793112005;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6fIiazwiX9M70R0T78E4hxTPNI+gCf6aNUzhJ/QqFs=;
        b=MoFndCyitAK+cHibdTRW2MPMtjGBnAhDRWuv0fnag5R47iQh8hfR7jX8E6u3WMnjwg
         FmTTayw8iI+ESBqlcHuTGwaWip9Vpbz+wGgWA4vUu4QR/RIGzEUIdrBUWDkPhxgB3DR4
         WArdYRShNnFXcxPrOxrxFU9EsSvWun55BrsWnR+6e9ndR4+qzcaWVY70rcwZe+cN5Bli
         /tKl9OPfy6IHKzdoEsyl4tX/5Ojv4cMwlQdjdOIazDAA1wy+bAPEUYPdAnduN78718rQ
         K2c+j2Rn6dlna+VHNML3eOGnQA5EnjuoEAyD8TLdchGDFfd437hbYCsDdIjH2McncOq0
         M7JQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrg3aKwQ+tMazBc817o/vPwBQtBria8YWXn7WI/0syWb56K1Lo9Y2RJ0+Jbh24cp/HwzLgbY8GMlDjl0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzoCNw0TQS6TTVi7tvm5IZWT6J4qa0F+MfnS1BvVHJDmXsIxzK
	DsT/Ua/3IUxtIlbv3V9BH+0O/wW45/YVX1hoFDUKfaB1EtIysypj8aMgovzEm0blGZGkHo7WlGH
	+oOhEsH0=
X-Gm-Gg: AYBFou3i6nLmIv+X2ntjYs4ZdgWX9javru8UR3z7phDc8wj8qDUZ24u7+d2XKw3NCoO
	jGZ07bKnROzTVWcRd6fuv017ia8u0RvaZ7k95hDuTqG1oJYG6fWnYrWqc2b38A9S7rg3Xv8KM75
	iLsRMescmj65Li4uNyIpXG+kCtqBk3i7blXUjtamoeugVftvOC+eFOtAO2OaVGug5pdVrQKk20B
	gs1J6xfJNJRvixEcYUHYTZEtV9jVBBVqRODSl6sZQc0d75sZuIrOIyoQDkj+5V5VUyonre0r72P
	ytQ+RsymZwmaSiKK4cVg5fmbKnNbEkYjs8qrOR71rEQGV+L14gS8J0q6KdORiu2jbj7zXzFGNnr
	BRxk6SskjJVgEsl72qf++cH6o7N7wyY4gxmPAuhE9n2Mn7lKdAH7S+9EtY+P2u7Fbf3GjzpXOTe
	q+jlhXcTaaXgy4kWvjz3crzY5qSignbuCQt0cg0YSi4qGyLrYlNdXwq/aZ32xOwAkpilLTv8h3m
	VV9iaehsH6sd793VHQyW0WHpQbxvRA7teWoKnJGq0Ne2JQOrEUWddJQcSHXVyCGseN78dpU0n/c
	qDmprWM5f9nlNLWgDsZTeE7vOPAIifmxrQwiZAO5YW3f3NsikSa6jVWKIDTgQoDBrFd41Tjtt/o
	ErRA=
X-Received: by 2002:a05:701b:2608:b0:183:4719:5c01 with SMTP id a92af1059eb24-18513e7c69fmr13146306c88.35.1792507204827;
        Tue, 20 Oct 2026 07:40:04 -0700 (PDT)
Received: from xps16.local ([155.98.132.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm68494455eec.28.2026.10.20.07.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:40:03 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Nirmoy Das <nirmoyd@nvidia.com>
Cc: ming.lei@redhat.com, hare@suse.de, dwagner@suse.de, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261020125129.430600-1-nirmoyd@nvidia.com>
References: <20261020125129.430600-1-nirmoyd@nvidia.com>
Subject: Re: [PATCH] blk-mq: clear stale inactive flag on hctx reuse
Message-Id: <179250720323.3338252.2582321707097985664.b4-ty@b4>
Date: Tue, 20 Oct 2026 08:40:03 -0600
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


On Tue, 20 Oct 2026 05:51:29 -0700, Nirmoy Das wrote:
> When the last CPU mapped to an hctx goes offline,
> blk_mq_hctx_notify_offline() sets BLK_MQ_S_INACTIVE. Updating the
> number of hardware queues exits every hctx and parks it on
> q->unused_hctx_list. A later update can reuse a parked hctx through
> blk_mq_alloc_and_init_hctx(), at any queue index, and nothing clears
> the flag.
> 
> [...]

Applied, thanks!

[1/1] blk-mq: clear stale inactive flag on hctx reuse
      commit: afc1de47a7ab607ae6403c4bfda36b0bf3cd342f

Best regards,
-- 
Jens Axboe



