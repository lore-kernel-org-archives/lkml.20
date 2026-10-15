Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62C236AB4D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064684; cv=none; b=Me6ttxxwHHFPdr7iwYh8w/0pbuakHQuJ5nQ8LCbfCjoAZxbShxF7G4aXfSekZByAk3fOoxLEWdOTTb2OEKeJSkIKUGmxZ6V368DRlJGL1hyDmURNNx2Ngn8jQI/SgyApd3j9aNx1Y9kQSfEEwuWWbrBTaRm/DJbQ98OeiVy+4iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064684; c=relaxed/simple;
	bh=gK62h6M3cyPBpH7J0SmqSJ/F09lMmt6PHXNiDUNeUcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=co77ziTdUsLPRhSSdE3lyPARirphkAWhiJyU0nT3o4RWxTlnMaW+3aFTmbSkvorc+b7Ibz7hbgv0raB7bud82SBs2zXAvVweTEnI8GXQKyZs2ufPbiW1jWWEQ5Afa0xitbNvWfLWMabPLB4DVFH33cCARwkSmb+WYnNR+B7uX2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Mj8oUkZU; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Mj8oUkZU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Mj8oUkZU";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Mj8oUkZU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A20D71FCBB;
	Thu, 15 Oct 2026 11:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1792064680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=je3r8ay2iRuWNnL7qXx74c33rLnIn1TUKUdbkrxp1Vk=;
	b=Mj8oUkZUz4fvByBs+2Rz0mGRl0SmUnzRkUZySscMLsYFOjQEUCywpcxcNOlEWtgIrPGF/b
	PbZMqOKCDa9L45nNSjI6xC+/jpwhnd3yzY9VathI4noYaFc+GKH87fzx7JqR1NLbLQcSh7
	y8Tojmxi8apkQD2ciCeMWkJinS/CxJQ=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Mj8oUkZU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1792064680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=je3r8ay2iRuWNnL7qXx74c33rLnIn1TUKUdbkrxp1Vk=;
	b=Mj8oUkZUz4fvByBs+2Rz0mGRl0SmUnzRkUZySscMLsYFOjQEUCywpcxcNOlEWtgIrPGF/b
	PbZMqOKCDa9L45nNSjI6xC+/jpwhnd3yzY9VathI4noYaFc+GKH87fzx7JqR1NLbLQcSh7
	y8Tojmxi8apkQD2ciCeMWkJinS/CxJQ=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A158132C9;
	Thu, 15 Oct 2026 11:44:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YgeHEqi80GpqYgAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 15 Oct 2026 11:44:40 +0000
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v7.4-rc1
Date: Thu, 15 Oct 2026 13:44:39 +0200
Message-ID: <20261015114439.418665-1-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: A20D71FCBB
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.4-rc1-tag

xen: branch for v7.4-rc1

This time only small fixes and cleanups all over Xen related drivers.
Nothing really stands out here.


Thanks.

Juergen

 arch/x86/platform/pvh/enlighten.c    |   2 +
 drivers/block/xen-blkback/blkback.c  |   7 +++
 drivers/block/xen-blkfront.c         |  16 ++---
 drivers/pci/xen-pcifront.c           |  16 +++--
 drivers/scsi/xen-scsifront.c         |   3 +-
 drivers/xen/gntdev-dmabuf.c          |   4 +-
 drivers/xen/gntdev.c                 |   7 +++
 drivers/xen/mcelog.c                 |   2 +-
 drivers/xen/privcmd.c                |  47 ++++++--------
 drivers/xen/xen-pciback/pci_stub.c   |   7 ++-
 include/xen/interface/hvm/hvm_vcpu.h | 116 -----------------------------------
 include/xen/interface/platform.h     |   4 +-
 include/xen/interface/xen.h          |   2 +-
 include/xen/xenbus.h                 |   2 +-
 14 files changed, 68 insertions(+), 167 deletions(-)

Abdifatah Suruur (1):
      xen/gntdev: prevent private mappings from becoming writable

Ethan Nelson-Moore (1):
      xen: remove unused hvm_vcpu.h header

Gui-Dong Han (1):
      xen/blkback: Prevent missed completion when draining I/O

Hemanth Selam (1):
      xen: fix typos in comments

Jan Beulich (1):
      x86/PVH: don't truncate initrd address/size

Koichiro Den (1):
      xen/privcmd: Only claim ioreqs matching an ioeventfd

Ross Lagerwall (1):
      xen-blkfront: Fix IO race during unplug

Ruoyu Wang (1):
      xen/pcifront: Fix PCI device reference leak in AER handling

Wentao Liang (2):
      xen/gntdev: Fix gntdev_dmabuf ref leak in dmabuf_exp_wait_released()
      xen-pciback: Fix pcistub_device ref leak in pcistub_get_gsi_from_sbdf()

Yehyeong Lee (2):
      xen/scsifront: check for a NULL shadow entry on a backend response
      xen/pcifront: check that an AER callback exists before calling it

Yuchao Zhang (1):
      xen-blkfront: unbind irq before tearing down ring and shadow requests
