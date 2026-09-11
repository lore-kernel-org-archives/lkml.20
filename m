Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3166F46AA94
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116180; cv=none; b=dtdPjAPhe37KByrphuxiYaT2bh54TWCVHKGP6JAZUxr6eliRuHptf+95wb1afby3nkl6SWsmI4l/toTD+Xe+8cpVeQwRQUCmhkPCt1ry/8u9MoGOH4HA5BxdKhvnteHUbew+q/IddAK+5ebaw+J3bsHTVcwgxJPJtMbocb871R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116180; c=relaxed/simple;
	bh=fiDYNcfhZcDSqcARbyeckMA7E+L0tCil39mEkJHy1HM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JbNXVpfbNs4cHbO/+leo1ghvF/oqJl4Dq+Tv7gZjtFFVOiH8550eJppZMZYy8wrXbT9H/KsxNCuzHXosjEeMcXKWEnlXSoSiTJ8UpiJWNVpzFFpHN84gpNKU0yWtEgXaeGSYWRVBbt0ciXr0tZnIbLXpp6xT+SJYFHyrOlBt+Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=RZahFFa9; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=qHMhRYvv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="RZahFFa9";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="qHMhRYvv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E8A6921B8B;
	Fri, 11 Sep 2026 08:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789116173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JiuZKh/Q4VG6d7m6LZsesxMvV5lQZekAdTlgdpZfOGE=;
	b=RZahFFa9WZBeGbJ/plfXN2GbgByyRQAP2xpqrTgPw/2/ZAuBS5ucUorE5lfZWmVFfoqz6v
	j8+pnosxLObAlDQRVTLRAhh0hRX9zE/qT9/DZvnacKZmpnbdTXb1yS/8/3MQWZCw/ssv4C
	V9IrFduVp+aPrr6O6B0DWZBpFnjLvr4=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789116168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JiuZKh/Q4VG6d7m6LZsesxMvV5lQZekAdTlgdpZfOGE=;
	b=qHMhRYvvpOOrQg0x1kqz93EBW9WFd/oAuuxg0o5L36r+o6s9j5PdPYDG6Ksie1fXdEPAaO
	yPw0IdSIvv8OP3xb2rqH957E1fGH2p3C9xUW7e8hEnYgTFGLVA0f2hyGa1jZjl03XrSBkb
	FTTSrDn71W+Eu6updn2ms+SvdmCvG28=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8794613794;
	Fri, 11 Sep 2026 08:42:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Afu/Hwi/o2rpFQAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 08:42:48 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Xin Li (Intel)" <xin@zytor.com>
Subject: [PATCH v5 06/17] x86/opcode: Add immediate form MSR instructions
Date: Fri, 11 Sep 2026 10:42:00 +0200
Message-ID: <20260911084211.3149957-7-jgross@suse.com>
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
X-Spam-Level: 
X-Spam-Score: -6.80
X-Spam-Flag: NO
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[]

Add the instruction opcodes used by the immediate form WRMSRNS/RDMSR
to x86-opcode-map.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
V2:
- new patch, taken from the RFC v2 MSR refactor series by Xin Li
---
 arch/x86/lib/x86-opcode-map.txt       | 5 +++--
 tools/arch/x86/lib/x86-opcode-map.txt | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/x86/lib/x86-opcode-map.txt b/arch/x86/lib/x86-opcode-map.txt
index 2a4e69ecc2de..62f7c90b9a83 100644
--- a/arch/x86/lib/x86-opcode-map.txt
+++ b/arch/x86/lib/x86-opcode-map.txt
@@ -844,7 +844,7 @@ f1: MOVBE My,Gy | MOVBE Mw,Gw (66) | CRC32 Gd,Ey (F2) | CRC32 Gd,Ew (66&F2)
 f2: ANDN Gy,By,Ey (v)
 f3: Grp17 (1A)
 f5: BZHI Gy,Ey,By (v) | PEXT Gy,By,Ey (F3),(v) | PDEP Gy,By,Ey (F2),(v) | WRUSSD/Q My,Gy (66)
-f6: ADCX Gy,Ey (66) | ADOX Gy,Ey (F3) | MULX By,Gy,rDX,Ey (F2),(v) | WRSSD/Q My,Gy
+f6: ADCX Gy,Ey (66) | ADOX Gy,Ey (F3) | MULX By,Gy,rDX,Ey (F2),(v) | WRSSD/Q My,Gy | RDMSR Rq,Gq (F2),(11B) | WRMSRNS Gq,Rq (F3),(11B)
 f7: BEXTR Gy,Ey,By (v) | SHLX Gy,Ey,By (66),(v) | SARX Gy,Ey,By (F3),(v) | SHRX Gy,Ey,By (F2),(v)
 f8: MOVDIR64B Gv,Mdqq (66) | ENQCMD Gv,Mdqq (F2) | ENQCMDS Gv,Mdqq (F3) | URDMSR Rq,Gq (F2),(11B) | UWRMSR Gq,Rq (F3),(11B)
 f9: MOVDIRI My,Gy
