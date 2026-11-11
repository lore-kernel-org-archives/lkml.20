Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423743;
	b=mctNYSPw4CPKKJTaXhpcPQyFV+VcacpuK+IIr7YVWEcYxY7oZkfD5ottGqgKjGvx/PiS
	 gv2VE3QNG/g6f9eKmbjTFy3QAZFhBlreyI8D0yXgl+FK92KqpVgsJJO2/lHXdP+3pn4fK
	 uF4wCHaBcDP+UzhmD7lPg8d14/W+itZf8xvHIAVf9m6PytlufK0bVOkPXMg7Pyc9F3+gl
	 WyOctQqsJw5EWO+Es6AMQNHejhXsDYXGUfNlEPIC0sclWbT43d3Aq1dqq+ajVwiitASyN
	 Wrxvy9arLidraHB2QX1qmC+6Tf3yG6HLC4MYpH1HLFXoFimiyKX/HC4wJDxlLT65x0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423743;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=TgoELlNLV+Tg/+EMMPS7V53hbcJ09kF4geHWbDiPE0Y=;
	b=zXI4nqTwzHTg4tjALVvbGQ/Hajdhu8JPKm1R0fDlV1xJ/KXPOy2SSwlXqUNpJzw8okZY
	 uwn1fE2DY8eb1Fn/1bUAgP1Ejr1V9F/BVYYn2whpVAcTIPzO+EjulxbXu7RktR8YfZhnH
	 5S2UueoDDbHDPujU8xwngLWmwvL/HfxgD+0yQcmilujBmQAOUIXmapHIPIQzZptcpyZU7
	 lRFAQ0NLqwvKlX5zw+isFF4Y/jkr7qpQBrWNksQZYpkp0jsSgkVPM3GEZXPLCJ9uP4v1P
	 m/Fd2ztJFFRR+LpmAp/pliYOG8/XzUykGGMY7LZJO1GqHmaWnP6TwiKNjjvZ6Z8gnpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DWaXy19r;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D38A606A894
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D38A606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DWaXy19r
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso1782531a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:02:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423743; x=1795028543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgoELlNLV+Tg/+EMMPS7V53hbcJ09kF4geHWbDiPE0Y=;
        b=sqoruzUJxUhfdNKplO8PH6OeU8rJaBots7VwrieK5HaZrPHJgeDNHY7yyJtxtYn+cZ
         AByoER+yk5Q+WZhNmCjidu9CGNBA4ExtP/46r7jTvY6ZlKGLPkNVChMhSys0PGhAszRC
         seNXjIAIe/GO8VjA3J+OAvLoKveac5FfTqoVv6zkK7DaKA7akhDpIEMbpFMNfLq2FIlV
         Tje/T1I20Xdg/TabDWMGZRfluDadpSS0ciSANs3c76l2ohNsKL7RTF6A3Ha03RW6YLKl
         dJH46SDl4vlfdIPgow3lMDb+Oe/G+X3p8u7ruRkVIF0sI7LVFL4G1qPwvKDAgv5Tzg2e
         aysw==
X-Forwarded-Encrypted: i=1; AL+hErGyK2EkYtxgk9uh6IZvOnzPpaCFfzv0P09/UTL4jIsHfn3vlvDyw5zJPaPvhU7tO/Cg7PkW32W0FkI6a6g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ktbVMEB4RHZkAq+UR2Wynojmc+i3WiVgxwdLQW2lgyBqL6fKj
	XcBRJj4w7KW1G4lU+Bl5VwTCSNIcZJvFwOiZc863MS78QWkFb3F0uriQ5RlHBk1m4y9LqpQVRjf
	gzgal8YVsaf+QrHGQHzvIImXo4pm509jsWAOikle16FdvmG6lmkWHG8Fho51yO/E8STYWjCWsK8
	66Vne75+EyNoD5fCIuZSp46o6FFlFkC0Nv+ev1ATITrhX24HckmAb4pi2W93tWvm5fgQMBZ80HT
	3Mmn+dryfItrdPdnE25n3xZPQ==
X-Gm-Gg: AYBFou0SAt0bbe29YmQV6rlcoZ2wiwHHbTDUwKqqMGVBHy+TO0WXKAhjS+8Fx1FArJo
	mtgTECjW442ziFULLDeW+QuH9whEmtFd8VZkr5aOFFR/y6RAmfOSU1Q2fENX0hAl7ds6d3rJb2L
	WHlAeOLPoFCAiaGD72w+QlvKtDXRx8YUCFAd9z7gu6P8qvZx8D/FPEb4fJYoPaArf/xeWrIEnhL
	CeQph8H7PrzYbDu7rMiRxKt/zNTqTYjtTLzKyLNeT5WLefRB00hm1CN9l67EMeVkZOC2yCxlPK+
	HUy27OGrW1nwkuUPlmopKjCqpklgG5ixZiNfo5wno+N8Qn97MBlHTSftvzXxl5QLpIhWpWsMokV
	oYstSz/2tnFg3icYRuuU7YLjRVcuYOiRVPFQmTmXxrGvC18VZ8iZvbW3mndugQ0PxJ6nhViL95F
	2Lm+X8ce88fKyI4GeiCsugyXL0qkxlDqDXKijHmX/h8A==
X-Received: by 2002:a17:90b:5808:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-3b182e95f1emr3159023a91.18.1794423742505;
        Wed, 11 Nov 2026 11:02:22 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197c475f0sm215490a91.5.2026.11.11.11.02.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:02:22 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5690365eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794423740; x=1795028540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgoELlNLV+Tg/+EMMPS7V53hbcJ09kF4geHWbDiPE0Y=;
        b=DWaXy19rC2ebBsGyJgllq5sZgPHnGDZs06hMWt9WMJBNXkJYPZlhTjHDzizhvtAHfB
         7v0bxyf8hKdxt7lLnHJ40SKKU6Q7m5FtIvhAgvgwVNXBD6LiELb9ChjwKG9fitHFGsfw
         RsUdUrKrrCmiB2GSDe1ZGTmGCUeqtXJNZulxE=
X-Forwarded-Encrypted: i=1; AL+hErE+fOgPclUlj9YJf2YdLOnlNkVnm9Ug+zxQTPsiE3u/Sk3dtCcbnH8pf1woEUSrSKrBYBLZPcw+7U+0Hco=@vger.kernel.org
X-Received: by 2002:a05:7301:2907:b0:369:fdae:c9fd with SMTP id 5a478bee46e88-376850ce224mr4973795eec.13.1794423740031;
        Wed, 11 Nov 2026 11:02:20 -0800 (PST)
X-Received: by 2002:a05:7301:2907:b0:369:fdae:c9fd with SMTP id 5a478bee46e88-376850ce224mr4973743eec.13.1794423738865;
        Wed, 11 Nov 2026 11:02:18 -0800 (PST)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212ec002sm20860468eec.26.2026.11.11.11.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:02:17 -0800 (PST)
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
Subject: [PATCH net-next v4 4/5] bnge: make irq_tbl layout depend on BNGE_FIRST_OPEN_NQ
Date: Wed, 11 Nov 2026 19:00:10 +0000
Message-ID: <20261111190011.53437-5-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111190011.53437-1-bhargava.marreddy@broadcom.com>
References: <20261111190011.53437-1-bhargava.marreddy@broadcom.com>
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
index 0955b488b6fe..0393bfea7b65 100644
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
index 197a9032bbeb..400ada1023ed 100644
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

