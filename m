Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039E44E3259
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957776; cv=none; b=dGINyFwesIvjPoiwwvkVfIcSKo1e86SFRG1KZS6bBsZ6y2WWC90lSudSQbWOnUHD2xHB65L5RliDgo4zKpXo7uDKwAdHTKz0kz7ybuXAxVLL5+/LSai19pxd2s4HpdaH0aASQq9mVOJXMdHXp+yCnS4HJbbJtpqyWtxeKQrVA0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957776; c=relaxed/simple;
	bh=Nadl7HsFYXW6P9DTRKvVWpxRaLB4EMXS+QpbLsbVDjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MDpiF727ZOubiPKJIVTB6sYyzVcWdRa9Bv40J6v8HrjozDKjPn31KjvpPcS5O1+ff08EJVwIBtqeAG+UdTJmy+79/zo1nxoLOWt1kxuzfwAPTX8XUZIeQ6NAVqffw8/iyn1zaWTy+1gASl+i1xQFc0FUkacgWEd6Cy+9izLQEqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0Okh6A7; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0Okh6A7"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ad795d5205so4296889a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790957773; x=1791562573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bd3F/qTb7l7go4vsYHnwO4e8nInvYSKDA0ySqIxH6Y0=;
        b=c0Okh6A7R+50fi9SonHOAqjhPbjEH7w6P/tr3eGi0vdALR0SAplZBCegJ6PYySpALS
         dsavi7SqB0/Hxctm763DawhYR2XrvBxrQ6OmWeqhwXXZSc9t2nqjGKQEtKE9hvJYtYV1
         fSfr6WTGHoFp9M7icM6XK3lyvvLkIqLTjo6R3T+8fs1DZcW860m3MZOsR8/eFLovENhs
         nCF/II55f9QDGGS3u2UlzCP5TfvssZCbbBcX0pMZl4WCQceIyjlquOI2Q1jGC/46Omy2
         PSQXqn0mUFQAHY3aAMepZx/c58+gAZB1zGaoLQAEHsTxJywPHlc+E8b8e3ThBrb9kMzW
         BIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957773; x=1791562573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bd3F/qTb7l7go4vsYHnwO4e8nInvYSKDA0ySqIxH6Y0=;
        b=AKoXe/pY2TwlNka9wVb5kS7/qKx4IEw53/BLF+pP+RDsstkOuP6Fh6idfbuUwqOkyg
         rjjub2YETa5dfxbFS21loYawlh8GRYZn1a2VTvVy82Xo/s2h5Csq6WSCMqT+ixR2WkA+
         PZnbIUdDkkwy2GVH43yFvc7YDl9l8qHp4FQ0d/WLdtBSWMoTFrXQmGdfRKrHmrY3R6US
         l8MmpF1ngGDLXlKypiLjxEzJK2lSNrz1FbUNhti52gLZvDhD4nDGcaioizYgy9dihWpU
         1Rir/C90O1dSmBgJzqWnfP1bJXFe3l81ZBRev+GdraHR5dMDn/PVE/E+GEZaY68nMKjY
         l5jQ==
X-Gm-Message-State: AFuF++kzZY0q0RLS5cmYCHrXH7OiH0o7Pk7C5ejH4i3/Jp8S5/Piv6YX
	snx0ZAiNoU1psprv1Kokl6zfXgVsrkPR+tGh4LgNdgbXK7gT+4XW7KnN
X-Gm-Gg: AYBFou2+FavntarZi3o2tg9OngMDbJQFm/NsrL7kI2p8+WAtID8+4QAJCzQSmsjn6b3
	rxW4vSCBvX77VIeN/zJuXGwK3f21ZNzEaELQizMO5l+Ilc7Y2Pz7MPu6AJ7yf3xBF3gOtMptTzy
	3HQI2Ph/04MtVnpXQFbDCUuZCm9AoeHnYxKc43jHN7HfL0MBZYYs5xnwnWUOdTo/mntZUa4bVBk
	+j5qMeZiYKybAd+fv7fD/wlOawYLkofFs7xX8zNPxQ9fo/kfNUuxubEsv0c6/UrHU6Yub6VPFnE
	DcgQbJlQdSnFJO1u/I4Jd6XOF1JvAeP4Cgn5YEhmzS3MHPTRnOfVjjffBraCwouSGMk0ANM9spu
	bcA/Zo3cFieI09F+UNFPpeyuFmCwbHlR2EBNvBsLy+0Hf2nu+svYubJcNSVL4GlcPJ5DJmlO0RL
	rcE+U1baF3GVDD+t/IDnLbQYTg6ywrL95bY4fI+qhHH6mRws24yyTYx8e97WeDmDW+FApcrO1yu
	OFwEnPjpoaaDWG2eYdE1kMi0WTjAIwIlikAwqEl
