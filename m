Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B9D49EC45
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519776; cv=none; b=OUG6hVxccLKMVP94+JBYQhfhHYT2GHEzmcV5boOHDxK/POPaX5L1c319UusJgDqkqZecj6gpT6J8Z8fNCbHfBjmfgGmOJQpUPAwG6AGGawBhcyaSzBLzrTKfqUd0MxrT+l681+WmInG32B/d/rzIc9IwKrRGj/Mw9y8Ubvkbv4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519776; c=relaxed/simple;
	bh=mWR0ogYHoYgNzNsHrQraWSldwjIEjwzM4qVXyndL4hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dri92UOeHHVc930xFPqaGHN2rC9w/m8ThodDE3WJHtboiF+w7ZRaWqLEoomiPLJ3021+ypQ5DqbYXxJZsFWOpoGqV624BkScVWiai2aQOdKt1INXAD0/3xLujh6YzD0c4zXIriciu1evpxZFaQIwp4VzXTJ8aEyAEYR0lCY+n3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=kcQDFoLZ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=yd7s08wg; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=2SU8eNQq; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=U/8u8GEd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="kcQDFoLZ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="yd7s08wg";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="2SU8eNQq";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="U/8u8GEd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7D7F21FB82;
	Fri,  4 Sep 2026 11:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788519768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mpMMhjGQLnDRBA6BUJnmYcR7rjeVlUkr1bUxCdVaQeM=;
	b=kcQDFoLZrwG7CVaXT0zIm2B55vEaqJZt1ZUQ1VjysBfoxj9jDdf0JbVah6VfhsdeK2VYsT
	+HMF1sj8VXt03swmQmKqnTMmPCfMpoi63hGsh6LYwEOB9i5rZFDY58Tp8/j/xzMg9X1ReE
	4giK46SswvrGPl6g5qrFs/0cUmjI6lg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788519768;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mpMMhjGQLnDRBA6BUJnmYcR7rjeVlUkr1bUxCdVaQeM=;
	b=yd7s08wg93npoYdysrvsyAEnldWwwYw0s8bf9HDXUPr/A7t9kYTTWDRWjtlrBnWnBa0TBw
	hq207TyE/iSFeBCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=2SU8eNQq;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="U/8u8GEd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788519764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mpMMhjGQLnDRBA6BUJnmYcR7rjeVlUkr1bUxCdVaQeM=;
	b=2SU8eNQq/HLjlFferz1fjcUx3+XX/Qmt7oBOaDEiZQeZKCZ/b05Tv1h6Hw5kLnAjrNOb9j
	fRe1DzKxEmH7dtUWVJsS3jTsMXtsGJt/FcKYlUE/ueDnAWpIqNVaXAx8HYKijAo1yLzov/
	3blh8LROXLuPRsbbPH/DvDr8zhFp5kg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788519764;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mpMMhjGQLnDRBA6BUJnmYcR7rjeVlUkr1bUxCdVaQeM=;
	b=U/8u8GEdw94RtD3eimv8ql269nNJnFzkooORrCc8x1iC7+jIWv2VLyr4bVpmmYkiFE1eU1
	koIfguJtOY6Tf+Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E5C7C13887;
	Fri,  4 Sep 2026 11:02:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0LynL1KlmmpScAAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Fri, 04 Sep 2026 11:02:42 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-kernel@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>
Subject: [PATCH v6 3/4] checkpatch: Add --userspace to force userspace rules
Date: Fri,  4 Sep 2026 13:02:29 +0200
Message-ID: <20260904110230.1219037-4-pvorel@suse.cz>
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
X-Spam-Score: -1.51
X-Rspamd-Queue-Id: 7D7F21FB82
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:email,suse.cz:mid,checkpatch.pl:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[8];
	DWL_DNSWL_BLOCKED(0.00)[suse.cz:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO

Also allow to use --no-userspace for userspace projects which vendored
checkpatch.pl and use --userspace globally to be able switch it off for
files with kernel code.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
The same as in v5.

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

