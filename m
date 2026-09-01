Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7450D3B71BE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260217; cv=none; b=bDvltIzr6YdztjkJudly8NaNjIYVkyx8711gC5cYJ05pY9MbmfwR0QXxHIjlVtm0HtDV0vBLP7jj0ozFS6yFnH00yRUdaTtBHz3MDpd1MM38L+Ehyt3k3bBxhn/HKIzN7UkY2zPZ3QV4CvCoJKTh8fs9bdg65UWeSJIMKXygXno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260217; c=relaxed/simple;
	bh=16igRHFrqT675Ss7dFn9F8eN3Io9ObGsmCjLr/bX9Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rt4vUY4rlaP+gl18oyL8makbx28gx11G2waevxzXkDVCL1/NOcwO2UbHuLrFO8I3OGxpEeb6B8tNwkSiGymSzUINLUBViZK1N+glzHa4NsUiwmUQUHi+YPHEUtPnvSX/g+z+pYnVhwSsC7QAUB1BGLrmWH86K3LvJJsn7vBPVns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=CbfQPnSK; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=JE7LS+TN; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=viN5agZ3; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=EoU7/wby; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="CbfQPnSK";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="JE7LS+TN";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="viN5agZ3";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="EoU7/wby"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4922C1F82C;
	Tue,  1 Sep 2026 10:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788260209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Uha6yMGbJ/Wp37RxLUFO9uCgUZrpTe49xfF4hLBHzDY=;
	b=CbfQPnSKa7PPFsaoHVedJvRen/guWoa9Mys7+U/yDK1cD6+vHh4pcMH6YVrrPkR/KmDLYM
	JBWj/bt6oj3FtoPsVsr+7s+FRVtl579iZ022sqHZ9n9gajMdBLJtj+KSMw77IFQ/1wIqMI
	bB2afE6PRMh8Q/43lLOuaPSDX9f6XMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788260209;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Uha6yMGbJ/Wp37RxLUFO9uCgUZrpTe49xfF4hLBHzDY=;
	b=JE7LS+TNivwSsH0sFQ5VxWZi+cs098GE8YF3suPqyUyqbRXXwhHurqn4QA7XH3HrJUTa1S
	7xKH8KlJblEJ8VCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788260205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Uha6yMGbJ/Wp37RxLUFO9uCgUZrpTe49xfF4hLBHzDY=;
	b=viN5agZ3tNl3GWvwOWAawsvoK9bDTc/kHTqMoVe6U4LAT6pR3YoI7Irm5EgLHZrIzR+hz3
	D58r6tcQ/MaWNWDcdmv7z8EDbiDA0n2JBv27tbf2BRkhS3q7FAvgT4udDx8X1R5Xg2J+bE
	oX/ZIrN3ad4zKgrren0j9MU17/VDq2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788260205;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Uha6yMGbJ/Wp37RxLUFO9uCgUZrpTe49xfF4hLBHzDY=;
	b=EoU7/wbySWT+JX1fYBB/0D6qSpiB1k6IeYNpVD7rrnNIRdLoUPs6mIB05S82TFWIxC3GoY
	F6JHP5ojpC4II0AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0472913515;
	Tue,  1 Sep 2026 10:56:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qq0gAG2vlmrRGwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Tue, 01 Sep 2026 10:56:45 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-kernel@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>
Subject: [PATCH v5 0/5] checkpatch: userspace improvements
Date: Tue,  1 Sep 2026 12:56:37 +0200
Message-ID: <20260901105642.851234-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -1.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[suse.cz,linux-foundation.org,canonical.com,perches.com,gmail.com,uniontech.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]

Changes v4->v5 (all by sashiko):
* Explicitly match the directory separator in new entries for
  is_userspace()
* Allow --no-userspace to override setup in the config (using undef
  instead of 0, separate checks in is_userspace())
* 2 new commits:
  - checkpatch: Factor out the check for UAPI files
  - checkpatch: Skip kernel specific checks for userspace

Link to v4:
https://lore.kernel.org/lkml/20260810164552.1049483-1-pvorel@suse.cz/

Petr Vorel (5):
  checkpatch: Add more userspace directories to is_userspace()
  checkpatch: Ignore <inttypes.h> format macros for userspace tools
  checkpatch: Add --userspace to force userspace rules
  checkpatch: Factor out the check for UAPI files
  checkpatch: Skip kernel specific checks for userspace

 scripts/checkpatch.pl | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

-- 
2.55.0

