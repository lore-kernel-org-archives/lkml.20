Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142CF379C5A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160895; cv=none; b=r5nPccsxi8IOir0oLDY8EuS2v7eGnfjHwNryqH29kuvDj9kDZUdpXvN8Z9yJDq1FvTLqiC/LiU64cCamL2l2ifNLsy8K6YyH3n3CH0rxTlhrU7WyblfjqJRGCZwj7upKMAb7OFX46u4zVabCBZe0Cbi+2syyuqsyayhZun0N/Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160895; c=relaxed/simple;
	bh=GKozz/tp+bIJFpaOUq0zh72SepGChCeoHpNrT2chlz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r7RW/T6qphBv70RqniDRbdGAtBX2b82OFlnw0jZ4p6ll4bc16fAKs00wCw8FPTMDxSpV/Yuh+BZrH3D9+f+x/NdtL8ZkMxcxzvSvRqajjx1zo9munfuitoAj4XSxIJMDq0sT4qq56umbJE6iSq84ozY9adycVPNoKtqCAQA8UlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=lPVO/ncz; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="lPVO/ncz"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30b6dad2382so15792495eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792160893; x=1792765693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43txGlXvjyVAOxBJD3LVtjY+Cbo0l8Mor35q0LNFkb0=;
        b=lPVO/nczy2fUjgL8kAqdKTL186bWK5fY2ekFwMoseo3TzQbFgqhDdeLqS58K7qsv2H
         oA9hejzY6jtaQx0P9XZ81tSrtFu8J/YtXef+iYK80cYNbmLR9XDAsmhColXme7H/KYZH
         kJGbCCrWjNO0AL0OFapWYwFfgiVZIred4FhO4L0S9omIIhcu3PN1D4DXk+E3cVzXqPHu
         FG3801z5zWlj8eiQRu+H8XIyQgaUpeQSokt76//uhF/i5dJQWr31E7ze+7uztCx8zKaR
         dtu9AAB6RtXM1jRHNXwR62qxW1adp3apwrGU1FWowGd0GiPVUH9KNAr5h96bNbZMcW7I
         rufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160893; x=1792765693;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43txGlXvjyVAOxBJD3LVtjY+Cbo0l8Mor35q0LNFkb0=;
        b=SXrFwh/ET7i7kDSKx82dbynCA9hPGFvUx4Op1TEJ7AxM1CL4Zh/ZwV0raU0yQ2pk5K
         susyCevoZa2sdPaefC2LS4HJf8hZTpafr9hug2b+wKZmlMatBMwzFGiw6V6CFkSaMtm7
         Uhkyx3M7MCaM8V5RZnzr7luA2qc133oAy1kCYxokUzpeQLNiLBSD5N0/7z6/DUj/sSEo
         d6Mu7D95ZlDTxzUQKhnPTV5pSOqm45/D35gjmEnSWaf++upk/2H3yBXy5u/nk4Pk3UnU
         W0tbYfTuRlnrodsLKo12kGNrpWkzD9vzCSlqBYSItVJdnkqU460pqkeYVjh/NrzsSBNc
         49/w==
X-Forwarded-Encrypted: i=1; AKwUvBxyikFjtglrpFV0Rb3ctR8Wthej9QiIZSt3ArkEAPln/SOxj/2IyHwgv2m/77MMpHAPh6Ubc2z2NaXw/Z4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrbe9CicXZOqHIxr/TXjt57xB0Q2l9qm/vdB1Aa5ghOS7jit1N
	bDv1jBopC50yv5Z4qBFs43FKtGqh8FgGi2DhLB25vr3VyDarDyPbQCMtxfmwdVdIkg4=
X-Gm-Gg: AYBFou1EIUJXdPKNlh6o2D+VkS1ME+We93+0pupow1dStBhiKlWIWhqfu1B/49lRM03
	MDtXIcjKatN/tbo7X+gXYnpDdpcM8jQi/ZAyzlJf2p1m5NWZRHo72eJyVG6FlPb1gZX/J72P4aC
	0A8DzzXtXpjxhojel8yDtu3KGYWspvnrYSceQC098dh3c7BtRwc83TalWXu2DXeJb7FuFQPGd8r
	G1nrDEU7WzYPuI0cD/8eLYb150dN/SNrYpNvPDSVKAwU4o7MNJ3bPoIVLr83HZnmBZy8ONIfKJf
	4p8mHo1AH2Z3esa3IlHkOljMXDBbDKzEtCGRULYAOb36HIoqeHbMqfG8TvTy2WrH4OVJ6EruQ8S
	H9XkEnC0wbl1DpxIW5YqkLGF9zDALIPm6AvdBkn4HXpkp3hEYKF3okYI5u0unygEZIaJaZQZafj
	j/pZZR83znF5bd+68boppmmtMLQgeNSzqAbFkHjJ6ASV3SFWWGFP1T0HinU/GWUhrEQNAmDBghc
	/z3SYx/Oaqj1C4UOUaDAC0QNnibSoeFGzNjTaenIqwvIJh4+sScyefc6w==
X-Received: by 2002:a05:693c:88d5:10b0:35e:5ca:e0df with SMTP id 5a478bee46e88-35e05cae713mr11058517eec.35.1792160892526;
        Fri, 16 Oct 2026 07:28:12 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081bafa7asm7150945eec.14.2026.10.16.07.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:28:11 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: tj@kernel.org, josef@toxicpanda.com, hch@infradead.org, 
 Tao Cui <cui.tao@linux.dev>
Cc: cgroups@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, cuitao@kylinos.cn
In-Reply-To: <20260922043856.2020116-1-cui.tao@linux.dev>
References: <20260922043856.2020116-1-cui.tao@linux.dev>
Subject: Re: [PATCH v4 0/4] blk-iocost: charge flushes and zone appends
Message-Id: <179216089150.2070939.9793392159431285905.b4-ty@b4>
Date: Fri, 16 Oct 2026 08:28:11 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 22 Sep 2026 12:38:52 +0800, Tao Cui wrote:
> While testing iocost's weight-based throttling under concurrent IO, we
> observed that a cgroup limited to 1% weight could issue an unbounded
> number of flushes without being throttled: an fsync loop produced ~510k
> flushes in 12s with cost.usage staying at zero the entire time.  The
> device was monopolized while iocost reported no activity.  Zone appends
> were in the same position: the builtin linear cost model defines
> coefficients only for READ and WRITE, so REQ_OP_ZONE_APPEND is priced
> at zero and excluded from the latency statistics as well.
> 
> [...]

Applied, thanks!

[1/4] blk-iocost: add flush cost support with the flushiops model parameter
      commit: f8bc5c74d9eccc87d2e27767f92b8c11b3315d72
[2/4] blk-iocost: charge zone appends as writes
      commit: febdbf5682fa7e8f325b07a2c115e7632c4252bd
[3/4] blk-iocost: account zone append completions in latency stats
      commit: c38975c427cc3d3f6eb66a36143893be5cdf4ebd
[4/4] blk-iocost: fix stale comment in ioc_rqos_throttle()
      commit: 40607f9a6a5eaa071797481bd0ba5ea3ef1eb405

Best regards,
-- 
Jens Axboe



