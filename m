Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023911;
	b=uy0vLmFmghKVQkwSpM0nttoFZh44WN0jY36mE1BL3/IsHE3Zhr5TvKnhRROiiINHcZLH
	 OP3yCrmL/BzXooY33pVzp0nN+wd/bJ4y/KDK/tfhF4U/gRLdr+oeVTMfcK6C4/j9WPtKI
	 KOiGfMHOANd4bHHOFRgBtjdLnLCPRckpDdiIthZs3ye4EARRXowRruCrDv6CdFjzLkeEt
	 GMEddxZRMthUiF3Xp1t6qimoZ9hmX3uSbryEjPd+RCbZHM//j791RSpZ946YfNLjHEHbD
	 wFrAx2OkvkrpOwPLyYtrXmyRDe6QaV7+KYNJ/jRDIqubKWXxJGTAS3KnrFUEs6cSbbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023911;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spam-Flag:
	 X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=zhVFuZ5Df4YFe7ReCBxY2RT9muKzyqfgSk3wyjqaWzc=;
	b=gn9SKsN8swd7NrQCfarGaoKhA1V00IDZiq35NHCLagZ3NIXVLWcB48pgzO/dLIKbDws6
	 lKLCBXG6mS+34Q3Bk4EHxMrqFSOj9tYMptGnjUfuPPftEqaWV/B6V5/rifjPqTEhGWQrk
	 ZGxc1kx2gh46tA4lGwG9VlrTcVe5QXnjsusN+8Iipce4A6YegPzbTiAKw6LraTVsIj4nC
	 EkxyZazQJjeFUo/9fEVXD/4UUWW3jCzWhxKj/EQO0gX8saetasbnGMAVVl3e1wB8VbMYp
	 yc0g+Bj0nZyxKkjxP0EUYn0fHhAlLnL1nzo8G96J3ajOnhJBSlNlv/rOPdml6MnIjhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=MaNefoGp;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=MaNefoGp;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41546606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41546606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=MaNefoGp;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=MaNefoGp
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 90C0121E38;
	Mon, 26 Oct 2026 14:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1793023889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zhVFuZ5Df4YFe7ReCBxY2RT9muKzyqfgSk3wyjqaWzc=;
	b=MaNefoGpc8EjPFbnIXhLhj0bYbbUwhvDT/d44TlaZjr8Vu4IbtbGLFXzdzCWUHoah2BB6h
	tH6/AlsWBhAKP4FptQ2o3I+c+ixUYBbcsmy2piSeH1YCdbRY5aI3cgeqBDiIP3ZUOhHWZk
	KwNot/NBXWb9M+DADYjADcgKSpvvLT0=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1793023889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zhVFuZ5Df4YFe7ReCBxY2RT9muKzyqfgSk3wyjqaWzc=;
	b=MaNefoGpc8EjPFbnIXhLhj0bYbbUwhvDT/d44TlaZjr8Vu4IbtbGLFXzdzCWUHoah2BB6h
	tH6/AlsWBhAKP4FptQ2o3I+c+ixUYBbcsmy2piSeH1YCdbRY5aI3cgeqBDiIP3ZUOhHWZk
	KwNot/NBXWb9M+DADYjADcgKSpvvLT0=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1BA3113319;
	Mon, 26 Oct 2026 14:11:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id i/ibOJBf32o6JQAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 26 Oct 2026 14:11:29 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>
Subject: [PATCH v3 1/5] x86/msr: Switch users of native_wrmsr() to native_wrmsrq()
Date: Mon, 26 Oct 2026 15:11:16 +0100
Message-ID: <20261026141120.780172-2-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026141120.780172-1-jgross@suse.com>
References: <20261026141120.780172-1-jgross@suse.com>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-15.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -15.80

Switch all users of native_wrmsr() to native_wrmsrq() in order to
prepare removal of native_wrmsr().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- switch order of hi and lo parts when oring them (Reinette Chatre)
V3:
- fix another lo | hi instance (Reinette Chatre)
---
 arch/x86/coco/sev/internal.h              | 7 +------
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c | 4 ++--
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/x86/coco/sev/internal.h b/arch/x86/coco/sev/internal.h
index b9632c0fc391..2e2ff48a7aae 100644
--- a/arch/x86/coco/sev/internal.h
+++ b/arch/x86/coco/sev/internal.h
@@ -80,12 +80,7 @@ static inline u64 sev_es_rd_ghcb_msr(void)
 
 static __always_inline void sev_es_wr_ghcb_msr(u64 val)
 {
-	u32 low, high;
-
-	low  = (u32)(val);
-	high = (u32)(val >> 32);
-
-	native_wrmsr(MSR_AMD64_SEV_ES_GHCB, low, high);
+	native_wrmsrq(MSR_AMD64_SEV_ES_GHCB, val);
 }
 
 enum es_result __vc_handle_msr(struct ghcb *ghcb, struct es_em_ctxt *ctxt, bool write);
diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
index 0408ac7f66fd..24ded41652e3 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -175,7 +175,7 @@ int resctrl_arch_pseudo_lock_fn(void *_plr)
 	 * pseudo-locked followed by reading of kernel memory to load it
 	 * into the cache.
 	 */
-	native_wrmsr(MSR_IA32_PQR_ASSOC, rmid_p, plr->closid);
+	native_wrmsrq(MSR_IA32_PQR_ASSOC, ((u64)plr->closid << 32) | rmid_p);
 
 	/*
 	 * Cache was flushed earlier. Now access kernel memory to read it
@@ -212,7 +212,7 @@ int resctrl_arch_pseudo_lock_fn(void *_plr)
 	 * Critical section end: restore closid with capacity bitmask that
 	 * does not overlap with pseudo-locked region.
 	 */
-	native_wrmsr(MSR_IA32_PQR_ASSOC, rmid_p, closid_p);
+	native_wrmsrq(MSR_IA32_PQR_ASSOC, (u64)closid_p << 32 | rmid_p);
 
 	/* Re-enable the hardware prefetcher(s) */
 	wrmsrq(MSR_MISC_FEATURE_CONTROL, saved_msr);
-- 
2.56.0

