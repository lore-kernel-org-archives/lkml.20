Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023886;
	b=Rz79RdqQY3BPuCQqSpjLUqO/kqk2FoMuYLc0ay9D9WQdxEP3kZUv1EuEczEwUzoC9Cu7
	 f2lYDOqI1jAbST3/hAC6klXodQCGRzfx7yOqN+1nbbbJ1tRJGbdRMXpHcjwNuSXRDAWoE
	 DV1DSrAtK4aWfiaLzZGSZ4gyFEbSBe6SaL4JKvoLtzkcgOX9KAMXV8Il9HHRzlZv22MZC
	 H9JuXKoh5APd0LV7YeSal63Dy3Zh70zJjrOc/LES7q22nyeQhb+YwFe/orum36vhyHbl2
	 JKRVc3GLJfYx/gl1g6wlH7PjarfsyuNg7ITtM5/+m7y8p1J7ZMD3Kj7R99tqbOkL39g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023886;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:X-Spam-Level:
	 X-Spam-Flag;
	bh=C/Y/L1k9Lgpx1qPdqNW8UsAwEvRAfuogHa3oBComrBQ=;
	b=g+ymTByn897r7sSc29WJxYAIgHMiDZE+ogghtBOuhpW+735TJyqV3t/x5bhJKyMMc/eF
	 HTLtoTeQp7VjPaM/DNB94mB7y4LYowXv8Zyjaxc7P0xZc9igNksIJYyRKcONg3lxuoC/j
	 rgdcZPwg7xPnjgmf24aOHncrA2yKlOzM5oD7Lfcs3ImPQuiaIaeTdesSyGS4YM/M1AOkP
	 OUlaL700tMifM4pxMU6fDp7n9rgomggrV1LaKbz0QIcaeMIa5SPpc9EeAUh7+P9nAbN+W
	 vCWvCPP+HVKfHsLVR8F68I1C5AQbq2IHPUM+YWyFwQhAtyhZH06z0JBoewr7ruzjoeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=IwOKO+25;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=eyiu4RjD;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0332606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0332606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=IwOKO+25;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=eyiu4RjD
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E3CE81F7DB;
	Mon, 26 Oct 2026 14:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1793023884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=C/Y/L1k9Lgpx1qPdqNW8UsAwEvRAfuogHa3oBComrBQ=;
	b=IwOKO+25qfyAuKWCPVHT3iuabPYJUbvab35ZC5zLOI56YddIFHrElgH3gGjVRUsjsFFH/K
	7ERgUdxtDoQlLwQbGJ/pyOI1fNRqnpjuuKZC9vgn2it384lUtoYk5upmUI4YDmLvaZQCOj
	Q3hr2f0sxfukc2zD37eGhHFf5478MS4=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1793023883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=C/Y/L1k9Lgpx1qPdqNW8UsAwEvRAfuogHa3oBComrBQ=;
	b=eyiu4RjDGwQi8zbCPwtr8Zsq13jbNNzLXBVO4D7M5qP9YeCfCaO5w/ONGWDA3cOGfHqLdy
	ttpjsgrCIkbZySk7S3zr5mJfGckJ4vE1MpN6aTrhj5QnLacOptA38g+QsiH00OZ6r4WXIF
	q2oioMq7moSEVhc+MCdK/47rDXh8Hp0=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4ACC813319;
	Mon, 26 Oct 2026 14:11:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id odhqB4tf32omJQAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 26 Oct 2026 14:11:23 +0000
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
Subject: [PATCH v3 0/5] x86/msr: Drop 32-bit interfaces of native MSR functions
Date: Mon, 26 Oct 2026 15:11:15 +0100
Message-ID: <20261026141120.780172-1-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
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
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80
X-Spam-Level: 
X-Spam-Flag: NO

Switch all users of the 32-bit native_*() MSR access functions to the
64-bit ones and drop the 32-bit interfaces.

Based on the series "x86/msr: Drop 32-bit MSR interfaces" [1].

[1]: https://lore.kernel.org/lkml/20261026130223.773129-1-jgross@suse.com/T/#t

Changes in V2:
- small fix in patch 1
- rebased

Changes in V3:
- another small fix in patch 1
- rebased

Juergen Gross (5):
  x86/msr: Switch users of native_wrmsr() to native_wrmsrq()
  x86/msr: Remove native_wrmsr()
  x86/msr: Switch users of native_rdmsr() to native_rdmsrq()
  x86/msr: Remove native_rdmsr()
  x86/msr: Switch native_wrmsrq() from macro to inline function

 arch/x86/coco/sev/internal.h              |  7 +------
 arch/x86/include/asm/microcode.h          |  6 +-----
 arch/x86/include/asm/msr.h                | 16 ++++------------
 arch/x86/kernel/cpu/intel.c               |  6 +++---
 arch/x86/kernel/cpu/microcode/amd.c       |  4 ++--
 arch/x86/kernel/cpu/microcode/core.c      |  4 ++--
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c |  4 ++--
 7 files changed, 15 insertions(+), 32 deletions(-)

-- 
2.56.0

