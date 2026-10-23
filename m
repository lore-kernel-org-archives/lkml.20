Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792765560;
	b=lA7wW0r1NTnhDeJoHMWLED7fSz9SpFDyY9kMJR776l271yUtLRPODQlAQes3mI8lKIgT
	 MNafjDq5OOD7Wc3CflydHXehVWprRzj/SqGhS6PjidiRxgNC+jFXJrHkDJUStWl1JzINb
	 y0xQxj5f0A0547O/WmjaWhwv6n8AhWxH3k4Vlh0BB29CR49jWnOAdMe0eh7O/+YnHt+A/
	 9HdInZDkebVOxIqj8nkiiLGWhKaQevmXwDCL9flc5jQfidYYCCgKTxnDz9Zw6J8QX3jsI
	 UdEKMcwXKtd3EkJl0IFSNoUh4sbdX5ZtwnrXUFL5Rtp092SltGAU5+e9TKO+NnZDpvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8/9qb/C5YzBF9wNJ+pPwlOlLNA/YL7ODqh7qU0jpbbg=;
	b=kaCx4kfx/nXWLL2l72BVZGEACMZNtW8qzLnWSBgwAqClie13OFCO9WjqKnPplr9EkqZJ
	 7tMdcbMYWlYk52GM2juo0zB/zubY8sfXrY0byHxk3S7lNewV67Z7Q49XLs2kyrNZjbRX1
	 UpYBWZL3L1owMtmHhsHTgS7bdXkCymIZOyPcBm8uGo5BwjHTX1HdEIyxBX63dvRQFb6gA
	 XduktdtQDxi+C452VGvHTAkARjPszxw92afGxwpk8y+ifUNC/k9XJusugXGTFWt6SQz7T
	 qkYLFy0KlRGIFd3szMtxbyUokXZo/rIxf0shkEyUFBR2RwYbhpUX34s8mGD6RglYQgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A3LTY91N;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D39606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18D39606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A3LTY91N
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so568185f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792765558; x=1793370358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8/9qb/C5YzBF9wNJ+pPwlOlLNA/YL7ODqh7qU0jpbbg=;
        b=A3LTY91NwU+VPE8N5ptIfZ+7ph4Ktt/Gyv9zUgd5609W+Ti1SN0oLPBwfrg/iwYbWt
         H4IfSsrYoayHKTTcSKI2PKNjFEHsPWzuDHVRGsEG0Xm7+5ZfgXrN+ORf+HoGXtl/qxhv
         dngOQoA7UGdJKMp4jSR3EWd4X8hJtP8z2afeL6No4DzAg9j/T+e0KKg+uMSkpQi6/aun
         UaDinFCiJzDhGr1An5wg2/yB6lTjvCHuQGWkk7O21LXIv3INNt/J9DEo9aKb6SeJ8euW
         cHbvsVsOlFdGBE3WBQIRlmBBZDLNgAkoZmwoDJt1SepEgW6bMzvBkswaLS8XUgEmNy7F
         TWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765558; x=1793370358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/9qb/C5YzBF9wNJ+pPwlOlLNA/YL7ODqh7qU0jpbbg=;
        b=FUPbdyMjUhmLgs/w+ZmE2Jpw81TbyHwAi1k6grVx/FZqYAJ6o5kDnNH02K2HwY159/
         +6ADqjUwquXwrZxyLCBVYeBC6qai7CbUPPCWppQYrlP9Is16u8OtmPgx2qouqD/3jpUZ
         ebIqM1oESmmb+pWaORazspOkZI3BjzQHx8ORco1db/CpI5gSBw8CwBckg3hlHK4C4eWF
         STf/8CiKt1URN9VkEDDigbV31o/ECgZcc3Zz559HK4H1SqMqM08o0hiyzLDadHyZB4Eu
         NHQ2K/jb6vLrIuinI0o2kGY9zVhqP+YGwkaCRhMkS1hO2Fh2AhMospGoy4CnYjV1TrK0
         BBLg==
X-Forwarded-Encrypted: i=1; AKwUvByddh//3rcy+nMmyj3cU4J68E+cvo6TPjfBbUTj/6J2x0PkHz1IlfF9Grr1SXd9tn6f9lNlGBVu2gVNPmA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKy0h7UaUTWLjqKZ7pQlcv9jRY95NdfYpePTVxRBt2rFx5V0A7
	APzCIoRYdQ6Css5XNFZhkwTgNId//yAmotIAgR5S7mF0UXc6SLGxglP1
