Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393881A6838
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113162; cv=none; b=EuVp9t8Tz5S3G4Ge+nUzMveKoDnJtR+xxJ9nfDNGs0vQs2n0utDeYAjqsd31rYUQVCatwiY8TVQC+6xE9cH8lEvsLfb6aap13Jn9zVADr77vIvRx3fTDMaHFgmWcwMD2SWQ1IZwrr0t7FIdZRnpqf7B3ueM5F2pExhMHJS6MgO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113162; c=relaxed/simple;
	bh=6AE1owqySV2xrSwSgCIGV4e51eXVhc5hAMDhjV5VG3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pOPeyxdsL+PRxCmy6UMkWVSuYn29NkJKnYld228JWxpV5B17PXp2TFEd5pxzT59DU72i0M6A0CMGEkUzM2hIbOaDMPGboEACVjlUyMg94TV8LjMS9FfBUcSxKy/5RO3moZCEC6ptNLFhIiwf1ScA0diLlQOMq/sbgECZKrsMbak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=fJgJNu3U; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=PiMCF3+7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="fJgJNu3U";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="PiMCF3+7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E597221D37;
	Fri, 11 Sep 2026 07:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789113155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GOvVFBJSlIZ54cIrSULNavAILkGHAg9pGp9S4uew0eU=;
	b=fJgJNu3Udx2FbXpCAHrK08Br7F1MHhbtCYr5cHeEev98y6cpdt5ACTDx8uwiXN1xpCcXrN
	vEZVGRTbfG6z1+l/e+Htdrz4DmLGt7h+mfn4l7Wcvf/VZGzpbTcovooLmN2LOld7z44aeK
	UZWRSHOOG7lHa6dYJyYKJLVF0M5NfNA=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=PiMCF3+7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789113150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GOvVFBJSlIZ54cIrSULNavAILkGHAg9pGp9S4uew0eU=;
	b=PiMCF3+7e84hESivbFTkF+oVC/Tf3FtoDEfjwtuwoK65Hl45g6wYBS8gTTo6xXoMC71w5o
	NDXWvRwk0RrvkwGvsa1ieeD5POuefGn+9VyjN5YK767enjaftevGnN/FXoGiXtUKb4KP5o
	rJZ3xd4D2adEig/35hbu172wlNkG8LE=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 81938136ED;
	Fri, 11 Sep 2026 07:52:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HrUxHj6zo2r+XwAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 07:52:30 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 2/5] x86/msr: Remove native_wrmsr()
Date: Fri, 11 Sep 2026 09:52:13 +0200
Message-ID: <20260911075216.3142309-3-jgross@suse.com>
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
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: E597221D37
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_RATELIMIT(0.00)[to_ip_from(RLkdkdrsxe9hqhhs5ask8616i6)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid]
X-Spam-Flag: NO

As native_wrmsr() has no users left, remove it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/msr.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 95761803c2e6..bfad2b96a892 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -95,9 +95,6 @@ static __always_inline u64 native_rdmsrq(u32 msr)
 	return __rdmsr(msr);
 }
 
-#define native_wrmsr(msr, low, high)			\
-	__wrmsrq((msr), (u64)(high) << 32 | (low))
-
 #define native_wrmsrq(msr, val)				\
 	__wrmsrq((msr), (val))
 
-- 
2.55.0

