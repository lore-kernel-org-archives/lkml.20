Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854414;
	b=JObl90F/8BUHQ3O0Yw28xtXlmWM9zXZF0YNXSqF5JxUuDL+iilyxEwEdwL4lFqIgAnm8
	 r8s7tD8zYtUxd9FHuAKWj+TJ/OzO/n3KqEFa7zO3cKOP8Ez6G1wvp6+EUYj64p3Hr740v
	 3gC8JoSQ4bM4dwrnPKHbvScG1kECGC0l5h7ogq4qBhgZnnTJRrcgITlhrA2nMZjPsTSWV
	 eKQVc8gHdwqRhNlMCDRzW37vGm0OX1fYX1wpSOEDBAiv3bo4RRZC0htL5uxaeshTlYjf8
	 oJl2+Py2KDs5JnUTaAzEHMB2CdI/uFmO1qrYgowP4/twzc0txkoosu149k0KLetKSSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854414;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=+HpGo+fch8REXGuorA1oMw2814ETWs1w3McZCiqJGgs=;
	b=g4D+Hk+RzBPTUBaziIHP7vXPgQ4e6rVgRTBkRGDNXwa5xhswLzCbe7B3RzpX6RJCqCLS
	 4XOsXVa7ps+sfdYic7NQqk94RH6auc6qZCJV+bmJDwp6SMAKnRXzIgt8IJQ8rT9QhAwF8
	 cDHaCFOsv2bit6M68pUtUGglcFMvqR2fIpq7HWFnMPlJi4BccJdCNElr9TSbGB9hrQbPx
	 v2iH7pJZ84WHk0cEhmTrHfwElLR/xZQg2QiIW6KQ6P6ziEZqx7nBMk4PfRYj8H7zW7Igq
	 v+WP2pTTp8XefT+DUCkr4bTfwTiObUNOfJZ/8w/ebMEpTwSY1rQn6AQTMJGEnjljkow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=iqi+CMBb;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=iqi+CMBb;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297C9606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 297C9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=iqi+CMBb;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=iqi+CMBb
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 70B8A22321;
	Mon, 16 Nov 2026 18:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+HpGo+fch8REXGuorA1oMw2814ETWs1w3McZCiqJGgs=;
	b=iqi+CMBbTyXUW3JEkWgKXu2g8E3xiWPQ9MOgzbOaRsHZ+BimGowhX0mHO2BAo9/ItzmpAi
	41NJ2msVfwI155XyTOYGul8MfFysS0qQsxPZdP6N1nh8yHtaw/YAJTZWa07s8sdV+zvPey
	5doYBzVrXHz0/AZGEYYuCkthN0KNuLI=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=iqi+CMBb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+HpGo+fch8REXGuorA1oMw2814ETWs1w3McZCiqJGgs=;
	b=iqi+CMBbTyXUW3JEkWgKXu2g8E3xiWPQ9MOgzbOaRsHZ+BimGowhX0mHO2BAo9/ItzmpAi
	41NJ2msVfwI155XyTOYGul8MfFysS0qQsxPZdP6N1nh8yHtaw/YAJTZWa07s8sdV+zvPey
	5doYBzVrXHz0/AZGEYYuCkthN0KNuLI=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11A6E1334C;
	Mon, 16 Nov 2026 18:40:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IMmTNgtO+2qJeAAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 16 Nov 2026 18:40:12 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v6 11/17] x86/alternatives: Add ALTERNATIVE_4()
Date: Mon, 16 Nov 2026 19:38:59 +0100
Message-ID: <20261116183905.1591611-12-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116183905.1591611-1-jgross@suse.com>
References: <20261116183905.1591611-1-jgross@suse.com>
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
X-Spamd-Result: default: False [-12.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:dkim];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLkdkdrsxe9hqhhs5ask8616i6)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 70B8A22321

For supporting WRMSR with CONFIG_PARAVIRT_XXL using direct instruction
replacement, ALTERNATIVE_4() is needed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 arch/x86/include/asm/alternative.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
index 08af86ef090a..4ec6e7653ac7 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -180,6 +180,12 @@ static __always_inline bool cpu_wants_rethunk_at(void *addr)
 	ALTERNATIVE(ALTERNATIVE_2(oldinstr, newinstr1, ft_flags1, newinstr2, ft_flags2), \
 		      newinstr3, ft_flags3)
 
+#define ALTERNATIVE_4(oldinstr, newinstr1, ft_flags1, newinstr2, ft_flags2,   \
+		      newinstr3, ft_flags3, newinstr4, ft_flags4)	\
+	ALTERNATIVE(ALTERNATIVE_3(oldinstr, newinstr1, ft_flags1,	\
+				  newinstr2, ft_flags2, newinstr3, ft_flags3),\
+		    newinstr4, ft_flags4)
+
 /*
  * Alternative instructions for different CPU types or capabilities.
  *
-- 
2.56.0

