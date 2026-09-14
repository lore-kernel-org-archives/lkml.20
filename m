Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com [209.85.128.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68435404BE9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789407605; cv=none; b=ltpwS0P1X60BJCGAlHBPGXR0ia0KZ102uLW5qSHvUTOytgFRygyHtx5teU5Wm6dvKaAkhHOSfh2vvkTDJmPhmaHihcwwvW3oJzZhzlOv/bcVEwB1+L0Fjstrq5Ej1WEnJncjoI5SSGNy2kTQJuRw4SXq//0A5uL32UqEz8l3R0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789407605; c=relaxed/simple;
	bh=MFBfT6hbrBgjaLc6AiG9tP3lKhRG5kGH+1HdxloStAk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sfSA/FJhAFLLcxdOERGvFmr2XXe9lkTXWh3oIVICsr61VU7M+lKougtWut/N+0iLGRSK+mxqsrOReWOiEBJM9yNHQqXTXZWnCFjbSxDVPnWR7z17AQs6kfoLUwqV2KwXXm3+/crMDAJITAcSTNbkWsfZHvpEv+sOU0lZ0U1L+gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=JYPSfC0T; arc=none smtp.client-ip=209.85.128.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="JYPSfC0T"
Received: by mail-wm1-f99.google.com with SMTP id 5b1f17b1804b1-49e77f38910so3183985e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789407600; x=1790012400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/okP47x+ZZHs6SOk2K8F3sWioEiHJE7O4RkNBoUH35Y=;
        b=JYPSfC0Tc33gAqqjyXIB7BwjYEDsu6Nv6QsjLdwO5P4jjmXDfnSh2PiQsNFtB9X2Ml
         NVjbCcKBbkqCmn86uwCpNoySWG3fL9CTj++ZC8TW4ubqkrGOSyMM6SFS0aNuk5kPnkxG
         ZIKaGMHg753DEs7ZyJFlcbc4c2GzEkXDU+fRYu9ZqYqGyU/PerRT2DumMM637mcMj/h4
         Rb9av3GinlpedYO42pETbQ0W5P8bSUEl5P5Yac1QwZ6aWtTdFQY77YVOQDBW8i52wXZ/
         9tho8fop0JCqamA52nbFmNkVKHrwZliR5Lqvx49AMTJRSYoVRnZDjtf8uPHm1UrBACZJ
         quHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789407600; x=1790012400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/okP47x+ZZHs6SOk2K8F3sWioEiHJE7O4RkNBoUH35Y=;
        b=AUMfLs6dHLev+AyBCxgGoTYpWC1hkHOf/Kd14S9uKRASZll3mSMU7B+nxkjDp8a+qY
         uCGcc0h3yYeqzDfPjaWIWXEvQxcwThxjbKksvyH8n2Wna7VN32sr7G84W8x+UzuO9dUp
         z/fKSnPBTTUOMEGJwzxA/WqPtgVr0sNeqzobp3wv2mcb1Zi9orI6qUmOY3Gl9HL1l0Gf
         v6F0uC4BSAsykXUnKpusnXCjqyDBPRnXr7XnghVXP745XoAG+APIp3cq6SrnceQ2c80E
         j7QDiErEfznjsA3LgFao4lIv5LUZk4qBQ+sdnfRkjiXgw3OaYitduo7AiZJp4MTG/vX0
         vq2A==
X-Forwarded-Encrypted: i=1; AKwUvBxaEECMVWy5A4jJEw2FuLLQwKffshXghgtr33cyLGT2/O7LcRAqLgIKnHKpj6VxyanUyE74L+v3K6XcVYI=@vger.kernel.org
X-Gm-Message-State: AFuF++mjV48x72upwUuuiezdscqLl9QbAOSlY4BfjInpV6lUV4CzERFF
	wWAyxsqg82f63vsWvY438iqFskd2WDgA0dD7rmKHW0xHdvBPZHkVIe7WXIcGOd0m90tNorIDNIm
	T8QEQsjk5yn73GckYrDA79GUVKUUJ7tjlk/yN
X-Gm-Gg: AYBFou3ATP4OquPtrSAp5cCPXjk5lqZ48y0T4hH/k25Fgjs9whmFSFx/QyAQUIxNPZG
	YcKIIpz+He4FphuNIBNTAUgeApiE44FxPzxTHH5+DCFjOdAp5TzRJhmzN/7bMBVNnyeia1ezZS8
	hqlir8SP6+GF+ozgYTyp0FH+kCqJwW2qFl8X8ZOJ1ZqhliOx40kaMG5FOIStze9+yupNRkAHoXB
	OxzjcdZdZhxc6NeGcSA+VuzFZZkFN+QrLRrWCPF2C4hNmiNpHzvMv017n2QJ3RYuBzXCUp3yLuD
	t510pyrSLnuOraRxhqx2Ko789W7GQptKFCPrJufdIzDLdbEeNJUTkWg0Bt1HTemJWYd3P/iEmw0
	kakCe7grpUzo6OpVYWB8ggdsAvcUIAT6Wr3NAmQ==
X-Received: by 2002:a05:600c:698e:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49e7a638778mr91528085e9.3.1789407600452;
        Mon, 14 Sep 2026 10:40:00 -0700 (PDT)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.128])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-49e7d678034sm826955e9.5.2026.09.14.10.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 10:40:00 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id 0736C340245;
	Mon, 14 Sep 2026 10:39:59 -0700 (PDT)
