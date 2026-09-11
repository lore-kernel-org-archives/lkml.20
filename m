Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4521637B3FE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113156; cv=none; b=gJdA5XTBdzutzKMaQW259FZHdzyfLhuO60JdyMZDPYcbrNR+VsAAoMEYjrBP00rLzUFqRdAwedi2gDK1e8m6GPgJk9arRLm8UjloI+8FDmZnIwvZsKP+4ggSvExDuDOlYlHqSFtPNgTDOJwf7IY2vgD4b9nJ699bcfYFI7BbXjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113156; c=relaxed/simple;
	bh=zKVTpbaqZQGDnlZVrQpYimyyXAfV+bdYo0NaEiz/Irg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eDOA9NQwnqvr4WtcW/e7B4WJn8kMvmFebZ+aNK41scyedIHMHus1n3tAi7tLqrghhVqxfOXJmRkRRUBREwrmh9MkMV3hxZEBlPiyJEn1brdKiHo7hhrYD+s0oAxTuBJJZ2uU5AvVmyqx1GJhKaWcTdEKNBu1hBQ09wzoOmuMV3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=bwJgaBmg; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=ockUKlZR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="bwJgaBmg";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ockUKlZR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 351B91FD88;
	Fri, 11 Sep 2026 07:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789113149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WY/ZqseogEE8lk5OuTAGz9kQGz3dk5AeE8smZ2J6lsA=;
	b=bwJgaBmg9DEmkPIdlE144gWibQalvZ6AdKnMYOmk52A41Idft397ArmHZlLJkNNHYTFEke
	QjZQxU1xD2DH8sZ9Cc3BeMGjtzrEujIW3V8gybj8bbUm4eex0NmKKfX1RPIwdHWM0xfORT
	sjTrGJXGf3WClUOmC9s0xZ29Cn6Q7tA=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ockUKlZR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789113145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WY/ZqseogEE8lk5OuTAGz9kQGz3dk5AeE8smZ2J6lsA=;
	b=ockUKlZRjUHJLQcAYEgbJIV7wfaE+IBz+FAOiroa7OsxsCe0ZHIGEz0mayGJ83yfyB50ED
	BnnJ4hz5a7h64pez6qRZa0Fy98zOhxWgkn0h3oPCqeADLIj6YPdB+oxpn3jDsXH14KjyN5
	wpBl8361zStMF2JX6mD0/mLhckWmSLM=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B273F13715;
	Fri, 11 Sep 2026 07:52:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ck9HKjizo2rrXwAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 07:52:24 +0000
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
Subject: [PATCH v2 1/5] x86/msr: Switch users of native_wrmsr() to native_wrmsrq()
Date: Fri, 11 Sep 2026 09:52:12 +0200
Message-ID: <20260911075216.3142309-2-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911075216.3142309-1-jgross@suse.com>
References: <20260911075216.3142309-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 351B91FD88
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.01

Switch all users of native_wrmsr() to native_wrmsrq() in order to
prepare removal of native_wrmsr().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- switch order of hi and lo parts when oring them (Reinette Chatre)
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
index 0408ac7f66fd..a04cf26e0302 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -175,7 +175,7 @@ int resctrl_arch_pseudo_lock_fn(void *_plr)
 	 * pseudo-locked followed by reading of kernel memory to load it
 	 * into the cache.
 	 */
-	native_wrmsr(MSR_IA32_PQR_ASSOC, rmid_p, plr->closid);
+	native_wrmsrq(MSR_IA32_PQR_ASSOC, rmid_p | ((u64)plr->closid << 32));
 
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
2.55.0

