Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286932;
	b=t9EwYAhsIgmhCsMLlZCizUqDdd4+6a4I/oRAvd64WkpYEY1dNqDD7RSnA86aaOqms2bp
	 mJ9dlJl1KUc7c34LYX7iHk+S+DsVKOwo5bXw2fLUSMmoWw1+gALOIsA+NUSZ/mSOmZdH4
	 aiwbabALQRIyQRI3buFOaDuirNqeHi5iill1QtWjs9xwipV1KPNX6LyZhLr4IM5AbHyeL
	 1UT4QGp/ntvr4jnH4rQbynJZP5T1j4gLvKSP8RPppmCzbkVKOF62YzLQquGFpE1AJh3sc
	 +aByd6JWn6eos0wavKFNtmWKPXOlr2bzc5w3VYOhyEhZWPJ8fzv70njozPSaw0QOVqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=daK/IkDIXVqnfjYl8/M+M9VjkzPIwCe5yl4tay+gSqg=;
	b=yTF/L2BDxaEwGA/sivl+TTXEU2iwAUE4aDuiOIYFGNmhFmpNY038frm0ebcLxch8DxxH
	 AfcZGi3aYjzmInX+IfMZJdwq3kKCxUHvxWUkr18r8JhbaEzI9UqzqxrpWP+pwh9OghagN
	 9qGZqCnzgd2qZDoWT7zIUuFfueukH4SlyYV//xpgfvs3UTJtGElkQgma1ndL4eyUbCB05
	 +3v11TKhJ1tDd+dnG1o/vVbUbzQbyK4jFC2f85Z7qz6jNexyCtIx3fxQOnSfTabcB8bN7
	 QA14ZGZOCA4yYfTI8OPq0snePc2nLZ/wNMJ+YJHtpxGfGo8QMwk0k1PRWhvL1u2XQCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GlCWC2+R;
	arc=none smtp.remote-ip=209.85.208.70
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F42160A263B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F42160A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GlCWC2+R
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b586b0a795so1625929a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794286930; x=1794891730; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=daK/IkDIXVqnfjYl8/M+M9VjkzPIwCe5yl4tay+gSqg=;
        b=GlCWC2+RC5q1ClN77z+xE3by57ImYKSiNQVz5gr2i5P6WrbxARZOD0uo0ct/PtIfPa
         NPF05kpP2ahSDaXy+hHnnRu5RCZPs9tP8Ah9mdlfaaVz7r8Y/1n6B9O6Jxx67u8nylUx
         +s53rQJJIHGNE8/+ZlfmgZmJ0prd1sfoS4qDUs4y4hteiBRf0LIsLhAeTkEZEBPLmgZn
         PPwSJeV3hehHNGcRWL6Jm2X+h3+Wa1n0MrJrRVms95lULToe810DST10ypyyItqsnnnw
         NRhDxOpmsQJJenfiSHxXEBITRubiif/4w54uWjeW2bTCfh6Mg/LOQ9TGTXqNSQ3VtYXX
         CQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286930; x=1794891730;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=daK/IkDIXVqnfjYl8/M+M9VjkzPIwCe5yl4tay+gSqg=;
        b=ya2qzDA0jz0Ta/DT4E4x6nWVQiHQi7jV8FOPskqofNsabXJqxxY+c73U8P0gVsLIeJ
         tys+WBE0/M7IeoNLbILCP1so8sFTc9hwL1XtPmm+NzBuFTvw56CFtoXVHoKThPb0hBbM
         vZ5T3dKUkbmGA0hfN8zW4q4z3lQWOnyt+eiTM6+1lgbftcWYpNiTImu0G+SvDx5vndM9
         uZWS7lcQadb84QXexcUvs7iHGrauf9YFwi8edkQsBR9jrP4SQFHg/hvpgvLOFwDN1d5z
         tMfwDf88PrPPOUr3L3btv0CL/5LU71gu/L8AaQuPar9i/epJaUx3IBGbCtEaU70ne5oO
         y0ag==
