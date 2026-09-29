Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991D753B334
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694400; cv=none; b=TDdNhNf5o0L06ilqi0mHkyVi+5oBYhQHMoCl8GquTdkkZEk+KSLqm7st6Yfzh+S2l/ZnGnTf1OIvfcVYV/2UugoLpH6WxaNbqV2/1P1wyqObRBba5Qnp/um47SZ+VpjHlHu96MJGvPLX4uyG3EPjUYjhfinthRqF7b4OFKEpJsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694400; c=relaxed/simple;
	bh=jwEA9tszSdXiqK2lVGbK9zWNHlffeaTYOxNnAuJHg0s=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ta7c+BKKIP55k5BMQm0uoQn5q2p3CjNca52HHL2d771ExL65sZUDXCRZ7bSkX0tNDdYvfyIZN41ljIoaJ+cREwDbFbFAgll1rNYKLA3HcAXp3Eq002FYDvHYbcQov1c7OD6mBiyVgGwCOFK8ahDVKv2a0XA8oWCnZbwz5yRE7r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6GT5t2o; arc=none smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6GT5t2o"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8a87be3ca16so35955177b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790694388; x=1791299188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aBbvMtdtXkPr9NqwMjzBWKgQ9hOQ8+AsNzjKBiR/MZM=;
        b=h6GT5t2oAjpHhnStHfZZs5+v/BGAaWIu/60oc/Jvtrwgq25a5N78TqLWlLY6tAon4h
         CUKwPT4nszAokGPumvJbv0xMvmD3KJbacNAD4CKQSd+3ue/XjXYvXB81nfL2qRoQmA2X
         /K7XkENNeq0m7wX+miFKcfZrwHwZM/Nn7TC4VlpXCjqvSCLzqWslN1U9szSJZx1/W4dz
         KWiToeXr+ZUMsx9/i7ZeQkOGaIm41XisMs6mmxTjZjYrWYqlgmdjdjBVCPeGxBwg9v9q
         q+O3vyHinS+AHmQy8NviMV8vGooteQFhkUTjtTggt8Zcl8rlDz88/WTcnZIg8DXVix3M
         ouzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694388; x=1791299188;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBbvMtdtXkPr9NqwMjzBWKgQ9hOQ8+AsNzjKBiR/MZM=;
        b=JVnTCWCB/iL/b0C1FlatcZLrVVYTaORrPyF9GcZqGL+bt7h17WTyGZpTwfr40vr8uw
         XrjsJ/I4lV/kZ5/BXR+MYWZ+OpRJ85TaY6DCIaxi46jtTp1RRrUbP2UqiSs0FiNtRL5E
         sUhpJnAErdyGCGjfuSCyquLnKWT7UK08q09rcZ7Q1wPbbZ5XFqcv0WAvRLLh4WAuzfXp
         3+7xg9FI82gBNm33XTUP4Vb/D2jMSejeb6BSX1zW0IRVLWS1nifch6FawogYSxfN7xBf
         xKJNPB2VI2fVAbump7neniXn6OA2mjP0y9hbNT0vL3kLmriOEGEow1hGFf4ZdKNgjxxE
         r2IA==
X-Forwarded-Encrypted: i=1; AKwUvBw6I0hCvRnu4vOL2AWghMsaIr2ke5b/SZ1/aBgr3Q4MilD1vRUx3o3cXDnzv8BCs4eCZSKULDQ9XMwv9vY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ70YqsFCngIODcEaNEajE9y+Z6FHcQn5M1L6Y5/zdEz+3TL2zS
	AZm3PZkXejY3zcZaP2ZMessXLz4rC4OMN7m8pvivQ5+NDORJ95NU+TDQ
X-Gm-Gg: AYBFou3EdopP8eqIwCzRMQYqkQY2l+3VEpngqip3vQuWGJfLGPL3TT8YWZcDlkSKAtU
	lx0ixkldnn/p99Fi0TS0s5WnXiy9BFE1kFnP99aaAEVTbptsfA2+hnLpsJ5XDQFOnQVN/Fb83Je
	jSbu6VkRkTKW+Es73l0amf0iaXV6CmCSv8AfOvWIetLoDcHfFRrzVVbI1uVMdtJFul/B2l+iz7A
	u2eWkqaAkfpq1x5cQgyyeakn7DX+AL+8cktvRba0riVRC+0LE6dO8tIuXkaTZYggfGY+6r0eTRr
	XkoPVmByoUt6bUuJcjGbTZyL7ED/p+MfKVg0mIyZqJ8yYxTC/hFxVHEPwaEpQx3WhTuiNAEscEK
	nMNAzRAZHvKHOjIB0vx3g1jkJkpuWMls6H1vw2/pM1a8fpEMFYU5tcI3K3Z9De/SJPodtWFz5i/
	JjfEcBbbQsKcdWspiIeLxBQoI8vM9OnJ0cy06mR3B2sE++hUyW1jJGc6D0o3t0VOkuDvzjB2uJG
	nO7gmmbEy4iGDLH5q7vdlg6JxB1B4bdk4EIdMYsYOxM75FStGi+
