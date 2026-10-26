Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019757;
	b=aJdU1bgIrBs3ZlKCmxjLWn01AH8wG24CHahf3MXxIBSaEGGy2IVe5XfgNRWTuZXWLRd/
	 mkh36DSJb62kwv6v2VMT0Cq4WZXddsJXD9oWY20JPRcPETTA+YwC4N8BxnyMUpOzN3URm
	 TSc79fvu1HGyML5WjAwivtVqvIdYJFQHUpcuI2P78/xNbDAd5hBomtfJUeDMn2OO2r17F
	 IqiN8/PvXpelCumZI8XfeVgpJaOXi5yJ4XVvU0+Ryakm70fsBRQLli+Rvk54D8k8x5nJ+
	 2LjYJ3zpC5pcfcza0WQFXs80dsHPXioeCrp0t//K/ygkiBudsad74+Q3lNoDLg90w9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019757;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Queue-Id:
	 X-Rspamd-Pre-Result:X-Rspamd-Action:X-Rspamd-Server:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=dj9INd1966MK8ElenDXQ3eNxTO2GkekngrNAvjDnjLs=;
	b=N1Rh/8OB3sW2eNb6qbmtjI370C0zRSAFShIkM9VE3gE46fzKL6Dg1i9R31u5BH0QlMXG
	 r/YTX/WG6AJcG1MjLFmT527XpGzVpAhFHviuxSD4Sd/LDyivVcrlPH/zo9RZP2pIsurOH
	 dtNVKMW27pZsPyrkwICD9yCWnxpHDuT+r/emEVnZhBrkXr69k7SainKS97j84M9bIyiAg
	 PfJqAvW9xY+eYXOOpecMtgJ3nBS9CbUyd6g1HjckOUxSczM1VGne+eNhz7wHk5KJTW+JZ
	 iPSD6f7mtPcNbwXvqyGRmOqWed8UDkmi1IGuH2lY7ssAxtirHPvVftmoIRy41ZbP6xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCDC606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BCDC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F152322149;
	Mon, 26 Oct 2026 13:02:33 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 96D0A13408;
	Mon, 26 Oct 2026 13:02:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wd3sGmlP32p3WgAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 26 Oct 2026 13:02:33 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v5 01/12] x86/cpu: Fix coding style violation
Date: Mon, 26 Oct 2026 14:02:12 +0100
Message-ID: <20261026130223.773129-2-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026130223.773129-1-jgross@suse.com>
References: <20261026130223.773129-1-jgross@suse.com>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: F152322149
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLkdkdrsxe9hqhhs5ask8616i6)]
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
2.56.0

