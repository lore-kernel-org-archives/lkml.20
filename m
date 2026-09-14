Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDF7353A6B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390443; cv=none; b=e29B5BI+HQQFhAbsHv8s1YGMK7sHPTApQtnQzlqDDfitr8J7lERTcC1etOSID/F1JQISSrlwoO6/6Eq+H/uF9Nxyj2L7DrD+ohpFqk2u82DwDXbyY3lHWZ/8Br8CoP/nR89d5fSSh/UO/mfAxgr6kn9l5PKOhPx9l+stUM0Z1cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390443; c=relaxed/simple;
	bh=d4yjH8bCQ+l8oqrjODfhWCpdEI5G8jAK0XSVhLhF4pw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZjLk8n356cfNWYDLmkdopTuTtygNgMQejY2A8eu1l6xOdVScDKudjOd29YFL+OyGGtWUt8Zrjga3006fHOpV8XwTNenU73mbye0IFlZr3MKzm4eSyIuLF4Ct9YWUZ0zQC+QZOZ5eMawWrCrCOPqi0lSTAyFREyZL8nOFkIexiIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=YlOrGmas; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="YlOrGmas"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=f8lJesP+ZTGzgL035Yych4uGb5BB7gh+t5hv1G28/bg=; b=YlOrGmasgaLjfX+yM05eLKblQy
	4hsRikt21/1Dz0OWzkLxNmTem3Fbp9ahRCnFPFQdPfy7H+L45Dqy6OFaxkhk9jXAb9BR4EFWe2XwP
	OYnwcGn5AKDBn6mG4P9xFVdMKgaGlcUG4lenOJgmXcrUA6QizlGCzTDVzl0BkuIO9Tkzw3Ttq8s6m
	7Syiqi3Pjj8PXdkT8BdL9Dk968VTO9KgaShs/tfr18DHQRrQZh6xOqN+fbanzh/QhpQwZd7vBbiXH
	d1rYlneSjVWI1mqfbEAvcAgGcOxCDG3tCqFxf1oh3U+J8wl4s0dD6HQ6s390DcXVLJhWBNggNOPo4
	CQiEPJmg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x66C0-003d0W-1O;
	Mon, 14 Sep 2026 12:53:52 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 14 Sep 2026 05:53:34 -0700
Subject: [PATCH] arm64/sve: Don't zero the SVE state buffer when the SVE
 state is live
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-arm64-sve-acc-memset-v1-1-67866e442393@debian.org>
X-B4-Tracking: v=1; b=H4sIAE3up2oC/yXMQQrCMBBG4auUWTvQxCRVr1JcpOmvjpAqmVqE0
 rsbdfkt3ltJUQRKp2algkVUHlOF2TWUbnG6gmWsJtva0B6N4cFxLDk41gUcU+KMrJh576yPow/
 dwXdU62fBRd6/c3/+W1/DHWn+7mjbPqIhNbB7AAAA
X-Change-ID: 20260911-b4-arm64-sve-acc-memset-3425ad567857
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=4716; i=leitao@debian.org;
 h=from:subject:message-id; bh=d4yjH8bCQ+l8oqrjODfhWCpdEI5G8jAK0XSVhLhF4pw=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqp+5YbQEUn/Nuf9F5fNgIQrT+TXUQGh2k0Nu3c
 tVTCbd4dcOJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqfuWAAKCRA1o5Of/Hh3
 beSQEAChfa8/EXj0dBCMkeskmnio3vvzoeo97WRDaYgS6oPMTl8RhCW9bq/ijQZ9I78KTtYEAVi
 uRHM9YTcrQO5v4M5Cik9brrgZWoeFKkuXMxhvdCA8WT1YMwGrLm3OrY71bojIw4F4110WUAFiKc
 LkSpyX4uzRY0CqhKIhWBINL4Vd77k7P9U+98OxZyJHzKxYgaI5kyBilWPN9C8rOLMae/Iwi+eF4
 D2DteIBrWA3bdsv5tYsasAzwLAXBOl2cAqiSV7bOkFtBInnfvEt0WitTxkt5OOmOYLHFE2wEPto
 BDJ5W2WtgkFX80P0Kjgf6kC9tzuSMHD5BcAFrdHhOZO8MWI2r4swV4tiPdsCjUWQkyiOLWm4Iai
 T7uVKBxkLTpdS2Agy5EsD62E+mIW4c3ppPa82X1+zV1bzO2OXlLIi/PZRUqFCZ00nZ8bV4gq9Im
 e4hs1gUMRMqvH+eWCZOhG9SFdgI95OuqUd1BpPlVuDtUdhR+fr9Oefsn/I0zVGhtxEK+QigOHQs
 LvHCyq7QOhVBscDPiTUWOOawQFXbOkx/XZ56ad/QrHuO2aM9WKpxz5aepJtgNDPS7eMt9XR2orl
 wQ8PUqjCDLW/kcwtz7XT3rDZXsTKStFx5PGoFwi5F0TrxCGDE1D0+lhmctOeEP/PkHZW2ssCEt8
 +UEwsEE1nxLXoWg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

