Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D44C352029
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789712952; cv=none; b=S4tdCLS6bASTfoELYQyZikhB++Ex2ZVbTjrXkbp1UYDwZ3CPYg45hBt71cw8WEZgjw9ZCk4J+LWY0F781BLY1klD5LwcHPytoWpWcbtkfnDkaKvNKCHmtmQP00DsXIkZIdC7YUDtd1z4T3xQyy4/ijoZ/Pv1z6PKeTYrG3HywRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789712952; c=relaxed/simple;
	bh=IXxwrwD5J6kw0G5HuCrAdAHFviTbBTD+k0rEeIFo9MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DEIhaFasT3ToeLSH5nNyv7uxmk/mnXoEYO7nvhZRb9wz04wHQeNWi/WK7eIAitAEqN3EOfAhJSKy4TK6OyptQ/FIH5lCSkj6rsRzwd0F9pE1zoFFEbzCsMIBeTIWpnDyICbLaifrX0iPEV8GdyhXhnQ4UdMUsfK1UwjhHvrh59k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7dz8qVk; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7dz8qVk"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485843116d2so41465f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789712950; x=1790317750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5aHukpvvvkvbLRkEITYHb7XYf4xpc3gscX/ilSIH04=;
        b=B7dz8qVkTjrO0ln/N3cJbEw17zrYYVOuGzSc4M0RuMiRlXfdKfNlKCLho+EY61lDWY
         effvGF1IVHC9hRvjYvW59FxTI8CvBL9nwvB549u37nsK2MlLuRHb07omj9TI2Bf9Dbxh
         z71ELV4o8eq30HsrRlpXMetWSOUkRFs4pFDo0mKSsT75vGTI34buAKUBX21BoC8yCBXs
         +1GG1xCd4YG+RCVEreRKL1wwkk+f7v8H2YM9VKXzPdB9XZvf15Bzc/t4xqByA+0OXQxe
         IbH1G2TrTxv6hzkvXSmZs+J1zyZk8PbDVnGsBZXW6oFBm89PDq7bIWAFLEMWUnEGbBfE
         X06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789712950; x=1790317750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L5aHukpvvvkvbLRkEITYHb7XYf4xpc3gscX/ilSIH04=;
        b=ZO5DBCqq6WS22skUYleMItmYdq30ct8rf/cBu/gFU5DHmW7GClzKj6iMMkOwAa00u1
         NQatq6sorbgD02vgqt0cyyvEnvdB5oCwDPmFUNA8gjr0ka7YxiXyZVVxETev42+mfu7c
         ofP1aFvmLHoQXXPBrbwfCWEz2YtnG2/dI6XUBCzIda27wTlu6X9RMFLfcDT8mivJMg4U
         ybH3ptTXL1o4o0LRdpYK+vXepJHI0JnzPQCNckFGfkF9rVf5qDCqKh2tCLn1VkPzblq3
         WiZ/dwSRif7PgGpWvDDYJoSe2/D5pHddLmyUKzdZCDbE/TejSTQcNgLbMx0c2kg0wRU7
         6QnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIPX3REub03BmItR6NFHavufWUURF5ioBsgKyNaVsG67ZY21uzYGhgKaCELVZv3noehuGYp6JBzCy3esE=@vger.kernel.org
X-Gm-Message-State: AFuF++mxL/EaC4RRz9AkipNjjZ8jUAXzE0xV5aftvvSBMUai0qBl8tmR
	to1e7ibaZmiMBBFsl61vqT3RbU7bhdj0PIjZ/xvEByuDf02tBK09LTvl
X-Gm-Gg: AYBFou1OiXVAZ/Y+RMiNs4L2z/kDKONyHU1S0P883eQXJWYn2hWo5lJnw93nnEFLaFK
	j3d5WIxxIpBunVeUdbmG1nWowNAQnoRa97IQUT/MFVtMuM5fB6kNEk3I3ELBeqqFnyOb9KOUPJH
	oMgV1Nb6s5p2iVffYnYzbO0tF+apNcJunWTcfVf1N2dJ04XQ+cfxULz6tHWEy2NUWIFz4CoEO1Q
	tRbqUnHDc36R3HyPEuEETGhSeR8JqmJ2YtP26TFI4cYOWM4UM82mH6/J+XlLZ2H42NzPk7eQnsM
	pzFum9zuVmM0Y6LhQ+ik5O1zsKcVN46XyGSOU84Z2KADSh6wMnLH6/Ut5pGKIXaWVdWKfxpufbL
	Oov1KcfZIrAJTXAgQa26SSv+C3De8j+EL//tXpKA4lMA5oemeQatSKvI7GxKvqrSW8pMS8xMLUZ
	C3uoMMJ+9/nMikXeRr7kazmLrB2uXVccUS9sm8ijEhR5OBZ5IraTxIkvyY+XsaJWsaa6zyXpsJq
	V668Rw2OTPTD/xjcn/ZAg==
X-Received: by 2002:a05:600c:1c13:b0:49e:7186:f36e with SMTP id 5b1f17b1804b1-49fc7dc1e75mr10618175e9.1.1789712949429;
        Thu, 17 Sep 2026 23:29:09 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm79786905e9.4.2026.09.17.23.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 23:29:08 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: kayracizmeci@gmail.com
Cc: arighi@nvidia.com,
	bsegall@google.com,
	christian.loehle@arm.com,
	corbet@lwn.net,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ltrager@nvidia.com,
	mgorman@suse.de,
	mingo@redhat.com,
	pauld@redhat.com,
	peterz@infradead.org,
	rdunlap@infradead.org,
	rostedt@goodmis.org,
	skhan@linuxfoundation.org,
	srikar@linux.ibm.com,
	sshegde@linux.ibm.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	vsethi@nvidia.com,
	will@kernel.org
Subject: Re: [PATCH 1/2] sched/fair: Honor asymmetric SMT priority in idle selection
Date: Fri, 18 Sep 2026 09:28:52 +0300
Message-ID: <20260918062852.77446-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917165515.17479-1-kayracizmeci@gmail.com>
References: <20260917165515.17479-1-kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


> Hi Andrea,

> Hope I ain't got anything wrong, I'm a bit sick.


> The sched_smt_active() check on select_idle_smt_cpu seems to be redundant on here.

> We could remove this
> By moving the check on select_idle_smt_cpu() to goto block and
> adding one check before the select_idle_smt_cpu() on select_task_rq_fair(). And just calling
> select_idle_smt_cpu() on here.

> I also have a question, do we need select_idle_smt() call on here? If yes then why? I was really confused while reading.

> Thanks,
> Kayra :_:

After I don't know how much times of reading the same functions, I finally understand.
Because of has_idle_core is false, we search if there are any idle SMP's on 
any of the cores.

I normally was going to send this alot earlier, but I fall asleep after
realizing this.

Also now, I don't think we need to remove the checks for one place. It complicates things,
when I tried.

I also booted the patch, it did not worked on me since I just have a regular SMT2.
So, that was the waited behavior.

So, here's this:
Tested-by: Kayra Cizmeci <kayracizmeci@gmail.com>

Annnddddddddddddddddddddddddddddddd....

This: 
Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>

Thanks,
Kayra :-)







