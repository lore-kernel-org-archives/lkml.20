Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793056654;
	b=VsjCTB2N0fM4acBAlXehtwKgK03L5kY4mR8H5UCySzTPwDsKBxwBImsxBWDdoEajl/FG
	 Hkx3LrTqb5Z2Jtfkv0OLGkQDYJAcF5yfrCla0R3q/us4MgVnQhnZ6bqW6mfdyoKc9gOXA
	 Nu71BHwbkamU7RYPUXFY1AERtNY8APWU/xqjEjFBbhBxCqRbfibeMAGzcgusKoYemZ1T7
	 umRL+iazuWOuuYIvyihMu1SvDnoXN9yzaziJYY14NpwiivnJF9TiWKqQC+p3v3b8FhKCh
	 j4jMnN4TQoQERp8oemjcnPLKPenSv4jP447VbJ9xudPV451Zjal5y+qUp/KbXdN24ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793056654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ocSMFJitTHLYiF8HUiTTq/2SGtnm5oi8M3HgkaqWxwk=;
	b=E12VW1xp22jwmWoUn+u58tXhhzesjZnmZM7toZbV7K5PqUKxRjRUdR3w9e2azLDY6mpJ
	 e8bKf/ptLPKSUpORoMqqiBto+GafTEas/y4fpTaz+SmbLeRDTDiamYYCbXqxaykELGq84
	 MUrb6mCnaGJ48Yt7xfe7YkZHaz4qGXvAzG1+EefFz1gESOaQ9fe2bAGCxgWgPJ2s8jC0d
	 ACPbnCuy3RMci0g2D3kwB9MT6iBwB+uBkHnaptnwQ5WtiEkdjq2TRSSrgHSOtId9Csb0O
	 sUX696Y1ZkLesMPRMpxNNdzWP8FM9KBeiLou85HKtH4Pobl0FD05K2CJeFp4hhAa1lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LwqZPMZ0;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031A7606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 031A7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LwqZPMZ0
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so24034115e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793056652; x=1793661452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ocSMFJitTHLYiF8HUiTTq/2SGtnm5oi8M3HgkaqWxwk=;
        b=LwqZPMZ0VGuMpCHb11pqfADiE3QHngAGBSZEcKxe9PX41UYYCUusAULtFM+rTWUE8x
         xSSA37ZAKRoJe9r+zMmn+RFMKKMhdIpV7NEocrw661Yr5SGBtfKfqn7wCfCyklIuQqTq
         OwJy2pB7Aowb13BJueRjs6KKhNcQnE6hC0g/hPJSf3Np0k5hQjoESMN9v66yHWP2s0EE
         vARKIsfIciGFELYskmexCC38YfgWOVwD1v8kCFu7njrfhvOBm53IEMxVjCzxTvi/8Uaa
         2oUG2jwudR0/v72vs3uLt4QdpRgMWsDcqu3DFg3IRI9EMnrwOPZYHSSBpyRjs5dh2aIK
         MX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793056652; x=1793661452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ocSMFJitTHLYiF8HUiTTq/2SGtnm5oi8M3HgkaqWxwk=;
        b=MfTvwYa737Fv1tYDTrTIO+IXTfHhz5hWtmUh+/8UDHLUj0wVygS23nalg7g0c4FQE5
         c9hA0hBFDKtO8sMciYFCgjW/Cc9HcJ7YLhTTmXAVCY730+9zewZcXnVaazhx+FN6gcXV
         e2zwxdpJwFXNdyS8OlcrQtc+FVj1aNZ4nFP6DrlVJas+bEALPQciPo+N2/cZWTNDBxjJ
         wIlwcijhKNReq/i2WEvzQm5a/+j4oUpDat8kHl2qN7JCMuSu1WU06FP7QvqQXnrg808o
         1LIOjFfjo1xksXd6Q1NwB51TxXnaPVaH/Ax39TBszq2Flqcyw8Odn43EVc7F0Wz9CfTc
         Q8GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKo8F+tWAZYJerEY9/53kIdqZw9YJB02PyM7FUvY6qkyV/507Ml8aX6YN8VWzH576qGVeTxWRR61wUpyw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSKL4AyPPfeSqDxn/vix+hMiGxuZrw9gKcMBVnNiodvH9ielkN
	EofAI02bMo7JMevq/TRfakiM5Q/NTaS26EuB4E/8GRrdgADONscPszmX
