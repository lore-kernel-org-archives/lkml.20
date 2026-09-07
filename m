Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7BE43C05F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767955; cv=none; b=Wm9/LDZNdxE0sMng4oCNvPWZCDlHarkXmq2BIgEdG4IUJ9vMG51Vm/t2nPPRew5gjDjzcPU1IPauG9dDrX67mVZEIliLGLsbejxO9jisCmbsgs2ekVwnLAqNoeVr9ZeCHgRwM6Bvh77jqPwg0JZRIVJm3o442YEJOzvre1F7V0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767955; c=relaxed/simple;
	bh=VleNXxNv6kUzTW9segszUOA38jVkurmOblKAIMobB+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZTeG43m0OkkBhCpUQJHLyEahIFFKpYRDAiXRQ0ShdiMTLDre5uRurOTSKyeTt4z/OWqsf8gh/+q/amoqB+fS53v8TB8b5UsqwM4eRyWaApNeEygrVwig+2oPRNNqyDSRdG9LIeC4Aii10EBKbyF92N6EcnFyO55nuar+DgWlFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqXQX0Dq; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqXQX0Dq"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2db59f54ccfso3478715ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788767953; x=1789372753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgnAw92EwmUeU2oW2/uLp9LZpH/LZFtVVfxD7vPweRw=;
        b=mqXQX0DqFx+vtaKN5HlCXUMjvHypnRiR8I+pHzisKR6VtiCIliElLnmu1vDlvKj2XZ
         px3DrxGto7XdfWqFJbE/60Zb6SI+C2rrLOgRFIQZ8Rs7e/NNU0PBL61TUntlNVCW1m9b
         ATlCtzKIzGAAraz5PVQoFu4pj95H3rp2jp7Vk9aYw3U3hZLgW1u0jOWAuaEVvAHj9uEZ
         yDhuSHi6wgA98TK+kGvYCuQ/EHSB5dif8ok1SxJ6R5W5Xb/EgDx1v4yi2nr8usUWLUMH
         K07RzPwodS8Wq++T049Y1aAmhvfkfYMyyDwI7OVyMZTgQshialaPQXR4DIeA4VFWOl9y
         R64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767953; x=1789372753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EgnAw92EwmUeU2oW2/uLp9LZpH/LZFtVVfxD7vPweRw=;
        b=L1tRoyCMNGS2tvudLNy0F4GAhwonZDpFxMFVL4PJNCK1UvMnbNw3RGJBSKRgvyhl+G
         +LhEnb4FGJHyr3V4rm3XOSf+uhsycUecqKY0WQ2eRIYhV3mSgUV+8tNPOmdd2Jex2/Qi
         EhP6YaV8aD1E7Wdb9Y/E3c6SsaGouch+TWuFceZ1ViN2g9uIJIpcfO0xDnTwfdBx8JiR
         ues84Vg2FqrlJsrRTh0AwT/wIypnz7w25uyv0PMZ2bzhfp8ArORB7t+N6XY9Q3mIWeHG
         6CEr7NgAVxYTYRPbb49Kdpwo+dgnls6AMoOVYrziXSoYGo4txFvps7bsxmnnPpGAon5g
         Kj+A==
X-Forwarded-Encrypted: i=1; AKwUvByqM5BfUPnQCimZnCSI6yu8yon4aj22Plnxnl3ELpvfZ67MIO5O3YDNm1Wl1qTVPq6ofZTu+Bza2vf4UzA=@vger.kernel.org
X-Gm-Message-State: AFuF++ne2UIvyg6NnzLwPKls3Oh2fUe8CvppaypF12BuL3M8dC7xvWJO
	kxuENeb5OVoJ13iIRyJz60yftOMtQ8SCPosSPZ1B2cx/zXubhQmi8u4lxLipKBFwL9w=
