Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794349470;
	b=U1lnXAClsgk03adyFDuzIB32LsmSp00k/tlWne0wBG8rK1bl98cXpuvjiQpBoolu8Sas
	 7aQvbWWeGvSES3aL4q3QOLF2ffhRjlvPII9kgbPKJQX+E1I3EvJkc5grkLujw1qVsE8IX
	 DaW/AEpS++FZYQFMYzXVy6kwhitL2p114XqV/fnI6r0yT7lFAYDeq3Ks6X9L3FDawo9vQ
	 vqLestLF7Ru46BErlVGjMO1eXke1rFcwWOHQbYw0d607Y0XcUZ9mNGvb16rszAAd1okOI
	 NU9IPk9fYZiC6lSd46+/VRwtuBx+pdOgy+nesF5nMI2hnnUL1YJ2BKPytRrBw97DlfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EBeS7Y1h+n1TS1fYH/iVVovPRJYz5qCi7WG3/RLe+mQ=;
	b=zEryo6wn6HnDRTIRm3qyT9cq8GwDHEBYwgcWl+lP6nxQWjqCB+lQp+2zS2gOVbwujmwj
	 JBZrW8jcTQcxkbBI2n8NcMhwpg7ZSmNu4eXPud4U3yrgc6lp1NfRhGY+Zni7dJfbjBkNl
	 HxLF8/sM7gvOf1IjVHWjMJe+dEMkPaqLZ/8QoADlicrDxZjBXjUziuxc6c+MbsBGSzGff
	 r/mI/LKOpqAel5ZrmCO7Eqrv5vouk6gJM4CNmDBzCRQIt1nA0YQCdm4OpguBMkAdldohg
	 puHz4P/TqAQ9drYtD3k6N9lR6rSUMRmjq3JZvqBXAfD3Lt8yZaZ41egT8MdTCDLZMnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wWD3spZB;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829A8606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 829A8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wWD3spZB
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37000e7234bso4904001eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794349470; x=1794954270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EBeS7Y1h+n1TS1fYH/iVVovPRJYz5qCi7WG3/RLe+mQ=;
        b=wWD3spZBqdkBsKXg2//dXCaL1KoOC0mC5l/ga4Ed/fPmhyA1O/0XxD2M6dr8Z8ahL1
         BQc8ybMtzpR3HK9WJ8H7E8/HMXDCJgPiPay+Hkzlrbcw8eKl0ieGfEdAsc1dulWSlklC
         3tgUP5TufP/1AYB+ikYSgt35uS25CbbWMY/oelHdOtWYEqRJc7ieXneLJD9fcw+sBtcU
         6eZQex9eIRW1Vjoo6MxHuu877kzGAxN6GsvLvB9/k7ZGyqKutYYaSLzTMHTxqdM0rfQ+
         JD9BRqrwALOHzvmWooTHUdSeF9bhHtrGtFyEudzq3n1U0ticE3DzkQd0BcLy38IhaE9f
         6KKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794349470; x=1794954270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBeS7Y1h+n1TS1fYH/iVVovPRJYz5qCi7WG3/RLe+mQ=;
        b=Mg19I+qyY7/bHn8xRFPc59abU+DM++tkqVEAOpxeaSXksMuK3SGJGuYuYmhE1EgSFw
         U2CKyIqlGpP/gVWO7Y0z9+Wnb//v+qzi4/L7YjsU34FbylT4fzIYE5HeDrdmW5JptDBH
         0NaeuD7RSD09NAnlzj4gpN5ZrLbmMdF9sMfizwWPjRC5QUdnX7kJ91+xpdr2wevUFd/M
         tIHmBUvqzEgX+BX3gMvF5S3bzJx2bqd/Nni4AEsH/P+NmCzPQsa+NH2YhacGJsOVp6zr
         gQZ8Mf9fZKgJQmxAxCngkZRDV2fJIRBzgBDC2ZnSTZm8z1uD8HErzjtgVCorcgrGG6DN
         jgzw==
X-Forwarded-Encrypted: i=1; AL+hErFjjWncjJkSI6J1s6E9xymQo+4N2iAokNHnWsZ7fMLid6GAQ/tAUWKnDa9i6u+8Rk/rn58RG3OkUI8bub0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rXvPG/7Mhg+hlWCWHpwwgfXi5wgyDgT/QUEyS3FjproiuX7FT
	SXGRodx+G6nDDeR78AFaeg1GR8KpfI73gTwKoIJdbXcWzriVBWaeZ1bU
