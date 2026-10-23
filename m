Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740843;
	b=Hx7g8IJZ43mcNcxKmqllG+y4brx9RSpFKdOATy5H/eBUPhxLljtlqDTiHWETLa071LJy
	 5qVoO9ofzGuHZEX4pV1ftLAZfJs6uZHymbBem/cT3vwB+LYEeX7Tb5EdO3IfkrtCNRoK3
	 LEUdQV01cInpUuhSUKJa4LIhsUt3Kzl+R7FQo+DkHroiqFmDa5RYNacRuz1IaPPTXCF3z
	 gybnyou2BN5wi/NXHII/f+6ySkGHH7kmxE/zgieBu/EfwZ4gjJghXyF023dZFG8e9YCrB
	 QcsDwTGCgY3rUPaw+mbxmCNEg/xmHzqVSw3880WTegv/avp9KmsYYBtvBX4BXS/iiXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wePc/O0tHr8BHU6IBxL6zf+pKtKd8GbWsfcZZFn+Mdw=;
	b=awNUze+Kzc6nfRjHC/z6KvXVElM0ogM0L5ssnXLw0hUQbRrFXyAHeG5nJr56P5klJCn3
	 KRjnyJgHhXTaZIN0eMozqW6wBabIQNV44nDH6wXlx2yFjVISaxJSNRagODpz/BY3HyDdn
	 6yf2RxN8tTO5+OzorhGewPCDJBVjPjDcMj8ID/4B77b15aWf+rGhxUp4UCq+BD1P9pYS1
	 nxgoDfyA45moI2Kxb3MMT+fDXHQEdU5LFa+JZ+cW7uS6V9nkGCOgxFkHu7HIh3jgwbrgT
	 DeZgyf2ffb72PQJRqrQYRqQ2XryizG3Ry/2KhLEJ/LLsL1ONNU5BZoNZGQnU2xTgVAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aMgzEWvD;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA9C606A335
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFA9C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aMgzEWvD
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so244422a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740842; x=1793345642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wePc/O0tHr8BHU6IBxL6zf+pKtKd8GbWsfcZZFn+Mdw=;
        b=aMgzEWvD2KbUmzBpjHhxSUbstZIzFhX83oWfEe1OnpyYqMs6Tr63ZFibCuUkdRF07X
         P7iTauibVzXFGDVIAHwFE0HhTD+UjT/stHetZ/Hzs7LT5oIgDzLR82l4f15uspK3qVn2
         RwqbmMSw3Qkfl8c3gs/Dm4ktlg9HoCYj8YDJxVnxCl1Yp1HdgqeW7DNsPInyqHMOMdAR
         UOd3UV3Y3S086YOeWRj8jHKtdBZn5WBu090h/1t+ZaOzFl2VgNp2tExzAv6ec3f3MtEp
         1d5KjYU+etdMf0v2EQywYTdlOBWaQL7BGiENDhRQEejd0GR7eKpnhYZpZ2BBObVZQR/x
         SpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740842; x=1793345642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wePc/O0tHr8BHU6IBxL6zf+pKtKd8GbWsfcZZFn+Mdw=;
        b=iC5tCn9sF+kRzAAA66u58DgKfv6XwOFLYewyhQoBlTxDDXPsXfJJD/BvbIui8zYvk2
         azmKsm0LCs2ulPRlzeUFx0+OU2gazkQGKEl0HIJ/7cnx3OE+iB6W5n95yNF/f9/PXyGw
         +ZXo9iuDHebj2eUG6f5OhVVo21CoS1RbFBWEPPAkiJo9kVtmdv/KzE4Ewxh5TOXjFLEk
         mh2xvBCmduPRNORfzNJHFv2r9sF66LMRY0tWMs3ZpMNKGyH5Ivni2WtnAQgc7JWrbhq9
         6PM75RwgYOtauXg9F/dO+nIwUj44w6IlFXxoOXUUi04AOG/+AuH0mVtH1Ur6EguSPCIs
         ns8A==
X-Forwarded-Encrypted: i=1; AKwUvBxYNH3owNh/+nIRoYqOUzBHKO79+L8bJZThs4Hp42QcvXWvmMLuh+dJaFTrfMYtwDnMEPEf516Azf9Qu54=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLe3esrzL7QhEp2e4xtEgzbSM3rTOMScVHTfTXtPkcRcagtADR
	GFgZvdBzHhvQ8BzMoNDkVrpTANSgC+NtFNxWDmS6F3eEbJCLt0sGcMso
