Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FB330F533
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519693; cv=none; b=pfQFHvgkjTurcqsIzmd9csCXiBSkI8AoeQwuZO3qZErG/Louf/eyWh273HDhfi6pFaMkgu88djOwji4uf3e0uazIvWyFumSNZ5Kkz0SSz14MTVahXyEDy97XUUzjlDQUuLY2Y5uoRI7CuRNqK/rl5ExSrJUHIoiGhLLAHflUJPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519693; c=relaxed/simple;
	bh=5hX9bpz9aCiVYVCz04O2SaXM7cim0otUdTYbj7aGycI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dNu3aZCa1VLo3+6sUgzsqy3wkYHNDRjREQd9R6xlHfPLXoDXObhUFf8jSAQPtDGKv4GzNv0o7I8Z8qP2oQ3osMLj8I681cmsw/6c0UF9WcBYEErBVSIVCmmQ27gU/q0Vu1adcIpJsR8G2KrSrYFIubG9S8G1ZRdL1WhtJFztNJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHaPgqV/; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHaPgqV/"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-343c8177767so507595eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519688; x=1791124488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJ0TA9zWzvwNir1lTwHgRV/QvxzoCmjyNRgihgG2rcs=;
        b=AHaPgqV/w9IftqYMWiOIETTIqMyFWFOEp+vzmNR6HpknzKPZ3VoIW61PG7cCXL7VMc
         rYFh1C8qRgHDooFUeOB8Sa71wCT2qdDy8OyNrQd25zJTfdb9COpbYS906w812NpVXZxA
         jaQOXP/mbA5vMw55m3zqVlDJbiMNy5RmFaOfaePUydFYQjpAhymoOHQMXYyk3DkVqkWU
         m5y889e+t/1B3dpRtlKMYeIQhjxGwowqMCu8Y9WOZ6vxx4yUaVJZGaJmDUzSrKN8iC2b
         v01rUtbwp4LrO1oAX81XLs10W0Y4RmtbON4n4+Aac0j9epR2r+3fPUpNpaVut/hyBcpq
         fJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519688; x=1791124488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJ0TA9zWzvwNir1lTwHgRV/QvxzoCmjyNRgihgG2rcs=;
        b=JE8wVAg/JAyDFXS3sdOaSkCeC0ys84TnXNk0w7Qg4XSR34s6FNuqDfRg0CDrUNcAaY
         KtD6Fu/nYaavrxHY9pvtsjbMtAbcctt342WkNJHIMWxwmeaWft3oafdsswV9tAfnz8/K
         qYYG1/4kZJZoK9qBfzVWPBOV6hBKJXAqwA9Qi5fqQVCIs0HUiPrchZJVAKh+Zyf17r+N
         kqvUnTjRbs8JyhOJXHylwF2pakQogPUbBNxpjZY2YuM/oiw29V28i/B0CqBEMd84LQ+B
         l8yokZmgekgJWCeHhZ7koTMQch4t9nyGgtkkWngBGmv3BhLOif9nvekb9OmvH6hr1l8s
         nYWg==
X-Forwarded-Encrypted: i=1; AKwUvByp7spXyF39l9P9sA59QSGzyLm6IFGFvG6KDEqAMXDDgIEWS81WJ4VfEH7+cKilbi2QjpwuEq0jEvtpMss=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ2owwsL8D3coDLcqrO3RUK2Ge5s5EDgX0SHsh1wJABqMI1nIR
	ZKtArm54TBEvgjPWhYszljE7EWJucs7tPfaR0fOzVsVQZ4LNgJgjSNu3
