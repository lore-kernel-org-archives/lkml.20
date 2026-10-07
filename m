Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E1437BE6F;
	Wed,  7 Oct 2026 21:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791410220; cv=none; b=WdYJPDIzZ0eSceyhxKXg6yGGmKYa3x8O0vrz+k1iW0mPAvuFRrki36L8bhn2rxOAOM/A/q67YhE/ZSEcol34NZwdPwLfLxh1HVbznAfYW/16/BRnJyvpY4NddfeQ5CDkhbb3HHmZQCs/ZqAvxO66kaeK4s6a/XD2PwkA9R+Hk0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791410220; c=relaxed/simple;
	bh=LtwZmyOwLRzb9ajYolWPGePVsmL7eAb+HVcRCNS4xJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dujRNUXzZvOlKgG/YYsm39oaAhGpNqJj79trlXnGwI7aZuK/Iy9BnZIfPHQmmpZp7Yp6S4TdPFhrpqV+7sbDpqmVRdoYCBDzQERk64JLR8+jiBr8yJOA64qFoy6Iv/SolI3tyv2W1ln4pQOgyazMdR2Xqbv+f6NwHQokCcqgjTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=15zzm4rP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xfATCDJ/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=15zzm4rP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xfATCDJ/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="15zzm4rP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xfATCDJ/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="15zzm4rP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xfATCDJ/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E10AF1F76C;
	Wed,  7 Oct 2026 21:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791410216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=T0aYh3dD761FJm47m6/coQXbzBpTxiB0fqutj5AgB00=;
	b=15zzm4rPyV+Jox7jiTkpTCioNqRuD05FP3ieGBkcT/KxRC2aqTIePH1tHJ9k1e8xaPz0U0
	BRRnynbir7vKW42WQ6tqzrK5k/zw9P1yNuAVc7vKs74pYsojdKUdjBMwO+/EkJALpjuVJO
	TJiNim7iVEfp/Ea18sYclTYwwLA3ARA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791410216;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=T0aYh3dD761FJm47m6/coQXbzBpTxiB0fqutj5AgB00=;
	b=xfATCDJ/8BEEuQL+XlSVOUAVsipJPttjTQHbjM6ABWRMgB8AXUMjr4M3BaSi+7wnUlxEMK
	uEjE1qNmAeTiXPCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791410216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=T0aYh3dD761FJm47m6/coQXbzBpTxiB0fqutj5AgB00=;
	b=15zzm4rPyV+Jox7jiTkpTCioNqRuD05FP3ieGBkcT/KxRC2aqTIePH1tHJ9k1e8xaPz0U0
	BRRnynbir7vKW42WQ6tqzrK5k/zw9P1yNuAVc7vKs74pYsojdKUdjBMwO+/EkJALpjuVJO
	TJiNim7iVEfp/Ea18sYclTYwwLA3ARA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791410216;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=T0aYh3dD761FJm47m6/coQXbzBpTxiB0fqutj5AgB00=;
	b=xfATCDJ/8BEEuQL+XlSVOUAVsipJPttjTQHbjM6ABWRMgB8AXUMjr4M3BaSi+7wnUlxEMK
	uEjE1qNmAeTiXPCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A36EF13312;
	Wed,  7 Oct 2026 21:56:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DGVtGSjAxmr0JwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 21:56:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ALSA/ASoC: hda: Fix race between unsol events and unbind
Date: Wed,  7 Oct 2026 23:56:45 +0200
Message-ID: <20261007215650.159871-1-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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

Here is another series of small fixes for HD-audio, beginning with the
fix for an issue reported by Sashiko, and extended the fixes to ASoC
HD-audio and a potential improvement that were spotted during the
development of the first patch.


Takashi

===

Takashi Iwai (3):
  ALSA: hda: Stop unsol events and jack polling before codec unbind
  ASoC: codecs: hda: Stop unsol events and jack polling before codec
    removal
  ALSA: hda: Make hdac_device.registered a plain bool

 include/sound/hdaudio.h  |  4 +++-
 sound/hda/common/bind.c  |  7 +++++++
 sound/hda/common/codec.c |  4 ++--
 sound/hda/core/bus.c     | 21 ++++++++++++++++++++-
 sound/soc/codecs/hda.c   |  7 +++++++
 5 files changed, 39 insertions(+), 4 deletions(-)

-- 
2.55.0

