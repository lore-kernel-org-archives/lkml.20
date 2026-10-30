Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381587;
	b=uAlWp/T1ftdYmV3kqmjyyOt3uk7fx1VE7pz55Fr6BVsBQpD5BQRDfkEGM11HG6EB2Cna
	 XAJCyO0YGnulfHJSMKUStDYQasrXkSmpQiCF6LxfrTIfFgx/kFjpgQP44edfFQFhNSRkx
	 r+yXVY8DXp0AV98qaUGQuDs8RPKN7MJm/SDFIOEsEegoKGqVpPBGeLnfgPbyskXL00fiv
	 sIEVmn3P/lBy98fVwaLRC5+orEuRkH/Se7R7ztXPZpWJY2SQQJbbMjclVux7CJ5V1JgwG
	 zD00eWEUL1Ms7wo8r2i/ri591wzo+rGFjOYmHEbvIc30JVYv3R9LK+7/S4zVej9ldKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LmO/5PcIMkJ1uNOlzQOm4Yq03gMmohmS4XStYh/BI0o=;
	b=D5ciEhpbNlQHBtxoTjHlf6MXBXiqp6Ws7fZT5fJkYr8L7GqRlQK4q1sTz56UPq4aSYwv
	 ex58VG4n8mjE1H/JPJvYvDHoAFFpM9/GG6hQ8EKxGVly1F3t1cDOo5C9r+Gj15XQWBFQ+
	 gRjai69vDr1TDMxHX2Hr9b37D8uwF3kH6u27PKGgOM5Wd7x1bJ2uGXInR4AH/3PW6KWDc
	 3urKvtTyQ6JAWy9A/KH9LIkKCQARuglfFoxq/uRamcjDHunB5+loxSDSv71104fIGyeYb
	 zKN0w3CXwUIUyVPgAjFJ5o1R4wFNgEka1dVwUULBh+DBhRcfLGnsvk4uUN857I1I99g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=x6u.co;
	spf=pass smtp.mailfrom=x6u.co;
	dkim=pass header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=OmCpwhLQ;
	arc=none smtp.remote-ip=209.85.217.52
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C086606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C086606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=OmCpwhLQ
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7cbbb7b90efso270656137.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1793381586; x=1793986386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LmO/5PcIMkJ1uNOlzQOm4Yq03gMmohmS4XStYh/BI0o=;
        b=OmCpwhLQs8mRsBB38fbMQFHJbO5RylCWJwHdV9f0RPoa8dtDKTb7bQo+6Lc0nc8RPY
         LfKFazuWh8hUBcCW2Xys6fZeU6hk07DsVEqpomTZcr7lrKUhgoBo82ND3pAwJ0Zgbg4U
         n9UHjbjCh9KOm63fPh26+rbz+ddqe8DZGdNC+Vxnw1Xc3FNiMb8rJqLzzLHBzsBAo+jv
         EcWCi35+8LevwcjkMfXatB8EfF8ObZGCjyORxzAGjqsSL4X75OKSGsVRpq1jWYJpV2os
         U/mesixiP/ens+yV9BgTCDHeq3okp7sJIt6jrA0De0RDGwldM2+FpSp9sOR5eb9YRKe/
         UPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381586; x=1793986386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LmO/5PcIMkJ1uNOlzQOm4Yq03gMmohmS4XStYh/BI0o=;
        b=df7Y5UrMkRSGQiGWMF3gzjQQQHuKJ7uCNPgH20wazwEvLBcfc/D7fP9TpV37AbNDz4
         PIu+yclTrtBP6YiBeTu2QjCDQxShWXH62jwNOGJHthaZ3pY7hv2qPOrEUdKO6kuU65ur
         mUhwZpZj68RFcF0yLnl4q+pGYrNqDQu6X4Kj71Q38mdwI3VUiwdM0o1DQCtfcRiQ0kiM
         Ri2MQgJmcinZW865f6r7brGY89Was+VQC3a0auOSQwhOD6OqkSo3BvBRVFv26eNf/J9c
         F6XZkf7ELKTWs8xHXx1q82rt35p/ub+UH8Ge0hieCRFZzgDFiV45ZelJEAnUDntwth0F
         BpJw==
X-Forwarded-Encrypted: i=1; AKwUvBz+Ou8AwfkOdcr1ROuB7pXDRiy+J/hBP2U9P80uSmcynp0KvJOzbG7cZHyftbjlujrJN6gZ5g73ast0J8A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJruVozc6gh3XR2ekC8ZcIklRjkzWcihlPWo2ee+7c/L8s1DktL
	RICI6aaNb0y7faN+GBeQah1fAaMQQVLJ1f6QKd6OxBMi6bIDztycGRCteda2YcdDug9tHFPO7Io
	ZvpFXPg==
