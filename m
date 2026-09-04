Received: from mta0.migadu.com (out-2.mta0.migadu.com [91.218.175.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6D13EC69D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788517900; cv=none; b=KjcSVwjFibwiZQYQDcHHTFwVzy5M1tREeaMEVe07SxPQpiMb4MQAKvkdSUfzkjxKL5YPczZs4wzLd6F8or9ibcmU/hL6xSwRHlqqPSTj0B4p1UDvIlhhHB/uIvLpjvtEcDEjTcMfrXtPdnuBFppoSxq8JjP5Za4LWvd6ygfC6Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788517900; c=relaxed/simple;
	bh=OLJizthyKrO2zpeWP4eJulHLA4vB+jyIjME5M7weTWw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uj3CZvvPvAiHC4ADRZDP0BrmywxeADSp6X0rsOKZ7zRf8tS0b6BAxrqs9pD37l66NkbG4MR/y2zunUosi+U39H+6vbsjSjqp39iSJxzTe8MyLRx84Q9lZ8zl5P3QsIdpFddwldZhBm5fe7mkuyvErMe1covzAMPMsPUCgzfCq/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AAI87MBb; arc=none smtp.client-ip=91.218.175.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AAI87MBb"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OLJizthyKrO2zpeWP4eJulHLA4vB+jyIjME5M7weTWw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788517896; v=1; x=1789122696;
 b=AAI87MBb5uqbkHf7mqya7LRTyitjfPgTcL6DSNEwJOkeEAUGdRx0r2SIU647qPHF4/9MSMrj
 ALW5Mokbv/92OaOjdmkY99eaTZBM5vkzApPPfcFRg7TXg7h5AqoXHFvffUI4CNrsZ7IGcS7JGFr
 cOwTVEisY+aJ1j2aL82E/wvU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ae322256d77e21c4;
	Fri, 04 Sep 2026 10:31:36 +0000
X-Mizu-Trace-ID: ae322256d77e21c4
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Xi Ruoyao <xry111@xry111.site>,
	Marc Zyngier <maz@kernel.org>,
	Bradley Morgan <brads@mainlining.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: mpam: Document when to set arm64.nompam
Date: Fri,  4 Sep 2026 11:31:31 +0100
Message-Id: <20260904103131.627392-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arm64.nompam skips the MPAM2_EL2 and MPAMHCR_EL2 writes in
finalise_el2_state and leaves the ARM64_MPAM cpucap unset. Where EL3
firmware has cleared MPAM3_EL3.TRAPLOWER, the EL2 trap controls are
left unwritten, at reset values that are UNKNOWN, and KVM still hides
MPAM from the guest but no longer enables the traps that stop a guest
from using it. KVM never saves or restores MPAM0_EL1 and MPAM1_EL1, so
what one guest writes reaches the next guest and the host. Nor can the
kernel make the EL2 writes unconditionally: they trap to EL3 on the
firmware the option exists for, and TRAPLOWER cannot be read below EL3.

Say so in mpam.rst, and add the rule and a pointer to the
kernel-parameters entry.

Suggested-by: Ben Horgan <ben.horgan@arm.com>
Link: https://lore.kernel.org/all/CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Changes since v1, the first three from Ben Horgan's review:
     - Put arm64.nompam under a new "Command line parameters" section.
     - Separate MPAM3_EL3.MPAMEN from TRAPLOWER, which v1 conflated.
     - Add that KVM does not save or restore MPAM0_EL1 and MPAM1_EL1.
     - Drop "No functional change intended." from the commit message.
    
    Bradley Morgan's Reviewed-by on v1 is not carried over: both
    paragraphs, the section heading and the commit message changed.
    
    v1: https://lore.kernel.org/all/20260903084809.2027326-1-fuad.tabba@linux.dev/

 .../admin-guide/kernel-parameters.txt         |  3 ++-
 Documentation/arch/arm64/mpam.rst             | 25 +++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd24..e6d543de3cde5 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -575,7 +575,8 @@ Kernel parameters
 			Set instructions support
 
 	arm64.nompam	[ARM64] Unconditionally disable Memory Partitioning And
-			Monitoring support
+			Monitoring support. Only for a machine that does not
+			boot without it. See Documentation/arch/arm64/mpam.rst
 
 	arm64.nomte	[ARM64] Unconditionally disable Memory Tagging Extension
 			support
diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
index 67fe515ed501c..e66b1359d1282 100644
--- a/Documentation/arch/arm64/mpam.rst
+++ b/Documentation/arch/arm64/mpam.rst
@@ -87,6 +87,31 @@ The supported features are:
   MBWU monitors can be exposed to the user after support for more monitoring
   scopes is added to resctrl.
 
+Command line parameters
+=======================
+
+arm64.nompam
+------------
+Firmware controls MPAM through two bits of MPAM3_EL3. MPAMEN enables
+it: while set, the PARTID and PMG in the MPAMn_ELx registers label the
+CPU's memory requests. TRAPLOWER, which resets to 1, traps accesses to
+the MPAM system registers from the lower exception levels to EL3.
+Firmware must clear it, or handle the trap and emulate MPAM as disabled.
+Where it does neither, the CPUs still advertise MPAM in the ID registers,
+the kernel's MPAM register accesses trap to EL3, and the boot fails.
+``arm64.nompam`` exists for that firmware: it makes the kernel treat the
+CPUs as not implementing MPAM, so no MPAM system register is accessed.
+Set it only on a machine that does not boot without it.
+
+It is not a way to turn MPAM off. Where firmware has cleared TRAPLOWER,
+the option leaves the trap controls in MPAM2_EL2 and MPAMHCR_EL2
+unwritten, and their reset values are UNKNOWN. KVM still hides MPAM from
+guests but no longer enables the traps that stop a guest from using it,
+so a guest may be able to read and write MPAM0_EL1 and MPAM1_EL1. KVM
+does not save or restore them, so what one guest writes is still there
+when the next guest runs on that CPU, and when the host does. With MPAMEN
+set, EL0 and EL1 requests then carry that PARTID and PMG.
+
 Reporting Bugs
 ==============
 If you are not seeing the counters or controls you expect please share the
-- 
2.39.5

