Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794638748;
	b=aUwlkY68nNWV6R+kXbYz4Jmz8cRI7arhh6RYUiqH6N9fM1UGAt5cFTzYZcQpPms8ZbHo
	 hqXEariF7FH9KFAj4plMxVM4cS3nue5CC+oWm+BfF8JuD7/3VEpFWm/MIKpNi1LR4UaKp
	 fh20rvpL6ufoUnpmYGNzuwvfB3XaeEqU40fR2ulerbe833xGYkeMNQV3ZPfpzeRCrnFM4
	 73bn0pbYtLA9mOvCXsnp/6shNr3WFWv0jBa6Bs0Sd2b6StMZ61cHrgJMCqLBF/A8ngeK/
	 MfaRHcqpjR+LTpKmikWrrkV7ZAun8T/3YdnSGZPPrHb+OL3BUWdeT99pYKb4GZW5jxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794638748;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=fucPP4GY9TYbpnSOLboBx5LigJVO7vm1ZbjZjrxd49g=;
	b=OoqjDugvvXShhWiRteOHxTZgwjP7AjXluUGcZcS/itoFHzP5YIeJy/vJStAmbCWkr5gP
	 GKpzzEjxYX/ehbRLK5EaHuFEBmEI2J2iRlR0M0AXVCT968H81THmqtUNfGqRmKaXYXs+g
	 28Zxpng8WpvqMtP34sb7UnjUpEgw2bVcWvjNl9kB5CUl6F3y46qHOPq52MLJtogf2jKwm
	 2fUABU/8JPu4VPCdPgY4Ur3mj40ZZnwtzU/9/d96sRiMD9iDmsf29D/iHnMS05tAddAGg
	 dFqSdglRmQdXlkezl4LtX/5Ws9HWB9d/vap+aMuNlSg5OD0H1btg8/HlUpZFE5HEuog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=IRlQRwNY;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=IVmNh9of;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6240D606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6240D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=IRlQRwNY;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=IVmNh9of
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 26F2022132;
	Sat, 14 Nov 2026 06:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794638745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fucPP4GY9TYbpnSOLboBx5LigJVO7vm1ZbjZjrxd49g=;
	b=IRlQRwNYWgcBlvDkO1+9QVbpACg5XFFoyNpJ5OYzzoJbgqL2+ZaOg8eLzdVlR2wxAHOT34
	+YSutWbM0APnGddpYAp4aPDDhy1nlqvB4UgXTK89w8zNqRMiQ1qUJcqaZPUgAsquXx/PS3
	hUJ4oL0NGsUmkE6hXuQymlJdfGur2jI=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=IVmNh9of
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794638744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fucPP4GY9TYbpnSOLboBx5LigJVO7vm1ZbjZjrxd49g=;
	b=IVmNh9ofnS4WCXTPjidUheDvLwK79GEhZDIWaDRPWEFs07sybFEryfNgpoNFEk0BhdluIz
	80GtVdWJ3lF4pwTMXmYVdH5ot+z+K+AcVlW+mJj5p0U3aeRuyTmEX8xgVx2nClmsvTGPbC
	IzT8s2gkKOaB24C+QgWqoRbJKnZNTJc=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D306F134C3;
	Sat, 14 Nov 2026 06:45:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wurwKZcD+Gr1SgAAD6G6ig
	(envelope-from <jgross@suse.com>); Sat, 14 Nov 2026 06:45:43 +0000
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v7.4-rc3
Date: Sat, 14 Nov 2026 07:45:43 +0100
Message-ID: <20261114064543.1079564-1-jgross@suse.com>
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
X-Rspamd-Queue-Id: 26F2022132
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
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
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -12.01

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.4a-rc3-tag

xen: branch for v7.4-rc3

It contains a bunch of isolated fixes of Xen related drivers.


Thanks.

Juergen

 drivers/xen/gntdev.c       |  8 ++++++--
 drivers/xen/grant-table.c  | 48 +++++++++++++++++++++++++++++++++++++++-------
 drivers/xen/platform-pci.c | 14 +++++++-------
 drivers/xen/privcmd.c      | 15 +++++++++++++++
 drivers/xen/pvcalls-back.c | 26 +++++++++++++++----------
 5 files changed, 85 insertions(+), 26 deletions(-)

Andrey Misiurov (1):
      xen/gntdev: fix deadlock between map ioctl and mmap

Jan Beulich (1):
      Xen/gnttab: improve error handling in gnttab_dma_{alloc,free}_pages()

Juergen Gross (1):
      xen: don't allow gnttab_dma_[alloc|free]_pages() in PV guest

Kavitha Daula (1):
      xen/grant-table: annotate on-stack work in gnttab_unmap_refs_sync()

Qihang (1):
      xen/privcmd: fix double free when an irqfd is shut down twice

Teshan Kannangara (1):
      xen/platform-pci: Disable device before releasing PCI regions

Yehyeong Lee (2):
      xen/pvcalls: unwind pvcalls_new_active_socket() step by step
      xen/pvcalls: destroy the per-socket workqueue on release
