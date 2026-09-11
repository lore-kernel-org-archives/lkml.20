Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBB94562A6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112744; cv=none; b=I/PpcPs6IyKdSfPBiBEnr1Dj6vNUrVRWu17DHua6CcoxY4KRSRwFPLxbLRs66Aw7XDLcwH/++7qw/ghDY5HmFFGlr+/7RJ49SikOUcU4harRTOxhSCX/V8DAvx40tTNGfhNy/6P/gB4Dzpi8B5kODuRJwXpl9nom4nBFFnXjk4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112744; c=relaxed/simple;
	bh=9lhkzZuJvVFpeL98alq1ESABpY7TdwxlPJiaDIwoo3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uuv0NehznKX9M7HqRFncrKbj/VLkKvngUQP3NBygQu37J7jXljmgU7Pzv0MN92hvRiIQEmRdCuR93/nzeKw9sieii3VQ6oOZbE4rMOrYYTuSj25VZxzuFclHUOC8jziOHra7fvKyx0A10vne31WqWWEVVVRo6CH39Oc+z3vAzvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C965121D36;
	Fri, 11 Sep 2026 07:45:41 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6FAA413794;
	Fri, 11 Sep 2026 07:45:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /3z6GaWxo2r8WAAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 07:45:41 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 01/13] x86/cpu: Fix coding style violation
Date: Fri, 11 Sep 2026 09:45:18 +0200
Message-ID: <20260911074530.3140830-2-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911074530.3140830-1-jgross@suse.com>
References: <20260911074530.3140830-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C965121D36
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00

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

