Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854862;
	b=m1t6jiOBuLUCST1R2X02dzsIR9LlHxX+aBDaieu65WkIOwDOJofhl9t4fNE/TnTvH1++
	 rQjiNa/vl6utItwWctJBhi7qLKPmmVZnAMSpL8Cy3dOZBdj6BKgksrcUznH3K2uoAcvgy
	 twabW4C0bm8rn/cyBvaAi/LTzYcK3p8eJuTMyLD41Uu7g6fYdAhi8fFukmKFyBVd6ckmF
	 Q3SqoxNkPLvHbZgvaXssTmFCGwcY7TkSWiVokIP3sKbRlKkH4Hgh70EY5nd4XVBOJNT+X
	 a94tairvyDU41QwQZmQXmQBzKJ8MZTH3l9twUvee6divPgrR0wnAdTOaUYvIlDaxIcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QR7+RzYUX4/ytxM/0jS+GRtrp88N8Eh0P5U9HMcYULs=;
	b=VdO1rnxGA96GcxxLsZNLGSZc65sq33/uIJefYhpkSnbtIZg5/subT8WdCHGJCeAaNY3Z
	 o2H+G0R3DskQMLvTi43PaqGl+AznrpKnqOyP5NuQyBflnGuR42tdWHzwqmYVwgAQrsB/k
	 Zi+ZTeGn8GryNb6yo8+6rImOyHdYb8InxRGIMUnYToDUuhBjn7dvzccYWtUce1R1cImI5
	 R6h8Rjj7heT0wG42ISxr6djRWP6io1tsXX7ewbCHL/S5RdeXSpa77pyUmpscrxgR0qtq5
	 S+qDdgQqpv9msONT/Qir2cVzBUByk4jhcKBWeHM4M0+cVBd6MuuChYFJoj6kS7qq1eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=LZnZwqIP;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74739606D803
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74739606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=LZnZwqIP
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eafa528803so500857e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793854860; x=1794459660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QR7+RzYUX4/ytxM/0jS+GRtrp88N8Eh0P5U9HMcYULs=;
        b=LZnZwqIPLNiW/LkeN+Xi5RGlvG+O4sAM7NnpKwL43FPimrkLcrBwL15K68PJZsh8KC
         o7LvxQEIcVJ0rscn6F+EryafDWE39Kg5wzMSPY24vZE+ZxqF6yThDoU6udh0EEhhSsf+
         6ICXJDAduAmldpglFRuXAGGei4Ius2MUJgCtEIs+HzWK+UFwGMhMNNvr3FRHV0rVoanv
         m/k0Z95n81kNu3xoGNd9ZuHZTZUSAd6Cvx1lQ854/+sZmlStb47InAO7egF3oY4pfddl
         tgRo3Kg4OQJZ8HWbKWvdGCD++TYNYbbraU+9Nj2Cj69/c2OOof0ApKY6vPs5idualmlG
         okcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854860; x=1794459660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QR7+RzYUX4/ytxM/0jS+GRtrp88N8Eh0P5U9HMcYULs=;
        b=xlxaaaWp24705MnM7lQobcOgQ9WFEYfyQmC54JbbWbpROrcWwHJdmP0PiweUblKT4O
         ThdwC/5INevtMHMbI1Xotmujm7EgCxeOKWrRit1+0Dxvf1/cz9+7V5q/DqMAYHO1fpr0
         PueFdfF9lElgLl9WxamNIJyRk53y3/9Gg7zesggaLJ+pznYJwW38ynv8Sc3GKBevHRsp
         S7Vm206Gbd7aSoppDZFdxTRxuOddeXyPVCWZ0wnCPrGZG1s27UeZiqvYiDin06ws0Tfm
         pSaZP4jBf2fR+PdGKUvPKP7BJaN6kT3QAymwBk0QTq1RFArcBWkVsqOtl5XdbbyYFD65
         uk1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxxA3nSIDZD1eIUrI+k1LCamCT3glXApbZEP+TSEhlLLA8OxezKXdXG78upWNh/y8WEEO12KqwydyvOR50=@vger.kernel.org
X-Gm-Message-State: APuU4Z99vQQn0lo+W7NqqxxzqSP/KyaLU4F8lWDqG4wi7FK7DSuzU5R+
	hH9ErZQTDMhyz2Ku8VT1I0WHNZuKR/shOI04V4dZCoQtC3sx9iw2sj2zVHpibOAYi7M=
