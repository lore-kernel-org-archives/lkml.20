Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5E33D7D69;
	Wed,  7 Oct 2026 17:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393960; cv=none; b=BPgxF1Fg74CQbbMHlrmd+0g/bGFPsfuW7W83IbfaMQEyzylgWvY0e2OBrVEtgQMs8vXaZ1QKji8f0vnhrA0wGFRFxw7e1W4XU5DsaCuv3qKtalg2Q4PIdy4KNeP2lsCjbUIinrz7kCcK/oNcQOoeVSAlNM+eDCN1TAZ6X1XY/0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393960; c=relaxed/simple;
	bh=ZHCxd6j+ubw+VHTSnpg2t/K/wK724PytOgVFD4NRXMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pV5NnQT+nCqcpMDk3qaHhu7UR769aJPfhprEcEhWDfk64eWlBf+0Pa2hgHlqK7zfwH9rMva0JG/4mJbm175nePZNonG0mQUDiebDxqqOac6Z/doS3Rra5JxaM3WqA9+oQhaMf3ilccWe4N66tHZAClMmtV9zwtgjYDYNv43kkdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Lik1XdD3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d1uctMgk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Lik1XdD3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d1uctMgk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Lik1XdD3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d1uctMgk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Lik1XdD3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d1uctMgk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DB3DB21BA8;
	Wed,  7 Oct 2026 17:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gE5pHt6oRjw55uFKpw8/W8kLDof2fBOi36GLTphDHWA=;
	b=Lik1XdD3vzvPzQXMP8pDkwBD171tEzRsH3kTlKTUS6GjipNHfyYQHf35Rpm7dWa6mZ5mRA
	2fyCq5blRqzcOXDTr5rWmKKu1BzaJTYW3k4HEe6EqF7Vp1gtZGvW4fohmJUG6x4aDX8qbq
	0dwUaeeCtqbLmkZP7YnL8Km6+qJCqt8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393956;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gE5pHt6oRjw55uFKpw8/W8kLDof2fBOi36GLTphDHWA=;
	b=d1uctMgkNmjuXpM+GIaNiXv2WX2h4mKLs3hRDJisf+ibtVSbvYhEoJGbfzmOQdQEFCubju
	aS9lUoH3JYaGOyAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gE5pHt6oRjw55uFKpw8/W8kLDof2fBOi36GLTphDHWA=;
	b=Lik1XdD3vzvPzQXMP8pDkwBD171tEzRsH3kTlKTUS6GjipNHfyYQHf35Rpm7dWa6mZ5mRA
	2fyCq5blRqzcOXDTr5rWmKKu1BzaJTYW3k4HEe6EqF7Vp1gtZGvW4fohmJUG6x4aDX8qbq
	0dwUaeeCtqbLmkZP7YnL8Km6+qJCqt8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393956;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gE5pHt6oRjw55uFKpw8/W8kLDof2fBOi36GLTphDHWA=;
	b=d1uctMgkNmjuXpM+GIaNiXv2WX2h4mKLs3hRDJisf+ibtVSbvYhEoJGbfzmOQdQEFCubju
	aS9lUoH3JYaGOyAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 850BB13354;
	Wed,  7 Oct 2026 17:25:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p6IPF6SAxmqXDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 17:25:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] ALSA: Fix yet more bugs reported by Sashiko
Date: Wed,  7 Oct 2026 19:25:18 +0200
Message-ID: <20261007172533.14667-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

Hi,

here is yet another series of bug fixes for low-handing fruis that
have been reported by Sashiko recently as the existing bugs.

While reviewing the previous patchset, yet another issues were
discovered, so we fix them here, too.


Takashi

v1: https://lore.kernel.org/20261006174002.703431-1-tiwai@suse.de
v2: https://lore.kernel.org/20261007094234.1051316-1-tiwai@suse.de

v1->v2:
 - pcmtest leak fix was refactored significantly (patch 2)
 - A simplification for pcmtest device is added (patch 3)
 - A new fix for memory leak for proc handler (patch 4)
 - The fix for aloop goto was done differently (patch 5)

v2->v3:
 - avoid copying garbage (patch 1)
 - add card->shutdown check (patch 4)

===

 sound/core/info.c              |  3 +-
 sound/core/init.c              | 14 +++---
 sound/core/seq/seq_clientmgr.c |  6 +--
 sound/core/seq/seq_compat.c    | 15 ++++--
 sound/drivers/aloop.c          | 11 ++++-
 sound/drivers/pcmtest.c        | 87 ++++++++--------------------------
 6 files changed, 51 insertions(+), 85 deletions(-)

-- 
2.55.0

