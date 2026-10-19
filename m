Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424886;
	b=j/CkKz/f2IJsHLXg6zOAm2jyCk3plyfSaHAgRqjEPW6T3AWLljAGLGw4Zk7GrIj3uGzz
	 O+utKUMR9gq4z4Opyo7jxuEmse6QMWLX7GADDuI9NCKZhVNtR0iKGnPF0JdfTbuBmjY4n
	 ZZ1DuhTAKPNzaW656627lEJzV8vJ6ZpALVF2ADrcPJi4fO0v02GBszXOPqsv6cvUGkcPF
	 uAkYQr40wKcLPQF8ZEGfVR0c4F4Tlu30iePREKbxFK8e0876zQ1hRKapv0DzqzvUK6+f+
	 rnXxH8cji0RBoYamNXRyvfbhH8Q2hAde2DMqnAA6HFYlZbBrvwQ2/SXiR7fzgzuEHWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5EEixkvcwcspzICRMAZjL3IuGJ+enZar5rUD2PHfTo0=;
	b=oh9Rs9MsSrunsyM9qaHG5tCawK1LsE1sCGZJgsS2hfNDVED3vMAemZdMBSInFbL0cmGb
	 Vk07+9mkq9UwhbFqPVtCi7v5JJbRftaAIgi/dS/fMo4MdFhgTzZRGEZP18FhFQqUp2J8m
	 T/z10+NNp0/1UkzdL4751lGtNARp8j1+iv3Ct20tzX45Z2xy7p3KAAtUU6fVPs4ssOEdF
	 VrwGCda8qp3eZNM47klH2l0OnykkoNsPY3JiCMQDR3yoAGlR5sIhZ11f+N+ZAotYoyv8W
	 Lbw9JfhSVaqaRDKJLqFKJUDLPTh3oWXSAbBl/u4OKjSUkfqH7jQ+3FTvUt2hsRVe4/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YP0jkBI7;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BE36084877
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9BE36084877
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YP0jkBI7
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35943f55c06so3396962eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792424885; x=1793029685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5EEixkvcwcspzICRMAZjL3IuGJ+enZar5rUD2PHfTo0=;
        b=YP0jkBI7GWvLiSX3PXCD6Q0wBfdr7fCOvUDHQXFMTyyaPfvwmuMgBK2iNscCYw8Ugq
         52/wVuYZjxnbaSMhAw+hNGsYOF1+irturGBzZU+IW4EQEsB720iWwoXuuuC/Nqnswlqq
         D6ggDmEBm7rDh9gefnsqyqbkL/A31JXlmmb32U9VAZ4LrbEnTpVLdipTwmix8WTP5eDe
         OrW9w5tR3idMEgVcHudAoraDOb2h6Cr4Ico4CHgdEFUZQ1Fv02yEerXM2hyTvIFOKy6+
         jKX6hEskvdvV1WxgYyan9uPZH6jO9I493YgB8/fAPoxvDNFbL7HIa9hxadBWZCMQ/AaZ
         7Khw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792424885; x=1793029685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5EEixkvcwcspzICRMAZjL3IuGJ+enZar5rUD2PHfTo0=;
        b=V+apnzply/Y2PpdM69dtOeFPibzRl3kC/SDFx0/aYnStZ4j4g8Ru03hNhCyTbcrOaW
         h2+/EZ1qWqNwH3RRqSKvg+6s6TgCQNWOII3GFx9X5WRubFJAR/ul1GdqCH4ek0o6CdF1
         V89cLRdrpqBJADczhfp9DbswuqT8WuCXT7Je5FhX882usNXz9DflvCQUpp7hzzfdT88N
         qvBFxEvaEEYWX0Wp8A8KbsBbXfT9jmmFC6ayj1TP5SN4w5kv3bOeCdHL54jg4pKpSxTT
         67nP+5L6Ab7uhtZRvMe+AbaCNBzcb0YV7s1qwpPyDY2DPcTy+tXPvMzWKQIgNvuFFRVc
         7mhA==
X-Forwarded-Encrypted: i=1; AKwUvBwx9nZQY7kyV/LOBbcF2kcdBG4i7ACL5C37M8cMWeJLbeXM/UPGA8YwH3AkHZSBZ/w9NnxiyjVjT6Dwq7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMnstnEOW8GrW4fhEPHZE163Mr6aZ/IAtrw9824r6O1S1sl3M3
	X7G5wo3No+lChljhDAuY8+PI2Q2D2z0QxufLfD73dTkwGJNuf4zK5vdz
X-Gm-Gg: AYBFou3w1J3gOQAMmoQryCcXx4VTv1GwIjQcJTP/yGVABHaE9rCe8D5HdMhD3As8f/U
	2j5d3TFSx42OB0P9lYH4+cPhYmkHyM7i5K8Mwpoc7czv4kPFsEuDVcdIgY7IFZBNuCGiDvN7dzT
	298TcoltL8YsIuu3YuPi93jjLLlk5UwtAo7hXw6EDMmPoeia1mmdiYK5cIkRZ5P3owk/zLQ9I1T
	3/lYF6GfAOJ5AJAzi+qNaJPjaXsTG6Ua/whR0lZ/fzAMNjCXmFt0qXkzs06XSR5FxaBMPmSUt/p
	bIbNKX3Xbs9jRGIABQTylrH6jI8EHCuMhuRNxOkct3T1CZyNEu8lxYm/HCp7shJeiX10xHkd/OA
	tpJHJyW14udwEZPF7TTLUNchLCJsDp0NE3pSpF5770j30FLnbBu/tmIeVVv/Dh8HbIimD5SvoEb
	Mp7LYmVEd8rBzIqK1+gbZ6BV9oYb6cBkprIKwbzBvhcTc1/iP7pQpP5NpvvkRv6+SfP6wR4IvIR
	g6IF5tD+LzW586Ff4iT66fYXPOr7eW76WJh149CqqrBUKFq9oegLnOZo2hb4J6YM2cjR31Jig==
X-Received: by 2002:a05:693c:8097:b0:35d:5e81:1d87 with SMTP id 5a478bee46e88-3602ddd6208mr15681319eec.12.1792424884655;
        Mon, 19 Oct 2026 08:48:04 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360826875b3sm34946358eec.21.2026.10.19.08.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:48:04 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/4] mm: compaction: target mTHP order for proactive compaction
Date: Mon, 19 Oct 2026 23:47:56 +0800
Message-Id: <20261019154756.2023037-1-zhangbo56@xiaomi.com>
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

[Resending: my earlier copy does not seem to have reached the list.
Apologies to anyone receiving this twice.]

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
