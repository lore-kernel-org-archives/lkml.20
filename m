Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794477447;
	b=ViJu6waQ04jI7atesyqwvAao1GGPDT1smNP3ftVQn85+mHkDV5JYyMeLLAk+/IGDTcuQ
	 EXy8WXoTmPb2bSnBxA+G2/qbXK2FrvrLMtWq4d0DwHi59CJthLkudncPI3Kv1qGfD/F+6
	 SIK++B5Ntg8a1eLVuAG/JbaLfD8ilNC2LkqmXsx8gOw9nLBKeCAH4C4hbmNZAC0JXCePH
	 PpgS99Y0dr242ZootGOc5h40VsECVYt+zJnXVhgN5oRSVShcPpzXvwVx2tDPsmWWZ/Cdk
	 NkFpkUtVLVmgJEYUJihj20dlOZad+bIpWS/k1vFiiRtK1rZNU8tWj5h7zk+phHE/d2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477447;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=jqiiq4uHfpfLzvTX6Xmz6IzqjJlJEBUHCucoOhp4Dhs=;
	b=y6ZXAh3Yu9T/HAhDW/8dFjik9eIXyDHh6qp2uCMMwPzFSgNB2kNXq9epM+gsrUXcU6KI
	 Kbizuht/oj5QgInQU8Di6Rf26kFe65tEim32X00/OZVSaOwcYq90g8DLr9x9dMkuvu1w6
	 5S+LNuJRhtrWG4qDPojnUZM6hMeGNSTJF6ljhSqb+DHg7QIsvlQOUxNnK04tJisv/tRUo
	 HOwfjq1s39DVdsycm9q9f0C2KnlgL4cEhvLclNj3Tm3xpj5e7QoAMLecuq+/5kOABxajX
	 H/nj/Mn1zwWH8yG2ibHiRuoF+b0o0BYdCaaHigdXm/dL8NOi7GNHlPog4dWe/LyhxVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=X5PU97TQ;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C98606A321;
	Thu, 12 Nov 2026 09:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31C98606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=X5PU97TQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=jqiiq4uHfpfLzvTX6Xmz6IzqjJlJEBUHCucoOhp4Dhs=; b=X5PU97TQtTBD+zXRKCHG4uxEWG
	Uy/GrmZwg3dRwY6U+0IrDGJlFb0N37nmqdUmWgV0dgmWXb0rZ1y+aGY9SbLBu+REvobTxrGHirGxs
	ZefoiBVFi+tUywwqV/B9YZxDatITV9wA+NAi/tyBdjL9Eo94mGWQ8YurfsMHJxFcP0XBz6LXTQAsf
	nRYO0P3rJjY2nIkc6S1XzY+oQF8hDmq8D3pjpy2UwRqrt1I74MWkCoqYsJuUbDXnWRlVs9g3Q7+yQ
	LQwJ8aTFF2xDjj/wEAsrlbckxdUk8jgqxHutKh0KeocHfnQjvjJQLo5g2h2ybIGioywqr5r5y9Qoc
	8rTy9Buw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xRRYU-00DsaL-2Y;
	Thu, 12 Nov 2026 09:57:20 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 12 Nov 2026 01:56:39 -0800
Subject: [PATCH RESEND v2] x86/mce: Rate-limit the CMCI storm transition
 notices
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
Message-Id: <20261112-mci_ratelimit-v2-1-a9e67055526b@debian.org>
X-B4-Tracking: v=1; b=H4sIAFyN9WoC/3XNsQqDMBRG4VcJ/2yKiRKtU4e6dmjHIiUm13qha
 klEWsR3L7h3PvCdFZECU0QlVgRaOPI0ohI6EXC9HZ8k2aMS0Kk2aakLOTh+BDvTiweeZWryXCv
 SvnQeicA7UMef3bvjWt/qyxlNItBznKfw3TeL2usfcVFSSevyzHeFObaZOXlq2Y6HKTzRbNv2A
 5MMSfOzAAAA