X-Gm-Gg: AYBFou0eG4AP/iD166FEANsC1Odjq7+XkhlrAiJZ5tItpv5O814s4NjK3Z9gEvEPqQd
	tMnui4RsrYqsxcQ72bg8B38VL3l+CfOyQrDYIB887SEML3BTubqn8w649DYS4kIJl3ZXO5EF/p5
	7e/bi80UjWdZYk+IU9I++xqfCU3RLpATbzdEhiXcGXw5mdZGwlp4oTDPERLW4sYpV9rV7LN8o7h
	KzrctQ97Yb0qtEsH+OQ9LBN3jVd2zNUJTDJPobbYd5RW36ha73muNOXRCDEEivCX+LMXCI93Zrj
	h3iQG+nB/tjmk0u3DqJDdCCsU6/bqP1F5qThShmr/hJQGjhVwXjgMr/y82ZiVOofHgePVxgg4VY
	y4hQngebgKlSRjDgL4C/NhgLsAv29XzfSE6OrCL+wkZK0KMRxF4Hyam0xn6XuEFl/s82SjeCOSZ
	CTcP/4lYfhYutpMLfDKjJQxH3khq2jwOCHuJyf0UFllrjsWxZISUZSw0ryFD987qBKElpjIdTc0
	W/ImFZi2b9QiexUiznlU1Hv8NBuC+ltczOMSVfOQXSkuHC18gul2JOo5n5pWNNDbWFDjIM44zXl
	yS2KWBTjQD7vH/Mn5fhXg/JDl+kKczfOxDVOVMckfKZK5eiKgELoPA7Ckpf+lW1Ee/4GsnwABkL
	/A3WwwPLnRtSbLmXVmM5UdtnWKIVN9Vk1E42m7dBzoK3OS9FazQ==
X-Received: by 2002:a05:6122:512:b0:5da:9b81:1aa4 with SMTP id 71dfb90a1353d-5ec6870c946mr7158777e0c.5.1793854860291;
        Wed, 04 Nov 2026 21:01:00 -0800 (PST)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d9d62bsm3305282e0c.8.2026.11.04.21.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:00:59 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	graf@amazon.com
Subject: [PATCH v5 2/6] kho: support incremental entry publication in kho_block
Date: Thu,  5 Nov 2026 00:00:48 -0500
Message-ID: <20261105050053.3063001-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
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

To allow LUO sessions to be frozen and committed into the outgoing KHO
subtree from userspace ahead of reboot, kho_block needs to support
publishing entries one by one into a live serialized block chain while
new blocks may still be preallocated or shrunk for uncommitted sessions.

Currently, kho_block assumes outgoing block sets are populated in a
single batch during reboot() before the chain is exposed: preallocated
blocks are linked onto the chain immediately even while empty
(ser->count == 0), and reserving a slot increments ser->count before the
entry is populated.

Address this by keeping preallocated outgoing blocks unlinked in
kho_block_add(), linking blocks lazily only as entries are written. Add
kho_block_set_it_append() to copy each entry into its slot before
publishing the updated ser->count and next-block link via
smp_store_release(), paired with smp_load_acquire() in
kho_block_set_it_read_entry().

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kho_block.h     |  1 +
 kernel/liveupdate/kho_block.c | 86 +++++++++++++++++++++++++++++++----
 2 files changed, 77 insertions(+), 10 deletions(-)

diff --git a/include/linux/kho_block.h b/include/linux/kho_block.h
index 93a7cc2be5f5..a9e696ef3e08 100644
--- a/include/linux/kho_block.h
+++ b/include/linux/kho_block.h
@@ -100,6 +100,7 @@ static inline bool kho_block_set_is_empty(struct kho_block_set *bs)
 
 void kho_block_set_it_init(struct kho_block_set_it *it, struct kho_block_set *bs);
 void *kho_block_set_it_reserve_entry(struct kho_block_set_it *it);
+void *kho_block_set_it_append(struct kho_block_set_it *it, const void *src);
 void *kho_block_set_it_read_entry(struct kho_block_set_it *it);
 void *kho_block_set_it_prev(struct kho_block_set_it *it);
 
diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.c
index 0d2a342ef422..2813c6fd593c 100644
--- a/kernel/liveupdate/kho_block.c
+++ b/kernel/liveupdate/kho_block.c
@@ -16,6 +16,12 @@
  * array of serialized entries. Multiple blocks are linked together via a
  * physical pointer in the header, forming a linked list that can be easily
  * traversed in both the current and the next kernel.
