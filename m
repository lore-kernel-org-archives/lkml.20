Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896325;
	b=DY3oMQ27NmTdIamT1nKrprN8AN9BPvGi+D4D8iz25wPQJEyE2Dy/phANdDGLwkuu1ez2
	 AUPkH93QL1T/jH7I+ey6JxzAeyv/p/PdYN08HsLMqNvNUBErIu6fbyypH3NUlrJn+v8bL
	 X9TPsnRkAfhPITmZ7VOBG0Wftj3681VIpYNpiqr4CKdEFXDqfzGzVx9KJiFQw5g/kDZFo
	 S4d8ND5N6qlY8Tp9yL46X8yQAOExqnfROot1MrKxeq0B/jUbH6V6KL5gF5vks4MOutFN4
	 BzDsgIwdwBKbXl7dTWyUdQk4Y0BJ1f5kprK5Zjq6SW2v1kDV0rtLsEv/7W3SRM/KpeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896325;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ZvSvLnicjKBpFuI464ZexGGWbzTJ/XXBoXu7p2ye4nY=;
	b=RHmaIERIVI0oxRqe6CCCkiNO7owgVkoF4FM2MOhic59rB4eQchfE/+Wq/WfwH1chNZaS
	 Pzw1NxVEiV248NDNmakfOUSH7TshcWNsggAE77ZjXD2wTrXQj+r6O9VrY3THHnPJqcS10
	 iWl0JJqJpCmpssafuMPbuOPw+zlB6ZFTA2BMxtADHCUp7KNTRw3U+FkE/cCt0phtLqGJ+
	 37xAKxIsMBAZhyZDoRrUTP5JpE+sDzXI8/G/HoZ1kX48nFtcjNeacILcHT7KC1y6+AgL8
	 79b+hweG9Mz2cvdSJzcaIs8SaIc1wjRJVyToSVx40sl1hfr5FvtHGowl2u3Z1LMP8PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UIDTyAHI;
	arc=none smtp.remote-ip=209.85.217.100