From: tmenninger@purestorage.com
To: Chuck Lever <cel@kernel.org>
Cc: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Badger <ebadger@everpuredata.com>,
	Jon Curley <jcurley@everpuredata.com>
Subject: Re: [PATCH RFC 6/8] SUNRPC: Reduce rpciod workqueue contention
Date: Mon, 14 Sep 2026 17:39:58 +0000
Message-Id: <20260914173958.2045683-1-tmenninger@purestorage.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <611738b5-e115-4531-8d08-62607dc7f8ff@slotpi15m67>
References: <611738b5-e115-4531-8d08-62607dc7f8ff@slotpi15m67>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> The lock profile did not move. free_slowpath fell by four orders
> of magnitude and __slab_free took list_lock just as often. So the
> list_lock contention is not the remote frees, and it never was!

Aha! Okay, thank you for all of your time and help with this.

If I am understanding correctly, the SLUB/barn/sheaf behavior we are
looking at here is pre-existing rather than introduced by this series.
The SMT affinity change is what changes the placement enough to expose
the remote-free cost on this workload.

> - Total and average wait for the list_lock address in the pinned
>   run. The unpinned run showed 5.05 min and 90 us average; if the
>   pinned run is similar, the lock absorbs the same time whichever
>   way the frees go.

For the node0-pinned run, filtering the dominant lock gave:

    2,907,948   3.37 min   69.62 us   __slab_free
      269,174  23.00 sec   85.46 us   get_partial_node_bulk
      175,965  15.17 sec   86.22 us   __refill_objects_node

So in total that is about 3.353M contentions, 4.01 minutes of
aggregate wait, and roughly 71.8 us average wait.

Compared with the unpinned run:

                        unpinned       node0 pinned
    contentions         3.346M         3.353M
    aggregate wait      5.05 min       ~4.01 min
    average wait        90.48 us       ~71.8 us

So the contention count is essentially unchanged even though
free_slowpath drops from ~70M to ~9K. The pinned case does have
somewhat lower wait time per contention.

> - mpstat idle for node 0 in both runs, to tell whether that wait
>   is idle time being spent or throughput being lost.

Averaging the node0 CPUs (0-23,48-71) in that sample gives about 66% idle.
In the earlier unpinned/all-local bad-state samples, those CPUs were nearly
saturated, generally around 0-2% idle.

> - Throughput for the node 0 / node 0 run that produced the counter
>   table above. It is the one configuration missing from your
>   throughput table.

Oh yeah, it was the same trend as the workload table below: unpinned was
43.4 GB/s and node 0 pinned was 46.5 GB/s.

At this point I think we have a reasonably clear separation between the
pre-existing allocator behavior and the regression introduced by the
SMT affinity change. I don't have any additional data I think would
materially change that conclusion, but I'm happy to run any targeted
follow-up you think would still be useful.
