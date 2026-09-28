Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ADB49CF4D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592301; cv=none; b=L9S/oBO6LyqqJ+4Fp6K74kF7fLRhxGS7oYf4lwQpv2190mJcc7B+6KtwPbbs2qx69pEGyC/gdLL3VQB5tKLjD3LnEugkQMt02RVvVDu8BVz+v7VkQzwrtzRChF1dDIDbEfA5IcFFbg4MoTS/0RNz4zUR934Okw8yMnjeESGlBJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592301; c=relaxed/simple;
	bh=ONzq0C/PmSabe0msiZdOImZKIRJ3FxetlEeOtuDzpPM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S2eO8bnRTM5Fb0zECyw9IHqxXci7wBisg9OIpYGl1Yr9KW0d8RAywyFsuP4Bl4jTH52AEA0rGxdY4Ty8FW+wweoch4oRP1uK+EYCYYgQA0ssatYYgmP+gHg7Z3qNenTSCwNMdPeXIPzOdVktu+kES0U+m/BNUlIZmEF2ob1FL5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q7dGBgHU; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q7dGBgHU"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso1852615a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790592299; x=1791197099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1fHiW/q9wws193uauriObWBGAQjMBTx9YeqyoW+PZx4=;
        b=q7dGBgHU1tivBky2vUzsitgz+a5D4WuTlMSBx0uRakwTFg6Bbln0oLDLe/bfC8KT6s
         G64F9CmWw0mBpylpnD6nl9j6pnFLhr+L+xSkVcBeCV/0cQqWOJx/XFo3dpLFTrhtmUQ/
         3t4rnNlR7PiMijVHvUlK0eQ9L79jq/BPIl4Fjnk+P9zGSI7NqEZOI0YYLKE5xtbYhw0S
         +QCOwOOSLDJp17OP3BCxLKyUG/kzeHOlr/Dl8/tOY7IKz/RSjC5K4b0t3xpOQM5oRACG
         j1mWobSpVvj88aykUZCJ3r87dxwa4tJG2l1Yu21jA+YaeSwvNBFxOsEd11SnRLg6Iaob
         Z0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790592299; x=1791197099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1fHiW/q9wws193uauriObWBGAQjMBTx9YeqyoW+PZx4=;
        b=IqrBrgtBdu79O+Ix1KHjNDdtAWZ/VDhtlZP1+S9Vq5Pk0puB/cfxm1wnCA7cYA94m6
         +kkceBQZ99/YmwDb/EnuTMTrFRkyTbSFGs0Lnfc3Io1KTKJ035cj5luriZ2MfC3CD1Jo
         cVbz0iw6IXG14oXdlqbdXoRmCLPty0lfwPmyinAc268jyONaSznVcjlocHDpIH0248Lp
         wG+Ohj+ThyLsyxi1ag0VCZXEp5GsxIpk5ECD78SCtznManjjjTtkzdhk5oJKL1J99t6F
         VfQ5oV9CW7BHppphOcxW+TVy35TewgBsxk5wygHVkEcp/jDp4uE5u06wqr99j4Ey+o4Y
         Z3tg==
X-Forwarded-Encrypted: i=1; AKwUvBwsN0X5kxHiTuBj/4nAOVbJbgjffff8sPOIHjeJ6ooorHwH53YM0T4UpUGHW2XiHh7o2mTXYWsN+Ilb0pk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQrmIwY19m/FXT1NY6oeYGtTJ668EfBspWPTRXd1u/QmXdUBsn
	PPL7o0l5lKZX1b0bPYKYSQZpxWGQkcMTZa7LiDHJq+yU58YD6FTf/bQa