X-Received: by 2002:a17:907:3f95:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c2e4b20dd32mr240955466b.21.1790957773114;
        Fri, 02 Oct 2026 09:16:13 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf5f4e4sm106437166b.42.2026.10.02.09.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:16:11 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: sparclinux@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: linux-kernel@vger.kernel.org,
	Magnus Lindholm <linmag7@gmail.com>,
	stable@vger.kernel.org,
	Jane Chu <jane.chu@oracle.com>,
	Shannon Nelson <sln@onemain.com>,
	Vijay Kumar <vijay.ac.kumar@oracle.com>,
	=?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
Subject: [PATCH 2/7] sparc64: honor queued spinlock layout in secondary startup
Date: Fri,  2 Oct 2026 18:14:24 +0200
Message-ID: <20261002161515.932316-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002161515.932316-1-linmag7@gmail.com>
References: <20261002161515.932316-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The trampoline's ldstub modifies the queue-tail byte of prom_entry_lock,
not its locked byte, because SPARC64 uses big-endian queued spinlocks.
Acquire the word with CASA, release byte three and poll while contended.
Retain the predicted-branch barriers for Spitfire erratum 51.

See qspinlock_types.h for the layout and JPS2 A.10/A.35 for CASA/MEMBAR.

Fixes: 145d97858597 ("arch/sparc: Enable queued spinlock support for SPARC")
Cc: stable@vger.kernel.org

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/kernel/trampoline_64.S | 34 +++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/arch/sparc/kernel/trampoline_64.S b/arch/sparc/kernel/trampoline_64.S
index 51bf1eb92a36..62f404b3079a 100644
--- a/arch/sparc/kernel/trampoline_64.S
+++ b/arch/sparc/kernel/trampoline_64.S
@@ -106,9 +106,19 @@ startup_continue:
 	 * We lock 'num_kernel_image_mappings' consequetive entries.
 	 */
 	sethi		%hi(prom_entry_lock), %g2
-1:	ldstub		[%g2 + %lo(prom_entry_lock)], %g1
+	/* Big-endian qspinlock: acquire the whole 32-bit value, not byte 0. */
+	or		%g2, %lo(prom_entry_lock), %g2
+1:	lduw		[%g2], %g1
 	brnz,pn		%g1, 1b
 	 nop
+	mov		1, %g1
+	casa		[%g2] ASI_P, %g0, %g1
+	brnz,pn		%g1, 1b
+	 nop
+	/* Spitfire erratum 51: barrier in a predicted-taken delay slot. */
+	ba,pt		%xcc, 2f
+	 membar		#Sync
+2:
 
 	/* Get onto temporary stack which will be in the locked
 	 * kernel image.
@@ -212,7 +222,10 @@ startup_continue:
 	 nop
 
 	sethi		%hi(prom_entry_lock), %g2
-	stb		%g0, [%g2 + %lo(prom_entry_lock)]
+	/* Match membar_safe() for Spitfire erratum 51. */
+	ba,pt		%xcc, 2f
+	 membar		#StoreStore | #LoadStore
+2:	stb		%g0, [%g2 + %lo(prom_entry_lock) + 3]
 
 	ba,pt		%xcc, after_lock_tlb
 	 nop
@@ -326,9 +339,19 @@ after_lock_tlb:
 	wrpr		%g0, 0, %wstate
 
 	sethi		%hi(prom_entry_lock), %g2
-1:	ldstub		[%g2 + %lo(prom_entry_lock)], %g1
+	/* Big-endian qspinlock: acquire the whole 32-bit value, not byte 0. */
+	or		%g2, %lo(prom_entry_lock), %g2
+1:	lduw		[%g2], %g1
 	brnz,pn		%g1, 1b
 	 nop
+	mov		1, %g1
+	casa		[%g2] ASI_P, %g0, %g1
+	brnz,pn		%g1, 1b
+	 nop
+	/* Spitfire erratum 51: barrier in a predicted-taken delay slot. */
+	ba,pt		%xcc, 2f
+	 membar		#Sync
+2:
 
 	/* As a hack, put &init_thread_union into %g6.
 	 * prom_world() loads from here to restore the %asi
@@ -389,7 +412,10 @@ after_lock_tlb:
 	 add		%sp, (2047 + 128), %o0
 
 3:	sethi		%hi(prom_entry_lock), %g2
-	stb		%g0, [%g2 + %lo(prom_entry_lock)]
+	/* Match membar_safe() for Spitfire erratum 51. */
+	ba,pt		%xcc, 2f
+	 membar		#StoreStore | #LoadStore
+2:	stb		%g0, [%g2 + %lo(prom_entry_lock) + 3]
 
 	ldx		[%l0], %g6
 	ldx		[%g6 + TI_TASK], %g4
-- 
2.43.0

