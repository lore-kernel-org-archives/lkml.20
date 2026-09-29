Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784064FDA71;
	Tue, 29 Sep 2026 12:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686450; cv=none; b=DFGJrpRqX8mbK1RPP33QbuYjuKeGX9Vx+n6xK/YpoRM4AKynW0R7Hf5mnRBUBkfC0UfjTLC8UAPz80MnqhmwwMF2G30H3RaZZEbbNUT3znSS7//rm9x0YYqLaX6KlBQwwyyPciRu7+t5Psbl0bp7FeuXkrxPRcZnEIQRLcRNjbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686450; c=relaxed/simple;
	bh=/hrmWJFTNCOmPry03gkUncNJ7U1ZlMRx4ubKWBK542M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HCSyRuwPrytQGX5I+y5lXJ0l+4W++Fm0+tph26sXZSibiiB/sjgNBY5xozxS6+27v6D+8wM8FtSoBNAI21P8rnCY6I0P6ZdXK9MDvAgzXON/63QZBu180IkDEnzAQsvlNRo15512PysxI9xpkSF/PXg8C81tfJODPdSGkZ335U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fto21vxn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rbjInJYT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2B8BpUx/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kOiz7YW6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fto21vxn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rbjInJYT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2B8BpUx/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kOiz7YW6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B2E0C21C67;
	Tue, 29 Sep 2026 12:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790686441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mJjC/7LvZvKd4Yq9MKCzMTteLx8ni8abzQa++KDOqf4=;
	b=fto21vxnygp0q+gtSfkDP4TPxYfX9ttiumGySIgeFrVNurMe0/39//ijyVtbms2ksKJucq
	04GadI+6k8UUvO77/7VmakCTpQ5kAON0NPMPFTWsbt4U/HsdYpIoRy0RRDvP/Ops5cAm8x
	eKqW/y3JS7Ke0qS5C9IWClhILLgWB30=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790686441;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mJjC/7LvZvKd4Yq9MKCzMTteLx8ni8abzQa++KDOqf4=;
	b=rbjInJYT4jSI2RIfbT9ZjtS4WYLGwplgPGS02obdJAN1RPUYU1rmBWXdYJdKzlji33kjax
	njyXOm8Yfgi8K+Cw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="2B8BpUx/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kOiz7YW6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790686437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mJjC/7LvZvKd4Yq9MKCzMTteLx8ni8abzQa++KDOqf4=;
	b=2B8BpUx/g8+MCTNFCklfgM5CiJ0EGNw9gCgh/Mx5r6gkUL74Si8tzBAlJVgudQXdAgIzie
	ycoRISOzIw/5BRVL/RQbXZHskxZ7YG/nXzxGqfqYRT1DXNTeVGhD+IsJlLdjWkeLgEwwsS
	2GegmvE1LgOK/3Ee6StfLcR3Q/feTnI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790686437;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mJjC/7LvZvKd4Yq9MKCzMTteLx8ni8abzQa++KDOqf4=;
	b=kOiz7YW6S4qA7TlOa/1tRNaMDA41LWxW56CLwe+nqbB4SBlOFAmdiYL62Rhsdn4K5bWJ/g
	BRyv0t85BsnH9eDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 78843136D1;
	Tue, 29 Sep 2026 12:53:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jFGEFOW0u2q3dAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 12:53:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Farhad Alemi <farhad.alemi@berkeley.edu>
Subject: [PATCH 0/2] ALSA: core: some power-state hardening
Date: Tue, 29 Sep 2026 14:53:40 +0200
Message-ID: <20260929125346.1478631-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B2E0C21C67
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Hi,

there was a report about a UAF with the inconsistent power-state
handling.  This is a couple of small patches to address such corner
cases.


Takashi

===

Takashi Iwai (2):
  ALSA: core: Check shutdown flag at D0 power-state, too
  ALSA: control: Fix UAF in snd_ctl_elem_add() on card disconnect

 sound/core/control.c |  2 ++
 sound/core/init.c    | 12 ++++++------
 2 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.55.0

