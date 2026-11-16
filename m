Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844985;
	b=VG5leCutDY2WAJ9ZfjoL3jLkoMIuXhGqV8dKoWbBkmixrpjKUTE9PPWuuq6SS803qgCp
	 rFxZqPxNHv16m/yzYRIvOdjCi48yJQgFmGAHu7LnG0c2YYBC1qNgZ5juJxTTpNHUBHnsa
	 NRrJcHp/Zv1HdjHtuqdmTzaCZBoXJtm9+NtQEjvA1JYpeif/d6xDxggEy4jU6sy9cZ8Qw
	 eibNM6AIW/7sFV0/LCi30XomBGZxsrwIjPfI73WrzA/bfSWjsHz78UrJfBawOMH2X3aDC
	 735UgX/2yVlXud8MD0+yxdvdHxh8yUM3JZsKrEb1HB4ShdlxRGYiwur2dcprxlthigg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844985;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:X-Spam-Level:
	 X-Spam-Flag;
	bh=7fP1rRVkXld1lGnzw+N3RAk1uoc6VsTel5zPXTXS+kE=;
	b=LERjYH062AQZkdvwtUnNFqykQuyKY6pXGcX1kk5n/4/Q1LEj0q/rD0gkKR8H/0XsngcC
	 tZBSGYzRyQAbTqDsXd+Xb7QbGy7BYauSlOSWMtxaagj/aja1Nqo09sVtm2NvgXF3e9l+B
	 dbCuE0a/uMfRIXu4M/NE4A1LUljs18Mg7JjzMqizLxMtxojzXOsTDboiIyG5Rebp3r6FF
	 jRuBW+4kSQ12i6YWGYqHS9jpO0VkweNyDPbqsKrIzdRuBxQpmGlmyQiXjFIAEdSoCohg/
	 s4hk6WeXBUhENSfBGV5ULrzTBt9IQBQNtKmzH1sWLzjRWSFJ8PWnezt1UVwdmgBj5VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=u5FrU8S7;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=u5FrU8S7;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02954606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02954606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=u5FrU8S7;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=u5FrU8S7
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 24DA622310;
	Mon, 16 Nov 2026 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794844983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7fP1rRVkXld1lGnzw+N3RAk1uoc6VsTel5zPXTXS+kE=;
	b=u5FrU8S7QMY9fMo70nHZMKA5tLcflnnpNFnxi7Zx8ePGfGNzODw0TGQWKX6QuGv1hGngUD
	vUeAKbrBgxMWeNmaL1YZ0vxsao4OJ5L5+rDrTOX9QNGPzjam2PVWSY+lUEJVFQiwG91lOg
	ZKtDzKT5aegZond/f9csG5PzkMUd7vc=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794844983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7fP1rRVkXld1lGnzw+N3RAk1uoc6VsTel5zPXTXS+kE=;
	b=u5FrU8S7QMY9fMo70nHZMKA5tLcflnnpNFnxi7Zx8ePGfGNzODw0TGQWKX6QuGv1hGngUD
	vUeAKbrBgxMWeNmaL1YZ0vxsao4OJ5L5+rDrTOX9QNGPzjam2PVWSY+lUEJVFQiwG91lOg
	ZKtDzKT5aegZond/f9csG5PzkMUd7vc=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 867431334C;
	Mon, 16 Nov 2026 16:03:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Nz6MFzYp+2pYUwAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 16 Nov 2026 16:03:02 +0000
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
	Ben Horgan <ben.horgan@arm.com>,
	Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>
Subject: [PATCH v4 0/5] x86/msr: Drop 32-bit interfaces of native MSR functions
Date: Mon, 16 Nov 2026 17:02:54 +0100
Message-ID: <20261116160259.1579333-1-jgross@suse.com>
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
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80
X-Spam-Level: 
X-Spam-Flag: NO

Switch all users of the 32-bit native_*() MSR access functions to the
64-bit ones and drop the 32-bit interfaces.

Based on the series "x86/msr: Drop 32-bit MSR interfaces" [1].

[1]: https://lore.kernel.org/lkml/20261116150208.1572254-1-jgross@suse.com/T/#md59eab1d0c8b23a3184cbab408629c86f95e8419

Changes in V2:
- small fix in patch 1
- rebased

Changes in V3:
- another small fix in patch 1
- rebased

Changes in V4:
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