X-Gm-Gg: AYBFou1nfVcyTL1F5ap1BJBocccgUxCn4QikoneHXiMOZgmx0LoL3Hj5nmrfxsVb660
	4owmWZpL6+7Xuw/0snL3nq3W5au4Vrp7tt4nCNgK4KG/TR7HU0FK+EbFT42NeULDM08TTdVVx69
	vZ7nSgKKHuTz5whabEN8nMO3/ovh20f4fVjeoDnU9PPoEP4f+0CkNxvqUffDQqmqvYNN65pbQ34
	Ilh9UVDfjVMMimELcGP8KyCyGuejRns694TlZZSVRn+E1Q9ZQkMUI10qrApI69/KJHdEI27jWXC
	XJkng+TaWpOjEcaTwlPQ3/UdLBBImfyQa+LR6ZuVNu0yxhQoThCbrNwio1RlKyBU14owaOa5HIn
	9soGr5AasQ19tELaRM/6ay5tSiT70d73EqW9EwgNDHCrHm75OT11V7Ib+67vQieWNwKwFmbBsls
	v6b1eqEy9HSxLENnT3TWjAQj3P/DygvvzmCSpPcxbIFVAnUW3+dGI55TolfN0+dAPBzUDOgB/4i
	b3a5gqE0JxUjRjQbzcVqKultfg3QvmvAY66VwHCA+Z79L5Br6WcQpEpECzn
X-Received: by 2002:a05:7301:fc0b:b0:341:cada:34d5 with SMTP id 5a478bee46e88-342711ab268mr5858807eec.1.1790519687898;
        Sun, 27 Sep 2026 07:34:47 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144b4ae50sm21869436eec.17.2026.09.27.07.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:34:46 -0700 (PDT)
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
Subject: [RFC 03/12] powerpc/pseries: Rework hash flush to remove conditional locking
Date: Sun, 27 Sep 2026 20:03:44 +0530
Message-Id: <7d9814b4e5dfbec0038bf881f5efe2e062299350.1790517984.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1790517984.git.ritesh.list@gmail.com>
References: <cover.1790517984.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang's compiler based static context analysis does not work with locks
that are conditionally taken like in pSeries_lpar_flush_hash_range().

This also simplifies the function definition in my opinion - so this
is also a win.

No functional change intended.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 31 ++++++++++++++++-----------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index abd77c45cbf4..5dbf447d3a83 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1526,28 +1526,19 @@ void __init pseries_lpar_read_hblkrm_characteristics(void)
 					bpsize, idx, hblkrm_size[bpsize][idx]);
 }
 
-/*
- * Take a spinlock around flushes to avoid bouncing the hypervisor tlbie
- * lock.
- */
-static void pSeries_lpar_flush_hash_range(unsigned long number, int local)
+static void pSeries_lpar_flush_hash_range_unlocked(unsigned long number, int local)
 {
 	unsigned long vpn;
 	unsigned long i, pix, rc;
-	unsigned long flags = 0;
 	struct ppc64_tlb_batch *batch = this_cpu_ptr(&ppc64_tlb_batch);
-	int lock_tlbie = !mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE);
 	unsigned long param[PLPAR_HCALL9_BUFSIZE];
 	unsigned long index, shift, slot;
 	real_pte_t pte;
 	int psize, ssize;
 
-	if (lock_tlbie)
-		spin_lock_irqsave(&pSeries_lpar_tlbie_lock, flags);
-
 	if (is_supported_hlbkrm(batch->psize, batch->psize)) {
 		do_block_remove(number, batch, param);
-		goto out;
+		return;
 	}
 
 	psize = batch->psize;
@@ -1587,10 +1578,24 @@ static void pSeries_lpar_flush_hash_range(unsigned long number, int local)
 				  param[6], param[7]);
 		BUG_ON(rc != H_SUCCESS);
 	}
+}
 
-out:
-	if (lock_tlbie)
+/*
+ * Take a spinlock around flushes to avoid bouncing the hypervisor tlbie
+ * lock. Firmware with MMU_FTR_LOCKLESS_TLBIE does not need it.
+ */
+static void pSeries_lpar_flush_hash_range(unsigned long number, int local)
+{
+	unsigned long flags;
+
+	if (!mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE)) {
+		spin_lock_irqsave(&pSeries_lpar_tlbie_lock, flags);
+		pSeries_lpar_flush_hash_range_unlocked(number, local);
 		spin_unlock_irqrestore(&pSeries_lpar_tlbie_lock, flags);
+		return;
+	}
+
+	pSeries_lpar_flush_hash_range_unlocked(number, local);
 }
 
 static int __init disable_bulk_remove(char *str)
-- 
2.39.5

