Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422211;
	b=rBEq9kGzlS+V5E0E9pz8+2Ji1dtNKVThV/lOhdpm757I0i6EIyPR/pN1OBI9y4kMsnQZ
	 mQhqxzQtXH/Fl+P5g+iUw2/BZi7KE7WB8neLriweDRivxJK/l7+e7WFHcQ49cnCF9TaSB
	 mK+MkxELjClZT/onqpX4dx7c17J5tbFfB2w1cyqjAWX1pX0h0rWhNHKrgRWJCrpilbXpt
	 a1ixRsW26sGyZuVwBoGzMhAbRfwiHmszS3DaVWfs80qtcp19PZOUMNGxpYjhe14tILl97
	 CkOfX0dF/DwpCJNh8/UIiD6Je7VB+nDxoAWUShy9uB80pRrAGUUDNn1aOAyNbV97Erg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=kKFgXAWOd0iYwNRMqtKFlgfZbmk+9qhcBIiWIQuiCC0=;
	b=bXDwFunwlVRO3+Ecgdwrd8Xu378zsKI/fQHF9CvuZ2KmX3u4Bc5vZH1s5b855/D0lL4I
	 aFjAxHb+KcWr7G1LirlFfrFokDWMxDWTQoGgKD9HcwyOWJngCwubFU+0+rm/Ru9Ku+rkB
	 1K+jfcWR22Vdcb9MZAWF7Au2stoLJ3oYuy8uV9za68XGXCOctzq3Ywq9LnS8C6IBaDLc3
	 Hlk1ywepIJreOWVAfMosvZZyMUJ+c02wzjDLAn8FeKnWrs28mKlLPVWaSy3fHPTDMUMV1
	 bGazcGUd2dYLC+8/jB2r/5eyjlyOaryPU70kSdQosQ6szwV1gSdiqAKagMjL801iKSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=swXVzvoO;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1F9607DC46
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C1F9607DC46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=swXVzvoO
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso144319eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792422210; x=1793027010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kKFgXAWOd0iYwNRMqtKFlgfZbmk+9qhcBIiWIQuiCC0=;
        b=swXVzvoOIS9tRIxsqOPkx3Yes0Qbd3d4yFtW23aGSulXrO5qMfUOvZzdCIqsbAZQfq
         5KOK0kzD1Jc1Tphru6k6Nxf2FSgPGozCshr7iNoo5uABSyrUb2aqFClA+IT3I4GJ2vBO
         5fHF2G84i6WMSzUA8cEY2Gv96WihJXgOc4VQELyuTsdEGrNQGSBH6OK6raSD3q1RhqWN
         ntgISS458qWnSQf1tl4eCi7nGCaAde/tJqGKS4oUyLJGHXLHOxQZmNzC3CUXVHQ1B5or
         l5PrF77DCgM6ojEtC8GqDK7wYk772bgnZjmk1wLOhwZ5m/UxVjbbr8Fd6V7ZyjKKwDSP
         Ohgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792422210; x=1793027010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kKFgXAWOd0iYwNRMqtKFlgfZbmk+9qhcBIiWIQuiCC0=;
        b=2zdQCaAWgO3Kazj8WVsH1EqR3jK8ihDWC+bfr0CWDgtk1obQVGYzW2tWZYHq4qpaw9
         +zDHui9rhG1O7UBFiC2E1dI27JCnSjawMryLahqsV9BfLw+CZTeHpS59NcEhoBjWgx2v
         yxFVY/YC+ilISeIrp0rohegkwjuT5aO2DjOi3gDAZ+Oy/Oa5aDOZ2Ejmejq3las3pAhy
         5eajeUeMXzXO8z9hnLxscvn11wGssrd/qk9yOmqmyFMv9ml9Sy9K9OpssE3rcz10rw4w
         Gj77+OcfBnr7tMHPkjnYo0RdCtXmyVqOEYE3BCY7XcpmspiVRW4YrvOd5DnwdYCvWvSS
         5UGw==
X-Forwarded-Encrypted: i=1; AKwUvBzQVMo/ZyKf4bR1/3axeXRW/aCSvpVfbrFSdKzMD8G8LPim/h2LeYBAnK95vBOKk8Akwugq+hw1tjdVSVI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqbhnYdHJyhXcOzXtq2K0enyY3oq6pNBnkDf0anhOvr1q9kboM
	x0ylEp3lgiEc6dDergnfgCN8cp8EeLgY4q5LM9kUS0aXhfDxDctuvF0q
