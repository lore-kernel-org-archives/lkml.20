Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794077021;
	b=vc6fyORXk0uhDXnZCTrPY/LTFhpI3qIU6BkrIlqwHqZbdvQgCk8+VIRCMrIw31bBN1el
	 qW7ErOMhM++LuWpMuPNNicSb93aRMyPR31smu5qDDW3Lvx+aKrv8VE6k07iaWm6DiUtab
	 KLbugC6ZGcanzKixLqLK7bLr9fhrGz5C922O2GWp49ZDGkhr7f9acjBQLNzGOoCirxm/0
	 O/wHjZF+d563bpw3mtl8Jzqc4IZMyyz0DCDefg4Zk39b/2LcbwIm9eUaLyamTJ7MPW+BZ
	 x3VyBK5UMnjGpgbK/H3aqzLnOYDNvdTXk/xgqyhJ2Apag8X0RIJEppOZH6mJmekNftw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794077021;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:MIME-Version:Message-ID:Robot-ID:Robot-Unsubscribe:
	 Precedence:Content-Type:Content-Transfer-Encoding;
	bh=t1HVA44UAY32xlSYNWcCK2CrgjT7OyVdPsj6AxJutDE=;
	b=CM3MnwcOpmZynNkLLrsMIYe1NAspBH4J3GxAN7W/pn3E8MD5vvsU0V5k609PZWeIqVhn
	 jYA6QERiDrJH6DKG3Zv1kzZWBMPf3xHfWkt8e2ipjZjoFWDNsQfGO2oIa1+2uFkEnkWJX
	 vMFeqpb3WBrJpYUd4DrOtylIA4PTOBMVvYfR+/8MolVZ9e1MWoST2WyTYqTISzFCdgvwd
	 /OWclcnE0SkDLNJVdTM8Ct9OIpqUT8ag0BTEhSQdKjD3uRwwfuGhAxLjEqUrwfsW1m93o
	 GBALaglMOtaaoPM+0qMxxVUT6aNLLFkEgWyFP2jISbJQSk1EOm/p/YEH+t4O+O+UIew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AtQPrfzp;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=l2H7aosd;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43285606A326;
	Sat,  7 Nov 2026 18:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43285606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AtQPrfzp;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=l2H7aosd
Date: Sat, 07 Nov 2026 18:43:30 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794077012;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=t1HVA44UAY32xlSYNWcCK2CrgjT7OyVdPsj6AxJutDE=;
	b=AtQPrfzp73aBB78zd41LLb8M2Dum3a02dz7zfi2MU4nd0MXeOX2FSspG0qkD2nGnQ/CoV1
	z5CnD6yqRR3Zly+COKH6uhXu8vwmMeYgkq92bdEqz3+HpEkwH+bAO/14CbkV9iGoNBmzG7
	M4OMqAMb0PKJ2xjYVBvsVZgM0nx1KHBukupyjO5uPHaciriiFkIREVLKkujqkVFCLhf5qF
	KJY4PcJNQa70G1I6aZFX1e71OGn4he7n+Bd/pTwmLQJaeUTlzGGPtRihvBfHboncllKVOI
	asuCQD+MVEv6h4QL0Cz1j9ETaZGB1B1FIh1DcL9cn3XHh61aNvXvLAzU32oh8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794077012;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=t1HVA44UAY32xlSYNWcCK2CrgjT7OyVdPsj6AxJutDE=;
	b=l2H7aosdoPUhXhl1GQpt5HiJI2/T06vf+vMa/IUrH0cvtDbU+OPy9tmx2cviNgOvSXTSIv
	XZJl7skfGpLWerDg==
From: "tip-bot2 for Chris Mason" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] x86/mm: Fix global ASID handed out to two processes
Cc: Chris Mason <mason@kernel.org>, Rik van Riel <riel@surriel.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,  <stable@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179407701052.2093942.14761445604537918621.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     5cdc3746fa163fb4e8d05fa3cabf46bc6aa7df75
Gitweb:        https://git.kernel.org/tip/5cdc3746fa163fb4e8d05fa3cabf46bc6aa=
7df75
Author:        Chris Mason <mason@kernel.org>
AuthorDate:    Fri, 06 Nov 2026 18:47:17 -05:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Sat, 07 Nov 2026 10:35:02 -08:00

x86/mm: Fix global ASID handed out to two processes

On AMD CPUs with INVLPGB, two live processes can get the same MAX_ASID_AVAILA=
BLE
global ASID value. The two then hit each other's TLB entries, so each can read
or corrupt the other's memory.

The global ASID space is managed lazily. When a global ASID is freed, its bit=
 is
set in the global_asid_freed bitmap. Once the free ASID search reaches the end
of the global_asid_used bitmap, a global flush is done to really reclaim the
lazily freed global ASIDs.

However, the current code can assign the same global ASID to two different
processes, if one process is assigned MAX_ASID_AVAILABLE - 1, another process
MAX_ASID_AVAILABLE, and both stick around (keeping their global ASID numbers =
in
use) until the search wraps around again.  At that point a third process could
also get assigned MAX_ASID_AVAILABLE.

    the highest ASID stays in use, so it is not handed out again
      last_global_asid stays below it, so no reset
        the clear bits run out
          find_next_zero_bit() returns MAX_ASID_AVAILABLE
            global_asid_available > 0, so the failure is not caught
              MAX_ASID_AVAILABLE is handed out as an ASID

A search only looks at the bits below MAX_ASID_AVAILABLE, so it cannot see th=
at
this value is in use. The next failed search hands it out again, even if the
first process still holds it.

The fix used here is to reset the global ASID space after a failed search, and
to search again. If that search fails too, no global ASID is handed out.

The test for !global_asid_available is removed, because use_global_asid() only
calls allocate_global_asid() if global_asid_available > 0. The remaining test=
 is
for a condition that should be impossible.

  [ riel: simplify code, massage changelog and comment ]

Fixes: d504d1247e36 ("x86/mm: Add global ASID allocation helper functions")
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Rik van Riel <riel@surriel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
Cc: <stable@kernel.org>
---
 arch/x86/mm/tlb.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 0c4da32..53dcab3 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -320,13 +320,19 @@ static u16 allocate_global_asid(void)
=20
 	lockdep_assert_held(&global_asid_lock);
=20
-	/* The previous allocation hit the edge of available address space */
-	if (last_global_asid >=3D MAX_ASID_AVAILABLE - 1)
-		reset_global_asid_space();
-
 	asid =3D find_next_zero_bit(global_asid_used, MAX_ASID_AVAILABLE, last_glob=
al_asid);
=20
-	if (asid >=3D MAX_ASID_AVAILABLE && !global_asid_available) {
+	/*
+	 * Nothing is free between last_global_asid and MAX_ASID_AVAILABLE.
+	 * Flush lazy-freed ASIDs and reset the search space.
+	 */
+	if (asid >=3D MAX_ASID_AVAILABLE) {
+		reset_global_asid_space();
+		asid =3D find_next_zero_bit(global_asid_used, MAX_ASID_AVAILABLE,
+					  last_global_asid);
+	}
+
+	if (asid >=3D MAX_ASID_AVAILABLE) {
 		/* This should never happen. */
 		VM_WARN_ONCE(1, "Unable to allocate global ASID despite %d available\n",
 				global_asid_available);
