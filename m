Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483173AFCE3;
	Mon,  7 Sep 2026 19:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809711; cv=pass; b=noH4a8lxlVOmt1B3vOks3c7P9IojSkeAO3ED0GuXOzmy5PVRtcy01jCQ0yqAQEwHQebXqPSUIJ+NBdx1yWYfXDg9DOvCFzXFWaF5kowoGhQte0VGbFSDoagJXol/SXy2FScB81H+v+lzv600gbc5DCXgHn2nGsegRLP7bg81S1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809711; c=relaxed/simple;
	bh=4HaGzMcGPx9s0u9x0nvtzwRlskOgxNWLJE816w3eD7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R+DKFtZ8Au9QI8+99uohUFfSH4ZES24WenG3D5ZP3Ff54Rdh8WUxFm3ZjR1wlJZ+kCgOiGvFeVjQFWfAcnctI0CemKgOHajgpv/wYJLH2EfOll7uuMkmKvklQnwoITuEJEY/R//+gLVCFmCK/3OacHG/Ygb1uFj4lzvMrbyuwE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Exms/u0a; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Exms/u0a"
ARC-Seal: i=1; a=rsa-sha256; t=1788809697; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kKXyVwOY44jTYgVbck7qToTL+K7trcwm4Mc7YATNMh8udJ/IwmhgzLtboTejpF3OQ8NFJI9L0uTLgF1dik3zgaVjV3kdqkGryowhIQ2+jz/hVrrY81ATOUpt5ejZrGO+2rCtsJMemGdEcaX89k2rs00IJdC44NkvxdRDAZmP3xc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788809697; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DfH2LRJLFeTgvzPF/W3OIThz3rw0voZiqYQwEN7Kc1Q=; 
	b=XA6jW1KJcmgXdpWtLvo1LUQ+Agf7E2Czran5a8jZExp+YumPjuYDhXPcAnkhSNLv08ZAqmZ18SkJoHe8BN72E4iEx/Z48KEEckCk3TmW5Mmp9o72zPeRQlg6FCSEIPqxyuiWvQq4bvTJ+3ab6uJRZKYOBTWmZ0g8oXICFajC5l8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788809697;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=DfH2LRJLFeTgvzPF/W3OIThz3rw0voZiqYQwEN7Kc1Q=;
	b=Exms/u0a2uLCrJMiiCC1vFHB0/MfRUHdA8Nq0VyfIfnrjhqXlySpmekjWL6o11vx
	Al2oig1kGaEY6oEINUolANjqNhq01g50ujcjVsZiqBJBvE2nmEhGY2jzeFgYw7JDaLd
	ScgxDql7un7mWvn0fUURyoZtrdZ4EY9Ce7T2MZ75ftzH7Nxw6SEE7fVoQjIIG1OhkQe
	aERJ9xOwUivBPZJr0oYUUHF+7dZ9kkyg8NzEHsG+VQX3U3IVnlOJJOCse5IlBCUI86W
	LR6RlyYUHfzRIEDQcQXl6TvD7PTKSHfhe2JbnRUAR4aXmtv2vdGoT7B6Vl0DIwlIQKh
	Ap/usDOIIg==
Received: by mx.zohomail.com with SMTPS id 1788809693585630.894171923085;
	Mon, 7 Sep 2026 12:34:53 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Tue, 08 Sep 2026 03:34:39 +0800
Subject: [PATCH 1/2] ALSA: usb-audio: Convert
 snd_usb_apply_interface_quirk() into a switch statement
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-uac-hp-elite-x3-lap-dock-v1-1-e226cfe4038e@rong.moe>
References: <20260908-uac-hp-elite-x3-lap-dock-v1-0-e226cfe4038e@rong.moe>
In-Reply-To: <20260908-uac-hp-elite-x3-lap-dock-v1-0-e226cfe4038e@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

A switch statement is more readable than the current if blocks.

Also sort the cases in an ascending order.

As an interesting effect, this shrinks the size of quirks.o by 64 bytes
(GCC 16 -O2 x86_64):

      text       data        bss      total filename	(before)
     15266      12279          0      27545 quirks.o

      text       data        bss      total filename	(before)
     15202      12279          0      27481 quirks.o

Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/quirks.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 91938172912a..6e4808330a80 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1589,18 +1589,20 @@ int snd_usb_apply_interface_quirk(struct snd_usb_audio *chip,
 				  int iface,
 				  int altno)
 {
-	/* audiophile usb: skip altsets incompatible with device_setup */
-	if (chip->usb_id == USB_ID(0x0763, 0x2003))
-		return audiophile_skip_setting_quirk(chip, iface, altno);
+	switch (chip->usb_id) {
 	/* quattro usb: skip altsets incompatible with device_setup */
-	if (chip->usb_id == USB_ID(0x0763, 0x2001))
+	case USB_ID(0x0763, 0x2001):
 		return quattro_skip_setting_quirk(chip, iface, altno);
+	/* audiophile usb: skip altsets incompatible with device_setup */
+	case USB_ID(0x0763, 0x2003):
+		return audiophile_skip_setting_quirk(chip, iface, altno);
 	/* fasttrackpro usb: skip altsets incompatible with device_setup */
-	if (chip->usb_id == USB_ID(0x0763, 0x2012))
+	case USB_ID(0x0763, 0x2012):
 		return fasttrackpro_skip_setting_quirk(chip, iface, altno);
 	/* presonus studio 1810c: skip altsets incompatible with device_setup */
-	if (chip->usb_id == USB_ID(0x194f, 0x010c))
+	case USB_ID(0x194f, 0x010c):
 		return s1810c_skip_setting_quirk(chip, iface, altno);
+	}
 
 	return 0;
 }

-- 
2.55.0