X-Gm-Gg: AYBFou3XvJoDmHDD9rl1B16JMVarv5PguJGwJ1UanMgBcpNUvytQshQX9euSWat2jBP
	KXTQM3kexopiD33DpuEu/gj8F9nZHNhIqKlitj0c70mVD8mjlGqrbr4ryyjVOJCh6G0l1G6A9FV
	tFE6LVlqv7kUyRyqj5A2paRD/9zWInXbr6mrKUCkCCbGiYmJgkNrAlHirdS3HMKOkjDuSoaS3eS
	4sQBPRl/llQa1fKJEc+sEyCDlmXmnc8jCtAH5TWSPumGDzm09WMG7moX1Tl4SgqxI4LK4+jiLlp
	8jlMaPYFZhlpzu8Wo33OMQFoAYLJPK8WjDGhpXa3x5ttNsC9OImFJ0G9rB3PCkgshLdU/Yr9vRw
	TwUDknRpkIZ2QBgGptA+Zt8aqukSJOLz3h/4wU66Tv3K9vcCEBnwma0EvbGY0g7AFRF9OSvbhfL
	5mxLIt4eVJ3P+uO+6of7j/R6zzcg2OxrP/OE1eYbD8i4KqcAeL4y4zA2TtbqcyTdos6nkAJtrxY
	mCLvdphOJe4pH0wKziwtIFGsVboMmulFomTWbT3eH20FlGvGz9AuXXpPzExjNsyGJwBwqziaiBO
	bT1m3Bnz3sMMnnFrxJRIK/avjKazTKmAP4oV/ocaWFXpGyFpyBG8DWDPsCSS
X-Received: by 2002:a05:7022:ef16:b0:1b2:4188:840b with SMTP id a92af1059eb24-1b3c0311ab7mr489976c88.25.1794349469455;
        Tue, 10 Nov 2026 14:24:29 -0800 (PST)
Received: from localhost.localdomain (wood.seclab.cs.ucsb.edu. [128.111.49.37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm11566320c88.7.2026.11.10.14.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:24:29 -0800 (PST)
From: Praneeth Balasubramanian <praneethb2002@gmail.com>
X-Google-Original-From: Praneeth Balasubramanian <praneeth@ucsb.edu>
To: Bart Van Assche <bvanassche@acm.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Praneeth Balasubramanian <praneeth@ucsb.edu>
Subject: [PATCH] RDMA/srp: Reserve send queue and CQ space for ib_drain_qp()
Date: Tue, 10 Nov 2026 14:24:21 -0800
Message-Id: <20261110222421.205573-1-praneeth@ucsb.edu>
X-Mailer: git-send-email 2.25.1
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

srp_destroy_qp() calls ib_drain_qp(), which also drains the send queue.
ib_drain_sq() requires the caller to "ensure there is room in the CQ and
SQ for the drain work request and completion".

SRP reserves that room on the receive side, where the queue and CQ have
queue_size + 1 entries. Commit 9294000d6d89 ("IB/srp: Drain the send
queue before destroying a QP") switched from ib_drain_rq() to
ib_drain_qp() but did not grow the send side. The send queue and send
CQ hold exactly m * queue_size entries, which is the most work requests
SRP can have outstanding. If the channel is torn down while the send
queue is full, for example during error handling after a target stops
responding, posting the drain work request can fail with "failed to
drain send queue", or its completion can find the CQ full. The QP is
then destroyed without the guarantee that ib_drain_qp() is meant to
provide.

Add one entry to the send queue and the send CQ, as nvme-rdma and iser
already do.

The missing reservation was found with an LLM-based tool that checks
callers against the rules stated in kernel comments.

Fixes: 9294000d6d89 ("IB/srp: Drain the send queue before destroying a QP")
Signed-off-by: Praneeth Balasubramanian <praneeth@ucsb.edu>
---

Notes:
    This was found by an LLM-based static analysis (GPT-5.6) that checks
    kernel code against the rules stated in its comments, as part of research
    at UCSB SecLab. The patch and changelog were drafted with Claude Opus 5.5.
    I reviewed the patch and take responsibility for it.
    
    Testing: builds without new warnings with W=1 (x86_64). Not
    runtime-tested. I do not have an SRP target setup, and I have not
    observed the drain failure myself. The change only follows the
    ib_drain_sq() contract and matches the receive side and nvme-rdma.
    
    The patch applies to mainline 9ba46df34488 and to next-20261109.

 drivers/infiniband/ulp/srp/ib_srp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/ulp/srp/ib_srp.c b/drivers/infiniband/ulp/srp/ib_srp.c
index 955f36efeebd..2cd0b728424e 100644
--- a/drivers/infiniband/ulp/srp/ib_srp.c
+++ b/drivers/infiniband/ulp/srp/ib_srp.c
@@ -546,7 +546,8 @@ static int srp_create_ch_ib(struct srp_rdma_ch *ch)
 		goto err;
 	}
 
-	send_cq = ib_alloc_cq(dev->dev, ch, m * target->queue_size,
+	/* m * queue_size + 1 for ib_drain_sq() */
+	send_cq = ib_alloc_cq(dev->dev, ch, m * target->queue_size + 1,
 				ch->comp_vector, IB_POLL_DIRECT);
 	if (IS_ERR(send_cq)) {
 		ret = PTR_ERR(send_cq);
@@ -554,7 +555,7 @@ static int srp_create_ch_ib(struct srp_rdma_ch *ch)
 	}
 
 	init_attr->event_handler       = srp_qp_event;
-	init_attr->cap.max_send_wr     = m * target->queue_size;
+	init_attr->cap.max_send_wr     = m * target->queue_size + 1;
 	init_attr->cap.max_recv_wr     = target->queue_size + 1;
 	init_attr->cap.max_recv_sge    = 1;
 	init_attr->cap.max_send_sge    = min(attr->max_send_sge, SRP_MAX_SGE);
-- 
2.25.1

