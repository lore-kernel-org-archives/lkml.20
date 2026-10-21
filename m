Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792563542;
	b=gmX+195EtJlnXqEoNFTnGtBHoRcKotK28NtgbxyDhcyVN/Sfonf5sND4YvFYwqRgiqUD
	 NVAoZfwSq5o77S9LLihHUwWOPW5hr8iI9Iw3V5Atrih7sSTtL15zqmzrpOOMd2XNxehNT
	 1Uu6ktU7dCwb+INm0Hy7md4HZ2hOC0R65k3FN4ipZFNKIcnP8268QfYkrwspZrWONGMMh
	 udsfQNalJfa9Uauf9nIN6oyn/5vKlshfll0tttbN+15nzdbJ7TRHDODpzhbR0HBC/vAMp
	 Ya18dQZaP4HwPkyqhDMO0JwFZb2HlI8UNYVxYGdP+8n6oZQpmoF/nBUfOR/fcXnjJyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=RoWA2tpxrvJqsbVDhYiO5b4SnQrsRG+wn2mJu+39iWA=;
	b=TtXAhtpxTMoISPGKuQjzl2YDp/THV5IGQJa7IX6I6bDf/+YSxDvt53xztNeO5KzIlEuO
	 9Qh/1+iO8FRowjJG5B7Hzl1jG7JptGwqSxqnU7StM40800w061KW0zDxKaFeqCuplwt+I
	 zGbekI+ZKMJDPP0Fg+llrtVa9McvUuXN2WOX8ZfyA1iQWoKCxs0eP7+q4lAUkOXebWeOd
	 rdy3xUiAxp6wF4ihrlNSA3C4dP9ZUcaflHHNNl7Febp9jb2As2RcjuqMAA4JpVOmwd8cG
	 ZZXiwM8b4pJFfg04DwPWO6j7AHE1/u1hKa/dTlS/QuWWE6f5GXR0Vhupx/xEnsmTU6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J+Rbha6M;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EEB606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53EEB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J+Rbha6M
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1145216eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792563541; x=1793168341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RoWA2tpxrvJqsbVDhYiO5b4SnQrsRG+wn2mJu+39iWA=;
        b=J+Rbha6M9V1ZKCc5nzYs0d7L65Us8Gqd7SXSE9ETiRwIthgsK8DygvNGE0xYG8RVQl
         J7Me9PRFWEhoabnvYHvooBWQlzu2w1Ttg9KLSCHh8qQ7IAgg3x/HYGZqZQgWymUWYrKQ
         uMzK2UDJeg5EaQRXdV2yS8iyYu91Az40XKYxo2L+AZbm+VWva0/IJgwJIOIdicWn+m1u
         GzJSa4k7AfAYi+PXKl+fl4nMedfVmfACg02i21IALfYIR+JtBPGuuquWiBUkKpjQsjdg
         8B5yIteeejna516vO2r12bUKHebKElnQuvQwHU9Wp7W+vmZf+L/0DXuvJtKO8TWvZ5lW
         028A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792563541; x=1793168341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RoWA2tpxrvJqsbVDhYiO5b4SnQrsRG+wn2mJu+39iWA=;
        b=SQdZUgb1D859O8htjIUAY9+kRR1hN9x8KU6Gai2qEW6nzrIEWdNgmJDw9/+uqwxnVW
         mHpvQp3/cVPBlqHzkQ8VPB7SHZdtDNxXR0URjf9/AjggDqCNZa9aMyMaEP2K0hXol8r4
         goUc8NELMRuE/X4E78Vpid1Z9USE+5ebEJSBBGU8dYbzMDWdkm8SqN+RWkCyjBpfChj6
         xG9Zxb1r+be1eFwE41yr4NKZMOgW1TNtPe5DbTcUvVKYelbBw7GnCeAfo5pWADJmFs+U
         4H8pfuqKv9NJWGjuMeTVJrBAdCQXHAS3qfdpJfK7KTRTqrnVZLYETgZPSsrAFR6P2g4+
         OwaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXGzBgbb88nPAbnXkbLWoKk8McCazXX7zEwgs8OoVC1C+GMj97olJt4xTfLNVoTQwHdeQH1xHmH/9/mRI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjqnwsYvWFIhOQM0szvs4EHO3B53+WhYx6UrOFnHazXYfs54T9
	kWqhMiW8NzIuuK8DyGhTSmK5JMzK03o2g+1t2ieZeXUKeG7+G1o17/hF
