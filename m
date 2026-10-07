Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840D1352016;
	Wed,  7 Oct 2026 09:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366186; cv=none; b=X9KVpmDLcyppWdo++SsRZUVpe5s1Sjg18YuEtgVHkYidWlufBQKyRIlcArqlUIv6vxmWzpxzmDoNQq98niA3bDPtXNCDfVK89KK8GkhhYvqtj90tjMraIc5psXvXLToAZzbrsVP/f3TLRmM9sq4IpSNHxAL8XKgS6/yP3isbspY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366186; c=relaxed/simple;
	bh=T73n77/1qY+cnZphw2DHxk1VRoa41BcMqLYED9j6daE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mCkbRAwnTsjCBrRvAY7LpUQizCOAAz+Kc0IMEFKgcPaWlrovRDzY+v7eC6r4FHhl2zuHwnYmWDe08QufDjuQGF8XoXqPn+QXOHFBXYuWYX3NGxk3wL8TS0kPahjJjAbrV9oLXwhtMjQK+fyvau7wTHJgRVVDMeA/pNIe4gm0iDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tiwWtJ4t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sKkJ69BK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fXsB76mE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bLgUap2M; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tiwWtJ4t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sKkJ69BK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fXsB76mE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bLgUap2M"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 758AA21F7D;
	Wed,  7 Oct 2026 09:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791366169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WDovOMITRYYwig76TW3A+GNCY1XhDeMHLeBtne6RZjg=;
	b=tiwWtJ4tqWD9juambg4nQKYiP2CA7A/N79udziC9ezcOqOOWPPB4bFxyHhxuht13pMQREg
	DBh6W+ND2PgB6ripGxML4GIfNlTvflkVInBedhZ4webhRdKPzZwoYSOlt0WKvs2H3qTU1q
	oVmYV01qEtYwXegZedabkFz+XTRVtD8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791366169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WDovOMITRYYwig76TW3A+GNCY1XhDeMHLeBtne6RZjg=;
	b=sKkJ69BKnZkklptLop97AreITeWICbyB59oiIZUvhcqJ5j/Ow1qIDEbrk967l3XDcdoyk2
	i8T4ou/uVm89g4Bw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fXsB76mE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bLgUap2M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791366165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WDovOMITRYYwig76TW3A+GNCY1XhDeMHLeBtne6RZjg=;
	b=fXsB76mEP7CP9AKuPS/23O08TuriAn00WWUKRMMso8bU/LBhGFVaQgEStoTht5a0y9FQxI
	3oJJnOMSC6f9iVya65sCSqgL7rAknqp6pUz957+n8Avdy9kA0wX9TbMADcclRyBL66B4xW
	9psgBdZo1pl4cuymKrEcWKAFVUm8fyc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791366165;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WDovOMITRYYwig76TW3A+GNCY1XhDeMHLeBtne6RZjg=;
	b=bLgUap2Mpg0HkCpkwcGWJ4SWViUsqw3akl/XN9onk38FljkmTDPM43NEcjRNTbCkCe2nRJ
	QO9vqm1prfg/IkDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 462A213B94;
	Wed,  7 Oct 2026 09:42:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AS17ChUUxmp0FQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 09:42:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] ALSA: Fix yet more bugs reported by Sashiko
Date: Wed,  7 Oct 2026 11:42:24 +0200
Message-ID: <20261007094234.1051316-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 758AA21F7D
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	RCPT_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Level: 

Hi,

here is yet another series of bug fixes for low-handing fruis that
have been reported by Sashiko recently as the existing bugs.

While reviewing the previous patchset, yet another issues were
discovered, so we fix them here, too.


Takashi

v1: https://lore.kernel.org/20261006174002.703431-1-tiwai@suse.de

v1->v2:
 - pcmtest leak fix was refactored significantly (patch 2)
 - A simplification for pcmtest device is added (patch 3)
 - A new fix for memory leak for proc handler (patch 4)
 - The fix for aloop goto was done differently (patch 5)

===

Takashi Iwai (7):
  ALSA: seq: Fix missing direction and ump_group handling in 32bit
    compat ioctl
  ALSA: pcmtest: Fix leak at probe error
  ALSA: pcmtest: Use platform_device_register_simple()
  ALSA: info: Fix memory leak at card removal
  ALSA: aloop: Avoid a bad mixure of guard() and goto
  ALSA: core: Fix leaks at snd_card_init() error paths
  ALSA: seq: Don't lose partial read failure

 sound/core/info.c              |  1 -
 sound/core/init.c              | 14 +++---
 sound/core/seq/seq_clientmgr.c |  6 +--
 sound/core/seq/seq_compat.c    | 12 +++--
 sound/drivers/aloop.c          | 11 ++++-
 sound/drivers/pcmtest.c        | 87 ++++++++--------------------------
 6 files changed, 47 insertions(+), 84 deletions(-)

-- 
2.55.0

