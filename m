Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A10F479897
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469485; cv=none; b=OhlX+kedHXCiMKbn/QbKfJIXj13JHOunLhn9OdkCZz5NMy2yOMb15XahRv3LIeWDEXM33oxXh33C8QUWrjFAzgdY8Vr2JGbURYq9zj8W4e5cxZt1frFj6Cq/XBUIqrE3mB+LHIh3jzu9BEbmxISRO4Pe6pvawv1qWuR3KlKD6yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469485; c=relaxed/simple;
	bh=trxelnov8Sfi++Tk3mF45/JptIEUcraXfpyfn0BOGpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XBAaOXKb8B/W7w/WBI3fVAMoCTMueGafZCzhovHqRyoRH3cDFFKkGVCS7JTo/kilCxSENAwk+f76rlLUySjBk2cnvzYp90odaGO7pAC/FSpb6YnbS789xW490VNBUNxSjsT2NjU7bQx9NFLSZokpznEEFg57UcFxqhomOSmC6aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=OJlYNW0C; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="OJlYNW0C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=FL+6HXbWXh+iDk/TrAVnA6F0WnMwzZyRgHabDYWNTs4=; b=OJlYNW0CUWdE0HaXJoqLHvtXpg
	VwYxLEa3cDkCFrWKlmxtWY5hFQ7dAlUbWKA9T59NSfa0nBuESAAKp0TGDgEYJcylXdKyI87/wDKrN
	FxNieQTktRsprYKWBNGLYFphw7nKYyfuvAs7cEKJKqGcNQGUgo9xXCqLEuPiLmxhv1z3vkTWuiKUI
	FCx9XFnYgZKaovH0Z+nwv6WRTXOnVN7DjEBymKsKn267KKnOsipeMexeqh1T7z662Rf8r5hnraG3Y
	Ej1xcTRG9JMh4mZVFKD27kuy5EZvnBRY/RO+bzR3bP9Cej8bg0fzMVTvUeb71KbFyGLmFNkugD3m/
	kA3z5zPQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x6Qkn-004L4t-0C;
	Tue, 15 Sep 2026 10:51:10 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 15 Sep 2026 03:51:05 -0700
Subject: [PATCH v2] arm64/sve: Don't zero the SVE state buffer when the SVE
 state is live
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-arm64-sve-acc-memset-v2-1-14b7ab9c71bd@debian.org>
X-B4-Tracking: v=1; b=H4sIABgjqWoC/3WNQQ6CMBBFr0Jm7RhaShFX3sOwKGWEMYGaFhsN4
 e4WjEuXL/n/vQUCeaYA52wBT5EDuymBPGRgBzP1hNwlBplLnddCYKvQ+FErDJHQWIsjjYFmLJQ
 sTVfq6lRWkN4PTzd+7eZr8+XwbO9k5023LQYOs/PvPR3FtvtV1N9KFCgwNbQmpWRRF5eOWjbT0
 fkemnVdP8JYmyHRAAAA
X-Change-ID: 20260911-b4-arm64-sve-acc-memset-3425ad567857
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: rmikey@meta.com, kas@kernel.org, usama.arif@linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2475; i=leitao@debian.org;
 h=from:subject:message-id; bh=trxelnov8Sfi++Tk3mF45/JptIEUcraXfpyfn0BOGpw=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqqSMa8G3X4zFwpaQAvP0/Q7gLylF9LFvpaIDUa
 7KKxnIpAoqJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqkjGgAKCRA1o5Of/Hh3
 bTPGEACUE2a2Mk3/AxEpkD8NXuS3g15y/3zI6EvkIj5zScREazsHzBHwV4e/RNmYDx1xlXi6rQE
 P9ide2CqjLlQjZUWFQXp3e/kInnutEckmEoXMWRpgtHi9NalpXmwLK1h+Xn+oLCZ/YwdjBRpWQG
 OLQiXyqu7HbHkQlsSE9zanIdTqVBlOFZE6N8dt9I9tgPW/1M9WLUfG0FQHs+QFF17k2yZMFVRdz
 qqidHHuofHpCohr43jdkgP1mcFAE9W/WUzCoi8xVXi1zlZEw5MTNHOwaTwePf0trRwlBbTf6F7L
 VQ9Q2st2Q9lClMUWtRTVY+B4O0+bQxUC+s77jsR4dRsJ1TMGQx99VLFSY9Z21ec5TeKpU3KXlLg
 327S/bF9f/3aBkAZDrMFbdN5lMb4kR2GS3L/Jg+siIbHH45UfEE4suV/mGxEfANRrry5ipMkXvg
 Ehs712x6gru4HgMpSlC4lcWp3eJfwEitBNjyFAQASaPXzrQcFuzWeNroT10JjsEE/QKASFGGkRE
 h7N2yvw73YR+ia2VzlqKRJszQQCCJXkLA3QZaAZAStHlpPjvcIvESbtu/2orrgLghjYfbPQtpwQ
 mluUQGB9oSWv8fg+iQGGaDpIuFNZDGz3ONFF4tY6f305W8dY2WsZGgtaWOhfXGx2Pwl93hAUEes
 UAwGm384dbH852g==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Currently do_sve_acc() always zeroes current->thread.sve_state. This is
not necessary in the common case, and avoiding the zeroing has a
measurable impact on some benchmarks.

In the common case where the task is not preempted and its state is not
altered by a tracer, do_sve_acc() will observe that TIF_FOREIGN_FPSTATE
is clear. In such cases, only the live register values matter, and the
in-memory copy is stale regardless of whether it is saved in
FP_STATE_FPSIMD format or FP_STATE_SVE format.

It is worth skipping the zeroing because the SVE state is discarded on
syscall entry, so userspace that mixes SVE and syscalls re-traps
constantly. A fleet profile of arm64 hosts running services whose
memset() is SVE shows the memset under do_sve_acc() accounting for 29%
of the trap handling cost.

Measured on a 72-core Neoverse V2 (SVE VL 128, sve_state_size 546,
performance governor) with perf bench sched pipe pinned to one CPU, and
SVE operation on write, so that each loop also takes an SVE access trap.

	* -0.99% kernel instructions
	* -1.38% kernel cycles
	* -1.12% wall clock

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v2:
- Rewrote the commit message using Mark's suggested wording: what
  matters is that the in-memory copy is stale whenever the state is
  live, not the format it was last saved in
- Link to v1:
  https://patch.msgid.link/20260914-b4-arm64-sve-acc-memset-v1-1-67866e442393@debian.org
---
 arch/arm64/kernel/fpsimd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e7f1682a3059b..324c9799b0511 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1316,7 +1316,7 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
 		return;
 	}
 
-	sve_alloc(current, true);
+	sve_alloc(current, false);
 	if (!current->thread.sve_state) {
 		force_sig(SIGKILL);
 		return;
@@ -1341,6 +1341,7 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
 		sve_flush_live();
 		fpsimd_bind_task_to_cpu();
 	} else {
+		memset(current->thread.sve_state, 0, sve_state_size(current));
 		fpsimd_to_sve(current);
 		current->thread.fp_type = FP_STATE_SVE;
 		fpsimd_flush_task_state(current);

---
base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
change-id: 20260911-b4-arm64-sve-acc-memset-3425ad567857

Best regards,
--  
Breno Leitao <leitao@debian.org>