X-Forwarded-Encrypted: i=1; AL+hErF0s3D63da23JDChenQI1rUFyADD8iH8lVNXN1ZTob5JCTnb2WVZvyu6mj8sCGriXRA/1EvLq1YTsLn5z0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WQAbrnJTivbGUimfTfBw/WErESMucnuDHWIP3KP0cIIs1wAag
	OSPPSiG1N6QCMTczYFUsplKwfpR2jEC7R0I0TzJHbHW1c7a4Ax2r8nD5uJYG7sYJamghdn/yDsB
	VUIQbyMxq1X6R+s/hIw==
X-Received: from edwl2.prod.google.com ([2002:a05:6402:1242:b0:6b3:bbb1:9405])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:a6c3:10b0:6b4:8ba2:83ba with SMTP id 4fb4d7f45d1cf-6b756addabfmr786498a12.43.1794286929585;
 Mon, 09 Nov 2026 21:02:09 -0800 (PST)
Date: Tue, 10 Nov 2026 05:01:47 +0000
In-Reply-To: <20261110050202.529473-1-tarunsahu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110050202.529473-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261110050202.529473-5-tarunsahu@google.com>
Subject: [PATCH v4 04/19] liveupdate: Reference struct luo_file_set_ser via
 serialized pointer
From: Tarun Sahu <tarunsahu@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, robin.murphy@arm.com, 
	maz@kernel.org, will@kernel.org, David Matlack <dmatlack@google.com>, 
	Alexander Graf <graf@amazon.com>, seanjc@google.com, jgg@nvidia.com, loganodell@google.com, 
	arnd@arndb.de, dwmw2@infradead.org, baolu.lu@linux.intel.com, 
	Bjorn Helgaas <bhelgaas@google.com>, oupton@kernel.org, alex@shazbot.org, 
	gle.com@google.com, pbonzini@redhat.com, 
	Andrew Morton <akpm@linux-foundation.org>, kevin.tian@intel.com, joro@8bytes.org
Cc: kvmarm@lists.linux.dev, linux-pci@vger.kernel.org, 
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	skhawaja@google.com, sagis@google.com, linux-arch@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"

struct luo_session_ser currently embeds struct luo_file_set_ser directly
by value. Embedding struct luo_file_set_ser couples the session layout's
size and field offsets to struct luo_file_set_ser, preventing either
structure from appending fields independently across kexec.

Convert struct luo_session_ser to hold a DECLARE_KHOSER_PTR pointer to
struct luo_file_set_ser instead of embedding it by value. Reserve space
for both structures in each session block-set entry, placing struct
luo_file_set_ser immediately after struct luo_session_ser, and bump
LUO_ABI_COMPATIBLE from luo-v5 to luo-v6.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 include/linux/kho/abi/luo.h     |  9 +++++----
 kernel/liveupdate/luo_session.c | 27 ++++++++++++++++++++++-----
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
index 721949374fa1..f1152470f71a 100644
--- a/include/linux/kho/abi/luo.h
+++ b/include/linux/kho/abi/luo.h
@@ -61,13 +61,14 @@
 #include <linux/build_bug.h>
 #include <linux/kconfig.h>
 #include <linux/kho/abi/block.h>
+#include <linux/kho/abi/kexec_handover.h>
 #include <uapi/linux/liveupdate.h>
 
 /*
  * The LUO state is registered under this KHO entry name.
  */
 #define LUO_KHO_ENTRY_NAME	"LUO"
-#define LUO_ABI_COMPATIBLE	"luo-v5"
+#define LUO_ABI_COMPATIBLE	"luo-v6"
 #define LUO_ABI_COMPAT_LEN	ALIGN(sizeof(LUO_ABI_COMPATIBLE), 8)
 
 /**
@@ -133,7 +134,7 @@ static_assert(!IS_ENABLED(CONFIG_64BIT) ||
  * struct luo_session_ser - Represents the serialized metadata for a LUO session.
  * @name:         The unique name of the session, provided by the userspace at
  *                the time of session creation.
- * @file_set_ser: Serialized files belonging to this session,
+ * @file_set_ser: Serialized pointer to the files belonging to this session.
  *
  * This structure is used to package session-specific metadata for transfer
  * between kernels via Kexec Handover. An array of these structures (one per
@@ -144,10 +145,10 @@ static_assert(!IS_ENABLED(CONFIG_64BIT) ||
  */
 struct luo_session_ser {
 	char name[LIVEUPDATE_SESSION_NAME_LENGTH];
-	struct luo_file_set_ser file_set_ser;
+	DECLARE_KHOSER_PTR(file_set_ser, struct luo_file_set_ser *);
 };
 
