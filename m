Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72083D4131
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443944; cv=none; b=orNixDLFxpfh76ZpFKady10BsVSFcXIZXdCzb+p3m2Jrjr2eJTMtX8THuJJGjDEmdJjOkFqDRYemJOfJwbq0cpOaD307rTwlk1HvWZ49rtWQ/tOOBB68zusj+Jkli+z5Ekbhx+yjtRcEkpCXUUv982R+STfuXvxZc5aKLcWOlRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443944; c=relaxed/simple;
	bh=uo/HiFrKsO/ZXnyfoaH3gbI/res61ziOTAKqAuDwIhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TKATCZhBEuRzUYVFKHqDsGgvTVSRplizCYCDRXy4WFTmFKgoEQmfiEjMf+hUhqugO9gQkhwYEWBCWnUIjysVBHTtAix/QwUW7hEDBxBR5dgl+GqmFdDYdwwqdgjdaazC5iiYcqyILPab4GPPngo23iMXA3t4tlzcNqWTSZ5AxyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=EqsMFaXV; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=u+UPl4LY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="EqsMFaXV";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="u+UPl4LY"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A107E1F794;
	Thu,  8 Oct 2026 07:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1791443938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ljP9CHNUFxE50G1rwvqTqStiJ/6bRBX8FT4ArpWGDK0=;
	b=EqsMFaXVoDjTL+bwiLep85qb2HvvKyAa5cbxI1ziRN1geOLYIBedLysDfmWk7RdThPqX61
	RngWMA8EgOjKwde5LoLcBElWY+GyRzMl9KT2dGnZFgZaXQ0sYciyPcfeSwlWmqK2NOLr6J
	h7dP1gRGG3LgXJotAyr3r3vTj1FgfHM=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1791443936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ljP9CHNUFxE50G1rwvqTqStiJ/6bRBX8FT4ArpWGDK0=;
	b=u+UPl4LY9p44Haw380lMOyn/DfA8E2wxTZJYmZzdRAzkzumDOjYr7EYuuAhKB4ksRZlYEs
	APSz18h7rg+TBoajQuyighCYlleQAr//sxgDgmUcVxWvSriNhPnCbfPSOWKs29J/KHbk11
	Ps/x4sh2r6diBaf3zmmVS99BFv0PNLw=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 451B413354;
	Thu,  8 Oct 2026 07:18:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zhNsB+BDx2pAcQAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 08 Oct 2026 07:18:56 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v4 02/13] x86/msr: Remove wrmsr_safe()
Date: Thu,  8 Oct 2026 09:18:28 +0200
Message-ID: <20261008071839.2247074-3-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008071839.2247074-1-jgross@suse.com>
References: <20261008071839.2247074-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[]

wrmsr_safe() has no users left. Delete it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/msr.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 2f41a9289d79..6fb7125608c7 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -242,14 +242,6 @@ static __always_inline void wrmsrns(u32 msr, u64 val)
 		     : : "c" (msr), "a" ((u32)val), "d" ((u32)(val >> 32)));
 }
 
-/*
- * Dual u32 version of wrmsrq_safe():
- */
-static inline int wrmsr_safe(u32 msr, u32 low, u32 high)
-{
-	return wrmsrq_safe(msr, (u64)high << 32 | low);
-}
-
 struct msr __percpu *msrs_alloc(void);
 void msrs_free(struct msr __percpu *msrs);
 int msr_set_bit(u32 msr, u8 bit);
-- 
2.55.0

