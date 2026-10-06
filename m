Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F8149CF40;
	Tue,  6 Oct 2026 17:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791308415; cv=none; b=E2JLe4HQgYmsP0uk4NDp0DH2OcwPwJp3CPw6lZPp1O11DGW4+AkepDkIhvA9E7tmcL7m6FQUFyeDYPmJlcJkUdHyMMQg9heIJMY1wvYU713ujoyeWi8CdWtB734823Lu4dr2j6COGDGV/MvgLr7va9ynsy9yVaBreS1wJO7M758=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791308415; c=relaxed/simple;
	bh=cCoIR1DCymZgmbzprgyfbC1A4jccH7d/60haSZsNd+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dEFbNocRVktDADzXjOxAJBP5Tg8+3QNp4d59HOijHNcqhxmDV1tObGg/0JUA1OhM4ow1rBq3fI8wRowz6o6Za2ZtpK/VnBaRs9EIy6wL5xiSioc4e60fsNA+KQUA/XoxOsbz/Lfz5GKyIck5ctwz72OqxdrnhBiOADDJRamxc0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W2W3yixM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2yEhzBKE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mC8FkP3r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BzzcyzgJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W2W3yixM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2yEhzBKE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mC8FkP3r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BzzcyzgJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E533A1F795;
	Tue,  6 Oct 2026 17:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791308408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sUMjfMF1Daj55EXl+W9gL9FEVYnfow/PQN2Thu1/jCY=;
	b=W2W3yixMa+xK8GlXsI1ab6PubwYkE5+LeN6I4uct3at9JeHqU/CB/0+LK7Kamt6p/bvDLs
	PLikF/l/eDswWtwMG91MCbohxzS7GK6gDILxaRG8b8HZAHj1rCycyR1A0zYZN4CQ4K4Fsp
	YaiPvNvOft+bdSB4lnwM8Kj5igT2Bh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791308408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sUMjfMF1Daj55EXl+W9gL9FEVYnfow/PQN2Thu1/jCY=;
	b=2yEhzBKECIsixD6pm3/k9Fp/XMW34PJJp86TKaItNXPXZ9yX8mWyPhdbbpupATkZnclt+d
	BqrG5Qa0AUPN4NCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791308403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sUMjfMF1Daj55EXl+W9gL9FEVYnfow/PQN2Thu1/jCY=;
	b=mC8FkP3r7/0eey7NKtAsVU20256/Sxv7TRfn+02bS9tZtXbsE4Qee/Thl0fNOVVGMeuzpI
	6+J0FvKpaaiIph8Yaz2zo9oI6ALtG4TMerbVKSlREOLOKz+CSR4Ovevd4AeUqLAOWrUfNa
	89qErqlK4sz2nz6zPrHOACd77DeDwIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791308403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sUMjfMF1Daj55EXl+W9gL9FEVYnfow/PQN2Thu1/jCY=;
	b=BzzcyzgJKcE9ucdzjtQlMEF92YT8XJc4cdSlNxyQbsObDevjfdU+lTZCAoyk9yJmi0PiNT
	VS3BXj+jOSZr4+AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B1660133CF;
	Tue,  6 Oct 2026 17:40:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qpimInMyxWr1eAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 06 Oct 2026 17:40:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] ALSA: Fix yet more bugs reported by Sashiko
Date: Tue,  6 Oct 2026 19:39:52 +0200
Message-ID: <20261006174002.703431-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.998];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Hi,

here is yet another series of bug fixes for low-handing fruis that
have been reported by Sashiko recently as the existing bugs.


Takashi

===

Takashi Iwai (5):
  ALSA: seq: Fix missing direction and ump_group handling in 32bit
    compat ioctl
  ALSA: pcmtest: Fix leak at probe error
  ALSA: aloop: Avoid a bad mixure of guard() and goto
  ALSA: core: Fix leaks at snd_card_init() error paths
  ALSA: seq: Don't lose partial read failure

 sound/core/init.c              |  14 +--
 sound/core/seq/seq_clientmgr.c |   6 +-
 sound/core/seq/seq_compat.c    |  12 ++-
 sound/drivers/aloop.c          | 154 ++++++++++++++++-----------------
 sound/drivers/pcmtest.c        |   3 +-
 5 files changed, 98 insertions(+), 91 deletions(-)

-- 
2.55.0

