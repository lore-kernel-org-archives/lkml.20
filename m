Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52152511E70
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797762; cv=none; b=MTZ8PR1jZtHeBcRsCViYAoAU998G14c6/VU6ff97wPCNUJ8TlcUzwRNXsVweRTidaOxiJd58ZDtBSTCNSoGSXHPsgQfSJPbv+Cv+kRpVgBS/TlOf+f3rJlqe/7ykUq0HgeoupJq7cgo8W/IO78HC5I6jurbJ+ESuvOi3WTk5GG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797762; c=relaxed/simple;
	bh=JCDusU5yMtFiNa58wXllxAjkEnKbfVExcumys8M0kbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qeINPu0jm+bq6J5HKHkEJQ/FovoQq02C5l+02Rklm6Mv6krBMBONdZFj057IhEVDgYSA8GgKMgZ0tNZGotKWkWMl/bLLb+XjVgGVNLjoq6ggEMVld9yxknND+n2QWLMhb9Y9dwlKRBYVRmNc9tSIFPFSnnvksRZZs+JzcX5Se6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C0Ae7Ftl; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C0Ae7Ftl"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843971bdd0so386455f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788797758; x=1789402558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yRxj5rjaARLzRIcmrNAgb8kIoY2uZyj+0l3SvbMV904=;
        b=C0Ae7Ftll6HczaF9OhbuBIySZtlvos+bU0XY2KcSjspOx03nstTWTXskLh1HFZvIXj
         djOiJHvOmQDS4G/HO/Tq4GzhZNia3qv7h0BJpRswtP1fmt1X4tgDG7rfqlw89j4hYApy
         2gyNsEpI2aR1tLt/AzY8ubJslK+Ozkm6AGC/Qm8CIRkG74NxCnUe1wcGMj17J1GiPOA6
         qdCMUO80Gr35euUB6Gv6pdAvBJDI0VMPE6LCazCZ8AnWVlK9VdsDrAdr9z/suw+pCNaK
         JjJEC9FULmfRCUkKkIkq9rtURUaryu/BiJHhKtP3fSqEPV1my0AYhe6fghGHkxm9F7FH
         QeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788797758; x=1789402558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yRxj5rjaARLzRIcmrNAgb8kIoY2uZyj+0l3SvbMV904=;
        b=sa6c3qGTqdl5cxshEI6BdwUA9lN+XlJwRori5r0Uobq4rfRCocN4FgfDetLx7F+7Sf
         VvOmEgjQqcLe4ObXhtuD9kJD4UoQtpzMp5uLyCie/iIq1ayzBr/J6POBBQDIX1VvpIm6
         HufQXR4v/eFzZ2TXENMruxb7Dvx7ONDHQYdgwj7Bv4JMqgpOIyVlY8rx2wngFqs7Uw8A
         jq9jgdrAAyFHOy+d6UsSmzXAulzrHSQPPNSarIbGFnoB6fmkhJWG4967QqWucyCNGRrc
         tjaG1Xgq7qEgAxddMyb7cDY3mABQDgM1PGP7SwdKz5R7s83JyAdGU/CDwiAdWV7dUT8U
         fCGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmKsWDngsGcghaJxCarmaN1vO8BWZeSv2FQzjBtNwslFwRVMq6QET0EYyeJDGR0VZRr2uw8UWIVotWGJM=@vger.kernel.org
X-Gm-Message-State: AFuF++nWSGuT7F+AFt4IedeXFqhnO1RhlMAtQEuBdffjJZR8ubWIKdbV
	i/V50L8K2VmqDPJGkwCwcDToq+A4qT4e40tuSMueL/ZbAciTZoZWCSiRoBcnGmKEU/A=
