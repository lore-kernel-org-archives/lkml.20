Received: from mta1.migadu.com (out-50.mta1.migadu.com [95.215.58.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF4B39CCFB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425294; cv=none; b=Wpd/BKnyRjjFS6HcMpd2PsuOS6YcpONppt5rfWo0lqqMnS0npIMxkyugIY+5aG7q92VaedypONNrPcXGWwKBfXfampG7X9r+mRGiB4JuKA3uUac990wHlgwSvhkmhmPkHTMHASpGUWID1uvm8eFvJ/qpSRboUurSxkKleS6IDaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425294; c=relaxed/simple;
	bh=NWMRK+GPEMa03FgrNppDLMXx2SicTPa6+EtTE3P7NXs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L/CPU6HESifBQvPj3B8SzJHJN+n5Ye4y5VDlzXz6TpRcCtf1hA0q4wwhebM5Tw7nedX210jIQqbeaM/wWdjypx+m4nuBzRx+m63P/vauXCBKfxm7DT+kUsJu/ZoBkcBZCKfBjlRvzdxxzWyc510ReWxxPoIu/Ne5CMxTV2Bv30w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vQS2tlsV; arc=none smtp.client-ip=95.215.58.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vQS2tlsV"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NWMRK+GPEMa03FgrNppDLMXx2SicTPa6+EtTE3P7NXs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788425289; v=1; x=1789030089;
 b=vQS2tlsVHL2HyZcYCZvITy5RYNIG79AxOYEVPnXooabg3qtz34Rd7i4bnm3JAHHFqocIQNae
 8RCWXpAdd/IpGt6UKmNo/jfu5qlN4eWpki8GVd7IgOXrBZO7L4IpU3kPrmfCoTZ/HQxL4en9vsp
 xh6VuOLoDM4zWKDBp97TbLhw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 57dd58152e2447bb;
	Thu, 03 Sep 2026 08:48:09 +0000
X-Mizu-Trace-ID: 57dd58152e2447bb
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
Subject: [PATCH] arm64: mpam: Document when to set arm64.nompam
Date: Thu,  3 Sep 2026 09:48:09 +0100
Message-Id: <20260903084809.2027326-1-fuad.tabba@linux.dev>
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
firmware has enabled MPAM, the EL2 trap controls are left unwritten, at
reset values that are UNKNOWN, and KVM still hides MPAM from the guest
but no longer enables the traps that stop a guest from using it. The
kernel cannot restore the writes: they trap to EL3 on the firmware the
option exists for, and MPAM3_EL3.TRAPLOWER cannot be read below EL3.

Say so in mpam.rst, and add the rule and a pointer to the
kernel-parameters entry.

No functional change intended.

Suggested-by: Ben Horgan <ben.horgan@arm.com>
Link: https://lore.kernel.org/all/CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/admin-guide/kernel-parameters.txt |  3 ++-
 Documentation/arch/arm64/mpam.rst               | 17 +++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

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
index 67fe515ed501c..67c8a95391171 100644
--- a/Documentation/arch/arm64/mpam.rst
+++ b/Documentation/arch/arm64/mpam.rst
@@ -87,6 +87,23 @@ The supported features are:
   MBWU monitors can be exposed to the user after support for more monitoring
   scopes is added to resctrl.
 
+arm64.nompam
+============
+Firmware must enable MPAM at the highest implemented exception level and
+leave the MPAM system registers accessible to the kernel, or trap the
+accesses and emulate MPAM as disabled. Where it does neither, the CPUs
+still advertise MPAM in the ID registers, the first kernel access to an
+MPAM register traps to EL3, and the boot fails. ``arm64.nompam`` exists
+for that firmware: it makes the kernel treat the CPUs as not implementing
+MPAM, so no MPAM system register is accessed. Set it only on a machine
+that does not boot without it.
+
+It is not a way to turn MPAM off. On a system whose firmware has enabled
+MPAM at EL3, the option leaves the trap controls in MPAM2_EL2 and
+MPAMHCR_EL2 unwritten, and their reset values are UNKNOWN. KVM still
+hides MPAM from guests but no longer enables the traps that stop a guest
+from using it, so a guest may be able to choose its own PARTID and PMG.
+
 Reporting Bugs
 ==============
 If you are not seeing the counters or controls you expect please share the
-- 
2.39.5