+ *
+ * Outgoing blocks preallocated via kho_block_set_grow() remain unlinked until
+ * entries are written into them. Callers publishing entries incrementally into
+ * a live KHO subtree can use kho_block_set_it_append(), which populates each
+ * entry before exposing the updated block count or next-block link via
+ * release-store ordering.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -93,9 +99,7 @@ static int kho_block_add(struct kho_block_set *bs,
 	list_add_tail(&block->list, &bs->blocks);
 	bs->nblocks++;
 
-	if (last)
-		last->ser->next = virt_to_phys(ser);
-	else
+	if (!last)
 		bs->head_pa = virt_to_phys(ser);
 
 	return 0;
@@ -129,14 +133,15 @@ static void kho_block_set_shrink_one(struct kho_block_set *bs)
 	last = list_last_entry(&bs->blocks, struct kho_block, list);
 	list_del(&last->list);
 	bs->nblocks--;
-	kho_block_free_ser(bs, last->ser);
-	kfree(last);
 
 	new_last = list_last_entry_or_null(&bs->blocks, struct kho_block, list);
 	if (new_last)
-		new_last->ser->next = 0;
+		WRITE_ONCE(new_last->ser->next, 0);
 	else
 		bs->head_pa = 0;
+
+	kho_block_free_ser(bs, last->ser);
+	kfree(last);
 }
 
 /**
@@ -144,9 +149,9 @@ static void kho_block_set_shrink_one(struct kho_block_set *bs)
  * @bs:    The block set.
  * @count: The target number of valid entries to accommodate.
  *
- * Dynamically preallocates and links preserved memory blocks if the target
- * entry count exceeds the current total capacity of the set, ensuring they
- * are available during serialization/deserialization.
+ * Dynamically preallocates preserved memory blocks if the target entry count
+ * exceeds the current total capacity of the set, ensuring they are available
+ * during serialization/deserialization.
  *
  * Context: Caller must hold a lock protecting the block set.
  * Return: 0 on success, or a negative errno on failure.
@@ -318,6 +323,7 @@ void kho_block_set_clear(struct kho_block_set *bs)
 	struct kho_block *block;
 
 	list_for_each_entry(block, &bs->blocks, list) {
+		block->ser->next = 0;
 		block->ser->count = 0;
 		memset(block->ser + 1, 0, KHO_BLOCK_SIZE - sizeof(*block->ser));
 	}
@@ -348,6 +354,7 @@ void kho_block_set_it_init(struct kho_block_set_it *it, struct kho_block_set *bs
  */
 void *kho_block_set_it_reserve_entry(struct kho_block_set_it *it)
 {
+	struct kho_block *prev = NULL;
 	void *entry;
 
 	if (!it->block)
@@ -356,15 +363,73 @@ void *kho_block_set_it_reserve_entry(struct kho_block_set_it *it)
 	if (it->i == it->bs->count_per_block) {
 		if (list_is_last(&it->block->list, &it->bs->blocks))
 			return NULL;
+		prev = it->block;
 		it->block = list_next_entry(it->block, list);
 		it->i = 0;
 	}
 
+	if (!it->i)
+		it->block->ser->next = 0;
+
 	entry = kho_block_entry(it, it->i++);
 	it->block->ser->count = it->i;
+	if (prev)
+		prev->ser->next = virt_to_phys(it->block->ser);
+
 	return entry;
 }
 
+/**
+ * kho_block_set_it_append - Write and publish an entry at the next slot.
+ * @it:  The block iterator.
+ * @src: Entry data of size @it->bs->entry_size to copy into the slot.
+ *
+ * Copies @src into the next available slot before updating the block's entry
+ * count or linking a newly occupied block to the previous block, so concurrent
+ * readers never observe an uninitialized slot or an empty block.
+ *
+ * Return: A pointer to the written entry slot, or NULL if the block set's
+ * capacity is fully exhausted.
+ */
+void *kho_block_set_it_append(struct kho_block_set_it *it, const void *src)
+{
+	struct kho_block *prev = NULL;
+	void *dst;
+
+	if (!it->block)
+		return NULL;
+
+	if (it->i == it->bs->count_per_block) {
+		if (list_is_last(&it->block->list, &it->bs->blocks))
+			return NULL;
+		prev = it->block;
+		it->block = list_next_entry(it->block, list);
+		it->i = 0;
+	}
+
+	if (!it->i)
+		WRITE_ONCE(it->block->ser->next, 0);
+
+	dst = kho_block_entry(it, it->i++);
+	memcpy(dst, src, it->bs->entry_size);
+
+	/*
+	 * Ensure the serialized entry is visible before exposing the
+	 * incremented count to concurrent readers.
+	 */
+	smp_store_release(&it->block->ser->count, it->i);
+	if (prev) {
+		/*
+		 * Ensure the new block's first entry and header are visible
+		 * before linking prev->ser->next for concurrent readers.
+		 */
+		smp_store_release(&prev->ser->next,
+				  virt_to_phys(it->block->ser));
+	}
+
+	return dst;
+}
+
 /**
  * kho_block_set_it_read_entry - Read the next serialized entry from the block set.
  * @it: The block iterator.
@@ -380,7 +445,8 @@ void *kho_block_set_it_read_entry(struct kho_block_set_it *it)
 	if (!it->block)
 		return NULL;
 
-	if (it->i == it->block->ser->count) {
+	/* Pairs with smp_store_release() in kho_block_set_it_append(). */
+	while (it->i >= smp_load_acquire(&it->block->ser->count)) {
 		if (list_is_last(&it->block->list, &it->bs->blocks))
 			return NULL;
 		it->block = list_next_entry(it->block, list);
-- 
2.56.0.398.g882cbad275-goog