X-Gm-Gg: AYBFou3+1Q1bgs58Jm4OSZ+WW5p4IOxtrzqVd8JyFLtEnLnS0rfgkPT/UJW0e+A6g8a
	A1MO5P/i8Pu74wpbNQg7Lp1w9FYVC10GNZGRAxFcsgmmb/Fqkg+QqVTXYzrVZSREr7PurlXWQ5M
	i2CrRo7ZQMm/ggEhO50EGDAeBrrQVZJ7rSkCDsHq9wbZVXezQ9Ie3B1FLXhjsORHRXofPwOBX25
	xpl/XRTPuY+2LWA2SisKgxNDHv/3EXW1VNMSksoB9RsxFEDAgJju65LCAtTHYAc37RPWN/3K1R3
	HcWmrrNUCe8Muxz1lw3nBlzbPWi21UDpbd/4hbx7zjbyviuPd5oqker+nbk5BpPtSf9PV3d6UOR
	KfjkQ4Nj5t6us0NreXZmZ3iL7Q8C4v9Jdw8zYD7NnVe96Qic0f5d5PwMmWMLqptrCLQSCNBwXY9
	estcQrbOWyPn2qjs2HEafOkEtcpYVLMxJtC/kvQw6oFYg1mHZbNCQiT9uwreZx3+nzPgTjT5jUr
	KruqWRqAuoZJdIwJvPz78yTGvaN
X-Received: by 2002:a05:693c:87db:b0:35d:9516:eb26 with SMTP id 5a478bee46e88-361a1366c56mr10050323eec.13.1792422204963;
        Mon, 19 Oct 2026 08:03:24 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm34648900eec.7.2026.10.19.08.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:03:24 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: dev.jain@arm.com
Cc: akpm@linux-foundation.org,
	vbabka@kernel.org,
	david@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	zhaonanzhe@xiaomi.com,
	lipengfei28@xiaomi.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>
Subject: Re: [RFC PATCH v2 2/4] mm: compaction: target mTHP order for proactive compaction
Date: Mon, 19 Oct 2026 23:03:15 +0800
Message-Id: <20261019150315.2018934-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <8e54025a-03da-4cba-bae8-1604463c7622@arm.com>
References: <8e54025a-03da-4cba-bae8-1604463c7622@arm.com>
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

On 19/10/26 1:42 pm, Dev Jain wrote:
> I wonder if this function should be left alone?
>
> compaction_proactiveness, as I understand is given as a sysfs knob to
> ensure that the user can control how much power they want to invest into
> compacting. So suppose the value is 20, and the highest mTHP order is
> only 2. This gives wmark = 90 * 2 / 9 = 20. So, even if 80% of the memory
> can serve order-2 allocations, we will still perform compaction for
> order-2. This seems "extremely proactive" :)

Thanks a lot for looking at this closely, and you are right that the
scaling factor is the weakest part of this patch. I called it out as an
open question in the cover letter and I don't have a solid theoretical
basis for the linear order/COMPACTION_HPAGE_ORDER form.

What pushed me towards scaling the watermark at all was the opposite
problem on the measurement side: without any scaling, the order-9
threshold is essentially never reached for a small order, so proactive
compaction effectively never runs for order-2.

I instrumented fragmentation_score_node() for order-2 on an 8G,
data=journal kernel-build workload and sampled it at ~100ms. On the
unpatched kernel the order-2 score looks like this:

  order-2 score (unpatched, same workload):
    mean      17.3
    p90       47
    p99       91
    max       100

  fraction of time the score exceeds a given threshold:
    > 90 (unscaled, the current order-9 wmark):  1.0%
    > 20 (scaled down to order-2):              27.2%

So with the current (unscaled) watermark, the order-2 score crosses the
trigger only 1% of the time, which in practice proactive compaction almost
never fires for order-2.

That said, your example shows the linear scaling clearly overshoots in
the other direction: a scaled wmark of ~20 can keep compacting while a
large fraction of memory is already usable, which is not what the
proactiveness knob is supposed to express. So I agree the current formula
is not the right answer.

I'd appreciate your thoughts on the direction here. A couple of options
I can see:

  1. Leave fragmentation_score_wmark() alone and instead make the score
     itself order-aware / normalized, so that a given proactiveness value
     maps to a comparable amount of work regardless of the target order.
     This keeps the knob's meaning intact.

  2. Keep scaling the watermark but with a floor / non-linear mapping so
     it cannot collapse to a value that triggers when memory is clearly
     sufficient.

I haven't settled on either yet and would rather hear which direction you
think makes more sense before reworking it.

Also, thanks for the review on patch 4 -- good to know the
costly/non-costly split seems like a reasonable compromise.

Thanks,
Bo
