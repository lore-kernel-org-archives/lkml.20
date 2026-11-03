Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694770;
	b=tvzXRl0SqHT/CR5uzG6nBInc9i+BmJpTjrg45YcbgnJSAVtWd4MG2ZctNWije/EKT33E
	 RvmklAk6Qt42xwkOHUSZq/RRCybO7Unnod2aXFbYKiZcFGCE3/7iZn0pH+0SXDMqHH/dh
	 Ke+z4+350xeIuxH2kzyDtvYgD+jpLWg+1KP4o527zwSS4VXe2AODUIma0hycMdM4oVQrq
	 c/5FU8neWTE5lSyKd/DkUYhlBgVuuiyeBXWwD+3mGwnTnXssSrJ7j9D1P6nnqiBOAPDLE
	 8EsevOch+1GBxB8hHEZGZmyZ0UWSFpyX1SyDzgIrSpGKVJtxCTddBdEYQogQwEVsBOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l4U/3KUqu/qVdhfefKvegkeTdRkvD6adQTd3BjiKpMs=;
	b=k82jBnetd+0/23Wouj3xse07IqB9B5ygdV886d2b3KLaHhU/RB6NnzAqcLlFK7Y0J4y5
	 m6sdblS0jyNgunQgGccZLVw051heOH7apDy9qliP6PeA+jvXyxjBpmKuxidOKIaC5Q9Gv
	 35X7F7UPi4mu4gSxTBv7R4d50Uzna959KjO3gJCdWmpzSRj07NLcyoFrVRCQA9KvUpTd0
	 +dnxvOZD7bmt8Wew9Mj3ZpQhghoE4Hd+WCD30G0cLxmVStPytGxiJNxOFzfQ5JXW5JiMa
	 XMdOm1Jq0XpG8THKDZMLuRpYA9GtE5pRyTi0HaSHg/dy0Kx/A/WibQ+geuajQXsLkFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVmQn6k2;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFF0606EEB2
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAFF0606EEB2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVmQn6k2
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2eb18f4da15so13474495ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793694769; x=1794299569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4U/3KUqu/qVdhfefKvegkeTdRkvD6adQTd3BjiKpMs=;
        b=RVmQn6k2Be56GRnv3kgo6y8yO4XYArI54aRhbRp3FlxGLJ//+tmPQREsSGk1U4FV0n
         2IWXAo5HckUek9BxECowcEiDZQ7kY/tx62aWhsCXzyQ36Xh1kx8YumvbK8bCoxF9MxMW
         gGC0YiQullx9OttnZ6QCXMC9NFPdMzh7TRcy9jMVviYLp8bAeKviPBCf2DknqDUJeImk
         7AbvUpE7aLfIJg9hvR4Xay9OXOP+xzu8Q9E6/DK+K2QrEHUXgSRbEDlxz1PLrWxZ63jh
         9jNfZMQAUJ3dCmC1Rsuk2+7kPCtFNsSJIP2nNO3kvZCJfYBsTMYS5+aoAudnzoMfQJD7
         JD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694769; x=1794299569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4U/3KUqu/qVdhfefKvegkeTdRkvD6adQTd3BjiKpMs=;
        b=nnjChyNzMIlfpSe0OvE/q6AO0kObKc1MzOUEZdaRwaFVQY/2UuzH6ulnooXyuIK+TI
         OTBByUphabfSCptN/hyn8A+vC68AlA5IFuG+F8XPn4MvD/sLvsiG/BOUpw8ZV4D1nwNa
         9+EBD9bDvW4cBiyysiU9XA7tt9akLdMzK2ZhK9c9fp0BAARSO9lBtETyQk+OLBQnAWN1
         0Ab6esmymdOBd9cCE2WiUUFYlLwmkJjqFSS6FAuscg3+GL3l1H9omwukWEh2ZVqiRE/x
         l8L5enJ2nLWG+40nMd5MomGSLNhnVAo2eH7Dd62fL/XcdEclu4cmzxiaFtSLDrzmquWJ
         3srw==
X-Forwarded-Encrypted: i=1; AKwUvBzBI8mzwbC4lYEJw8OkhGOMvk8up+bEPVnFOyAu+E4qbQYXEzK60c0JcylERq7sVG3JF/N1TbAktZxs88Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z90aVoCYydhoMi1/wEq/WYpVzeU65me/i6k9We1Lg696ptJXkfK
	aT5qZQC/8UKnpiNNpr115FWuomWWb4j1EI4LAJfh/rkBtKc5XSuKa3ZcRAtSH/Bn