X-Gm-Gg: AYBFou2zfqbZgehs+eSkZex11wJXocpKkaes2Mg/9hfO3HPW0PkUeKjpIiLf03h8znI
	brNVoMQ4ojMyQ5v7FCz1hKbJM6OgqyRGnRRAhT09sXD+8HnEmV6edB0ZIXvEfegK8LffGOymrgV
	qYf1n+OuJA5gZhgmceclvK53p8EMfcmwbfGDYBY1wq0Fq7AnR5pzMRGkF+sDgjFRpdTc5G8Yjkg
	JOWCrhJYYqs3edA3PpVqt3skBpK5Nn7aNmQbPJIm3xtauF8PpxIlx23oJGKrHmA8R0C5SwXSfgI
	DtCxcyjAuTNMeHT3pzfOs3y8FNoKmu3KuFrs61Ijje6vXU3pOaELcGtHSuQEisUOyV+CW2/3a0K
	c3j9jOR3smHpg8+f7MmaYE37A4aJI0xsoQgPvVTvT0G2zqO/YNs3gor48WXZYLpj2wzx+1OFHwP
	Hs+Vzaj9JQPGbSwcb3z2yskz85OrkKpePpCDdQIs7ltuWkYjb7wLYBX6RIp1ElnyTEO8uhTSQxT
	P6C7+pD7FMqCJtb6EQ4TroQuhMdad/esD+oSB6nn4DVS0x6hUW6SygrVgcP3hzekrbFtfw4HAoE
	Wg==
X-Received: by 2002:a05:600c:a45:b0:4a1:e11f:b2e1 with SMTP id 5b1f17b1804b1-4a35aca4bbbmr163049215e9.15.1793056652381;
        Mon, 26 Oct 2026 16:17:32 -0700 (PDT)
Received: from prairie.home ([2a02:168:fe54:0:500c:846b:8abe:fa7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a56992dsm213263975e9.6.2026.10.26.16.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:17:31 -0700 (PDT)
From: Cinq Prairie <notprairie@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Stefan Roesch <shr@devkernel.io>,
	Jakub Kicinski <kuba@kernel.org>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] io_uring/napi: drop the single NAPI busy poll special case
Date: Tue, 27 Oct 2026 00:17:18 +0100
Message-ID: <20261026231718.5092-1-notprairie@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <fe5bf816-815b-4a81-b765-2ed36cdd3168@kernel.dk>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 26 Oct 2026 07:46:38 -0600, Jens Axboe wrote:
> Does dropping the single-NAPI path trade the early need_resched() exit
> for a full busy poll start/stop cycle on every poll?

Yes, and without prefer_busy_poll that is a regression. With loop_end
NULL every lap ends in busy_poll_stop(), which runs the driver poll a
second time; napi_complete_done() then clears NAPIF_STATE_SCHED and the
driver unmasks the device interrupt. The next packet raises it, the
handler calls napi_schedule() and sets SCHED again. As a result the next
__napi_busy_loop() lap on the polling CPU sees SCHED set and skips
napi_poll(). The hardware descriptor ring ends up alternating between
busy-poll and softirq instead of being held by the poller. My numbers
only covered the early exit case with prefer_busy_poll on, so this did
not show. Agreed that dropping the fast path isn't acceptable for
stable.

> but io_napi_busy_loop_should_end() is io_uring's own callback, so could
> it check an absolute deadline stored in iowq instead of the start_time
> that net core passes in?

Yes, that works and is way cleaner than either alternative I explored!
What I have in mind for v2: store an absolute deadline in iowq and keep
the singular fast path but drop the "&& !loop_end_arg" so the loop
re-enters for the remaining budget after a need_resched() exit.

> This isn't a bug, but with the special case gone neither the single nor
> the multi NAPI path checks need_resched() at all for the whole budget,
> and the only preemption point is the preempt_enable() between polls
> inside __napi_busy_loop(). On a kernel without preemption that is up to
> 10 ms with no cond_resched(). Should the message mention that the
> single-NAPI case now stops yielding to a woken task on those
> configurations?

I'm thinking that with the re-entry in place io_uring can cond_resched()
when the napi loop bailed on a need_resched() then resume, between laps
it holds nothing from the list and is in sleepable context. That would
mirror the socket path. Though it also impacts the multi-NAPI path,
which never yielded so far, so I'd like your preference: include it in
v2, or keep v2 to the single-NAPI fix and send the yield as a follow-up?

I'll also add numbers for the single-NAPI fast path when it is not cut
short, before/after, so the cost is visible.
