Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C493233126
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792110870; cv=none; b=sHeN5kzUp6jxGKzKaRUDydNgSP6UYrlx54rhY+CzeOgdccakNqzWiwwa7pHkgzjs983BT3wWUgCm1fgd2YL64L9zaZzKU6gZhqEILE0l83Yw869Axb+177TiArUN4x8h5pLYorGrhtPEHkzEsJHcUhMCZUpRtfdhWUCgFRQmdkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792110870; c=relaxed/simple;
	bh=KAyye0S/j0Cj2j7YQI8ACm6RlaORGm1yCDYWqO2MoG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EyGgsOpWZZkqwzsqKMSKShU4s5uGh/C4EpHaCZMEnxRtWVRciMTQGuGZfstpeRNM+XLArC2ZCgPl83atQffrJVqiHg22fzvUBHTWnK4LisCrYUF5UvbwY6yL2SQcO0a+9DtiRBwXg953x9014hLdgkZ27LSDf8zvqmgEkP5tHJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7G0YH/s; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7G0YH/s"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b06c0794cfso28955127b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792110868; x=1792715668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u1tD54QZ8gXmMt0UvyLjGMVeM4XPBHYfkYhcWssb2jg=;
        b=D7G0YH/sp7RwuuswRi4YL1ePBzhIxM9Ci3/gwzLHjp2PUUMuilpGLUDtSuV2JDS4YM
         TSSCp569I7KkEY0pFlXcZNGfozMqBAfAcJZk3HHT3qpIBQq6gewnw7u6WBwPCDD7JSFV
         4lzWp5rx/7ekkj+E3qW/Iwln+1mjBuHfuh3HByGkU8Q3Sj9cHXgobRMo4xB8sxter11B
         agOuQ+l+iwCuZqX2UUSO+tfBoIxq0aoabuBD7n0iA73qYfTlkZ49+A88ZbVNk6On6kZA
         VlSAxtCTFKI7IuxSCOTqgICmj+27HLjffBQCM9Yv671K8Ybm3Yun8cVjtP1Tq2/sfu1j
         mOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792110868; x=1792715668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u1tD54QZ8gXmMt0UvyLjGMVeM4XPBHYfkYhcWssb2jg=;
        b=IOwz+HdT+cbbB6NQELsafE7u4ncfKhP2Ku3v9eJMPS0Ky4bW0MRVoxhcDHWF7uYkMw
         0X1gfj/mg9eigJlyzPF/89ScM4+IivDMASUiiGqA+E1N8KksBH3T4P7p9qvyIXNSFJFN
         FAS6kYKZidWx1FD4UYN3LPwoMnIL9DUDr20oUaV9f4q8KZxY6CUsESwVjM59U1adeJtE
         gyR3XToax73+kHj6cnl3MmIhNUczwDTd5KrK8dw6fX3SbEh3rcj3Jk6fCj44lk8WNigb
         6t4aOAAwjCcaiK9MFfiXI4N6D0RMeS+/wDouBrNSLgbQzmXAMOe9I7guJyMmUkYnM7Lf
         tsbg==
X-Forwarded-Encrypted: i=1; AKwUvByypD0zctVYIBs5dEG5hwh01TUVK7hISdI45zzMslEAksUZ5ohPgyyt6gbbxpKjBvcOE1l07Ue0mAEo4RQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0HzqLTvtTQ1TqRdxLODsgJgpBZHM9G/evrk5FY3SRpiWjCLRg
	EtX/FUZx0kJAsWaKfuZzp5e6BRoTnV6PyILJF776hz3n2E3rI1LRsCYJ
