Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5131646AA96
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145720; cv=none; b=jU54xg7j1f1yQPRP4NAKxz3L8lufrQ6HYMIvd+itv5/4TTsgQmLZCtGd/1HoBTtF0WB2b3X586KWwsRRVCsVMrsU9BpUVfgXgiMThFETsDShP3tThvpSjKZWCbgCpdCDW3k3oO+LZApQQwumS0d0vA69j0RGw64Z3rkUgSqTNPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145720; c=relaxed/simple;
	bh=5+Mp4TeDYq2o2TK3O/vdVC//j8jljTpTyZBFtmJvflw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QGL0cw09xcPbVR/gZfDduOS03bKbVDIuAsYpCR1KG6OJrtyNCFNdtcIrt/6pnGhV5H+9pMNY/+2vHD5DK8VAXdrLN0zk3Eh1iWVM3iNR1mVNkCkGWvbzBOPM2RAeTqBxXuuFDi5zMJGfZC5icHl6t8ZdLlfqlmHCCd9nQNr9hPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYjhTfry; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYjhTfry"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e87c66e556so4486455ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792145715; x=1792750515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vf6qHtCJHYPPUhzxjpIczur0NsiTKA4BX6nz592iMDQ=;
        b=BYjhTfryOnMsL2nJc/pxdvotLlKoa8WSJ+zs5hTyG6HElTUdnmUC/9W2iPP9/AyP15
         CSJpET4eNB6wRyfZe/08CAI6I+18ukOQo7bAeBFfFKurYs6pOcl6yBUvnbopE/fZmdKo
         n4SkE1maVnDEvl54LJQnTmNXTKu8IXMzi7JMqdLHDPPIvO8CDS75My3tdiJqQJt1OcMv
         XoSlq/DDEGupu701v6DxsiaxCNCYp1z3k+GiLErlXfUXGjxzvMU+OC0H5OQ7tdc+mrsD
         svobjx+8d/Vjx+vpaWCYQI1mB7Rsl4VjHvsSnqh5x372jVpxOZk1xMyAoInhhK2z22e5
         V4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145715; x=1792750515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vf6qHtCJHYPPUhzxjpIczur0NsiTKA4BX6nz592iMDQ=;
        b=zxQUrQ9zvQikqxHK3crdrQdse9wCQM6eHxmDMdU0jZOFbwzrW+W1CItLINM/akTDWS
         D32QlR2rBY2TmV3W6vfSTthHnWtylqW5dNDKXGSjLbl+sfQRLRZ9Yn+H3o0PIu9R+K06
         E3QJVHqD/7my6C0JxyMsDaDp2VLns459QMwZYVdw52JDrp/3iAL0FuFsJuvLwYpQhy5/
         8H5sVVMA9o1wK44oPcH7aohWYa7KvZHZbK9Mb38DtOCxNZ1X0nfSN5jWKHNpTAaHzV3i
         458U8sUWNhC5X44ZjHOOg6y8L9m0kIMjNMyVCBwugjyNmw5T5maWmInYXcKw4ftMYes1
         My3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxoI0oBolKzzc2SjAkYiv/H6XOHSRsBPYQvfXtKtH2U09aaIDHNmzKrRX3FOD+9eV7Ikt4OWn1buAi7FWs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ86OkCE8g8Ps4Iwno6EBeA5LXUmhUzMsElEZUkhIIgsfxf60xE
	sZ+7/ftA+6r3eyeUReG5cLOrLMzDd/Mm7ug1eHAlk9GAxs4mXp6HGJoB