X-Gm-Gg: AYBFou0aoHm08E4bHtyeIQZQ8BklAfmcTSS6SpYzMeD1WdWsVb24ajTGtqdMcP5ZNf6
	tXfQN8kiPZgvm/rfrVR2LGw95YgBi6VoY0TpVYHCueO164prkVJ/ixt0xh4SYvOK479CuDKKM6x
	NgfL4cGyMoqZKgRdXrO49cXSBEGTyVbVpY29pd3CkaJOOW35lIscuu9EmmsurmNppW/381WZorY
	m9s8hKBHpRGFptaZT33SsuRVoyN3reGDnKzZWW3NI8FC40O33+ZfwI9iGKkFgdeuL21NANpLZN7
	4PRPhzsjnhGgv55x24W6c6UU1AGBRbfNboOYXdkd5cipSfSB6BHJfjv6eB/K0Oi1fKM01WFy6KF
	R/CcKcTaCLlvNMtIDrzjS+FLbNVcwzBFtmF/Efy1EB/F0U93P7Aosg6wezS0p4q94c3sZtPQAsY
	NpuU3iZfzL66O2UDv9n696ZpAMDg7oXls8kgWo4+qDVZDL1yrEHoQn5tlQj3BA7XDB1B3OAEDCi
	5htMEb2de4XKXHtBxirHJTxM5egkfazFcBlDmAln2q2hI6UvoJ81BqEuBsB9mrcTEoptFJBs+ft
	hTc1Wy6K2uDkQ1wEfMzHChF1gALUQ/X3+M/NdIJa0JeADVJp
X-Received: by 2002:a17:903:46ce:b0:2e9:723a:cf37 with SMTP id d9443c01a7336-2eb364e0725mr114991555ad.50.1793694769016;
        Tue, 03 Nov 2026 00:32:49 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392a5f48sm37036785ad.64.2026.11.03.00.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:32:48 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] dmaengine: xilinx: Fix wild pointer dereference on empty segment list
Date: Tue,  3 Nov 2026 16:32:39 +0800
Message-Id: <20261103083239.2033556-1-lixicaicai@gmail.com>
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

From: Wang Haoran <haoranwangsec@gmail.com>

list_first_entry() does not return NULL on an empty list; it returns the
result of container_of() on the list head, i.e. a wild pointer. In the
Xilinx DMA driver, the prep functions xilinx_dma_prep_peripheral_dma_vec(),
xilinx_dma_prep_slave_sg() and xilinx_mcdma_prep_slave_sg() can build zero
segments while still returning a descriptor, and both they and
xilinx_dma_get_metadata_ptr() then take list_first_entry() of the empty
segment list, yielding a wild pointer that is dereferenced for
desc->async_tx.phys or the metadata app words.

Guard the three prep functions against an empty segment list by going
through the existing error path (which frees the descriptor and returns
NULL), and make xilinx_dma_get_metadata_ptr() return ERR_PTR(-ENODATA)
in that case without touching the length outputs, matching the ERR_PTR()
convention that dmaengine_desc_get_metadata_ptr() and its callers (e.g.
axienet) check with IS_ERR().

This issue was found by static analysis.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261023065806.3175584-1-lixicaicai@gmail.com
v2: xilinx_dma_get_metadata_ptr() now returns ERR_PTR(-ENODATA) instead
of NULL and no longer modifies *max_len/*payload_len on failure, per
Frank Li's review; the prep function guards are unchanged.

 drivers/dma/xilinx/xilinx_dma.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index cffe7c6fa..8b9e3a13e 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -649,9 +649,12 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	struct xilinx_dma_tx_descriptor *desc = to_dma_tx_descriptor(tx);
 	struct xilinx_axidma_tx_segment *seg;
 
+	seg = list_first_entry_or_null(&desc->segments,
+				       struct xilinx_axidma_tx_segment, node);
+	if (!seg)
+		return ERR_PTR(-ENODATA);
+
 	*max_len = *payload_len = sizeof(u32) * XILINX_DMA_NUM_APP_WORDS;
-	seg = list_first_entry(&desc->segments,
-			       struct xilinx_axidma_tx_segment, node);
 	return seg->hw.app;
 }
 
@@ -2305,6 +2308,9 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_peripheral_dma_vec(
 		}
 	}
 
+	if (list_empty(&desc->segments))
+		goto error;
+
 	head = list_first_entry(&desc->segments, struct xilinx_axidma_tx_segment, node);
 	desc->async_tx.phys = head->phys;
 
@@ -2406,6 +2412,9 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_slave_sg(
 		}
 	}
 
+	if (list_empty(&desc->segments))
+		goto error;
+
 	segment = list_first_entry(&desc->segments,
 				   struct xilinx_axidma_tx_segment, node);
 	desc->async_tx.phys = segment->phys;
@@ -2613,6 +2622,9 @@ xilinx_mcdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 		}
 	}
 
+	if (list_empty(&desc->segments))
+		goto error;
+
 	segment = list_first_entry(&desc->segments,
 				   struct xilinx_aximcdma_tx_segment, node);
 	desc->async_tx.phys = segment->phys;
-- 
2.30.2