X-Received: by 2002:a05:690c:c50f:b0:8a9:a1e9:2659 with SMTP id 00721157ae682-8a9a1e92fcfmr37633367b3.50.1790694387584;
        Tue, 29 Sep 2026 08:06:27 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm60566977b3.24.2026.09.29.08.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:06:26 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:06:26 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: lollipopkit <a@lolli.tech>, 
 Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>, 
 Willem de Bruijn <willemb@google.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 io-uring@vger.kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 lollipopkit <a@lolli.tech>, 
 stable@vger.kernel.org
Message-ID: <willemdebruijn.kernel.570e0a646f4@gmail.com>
In-Reply-To: <20260929045433.59435-1-a@lolli.tech>
References: <20260929045433.59435-1-a@lolli.tech>
Subject: Re: [PATCH] io_uring/cmd_net: drop unextractable TX_TIMESTAMP skbs
 instead of requeueing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

lollipopkit wrote:
> SOCKET_URING_OP_TX_TIMESTAMP selects error-queue skbs with
> skb_has_tx_timestamp() but extracts the timestamp with
> skb_get_tx_timestamp().  The two use different checks and can disagree:
> a skb the walk accepted can be rejected with -ENOENT forever.  When
> that happens the processing loop stops and skb_queue_splice() puts the
> unprocessed skbs back onto the HEAD of sk_error_queue.  The rejected
> skb is selected first on every following run, fails again, and blocks
> every skb behind it: new timestamps keep arriving and keep re-running
> the command, but nothing is ever delivered again.
> 
> The disagreement is reachable without a race.  With
> SOF_TIMESTAMPING_BIND_PHC the walk never looks at sk_bind_phc, but
> skb_get_tx_timestamp() converts the hardware timestamp through
> ptp_convert_timestamp(), which returns 0 when no virtual clock matches
> sk_bind_phc (for example when the vclock was destroyed after the
> socket bound to it).  ktime_to_timespec64_cond() then fails and the
> extractor returns -ENOENT permanently.  Any skb with a non-zero
> hwtstamp is selected while SOF_TIMESTAMPING_RAW_HARDWARE is set, so a
> single such skb blocks even the software timestamps queued behind it.
> 
> Measured on real hardware, an I219-V (e1000e), using
> /sys/class/ptp/ptpN/n_vclocks to create and destroy the vclock the
> socket was bound to: 22 error-queue skbs generated (16 software + 6
> hardware).  Of the 21 extractor calls, 20 failed with -ENOENT and the
> one that succeeded delivered 1 software timestamp; deliveries then
> froze while 8 further sends kept re-running the command, and the
> remaining 21 skbs (15 software + 6 hardware) sat in the error queue.
> Both control arms (vclock kept alive; no BIND_PHC) delivered
> everything.
> 
> With this patch applied on top of the CQ-full fix ("io_uring/cmd_net:
> end TX_TIMESTAMP multishot when the CQ is full"), A/B tested in a KVM
> guest from a single kernel binary, with the new behaviour behind a
> test-only runtime switch (the switch is test scaffolding and is not
> part of this patch).  The guest needs no special hardware: QEMU's igb
> model emulates hardware TX timestamping (TSYNCTXCTL/TXSTMPL/TXSTMPH)
> and the igb driver registers a PTP clock, so the guest reproduces the
> same failure the same way.  The two arms are separate runs with their
> own sockets and sends; the device holds one pending hardware
> timestamp, so how many of the 16 sends get a hardware skb varies per
> run (12 and 8 here).  Switch off: 28 skbs generated (16 software + 12
> hardware), deliveries froze at 1 and the remaining 27 (15 software +
> 12 hardware) sat in the error queue.  Switch on: 24 skbs generated (16
> software + 8 hardware); all 16 software timestamps were delivered, the
> 8 hardware skbs the extractor rejected with -ENOENT were dropped, and
> the error queue drained.
> 
> recvmsg(MSG_ERRQUEUE) already treats such a skb as skippable:
> sock_recv_errqueue() dequeues it, returns the error message without a
> timestamp, and frees it.  Do the same here and keep the deliverable
> timestamps moving: drop the skb the extractor rejected and continue
> with the rest of the list.  The CQE-full case keeps its
> requeue-and-end-multishot behaviour.
> 
> Fixes: 9e4ed359b8ef ("io_uring/netcmd: add tx timestamping cmd support")
> Cc: stable@vger.kernel.org # needs the CQ-full fix above
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: lollipopkit <a@lolli.tech>

Is this a real name?

https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

"a known identity (sorry, no anonymous contributions.)"
