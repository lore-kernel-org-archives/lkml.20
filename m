Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667856;
	b=oVvd6XyA97qXd2drb/r93ZME4XtnwGMtqNMUj0VPJYGhbrOlv5W+L3OBEMwCbVXhGBTH
	 mJhEawXTyCdY+5622EfO5IR2EgGcWYD45Etw0qZ9WBysSCy6bi1HHvI9Bqb+k9NLLxsbo
	 hlIy8+fiJa3s866hoWrg8wahs9sZM0sI43/0wATMrJDPzm0CjQVhHDcb10dkKwwOUToFo
	 Qu1ZionqjabYPQnhPU03917Dgo5tVZ/HdTT9HOVyHoew3XRh0ruxeJic1zTVf9cPKeGVF
	 to+qy2L9gAAM/jbHxNecPsEtNwbejXU4CuO+9ieN0Ju01vkKScBoonFm203B2F8Qlqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iDtGnnmzB8XetLwM09gGYvTUDRew+lNVR5IPpgOPUfI=;
	b=ai242MRgqtiF7aR5wK/DP7N7YIPZx6LSA4BhbnlncQowEmHqPJiUePhbrgTSH7WgfdVt
	 dWQuq5+9WIx1ZGLHsIPL+OwgVpEfghvS9Pqy3LijVSGML/wZCCYhQYX6t2ILWtiiOG0wZ
	 b1R3pOpgjl7wR1IS20jA0kUL+ikrTmktpM8AIeCKfUcu8g2OzF5qng2JPOMxNhP8zKFo1
	 Rv0ivq03SLzDJ0w+cA3UQfTGFeF0/xkfLM8uaeE/Q79fF1619ztGoR7S/yM6yv61qDm96
	 RtGAGzG1HSP1uPuvCB9UoJC2T0D/O1LH9So6GGdQruyQRR6M7tBNQLftcoxnFrwH98Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3KwirAV;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA68606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDA68606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3KwirAV
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-89d6bd67045so942490b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794667855; x=1795272655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iDtGnnmzB8XetLwM09gGYvTUDRew+lNVR5IPpgOPUfI=;
        b=k3KwirAV3wzijCpVmXtlLg2dA7gSKDFx5Wb9bPKnOz+rW8+zdED6bmG5WkcJsY/U0+
         btuprnHGz1H+ur7F4TBWjmsXVYYfWGbz69ru9dbkIY8W0f/I5sjN8SR/PJ38p1LyZJ2C
         dR2p1GNRGzc7kE4kwshemUhXbge6GbA4nuoaeHAtdNDAy4VGe/2rQYdlYWrbELuv+pf4
         V4ZgY8PAqWMo9VfxEd6cmHUVAxPcxbMt4XZyjBgbUTz1jAn4F+0eruAoSyVSXbxIC5de
         KNmUgPN71/nBLwCHK6L9Ibl5WgtcYKRKVBWn604XHYi1iCrBu5wypqR3ZNA086lBmu6d
         i9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667855; x=1795272655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iDtGnnmzB8XetLwM09gGYvTUDRew+lNVR5IPpgOPUfI=;
        b=WD8H/eJKfbIOB9U0vvYmk9jCStFZlA/sWziwtkQ5zKqTOuzv4gjZinb84f6IVN0x4y
         DvWIu0IiKQf/nb9vbvxQRGJ+11kUbrk4OH+SuT8aqOli5zHuFpn3tY1BbaGVm5oMhFsL
         2Q4JGV7EGkeLq2i6EV8h7VNGNK93QApg0zRPTzinb4wG5X+at4W7i2AVeO0RL+CCEgG1
         8bBOEFaDdRN9VpqnLe3aDtXpDDL1AGLE75ixMZ1U8gwgTX39v8QUipZgyc7cnS5G0xcx
         kHJcsKzngIPf4UHWpZk9vUpX9Ppke6eCYc3OhaCGMVkFEt+zEMC+9Xkkbcu4F2jGgyIM
         rkqQ==
X-Gm-Message-State: APuU4Z/AwfUttQhfLM1lS8fgsg9g7Y42EXgN0tu2V5W99wEMwOYfPTiN
	PHqsWtqdlW9URp3ZbyH+o3YQsIwCgazSgcTfp6PZBm3SPbzIeD+/+x4q