-static_assert(sizeof(struct luo_session_ser) == 80);
+static_assert(sizeof(struct luo_session_ser) == 72);
 static_assert(!IS_ENABLED(CONFIG_64BIT) ||
 	      __alignof__(struct luo_session_ser) == 8);
 
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 74bc66929f4b..df667fe15fb2 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -131,18 +131,21 @@ struct luo_session_global {
 	struct luo_session_header outgoing;
 };
 
+#define LUO_SESSION_SER_SIZE (sizeof(struct luo_session_ser) + \
+			      sizeof(struct luo_file_set_ser))
+
 static struct luo_session_global luo_session_global = {
 	.incoming = {
 		.list = LIST_HEAD_INIT(luo_session_global.incoming.list),
 		.rwsem = __RWSEM_INITIALIZER(luo_session_global.incoming.rwsem),
 		.block_set = KHO_BLOCK_SET_INIT(luo_session_global.incoming.block_set,
-						sizeof(struct luo_session_ser)),
+						LUO_SESSION_SER_SIZE),
 	},
 	.outgoing = {
 		.list = LIST_HEAD_INIT(luo_session_global.outgoing.list),
 		.rwsem = __RWSEM_INITIALIZER(luo_session_global.outgoing.rwsem),
 		.block_set = KHO_BLOCK_SET_INIT(luo_session_global.outgoing.block_set,
-						sizeof(struct luo_session_ser)),
+						LUO_SESSION_SER_SIZE),
 	},
 };
 
@@ -223,14 +226,16 @@ static void luo_session_unfreeze_one(struct luo_session *session,
 				     struct luo_session_ser *ser)
 {
 	guard(mutex)(&session->mutex);
-	luo_file_unfreeze(&session->file_set, &ser->file_set_ser);
+	luo_file_unfreeze(&session->file_set,
+			  KHOSER_LOAD_PTR(ser->file_set_ser));
 }
 
 static int luo_session_freeze_one(struct luo_session *session,
 				  struct luo_session_ser *ser)
 {
 	guard(mutex)(&session->mutex);
-	return luo_file_freeze(&session->file_set, &ser->file_set_ser);
+	return luo_file_freeze(&session->file_set,
+			       KHOSER_LOAD_PTR(ser->file_set_ser));
 }
 
 static int luo_session_release(struct inode *inodep, struct file *filep)
@@ -552,6 +557,17 @@ int __init luo_session_setup_incoming(u64 sessions_pa)
 	return 0;
 }
 
+static struct luo_session_ser *luo_session_ser_init(void *mem)
+{
+	struct luo_file_set_ser *file_set_ser;
+	struct luo_session_ser *ser = mem;
+
+	file_set_ser = mem + sizeof(struct luo_session_ser);
+	KHOSER_STORE_PTR(ser->file_set_ser, file_set_ser);
+
+	return ser;
+}
+
 static int luo_session_deserialize_one(struct luo_session_header *sh,
 				       struct luo_session_ser *ser)
 {
@@ -575,7 +591,7 @@ static int luo_session_deserialize_one(struct luo_session_header *sh,
 
 	scoped_guard(mutex, &session->mutex) {
 		err = luo_file_deserialize(&session->file_set,
-					   &ser->file_set_ser);
+					   KHOSER_LOAD_PTR(ser->file_set_ser));
 	}
 	if (err) {
 		pr_warn("Failed to deserialize files for session [%s] %pe\n",
@@ -657,6 +673,7 @@ int luo_session_serialize(void)
 			goto err_undo;
 		}
 
+		ser = luo_session_ser_init(ser);
 		err = luo_session_freeze_one(session, ser);
 		if (err) {
 			kho_block_set_it_prev(&it);
-- 
2.56.0.506.g506a7eabc5-goog