@@ -1019,7 +1019,7 @@ f1: CRC32 Gy,Ey (es) | CRC32 Gy,Ey (66),(es) | INVVPID Gy,Mdq (F3),(ev)
 f2: INVPCID Gy,Mdq (F3),(ev)
 f4: TZCNT Gv,Ev (es) | TZCNT Gv,Ev (66),(es)
 f5: LZCNT Gv,Ev (es) | LZCNT Gv,Ev (66),(es)
-f6: Grp3_1 Eb (1A),(ev)
+f6: Grp3_1 Eb (1A),(ev) | RDMSR Rq,Gq (F2),(11B),(ev) | WRMSRNS Gq,Rq (F3),(11B),(ev)
 f7: Grp3_2 Ev (1A),(es)
 f8: MOVDIR64B Gv,Mdqq (66),(ev) | ENQCMD Gv,Mdqq (F2),(ev) | ENQCMDS Gv,Mdqq (F3),(ev) | URDMSR Rq,Gq (F2),(11B),(ev) | UWRMSR Gq,Rq (F3),(11B),(ev)
 f9: MOVDIRI My,Gy (ev)
@@ -1108,6 +1108,7 @@ EndTable
 Table: VEX map 7
 Referrer:
 AVXcode: 7
+f6: RDMSR Rq,Id (F2),(v1),(11B) | WRMSRNS Id,Rq (F3),(v1),(11B)
 f8: URDMSR Rq,Id (F2),(v1),(11B) | UWRMSR Id,Rq (F3),(v1),(11B)
 EndTable
 
diff --git a/tools/arch/x86/lib/x86-opcode-map.txt b/tools/arch/x86/lib/x86-opcode-map.txt
index 2a4e69ecc2de..62f7c90b9a83 100644
--- a/tools/arch/x86/lib/x86-opcode-map.txt
+++ b/tools/arch/x86/lib/x86-opcode-map.txt
@@ -844,7 +844,7 @@ f1: MOVBE My,Gy | MOVBE Mw,Gw (66) | CRC32 Gd,Ey (F2) | CRC32 Gd,Ew (66&F2)
 f2: ANDN Gy,By,Ey (v)
 f3: Grp17 (1A)
 f5: BZHI Gy,Ey,By (v) | PEXT Gy,By,Ey (F3),(v) | PDEP Gy,By,Ey (F2),(v) | WRUSSD/Q My,Gy (66)
-f6: ADCX Gy,Ey (66) | ADOX Gy,Ey (F3) | MULX By,Gy,rDX,Ey (F2),(v) | WRSSD/Q My,Gy
+f6: ADCX Gy,Ey (66) | ADOX Gy,Ey (F3) | MULX By,Gy,rDX,Ey (F2),(v) | WRSSD/Q My,Gy | RDMSR Rq,Gq (F2),(11B) | WRMSRNS Gq,Rq (F3),(11B)
 f7: BEXTR Gy,Ey,By (v) | SHLX Gy,Ey,By (66),(v) | SARX Gy,Ey,By (F3),(v) | SHRX Gy,Ey,By (F2),(v)
 f8: MOVDIR64B Gv,Mdqq (66) | ENQCMD Gv,Mdqq (F2) | ENQCMDS Gv,Mdqq (F3) | URDMSR Rq,Gq (F2),(11B) | UWRMSR Gq,Rq (F3),(11B)
 f9: MOVDIRI My,Gy
@@ -1019,7 +1019,7 @@ f1: CRC32 Gy,Ey (es) | CRC32 Gy,Ey (66),(es) | INVVPID Gy,Mdq (F3),(ev)
 f2: INVPCID Gy,Mdq (F3),(ev)
 f4: TZCNT Gv,Ev (es) | TZCNT Gv,Ev (66),(es)
 f5: LZCNT Gv,Ev (es) | LZCNT Gv,Ev (66),(es)
-f6: Grp3_1 Eb (1A),(ev)
+f6: Grp3_1 Eb (1A),(ev) | RDMSR Rq,Gq (F2),(11B),(ev) | WRMSRNS Gq,Rq (F3),(11B),(ev)
 f7: Grp3_2 Ev (1A),(es)
 f8: MOVDIR64B Gv,Mdqq (66),(ev) | ENQCMD Gv,Mdqq (F2),(ev) | ENQCMDS Gv,Mdqq (F3),(ev) | URDMSR Rq,Gq (F2),(11B),(ev) | UWRMSR Gq,Rq (F3),(11B),(ev)
 f9: MOVDIRI My,Gy (ev)
@@ -1108,6 +1108,7 @@ EndTable
 Table: VEX map 7
 Referrer:
 AVXcode: 7
+f6: RDMSR Rq,Id (F2),(v1),(11B) | WRMSRNS Id,Rq (F3),(v1),(11B)
 f8: URDMSR Rq,Id (F2),(v1),(11B) | UWRMSR Id,Rq (F3),(v1),(11B)
 EndTable
 
-- 
2.55.0

