Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434827;
	b=aZMwD1p0bhLceIzGD17Jv1TyBljkus4Bhvrhs3JA8mzcUTv7fJrGAxzUrKabDrdLLOgC
	 EwQwDB4mLXUpVRyHP1BFQktT3h9zEejI+GFJlFCOOfpsVe2WJttoX8loi5Ik38M8uUPfL
	 FxCEarXHnXzht3oJGT7T6UwwwgiF3Mvd8aMF/oBms/z/GHQ0vR1f+iYDdQbgYq0C92QXq
	 sWKiO81tz71fLZ4b+mD5Fv+7uSZTeMsIqZ//Fj/UlTc6OvbWJ7hHk8bEopgbn0FbiOYNR
	 0AY2Bbtv5kQLJaCUQ5+TZInX3x+NEnFQOWLkADpirdIVQkuXwMJVBRt1jww0kKuJ8mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rDjeQ74kqFsbuOfwgsq4d2C2vasVwPuqNSs5zBgEnYs=;
	b=RL1S7iRb8ArFeGcYcuCuCKFKiqPpPO4jSkofhcvB6UllT7pYcxl03fsekOqfy3DeK8q3
	 I2Wo9bknZW/auwOkMGvgDpjYywMBRfDvEov5carGIVLGITTCkE5LU6doLzU3kCBHWskTK
	 55g1KSpNmwj1jvwv3rhRPN7wsllcJ4HpK5KUSIz6Fyd4HMvT0bIYaxaRAnBwQw41u6B8K
	 dX5+fAjL48JvvaOfAyrP1OpfMonkFpsgoDEN1qWHIl7EEgf9bSkZjJGuWtQEurBzrye4H
	 AgHPaR6sHyqEm2GVAbK8Vsb2PHxpsZEovojaCpwQNiu07BcltiV6UVObcjORe3Vtu5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=YBpIL5R6;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2BA606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F2BA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=YBpIL5R6
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-48ed188ee81so1415704fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1792434826; x=1793039626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rDjeQ74kqFsbuOfwgsq4d2C2vasVwPuqNSs5zBgEnYs=;
        b=YBpIL5R6VcBRfVCpqpu/2HwOW0DScshPBvc2o6q4sUPi51/6fCHgWAURReyv5QPIYL
         9/caeWJqSl78VdQklR3CQUj6NAf3ZEm7J667qG6jE5O6a/0aWD3/61swVix5rw0+lXqv
         PCojA1hXdzRMLYZQLRnt23lYWlMcTRwSv6M10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434826; x=1793039626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rDjeQ74kqFsbuOfwgsq4d2C2vasVwPuqNSs5zBgEnYs=;
        b=Ho1JfU7UtydXDm7NfcHHmrvUpj5YbleZdp+rFwLIl4MnfHn8huP3EgywJDRMKGi1wO
         eW8fCysMK5RF2/qnts5DssEZY4PC3r5iRw2HClq93LPh+vpVY3OPvucaLwRX2O/+Nmfb
         F0dORramv+dl8T09h7dC09kuOCw5w7sHquzTbZ2X8w/yk1j6biY/gfajl0uBstMH7E4O
         5mC7Yt6iUFmZlKjnlDyApkU+ORPFVBB77WPzrcd1s30QsHKhErclOIDSsLAesaoNZjry
         4YL1acZTh4M3MjbHT4VOk3BXlk9o0Jj5BAhCDHGPJbIclst58Btbcad9ndGPKQsEFhUy
         xXGw==
X-Gm-Message-State: AFq9FYJjONoyjHwEKEyhkOcpFjsqHDry3u86snhvjPi7j8kaNdRpidEd
	M38NLKCA5YUxM7Q8DlR0/xyXHACfqm/IYrEsZcw+yX8rEN+9bLa7Lc1Dn5GsYgSt2v6ef5GCHwc
	dxXYfhBs=
X-Gm-Gg: AYBFou3Gpzmf2QAO6vh9ZePvQhs5mhB5cunsXT3aLBRhHafUmlccMbVLuc7EEYvAyNu
	73WOom4j8lvLBO+7lKFjjvtDCKj/BJf6CGVRwbkj9LgeH3Xl88ykiPGnRfIeXDDZDqaVfZTHNoG
	wGN/iZ+g4gL4/dhti3m739O3tbyumT0RvabB8NdeOiKtf5a281fvmLykFnwvNUgKH809/MvIbV0
	xEjShD6P26trjODRqAlxAc9SYuw90wHYceYMuTBiOetDPi1eTxDoQXnstBlTWGbkoYBJ8wfUnHC
	sfTdHQpGTuRF74E0aqbvouYlsG93EtIH/t61A+eSwBSqIqL9zO6uY9oW4qvrRWCjywMo1ZjThaV
	mGj/ugm0HinBmwgvpfHT41wq/ycpy6gIAu7YTVozsbdnGCwkFzkGPrYzFxWQZ8kD3xcTrj+dCTk
	JMSaoGmoquJ7GhcSa9S//ATcx7YGaX6a2cEjuNAuY/8ZQjjN84+BL4ajvr8O0DMb89qx6bImfsS
	IQSxVoFj9THhNto9cdUMZLBmhXBOTHeD7IvBoW/ZYKGQ2e/7/qtrC/zHz1kGmajgwgaOujq9k2Z
	g0qV8/lK9g==
