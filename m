Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAF9495044
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519773; cv=none; b=TZAnpfPStx0iEN8IJhdj6a/TdsnJ+jRNng0sCzH0HH4qUkLTXp4l1d5pJ8kwu9/MPZdZ3GRgWgVP/ic50/LL38LPRu42PhnZBVNyS6FU3J9sNGVODaFeGx7FK9qVu8u8fK/7h0Ha/y46HQtfn9ZNMhssMU1NxYno5e7Ka2bnBx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519773; c=relaxed/simple;
	bh=AURBqjvEzTsmRivDmBBcQVd36GiOxxtoJZZbcIY/oDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dBo09PXdBFCKQitzGS/4gr9JbWZ6DkVokHDFxX/sSufxOq1/532N3pDLgWqg/c5DUsT8hTjcNWWUNnJdY6gFKrNYDF4O4efuQTqmZZUy0r6Y4WXXEZ+AHhvh+jnXDTGkqaEdrak9yUMAikmQ0A2izNGa3KqSCcnYgGSRE9572L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=VCrtE9BA; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=s4lXMGc+; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=dRtrXsfx; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=VBfS76my; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="VCrtE9BA";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="s4lXMGc+";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="dRtrXsfx";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="VBfS76my"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 489FC1FB6E;
	Fri,  4 Sep 2026 11:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788519765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIpdUWRilpn89RDx+wSg0QNOe/YcG4MdKz0FsZA623E=;
	b=VCrtE9BAkdOwI594bm6Th+J/NFW8B9opO52LbweLL3ufjoyZ/W8/x+47A/T9LcUzu5vbbY
	ScTuAvG3V6K/hOZNKW89WaShJRh3fvesY27IRN0Jq2GIQluRpkhrp0YT8Lax3p6dMb4e4Q
	M6zi8ot9R4XjzOOz0uqYl5EG+ivKRhA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788519765;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIpdUWRilpn89RDx+wSg0QNOe/YcG4MdKz0FsZA623E=;
	b=s4lXMGc+icv7R4WZ2WngEB1I6GL8drqYIOFM7GU86Qow9jx2hgowA8kX2rQHPr8hJBcWZ5
	9B/WDb+Mn5gc+sBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788519761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIpdUWRilpn89RDx+wSg0QNOe/YcG4MdKz0FsZA623E=;
	b=dRtrXsfxZ4Kd7KFyiceBsyi2KrBmsbcl7UvXZ1Vw4YjhIo8UN9HvFwCBsHaTHersrlvcAR
	mlwI1ANaihw948OwICgMunA3FY3V5drGXE7lkqWJ4jhN+hGl7mmmCofKoyFcO3O0sexdxi
	kQiRTs4b/88GDMnoXcuzezBPcBNzklg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788519761;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIpdUWRilpn89RDx+wSg0QNOe/YcG4MdKz0FsZA623E=;
	b=VBfS76myoGLCbyZb9UDNzTs/LS+XxVcERjG1LcrVPfJqIsLhfS94LRtKiR3yONnZu1qI7S
	aab3JBz7k+7vA3CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11C5613736;
	Fri,  4 Sep 2026 11:02:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MHlWN0+lmmpScAAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Fri, 04 Sep 2026 11:02:39 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-kernel@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>
Subject: [PATCH v6 1/4] checkpatch: Add more userspace directories to is_userspace()
Date: Fri,  4 Sep 2026 13:02:27 +0200
Message-ID: <20260904110230.1219037-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904110230.1219037-1-pvorel@suse.cz>
References: <20260904110230.1219037-1-pvorel@suse.cz>
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
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]

arch/ directory contains subdirectories with userspace tools (at least
arch/*/tools/ and arch/*/boot/tools/). Add check to consider any
arch/.*/tools/ subdirectory as userspace tools directory.

This helps not only to strscpy() checks but also to CamelCase checks in
the next commit to be more precise.

Follow-up: 99b70ece33d8 ("checkpatch: suppress strscpy warnings for userspace tools")
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
The same as in v5.

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

