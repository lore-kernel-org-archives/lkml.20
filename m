Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792674321;
	b=cC0cqsV8ErclycpDv9NMFfZ0UO/N8MoiN6raHtkpZeRnD/inlcTREhlKOmROrDO0Gs+e
	 ajLWdxyZ6lTc/uFxeZt2ED5txZba1Jat48qCi64sm43K8VpkqfX1EBx9jU2km5X6by3o6
	 edF2M8SzDGhHiLYO4v+mphlfjhTJzM1PQomcIVgnK5rosm7XCHIAeozQvKMvzaJboK1Rt
	 XV/oNTqFsLxNmoMGDK823ncUwIBLN7AWar79ZluchkCO3xHwy1uOvly8lWGYWFgC199RM
	 zmy46n82Rtmd2QDxPRXbBpgjuI7+2tYwO19vYmx6Bk5XRpdm0Qm//DbP2RbI7OPm+bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674321;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=iTNFR4evSP92ldfpRzbaHMcGQaFXxoNI/gZNjNyi/GM=;
	b=z48j993T7Nh83ObXpZRQ5g9i+7fLSF7Q88UMr465wY1j2ZBAIZMbMPszKlmuU2cRwVJ9
	 8xwOhmtgc1vo0m164Ufh6T3xi5hpfQVsZ7q9CTjMy0imNxgqiBtokHpumIhq7wW1tGjSA
	 Mt0XXuINj/G4kvbOZpY/T0qRYuyoWocJWSPVFfCf/W6muD1nje7d37vLCIpuSSxv9XZQh
	 xFtgGJTBGbmfbXQnw7vdv8+LFj2txJ0tDFnj3HTLImXp5yFhfpZ+JENcKTIvpUw9icriw
	 hAV2VyNk5oHJzOVQsDZa7yx4qrke+RczRvqJwJY7KN9TXY41sINoW3IIzD7Og7em+Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b="X/L4l74J";
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b="X/L4l74J";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C27606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40C27606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=X/L4l74J;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=X/L4l74J
Received: from kunlun.suse.cz (unknown [IPv6:2a07:de40:b306:2000::2])
	by smtp-out2.suse.de (Postfix) with ESMTP id 6832D1F454;
	Thu, 22 Oct 2026 13:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1792674318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iTNFR4evSP92ldfpRzbaHMcGQaFXxoNI/gZNjNyi/GM=;
	b=X/L4l74Jf/0mLbVc7JZvJ6eRjl89bZynJ30eKtbFF7J9oEp/bp9WX/nQsoJO/D4UgPWEu3
	cfhAI1cSEuTIfy8E/QTBvC3A99IaMFBQd5ksk01HnDIbkujcFLnDa/m2Yu4F0DSIqQjrNv
	lzvFcV5wqApgIcQVCzbkiHsyJYPWOHw=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="X/L4l74J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1792674318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iTNFR4evSP92ldfpRzbaHMcGQaFXxoNI/gZNjNyi/GM=;
	b=X/L4l74Jf/0mLbVc7JZvJ6eRjl89bZynJ30eKtbFF7J9oEp/bp9WX/nQsoJO/D4UgPWEu3
	cfhAI1cSEuTIfy8E/QTBvC3A99IaMFBQd5ksk01HnDIbkujcFLnDa/m2Yu4F0DSIqQjrNv
	lzvFcV5wqApgIcQVCzbkiHsyJYPWOHw=
From: Anthony Iliopoulos <ailiop@suse.com>
To: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ocfs2: clean up falloc and inode flag definitions
Date: Thu, 22 Oct 2026 15:04:55 +0200
Message-ID: <20261022130457.69343-1-ailiop@suse.com>
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
X-Spamd-Result: default: False [-2.86 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_SPAM_SHORT(2.95)[0.983];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	ONCE_RECEIVED(1.20)[];
	RDNS_NONE(1.00)[];
	HFILTER_HELO_IP_A(1.00)[kunlun.suse.cz];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[kunlun.suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DIRECT_TO_MX(0.00)[git-send-email 2.56.0];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b306:2000::2:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b306:2000::2:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kunlun.suse.cz:helo,suse.com:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.86
X-Spam-Level: 
X-Rspamd-Queue-Id: 6832D1F454

This short series cleans up and replaces redundant ocfs2-specific falloc
ioctl and inode flag definitions in favor of generic ones.

v2:
- repost as series
- replace previously omitted OCFS2_FL_{MODIFIABLE,VISIBLE}

Anthony Iliopoulos (2):
  ocfs2: replace ocfs2-specific falloc ioctls with generic ones
  ocfs2: replace ocfs2-specific inode flags with generic ones

 fs/ocfs2/file.c        | 26 +++++++++++++-------------
 fs/ocfs2/file.h        |  4 +++-
 fs/ocfs2/inode.c       | 24 ++++++++++++------------
 fs/ocfs2/ioctl.c       | 27 ++++++++++++++-------------
 fs/ocfs2/ocfs2_fs.h    | 27 ---------------------------
 fs/ocfs2/ocfs2_ioctl.h | 26 --------------------------
 6 files changed, 42 insertions(+), 92 deletions(-)

-- 
2.56.0

