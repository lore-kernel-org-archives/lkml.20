Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776AB2F5A2D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113150; cv=none; b=Xtszfr8cy/iEJmIApDBOmZHaay/qktIH+ElO68dbSTU2TxOYCfqMrOOv6Nlv6zWGMHnhrn2FcxUXNE1a7q15RvIqO3CvlNi28R9MeYhbqoZI52WtmnCkjST2QmAdsPfljzUGostbX33gR+LSm8G0umbnwxJaQgOv/YCMQ2Fm9sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113150; c=relaxed/simple;
	bh=LXMxtf2ccPDCvNqEtLdqsmnSgh3VZ2sSPfNYsFqrC0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pceRFjq9T6lg2vBjRkpnpsyPbyCrsnW1wJPjWUuTkzzgIqad6pyyitwx050Ujlts8VXXcxrg0X2eRkjABzXC9I+ufoi4pZj1rDDpxRshF2no0lZhPOHmeQH7jzBSfDDoLY0z1k5XRGhQA7c6JePWz26jsFU/QqFNp+8xx+52RWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=V8wmYmAj; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=N2ix3zjU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="V8wmYmAj";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="N2ix3zjU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5F21B1FD61;
	Fri, 11 Sep 2026 07:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789113143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3VQbWPmpkvNcp3TzsyH6ywnw4GQL1slYxwOo0B2ntUs=;
	b=V8wmYmAj16uAb8v1H8bG36Uy4cs62+lH9RPxe4IobYqDRrRACMUOluJB70kJHVwaIeO/kY
	5V3JEQfX1AgfKK5f0T5bxQQ0UqpmE1Kx5ofUq5dSzv2f2cbNUGvXJUMXgFMh3nB2sVbR4+
	YhP42aEVjym+137NST8JCIOA5tfydz0=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=N2ix3zjU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789113139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3VQbWPmpkvNcp3TzsyH6ywnw4GQL1slYxwOo0B2ntUs=;
	b=N2ix3zjUWN+cwDhLfe1ZQbi5s1H6HJgllrkGBtE7w3GSOvb9i113Uf3D1X4rXIKz0fGxm0
	V7PKiTTIlkjUS58K7oAQbG1LhrR5D8WwF9JugRWjhjmnIoeoq4Ss9z3F/j6uOQAmAHbjCw
	6Mr4jsl1a36p6OPU3wMnZvCG6wsepu4=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D7845136ED;
	Fri, 11 Sep 2026 07:52:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tIE9MzKzo2rbXwAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 07:52:18 +0000
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
Subject: [PATCH v2 0/5] x86/msr: Drop 32-bit interfaces of native MSR functions
Date: Fri, 11 Sep 2026 09:52:11 +0200
Message-ID: <20260911075216.3142309-1-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5F21B1FD61
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01

Switch all users of the 32-bit native_*() MSR access functions to the
64-bit ones and drop the 32-bit interfaces.

Based on the series "x86/msr: Drop 32-bit MSR interfaces" [1].

[1]: https://lore.kernel.org/lkml/20260911074530.3140830-1-jgross@suse.com/T/#t

Changes in V2:
- small fix in patch 1
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
2.55.0