X-Gm-Gg: AYBFou3YN/oWZ5lz8NxWK5fWLMQ1CFeYQIZdu+CWUwMsZMvOdYT24XaBnG3/X4or9Q0
	qZvt32WFR5gL5KEP0K9pNDAccOqu2Q3fh6PuprFtUp9JDtO3HmpMvS3b8lauNkxK9lEdK8TJHnD
	uDVo5U0qaz8b8CV18PiHUXwY6Ujj/+DLPx5hKUbQNwvLHvZzn+GALh+viPlQlOfjOQF0N6C4VOl
	u7HQChYxSIpSsD2705ikYUvEUX01EYTjaDC+WPntatctRLmxM84lyYJD32p+H7vp3Mvr31R/m9F
	Yu8bz01S7yeygSlSCD3KKGyZy/cKkrBa1YRgqgdh33GpOWqm3SizLwMTecxzU57I5akaMTBivZQ
	t6bJOCnN3xdqodoYo4kli5OVir8fV9I3bcw7pZhFu7iOIthtBmWqXRM0CgVaaC0woSjCqjBazH1
	5/IA9r2IMHLGu+U2J9BFCMMKMJ9BaPycKz+diP4+UhtaVLxc6e03EeKpI71j8b0yYANUnyeC/rM
	jEvdzHSmv4JjSDwwLmFBw==
X-Received: by 2002:a17:903:2f8b:b0:2df:b004:df28 with SMTP id d9443c01a7336-2e9772b0555mr20367255ad.35.1792145715452;
        Fri, 16 Oct 2026 03:15:15 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e85fd1dsm7876465ad.49.2026.10.16.03.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:15:13 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: anup@brainfault.org,
	atish.patra@linux.dev
Cc: tjytimi@163.com,
	inochiama@gmail.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@linux.dev,
	pbonzini@redhat.com,
	seanjc@google.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH] KVM: riscv: Set Accessed bit in dirty-log write fault fast path
Date: Fri, 16 Oct 2026 19:14:58 +0900
Message-ID: <20261016101458.221648-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvm_riscv_mmu_dirty_log_write_fault_fast() considers a leaf with W
and D set already handled, even if aging has cleared its A bit.
On hardware that faults when A is clear, the fast path returns
true without setting A and skips the slow path that would set it.
The guest retries the same store, but A is still clear, so it
faults again. This repeats indefinitely, preventing the guest
from making progress.

Host reclaim or page_idle can trigger this while dirty logging is
enabled, potentially hanging vCPUs during live migration.

Require _PAGE_ACCESSED in addition to W and D before treating the
fault as handled, and set A along with W and D. The existing
cmpxchg loop retries if aging changes the PTE before the update.

Fixes: 7705be59eb2d ("KVM: riscv: Fast-path dirty logging write faults")
Cc: stable@vger.kernel.org # 7.2+
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
Testing:

On a HiFive Premier P550 (EIC7700X, which traps on clear A/D bits),
run:

dirty_log_perf_test -v 3 -b 256M -i 3

While the test runs, repeatedly mark all system RAM idle through
/sys/kernel/mm/page_idle/bitmap.

Before the fix, the test did not complete its first iteration in
over 11 minutes, with lock_stat showing about 16k read-side
mmu_lock acquisitions per second from the fast path.

After the fix, all three iterations complete, each taking about
29 seconds under the same aging workload.

 arch/riscv/kvm/mmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 78a1826c466d..042d1e3b3547 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -591,14 +591,15 @@ static bool kvm_riscv_mmu_dirty_log_write_fault_fast(struct kvm *kvm,
 			dirty_marked = true;
 		}
 
-		if ((pte_val(old_pte) & (_PAGE_WRITE | _PAGE_DIRTY)) ==
-		    (_PAGE_WRITE | _PAGE_DIRTY)) {
+		if ((pte_val(old_pte) &
+		     (_PAGE_WRITE | _PAGE_DIRTY | _PAGE_ACCESSED)) ==
+		    (_PAGE_WRITE | _PAGE_DIRTY | _PAGE_ACCESSED)) {
 			new_pte = old_pte;
 			ret = true;
 			break;
 		}
 
-		new_pte = pte_mkdirty(pte_mkwrite_novma(old_pte));
+		new_pte = pte_mkyoung(pte_mkdirty(pte_mkwrite_novma(old_pte)));
 
 		if (kvm_riscv_gstage_try_update_pte(&gstage, ptep_level, gpa,
 						    ptep, old_pte, new_pte)) {
-- 
2.52.0