X-Gm-Gg: AYBFou2eMslLjgp0gAl5wSyJTjh4jN/P+Zu7q4kdaICsA1FKBZSjXKLhWqagaXekQVb
	sMNmPokVy6TpYYlrQzrJLZXC7pe2baK7vNAn3CQLm1Fo2ncFiSxaO96jIJQPNQDMGrJGO3q68lc
	wBAzLEfpj40/diO+1xEm3U8IcIZEonHJuK5+ygGyXQJ6ZVojMhYhTBS9F3M9wP0mSBbAY8Yk7B5
	usOEgE5PusyvXXbKdqizDeyArvg5qVgobmrsseZVVUMI7pc8lwZvs0ynEj68tp8y2vccl9NZ21M
	POXbxVMBssvUk+y41xoBVsz9n+J3Byf5m5Cu1iSWzhcz4XtoLxXExLvziURtxeksp2nC8OFYXri
	kf5PdENoARGhjGJEm5jF1+rz/z7Io1d68JC12PU1BufD/MJQEcdvsEGd/hWjCBwJGmVSeumPUIS
	qP2Y0gPzwGVN8jBBZWKg8BA0BRM83Ht6MUJ+VrgMIHYwELmduQB5zPWLYvGoLdKQDcNuFLlKKFs
	/zc5vV1fuuaKgZFGXHv3LDhY0BG5U2arbEi3A4sLJXs2zRk0y7Dk8mfa1jjaSQ225uCSDoKk/qp
	AmluDyv1qmRpiMU6OvnCSQLAkSZ4VNYK3CBKLwk+vVDIwjvq9X2sVle1FNQ8VH7ZTNmRUSEEa2m
	DPZN9nixlIbFX3w6aUWuCPeFyicmC4tYP2m25h5FoIeM=
X-Received: by 2002:a05:6102:4457:b0:7cc:32da:56e with SMTP id ada2fe7eead31-7d0725b9fb5mr1123902137.19.1793381586290;
        Fri, 30 Oct 2026 10:33:06 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (109.243.150.34.bc.googleusercontent.com. [34.150.243.109])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d077606b7asm2816323137.8.2026.10.30.10.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:33:05 -0700 (PDT)
From: David Hu <dhu@x6u.co>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Tatyana Nikolova <tatyana.e.nikolova@intel.com>
Cc: Jacob Moroni <jmoroni@google.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Hu <xuehaohu@google.com>,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH rdma-next] RDMA/irdma: Free cq with a safer cq num reference
Date: Fri, 30 Oct 2026 17:32:54 +0000
Message-ID: <20261030173254.2000665-1-dhu@x6u.co>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
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

From: David Hu <xuehaohu@google.com>

Within a iwcq, `cq_num` is allocated first, and only
copied to an inner uk structure, `cq_uk.cq_id` at a
later stage. Freeing cq by `cq_uk.cq_id` before the
later stage leads to a cq id leak.

Free `iwcq->cq_num` instead, which is allocated
right after initial rsrc allocation.

Fixes: b48c24c2d710 ("RDMA/irdma: Implement device supported verb APIs")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20261016202909.1289496-1-dhu@x6u.co?part=4
Signed-off-by: David Hu <xuehaohu@google.com>
---
 drivers/infiniband/hw/irdma/verbs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/infiniband/hw/irdma/verbs.c b/drivers/infiniband/hw/irdma/verbs.c
index c91c55917de9..1726a0ddeac8 100644
--- a/drivers/infiniband/hw/irdma/verbs.c
+++ b/drivers/infiniband/hw/irdma/verbs.c
@@ -1948,8 +1948,6 @@ static void irdma_srq_free_rsrc(struct irdma_pci_f *rf, struct irdma_srq *iwsrq)
  */
 static void irdma_cq_free_rsrc(struct irdma_pci_f *rf, struct irdma_cq *iwcq)
 {
-	struct irdma_sc_cq *cq = &iwcq->sc_cq;
-
 	if (!iwcq->user_mode) {
 		dma_free_coherent(rf->sc_dev.hw->device, iwcq->kmem.size,
 				  iwcq->kmem.va, iwcq->kmem.pa);
@@ -1975,7 +1973,7 @@ static void irdma_cq_free_rsrc(struct irdma_pci_f *rf, struct irdma_cq *iwcq)
 		}
 	}
 
-	irdma_free_rsrc(rf, rf->allocated_cqs, cq->cq_uk.cq_id);
+	irdma_free_rsrc(rf, rf->allocated_cqs, iwcq->cq_num);
 }
 
 /**

base-commit: c3e8e9451e6f1b69f685b75e0fbf14f3d0fb2539
-- 
2.56.0.317.g454f8302e1-goog

