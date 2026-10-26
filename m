Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036544;
	b=DSsQP+QDacs0V3SYyA8cvpliCOn8esx1hkQ+MQZ1pEVGIihJiGkFnA5V+3lLwrvuo7zq
	 2mlAlPdTFNreOmNmcGBOxjulkH77L3+7M7ur3EbizK622ld/sgxP29dnT6z8tuy0oiJfB
	 fVunlNU3r69W7evLbI8MZlLYzgc5F63Au/Pek6dUwjetMFaAJrefQxkrhncfVl/6DEgqX
	 ykGhScDqaqZb0xUFAbrueGjd4E9wb5Aicie5sYMwKJ9RIoOkxtYKiU51pSN+1OsbHdkSJ
	 13cAYEg1+Pne1PVPMk7nUvgR6zdj/W9HYDYCJPwtgs9kIcZVECuUQOyDayPSawcYNUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=3G8QhvNEpQ3sy+r1BDzvVBq/AXAxP3+qa6H4bl6GlDI=;
	b=labWBJeddmBv8UHzQr1+TZSb5ARaR4VyeebN1AUDpelCGjs1Z4w6lUX0//y8nnmHOobf
	 6UCU6FsLu6H6jUSRJPkJbTvUOuwl7wz1iUSb4tKZ7WgwPLz1nvC36fEYdL4LQ366r6HEC
	 UzQU4IZQ+ZARC0YA6XLj/WYO3XkZSVtrazt4JR/hPR9xPqp1dCd8GrwH3c3xbzVhZdMXU
	 uhuQbxT/Bkl+FKsrCM9kqzy/6jbNNkcDYgONOd4/DM9mV12PPniJ8HOauogX0i06YRhGW
	 C+xFB5ql8XEcc/bTp0jD4k8PAaxGUCRLFh+quF/0gRH5hXuRvCwb+z1A2GG789YYDQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Quor47Oo;
	arc=none smtp.remote-ip=209.85.218.69
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FA7606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63FA7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Quor47Oo
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c4322d31021so359603766b.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793036543; x=1793641343; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3G8QhvNEpQ3sy+r1BDzvVBq/AXAxP3+qa6H4bl6GlDI=;
        b=Quor47OoHs4we93mMmQWIgaEgjR6kyEJpJmZO0dfWBwFVp5oKOxLTdy6gXD8Sy+hff
         g90sNo1kpGvDaxFE6LtP5pbzVWKhr9F+lcR3EVJjC1o2lKVse/COTh5o3CYeD2bOFAWq
         y5EBg0xOBZaCICtWBoWo5E8VI/ci1QK0hrzBX3fRuYwgMAAEAxH2d1OjycJucG3AtzZI
         +uySj805zF3ftWVodGdsUXGMPIrDvv23zSP5VumdrKeM/3JoLcragmvZRns89fP4E2FP
         fYE3wCDTkRdtiJJzD3Z6Eq1+arzEjx5EXHbQfeBc1SG2CnYydphArOuJfmi69PHjQVpS
         1YUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036543; x=1793641343;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3G8QhvNEpQ3sy+r1BDzvVBq/AXAxP3+qa6H4bl6GlDI=;
        b=xmzecWQ7D+DOlz+VK+z6X2LUzXDkyALXqMWLVn/FR5lB8FHAvuGCywabL+kgXMQ9IT
         tvyVDADx1VOi9Q0DW/neMuYXHaUokK2duTJgTEVmp1p7+xl6bF3ugMRT9ovHmR6qLTsa
         6ajJZxYfWEUD4O6ecTTNeEmdRHQFk+Bc9lBldI2cSaVYFYDzVHpMX2GgUaecEfUl/1rP
         aItCqt+5/fielDxgGMdYfS2jRhJwDUaNBk6S5oPoAlsBxfpJnFGTOlTaxCjckk3rDJ9t
         LO7dzE9UGFY5z3RNQ86Fiey3QRfSCFXM/lQVzWlKqe7ZNl2bZOJHxxbDQiE5VbJ6WcI2
         poQA==
X-Gm-Message-State: AFq9FYLc46ErjfuogNiyW4T2h/yRpT+Mop0z7iw67nmJCKT4fBcYdYf9
	AW6aWlelODT0f9M4jrKk4IqIgS/nV+eT0h6MCXAn1+vvwy7hZhTokFGMwSWCiJQABZqB7JoiDU2
	5HJwdUF3l25PjE9dsyQ==
X-Received: from ejaw11.prod.google.com ([2002:a17:906:33cb:b0:c35:60c7:1880])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:d18:b0:c3f:c856:fb7a with SMTP id a640c23a62f3a-c46bdaf85d7mr817347766b.3.1793036540600;
 Mon, 26 Oct 2026 10:42:20 -0700 (PDT)
Date: Mon, 26 Oct 2026 17:42:14 +0000
In-Reply-To: <20261026174217.603114-1-tarunsahu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026174217.603114-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261026174217.603114-2-tarunsahu@google.com>
Subject: [RFC PATCH v3 1/4] liveupdate: Remove __packed from LUO and memfd ABI structures
From: Tarun Sahu <tarunsahu@google.com>
To: loganodell@google.com, alex@shazbot.org, dwmw2@infradead.org, 
	seanjc@google.com, Mike Rapoport <rppt@kernel.org>, will@kernel.org, pbonzini@redhat.com, 
	jgg@nvidia.com, Pasha Tatashin <pasha.tatashin@soleen.com>, arnd@arndb.de, 
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, oupton@kernel.org, 
	baolu.lu@linux.intel.com, David Matlack <dmatlack@google.com>, robin.murphy@arm.com, 
	maz@kernel.org, Alexander Graf <graf@amazon.com>, joro@8bytes.org, 
	Bjorn Helgaas <bhelgaas@google.com>, kevin.tian@intel.com, 
	Pratyush Yadav <pratyush@kernel.org>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"

