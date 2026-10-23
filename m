Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738718;
	b=ktm1BT5UH5g1J3MAbXeLXZ4DBg7jMSXMj61VIAoIk/ifCoZbJK8FlYgoFW2RHPr4+/7N
	 iwyptiNBxFB3H03yS+Lr5g/R6CJs9GASq1TldKxLO8jyMLIwgmx7OsKXqrpVmdAi9UCSR
	 aXvuItQCzHR5BIbsaIagV9/PtEnn/S/6+hLiaBfV1lSuh/bcuiqCmOf44EZa2JV2Ty2mv
	 I8IKsTq+B57lk6NqGm2H3dmkE7q+IgtbNjcO0Tp8nXmYBxRPtijz8EcxiI7/wYlHeFYQQ
	 imZsCb6rZ54Jmr6OfyR6n+aOL0xdQZCHg1O9rGoX7jmHwNxZwA0M7+ZAl8TL0WkTh7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1DJT0TfcFF6fHDkLmQ9YCOKDQzpNymd53lcGEn9Xipk=;
	b=1gc4zx5YNNSGVkA12cO/bjRjOdiXlM97JKFl41QJDCzSnjee3mq0kk3N7BHsIGbz/1LK
	 d6G1StYZAoLT/jBQuKYSz0cR0Ftg4uh0q3kemCNaSa5adBLTTEolTUOnhFnuubWWOzVhL
	 3szV8tBJtp6ra0bt09qWE9ZOcKYrozUk1VMsN2ES72Cv6TVA18iW4h0enu4yHlgoTKguW
	 pMDrBkUIFXqmwFg0M2xBNHF1TYkUIO1uToTK5av3Dt37iO9+0/Z+nEpMj01iK0m8cD741
	 6liYiGC+ADZxPeT7pQpuO0on//P1+o8SSwD/jOaFYkNqPkxVgwq5u891X3coAmsXeqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z78voDaW;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB08606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FB08606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z78voDaW
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so216477a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738717; x=1793343517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DJT0TfcFF6fHDkLmQ9YCOKDQzpNymd53lcGEn9Xipk=;
        b=Z78voDaWjNne4NIQePfNFiO9re/79gRrqzJNO1dxnnVb5A1g3jYF0f7wpIBEu4lBna
         zOrnABxhHnktCgZwCiOWPoKcklMPMFkZfdFBPEnYXm4sugeXqsHmMzhXBLfKkDlBYZ6Y
         s1c0Eh84hK2lACTp8ZKNYcU5AADP2q9XiouMDsrrt2i4PzsH4IcNdhLDdHeRmAj+1YLa
         gmyJ1wm6sMIs4lLv6Lol64RibcXy77pnPu9Kyu8eJxstdKFY/DB8f7FTM4OG0vNe1Ypa
         8MzOvqQkUswkl7Xt0qhX7iSnF7ggcxDsvw4b5/AE8+NfclOjKSLwc9Dug7jcsg2kn1zl
         /skw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738717; x=1793343517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DJT0TfcFF6fHDkLmQ9YCOKDQzpNymd53lcGEn9Xipk=;
        b=2sdbP2ZV/gJ+KOrIL5IK13KfTMjHwAgCN/rbQDU3KXFtAaTfL6vDX7R7zpot78sqGG
         Z+FhF5n17bfMVP8qpRtgZ79Ay8OJpD1PKP7Tp6MIZLUitJ587VduwJe0GTKtu6X8XVzq
         LEUuuhfCPAs+5YXmN95IyWYfBZUhzV9+peZcmPrSFbwomxvqRXSga5CUYC93mNuXCwf2
         ZazSI9KmopwPqW/RLE4eQG5nGmVvVCB9dx/BXXKfRY/GKtR/DtS+0753l/PS5ZeoF9ot
         lr5fit7A0GKcmH+CMDTq/rasNK4PL9AG2q+glIRk3vYkdiCbiJRp45iZ0egBNKIzXtqI
         plEA==
X-Forwarded-Encrypted: i=1; AKwUvBxRKVp2CEDWOyqPzicnRKQxYMFL2nlCVjPF4+AGnGqgE97qVIOPvzaXAummMSNWpL/xlIgcFEInFVF+ntg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrOCce+R171JieBBkcGoiJ8MsDkwN73ioYe432zYrZ6TsSYQJK
	6ZXxDjT3b4Wf0VJQm9N4PPW5PsLyfJO26PMOL4xYUsSylssdfSeLA8hJ
