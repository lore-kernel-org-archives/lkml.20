Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBCD2AF1D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260215; cv=none; b=uuzDTGMAhqiYAR3eskgwNBeRJhBqZRmVNeHy9jlY/x8VDtod/LcnINenu5KjCYKIBsqVmeqvnXy+p4fypq2oWLuQ4YX4zwJIFooE95TCHWS70SCKblTz3Cr6xrsylGH6772W/s6lavug+kRA+3HAboWtkyBv2nD2ffFHsjD9GZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260215; c=relaxed/simple;
	bh=B6huL/iMPS6Oxy/eyqo7uPI64Jwh1jUlHac/14kS3FE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IOKcFeWx2axlmTy6sAJd4xYUL02KqTWXAYvmb+BFdsI+RpOKbaI0eO9OYProaMnH+lpKLDfVTZjuk3/utOji4p2ey6L69i38AilwZ2azY5qRwPwty2mvSs9UTeJahz7X8u0C66eSaY8anupa4+xnrYpVShgXza5KJWzn22le9qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 44E8B21EFF;
	Tue,  1 Sep 2026 10:56:50 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 560CD136CC;
	Tue,  1 Sep 2026 10:56:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uI/vE26vlmrRGwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Tue, 01 Sep 2026 10:56:46 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-kernel@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>
Subject: [PATCH v5 5/5] checkpatch: Skip kernel specific checks for userspace
Date: Tue,  1 Sep 2026 12:56:42 +0200
Message-ID: <20260901105642.851234-6-pvorel@suse.cz>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 44E8B21EFF
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	TAGGED_RCPT(0.00)[]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00

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
New in v5.

 scripts/checkpatch.pl | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 97bf952b0fbc..0dac0ffa009b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6701,7 +6701,7 @@ sub process {
 		}
 
 # prefer usleep_range over udelay
-		if ($line =~ /\budelay\s*\(\s*(\d+)\s*\)/) {
+		if (!is_uapi($realfile) && $line =~ /\budelay\s*\(\s*(\d+)\s*\)/) {
 			my $delay = $1;
 			# ignore udelay's < 10, however
 			if (! ($delay < 10) ) {
@@ -6715,7 +6715,7 @@ sub process {
 		}
 
 # warn about unexpectedly long msleep's
-		if ($line =~ /\bmsleep\s*\((\d+)\);/) {
+		if (!is_uapi($realfile) && $line =~ /\bmsleep\s*\((\d+)\);/) {
 			if ($1 < 20) {
 				WARN("MSLEEP",
 				     "msleep < 20ms can sleep for up to 20ms; see function description of msleep().\n" . $herecurr);
@@ -6936,8 +6936,7 @@ sub process {
 		}
 
 # check for c99 types like uint8_t used outside of uapi/ and tools/
-		if (!is_uapi($realfile) &&
-		    $realfile !~ m@\btools/@ &&
+		if (!is_uapi($realfile) && !is_userspace($realfile) &&
 		    $line =~ /\b($Declare)\s*$Ident\s*[=;,\[]/) {
 			my $type = $1;
 			if ($type =~ /\b($typeC99Typedefs)\b/) {
@@ -7429,7 +7428,7 @@ sub process {
 		}
 
 # check for #defines like: 1 << <digit> that could be BIT(digit), it is not exported to uapi
-		if (!is_uapi($realfile) &&
+		if (!is_uapi($realfile) && !is_userspace($realfile) &&
 		    $line =~ /#\s*define\s+\w+\s+\(?\s*1\s*([ulUL]*)\s*\<\<\s*(?:\d+|$Ident)\s*\)?/) {
 			my $ull = "";
 			$ull = "_ULL" if (defined($1) && $1 =~ /ll/i);
-- 
2.55.0

