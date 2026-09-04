Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ACC44163B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519771; cv=none; b=R4c4yFDZzEMh7pA5UQEcHxwsuGdtzx5C6nTBzuuIrJJA6i0U9A3AgVS8iTLMUrn8zweQ77Hz798gBDdEjwNy1qwmfRghgu82LIKVfqbO8lXbo449emglgG74zUUqhSZYI0HQpqAFAPEesFHO2NQS5VEydWT6I7HmDXlCtK4veI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519771; c=relaxed/simple;
	bh=RmpThGE/7dYYYrCxSsEQpaSk/DMCdZvKml5jgo1J9cI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G9TlZIU583YBMfcS1AFgTVXNprIHjtRhiamZeEG9aQBSaVK/8vHG85Qd05BLZZpdzTxs7rklUyG2GpxZR4rV4W/zNDilBleUC6OJoATx4PfpOaIU9b6GaF9z75Sal92m08dmpwFKBdE3j+VfaicO61M9uLFLmVfLrjg37dwyyvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=y+D/zfLf; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=1a27YZMt; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=lrwBTaDV; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=jEr2KiBc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="y+D/zfLf";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="1a27YZMt";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="lrwBTaDV";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="jEr2KiBc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E6E0C21CB2;
	Fri,  4 Sep 2026 11:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788519764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=O8uRn6oEm4M/UTEiTrlEOZUsn5ITvfsSMozaatltVTU=;
	b=y+D/zfLfmzDXVFf13GGhPJJGMxCnQYrDONaNk1zUjcwLNhh4o0MxwnkB4vuD2vilbZRn/Z
	QMSqxD8PIb+vHZxnjvLacVjsbN0aUYL09kZRQue/Q88qas6PJLBGn/d3yyuWJkIYbd5qFD
	yquYozCdg4fgxFv3HqCwnfI7NqniUv8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788519764;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=O8uRn6oEm4M/UTEiTrlEOZUsn5ITvfsSMozaatltVTU=;
	b=1a27YZMttfjpSx94T8x5r1pwl7fRdQ4ce34XvUGB5ahR0GDuP2RF8Ekql0P56gssZwE/r0
	KLouqY3Vk/H4lkCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=lrwBTaDV;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=jEr2KiBc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788519759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=O8uRn6oEm4M/UTEiTrlEOZUsn5ITvfsSMozaatltVTU=;
	b=lrwBTaDVAjJ0vYQG68b+7+vpjHdyptZzkdgF32DAcXARKoxw4zOXADWvPlADmLRJI65EIi
	vYEKUYPEJeq6HhnA2XG0EhgqbJtaA3oTepGP1bT2cLBzYum6wi9Y7XnWP3PGKA2ZXZuhoa
	I6ygd6TuS7ftzACRc3wJSBwRnG75R5s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788519759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=O8uRn6oEm4M/UTEiTrlEOZUsn5ITvfsSMozaatltVTU=;
	b=jEr2KiBc3nrCFI1YtMLu86G54bvruPoQQZTLhLgURLDjhR6thf+99OPS41d2X/KVkZ4VLu
	16VzP/qCt92u3DBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 93A0F13726;
	Fri,  4 Sep 2026 11:02:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id calpG06lmmpScAAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Fri, 04 Sep 2026 11:02:38 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-kernel@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>
Subject: [PATCH v6 0/4] checkpatch: userspace improvements
Date: Fri,  4 Sep 2026 13:02:26 +0200
Message-ID: <20260904110230.1219037-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.51
X-Rspamd-Queue-Id: E6E0C21CB2
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.cz,linux-foundation.org,canonical.com,perches.com,gmail.com,uniontech.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:dkim,suse.cz:mid];
	RCPT_COUNT_SEVEN(0.00)[8];
	DWL_DNSWL_BLOCKED(0.00)[suse.cz:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO

Few improvements for user space code + --userspace option for projects
which vendored checkpatch.pl.

There could be probably more checks which are kernel space only.

v6:
- Remove 4th commit "checkpatch: Factor out the check for UAPI files"
  which added is_uapi(), which was wrong. I overlook that regex on BIT()
  macro is different from the others, matching only ^include/uapi/.
- Fix 5th commit which wrongly called is_uapi() instead of
  is_userspace().

Link to v5:
https://lore.kernel.org/lkml/20260901105642.851234-1-pvorel@suse.cz/

Link to v4:
https://lore.kernel.org/lkml/20260810164552.1049483-1-pvorel@suse.cz/


Petr Vorel (4):
  checkpatch: Add more userspace directories to is_userspace()
  checkpatch: Ignore <inttypes.h> format macros for userspace tools
  checkpatch: Add --userspace to force userspace rules
  checkpatch: Skip kernel specific checks for userspace

 scripts/checkpatch.pl | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

-- 
2.55.0

