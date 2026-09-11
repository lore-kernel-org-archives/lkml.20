Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45B445D935
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116209; cv=none; b=Z10vw9tprAWW9PU67aVYrkWyzRovP6jDKxPpII8WDdV/vG50D0AfXNznSpzPQl4pc+B8PayFdbyxHozVfZgK6QtV+zdv99/wTMU2Y7M9AD/7DbJAcfK36ukH8EbXclAt1ySkASQZU8T7/2pGvDFXIp+MQR0EUh15NrZGA3uHb00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116209; c=relaxed/simple;
	bh=o7Yxmwa+KvL4WMTBpWTnP1MQuEQCWf6DwpMN/kvAiIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oUbuzs3pg1VuxmKm3oomEHCZH4D874knpXVEuLbVbb3nlctJ9I65n9JD3LdQxdQBIqfkLV3XCGIeFROulqnrQxhvM+/Rw00o+Pxm/NdHWLoHgyt/qY2jG0exjifzOMcvELfs/5IQxBLrRl+sx9PN5MQC1i50GwmdMbf3T4RzluM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=YdJMcGCn; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=KOgKXo8i; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="YdJMcGCn";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="KOgKXo8i"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C241C21B8B;
	Fri, 11 Sep 2026 08:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789116201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5HInnoDDY/VQ8I/mFAzlwtv13X7HXxxBYc4UBxKtHeA=;
	b=YdJMcGCnMXZGiNHuU6n3CBb5pM7/ixGNw3whSLpFpw0UXHmV8VcMZ65jVaStK8ug0Gmqhl
	8wdyLgsXar0g24KKnb1VsMuVcuZgwXEZcbgOxQamYp+0+YauRKCcy5IpBIsIodBdMGVIt3
	pPHjutUlHnYVxu++15XocmbxUvxp7qU=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789116197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5HInnoDDY/VQ8I/mFAzlwtv13X7HXxxBYc4UBxKtHeA=;
	b=KOgKXo8iY/uR6cC+L7DeTcjttqsHtB2N+H0+xWdCe7XvXwWgHyw2+NmF37vmqT/MRPEtOb
	4VnGNjE7tCAj4EWoxf+hVybv3OPehaH9KDkHJ+SmlruEiajZOaRYZ4Crr9vV61ovsnqXS8
	x4KjOEF3NqkgVXIYIspjPgrZatxBt1c=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 649C813715;
	Fri, 11 Sep 2026 08:43:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7lA/FyW/o2oaFgAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 08:43:17 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v5 11/17] x86/alternatives: Add ALTERNATIVE_4()
Date: Fri, 11 Sep 2026 10:42:05 +0200
Message-ID: <20260911084211.3149957-12-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911084211.3149957-1-jgross@suse.com>
References: <20260911084211.3149957-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

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
2.55.0