X-Gm-Gg: AYBFou1OYEyt1Ecw337/wN5QLt8zCvf9Y4gwC8+NTP3LZXiNBJbjT8gaq3GePwZ9MzG
	5dtgwMaP6gUD20QxuvJyFH7QErbggou8LXjnzzq/8PGz7FjD6quhSTqgKSnnUpbK+/P+/vvG8ls
	TFHhrSsX080GlGIztiVLDNouLnMSB6qTwdwTrIeIiXChmTE4wi2Q/N6Ja+TirXx4x6KPd/YdItF
	3JofNN0FmNAdhJi+wCL/9GcgVJGixoqfQNuQNnTysPnZiM4QL0eZtaPJV6x+zzNUgzbsEnMJQgB
	3kQkLmwiefmTYt81KmHPeCfwtaQFq+iofbCVJ2PuoMj7CvFWI33Qt5SZILDD9/Vn3pTj1VuehpN
	biRA82qD7mjbM/SirVt99U4AUpJ/JpYE9ZNB2zyQECDB38DqjlE7BuBlaC4sutcwlsMjKHXkS+r
	1WytfPL5HXbdG5OjPC7N7nWGqf+JpHrlbZY2DItlNPjJ2XrhDOVNIYi+nDPyYIShzjNEFP73Mop
	t7T+5E=
X-Received: by 2002:a17:902:d58a:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2db124a8c93mr317203775ad.7.1788767952642;
        Mon, 07 Sep 2026 00:59:12 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae7637sm40945595ad.79.2026.09.07.00.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:59:11 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: paulmck@kernel.org,
	jiangshanlai@gmail.com,
	josh@joshtriplett.org
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH 08/13] srcutree: Forbid srcu_expedite_current() on atomic SRCU
Date: Mon,  7 Sep 2026 15:58:24 +0800
Message-ID: <20260907075829.2073224-9-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907075829.2073224-1-kunwu.chan@linux.dev>
References: <20260907075829.2073224-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kunwu Chan <kunwu.chan@gmail.com>

srcu_expedite_current() has no early guard for atomic SRCU, so calling
it on an atomic srcu_struct leaks the expediting callback in
__call_srcu(), leaving ->srcu_ec_state stuck at SRCU_EC_PENDING.

Add the same WARN_ON_ONCE()-guarded early return used by the other
forbidden APIs, and list srcu_expedite_current() and srcu_barrier() in
synchronize_srcu_atomic()'s documentation.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/srcutree.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index 74acd5645d4c..2d2a12f86115 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -1972,6 +1972,9 @@ static void srcu_expedite_current_cb(struct rcu_head *rhp)
  * no current grace period, one might be created.  If the current grace
  * period is currently sleeping, that sleep will complete before expediting
  * will take effect.
+ *
+ * This function must not be invoked on srcu_struct structures that are
+ * used with srcu_read_lock_atomic() and synchronize_srcu_atomic().
  */
 void srcu_expedite_current(struct srcu_struct *ssp)
 {
@@ -1979,6 +1982,9 @@ void srcu_expedite_current(struct srcu_struct *ssp)
 	bool needcb = false;
 	struct srcu_data *sdp;
 
+	// Atomic SRCU has no callbacks, so there is nothing to expedite.
+	if (WARN_ON_ONCE(ssp->srcu_reader_flavor == SRCU_READ_FLAVOR_ATOMIC))
+		return;
 	migrate_disable();
 	sdp = this_cpu_ptr(ssp->sda);
 	raw_spin_lock_irqsave_sdp_contention(sdp, &flags);
@@ -2104,8 +2110,9 @@ static void srcu_advance_state(struct srcu_struct *ssp, bool is_atomic)
  *
  * If synchronize_srcu_atomic() is invoked on a given srcu_struct
  * structure, then none of call_srcu(), synchronize_srcu(),
- * synchronize_srcu_expedited(), or start_poll_synchronize_srcu() may be
- * invoked on that same structure.
+ * synchronize_srcu_expedited(), start_poll_synchronize_srcu(),
+ * srcu_barrier(), or srcu_expedite_current() may be invoked on that
+ * same structure.
  *
  * Because synchronize_srcu_atomic() is even more expedited than is
  * synchronize_srcu_expedited(), there is no expedited counterpart to
-- 
2.43.0

