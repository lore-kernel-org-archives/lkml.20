Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790107;
	b=fDJwpeYZ2LnrrhilCcDqxJDH30Q+yP8SbJ9+vZwzF5bFajEtVE5MIyNRTB8zj25R8eFV
	 UhDScaKehiroxvATBtHbV/cIBfSIFzVLR7+EM6y/E/IuEH40B1YzEKDFdYnflyuooRn6X
	 ee3Y5a9LZmAM7miE3kVEqhYCYykIa1VoEArIcoFyVkURjCcAPAJyBEqZ00hCIXKwHS1xB
	 xyiVHOzp7W8h+x3YnUjwcvXEXgjIC3gH5U98XJIKuhUoe7gzlOArtGFumOKy/n4CMJxKK
	 70H4H2jC8MR4NOhIj7KRgSoatS3iyAFsujRLCA2iKn4y4p0xvPLIc0IT52EWjtABIAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790107;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=4RRKenf4WMdsMoazXVn5Fv1nREnywQlVZbcXmB+WYTw=;
	b=Uvw2BSUXMZK+gpOGkIF6PctnDV+w//3Gg8no/5Ap7ZR6oIztVD3Zg6nkQMNQQ9V2q69o
	 VTX6FKQ4yRznWeq14fBsIzNGwFvJyjDdcnIEJmIWjB9KFpWRaPDD9ECQqahiP8ZUKPx1X
	 ecp/QR82QenzSKKDk8ex6U1X7e8d+jh3F1dD1uTMLKjrtDu5zH1prSac+O+i12s5y1Xpc
	 B7sYz6Qi0H6ax7iA9i6iTdICncOX9SwvK8AqtuUQ/JE7PCr5jvLDuqLgp4ggsLgNdEDui
	 Yafe7MYICeuEOaGNX7kCRu1j4QYXY5WF3IqpNB1IiVRCmiZthn4B5WvaO+cuha92xBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WJNcnSxf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A33606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WJNcnSxf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C45E1F01825;
	Fri, 23 Oct 2026 21:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792790106;
	bh=4RRKenf4WMdsMoazXVn5Fv1nREnywQlVZbcXmB+WYTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WJNcnSxfpbyU3D717qRFVvJDOAEXGegP3j4BB6QIPJhFZU3URyjDgqX1B69krN7VC
	 xTGkKefJjeEBjJ/k1P9LUx5TMEuAiJt2nKVgLGDD1BKOJyekdNuJ8b7g1KHUx4Dm9Q
	 1vupbgplhZnYv3yhRKoMlwdYihHXCleNmqhVLONAOZrnSxKyXNNUsCa9Gm1K/jVd6s
	 MIPRWfiwWuvNeNgVTqptqn4SO+n5tShA1/ciGLtYzlfmvttVPycNNP88FjqGuv2Ysb
	 hcPV1hHjBUySogAdlKpcQ/Wt2iO3QYhvEBE7EyYz7dhvcTAHXAtkDvmNcK2QWDjBDu
	 8DLk3DI0kAHDg==
From: Sasha Levin <sashal@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] powerpc/irq: Fix build with CONFIG_PROC_FS=n
Date: Fri, 23 Oct 2026 17:15:03 -0400
Message-ID: <20261023211503.3764302-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2331292e-1a40-44ef-8776-9155e8e41f03@linux.ibm.com>
References: <2331292e-1a40-44ef-8776-9155e8e41f03@linux.ibm.com>
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

Commit fbb22ceaaf8f ("powerpc/irq: Make irqstats array based") made
arch_show_interrupts() call irq_proc_emit_counts(). That function lives
in kernel/irq/proc.c, which is only built with CONFIG_PROC_FS, so
kernels without procfs no longer link:

  powerpc64-linux-ld: arch/powerpc/kernel/irq.o: in function `arch_show_interrupts':
  arch/powerpc/kernel/irq.c:134:(.text+0x4b8c): undefined reference to `irq_proc_emit_counts'

arch_show_interrupts() is only called from irq_seq_show(), which is in
kernel/irq/proc.c as well, so build it only with CONFIG_PROC_FS, as x86
already does.

Fixes: fbb22ceaaf8f ("powerpc/irq: Make irqstats array based")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609271531.8kf2NTjK-lkp@intel.com/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

fbb22ceaaf8f came in with bb2235894a8a ("Merge tag 'powerpc-7.4-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux"), so
mainline is affected now. Build-tested with the ppc64 randconfig from the
report, a ppc32 tinyconfig with LD_DEAD_CODE_DATA_ELIMINATION disabled
(it hides the error otherwise) and ppc64_defconfig.

 arch/powerpc/kernel/irq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index bce546931a13b..55bcf0326f5a9 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -122,6 +122,7 @@ void inc_irq_stat_and_enable(enum irq_stat_counts which)
 	set_bit(which, irq_stat_count_show);
 }
 
+#ifdef CONFIG_PROC_FS
 int arch_show_interrupts(struct seq_file *p, int prec)
 {
 	const struct irq_stat_info *info = irq_stat_info;
@@ -155,6 +156,7 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 #endif
 	return 0;
 }
+#endif /* CONFIG_PROC_FS */
 
 static int __init irq_init_stats(void)
 {
-- 
2.53.0

