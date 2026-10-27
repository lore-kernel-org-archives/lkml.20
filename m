Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117566;
	b=0U4jdasd/JDIfbTuF20oBmbhs+hcKiV40Kg9m8oxwlLaq/Tr/vxnF/WL10ZY9qBZTElf
	 gPdeZTK0jimDluYEtKVcgjczW7R3It3Bqm8R+GbUb7aJ81hPCAK8mbmFg860XpC8xWrBc
	 TDKU/Gip3kjuxtgGkTLgfWPF/Hgzxt+xba5/vTW/XvGIVP9AtpMZKVnmghjBNnS79d+OX
	 1yTqdyC5XVHVJNlfzC+sv6pYjYBTT1QToEp4beKf3cMhuik33OAoBF6AuqVziyPtyN45k
	 Bo46uKt/4MKPDyBxLJGNtafCmmHUvldUi6vQE3MXWSctSyIiBYbd5c2VXLjnUtgOBCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H2JU4hnXGHPQ1uce7Tn8xfVvyIR1SgV6yrtF0fmEwuc=;
	b=AwwbR++5/Ymg20Mgy382k3HLE/mLI97hxCL9ialNXTggMOzBf7LjwSmaAlHKVXEW9aWM
	 9bl81H53BW9YFLcVLpYS7jrovRTJdPjqri48ToDUYodWh77hSnqN1DhlEipeqyzCRGfEt
	 ijuc9yw72VLKjUQsK9cjEZBg5Ylm//cliSztwLVRRFZazVHr9a/QEE5Cpdfc0+3+aTIC2
	 dk1mlOaxUjr+Q54HYaA3yWiAIQse6w4BoR9RYIlUDeJ8Dl2lzl13j2C9LZCZLec6hTrXe
	 I9XgLi6FPBYdNI7Js2dv4cNpbrU5Gkn7qLzs8ljCR0i11H0+WYWHIUCBDS6jNJXPPUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CG1x+ZfW;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B20606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B20606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CG1x+ZfW
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so48720a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793117565; x=1793722365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2JU4hnXGHPQ1uce7Tn8xfVvyIR1SgV6yrtF0fmEwuc=;
        b=CG1x+ZfWRDhvdkQBJq7mbtL55ObdADPs4IxuxxUaFkF7M3Y7mXQp8u4pXJ1K30gjRM
         1VKOaBjEtekTBWCMUxTa6U6RaXxagaNmu3JNbZn4CJnwv3UTpXaG38cjFLIhjeKJevKa
         +Ur/mlxcCw8aSkxgg57A1zlSRthl4TRnEVSZ/4C/9a/7DD80nY9iwNUN2Imsx6nBmkXF
         rx9GEgZSP9FHA31LhRsltMer9Daf/xraPZnCaxyQw2pYXWnCyfjKFBUJmRRAwiOTIRzJ
         +NMvDGHeHfykBAAE10HyENW/ksYMB+wA+gcEVwPGPxM6Dzo95OH97M8zWdq4zAdpemqP
         S6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117565; x=1793722365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2JU4hnXGHPQ1uce7Tn8xfVvyIR1SgV6yrtF0fmEwuc=;
        b=hiWtZBigAkz0zxq34MDdRyIsskOpcb2+Lj7RtPObhNSfOVAfi3o8FXxEDnY4lVA31b
         icVejddUFV/YPmwamCV4We/LU/qPpJ52t3qs11kjmxLgRSmCH5buXPEf3TBMwJB0CRPt
         9V2IAim10wQ5IeO6Cq9UyS7TjeL2xPve3VOGhZboyoQv0h+J99yu2FZWF5khZwQLE5+c
         OeBdjlLEYwWB6XWDZWWh1vzIoWXBZIRFhvcTgxz5Xlf6tqbE84NSPnBgxGEo795ek/Uj
         bFSYB6rw3VTkul5C1XmLqbHg+a/WlHFQ+B3cavcdNyfFMJpjL0I5OEufMyilAePXunXM
         0AQA==
X-Gm-Message-State: AFq9FYJ/ahzvsOlLkKfrGc5woiU+jYz8hkOGpPLnJG/QMOyHShTUwlIz
	fTnDoCsWdXCoPtxIru4Cxftqp9qaIJzLDp1WUKckP1yRpMRXpCShZAWC
X-Gm-Gg: AYBFou3Kwj3UyMBt99nXhDPujkzjKA1gr9rKTQxcdw+72VJSUa+sPWqKV1Mz/IjEu0s
	9vW6ZoglmzKsmIc2r8uLYbGQ3940xdJJHfVlIKAc2cFZZmJxOA7XpYHu/3hbffB+6QLxUjyMFSX
	Rp+gUms+P2d1G5u5ZnyTeSwRemTWcPrXJvNAfJG9vTo/IbeUDODYbMOXfhPUipO9wLGHGZlbKU3
	MhGhzvkNW6xcjw8hxpY3EWRGYqEFxr4LYnb44XdvR2nuekyiyMFtag3clMmrYtFa1L0vrPU1Adl
	HQmCHohr8vdUbq4xKlA08VgGFK/OdGv54ycrSzJUXl0U9OrJ3IPJDL+8D7XIKMUcNDqs4YJeqV7
	LlgvWwMu11fQXCEusozblftLc4AzNh/7yNC7IojLXVCJvvmyibS9AsJWUZVJB0uNkcuf7q1BCc9
	x/EOzVl1luHLFcDa+v1ZyDrDPam1iv6/uLLU1ZPfgJ1U30uX4UsDP5Cs/FLpwdY0z1I5uWNmeSo
	QLxh8GjRdySdvfOSSvB9LMRSbv646DKXyXe7xNFxXFPVrxigIHXmvcyadvXf1T69mMTXohWg9fr
	38nzuTMZD2p0W0gVcgY=
