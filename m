Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EE13D7D8C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443934; cv=none; b=K5bLYvO1AADlBv9CJyIgo2tH7BRHUy/JVkhbJgC6KXp9RU6liOXZkZu92RChzWZeLRc9pLtpwwd9gWAj4CYJGflX/yhVxvttdP/De9MuXDBNqKyBg9Sb+uQm1AUev4tC1055BQyhylEU/V7aNC0BfgcFZNCLFMaqzhGbcPwGXts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443934; c=relaxed/simple;
	bh=9lhkzZuJvVFpeL98alq1ESABpY7TdwxlPJiaDIwoo3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B+m94jCgxcK1oxLY2/ZWECG33Ul3PZbfuQ5+p47+SD4luk3mOY9UHd/JH45Nx8vQY+aVCvalAK1uTN6Gec8/tPbANMy5FLf7kfvnRawmrNnL9NbRaH5q1GQNGRl0YvIjHujdlkicfbBJNHO+W09BzSmAW36gaBUuTjDqa4vqZ9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=prucV2v5; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=LrdkSZQ5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="prucV2v5";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="LrdkSZQ5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EB1DB1F786;
	Thu,  8 Oct 2026 07:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1791443931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F5f4fxYGxLZ8YOrAeXj9RATrpjsJnuIDFiY6T4r13pM=;
	b=prucV2v5dKZEKpoIcjF0IKcYJmqkSXQHMPx4ighXAnLbLw568JLfzbpihMrKjQZcrPdjj4
	wUyYtp1t3vCj9RKfEuw3V8gqIaLip8wfXChGkxeC34rkBkZnKCv1coatGI4uCs0mild59T
	Gatkla7I9vtzE3wf+ZbCNx1NtJM1czU=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1791443930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F5f4fxYGxLZ8YOrAeXj9RATrpjsJnuIDFiY6T4r13pM=;
	b=LrdkSZQ5u9boDlpxnK4/69aXvKhF/NBZZKW1w9K6b7B5aLPj1A5r2y+FWUV+4lbpmgfFiY
	bIkzavMs8dLkWrJgdq+EflHW20RNilNEa6io2EQR5G+3Vkx9h6u0OnvGLBdBGHXBSW50Lt
	uu/R64EkP5kroc5WMm9oO6wNlCjJGPg=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9042913354;
	Thu,  8 Oct 2026 07:18:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RKnDGdpDx2o1cQAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 08 Oct 2026 07:18:50 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v4 01/13] x86/cpu: Fix coding style violation
Date: Thu,  8 Oct 2026 09:18:27 +0200
Message-ID: <20261008071839.2247074-2-jgross@suse.com>
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
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo]

init_transmeta() has a style violation, fix it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 arch/x86/kernel/cpu/transmeta.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/transmeta.c b/arch/x86/kernel/cpu/transmeta.c
index 3e04b5d01bf8..35d498f24e34 100644
--- a/arch/x86/kernel/cpu/transmeta.c
+++ b/arch/x86/kernel/cpu/transmeta.c
@@ -24,11 +24,11 @@ static void early_init_transmeta(struct cpuinfo_x86 *c)
 
 static void init_transmeta(struct cpuinfo_x86 *c)
 {
-	u64 msr;
-	unsigned int max, dummy;
-	unsigned int cms_rev1, cms_rev2;
 	unsigned int cpu_rev, cpu_freq = 0, cpu_flags, new_cpu_rev;
+	unsigned int cms_rev1, cms_rev2;
+	unsigned int max, dummy;
 	char cpu_info[65];
+	u64 msr;
 
 	early_init_transmeta(c);
 
-- 
2.55.0