X-Change-ID: 20260827-mci_ratelimit-064421e2d8cd
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2732; i=leitao@debian.org;
 h=from:subject:message-id; bh=bBnk80dcEdxop2WI8jbYrbcksvn6/u8+3BMgkOHn4sE=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq9Y17rxwVd+cwIdXL3Q4rqidNC2gsiNWwN7vo/
 e54ppKscGOJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCavWNewAKCRA1o5Of/Hh3
 bfULEACiwuav1NcCpf/82LHH+yzC4DbWnjPVxlPSbm8BP0FjnMLThzrezaqpbftNN5E21m3QFB2
 oB17IxfRi/8FbjHqHzejPdYqX8iV5nIP04eDPUAdGAuDIduecPclziqJDJixmU1kwEBGtrD5baJ
 L7sXHzXFQIonei7YiThAvHCTf816GCvtCSewjrStTnUCgNOWgkd0JNnVMr4bugbITdws1OPmI8p
 /pGGiJgzFKXKsH0dcyxDV0GwlOJ6+0XBpOgspaf/wpjWAHUZRaNIyqs4oiMcwrexa3xtUmgvADQ
 EfsMpwvdNf9kFMdz5P8Glzc1XrVPsWOL2lesYCqFL47Qbh5M3/eLFFhXWwUSyFxndpEoXubvbgn
 cUcvUQpPx2UUDncbvB0GvQ1lwIMp5d2GPvIKwYiXvnGh5Cam3OmRWygUdw5siD+bMtaLggUjuK3
 lECvoSQd/WyUmpilADhCmRXYjR0XG1iaC04mEE4Jsmw56p/XhU62p+3NQ63xBVXfsqi1574NrdP
 E8l2iTzhpDXm/mdpjCDroDxEP+EcPpkh2e9dK8kVaxZSgJmxN4BdJhD5Av4MY6HRQ9ejyinW5Zx
 oAGDvHPuWlQaTKdZJ6M3+rmzfvD2i+BisuyntWPkdNxUPxWSQdxhpodoMikYUXZeJPJyWUlMYRD
 WtSakGwx1W4/lVQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

mce_track_storm() prints a line every time a bank enters storm mode and
another every time it leaves. Neither is bounded, so the log volume
follows whatever rate the bank flaps at.

One host in our fleet logged 9970726 "CMCI storm detected" and 9970734
"CMCI storm subsided" lines for a single bank over four days, which is
a bit excessive for all monitoring purposes.

Put both transitions behind one ratelimit.

Signed-off-by: Breno Leitao <leitao@debian.org>
Acked-by: Tony Luck <tony.luck@intel.com>
---
Changes in v2:
- rebased on linux-next
- Link to v1: https://patch.msgid.link/20260827-mci_ratelimit-v1-1-ac43df769b36@debian.org
---
 arch/x86/kernel/cpu/mce/threshold.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/threshold.c b/arch/x86/kernel/cpu/mce/threshold.c
index 6c370d5af5bd23..8591715ce24306 100644
--- a/arch/x86/kernel/cpu/mce/threshold.c
+++ b/arch/x86/kernel/cpu/mce/threshold.c
@@ -4,6 +4,7 @@
  */
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/ratelimit.h>
 
 #include <asm/irq_vectors.h>
 #include <asm/traps.h>
@@ -111,6 +112,13 @@ void cmci_storm_end(unsigned int bank)
 		mce_timer_kick(false);
 }
 
+/*
+ * Shared by both transitions so that a bank flapping between them cannot
+ * outrun the console.
+ */
+static DEFINE_RATELIMIT_STATE(storm_rs, DEFAULT_RATELIMIT_INTERVAL,
+			      DEFAULT_RATELIMIT_BURST);
+
 void mce_track_storm(struct mce *mce)
 {
 	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
@@ -150,13 +158,17 @@ void mce_track_storm(struct mce *mce)
 	if (storm->banks[mce->bank].in_storm_mode) {
 		if (history & GENMASK_ULL(STORM_END_POLL_THRESHOLD, 0))
 			return;
-		printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm subsided\n", smp_processor_id(), mce->bank);
+		if (__ratelimit(&storm_rs))
+			printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm subsided\n",
+					smp_processor_id(), mce->bank);
 		mce_handle_storm(mce->bank, false);
 		cmci_storm_end(mce->bank);
 	} else {
 		if (hweight64(history) < STORM_BEGIN_THRESHOLD)
 			return;
-		printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm detected\n", smp_processor_id(), mce->bank);
+		if (__ratelimit(&storm_rs))
+			printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm detected\n",
+					smp_processor_id(), mce->bank);
 		mce_handle_storm(mce->bank, true);
 		cmci_storm_begin(mce->bank);
 	}

---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20260827-mci_ratelimit-064421e2d8cd

Best regards,
--  
Breno Leitao <leitao@debian.org>

