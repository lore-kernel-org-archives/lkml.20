Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BD3490BF2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817287; cv=none; b=SDT4dJxg+q30O6yeUShnCyDt45zrxQBePEXmZI+2lEtnH7LakooawIzQ1T623RRG8QyuauOdrl5ObaW3ccOs4J07s+Gukkn0S2Il50fC0yXIYpvc/RLGjdwz9uLTJHH2qUtzRgnx0hR+eosMd0yVONCbm3R78n7y8NcmF5wm3XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817287; c=relaxed/simple;
	bh=ir4Q9FWS/mJN9eXdPFtp0s6ICVnD5h5m7emX1waNT+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oxBzbWnV2GawU+0DFLKJ/QN8JKsna8/36Zk09eUIKD47ipyJfPwUJIRGjWsFzLTmpmkS1J/YBEbSOPrZ+Mn/zhhW/KuRHsgXrwy0972J/GBQnAmts0SHA21t3TzPJLULpIB01PQJ0E363cZ1OTMHqgRhY4wCLlebmZ7KgACIu4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+rQNmfE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+rQNmfE"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dc1508191so213260f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791817284; x=1792422084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ir4Q9FWS/mJN9eXdPFtp0s6ICVnD5h5m7emX1waNT+o=;
        b=b+rQNmfEbXtWyAAlW/7inK+L9kKU72m/JfOBrHTFyd8s3bEMMvOYkhf0LGfZajTnfj
         aOAvkP3gzLeFfuW4ddhBqn+Yp8lyvVWQwQyQke8KaReijl/gGJxbgk+JaIU0W2nU6W9B
         qb/9Kv1uxG8eO2RgoiHmjYj3ynl7xVpkv4nd2CTx1ia4FeJV/pbpAac77/5uCqCIkisy
         bAi8FdK/HHMJCvyapNxO0SXzJS8sGxYCPdiOgjMMAfBa0LU5baM9J9XCquHciNnw8USU
         7u3eQwUnkepcUQdRKmb81VUtHW/4FfTONvfBuUX72zaoR5H+is6KjSkkEx4VHuNmJoNo
         1zQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791817284; x=1792422084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ir4Q9FWS/mJN9eXdPFtp0s6ICVnD5h5m7emX1waNT+o=;
        b=ftdNsAdLZJLxbYySK8wfZ549u1Y4XTh8BcLG3j7s5f6M17L21PBIKI04eHw3Hj8MOs
         SbdHbRX2+dUFXPKI8x8QicPZi0FpfC+wghIPaR6PwOncISNBPWfO2qmng+fsAcywUY5A
         7ToGI8hFgeaO2OI6RNp+F+BdbaEjdY477GjcGfY5ED7rzdG5yH3iomX0c9Ikf0Sk0uNN
         MBmO86OivCIkMBrHWtoN4iqgGLqlcInBCc3wlm+g3tjIk9fgTzYWq/1eaoqZCWBi9L3o
         D7xm3QXMUAop7+feyjsyzjFx/I1srqEPVIfIEACoa2F/8es1Z0w6ehSGnckbaJ2LLUEE
         Cb1w==
X-Forwarded-Encrypted: i=1; AKwUvBwFdamHBjIgWUqSbPC4bbQHkRgLSHUukx4DH63f4P3ibSqoJgEFiiReU8mbXea+TXaJ/AvAor/mbA41RXs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPZ3au7LvHQaUfLHxVDInZwucJWBBlS+OZkb7p8JIX636yow9h
	OwpN5+7ZZaZviMdCl2iMI/WI4RZnxG68kRl60BGN5mCmVw3ZF+FLGD4y
X-Gm-Gg: AYBFou013/vGBJX/gr1YhG087TzypmaL9D8AGUd85sKeQGPeyQjVt2FQ9ZTHW6dnLQZ
	Ms8iSRCNukaSjPXx8feTNWQ8n9yKgMOMhJG9XatOE9FUe12MY6TTeICKDQ1oxZJT2MzBORQDjNY
	l+PtigMjRCy9Cx95oGSXxYpaqTBA7wAj/yN9cGTuBIGAAUrY+ux1+C+B2U0ALgTbqQ3tHVSPy9E
	5qO6ueUtCsEuKWGv/LikT+Qt0DCDyOK3hLapXlZ9F4H0qC8kTJouXqP+lac9djok4ZY8YnWnMfB
	aRBTJbrHmxTLUgSEWsYxem33fM7oII9R/EQwwwv7YirwOooMg+faQ+YnSFH6xGOwsbMxzgMQjOW
	8LbR9FPmyzJfGkeiE6W4fKcN7JI3SZvK+tg2vQWowfPSoJTjITgvuA//qvxQvhNwH8JajbOkXA3
	u7u5Q03QNOEjqF+lNBTTeWa9ypzzqHvVoJKR2rhUfbmHszt5lrKW81RrQ7ebLFEd8oNAEaJsteH
	9YS0BFfVaZ5EuZPcqPb
X-Received: by 2002:a05:6000:41c7:b0:48c:7f15:9a82 with SMTP id ffacd0b85a97d-48dbad20349mr16648946f8f.4.1791817283892;
        Mon, 12 Oct 2026 08:01:23 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm19844696f8f.56.2026.10.12.08.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:01:23 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: vincent.guittot@linaro.org
Cc: bsegall@google.com,
	christian.loehle@arm.com,
	dietmar.eggemann@arm.com,
	elif.topuz@arm.com,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	sh@gentwo.org,
	vschneid@redhat.com
Subject: Re: [PATCH] sched/eevdf: Fix vprot across reweighting
Date: Mon, 12 Oct 2026 18:01:20 +0300
Message-ID: <20261012150121.6516-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAKfTPtDDWo4n_AS6fSryz3NenDvKw04shmGM3wcv_MF-teDHGQ@mail.gmail.com>
References: <CAKfTPtDDWo4n_AS6fSryz3NenDvKw04shmGM3wcv_MF-teDHGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I send one mail, one more to reply comes. Ah.. I love it tho :-)

> Before 819224e506bc ("sched/fair: Remove dead code on
> enqueue_task_fair()"), the reweight_eevdf() was not called for curr so
> the false was always true. If we can finally have enqueue curr then we
> should skip this case

Yeah. The beast I created kills me. Pretty nice.

On sched_change_begin(), cfs_rq->curr is set to NULL. So while entering enqueue_task_fair(), curr is false.
on_rq is false too. But the tasks weight is changed and vprot never gets touched so it got wrong. Then on set_next_task_fair(),
the task is curr again.

