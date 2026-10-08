Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106BD286A5;
	Thu,  8 Oct 2026 19:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487570; cv=none; b=dV1XvggYuojctxXAswlrkbY2tzgTegaMJa9qpRC14kKNxSl6kL9kGBeF7wayXDuvrGOBmIgBwM5FbqVbAf47c4wSpmpkhCOPR/wUf01NLPz6nfaY90ImPBQ1w0TdoVvYC9Lxl9MUj6WdlyAMoeGRz142t8A+0tIE2+9itYRcE6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487570; c=relaxed/simple;
	bh=walD0Wlpi71wtIJeWIqV3mu/tJcpjuECNt61XgLPdts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OBR5UREJ1AHnETU4EOaJ7iRSoA5iYEDTRf0AG/78p+kKcbih+bUG9fnRR8d3xRapgDDbUX5X9/NTob/Ehb6SXU6O3MOPgehkJ6KZ/+mOJTdmXSS+rLJBpF4itNi2ONccG2kerD0KRyfKy9sVb9fuAuV4v+TEXytDl1oJArbDuxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2AA3221C3F;
	Thu,  8 Oct 2026 19:26:03 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E871B1339F;
	Thu,  8 Oct 2026 19:26:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dQZEOknux2ozCAAAD6G6ig:T6
	(envelope-from <tiwai@suse.de>); Thu, 08 Oct 2026 19:26:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] ALSA: caiaq: Register card at the final step
Date: Thu,  8 Oct 2026 21:25:45 +0200
Message-ID: <20261008192553.300025-6-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008192553.300025-1-tiwai@suse.de>
References: <20261008192553.300025-1-tiwai@suse.de>
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
X-Spam-Level: 
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spamd-Result: default: False [0.00 / 50.00]
X-Spam-Score: 0.00

caiaq driver calls snd_card_register() before creating the mixer
elements, which is rather confusing to user-space, as the devices have
been published before adding the control elements.

Swap the call order to make the card registration as the final step
(as written in the comment).

Fixes: 8e3cd08ed8e5 ("[ALSA] caiaq - add control API and more input features")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/caiaq/device.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index a596f5f763b8..c68ed16d7ac4 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -395,6 +395,12 @@ static int setup_card(struct snd_usb_caiaqdev *cdev)
 		return ret;
 	}
 
+	ret = snd_usb_caiaq_control_init(cdev);
+	if (ret < 0) {
+		dev_err(dev, "Unable to set up control system (ret=%d)\n", ret);
+		return ret;
+	}
+
 	/* finally, register the card and all its sub-instances */
 	ret = snd_card_register(cdev->chip.card);
 	if (ret < 0) {
@@ -402,12 +408,6 @@ static int setup_card(struct snd_usb_caiaqdev *cdev)
 		return ret;
 	}
 
-	ret = snd_usb_caiaq_control_init(cdev);
-	if (ret < 0) {
-		dev_err(dev, "Unable to set up control system (ret=%d)\n", ret);
-		return ret;
-	}
-
 	return 0;
 }
 
-- 
2.55.0