X-Gm-Gg: AYBFou0T+UcS1sYQH/lZfZlEDMcAIO3v7K5Do9f1X89FXMLTgJfmDiAnMS0uEiDOhl2
	XzodRJ2AL9/FC2SMiktZNB15qU7RwvdwQSO4+0rAf2nqT4ab7HH1FoeUdBAK+Niqw8bIfu9HH53
	50M/89mCFfVI+nlbMUR2qOGlJoN5tGI/1vx75+ytwGSzRqRFL1pvIGC0DgASs7m63SmQTHbejMd
	SBRqFT/BNw0TE/24nT2wXLHhqqu+h77tIWv2c9BfR5H1103lpDyNbFtdXAGvD9vtFKsxi6sZMsS
	jPqJOX8QHwz1SDGdZjyFSMoyO5BMjMNN6Hxu2eF+XOvEgI5JnhbykApb8p4jdW+EgyFzyPffP1O
	z5jPPmM84X96wcrBFVN8hk2N/yrrTuwCf/rj+3B8xHyiNpiNB7/FGfPttuCsHsdnV1uv5s8FOlx
	t2jTIWHl5v/jCTXTfG3JbRGWeDlFhcnppypX9/nDR1+vFGY1Bz1rY=
X-Received: by 2002:a05:690c:6d84:b0:8b0:d8f1:79c4 with SMTP id 00721157ae682-8b0d8f180b1mr15763367b3.55.1792110867985;
        Thu, 15 Oct 2026 17:34:27 -0700 (PDT)
Received: from corey ([2600:1702:5081:b900::49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e58892cfsm2982937b3.10.2026.10.15.17.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 17:34:26 -0700 (PDT)
From: Igor Malovitsa <igor.malovitsa@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	memxor@gmail.com,
	linux-kernel@vger.kernel.org,
	Igor Malovitsa <igor.malovitsa@gmail.com>
Subject: [PATCH bpf 2/2] bpf: Fix user ringbuf empty check on 32-bit position wrap
Date: Fri, 16 Oct 2026 00:33:18 +0000
Message-ID: <20261016003318.529860-3-igor.malovitsa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016003318.529860-1-igor.malovitsa@gmail.com>
References: <20261016003318.529860-1-igor.malovitsa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__bpf_user_ringbuf_peek() copies the unsigned long producer_pos and
consumer_pos into u64 locals and tests cons_pos >= prod_pos for an
empty ring. On 32-bit, once producer_pos wraps past 2^32 and
consumer_pos has not, every drain sees an empty ring and the user-space
producer gets -ENOSPC from then on. The fit check total_len >
prod_pos - cons_pos is wrong in the same state.

Keep the positions in unsigned long and test emptiness through their
difference, as the kernel-producer side does since commit 6ff5b56a50c5
("bpf: Fix pending_pos walk on 32-bit ring position wrap"). On 64-bit
nothing changes: unsigned long is u64, and the signed test differs from
cons_pos >= prod_pos only for positions 2^63 bytes apart.

Fixes: 205715673844 ("bpf: Add bpf_user_ringbuf_drain() helper")
Assisted-by: LLM
Signed-off-by: Igor Malovitsa <igor.malovitsa@gmail.com>
---
 kernel/bpf/ringbuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/ringbuf.c b/kernel/bpf/ringbuf.c
index 6b86c4db5108..b79cc433d2c6 100644
--- a/kernel/bpf/ringbuf.c
+++ b/kernel/bpf/ringbuf.c
@@ -750,7 +750,7 @@ static int __bpf_user_ringbuf_peek(struct bpf_ringbuf *rb, void **sample, u32 *s
 {
 	int err;
 	u32 hdr_len, sample_len, total_len, flags, *hdr;
-	u64 cons_pos, prod_pos;
+	unsigned long cons_pos, prod_pos;
 
 	/* Synchronizes with smp_store_release() in user-space producer. */
 	prod_pos = smp_load_acquire(&rb->producer_pos);
@@ -759,7 +759,7 @@ static int __bpf_user_ringbuf_peek(struct bpf_ringbuf *rb, void **sample, u32 *s
 
 	/* Synchronizes with smp_store_release() in __bpf_user_ringbuf_sample_release() */
 	cons_pos = smp_load_acquire(&rb->consumer_pos);
-	if (cons_pos >= prod_pos)
+	if ((long)(prod_pos - cons_pos) <= 0)
 		return -ENODATA;
 
 	hdr = (u32 *)((uintptr_t)rb->data + (uintptr_t)(cons_pos & rb->mask));
-- 
2.53.0