Received: from mail-vs1-f100.google.com (mail-vs1-f100.google.com [209.85.217.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D70F606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D70F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UIDTyAHI
Received: by mail-vs1-f100.google.com with SMTP id ada2fe7eead31-7d2bf046d7fso3489462137.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:18:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896323; x=1795501123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZvSvLnicjKBpFuI464ZexGGWbzTJ/XXBoXu7p2ye4nY=;
        b=LsPu0/uv4X/KVE898XTWmDGkZtVDmNcKKAimR2lsA/3BlWSo9JnyxD+Rz4DLKg/MID
         hzV2lawsXMW2crsQRQlnnO0Mrj7kc0Z6+oi4UvgqXAcwjMwL1VOiM61jfUAZaoA3wb2G
         DjWJXWcSE5H4l4y+tHI4ORz2cdvlVR5p8qYOFt50dCRIfSzk5JJK9ukfMHJ9pvG/O0Jm
         e5Q2PKSyGjCJV/baOKTrk05wJLLiZQZBAXJ+W64xeIpDAZN76COFmQvRcoHefI58zR8v
         IXAKQ9y4N7yM0PkIqJJoxpeUIaFZn6oXf22F+2Ohj+V5BCOCOBpEpOaHmbmBFsoJZ+SH
         2uKw==
X-Forwarded-Encrypted: i=1; AL+hErGRSqSk18o25gtJOzH+zh6ZElfzogJK+c8pf4UTdy33F3i5Qnoez26ytQgbA6l/dcHqciGTxIT6gxC8fvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LehBEiUMOu3Ln0k2dTIufVKc62aWmKjpfsVdiGbRVk8td4rZD
	jTDiUdxzEYXINQVYJzRjUhRhSdH0xVnWV1IaBXcbGT0GqhpG++42OS8gdJebzqw1+Te9vDrWlvh
	FUAmG7kctGhxVr9kfc+mXPG2hUqxQOrEyo6UUaC72MLoTdpKuFxatWM6Tx/WIZyBr2DtuAs+9LN
	c7wvMrCI8uKiK/POLLBYxRPG2aEJ5UvLOprC2Ev/gboT+csiltk0mpjf1ipkfLzUwQ1wZv+CSNC
	cYpmaDfiN7VLoyphdlEqHNgPTYK
X-Gm-Gg: AYBFou2dG340YiPtLYxWgJMCqMNElaRt2uAFyotndk8QztLuSAHpq1CuRDFuyyfozgW
	09zFTIRjlSQE6lOm5ZwDeAEvZWmlvRnXK2NscABcIyOwdG0DmcmvX+hJwlf8TQDE4MECZro6Hmo
	x6I9TPUPLHn6ZY3gYAVhDsxXWinpA5p+Mcj34BHga8cefJcW7X1rCD60sOZXnAvelJukXq/aSJg
	lqFkocnZqXLoqXt/3dSEvD8MRm2lQZbLE+HZ8ZFuFdvw7PjswxFx/VvtifuLJzRfTCbr+M1HUBP
	BDXa7yyb5eFft27i0KmK+F++RCaupxsIn3hAODLr/yeZYbcUDd/kXaCRqgyQP61i/xkr3hB1YaD
	VaRSB/Fgu4ZKTIShg3mhoIatlh8XmZSGwbQOr9KZLfrClXWQ8IZjLF+IOC/DcjrJ9wIQUYreTHv
	qu/SPvaOT79nGSNio953bWcDWHDc4rsooSPzeO9fH2Y0jP
X-Received: by 2002:a67:e111:0:b0:7d2:da60:d0f7 with SMTP id ada2fe7eead31-7d64d7d3570mr4132229137.28.1794896323467;
        Mon, 16 Nov 2026 22:18:43 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e338490a1sm245871241.10.2026.11.16.22.18.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 22:18:43 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed02a00b24so38383255ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794896322; x=1795501122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZvSvLnicjKBpFuI464ZexGGWbzTJ/XXBoXu7p2ye4nY=;
        b=UIDTyAHIBvkUU13CQsg66C05rJTd2YYm6xckgwb8JisbktUq2WbgvA0zs1Ih8JKyCL
         9a3kP59DsbWWcGpFWqc3U0T+/oUble1vr8WCyP0w1maBYMQjcD+6PRrDvf4lXmSxnQkk
         e2FS3z0RFc3nx9tDYGhmjdtjSFNSujQGOw+eg=
X-Forwarded-Encrypted: i=1; AL+hErHLYDRezY2jdoWV0zBxVLlmbdfskzvPCHqEIXP5Z+kJHN5caZrhievKN4pBGZLg0ExjZozStzFukAXUBF8=@vger.kernel.org
X-Received: by 2002:a17:903:988:b0:2ed:12a1:c4a9 with SMTP id d9443c01a7336-2ee0da968bemr123076435ad.11.1794896321830;
        Mon, 16 Nov 2026 22:18:41 -0800 (PST)
X-Received: by 2002:a17:903:988:b0:2ed:12a1:c4a9 with SMTP id d9443c01a7336-2ee0da968bemr123076235ad.11.1794896321400;
        Mon, 16 Nov 2026 22:18:41 -0800 (PST)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8668sm8669335ad.6.2026.11.16.22.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:18:40 -0800 (PST)
From: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	Bhargava Marreddy <bhargava.marreddy@broadcom.com>,
	Dharmender Garg <dharmender.garg@broadcom.com>,
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>,
	Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>,
	Rahul Gupta <rahul-rg.gupta@broadcom.com>
Subject: [PATCH net-next v5 4/5] bnge: make irq_tbl layout depend on BNGE_FIRST_OPEN_NQ
Date: Tue, 17 Nov 2026 06:16:40 +0000
Message-ID: <20261117061641.122942-5-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117061641.122942-1-bhargava.marreddy@broadcom.com>
References: <20261117061641.122942-1-bhargava.marreddy@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

NQ0 will be created at probe, before the aux (RoCE) device has been
given its MSI-X vectors, and must keep its vector for the lifetime of
the driver. So the probe NQs must come first in irq_tbl, followed by the
aux vectors and then the open NQs, instead of putting all NQs after the
aux vectors.

Describe the irq_tbl layout once, next to BNGE_FIRST_OPEN_NQ, and add
bnge_nq_irq_idx() and bnge_aux_irq_idx() to compute the irq_tbl index of
an NQ and of an aux vector from it. bnge_fill_msix_vecs() uses the
latter to hand the aux device the vectors that follow the probe NQs.

The ring_idx passed to the aux device changes meaning accordingly: it is
the irq_tbl index of the vector, not an index within the aux range. This
matches how NQ rings are created, where the ring index is used as the
logical ID that ties the ring to its doorbell and MSI-X vector. The aux
driver uses the values it is given, so it needs no change. The total
number of vectors is unchanged.

BNGE_FIRST_OPEN_NQ is 0 for now, so the layout is unchanged. No
functional change.

Signed-off-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Reviewed-by: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
Reviewed-by: Rahul Gupta <rahul-rg.gupta@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge.h     | 19 +++++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_auxr.c    |  4 ++--
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  2 +-
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge.h b/drivers/net/ethernet/broadcom/bnge/bnge.h
index 5cc08177ff86..5f7147baaf83 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge.h
@@ -240,6 +240,8 @@ struct bnge_dev {
 
 /* Index of the first NQ created in ndo_open() and destroyed in ndo_stop();
  * lower NQs live from probe to remove.
+ *
+ * irq_tbl order: probe-time NQs, aux (RoCE) vectors, open-time NQs.
  */
 #define BNGE_FIRST_OPEN_NQ	0
 
@@ -289,4 +291,21 @@ static inline void bnge_db_write(struct bnge_dev *bd, struct bnge_db_info *db,
 bool bnge_aux_registered(struct bnge_dev *bd);
 u16 bnge_aux_get_msix(struct bnge_dev *bd);
 
+/* irq_tbl index of the i-th aux vector, also used as its ring_idx */
+static inline int bnge_aux_irq_idx(int i)
+{
+	return BNGE_FIRST_OPEN_NQ + i;
+}
+
+/* irq_tbl index of NQ nq_idx. @aux_msix is a single bnge_aux_get_msix()
+ * sample shared by all NQs of one allocation.
+ */
+static inline int bnge_nq_irq_idx(u16 aux_msix, int nq_idx)
+{
+	if (nq_idx < BNGE_FIRST_OPEN_NQ)
+		return nq_idx;
+
+	return aux_msix + nq_idx;
+}
+
 #endif /* _BNGE_H_ */
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c b/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c
index 87ae40eab592..d1cc2e8b6e9b 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c
@@ -34,9 +34,9 @@ static void bnge_fill_msix_vecs(struct bnge_dev *bd,
 	}
 	num_msix = auxr_dev->auxr_info->msix_requested;
 	for (i = 0; i < num_msix; i++) {
-		info[i].vector = bd->irq_tbl[i].vector;
+		info[i].vector = bd->irq_tbl[bnge_aux_irq_idx(i)].vector;
 		info[i].db_offset = bd->db_offset;
-		info[i].ring_idx = i;
+		info[i].ring_idx = bnge_aux_irq_idx(i);
 	}
 }
 
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index c2f1f517348e..a9cae94c2a62 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -540,7 +540,7 @@ static int bnge_alloc_nq(struct bnge_net *bn, struct bnge_napi *bnapi,
 	}
 
 	ring->fw_ring_id = INVALID_HW_RING_ID_32BIT;
-	ring->map_idx = aux_msix + bnapi->index;
+	ring->map_idx = bnge_nq_irq_idx(aux_msix, bnapi->index);
 	return 0;
 }
 
-- 
2.47.3