X-Gm-Gg: AYBFou0QalfUYL9oCx/eIt/bEYQ20CyNUJ3gPP+Wr/t2MqZyf4ZAiDwrBrRAxRvfn+w
	Io6VV92jQxncifAwT4x/MoO8Coc/sP1KF8taJVj4JOCsEAvO0zjXbNzzD7uf084mMKAwxRUB5zG
	i20xeYKf7cfwnyLMzaBHD+G1CABiopFg7iAGwQlcxlypLQuCFVBfabM7aQE3zQyVTgZai1MZobh
	ntzZQRcwJ0Kzp62f6Ji2y1VpyLeoRbf7N8pRt5MkTCsvIRUrYTal+H85fKO+K4Zf5AgkCYOb1cP
	+8CHB2YwsXrQTBrNebg9lW0+0afWwlJw+GGmsqL+MZvY9fsRTPLXlkEGiiinT9sOzPHeJYl3EId
	SJwjSyvrS1Mc0Mb5l03BMiVpZqM7/dbvYJSsmtyigizaX/ZoYs9I5f672qz+UyHUhy+E5qTSFTI
	IPls+oNnn3m62odydVqbnOZDv4/Ex5EsrE1sGXN9Q1sdDtzFltS0SlrJHq4ncM72pc6YWYpo2Oq
	QUnx2D2LQKZywzQCed6OZl3OUAnSEb4Fyf65YH0Qmub2RRNH3BpAu0T5OwS
X-Received: by 2002:a17:90b:17d1:b0:3a2:b4a6:929b with SMTP id 98e67ed59e1d1-3a2b4a694famr2547138a91.17.1790592299289;
        Mon, 28 Sep 2026 03:44:59 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm27071975a91.12.2026.09.28.03.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:44:58 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Marco Elver <elver@google.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 2/6] powerpc/mm/book3s64: Rework tlbie() to remove conditional locking
Date: Mon, 28 Sep 2026 16:14:32 +0530
Message-Id: <382c79e2386e6a26044d813eea9c47df000d65cf.1790590014.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1790590014.git.ritesh.list@gmail.com>
References: <cover.1790590014.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang's context analysis reports:
 hash_native.c:235:2: error: raw_spinlock 'native_tlbie_lock' is not held on every path through here [-Werror,-Wthread-safety-analysis]
 hash_native.c:245:3: error: releasing raw_spinlock 'native_tlbie_lock' that was not held [-Werror,-Wthread-safety-analysis]

This patch reworks the tlbie() function to remove the conditional
locking. It fixes the clang context analysis reported errors. However,
this also simplifies the code around tlbie[l] - which is also a win.

No functional change intended.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_native.c | 34 ++++++++++++++++++--------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index ab2a80e59011..6bad0545b57a 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -222,6 +222,23 @@ static inline void __tlbiel(unsigned long vpn, int psize, int apsize, int ssize)
 
 }
 
+static inline void __tlbie_sequence(unsigned long vpn, int psize, int apsize,
+				    int ssize)
+{
+	asm volatile("ptesync": : :"memory");
+	__tlbie(vpn, psize, apsize, ssize);
+	fixup_tlbie_vpn(vpn, psize, apsize, ssize);
+	asm volatile("eieio; tlbsync; ptesync": : :"memory");
+}
+
+static inline void __tlbiel_sequence(unsigned long vpn, int psize, int apsize,
+				     int ssize)
+{
+	asm volatile("ptesync": : :"memory");
+	__tlbiel(vpn, psize, apsize, ssize);
+	ppc_after_tlbiel_barrier();
+}
+
 static inline void tlbie(unsigned long vpn, int psize, int apsize,
 			 int ssize, int local)
 {
@@ -230,19 +247,16 @@ static inline void tlbie(unsigned long vpn, int psize, int apsize,
 
 	if (use_local)
 		use_local = mmu_psize_defs[psize].tlbiel;
-	if (lock_tlbie && !use_local)
-		raw_spin_lock(&native_tlbie_lock);
-	asm volatile("ptesync": : :"memory");
+
 	if (use_local) {
-		__tlbiel(vpn, psize, apsize, ssize);
-		ppc_after_tlbiel_barrier();
+		__tlbiel_sequence(vpn, psize, apsize, ssize);
+	} else if (lock_tlbie) {
+		raw_spin_lock(&native_tlbie_lock);
+		__tlbie_sequence(vpn, psize, apsize, ssize);
+		raw_spin_unlock(&native_tlbie_lock);
 	} else {
-		__tlbie(vpn, psize, apsize, ssize);
-		fixup_tlbie_vpn(vpn, psize, apsize, ssize);
-		asm volatile("eieio; tlbsync; ptesync": : :"memory");
+		__tlbie_sequence(vpn, psize, apsize, ssize);
 	}
-	if (lock_tlbie && !use_local)
-		raw_spin_unlock(&native_tlbie_lock);
 }
 
 static inline void native_lock_hpte(struct hash_pte *hptep)
-- 
2.39.5

