Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304572;
	b=JigOgBN6olW5JQmuuvhsx5qWJxz93j7/2oDQp/LssBV4OIq8HEBiWA2n741TrR8NxF6y
	 KUaRbiVsEGLPys7oP1paXtgx4m/JKPXSsuQ+9J7xZuZL5ZhPV8cizPsTZzJS/VUNjOgwo
	 yWKuVDV64hKT65TltJruLxEhKOpYbyqfloOl5yUMjiWmTb+ku6QagwyZTNBT5RLBkMpEI
	 J9DqPXqxF5LjhVri0zu9WuJpkRflllQhq7E0qBnAk9yuftEGlcDu3HPMw2T4gRGYKCgM6
	 QbOuRvGnZ90OfChbuZvo38lb6Lf+3eki537wZW8spD3cfZmitBShFdeU0TdY9Uf6onw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304572;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:X-Spam-Level:
	 X-Spam-Flag;
	bh=njqIDeu4mZ9D1qm6umrCPHuDUdn8t4YgJWAoQ9l6i2I=;
	b=sSnUx+F2FIvAFDhRuU1/Oj1IQxLQ8PgBJwihNi7bRaNa77KgPlWki1q5aMX/BG5J3T99
	 X0G9eqZS1VwVnGSOC8wvgKnie+2W8J1lAlgpVz1z78zekgJav9UKcxw+jgEv1f+Dfh+m5
	 ngUWtE2Y+z+df9hQM5XgdUB01XArMHPKc8pbLQXkoqb4wV5k9GQQ7ZLMfR0YiLHVzi6iB
	 AeP3eHcJOhpCjcu/KAZcpzW0oQVfDQmUrCZ2LAXKWft3VotR8Y9MeaPijhLG1ADeq/4nw
	 taovyXhPK3X+q6EqwLcQbUagxU4Irrw452XF91EtphIo5STiCM2MwhTuZuA6PXx4NSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=W9zRrQU3;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=W9zRrQU3;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F00606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2F00606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=W9zRrQU3;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=W9zRrQU3
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0352D1F80C;
	Tue, 10 Nov 2026 09:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794304569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=njqIDeu4mZ9D1qm6umrCPHuDUdn8t4YgJWAoQ9l6i2I=;
	b=W9zRrQU3CDuE8opufyUhKZFiDx1U2FzMNsgoboYaMotC/UN/fuzX1o3DxbjGn5PXYzMgzz
	BfcHSFEzonbMw3wX/0WH+Y6JBy4//QqKijcDW5USho2RkggJWYTnMr/Z8rPkhZwaSL/ogd
	eqo8tnzp8lIr9j0lwcF2XbynsTN0QLY=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794304569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=njqIDeu4mZ9D1qm6umrCPHuDUdn8t4YgJWAoQ9l6i2I=;
	b=W9zRrQU3CDuE8opufyUhKZFiDx1U2FzMNsgoboYaMotC/UN/fuzX1o3DxbjGn5PXYzMgzz
	BfcHSFEzonbMw3wX/0WH+Y6JBy4//QqKijcDW5USho2RkggJWYTnMr/Z8rPkhZwaSL/ogd
	eqo8tnzp8lIr9j0lwcF2XbynsTN0QLY=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9E5F1339F;
	Tue, 10 Nov 2026 09:56:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6GHdIDjq8mpWCgAAD6G6ig
	(envelope-from <jgross@suse.com>); Tue, 10 Nov 2026 09:56:08 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/2] Xen/gnttab: improve error handling in gnttab_dma_{alloc,free}_pages()
Date: Tue, 10 Nov 2026 10:56:03 +0100
Message-ID: <20261110095605.369848-1-jgross@suse.com>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80
X-Spam-Level: 
X-Spam-Flag: NO

This small series is V2 of a patch Jan sent out early this year.
I just added patch 1 due to some remarks Jan made when sending out
his patch, and then removed some now stale parts of his patch.

Jan Beulich (1):
  Xen/gnttab: improve error handling in gnttab_dma_{alloc,free}_pages()

Juergen Gross (1):
  xen: don't allow gnttab_dma_[alloc|free]_pages() in PV guest

 drivers/xen/grant-table.c | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

-- 
2.56.0

