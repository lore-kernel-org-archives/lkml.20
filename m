Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88D63CFF73;
	Thu,  8 Oct 2026 19:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487571; cv=none; b=Nq+Vw3eht+wIuEujshZEm7Y7ka+V1vCEtALg7eafLyOj7QtAlx6HOg/Wj6pJgukCo4jInlQl6tQX8ABxb0518TBW/uWvYVeQtUhJX2icfBMbXU9Kiyv8ByemEQnXiu0NEtnXnZu4JCA8SJ6dQu1BV8vZYNAfuAMj0UpGTD6jzx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487571; c=relaxed/simple;
	bh=XMrH5+me5O+u5vf3W6bw9rxvsouuKz1hlLiQnRMIu2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NFb4eRFwjAOo0fzC677UhvpBLfi047b7w9UZQ7Di+cT0Cj+FaV5iJDn9d/Vr05jKITkKX8gNPsMsE6MvOWnh0apEewf4kktPOhRzWnpsgi4Qdi80Wf0LbOsjZX42Uc8qYyWBX/s3fIuAmGoDMIrBBzjnE25NJZpm3QVEqxJ3MHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8837C21C28;
	Thu,  8 Oct 2026 19:26:02 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 219AA1339F;
	Thu,  8 Oct 2026 19:26:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dQZEOknux2ozCAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 08 Oct 2026 19:26:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] ALSA: yet a few more fixes for AI bug reports
Date: Thu,  8 Oct 2026 21:25:40 +0200
Message-ID: <20261008192553.300025-1-tiwai@suse.de>
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

Hi,

here are a few more fixes I've worked quickly for issues Sashiko and
other AI reported.


Takashi

===

Takashi Iwai (11):
  ALSA: hda: intel: Cancel delayed work at shutdown, too
  ALSA: hda: Disable unsol event handling at error and shutdown paths
  ALSA: hda: Add lock around codec->registered flag manipulations
  ALSA: hda: Add NULL check for the driver pointer at unsol event work
  ALSA: caiaq: Register card at the final step
  ALSA: caiaq: Fix races at MIDI URB and trigger accesses
  ALSA: usb: us16x08: Fix racy accesses of mixer elements
  ASoC: fsl_asrc_m2m: Fix bogus compress task pointer assignments
  ALSA: line6: Reject too small max packet sizes
  ALSA: line6: Fix potential OOB write in line6_capture_copy()
  ALSA: line6: Fix handling of zero-length capture packets

 sound/hda/common/bind.c       |  2 ++
 sound/hda/common/codec.c      |  5 +++++
 sound/hda/controllers/intel.c |  7 ++++++-
 sound/hda/core/bus.c          |  2 +-
 sound/soc/fsl/fsl_asrc_m2m.c  |  2 ++
 sound/usb/caiaq/device.c      | 13 +++++++------
 sound/usb/caiaq/device.h      |  3 ++-
 sound/usb/caiaq/midi.c        |  2 ++
 sound/usb/line6/capture.c     |  3 ++-
 sound/usb/line6/pcm.c         | 10 ++++++++--
 sound/usb/line6/playback.c    |  4 ++--
 sound/usb/mixer_us16x08.c     | 16 ++++++++++++++++
 12 files changed, 55 insertions(+), 14 deletions(-)

-- 
2.55.0

