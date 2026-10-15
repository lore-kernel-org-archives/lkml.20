Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DC43D903C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033165; cv=none; b=UJhi4IAWmjx25n9zvg4b3hMQQTj0mtAJ3gI614gsKtFiU4csF/w3McYrsFlXV+iP3UWUVkwnLyeBeZLH+728Nq4EEEFnbjDHy/ovZvk61JMr1ACiKyfVXYSMEGiOR8DqPVJzGvz8kNIeigVz/Ao30770a2Lu/rbyQWgwzZu05qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033165; c=relaxed/simple;
	bh=xE4Y+h6rIv0lHGARVAbRImsfEE/NPl3uAZKfs72iPuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m2TnBqtBAutY/8n6xD3jzCKKXgMG0TArThA6z5WgZy5wSkuBYF9N5e6p1/pdCCOEZnR+/BrpjhZ+SYYqQyzADfIJ/cFlLRrgUnIp+2uei5nYc44HUsRJk1JBrRBmWqEg8Tj4hfVToLq7x1c5540qbUznr0Fq/rrV7SwmVlLIQs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2gYofJx; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2gYofJx"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3514b90bb89so2726885eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792033160; x=1792637960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xE4Y+h6rIv0lHGARVAbRImsfEE/NPl3uAZKfs72iPuI=;
        b=D2gYofJxwa+CGZx0odehTy8lKsu2o98ubjvloQJkmQV5fYTNh2JtXXwvAHaFxxAuZz
         Pm0M/KatvlcVwycX55p0on0Ln+ORd/RScShSb3baEIm7SF+4E6aLaYKJ6m07VWeEhoE0
         eqeTc4QgEkYbtdZ6p5XQaREjaTmBgKWxZGMW9pLCubvNNJ0UmZMU5A+zFGxsO21+cLRN
         VjgYZlPOZWDOvZOCRbQT3mfRamWglWbx0DIf6A9yBI8BIo/cYEjF2iX2OwTHVE1d9f/c
         RV5iPcNzmMLNSN8NxXJYd987OKZ6ektP1JH/s4Sj7/GN/t2RBA+10Pz3l4at1x4WfQH9
         Raaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792033160; x=1792637960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xE4Y+h6rIv0lHGARVAbRImsfEE/NPl3uAZKfs72iPuI=;
        b=HNGClZAJChG+Rdj51Wky1GHxE6Lv0OH1Cw2uYP8KFZO0/FszS63GrqZarhbf64Imf9
         78z+r0rhe8c8/Kd8jf5GpHfqL1RZEmNudYrKqb914kxkffy1huV4DvKSbxB5VmDlILUB
         990vu1slpQUVYaNnZFy6GEIc3HVMcVqZmNf9liIYIfkP1MRolof9R6aXzILCUHklv/vV
         9tg2tqz2GGN+wwmBHdIQThmYnNIsiykBErTDPFGEQLZiimvwmbItDNR4kZIn0WQ5qTIy
         9V4OCXkjQBiPnx2h/BxB9PvdPmgKjWGCrTm68oj2YAwurH4Bd6cewsQbONqcZ9gyES1z
         JNCg==
X-Forwarded-Encrypted: i=1; AKwUvBzLwMmBTnqRiiHwqFuTqm2BIu3j4tL4Yeh07ru8bicQWc0p3h+TCAluUD/Nso0vq1DHd5lJiaCnt2TQAsg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBtDc32oqI8HQx1Fj9Alynn914UcJbDsYSPZSfmwZhDoH4YbY+
	FPr3FcPQFkPAXO0SSAw0BQP9/fr9csYBwMRzD9p84qD4yRs19XbpZ3jn
X-Gm-Gg: AYBFou3LURVNT4kig/cBvw4n6gxqhZHFVbuB3qQyRn1tmu0Iu9Z0mdfkv7da+X/N7MB
	sYjKqaIQ7024z3KBGdBC9faVtwgNtPs6JvunyIOlHV2GE5ldr+W0PVGrNLju8iE1hwnR/431HRU
	N0nSQqAnlPfUDzYvGb6ATe9s3l0gVmw8IGXQBMwTFBh/a0iJpRDBEBmw6JMfHdD8pWspbeduPxi
	TqzArYv1ar2oS2vz6y3vP8dZ6DONXFxXjQ1WZi3Qx+WHraAcNSq0uHroloy7GRFYAlK4g2146yJ
	BoIL6jaT+93rkNaIAt5khrwyI8gpiZw5cC+LXiKsGVbC2yRUUdOVkg7Tn37s+7yF3FadbAUQqYi
	OSk2uU3hQ7ox3gKCYDun65dsvSRfBunDXDCTAfFAf6Wwb5abrB9m8IqBv3oIHkXGxa1mI0YvIPj
	8Pr77r/qNPAa88LcncLrRhVtSxtyWu0E6E73BUeIBWiV5zslB2xJIsM8N4TEK1S0NE6GEyWPiMT
	hDOapIAMlI=
X-Received: by 2002:a05:7301:6493:b0:353:7d17:9a86 with SMTP id 5a478bee46e88-3537dffd5bfmr21654556eec.26.1792033159624;
        Wed, 14 Oct 2026 19:59:19 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm52812974eec.6.2026.10.14.19.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:59:19 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Balbir Singh <bsingharora@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Josh Snyder <joshs@netflix.com>,
	Kayra Cizmeci <kayracizmeci@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched: Account blkio delay independently of delayed dequeue
Date: Thu, 15 Oct 2026 10:59:11 +0800
Message-ID: <20261015025912.1541134-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4ce12bff-9532-4b27-98f2-a807bbccfaf7@arm.com>
References: <20261014081731.1068794-1-zhanxusheng@xiaomi.com> <fab66e31-7c7e-4a81-be59-1a4c1458ff43@arm.com> <4ce12bff-9532-4b27-98f2-a807bbccfaf7@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/14/26 17:12, Christian Loehle wrote:
> Start accounting in try_to_block_task(), when the current task commits
> to blocking, before delayed dequeue or proxy execution can retain it on
> the runqueue. End accounting when clearing is_blocked, including queued
> wakeups and the proxy execution paths that let the current task continue.

This is the right place, and it subsumes my patch. Please drop mine
rather than queue both.

try_to_block_task() has only one caller, __schedule(), which passes prev,
and prev is rq->curr there. So @p is current, the argument-less
delayacct_blkio_start() is correct once the call lives there, and the
signature change I proposed is unnecessary.

The two also conflict: my patch rewrites the sched.h line yours deletes,
so applying mine first makes your sched.h hunk fail, and the new call in
try_to_block_task() would not compile against the changed prototype.

Reviewed-by: Zhan Xusheng <zhanxusheng@xiaomi.com>

One question. rq->nr_iowait stays in __block_task(), so the two now
measure different intervals: blkio delay from the commit to block,
nr_iowait from the actual dequeue. A task woken while still delayed is
accounted a blkio delay but was never counted in nr_iowait, so
procs_blocked in /proc/stat and the iowait time derived from
nr_iowait_cpu() still lose that window. The counter stays balanced,
because such a wakeup returns through ttwu_runnable() and never reaches
the atomic_dec() in ttwu_do_activate(), so this is not a leak. Is leaving
nr_iowait behind deliberate, or a follow-up?

Thanks,
Zhan Xusheng
