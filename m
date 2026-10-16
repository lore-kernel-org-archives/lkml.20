Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627AC5304D4;
	Fri, 16 Oct 2026 16:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169651; cv=none; b=epuY51YzvEoCv54uhfmE53+QH1hHO/GZSQ5E4rXIMUw1t/areUW/t8vn6MM70xZYd0YC4kmjQNOBdQ01YUX0jVrGCFlQuGmqJzbiONTC6CYlKUbvlu2x7//bzMG3yh6b1vBhKCTGhyG1jlFd71ZlRVXEVcCPyDRB6Tc+nCzI2s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169651; c=relaxed/simple;
	bh=kkFs0VVbr9mEriiGEWjJfyONEqPkYQBMumheJTOXXcc=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=YHxpuIMOhDnEv9Jv+pg9jFd1TTjNGXCrAfK/qDJmUo06kwJj45hU+RNAvwI1xvgiUmAf0rC8wx6w6gBzRek75M7V7YnduLctAT24TMeC2oB4Bk9URtL6aJHji7oGV5Kw1+CnFEcVGH83wPIobtvDpb60tcPjJJpdM2h/F+si/t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hMRAVzeM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gGdorgk/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hMRAVzeM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gGdorgk/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hMRAVzeM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gGdorgk/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hMRAVzeM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gGdorgk/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4447E21C70;
	Fri, 16 Oct 2026 16:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792169647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=IYE4ZbVFSzp3eowApnNd8w/suhWnGdjNnQbB0iMW2A0=;
	b=hMRAVzeMZEqZOjER2A6bTtO15B3YxkMmq2iZlooLWM/mmHIoqaJmyE72pF2x5+2DmleKhi
	9+591Bu3q9ofjgDfdw5NSQWFgEPhm1Rl6KQrc63ur63g812+dFKQ5UXYBIWXLoqpA/ZiNb
	aC60YEkxxuYPOvQd8Zo7B4Qob1T/Uug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792169647;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=IYE4ZbVFSzp3eowApnNd8w/suhWnGdjNnQbB0iMW2A0=;
	b=gGdorgk/uIJjuXFzEHm/SoGWsvRwvNTz2C1K8Mg15c6dpepHwLG4VdkAXw/JfsGLvYs6eM
	BuFj9fgAR3K+3qCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hMRAVzeM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="gGdorgk/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792169647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=IYE4ZbVFSzp3eowApnNd8w/suhWnGdjNnQbB0iMW2A0=;
	b=hMRAVzeMZEqZOjER2A6bTtO15B3YxkMmq2iZlooLWM/mmHIoqaJmyE72pF2x5+2DmleKhi
	9+591Bu3q9ofjgDfdw5NSQWFgEPhm1Rl6KQrc63ur63g812+dFKQ5UXYBIWXLoqpA/ZiNb
	aC60YEkxxuYPOvQd8Zo7B4Qob1T/Uug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792169647;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=IYE4ZbVFSzp3eowApnNd8w/suhWnGdjNnQbB0iMW2A0=;
	b=gGdorgk/uIJjuXFzEHm/SoGWsvRwvNTz2C1K8Mg15c6dpepHwLG4VdkAXw/JfsGLvYs6eM
	BuFj9fgAR3K+3qCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF9FB139B7;
	Fri, 16 Oct 2026 16:54:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TlUIMa5W0mpSQwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Oct 2026 16:54:06 +0000
Date: Fri, 16 Oct 2026 18:54:06 +0200
Message-ID: <87y0bx1t8x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.3-final
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Level: 
X-Rspamd-Queue-Id: 4447E21C70
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Linus,

please pull sound fixes for v7.3 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.3

The topmost commit is 8e8cd9a4c6dc006e9bd51b8ad0079fb4576b48d3

----------------------------------------------------------------

sound fixes for 7.3

Here are the (hopefully) last bits for 7.3.
At this time, all changes are small and device-specific ASoC fixes.
Not super-urgent, but should be fairly safe to take.

----------------------------------------------------------------

Avi Weiss (1):
      ASoC: stm32: spdifrx: fix synchronization state check

HyeongJun An (6):
      ASoC: cs42l56: Put the Limiter Cushion control on the limiter register
      ASoC: cs42l52: Fix the NG Type Switch bit
      ASoC: pcm3168a: Fix the DAC zero flag polarity bit
      ASoC: max98371: Fix the Speaker DHT Min Volume bits
      ASoC: wm8978: Fix the 128x oversampling switch bits
      ASoC: nau8822: Fix the 128x oversampling switch bits

Mario Limonciello (1):
      ASoC: amd: yc: disable MSI on resume

Peter Ujfalusi (2):
      ASoC: SOF: ipc4-topology: Fix shift-out-of-bounds for aggregated ALH capture
      ASoC: SOF: sof-client: Use event-handler mutex consistently

Sergey Tiraspolsky (1):
      ASoC: Intel: avs: Reset the stream unless it is already prepared

---
 sound/soc/amd/yc/pci-acp6x.c  | 38 ++++++++++++++++++++++++++++++++++++--
 sound/soc/codecs/cs42l52.c    |  2 +-
 sound/soc/codecs/cs42l56.c    |  2 +-
 sound/soc/codecs/max98371.c   |  2 +-
 sound/soc/codecs/nau8822.c    |  4 ++--
 sound/soc/codecs/pcm3168a.c   |  2 +-
 sound/soc/codecs/wm8978.c     |  4 ++--
 sound/soc/intel/avs/pcm.c     |  2 +-
 sound/soc/sof/ipc4-topology.c |  9 ++++++---
 sound/soc/sof/sof-client.c    |  6 +++---
 sound/soc/stm/stm32_spdifrx.c |  2 +-
 11 files changed, 55 insertions(+), 18 deletions(-)