X-Received: by 2002:a17:90b:1b0e:b0:3ab:9c73:12f with SMTP id 98e67ed59e1d1-3adeaae626amr8746577a91.24.1793117565124;
        Tue, 27 Oct 2026 09:12:45 -0700 (PDT)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4066d631sm4483494a91.17.2026.10.27.09.12.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 09:12:44 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huaweicloud.com,
	kasong@tencent.com,
	linjh22s@gmail.com,
	kunwu.chan@linux.dev,
	kees@kernel.org,
	gustavoars@kernel.org,
	tglx@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v3 15/18] mm/swap: reuse per-CPU queue readers across priority changes
Date: Wed, 28 Oct 2026 00:12:17 +0800
Message-ID: <bea2aebe1693ded274563505d92c48c4b63db46a.1793106426.git.lianux.mm@gmail.com>
In-Reply-To: <cover.1793106426.git.lianux.mm@gmail.com>
References: <cover.1793106426.git.lianux.mm@gmail.com>
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

Inserting a new priority allocates a replacement per-CPU reader array
even when earlier ring removal left enough storage. An unnecessary
allocation can add swapon work or fail despite sufficient capacity.

Track the installed reader capacity and retain its high-water mark
until the queue becomes empty. Reuse existing storage when the new ring
fits, initializing every valid ring index for the new topology. Prepare
larger storage outside the writer only when growth is required and
recheck capacity under the writer before publishing.

Preserve the existing prepare/install ownership and failure rollback
protocol. Device removal continues to avoid per-CPU shrinking allocation
under the writer.

Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 7b3520ce1e41..5b6492b1bdc6 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -201,6 +201,8 @@ struct swap_queue_cursor {
 };
 
 static __percpu struct swap_queue_reader *swap_queue_readers;
+/* Keep the high-water capacity until the last priority ring is removed. */
+static unsigned int swap_queue_readers_capacity;
 
 static inline bool swap_device_masked(struct swap_info_struct *si)
 {
@@ -240,7 +242,7 @@ static bool swap_queue_needs_readers(int prio)
 			return false;
 	}
 
-	return true;
+	return swap_queue_len >= swap_queue_readers_capacity;
 }
 
 /*
@@ -288,13 +290,15 @@ static void swap_queue_reset_readers(void)
 	}
 }
 
-static void swap_queue_install_readers(struct swap_queue_reader __percpu *readers)
+static void swap_queue_install_readers(struct swap_queue_reader __percpu *readers,
+				       unsigned int capacity)
 {
 	int cpu;
 
 	lockdep_assert_held_write(&swapon_rwsem);
 	free_percpu(swap_queue_readers);
 	swap_queue_readers = readers;
+	swap_queue_readers_capacity = capacity;
 	if (!readers)
 		return;
 
@@ -431,7 +435,8 @@ static int swap_queue_add(struct swap_info_struct *si,
 	}
 
 	/* No ring at this priority: insert a new one at pos. */
-	if (!*readers || nr_readers <= swap_queue_len)
+	if (swap_queue_len >= swap_queue_readers_capacity &&
+	    (!*readers || nr_readers <= swap_queue_len))
 		goto failed;
 	new_queue = kmalloc_array(swap_queue_len + 1, sizeof(*swap_queue), gfp);
 	if (!new_queue)
@@ -459,8 +464,12 @@ static int swap_queue_add(struct swap_info_struct *si,
 	memalloc_noreclaim_restore(noreclaim_flag);
 	kfree(old_queue);
 
-	swap_queue_install_readers(*readers);
-	*readers = NULL;
+	if (swap_queue_len > swap_queue_readers_capacity) {
+		swap_queue_install_readers(*readers, nr_readers);
+		*readers = NULL;
+	} else {
+		swap_queue_reset_readers();
+	}
 	return 0;
 
 add_to_ring:
@@ -503,10 +512,9 @@ static void swap_queue_del(struct swap_info_struct *si)
 	}
 
 	/*
-	 * Shrinking the small topology arrays is optional. Keep reader storage
-	 * until a new priority is inserted or the queue is empty: per-CPU
-	 * allocation must not run under this writer's noreclaim scope, which
-	 * can grant backing pages reserve access.
+	 * Shrinking the small topology arrays is optional. Keep reader capacity
+	 * until the queue is empty: per-CPU allocation must not run under this
+	 * writer's noreclaim scope, which can grant backing pages reserve access.
 	 */
 	gfp = GFP_NOIO | __GFP_HIGH | __GFP_NOMEMALLOC;
 	noreclaim_flag = memalloc_noreclaim_save();
@@ -549,7 +557,7 @@ static void swap_queue_del(struct swap_info_struct *si)
 			swap_queue = NULL;
 		}
 		if (!swap_queue_len)
-			swap_queue_install_readers(NULL);
+			swap_queue_install_readers(NULL, 0);
 	}
 	spin_unlock(&swap_queue_update_lock);
 
