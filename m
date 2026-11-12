Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501094;
	b=4WNtnoYFVXytNMU4xpjuQFmiTt3CYQXy+SD3MvULvUk6HR4O8aruBDaVmlmAVbHYe+Jg
	 0moOQo1h1p0QNc/2SjErOX0hKjHJWLQVKbarJuYbJxIonjNa8RR01x+BQ+JM9YnYFs5tC
	 zWqxZkAn3aSy40ip0fjTidILQPWTkh5yDHd9m29l9CkuP7SDHYpdRI0bNiz65dssas5yR
	 usOI7BQeBuWv4Zt7ptoL1A/J6jg05hbMRo1gFTlvEd9WNeDGnPtqoczyo0We0eLjMi/KD
	 9uzd7lp3AylcsQEiMnauNSH12XQbeL5I1Mr6sJHvemCBBYXqwojj84IlPRaReWyinyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501094;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=L4k8tn6wHgp+FD5mSJIkhTPS81LhTC+x46dz1w6wzR4=;
	b=d5Yd1AR0iIGFQldn2joTJUNiJVfIfTUa+v8YMzkrj4mG0pKK6uxDMCJKmQiQ8ZIW0KZc
	 w1vUCE5druQDO2ez3C7JF7b6/e15TEguieTu5VL6JxwVYNzaibSVjWE1e2y6eHWAKBbru
	 uzX4tURFbnBRSQ1Ye8vSsb8f+4XpkFCTJd81Sq3PkPuMpw1l4XXrnW8QNELOkfSsw3WGA
	 5wmmZFvJBNPEYisg7RfafshgBVXIHTFbCzgBbFTdPdzDrb+14NImlZMIJFMXeqam4onR3
	 qC7tMWUq0zRqDPdQ1hXjrq2bx3biQFalcXgil1qwh6o4SuMDLHo3o2dP6bZ9qcQN6fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gz3uGHOV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE38606A335
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gz3uGHOV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC98C1F000C9;
	Thu, 12 Nov 2026 16:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501093;
	bh=L4k8tn6wHgp+FD5mSJIkhTPS81LhTC+x46dz1w6wzR4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Gz3uGHOVR/D+zD0tPtAK4HWWguZgLvgMrLvjjExgW84cCKRQdIf7+RkP8qVfBLWCs
	 TE4OWV7XSwu6/jIiyQlplQu7eXBY4+HZOzTonopCE1Ocw2XH7oVXQsfDkKv3T6g3Z1
	 Wkw0f85vjupik4orxGpTAWR+LixgaIO99/Yn0fOIl32MZaxS61fXpqdUb1+/T2IBAZ
	 svG/hPU01rWxrlc5rw8NG56QWm+Gr2SG8q+F7EfyToPLdW/IwNIRpRihjoeraIuM1N
	 78FUau3NJ+xT1GOiGYHiqGlnCIp+X6ehaQG+suz9stdfYm8OZGNLjFpKQdT2yDqEhc
	 r7EVP1SgTtRHw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 12 Nov 2026 18:31:10 +0200
Subject: [PATCH 5/9] x86/mm/pat: don't warn about W^X violations before
 mark_rodata_ro()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-fixes-x86-v1-5-791adb8d6670@kernel.org>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
In-Reply-To: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
To: Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 x86@kernel.org
Cc: Mike Rapoport <rppt@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.1-dev

The kernel text is mapped RWX until mark_rodata_ro(), so W^X violations
that verify_rwx() detects before that can be false positives.

CHECK_WX is enabled by default with STRICT_KERNEL_RWX and it reports
mappings that remain W+X after mark_rodata_ro().

Drop the warning about W^X violations before mark_rodata_ro().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/set_memory.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index a1bea16a3c3bb..a674433850dc9 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -718,21 +718,15 @@ static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long star
 	if (!rw || nx)
 		return new;
 
-	end = start + npg * PAGE_SIZE - 1;
-
 	/*
-	 * If the kernel text is still RWX, gently complain, this could be a
-	 * false positive.
-	 * Once debug_checkwx() becomes mandatory for CONFIG_STRICT_KERNEL_RWX,
-	 * the warning can be removed completely.
+	 * The kernel text is RWX until mark_rodata_ro() and the entire kernel
+	 * page table is verified after the text is protected, so there is no
+	 * need to warn.
 	 */
-	if (!kernel_set_to_readonly) {
-		pr_warn_once("CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
-		  (unsigned long long)pgprot_val(old),
-		  (unsigned long long)pgprot_val(new),
-		  start, end, pfn);
+	if (!kernel_set_to_readonly)
 		return new;
-	}
+
+	end = start + npg * PAGE_SIZE - 1;
 
 	WARN_ONCE(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
 		  (unsigned long long)pgprot_val(old),

-- 
2.53.0

