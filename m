Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCB649EC7B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519778; cv=none; b=ZB0DtLrECvMBvRRbkxmbTxZXWhldtBn0YvYp7G8o8mTGfWNLcypPUr4kRKfOLp2PpF/BDcnaAtnF46PdT34+1PDo5/rwy28wlBgJasLcrJ6HVOLjw9CHniE4MdyHeL7SMEMW+36CO3T1Ogl4YWnCHhsFxUAQfh4sJlvfJ1DlFYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519778; c=relaxed/simple;
	bh=xU1pSgrjel3bGhONlCCeuY4BLkIfiUuCWQjehP6sIV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Je/lCJLDt8fhoPVy7+6WlsSR3Nip8g1FPUjXFr2pNVx9NGmChKvHyISn490i2THGQDiAt77E/Iml9vFYTrWNoxSnKV0y6rLm92diC36/1JPKyaGQMv4ioXco5QsvzFNvg8B4yE2Eoi5+D1OUJozMgp1ocwpVvA4UtAJJv/9IgMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=JCq5afP7; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=rM0grxwE; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ucebswp7; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=2asPTxv0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="JCq5afP7";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="rM0grxwE";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ucebswp7";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="2asPTxv0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 95D8C2214C;
	Fri,  4 Sep 2026 11:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788519769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CYOahwcb//d0ZbnVcG0GJjgQgxlby4OiB6Q1mmFW0ok=;
	b=JCq5afP74v+gBdm9YVVK9N3A5G1ADvaydw6ivA/GGhJeWFt/6uLuls3Eozarv1tCUyx5bd
	pCdhxBGKz8M/znGLZaxlPXhLAkfkvbjlp/8KrI+LPc7QmGaQK/KM787ovqoX3rpVsqRy2e
	8uNdQxXmZ8rsqCA7jU2JQBgX0RKJMko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788519769;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CYOahwcb//d0ZbnVcG0GJjgQgxlby4OiB6Q1mmFW0ok=;
	b=rM0grxwE18sKZ5yK5dUbvuDoTQFQ29bedWUx+2Tt+i3EeZ/eXkyaJKiUA/1N7pFx//K/6E
	pLUp/rXbe33TUeBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788519765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CYOahwcb//d0ZbnVcG0GJjgQgxlby4OiB6Q1mmFW0ok=;
	b=ucebswp7jJ9fo+PqAk/+VZ6AMmFQhb9TOdwHG1iQc89lT9dgJZAqGXHoE5DwX4zK61FmHh
	qGbneeVcpnRr2nQgzJEZUsKpZ+XLa9qa3fF+QfBDB6LGz73jGeV74+gaziqCyybONOtqku
	ahDtIaJlpG71G/VN0PtOJtLOBgEeB+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788519765;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CYOahwcb//d0ZbnVcG0GJjgQgxlby4OiB6Q1mmFW0ok=;
	b=2asPTxv0icHXBVlfRKzsMfkg13+guxYad8dKY6rui0h9aTfj/3299uH2FRLWeqyUEiHbX2
	G24HvMOqGQZf4OBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7874613889;
	Fri,  4 Sep 2026 11:02:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8LckGlSlmmpScAAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Fri, 04 Sep 2026 11:02:44 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-kernel@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>
Subject: [PATCH v6 4/4] checkpatch: Skip kernel specific checks for userspace
Date: Fri,  4 Sep 2026 13:02:30 +0200
Message-ID: <20260904110230.1219037-5-pvorel@suse.cz>
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

These check are kernel specific, do not warn about it when testing
userspace code:

* BIT_MACRO
* LONG_UDELAY
* MSLEEP
* PREFER_KERNEL_TYPES
* USLEEP_RANGE

Follow-up: 99b70ece33d8 ("checkpatch: suppress strscpy warnings for userspace tools")
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
v6: Fix: use is_userspace instead of is_uapi().

 scripts/checkpatch.pl | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index ead35e6abba7..3614cfe4dcbb 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6696,7 +6696,8 @@ sub process {
 		}
 
 # prefer usleep_range over udelay
-		if ($line =~ /\budelay\s*\(\s*(\d+)\s*\)/) {
+		if (!is_userspace($realfile) &&
+			$line =~ /\budelay\s*\(\s*(\d+)\s*\)/) {
 			my $delay = $1;
 			# ignore udelay's < 10, however
 			if (! ($delay < 10) ) {
@@ -6710,7 +6711,8 @@ sub process {
 		}
 
 # warn about unexpectedly long msleep's
-		if ($line =~ /\bmsleep\s*\((\d+)\);/) {
+		if (!is_userspace($realfile) &&
+			$line =~ /\bmsleep\s*\((\d+)\);/) {
 			if ($1 < 20) {
 				WARN("MSLEEP",
 				     "msleep < 20ms can sleep for up to 20ms; see function description of msleep().\n" . $herecurr);
@@ -6932,7 +6934,7 @@ sub process {
 
 # check for c99 types like uint8_t used outside of uapi/ and tools/
 		if ($realfile !~ m@\binclude/uapi/@ &&
-		    $realfile !~ m@\btools/@ &&
+		    !is_userspace($realfile) &&
 		    $line =~ /\b($Declare)\s*$Ident\s*[=;,\[]/) {
 			my $type = $1;
 			if ($type =~ /\b($typeC99Typedefs)\b/) {
@@ -7182,6 +7184,7 @@ sub process {
 # check usleep_range arguments
 		if ($perl_version_ok &&
 		    defined $stat &&
+		    !is_userspace($realfile) &&
 		    $stat =~ /^\+(?:.*?)\busleep_range\s*\(\s*($FuncArg)\s*,\s*($FuncArg)\s*\)/) {
 			my $min = $1;
 			my $max = $7;
@@ -7425,6 +7428,7 @@ sub process {
 
 # check for #defines like: 1 << <digit> that could be BIT(digit), it is not exported to uapi
 		if ($realfile !~ m@^include/uapi/@ &&
+		    !is_userspace($realfile) &&
 		    $line =~ /#\s*define\s+\w+\s+\(?\s*1\s*([ulUL]*)\s*\<\<\s*(?:\d+|$Ident)\s*\)?/) {
 			my $ull = "";
 			$ull = "_ULL" if (defined($1) && $1 =~ /ll/i);
-- 
2.55.0

