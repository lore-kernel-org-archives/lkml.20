Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0AF47B439
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260214; cv=none; b=GbzG/9dTMHyuhIUf5CJQ9jUf3MKiqhzKNOjXQRrutGT8H/dlaog17b0uRCiaf5k88KeNzpPQJiUct1GpYWfeK87f54bf3ZtuIjKIxLTAyCElSzMW2m0U5K2sxJ17UgeqedbAbuyXwOWwcM5pZHrDi/R3LGx1zqhfn1u5ob2PqKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260214; c=relaxed/simple;
	bh=f3wAQpmY2yF/PVGt7SV44lLnL3WpuJjNaHlOr7AfVlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G+APb9Q+nlvzsOS83WDB/sx8gCVXhGIhnCS+h/oIlmf8OeuhvAjzYwDONASCoyKhaHvbZSoa0AL/ufH+STJwJygJi2+wSsPZv4AwENGnMRFE3YrYEnrkZohKQeoIueBncI5vw4XZHNFw67wqEsQcMmWnrwYZdsn0Waq0YeHQzbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=A6izO27D; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=kuc+Hz9q; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="A6izO27D";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="kuc+Hz9q"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8A67621CB8;
	Tue,  1 Sep 2026 10:56:46 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788260206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bTGPq561EINv0mMTaBbg0oLGrrPZ46VSW6hycYBsFUU=;
	b=A6izO27DNJGsO68WvAOO7MmylZq5XtQiKw3UHAMdjRQ9upS7o3/tlYniJ9PCsMR0gATUQs
	EvTDGIALpDHG5KKn7+2257x1FNTRL9EdLBftw3IIgdTSQk+ULWbOu4wkA+Px3AFgvJQ6qY
	JO+58vm1mw89SLqzrvLWck+dfVYAeiE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788260206;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bTGPq561EINv0mMTaBbg0oLGrrPZ46VSW6hycYBsFUU=;
	b=kuc+Hz9qKOAOCnw5lvIMirKNmBZSPfsCCdp5bMEaf61QCeeWe0PtJ1dZ2yeehri7cNJp7d
	9Ndkte3ihPt9IICA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 12129136CB;
	Tue,  1 Sep 2026 10:56:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KIswA26vlmrRGwAAD6G6ig
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
Subject: [PATCH v5 4/5] checkpatch: Factor out the check for UAPI files
Date: Tue,  1 Sep 2026 12:56:41 +0200
Message-ID: <20260901105642.851234-5-pvorel@suse.cz>
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 8A67621CB8
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	TAGGED_RCPT(0.00)[]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00

DRY.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v5.

 scripts/checkpatch.pl | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index ead35e6abba7..97bf952b0fbc 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2678,6 +2678,11 @@ sub is_userspace {
 		$realfile =~ m@^arch/.*/tools/@);
 }
 
+sub is_uapi {
+    my ($realfile) = @_;
+    return $realfile =~ m@^include/uapi/@;
+}
+
 sub process {
 	my $filename = shift;
 
@@ -4673,7 +4678,7 @@ sub process {
 				ERROR("MALFORMED_INCLUDE",
 				      "malformed #include filename\n" . $herecurr);
 			}
-			if ($path =~ "^uapi/" && $realfile =~ m@\binclude/uapi/@) {
+			if ($path =~ "^uapi/" && is_uapi($realfile)) {
 				ERROR("UAPI_INCLUDE",
 				      "No #include in ...include/uapi/... should use a uapi/ path prefix\n" . $herecurr);
 			}
@@ -6683,7 +6688,7 @@ sub process {
 		}
 
 # don't use __constant_<foo> functions outside of include/uapi/
-		if ($realfile !~ m@^include/uapi/@ &&
+		if (!is_uapi($realfile) &&
 		    $line =~ /(__constant_(?:htons|ntohs|[bl]e(?:16|32|64)_to_cpu|cpu_to_[bl]e(?:16|32|64)))\s*\(/) {
 			my $constant_func = $1;
 			my $func = $constant_func;
@@ -6846,7 +6851,7 @@ sub process {
 		}
 
 # Check for __inline__ and __inline, prefer inline
-		if ($realfile !~ m@\binclude/uapi/@ &&
+		if (!is_uapi($realfile) &&
 		    $line =~ /\b(__inline__|__inline)\b/) {
 			if (WARN("INLINE",
 				 "plain inline is preferred over $1\n" . $herecurr) &&
@@ -6857,7 +6862,7 @@ sub process {
 		}
 
 # Check for compiler attributes
-		if ($realfile !~ m@\binclude/uapi/@ &&
+		if (!is_uapi($realfile) &&
 		    $rawline =~ /\b__attribute__\s*\(\s*($balanced_parens)\s*\)/) {
 			my $attr = $1;
 			$attr =~ s/\s*\(\s*(.*)\)\s*/$1/;
@@ -6931,7 +6936,7 @@ sub process {
 		}
 
 # check for c99 types like uint8_t used outside of uapi/ and tools/
-		if ($realfile !~ m@\binclude/uapi/@ &&
+		if (!is_uapi($realfile) &&
 		    $realfile !~ m@\btools/@ &&
 		    $line =~ /\b($Declare)\s*$Ident\s*[=;,\[]/) {
 			my $type = $1;
@@ -7424,7 +7429,7 @@ sub process {
 		}
 
 # check for #defines like: 1 << <digit> that could be BIT(digit), it is not exported to uapi
-		if ($realfile !~ m@^include/uapi/@ &&
+		if (!is_uapi($realfile) &&
 		    $line =~ /#\s*define\s+\w+\s+\(?\s*1\s*([ulUL]*)\s*\<\<\s*(?:\d+|$Ident)\s*\)?/) {
 			my $ull = "";
 			$ull = "_ULL" if (defined($1) && $1 =~ /ll/i);
-- 
2.55.0