X-Gm-Gg: AYBFou3DsZez/r2VIaz1iAfZigQhxAEILuPzgXCe/WuFsupDlSsHe6hs7cMs9qVaFR+
	dV9fIJrTH25ecUSBONgmOU48Rp9htVZOnSxjgTn+0Xqh0c0+T587e2DiZSI9Sq5/H9lmyEUmmGx
	VOFDtAj2+J6DsEbSkpFpwqTJMVZddncI4YOScl7dlWaxydYZYFq3LS7kGhS804DtnhIBKqRkThN
	Cbd9HnOGvZVGo0cjYcfdxIuhxvht+gNNqH1HqDp46MumEpzWwEji/p4EuDNerEsm9h0Znr9a1pI
	vUGbuqSAgRVesBS1EXYpR2Tv3gUHiEABdLmoXIw1HhLU+rytWHGGjIhzYXILDesKpw4JDqwyaUi
	RxSSMtH8awn8nhszNbsuRdPUc6gZSlCnycV7TBHUKHZMAYSjPORdYUlsINtXAtUpGQmRjEqXER5
	rm1DdradR4WOxC4A6V3d14+jQC2/wKLKqIiT1CGmj6lUUST6y5iwBvklQk1QmNq+E03f8Azu4Ym
	auWm84pIVkvxGtpvtDGKx+ETYCPvMv2S1X0zLrUODRUz2mJlSyXyRTehi8XZJaDE2r6JdqweFIG
	tY1raSy74f8lIITgx2s=
X-Received: by 2002:a05:600c:34c5:b0:4a2:148b:c88c with SMTP id 5b1f17b1804b1-4a2148bced7mr33045025e9.8.1792765558311;
        Fri, 23 Oct 2026 07:25:58 -0700 (PDT)
Received: from fedora (user-109-243-67-71.play-internet.pl. [109.243.67.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2b064fc72sm7917965e9.11.2026.10.23.07.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:25:57 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] RISC-V: KVM: Order IMSIC VS-file write before releasing vsfile_lock
Date: Fri, 23 Oct 2026 16:25:50 +0200
Message-ID: <20261023142550.148604-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.0
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

kvm_riscv_vcpu_aia_imsic_inject() writes the interrupt identity to the
SETIPNUM register of the vCPU's IMSIC VS-file while holding vsfile_lock
for reading. The lock keeps the VS-file from being switched under the
injector: kvm_riscv_vcpu_aia_imsic_update() and
kvm_riscv_vcpu_aia_imsic_release() take it for writing to move the vCPU
to a new VS-file or to the SW-file, then read and clear the old VS-file
and free its HGEI line.

On RISC-V, writel() is followed only by mmiowb_set_pending(). The
trailing "fence o,w" is deferred to spin_unlock() by the mmiowb()
tracking, and rwlocks don't take part in that tracking:
queued_read_unlock() issues just "fence rw,w" before the AMO, which
doesn't order device output. So the SETIPNUM write can still be in
flight after another hart has observed vsfile_lock being released. If
the old VS-file is read and cleared before the write lands, the
interrupt is lost. If the HGEI line has already been handed out
again, the interrupt ends up in another vCPU's VS-file.

Add an explicit RISCV_FENCE(o, w) after the write to the VS-file, which
is what spin_unlock() would issue via mmiowb().

Fixes: db8b7e97d613 ("RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Why RISCV_FENCE(o, w) and not mmiowb():

- Since the mmiowb() rework in v5.2 (e.g. commit 60ca1e5a200c
  ("mmiowb: Hook up mmiowb helpers to spinlocks and generic I/O
  accessors")), mmiowb() is an implementation detail of the spinlock
  code. Explicit invocations were removed from drivers by commit
  fb24ea52f78e ("drivers: Remove explicit invocations of mmiowb()") and
  from the documentation by commit 915530396c78 ("Documentation: Kill
  all references to mmiowb()"), so adding a new direct caller would go
  against that.

- RISCV_FENCE(o, w) states exactly the ordering needed here (device
  output before the store that releases the lock), which is fine for
  arch-specific code, and it is the same instruction mmiowb() expands to
  on RISC-V. wmb() ("fence ow,ow") would also work but is stronger than
  required.

Scope: this only orders the write before the lock release. Whether a
write that is already in global memory order is guaranteed to have
taken effect in the old VS-file before kvm_riscv_vcpu_aia_imsic_update()
or kvm_riscv_vcpu_aia_imsic_release() reads and clears it is a separate
question, see https://github.com/riscv/riscv-aia/issues/172. If it
isn't, these paths will also need to drain the old VS-file, and such a
drain depends on the ordering added here.
---
 arch/riscv/kvm/aia_imsic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index f17dc559a709..807bb73a129a 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -1056,6 +1056,13 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
 
 	if (imsic->vsfile_cpu >= 0) {
 		writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE);
+		/*
+		 * rwlocks don't participate in mmiowb() tracking, so order
+		 * the write to the VS-file before releasing vsfile_lock,
+		 * i.e. before the vCPU can be moved off this VS-file and
+		 * the VS-file read and cleared.
+		 */
+		RISCV_FENCE(o, w);
 	} else {
 		eix = &imsic->swfile->eix[iid / BITS_PER_TYPE(u64)];
 		set_bit(iid & (BITS_PER_TYPE(u64) - 1), eix->eip);

base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.56.0

