Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E258247D44A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260217; cv=none; b=UT+tyIy9XqBzxnb+usskETiUc125uLgf7IWZPRnJtJQAz5hz2vShwcl+kcpQBLeJq8MWMxxYTY16/7tOT+ERuMt89YcyrkBZOc9DSogC6GOGhWZSc7r0ujs20Z4M9zVoR4vdFIt2ib7/7VcpqzTuBQvkxI2NDJ4txAOQZDW6Y4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260217; c=relaxed/simple;
	bh=RJ6zKruVzQnI5WCIPqtFLSCYpserc4n/SPQFVNwEUsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGTcwaWzT/em39QNlZ9dFTVhZcPN656gO3rpdGZkUSBpYDmSdyW9L3deLiICF8PnCHfbz+a0knHNaINIcJrwrXwfyK2IFsBDknMwr/UgFYGkcmAthagySXRq991lQQh0GiYC9rCW1Beck1GFqArnWZc/+/1ffweJRYs6fGPQW/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=qhtHQOC4; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ycD9aY1p; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=gWNvPbu7; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=hYPPoRt+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="qhtHQOC4";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ycD9aY1p";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="gWNvPbu7";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="hYPPoRt+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B0CD921CB2;
	Tue,  1 Sep 2026 10:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788260209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R+7Qx4CI9o1js0Nlw/i22xMrJvCdBD7kjE9bczpka3k=;
	b=qhtHQOC4Q9aBl+IjOuofMEJtVhdwcdNGMfR+hUoPZU+wmTpN3G9HJm4mW/7JwJ/aI710jv
	s6pN6rbL3HoR2KIJWXoZS56CqjJQ5q5WqzzJ0R9y3X4d40Bga0GZe+wTN33vDfZ7EmHmja
	4sPSRv5RFSefNjFMXz/6dCtaq8xzevk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788260209;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R+7Qx4CI9o1js0Nlw/i22xMrJvCdBD7kjE9bczpka3k=;
	b=ycD9aY1p75+kw/DyCvhD+Nu0FeN8sPH2YLCazyPCDvB0Ow3GkI/lFPgYF5lQXdrE1Dae92
	tU4gEYP+MOuKRHBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788260205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R+7Qx4CI9o1js0Nlw/i22xMrJvCdBD7kjE9bczpka3k=;
	b=gWNvPbu7EMMmDxO7/IG8McmJE6ZvrNoHzswQaH3wt4uG/R+ZAjnP3FyukVjd7Bq+Hqy/rI
	o5Aac9GjZ/3bLlWl6XkSCkPe9a6CYzDV0ThrK6bzS9IRvcmNP3zYRu1RBamQ7gOhKidNHP
	4teexcgyFmihuXsR2icbO24XGfI4n7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788260205;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R+7Qx4CI9o1js0Nlw/i22xMrJvCdBD7kjE9bczpka3k=;
	b=hYPPoRt+FLK9D/QuA/8Zuk9t3JMsyEX8kuSJHWLKvTpvqtyEGugiDTmt6fTysSsgoPh1ai
	3+Q7OWhsBDVUErAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DCD41369E;
	Tue,  1 Sep 2026 10:56:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UDHuDW2vlmrRGwAAD6G6ig
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
Subject: [PATCH v5 1/5] checkpatch: Add more userspace directories to is_userspace()
Date: Tue,  1 Sep 2026 12:56:38 +0200
Message-ID: <20260901105642.851234-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901105642.851234-1-pvorel@suse.cz>
References: <20260901105642.851234-1-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -5.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[suse.cz,linux-foundation.org,canonical.com,perches.com,gmail.com,uniontech.com];
	TAGGED_RCPT(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:mid,imap1.dmz-prg2.suse.org:helo];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]

arch/ directory contains subdirectories with userspace tools (at least
arch/*/tools/ and arch/*/boot/tools/). Add check to consider any
arch/.*/tools/ subdirectory as userspace tools directory.

This helps not only to strscpy() checks but also to CamelCase checks in
the next commit to be more precise.

Follow-up: 99b70ece33d8 ("checkpatch: suppress strscpy warnings for userspace tools")
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v4->v5 (all by sashiko):
* Explicitly match the directory separator in new entries for
  is_userspace()

 scripts/checkpatch.pl | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f424dafce5bc..b8702f6bc9b5 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2667,7 +2667,9 @@ sub exclude_global_initialisers {
 
 sub is_userspace {
     my ($realfile) = @_;
-    return ($realfile =~ m@^tools/@ || $realfile =~ m@^scripts/@);
+    return ($realfile =~ m@^tools/@ ||
+		$realfile =~ m@^scripts/@ ||
+		$realfile =~ m@^arch/.*/tools/@);
 }
 
 sub process {
-- 
2.55.0