All structures in include/linux/kho/abi/luo.h (struct luo_ser, struct
luo_file_ser, struct luo_file_set_ser, struct luo_session_ser, struct
luo_flb_header_ser, struct luo_flb_ser) and include/linux/kho/abi/memfd.h
(struct memfd_luo_folio_ser, struct memfd_luo_ser) have naturally aligned
fields on 64-bit architectures, with no padding holes between fields or
tail padding. Any future unaligned field addition should come with
reserved field to keep the structure aligned.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 include/linux/kho/abi/luo.h   | 25 +++++++++++++++++++------
 include/linux/kho/abi/memfd.h | 11 ++++++++---
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
index 288076de6d4a..899943877e41 100644
--- a/include/linux/kho/abi/luo.h
+++ b/include/linux/kho/abi/luo.h
@@ -58,6 +58,7 @@
 #define _LINUX_KHO_ABI_LUO_H
 
 #include <linux/align.h>
+#include <linux/build_bug.h>
 #include <linux/kho/abi/block.h>
 #include <uapi/linux/liveupdate.h>
 
@@ -82,7 +83,9 @@ struct luo_ser {
 	u64 liveupdate_num;
 	u64 sessions_pa;
 	u64 flbs_pa;
-} __packed;
+};
+
+static_assert(sizeof(struct luo_ser) == 32);
 
 #define LIVEUPDATE_HNDL_COMPAT_LENGTH	48
 
@@ -98,7 +101,9 @@ struct luo_file_ser {
 	char compatible[LIVEUPDATE_HNDL_COMPAT_LENGTH];
 	u64 data;
 	u64 token;
-} __packed;
+};
+
+static_assert(sizeof(struct luo_file_ser) == 64);
 
 /**
  * struct luo_file_set_ser - Represents the serialized metadata for file set
@@ -113,7 +118,9 @@ struct luo_file_ser {
 struct luo_file_set_ser {
 	u64 files;
 	u64 count;
-} __packed;
+};
+
+static_assert(sizeof(struct luo_file_set_ser) == 16);
 
 /**
  * struct luo_session_ser - Represents the serialized metadata for a LUO session.
@@ -131,7 +138,9 @@ struct luo_file_set_ser {
 struct luo_session_ser {
 	char name[LIVEUPDATE_SESSION_NAME_LENGTH];
 	struct luo_file_set_ser file_set_ser;
-} __packed;
+};
+
+static_assert(sizeof(struct luo_session_ser) == 80);
 
 /* The max size is set so it can be reliably used during in serialization */
 #define LIVEUPDATE_FLB_COMPAT_LENGTH	48
@@ -152,7 +161,9 @@ struct luo_session_ser {
 struct luo_flb_header_ser {
 	u64 pgcnt;
 	u64 count;
-} __packed;
+};
+
+static_assert(sizeof(struct luo_flb_header_ser) == 16);
 
 /**
  * struct luo_flb_ser - Represents the serialized state of a single FLB object.
@@ -175,7 +186,9 @@ struct luo_flb_ser {
 	char name[LIVEUPDATE_FLB_COMPAT_LENGTH];
 	u64 data;
 	u64 count;
-} __packed;
+};
+
+static_assert(sizeof(struct luo_flb_ser) == 64);
 
 /* Kernel Live Update Test ABI */
 #ifdef CONFIG_LIVEUPDATE_TEST
diff --git a/include/linux/kho/abi/memfd.h b/include/linux/kho/abi/memfd.h
index 08b10fea2afc..7115a8a77cfd 100644
--- a/include/linux/kho/abi/memfd.h
+++ b/include/linux/kho/abi/memfd.h
@@ -11,6 +11,7 @@
 #ifndef _LINUX_KHO_ABI_MEMFD_H
 #define _LINUX_KHO_ABI_MEMFD_H
 
+#include <linux/build_bug.h>
 #include <linux/types.h>
 #include <linux/kho/abi/kexec_handover.h>
 
@@ -20,7 +21,7 @@
  * memfd uses the ABI defined below for preserving its state across a kexec
  * reboot using the LUO.
  *
- * The state is serialized into a packed structure `struct memfd_luo_ser`
+ * The state is serialized into `struct memfd_luo_ser`
  * which is handed over to the next kernel via the KHO mechanism.
  *
  * This interface is a contract. Any modification to the structure layout
@@ -54,7 +55,9 @@ struct memfd_luo_folio_ser {
 	u64 pfn:52;
 	u64 flags:12;
 	u64 index;
-} __packed;
+};
+
+static_assert(sizeof(struct memfd_luo_folio_ser) == 16);
 
 /*
  * The set of seals this version supports preserving. If support for any new
@@ -85,7 +88,9 @@ struct memfd_luo_ser {
 	u32 flags;
 	u64 nr_folios;
 	struct kho_vmalloc folios;
-} __packed;
+};
+
+static_assert(sizeof(struct memfd_luo_ser) == 48);
 
 /* The compatibility string for memfd file handler */
 #define MEMFD_LUO_FH_COMPATIBLE	"memfd-v2"
-- 
2.56.0.307.g5fe7bd680c-goog