X-Received: by 2002:a05:6870:c244:b0:48f:e0f6:bd61 with SMTP id 586e51a60fabf-4a757b637c7mr6574720fac.50.1792434825804;
        Mon, 19 Oct 2026 11:33:45 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73adff016sm9155247fac.0.2026.10.19.11.33.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 11:33:45 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-kernel@vger.kernel.org
Cc: tglx@kernel.org,
	mingo@redhat.com,
	lukas.maar@tugraz.at,
	outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH v2] futex: Use a keyed hash for global futex buckets
Date: Mon, 19 Oct 2026 11:33:34 -0700
Message-ID: <20261019183334.29433-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006222450.42518-1-kylebot@openai.com>
References: <20261006222450.42518-1-kylebot@openai.com>
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

The global futex hash is a public jhash2 of the key, which for private
and shared-anonymous futexes includes an mm_struct pointer. A task can
populate a bucket with futex_waitv() and time nonmatching wakes to learn
which chosen user addresses collide. Shared-file keys have predictable
inode sequence numbers, so the task can also identify the bucket and
turn those timings into constraints on current->mm.

Lukas Maar, Jonas Juffinger, Thomas Steinbauer, Daniel Gruss, and Stefan
Mangard described this futex mm_struct disclosure in KernelSnitch at
NDSS 2025. Section VI-B recovers the pointer by observing futex hash
collisions and evaluating jhash2 offline.

The per-mm private hash does not prevent this: a task can disable it
through PR_FUTEX_HASH. NUMA-routed private futexes and shared-anonymous
keys also use the global hash.

Use SipHash-2-4 with a boot-time random key for global bucket selection.
Hash the three identity fields individually, without padding or the
separately handled NUMA node. Keep the original futex keys and equality
checks, and leave the per-mm hash, which only hashes userspace addresses
and offsets, unchanged. Initialize the secret before the global tables
are made available and keep it fixed for their lifetime.

Reported-by: Lukas Maar <lukas.maar@tugraz.at>
Link: https://www.ndss-symposium.org/ndss-paper/kernelsnitch-side-channel-attacks-on-kernel-data-structures/
Assisted-by: LLM
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
Changes in v2:
- Credit the KernelSnitch authors and link their prior publication.
- Add the original researcher's Reported-by trailer.
- No source changes.

 kernel/futex/core.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 095f9fe440e3..c07570ce8b55 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -42,7 +42,9 @@
 #include <linux/pagemap.h>
 #include <linux/plist.h>
 #include <linux/prctl.h>
+#include <linux/random.h>
 #include <linux/rseq.h>
+#include <linux/siphash.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <linux/kmemleak.h>
@@ -58,6 +60,7 @@
 static u32 __futex_mask __ro_after_init;
 static u32 __futex_shift __ro_after_init;
 static struct futex_hash_bucket **__futex_queues __ro_after_init;
+static siphash_key_t futex_hash_key __ro_after_init;
 
 static __always_inline struct futex_hash_bucket **futex_queues(void)
 {
@@ -388,8 +391,12 @@ __futex_hash(union futex_key *key, struct futex_private_hash *fph, struct futex_
 	}
 #endif
 
-	hash = jhash2((u32 *)key, offsetof(typeof(*key), both.offset) / sizeof(u32),
-		      key->both.offset);
+	/*
+	 * Global bucket collisions are observable through futex operations.
+	 * Use a keyed hash so they do not disclose the mm pointer in the key.
+	 */
+	hash = siphash_3u64(key->both.ptr, key->both.word, key->both.offset,
+			    &futex_hash_key);
 
 	if (node == FUTEX_NO_NODE) {
 		/*
@@ -2092,6 +2099,8 @@ static int __init futex_init(void)
 	unsigned int order, n;
 	unsigned long size;
 
+	get_random_bytes(&futex_hash_key, sizeof(futex_hash_key));
+
 #ifdef CONFIG_BASE_SMALL
 	hashsize = 16;
 #else

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
