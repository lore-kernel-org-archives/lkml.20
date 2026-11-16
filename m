Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844991;
	b=TvP8EtVXgINbKGBgLrhi5jeyciHtv7YaeYjcATZBTi5MkUyIDikVGGJiL9GDmNmllBPI
	 tBXvojcyZjWPjI1nEI/OPC6FpKjhc6dCJA+iDGdUp9bvPtzi5claX60F+Z1dK4g6mVxCZ
	 kpzhqhaZ5iNpuEu7BbCsjcU7PrNnZgw8IrMOdFKltJ3PWpw7pXquH5paGItWz4GAkCjFm
	 pF5K4lfouPXNKMdw0x6RpsOliTfezcGEJr0YF4QKY1JwuMsfBz5DJS6Pd+DEOJm/QaVNL
	 7VB//mIhq5vwDiwvJSSYBRO323GRgfweaifkwqcFaayJO7TfNByvwmWKlulqmaFPqYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844991;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=gq8JU+JQ/dsUDLNIdMHe4BCKqz+Gvvf+BSq2uB24YK4=;
	b=RTlLmA7Ct9idheeMPTE2ujCBO9k4h1sXm8O298Eo1IaZks7HIlDYAD7ZXs+0eiLt9U6H
	 LWSFbs4H00LTCynZdUPGRH5B8pTryEkI0eoqWA1kae/B8Qof6XELEqQH8u5NfmLr7AIQO
	 Ld/gWbIzpTf5OwptF4WXAicACrmzzzcpbQSe4SxPgURsMbW5NzgIBYZOuRdEsRTLzYyOR
	 xj4Dq8IY7hx09aekhIV5RSRoFl0mO3+hublNeHfBQ4Jeydp5qqbxKMWqg9uNS7wIcpmWP
	 9Ln2zpJN/XpTZIRLe0BpqpBWRhFPyC+1WrhpHQV8iDUDEOVteuT2auIimm7p1in33QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=UEe9tgP+;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=UEe9tgP+;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7192606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7192606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=UEe9tgP+;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=UEe9tgP+
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 008852212E;
	Mon, 16 Nov 2026 16:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794844989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gq8JU+JQ/dsUDLNIdMHe4BCKqz+Gvvf+BSq2uB24YK4=;
	b=UEe9tgP+oqHpf/0sZ8MttD5RIQauegNUwRbA6ZFtpAyFe9TlvnPQwsHNDWNJA8IAwsW6Mi
	Fe0iuhs76MaZF+LKoaII9TepqG6x5ehx7LQk7adzPcmKSDvuAfGbexctq18Jbkuz1e0Y5r
	H7Ib0Zkb9bhk+37fJmwNi51OjPEaG7g=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794844989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gq8JU+JQ/dsUDLNIdMHe4BCKqz+Gvvf+BSq2uB24YK4=;
	b=UEe9tgP+oqHpf/0sZ8MttD5RIQauegNUwRbA6ZFtpAyFe9TlvnPQwsHNDWNJA8IAwsW6Mi
	Fe0iuhs76MaZF+LKoaII9TepqG6x5ehx7LQk7adzPcmKSDvuAfGbexctq18Jbkuz1e0Y5r
	H7Ib0Zkb9bhk+37fJmwNi51OjPEaG7g=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F3211334C;
	Mon, 16 Nov 2026 16:03:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5whFETwp+2phUwAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 16 Nov 2026 16:03:08 +0000
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
	Ben Horgan <ben.horgan@arm.com>,
	Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>
Subject: [PATCH v4 1/5] x86/msr: Switch users of native_wrmsr() to native_wrmsrq()
Date: Mon, 16 Nov 2026 17:02:55 +0100
Message-ID: <20261116160259.1579333-2-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116160259.1579333-1-jgross@suse.com>
References: <20261116160259.1579333-1-jgross@suse.com>
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
X-Spamd-Result: default: False [-15.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -15.80
X-Spam-Level: 
X-Spam-Flag: NO

Switch all users of native_wrmsr() to native_wrmsrq() in order to
prepare removal of native_wrmsr().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- switch order of hi and lo parts when oring them (Reinette Chatre)
V3:
- fix another lo | hi instance (Reinette Chatre)
V4:
-drop unnecessary parentheses (Reinette Chatre)
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
index 0408ac7f66fd..affa80d6f698 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -175,7 +175,7 @@ int resctrl_arch_pseudo_lock_fn(void *_plr)
 	 * pseudo-locked followed by reading of kernel memory to load it
 	 * into the cache.
 	 */
-	native_wrmsr(MSR_IA32_PQR_ASSOC, rmid_p, plr->closid);
+	native_wrmsrq(MSR_IA32_PQR_ASSOC, (u64)plr->closid << 32 | rmid_p);
 
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

