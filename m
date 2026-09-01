Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95903A6B7F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260215; cv=none; b=ZWI+1/+pPrNb0FsWL01SdBo+B4FOIJQcYypg5sV2OUOHG9hJHbLD1CGB8ztl0vxfim0vFS+rqB9GYlu79jxA8z9SOt2SQOb3YiiXjf/OCJePtM4FYmFj830L11BodM3y1tI0MGD8kxCwpnaHW+DSpsvZTVq98NKLKpftspCzkm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260215; c=relaxed/simple;
	bh=2dkcy9q8aUxhvulCMv23lkdDYUK+aaqyQ8PDyVFMtCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IOQVhwXf4edCq7GlO9rYjdJEPUJLbH8NakPGJ/nO6Z9hayFqdI+wxqEs63Q96FhMXw5g5LnKKvgrKMHG7LRAUEcdPauA8Rb4eaJslotiMjEH3oCNVlu11i6HfT/FtYQoz9OkEe6SJH/kgPB+Er/ImVKRxEOF+6hL3gEehcQ0Tl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=X7ltb4nr; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=b1WZieW0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="X7ltb4nr";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="b1WZieW0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 44D161FB3B;
	Tue,  1 Sep 2026 10:56:46 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788260206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6YrnX0TiZfKkzbR6al953cuN6ojb584mWviRS5jyvxI=;
	b=X7ltb4nrjCfm5vaQM34poLnn8sBHFrtkc2FhutzniWUhXcmIiL0Dayi664Xd91u1z7Mx7b
	0+skxNyhq40Mbj1NjxuQ0dTIWdKT6FvRH7pQBvvOli+bKhbmOvCsi1C7JnmZ/7hxGEUVO4
	aKbOxeC87d8U4g/mxxCFz9gpIBfDgDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788260206;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6YrnX0TiZfKkzbR6al953cuN6ojb584mWviRS5jyvxI=;
	b=b1WZieW0NysnXBqCbGR5QjWEGAi+D02JC8CHIX4RfgiwM2khr3j60UFHp6tsody9IXL35B
	FsJcZLg5MCKm/UCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C45F0136C7;
	Tue,  1 Sep 2026 10:56:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wEE+Lm2vlmrRGwAAD6G6ig
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
Subject: [PATCH v5 3/5] checkpatch: Add --userspace to force userspace rules
Date: Tue,  1 Sep 2026 12:56:40 +0200
Message-ID: <20260901105642.851234-4-pvorel@suse.cz>
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
X-Rspamd-Queue-Id: 44D161FB3B
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	TAGGED_RCPT(0.00)[]

Also allow to use --no-userspace for userspace projects which vendored
checkpatch.pl and use --userspace globally to be able switch it off for
files with kernel code.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v4->v5 (all by sashiko):
* Allow --no-userspace to override setup in the config (using undef
  instead of 0, separate checks in is_userspace())

 scripts/checkpatch.pl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index b458c7f22684..ead35e6abba7 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -63,6 +63,7 @@ my $env_config_dir = 'CHECKPATCH_CONFIG_DIR';
 my $max_line_length = 100;
 my $ignore_perl_version = 0;
 my $spdx_cxx_comments = 0;
+my $userspace;
 my $minimum_perl_version = 5.10.0;
 my $min_conf_desc_length = 4;
 my $spelling_file = "$D/spelling.txt";
@@ -143,6 +144,7 @@ Options:
                              (required by old toolchains), allow also C++
                              comments (//).
                              NOTE: it should *not* be used for Linux mainline.
+  --userspace                Force rules specific for userspace.
   --codespell                Use the codespell dictionary for spelling/typos
                              (default:$codespellfile)
   --codespellfile            Use this codespell dictionary
@@ -358,6 +360,7 @@ GetOptions(
 	'codespell!'	=> \$codespell,
 	'codespellfile=s'	=> \$user_codespellfile,
 	'typedefsfile=s'	=> \$typedefsfile,
+	'userspace!'	=> \$userspace,
 	'color=s'	=> \$color,
 	'no-color'	=> \$color,	#keep old behaviors of -nocolor
 	'nocolor'	=> \$color,	#keep old behaviors of -nocolor
@@ -2667,6 +2670,9 @@ sub exclude_global_initialisers {
 
 sub is_userspace {
     my ($realfile) = @_;
+
+    return $userspace if (defined $userspace);
+
     return ($realfile =~ m@^tools/@ ||
 		$realfile =~ m@^scripts/@ ||
 		$realfile =~ m@^arch/.*/tools/@);
-- 
2.55.0