X-Gm-Gg: AYBFou0mihsif8w+Eep3sjlUA6znHZ3DZfBTrmZ01c5TE9xIxs1MyyQ6pT2jwNox2nQ
	DNSE/epzEtsjcFmjKNDd8IQBS0PUBWp3XSTxoZ/yRMdX+XjKbxmfqBu/0IVyJAETjrugx3gk3HO
	wuc7CVtSRo4ROLmbUuTErwfI7sxLaPKlhFUyp1gLVwlbc5eFB8bspuVB8qYi7kXHRvLDBBu8Aqq
	bWXivJjDKow0OFO+wzgR6nxyPlJ0OotXkat3Q55mcJPNR4BmDxKtPLwXuaoDkq/qzaeiZfnOiee
	ZwmkdbqELDBfLGAKiLOVw+lAcqdYbH1eGeEb4ZGGmH65RL+CUW4v/FrFaScN5nLfo3HrAk857Oi
	fAbmLBM608qldcwyCeFl9ZWzjbjxeZf3TBe9GAcvUnaTyZLiML6nqKzLRucPZmaknD6BH+QTl6H
	s1qiED3694/hheDJhmA1IlMoE10tF+eLz+86Sx3kuy0F7C48jspeahJ7D2cKaN6gjGqvCoLxjTy
	jE/H6b42956j5Zg1o4Dz7dOOS+ebouiJiQ8s/IbEiRQZEKd+2oRQMMt+7XJQcivBS8QbHj9Vg==
X-Received: by 2002:a05:7300:72d0:b0:360:444f:a56b with SMTP id 5a478bee46e88-3674e450f0emr3159821eec.12.1792563541063;
        Tue, 20 Oct 2026 23:19:01 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm4550577eec.12.2026.10.20.23.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:19:00 -0700 (PDT)
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
Date: Wed, 21 Oct 2026 14:18:53 +0800
Message-Id: <20261021061853.2254944-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0aae72c3-7f46-4236-8cbb-d3e6f3c66e62@arm.com>
References: <0aae72c3-7f46-4236-8cbb-d3e6f3c66e62@arm.com>
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

On 20/10/26 12:18 pm, Dev Jain wrote:
> I get it, so the workload is rapidly allocating mTHP, and kcompactd does not
> kick in time, leading to direct compaction (compact_stall) or fallback.
>
> But I think this is a tradeoff with the current design in Linux and has
> nothing to do with our mTHP usecase right? Even with PMD sized THP we may
> have the same problem.

Agreed, the underlying "kcompactd reacts too late" tradeoff isn't specific to
mTHP. mTHP just makes it easier to hit because the allocations are frequent
and small.

> I think the uncontroversial bit of your patchset is the fact that currently
> we migrate large folios just to free up a 2M region. To make forward progress
> it will be great if you can find a workload which gets us an improvement
> without the threshold changes and we could get those patches merged first.

That makes sense to me, and I'm happy to split it this way - get the
uncontroversial "don't migrate folios that already satisfy the target" part
in first, separate from the threshold discussion.

One caveat: the exact shape of that part (patch 3) is tied to the cc->order
refactor Vlastimil suggested on the cover-letter thread. If proactive carries
a real target order, skip_isolation_on_order() largely covers patch 3 on its
own; if we keep order == -1, patch 3 stays as a separate check. So I'd like
to settle that refactor direction with Vlastimil first, then post the
uncontroversial part in whatever form falls out of it, to avoid reworking it
twice.

> I am saying that because the reason you keep crossing the 90% threshold is
> due to the nature of the workload and that you set 32k mTHP to always. I doubt
> on a real system you will cross the threshold this rapidly since mTHP would be
> mostly "madvise" and that mTHP-requiring workload wouldn't be the only
> workload running.

Fair point, and I should be upfront about it: with madvise, or when higher
order fallback is acceptable, you're right that there won't be nearly as
many moments where the score is high enough to warrant compaction.

> Given that, one thing that comes to mind is this algorithm - kcompactd wakes
> up, sees that the threshold got crossed again, which means it woke up too
> late. So it should manipulate the threshold or its wake up time. We need a
> signal to say that the mTHP allocation is too abundant and we need background
> compaction more frequently.
> This algorithm may be in contradiction with the sysctl ... so instead of
> changing the threshold, we could lower the wakeup time.

Adjusting the wakeup time is a reasonable idea, but I have a worry that it
may not reach the actual bottleneck for small orders. Once kcompactd wakes
up it still has to pass should_proactive_compact_node(), i.e. score > wmark,
before it does any work. For order-2 the fragmentation score itself stays
small (mean ~17 in my runs, vs the unscaled order-9 wmark of ~90), so no
matter how often kcompactd wakes up, the score won't reach the threshold
and it won't compact.

I actually have a data point for this: the 100ms loop I used in the cover
letter already drives the wakeup frequency very high, and even then, when the
score is small, it simply doesn't trigger compaction - more frequent wakeups
don't help if the check that follows never passes. So waking up more often
and lowering the threshold seem to address different stages: frequency
controls how often we check, the threshold controls whether a check for a
small order can ever decide to compact. That's why I don't think wakeup
tuning alone replaces the threshold question, though I agree it could help
on top of it.

Thanks,
Bo