X-Gm-Gg: AYBFou2OhrZ13qfkxTL7rtP2i5fizoxULx0ugMcVByyKBtEkDX39AW5TNtIaOOwANw6
	yjbyT0/oW6LjmG2L0Km6STEjap4B02LCDLKi242r1S8ClvtVjmPulB6Nah0ImmtyFzm+pDWd17T
	6tuV4+n3R7/8yx/OY3es8uKsurU6V9v8/wFPFvDFiGsolQHwn7m04BZ8mb+Med+EMSKRYg5a0Jq
	M9mVb/GXKd/P3KIdnrR7CLMl6c/4qv8itL6cjdxuw/65//9hQANzsI0G0EKNTiPmqptSPxJaoTh
	LGJJfI7Sz5lDM5yvQuU6T/+obMdRiYsOoxQLEtUYHfOCnHWHy/0vPvo1sujzsMIoT7dYkibxmeS
	ir+8hnmY2T16yw4ivYFOez97PmaDr9ah8WsQVkVMGvmuiftQrdnHbna3uehTGdVStEMy9G09CDF
	ub9V9olk0bytcF5O3bwOcJNncnpO0auhDT5GRex6ojjLekmt5SrS/ECN4hoevz9hNU/0laLYui7
	yi7YPxFyiiGDgrb/5HBu5Fs9uGph6QNXh+4/nGbLFS7O8jDkM3YLmG/3/Avrs8u2MCPDlzmU+o=
X-Received: by 2002:a17:90b:35cd:b0:3a7:f4d:b23d with SMTP id 98e67ed59e1d1-3adce7c855amr1172820a91.52.1792740842077;
        Fri, 23 Oct 2026 00:34:02 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb1b256csm2298742a91.10.2026.10.23.00.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:34:00 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Nelson Escobar <neescoba@cisco.com>,
	Satish Kharat <satishkh@cisco.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] IB/usnic: fix wild pointer dereference in usnic_ib_qp_grp_dump_rows()
Date: Fri, 23 Oct 2026 15:33:49 +0800
Message-Id: <20261023073349.1287022-1-lixicaicai@gmail.com>
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

While auditing list_first_entry() users we found that
usnic_ib_qp_grp_dump_rows() calls list_first_entry() on
qp_grp->flows_lst without checking whether the list is empty.
list_first_entry() never returns NULL: on an empty list head->next ==
head, so container_of() yields a bogus non-NULL pointer derived from
the list head address. The function then dereferences it twice through
"default_flow->flow->flow_id", which reads a garbage pointer out of
the enclosing structure and dereferences that in turn, almost
certainly causing a kernel oops.

The empty-list state is reachable on a normal path: transitioning a QP
group to IB_QPS_RESET via usnic_ib_qp_grp_modify() calls
release_and_remove_all_flows(), which empties flows_lst, while
disable_qp_grp() only disables the hardware queues and does not
release the VNIC resources, so res->owner still points at the qp_grp.
A later usnic_ib_create_qp() on the same VF unconditionally dumps the
whole VF via usnic_ib_log_vf() -> usnic_vnic_dump(), which invokes
this callback for every res->owner != NULL - including the reset
qp_grp with an empty flows_lst. The existing "if (obj)" guard does not
help because obj (the qp_grp itself) is non-NULL; nothing checks the
flow list.

Fix it by switching to list_first_entry_or_null() and printing "N/A"
for the flow ID column when the qp_grp has no flow, mirroring the
existing all-"N/A" formatting used for a NULL obj. This was found by
code audit; we do not have Cisco usNIC hardware to reproduce it, but
the triggering sequence (create QP, modify to RESET, create another QP
on the same VF) is a plain libibverbs flow.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/infiniband/hw/usnic/usnic_ib_qp_grp.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/usnic/usnic_ib_qp_grp.c b/drivers/infiniband/hw/usnic/usnic_ib_qp_grp.c
index a7327c7a7..6f6aaea06 100644
--- a/drivers/infiniband/hw/usnic/usnic_ib_qp_grp.c
+++ b/drivers/infiniband/hw/usnic/usnic_ib_qp_grp.c
@@ -78,8 +78,17 @@ int usnic_ib_qp_grp_dump_rows(void *obj, char *buf, int buf_sz)
 	struct usnic_ib_qp_grp *qp_grp = obj;
 	struct usnic_ib_qp_grp_flow *default_flow;
 	if (obj) {
-		default_flow = list_first_entry(&qp_grp->flows_lst,
-					struct usnic_ib_qp_grp_flow, link);
+		default_flow = list_first_entry_or_null(&qp_grp->flows_lst,
+							struct usnic_ib_qp_grp_flow,
+							link);
+		if (!default_flow)
+			return scnprintf(buf, buf_sz,
+					"|%d\t|%s\t|%d\t|%hu\t|N/A",
+					qp_grp->ibqp.qp_num,
+					usnic_ib_qp_grp_state_to_string(
+							qp_grp->state),
+					qp_grp->owner_pid,
+					usnic_vnic_get_index(qp_grp->vf->vnic));
 		return scnprintf(buf, buf_sz, "|%d\t|%s\t|%d\t|%hu\t|%d",
 					qp_grp->ibqp.qp_num,
 					usnic_ib_qp_grp_state_to_string(
-- 
2.30.2

