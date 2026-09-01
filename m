Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEA648AE39
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284526; cv=none; b=rr9aGRoz9mTKZyhFc9M0LkiQz6ixY7OpaPkGBgCHDy3J9trFyCMrHQF9LtmFGq0q9jfpJidWzbTp52n/rsDPpS/TlFW5UjXuWmXSBo3afmvTNut71D7uiszTVCDFWq9QDtNsDT3vRhJKdF5Tc34BwqpXZ33Oi/WyPm3JGEBwTpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284526; c=relaxed/simple;
	bh=28ej9lX6BTa8SavizmAaCMmgCQFPdsywzv1lKDVkBbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M8h6gs4yKE3T6zC+tNvK3wYhWGVUgV2ybqV5hWz8eLMbCdzw6NQufcrEVr+5BwKXegr+rtPDmftlcJgjAqYSC6m6kzYVSC7hXfoSqam/QtKaUyZX0ilERA1eKdVcMWIluGPw+QQ+yVe1vG7ey3Vtkn47vLgG9RAxhXfEieDhTSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UO6SaejV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UO6SaejV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D4551F000E9;
	Tue,  1 Sep 2026 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788284524;
	bh=QHCoVKDwev31CZRQgniIkI3MubB2o6wMEg0d+8Q2S+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UO6SaejVNgcQzvC5/BZJaDHJ7aLmqg/7YjrsXM9qGV2ZGgLYQ2pzLgLIgOBSJM6zd
	 oQSBdXyof/2Huf41qiaVlNmJMCWAR+5Kk2IVmf84ykntKNRW5MNOAoLh5H7oTWzPkR
	 gVfZodXqMi0Ft1uoJkwXjpnPSE2bU8NQbPFI/i5K1xz2eMbY6zwsM79l4/Jz6PTMJK
	 J14uTqM7BU5gKsWQz2/FgIiCFNM10njjQzKSTQpL4eoNspRao1vaknUhA/wwx+RBUt
	 5stkoSijDPV4Cekne5FBbauGUzwgcTEtjqmU82i6hpE1rWcD5TK4lZ20nm/YavYNLL
	 HKZSF+iNuUqww==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 18:38:42 +0100
Subject: [PATCH v11 2/2] arm64/sve: Disable TIF_SVE on syscall once per
 second
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-sve-trap-mitigation-v11-2-be8095543a46@kernel.org>
References: <20260901-arm64-sve-trap-mitigation-v11-0-be8095543a46@kernel.org>
In-Reply-To: <20260901-arm64-sve-trap-mitigation-v11-0-be8095543a46@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, 
 Ryan Roberts <Ryan.Roberts@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2616; i=broonie@kernel.org;
 h=from:subject:message-id; bh=28ej9lX6BTa8SavizmAaCMmgCQFPdsywzv1lKDVkBbQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlw5kwTcSK4+P1IfePYLoFIca4cm3IuwS2ecaw
 2V2ztIVGBeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcOZAAKCRAk1otyXVSH
 0CJdB/9sv51gCXyxJkI/luXlMaw2mdmESC8ijFo7ANiG+trh1UAzYTdwBzy7wbnXsV9C0hn6trO
 kFQbXwXKtUJN0OkML0jbysWxI8SEvIhfIYC5JMwAqcbLO7eAGEDOld2p2vi77wG3oOf9qFfI0YI
 IsA6BFPFzg3fQhbnY48ohCEUF7xc0QiaaVMUGrxs240XvwFfw2vYWFtW6XWNCtJPN4Rcna/pJAx
 dCxGPhie3m3/hgpHo6x3dJKAMSAvW8Rt+Z50xAONC1qhAWjnSU/BbIScbmultToUXtyKktsJK9F
 0mV8jRmUJfo5+CIU4UeKlIvK9KoVy/iofcXsxN/UXE/ewPbh
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Our syscall ABI requires that when performing a syscall the portions of
the Z registers not shared with the V registers, the P and FFR registers
are reset to 0.  Since we have no way of monitoring EL0 SVE usage this
is implemented by changing the in register values on every syscall for
tasks which have SVE enabled, for systems with 128 bit SVE vector
lengths this has been benchmarked as a 6% overhead.

We currently support disabling SVE for userspace tasks when loading the
floating point state from memory during a syscall, allowing tasks that
use SVE infrequently to avoid this overhead, but this may not help CPU
bound tasks if they are not fortunate enough to block or be scheduled
during a syscall.  This is done whenever the state is loaded from a
second after the last time the task generate a SVE access trap.

Extend this mechanism to also apply during syscall entry, disabling SVE
instead of flushing the live registers when we perform a syscall a
second after the last time a SVE access trap was taken.  This adds an
additional memory access and branch for tasks using SVE and means that
CPU bound tasks actively using SVE will take extra SVE access traps (at
most one per second) but will allows CPU bound tasks that infrequently
use SVE to avoid the overhead of flushing the registers on syscall.

On a system with 128 bit SVE vectors fp-pidbench shows a roughly 4.5%
improvement compared to baseline after having used SVE, for a roughly
0.4% overhead when SVE is used between each syscall.  Obviously this is
very much a microbenchmark.

This is purely a performance optimisation, there should be no functional
change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/entry-common.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 72c03ccea59f..475c22e103fb 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -274,8 +274,19 @@ static inline void fpsimd_syscall_enter(void)
 	if (!system_supports_sve())
 		return;
 
-	if (test_thread_flag(TIF_SVE))
-		sve_flush_live();
+	if (test_thread_flag(TIF_SVE)) {
+		/*
+		 * Ensure that tasks that don't block in a syscall
+		 * also get a chance to drop TIF_SVE.
+		 */
+		if (unlikely(time_after(jiffies,
+					current->thread.sve_timeout))) {
+			clear_thread_flag(TIF_SVE);
+			sve_user_disable();
+		} else {
+			sve_flush_live();
+		}
+	}
 
 	/*
 	 * Any live non-FPSIMD SVE state has been zeroed. Allow

-- 
2.47.3