X-Gm-Gg: AYBFou3kg27a3gxxEx4VQtRWeEjrIVucoQ+7ORr9lJkJ+pF5V2trM/q0Jt7WhN4ljvo
	ueDXCCe3M/83lI2cGVBv8E/nRNaEriqSb+AQXygjk3zsdCBLMWdKU1lDG4rUs8xWFFjQcv5tzVm
	qEdjbLiy+wlyZ/czygD9nFbGLZmqlk5u02HTEy96jhJmPPAHTjDnEtJ9SInxW9tdTkrOpIxZpRl
	aeeaf2w1nmjtgGFLRPBUi0sTM6XGCKgxptqGlm/3va4Y4O7mE39VKSqVW5A73ARCqHHYlPs3J1G
	EEpBxAZSJlEwGRdd/cz8fGOqfkcCiGxun5W5HidQOci95A4BzgI9FlMUE976amfCIoo73Fwm1Q5
	vBej31nzIZYOwW2I0zRyPEP2Uew85vaSnHIc4S+5d1uImriQam4gMY5CQfo344VBK9cbZNZ1KID
	a5bOTYMnO/9uvxyRZqlSytaNJLWitgyIuWLPv1PKNsHUvi4qQN57up1WB03M5qA9VkmbF1HIayS
	N2rs8VGlxR/Gfb372qK/E4hjww2DDM2dZ8LeqOZ1ZTcz7jmFr22urDUoIocUDCXF+xHIOKOe+c=
X-Received: by 2002:a05:6a21:3d8c:b0:3e2:38b8:ef40 with SMTP id adf61e73a8af0-3e3766f0158mr839251637.62.1792738716652;
        Thu, 22 Oct 2026 23:58:36 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c89d6386sm381522b3a.10.2026.10.22.23.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:58:36 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] dmaengine: xilinx: Fix wild pointer dereference on empty segment list
Date: Fri, 23 Oct 2026 14:58:06 +0800
Message-Id: <20261023065806.3175584-1-lixicaicai@gmail.com>
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

list_first_entry() does not return NULL when the list is empty; it
returns the result of container_of() on the list head, i.e. a wild
pointer that points into the enclosing xilinx_dma_tx_descriptor rather
than to a valid segment. Dereferencing it reads or writes unrelated
descriptor memory. This was found by code audit.

In xilinx_dma_prep_peripheral_dma_vec(), xilinx_dma_prep_slave_sg()
and xilinx_mcdma_prep_slave_sg(), the loop that populates
desc->segments never executes when the transfer length is zero
(nb == 0, sg_len == 0, or all vecs[i].len / sg_dma_len() entries are
zero). The dmaengine inline wrappers do not reject such zero-length
transfers, so they reach the driver unchanged. The unconditional
list_first_entry() then yields a wild pointer: the following
head->phys / segment->phys reads are out-of-bounds reads within the
descriptor slab, and on the DMA_MEM_TO_DEV path the hw.control
read-modify-write corrupts the descriptor. In
xilinx_dma_prep_peripheral_dma_vec() the empty case additionally
dereferences the never-initialized 'segment' pointer. Similarly, in
xilinx_dma_get_metadata_ptr(), a descriptor with an empty segment
list produces a wild 'seg' whose hw.app pointer is handed back to the
DMA client.

Guard each list_first_entry() call: in the three prep functions, bail
out through the existing error path (freeing the descriptor and
returning NULL, consistent with the current failure handling) when
desc->segments is still empty after the build loop; in
xilinx_dma_get_metadata_ptr(), use list_first_entry_or_null() and
return NULL when there is no segment.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index cffe7c6fa..07f52f841 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -650,8 +650,11 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	struct xilinx_axidma_tx_segment *seg;
 
 	*max_len = *payload_len = sizeof(u32) * XILINX_DMA_NUM_APP_WORDS;
-	seg = list_first_entry(&desc->segments,
-			       struct xilinx_axidma_tx_segment, node);
+	seg = list_first_entry_or_null(&desc->segments,
+				       struct xilinx_axidma_tx_segment, node);
+	if (!seg)
+		return NULL;
+
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