X-Gm-Gg: AYBFou1N5+6i1pWdjLIaD4/xGDM0heMnjTeMXEZquLI6Caj5+q5zCUr3ai98E0GP0Li
	rkgtNj/sjTWb/te9+GLcOmXZMdBsKOF+y/P6AJdyfVf3Dn0LHLRLIilVaRSVUmxwuEo17GFLckY
	n3/snHpBjWb+WkuIqQmRtsNJccpo6YQtDOOCJimEgoHinqmL+Li1nd9xDJW10UvAzJBfeC3AA9A
	TCWaddlYvf9c2vHcZcQM8uiJCzWvfqL56bGcDiGxflJZmnqF8SZ1dkCiYWhDkz8O9/wo4UZwa0q
	drpSPvBxbUPu27aS5ewKIAxkwqUo9OFS8Z7um72KHb2Er2YZhSJDu5D/K+U0P3uQc5ngE/vK/5C
	j6GhyZPWnaxb0T1G+yOKudl4/D56CVxl7SdlKlCYmDTy0BYp2Itu0NuD6QhE2qRfxVH0T11+2z3
	DW3BN5UaPFPmv5GdECWPefVp3UTLTZACihhoo1Sd20nniFR327sQWId+AbyZsTmGoMoYXAOuJqK
	VaEn1dhngbpSm4UEk4UEJ6cBTPsqWjQhLxb
X-Received: by 2002:a5d:6f1a:0:b0:485:8508:d510 with SMTP id ffacd0b85a97d-485892cc927mr23060856f8f.6.1788797758410;
        Mon, 07 Sep 2026 09:15:58 -0700 (PDT)
Received: from nicolas.morey.ovh (lfbn-ann-1-199-252.w86-200.abo.wanadoo.fr. [86.200.161.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm24667614f8f.9.2026.09.07.09.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:15:58 -0700 (PDT)
From: Nicolas Morey <nmorey@suse.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Tristan Madani <tristmd@gmail.com>,
	linux-rdma@vger.kernel.org (open list:SOFT-ROCE DRIVER (rxe)),
	linux-kernel@vger.kernel.org (open list)
Cc: Nicolas Morey <nmorey@suse.com>
Subject: [PATCH] RDMA/rxe: Use validated num_sge in local buffer
Date: Mon,  7 Sep 2026 18:15:49 +0200
Message-ID: <20260907161550.716670-1-nmorey@suse.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For both SRQ and non-SRQ receive paths, the WQE is copied into a local
buffer to provide a kernel-owned, validated copy. While calculating the
memcpy size from the validated num_sge prevents overflow during the
copy, memcpy() itself still copies num_sge from shared memory.

A concurrent userspace modification before or during memcpy() leaves
an unvalidated num_sge in the local buffer, leading to potential
out-of-bounds reads in rxe_resp_check_length() and copy_data().

Explicitly assign the validated num_sge to the local buffer after the
copy to prevent this race.

Fixes: 22b8fbded65b ("RDMA/rxe: Fix TOCTOU heap overflow in get_srq_wqe")
Fixes: d6ab440240a0 ("RDMA/rxe: Copy WQE to local buffer in non-SRQ receive path")
Signed-off-by: Nicolas Morey <nmorey@suse.com>
---
 drivers/infiniband/sw/rxe/rxe_resp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/infiniband/sw/rxe/rxe_resp.c b/drivers/infiniband/sw/rxe/rxe_resp.c
index 02b16e2b49b8..cd51042857d6 100644
--- a/drivers/infiniband/sw/rxe/rxe_resp.c
+++ b/drivers/infiniband/sw/rxe/rxe_resp.c
@@ -288,6 +288,7 @@ static enum resp_states get_srq_wqe(struct rxe_qp *qp)
 	}
 	size = sizeof(*wqe) + num_sge * sizeof(struct rxe_sge);
 	memcpy(&qp->resp.srq_wqe, wqe, size);
+	qp->resp.srq_wqe.wqe.dma.num_sge = num_sge;
 
 	qp->resp.wqe = &qp->resp.srq_wqe.wqe;
 	queue_advance_consumer(q, QUEUE_TYPE_FROM_CLIENT);
@@ -328,6 +329,7 @@ static enum resp_states rxe_get_recv_wqe(struct rxe_qp *qp)
 	}
 	size = sizeof(*wqe) + num_sge * sizeof(struct rxe_sge);
 	memcpy(&qp->resp.srq_wqe, wqe, size);
+	qp->resp.srq_wqe.wqe.dma.num_sge = num_sge;
 
 	qp->resp.wqe = &qp->resp.srq_wqe.wqe;
 	return RESPST_CHK_LENGTH;
-- 
2.54.0