do_sve_acc() calls sve_alloc(current, true), which memsets the whole
task->thread.sve_state buffer whenever it is already allocated.

Reviwing this code was not trivial giving the ABI here, and the
exceptions (syscall vs context switch), but, I think this it makes
sense.

On the common path the buffer is then never read: when
TIF_FOREIGN_FPSTATE is clear the state stays in the registers,
sve_flush_live() zeroes the non-FPSIMD part of them, and
fpsimd_bind_task_to_cpu() re-binds the task. Only the
TIF_FOREIGN_FPSTATE path builds the state in memory via fpsimd_to_sve(),
which writes just the low 128 bits of each Z register and so needs the
rest pre-zeroed. do_sme_acc() already allocates the same buffer with
sve_alloc(current, false), so this also makes the two trap handlers
consistent.

Skipping the zeroing on the live path is safe:

1) On entry to do_sve_acc() thread.fp_type is FP_STATE_FPSIMD. That is
   how TIF_SVE came to be clear in the first place: task_fpsimd_load()
   only clears it in the FP_STATE_FPSIMD case, and an SVE trap cannot
   be taken from streaming mode.

2) While fp_type is FP_STATE_FPSIMD, thread.sve_state is by definition
   stale. The state machine comment above task_fpsimd_load() says it
   "must not be dereferenced and any data stored there should be
   considered stale and not referenced".

3) Every reader honours that. task_fpsimd_load() loads the buffer only
   in the FP_STATE_SVE case; fpsimd_sync_from_effective_state() and
   fpsimd_sync_to_effective_state_zeropad() test fp_type first;
   ptrace's sve_get_common() reaches it only when
   sve_init_header_from_task() chose SVE_PT_REGS_SVE, which requires
   fp_type == FP_STATE_SVE; and preserve_sve_context() copies it out
   only for a non-zero vq, which needs fp_type == FP_STATE_SVE or
   streaming mode.

4) fp_type becomes FP_STATE_SVE in exactly four places, and each has
   written or zeroed the whole buffer by that point:
   fpsimd_save_user_state() immediately after sve_save_state(); the
   TIF_FOREIGN_FPSTATE branch below, after its memset and
   fpsimd_to_sve(); and ptrace sve_set_common() and signal
   restore_sve_fpsimd_context(), both after their own
   sve_alloc(target, true).

5) So nothing can observe the bytes left stale here. The buffer only
   becomes readable at the moment something has just written all of it.

This is worth doing because the SVE state is discarded on syscall entry,
so userspace that mixes SVE and syscalls re-traps constantly. A fleet
profile of arm64 hosts running services whose memset() is SVE shows the
memset under do_sve_acc() accounting for 29% of the trap handling cost.

Measured on a 72-core Neoverse V2 (SVE VL 128, sve_state_size 546,
performance governor) with perf bench sched pipe pinned to one CPU, and
SVE operation on write, so that each loop also takes an SVE access trap.

	* -0.99% kernel instructions
	* -1.38% kernel cycles
	* -1.12% wall clock

The arm64 fp and signal kselftests produce identical results on the two
kernels.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/arm64/kernel/fpsimd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e7f1682a3059b..41e91186ee30b 100644
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
@@ -1332,6 +1332,11 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
 	 * registers or memory, so we must zero all state that is not shared
 	 * with FPSIMD.
 	 *
+	 * When the state is live it stays in the registers, which
+	 * sve_flush_live() zeroes. sve_state is only read when fp_type is
+	 * FP_STATE_SVE, which is only set after sve_save_state() has written
+	 * the whole buffer, so zero it only on the path that builds it here.
+	 *
 	 * SVE traps cannot be taken from streaming mode, so there cannot be
 	 * any effective streaming mode SVE state.
 	 */
@@ -1341,6 +1346,7 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
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

