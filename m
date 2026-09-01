Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5955E39AD51
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260214; cv=none; b=B2x+SLdQptycy/NHydvi5/3wwflbwzSPhobScf/10P1+BjAV5C5qyoc4H+8GKAmi0ZU8S42QXuznQlHN29Cznd8+UriftlP5q6iRwqxrkRrF40z2RcVYv1RISCdH5Sqms0odDGi48BRfajd5BVk5eHSzUkqMgObA8JiA8qAm71U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260214; c=relaxed/simple;
	bh=Ko6vUTqGj5K3GB4rTAKDIeTwpnYNzLmH29khSvV861A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=STOuXsAVZ4FmJkcurIe5aeVXWJIahmXgXHaR6915MwQmud+TzIs/3xycAyuRUiK/Xp4yjrahUZFjBMIlkDGaFCzAfIi7My19StaFJ8jsfgp0kRzJLRgUsLGIKAIZagfZPhyxIavwns3py4bKQF6JImd1WN1tUWkg7l2X+tcUjV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=0YsgmOUc; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=AkRy82ij; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="0YsgmOUc";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="AkRy82ij"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F3DD221CB7;
	Tue,  1 Sep 2026 10:56:45 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788260206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WcAJPgihOEDmv1nHcIKnWxG+FM4RrbB/EjKcaO2mNjo=;
	b=0YsgmOUcqyAtGVpAffnoa8U4hqbaC8oh7Xdgbr7FBZK7TvcH5Mr418N76KGedYBhz6uJjj
	+DbGbXdvQ2tGEEl5M4l9RFbAq+rR+ThwhhxCAzkEAsuHb1gG/cH7U09gRJldZUbdT7A7fK
	EnGjtpRyie7ICtOVE6SuUOCU2qf/38M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788260206;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WcAJPgihOEDmv1nHcIKnWxG+FM4RrbB/EjKcaO2mNjo=;
	b=AkRy82ijjMDUuGjyLxmUldyFjngLoPJm97AkoFqOpYRMqb+nuEte0jQ5/vM8hTO6aB1Orr
	l3M3eNYvX3haS2AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C875136B2;
	Tue,  1 Sep 2026 10:56:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ALotHW2vlmrRGwAAD6G6ig
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
Subject: [PATCH v5 2/5] checkpatch: Ignore <inttypes.h> format macros for userspace tools
Date: Tue,  1 Sep 2026 12:56:39 +0200
Message-ID: <20260901105642.851234-3-pvorel@suse.cz>
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
X-Rspamd-Queue-Id: F3DD221CB7
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

Constants from <inttypes.h> are used only in userspace tools, they are
from ISO C99, let's don't report it:

    arch/mips/boot/tools/relocs.c:572: CHECK: Avoid CamelCase: <PRIx32>
    arch/s390/tools/relocs.c:52: CHECK: Avoid CamelCase: <PRIu64>
    tools/testing/selftests/mm/vm_util.c:244: CHECK: Avoid CamelCase: <SCNu64>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
The same as in v4.

 scripts/checkpatch.pl | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index b8702f6bc9b5..b458c7f22684 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5950,6 +5950,8 @@ sub process {
 #Ignore SI style variants like nS, mV and dB
 #(ie: max_uV, regulator_min_uA_show, RANGE_mA_VALUE)
 			    $var !~ /^(?:[a-z0-9_]*|[A-Z0-9_]*)?_?[a-z][A-Z](?:_[a-z0-9_]+|_[A-Z0-9_]+)?$/ &&
+#Ignore <inttypes.h> format macros (e.g. PRIu64, SCNu64)
+			    (is_userspace($realfile) ? $var !~ /^(?:PRI|SCN)[dioux][A-Z0-9]+$/ : 1) &&
 #Ignore some three character SI units explicitly, like MiB and KHz
 			    $var !~ /^(?:[a-z_]*?)_?(?:[KMGT]iB|[KMGT]?Hz)(?:_[a-z_]+)?$/) {
 				while ($var =~ m{\b($Ident)}g) {
-- 
2.55.0

