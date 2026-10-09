Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D0A4E021A;
	Fri,  9 Oct 2026 13:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552826; cv=none; b=lb6UtvdxitZC8uhU9Hn4ujBE7D3Mx5DKcJl4RlHOux3rB6C4R6bDGKiIEHPpH+YeGovqEsCGxS890HQMopTVus5Ny+5vaEKHsR+6l6fFS9FVgiyExust6nJzDzmh4A8RBPzIFfi/HmsZ+NJl7r2JunXqfPDMTPZtR/w0VAgzmDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552826; c=relaxed/simple;
	bh=iMqj2+NulGdqyj4T2wH3GkfEil1uM6qlicxO38ciCek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tQoYvgV1HAwVt5a1IJ8kGvRguRPgmwkDzgeLgc/+dAuc8KRhQLtOLUGnv2r7hlVfPYR25qeDhSv5d8KSaYwpJeRcGf/tmCEaSILALwphTHXP5/D/ETesKFnwZMRZ1DIPWtakMUR1exthN5y9SXInEHtmjaCjE7b1HAqn9pxpVLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0D5171F7CB;
	Fri,  9 Oct 2026 13:33:43 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B2DBB1326D;
	Fri,  9 Oct 2026 13:33:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oxVDIjbtyGr4ZgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 09 Oct 2026 13:33:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] ALSA: yet a few more fixes for AI bug reports
Date: Fri,  9 Oct 2026 15:33:34 +0200
Message-ID: <20261009133341.440917-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spam-Flag: NO
X-Spam-Score: 0.00
X-Spam-Level: 
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spamd-Result: default: False [0.00 / 50.00]

some patches in the previous series had obvious issues, and some
needed more considerations, so here are those refreshed ones.
One more fix is added (patch 4) for addressing the potential issues in
the (other) previous series, too.


Takashi

v1: https://lore.kernel.org/20261008192553.300025-1-tiwai@suse.de

===

Takashi Iwai (5):
  ALSA: line6: Fix handling of zero-length capture packets
  ALSA: hda: Disable unsol event handling at error and shutdown paths
  ALSA: hda: Add lock around codec->registered flag manipulations
  ALSA: hda: Stop unsol event and jack polling at hda-ext device
    removal, too
  ALSA: hda: Add NULL check for the driver pointer at unsol event work

 sound/hda/common/bind.c    | 22 +++++++++++++---------
 sound/hda/common/codec.c   |  9 +++++++++
 sound/hda/core/bus.c       |  9 ++++++---
 sound/usb/line6/pcm.c      |  4 +++-
 sound/usb/line6/playback.c | 10 ++--------
 5 files changed, 33 insertions(+), 21 deletions(-)

-- 
2.55.0

