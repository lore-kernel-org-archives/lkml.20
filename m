Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1538542E01B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767952; cv=none; b=jc8+I/yKAUfv6T5JxootWr3cGl5BLieEPhJyAwTRG3933RonZYJYBgn5y/NjvtIl3QBZh/J5kX8zJ8FS8MBE1Gm0NMlsuoAofHG4TkRUwBbAe7FCphoTzp+jX3DY2VQlAhpVurKsokokYv+fanrbwW2MXyJ5EkOvXaaDdyWJq34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767952; c=relaxed/simple;
	bh=3OlCz+laqH6rl0bpjSr713iDWvV7K05sGtsflbnXZRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e9QoqhZ4bcSIcS/UjHbA6WL0YEN/yfFqbHPWdImO4Jp2HrjkByFn8JIBqPd3/zFh2mdxToWge3m5wgd7Hg6GhOU+YU3CLdhwOYHCO4El8suZ40VrXGXcpJ06MQccv9omaLxwWj+4L/p9pLZS3WxATrZLrYenZ7Kzl0Wh4yDQH2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r9p54H6B; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r9p54H6B"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceab75934dso31010275ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788767949; x=1789372749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+pwFM3pOh2VpEH5TcABiF5v+6kZ668JjyW4E61muF/Q=;
        b=r9p54H6BzCL6eiU5WZn0eK3f5oVJls2dtSt+S1p3oiTcKQGriZ8ILD8Be4Aa4kBdNC
         KDc/YZyA4rpE3DYx27Ou9WXFXrE1HjtyIdMwayrTsjcarz7/1LXtXDDjSIaVDXo2v5oa
         KrZ+xaxXoPmL1ub9T4B1P0+alM2CtKtTNzA/cAW9z0A06Kouh/0fHG4nojaoUoBuX/iC
         NFDulwtWS0kNR+jDfg/FDwYBdEFvN/D5w8VSD6iF8Nq1uu7hgnjw0QRd8dGNUATGSoEc
         tb+nwUZeP8LuQGtzEgfrR7KN0/5exKmYidVRLBy+gN7LfaBl0WW7alYcBJudgrmmOXPq
         OLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767949; x=1789372749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+pwFM3pOh2VpEH5TcABiF5v+6kZ668JjyW4E61muF/Q=;
        b=EZI2FSoRd6p1k7Kly2J8OpjLfeC2pD5ts7AMjx2X0QA3Nh41c6WDA0nb+wZt3c8pfm
         2QNUT1t3CaedT40xYd7DwckwseNg8WE/x6fp9t9RqdS5+bH+vt4SdeoZwtbGPukLsITq
         a9zSA4kTCrtvBkvd6a+loGchjTWBi+0JYeZWgZxCSc1i6s3H6oY36xHvpOo1AkAJTcut
         sMIT5aOfUzeNN6dhT8POOABiruxdys4VtkPBp/w/tiT5o+3nQftsnDDm5QfrsWLkU/My
         U/Xjdvj+OBjWlInRN4SjzBMK/dTfazfodQMXXifMRpGH3Ri/oYw2vGYFo/3QfH6ZV1wN
         EeBA==
X-Forwarded-Encrypted: i=1; AKwUvBwRUuKrjQVNADwPetfO6TTd9aGTbdY+nu7ud2/5MJ5pgA8wPbEwX57CuWoD86IRx14+QLdgBoRkz1YB98Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lwm4hzSD0VICLJNjxIbJbvM/V/zm4nIzTQzgGbsBx0v5KA0wCx
	8lutBhXFbUKIbr3OB7ZQ4vJls/J5qw4XuhxR4AnOZc/CrhYCR9w2GXIU
X-Gm-Gg: AYBFou2xE+tIFi/WUpyj3SWXcu1t6+iRNrFMKRhnBE9JrYMUVnP+KpXtiHTIvRoMYvC
	hKzQHo52+w/UjiD4wWrpiqmCjqxgaSLw6w16doJbLYsF8kIeFpQqI2/fxyOiKnT1bCySTXWPmch
	Hc9RMHAsucvoywtrpn0CrJk3iHBthHBsHGux6KzcmD6h4vD03azCA86Q7ZDR8SZ2Fvf+m7gDoWS
	9dCEHplq15LGKBGAmG0Ehy9iWgsYyzdC17yBfojSdXtcOpmqg5+Ocyeeq0n3BLXlIM9VSC4Xs61
	/zdJgfT0OS0BsTjRtLn8q3N+MpRLbZhrPdmxGn0b2UK8aRGRRbn6pi9SCuzOQy6DxCqxwgQvxBn
	I7Fo6XILvb0/TlsANRo+vJVo7wsTUww7b3K2icywcQ49MvrWElOdX+mz+sAyGDXb/Ej7No8YHeX
	I5cTybb63F01ld9AsjpmxyRcyxlvEuGICtfuzoUQf87irogPmScNoTWogdP1nSdBVyjLx3Amj1y
	UnCTt8=
X-Received: by 2002:a17:902:d492:b0:2d9:68b7:c324 with SMTP id d9443c01a7336-2db125cce1bmr292519975ad.3.1788767948538;
        Mon, 07 Sep 2026 00:59:08 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae7637sm40945595ad.79.2026.09.07.00.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:59:08 -0700 (PDT)
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
Subject: [PATCH 07/13] srcutree: Don't transition atomic SRCU to big in srcu_gp_end()
Date: Mon,  7 Sep 2026 15:58:23 +0800
Message-ID: <20260907075829.2073224-8-kunwu.chan@linux.dev>
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

The transition-to-big code path in srcu_gp_end() calls
init_srcu_struct_nodes() with GFP_KERNEL, which is illegal in the
atomic context reachable from synchronize_srcu_atomic().  Atomic SRCU
has no use for the srcu_node combining tree: it has neither callbacks
nor srcu_barrier() operations, and its grace periods are serialized
by ->srcu_atomic_gp_flag instead.

Skip this transition entirely for atomic SRCU, which is also defense
in depth against any path that might wrongly set ->srcu_size_state for
an atomic srcu_struct.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/srcutree.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index 01f224a56b41..74acd5645d4c 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -1074,8 +1074,9 @@ static void srcu_gp_end(struct srcu_struct *ssp, bool is_atomic)
 		raw_spin_unlock_irq_rcu_node(sup);
 	}
 
-	/* Transition to big if needed. */
-	if (ss_state != SRCU_SIZE_SMALL && ss_state != SRCU_SIZE_BIG) {
+	/* Transition to big if needed, but never for atomic SRCU. */
+	if (!is_atomic && ss_state != SRCU_SIZE_SMALL &&
+	    ss_state != SRCU_SIZE_BIG) {
 		if (ss_state == SRCU_SIZE_ALLOC)
 			init_srcu_struct_nodes(ssp, GFP_KERNEL);
 		else
-- 
2.43.0