X-Gm-Gg: AYBFou3yoVc3j1xF1HLooAgApeTaefyw6lizDIdDapiY7hbMGxJggh1LxzUTzSthtJ9
	+sFiAzSLbS+yalXkhP9fUH+Wic3R1CAyzX82C0LdBljgG1/cd6I+7kF5a2KCR6/GZc8gbOFgkL5
	Qy36jBr3JgtuC4yjqmIaqJaySLKV8mTcDCbaxDm9RwYxey5tcVwgCf5efgEQE1/Z1GSbrld4xAL
	HH36525oE+pSwoGh6Vlp8NFqyvxCVDtn/vK/0CZSSEPN/tRDX57QTzjmIqd0FtL9A4zHHHVe7kf
	o8RIbdYlMKNXi7PaKHJHaNQHOs4ML71YEw7WZaNidtLyVL09Os1ppVh5WrD5m630eM80Xtplz5m
	MOV9pZ7FHuqeokn3smMap8RnuJx7qGnkMi8YCXxPJ7rf5eRnwZjZ7vc4FjjtbN3+1ceAv0H5O2X
	SfaxZJHM5okkLk/QxehSs8r4oDDr3mFWnMuuV5QsuPXL34buGv+DloaUA37B2DRexgRN02/Z9e5
	Arf7baNI+qiou6sNvYUxaEOJ8x7KJaTryh9HqhOBE9ZpaY/wsREXoBUu1XQKStiDRNZEwU9xYOK
	gOgz/nfRQqfA8u84dYt0K1Wpx2gCbM3E27FDqovNhjmolRqRQA0/o57Gw5818/Gq8KetKW4hsyi
	BRRrsz27cHstmpw==
X-Received: by 2002:aa7:9303:0:b0:8b9:227b:bfc with SMTP id d2e1a72fcca58-8bd5c0b5795mr6012445b3a.1.1794667855205;
        Sat, 14 Nov 2026 06:50:55 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1d5f005sm2141222b3a.29.2026.11.14.06.50.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 06:50:54 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v4 09/18] mm/swap: avoid direct reclaim when populating swap cluster metadata
Date: Sat, 14 Nov 2026 22:50:40 +0800
Message-ID: <88057ceeb0228fd33f42637a3c9647eea74d5d95.1794666741.git.lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794666741.git.lianux.mm@gmail.com>
References: <cover.1794666741.git.lianux.mm@gmail.com>
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

Swap cluster population is entered from swap allocation and may itself
need memory for slot metadata. Its fallback drops the device and cluster
locks before allocating with GFP_KERNEL, which can reenter swap
allocation through direct reclaim.

Make this allocation boundary explicitly non-reclaiming so callers can
retain outer synchronization without a recursive swap allocation.
Clear __GFP_DIRECT_RECLAIM from the fallback request while retaining
__GFP_HIGH and __GFP_NOMEMALLOC. The retry can still wake kswapd, but
fails without direct reclaim when memory is unavailable.

This can make metadata allocation fail earlier under memory pressure.
Keep the existing isolated-cluster rollback and restrict this request
without adding a task-wide PF_MEMALLOC scope.

Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index c46b43414bf4..fae862fc873c 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -586,13 +586,14 @@ static void swap_cluster_assert_empty(struct swap_cluster_info *ci,
 }
 
 /*
- * Allocate swap table for one cluster. Attempt an atomic allocation first,
- * then fallback to sleeping allocation.
+ * Allocate swap table for one cluster. Attempt allocation under the locks
+ * first, then retry with the locks dropped without entering direct reclaim.
  */
 static struct swap_cluster_info *
 swap_cluster_populate(struct swap_info_struct *si,
 			 struct swap_cluster_info *ci)
 {
+	gfp_t gfp;
 	int ret;
 
 	/*
@@ -610,9 +611,11 @@ swap_cluster_populate(struct swap_info_struct *si,
 		return ci;
 
 	/*
-	 * Try a sleep allocation. Each isolated free cluster may cause
-	 * a sleep allocation, but there is a limited number of them, so
-	 * the potential recursive allocation is limited.
+	 * Drop the device and cluster locks before retrying. Metadata allocation
+	 * must not recurse into swap allocation through direct reclaim: callers
+	 * can retain outer synchronization across cluster population. Restrict
+	 * this request instead of granting the task PF_MEMALLOC, which could
+	 * give allocator hooks and failure cleanup reserve access.
 	 */
 	spin_unlock(&ci->lock);
 	if (si->flags & SWP_SOLIDSTATE)
@@ -620,8 +623,9 @@ swap_cluster_populate(struct swap_info_struct *si,
 	else
 		spin_unlock(&si->global_cluster->lock);
 
-	ret = swap_cluster_alloc_table(si, ci, __GFP_HIGH | __GFP_NOMEMALLOC |
-					     GFP_KERNEL, false);
+	gfp = (GFP_KERNEL | __GFP_HIGH | __GFP_NOMEMALLOC) &
+		~__GFP_DIRECT_RECLAIM;
+	ret = swap_cluster_alloc_table(si, ci, gfp, false);
 
 	/*
 	 * Back to atomic context. We might have migrated to a new CPU with a
@@ -3160,9 +3164,8 @@ static int swap_device_disable(struct address_space *mapping,
 		return err;
 
 	/*
-	 * The swap allocator doesn't take swapon_rwsem. Looping through every
-	 * cluster lock after clearing SWP_WRITEOK ensures that allocators see
-	 * the updated flag and that no allocation remains in flight.
+	 * Drain cluster-lock users after clearing SWP_WRITEOK, so swapoff
+	 * does not race with operations that started before the transition.
 	 */
 	for (offset = 0; offset < end; offset += SWAPFILE_CLUSTER) {
 		ci = swap_cluster_lock(si, offset);
