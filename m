Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C018949DB88
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519774; cv=none; b=pf/6JOAAHYStQVSg4CyKfUGYKE/G57R0NvLmja7Nbq8IaPEVU69hBxC/pFMXhMwSf3R3wj9BS2gwgUft9/lmVfnPynVH9Tz4cP9anz3vSAxb307+Dwps1fz1cIgM9shKTrUXXo7r0wuM9vXXrB4d/NIcjv4H9AjdKuYnEzu3814=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519774; c=relaxed/simple;
	bh=FS55ixrEEjfduWHpnk/W25Vb8NcIdS+zV3hWE4Gn+Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dnGaSaFSG2yy4q+9QBzJUJbzAETA/WJi7yxfMppVNEpgkhETmtitBRCpuF5EVgqnnJBqii/qinWplHgxoOVyUg3Ezu6DSdJK78IEWEREKcMTRaHRwI/nMiQlVT3WtEI0TjeSlUD6YRtXKThYfnWWfkI8tY/rKBNMO/r5my9WE5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=mLlqWeBa; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=JOZGg6FT; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=dKkrpgUO; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9gWFq/to; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="mLlqWeBa";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="JOZGg6FT";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="dKkrpgUO";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9gWFq/to"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AB72A1FB75;
	Fri,  4 Sep 2026 11:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788519766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dIRpiOkxLxx/ItdNkalv9UfmAcQK8jG585j3bZDLJ2I=;
	b=mLlqWeBatXPYNOn24xxRNI5/279yM6JrRcclHCoJmKWkLmtl+2zTZ3DZx3xRgJrzjJcwi3
	3hln6J8YZQydeUsgEHRA0GHcpRrHRqnSfAsXcDUY8zY2CTYKSliumwdD/gtieaynW/30DN
	Q6yFatYsV7rfSac0hAayaBc4YPbCUf0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788519766;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dIRpiOkxLxx/ItdNkalv9UfmAcQK8jG585j3bZDLJ2I=;
	b=JOZGg6FTSTj0xS0+shSD/2uWy8sTaNlhxf6vNtjLjbEMwc4MDThyQy1/JuIK2sInZPIMpz
	uVJP2Gn6Pnd0sHAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788519762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dIRpiOkxLxx/ItdNkalv9UfmAcQK8jG585j3bZDLJ2I=;
	b=dKkrpgUOSDsIp+QLwBvcAYBprSCYrzH1yNoYHRelC/SuAe1r7/RHtJpKqmf49xfWtfSeiy
	DxV5d2Ht+TrfrDEdTHNZV5Vo6c7tktpykN8X9DA+E+SXJ7ZbH8qfZtdigOlyN65lLHl+t5
	HG/5XABiKgoVujeBJ7IvgRLU7xQexFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788519762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dIRpiOkxLxx/ItdNkalv9UfmAcQK8jG585j3bZDLJ2I=;
	b=9gWFq/tokrEstKFHcF+aw/wLolKhviTjV3vlZdXyywQttp9tefdaHbJUrvEvDNV+ZIUPL1
	4XMWDlzF9kAeXvCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 58F4B13738;
	Fri,  4 Sep 2026 11:02:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OO/JDlGlmmpScAAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Fri, 04 Sep 2026 11:02:41 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-kernel@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>
Subject: [PATCH v6 2/4] checkpatch: Ignore <inttypes.h> format macros for userspace tools
Date: Fri,  4 Sep 2026 13:02:28 +0200
Message-ID: <20260904110230.1219037-3-pvorel@suse.cz>
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

Constants from <inttypes.h> are used only in userspace tools, they are
from ISO C99, let's don't report it:

    arch/mips/boot/tools/relocs.c:572: CHECK: Avoid CamelCase: <PRIx32>
    arch/s390/tools/relocs.c:52: CHECK: Avoid CamelCase: <PRIu64>
    tools/testing/selftests/mm/vm_util.c:244: CHECK: Avoid CamelCase: <SCNu64>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
The same as in v5 and earlier versions.

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

