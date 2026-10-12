Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6494649890B;
	Mon, 12 Oct 2026 15:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817803; cv=none; b=S01mZp/Hsur9hd0M/QRrqlnMiAbWfVJycLFPaCgK1nmgua4noAwNqslMt5xXX5lt26VBfCR8KtQbFawT3q1p2r7wnuwnuuqTQFKf+KcUQ5G2sxeEnG9GLZIcxaaagFs+hTxVa8970p5D7kJ1JQvRZD8b4We5LjZcnVS1eRMwVRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817803; c=relaxed/simple;
	bh=p12fJ4D7vleKugZNdeHezgmFKRaB1/Cba+cu9+kKC8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L/1n3OiXSy90mANo/98q5SUktuWq3lJx6bRbXRXspp2wfFSfzilPVDzdXlTKU8Hs/jEUVwkA0XaC1IfBOMnOBoVuNfhK92kQsqE145UyGwu/pDYJ1BnPc43AW91fneyAP6hAs1zRiY7RdbNJEFkSR7+lc4qcTNRgIi1qXOGbqVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=fLgWDn7k; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="fLgWDn7k"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CD776807D4;
	Mon, 12 Oct 2026 17:10:00 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CjEVToXNPnbl; Mon, 12 Oct 2026 17:10:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1791817799; bh=p12fJ4D7vleKugZNdeHezgmFKRaB1/Cba+cu9+kKC8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fLgWDn7knUc/ILOQMYscRVJS91SFO+M7NS0miVRwiyASNhW/kY1cENyH+HLbKGA6X
	 6BXKWZw3kCCoKteLCiOfZSwVX8WYa3L+8LKa6BaDqpLdvHBK0GQ4UGoaKiddZXhN+B
	 vdqhdp7SNf6cFCiVGIdop9hMrOPgOyooXIVEHh0IogoCLxpkI9/ASf5iaNGB/NNyhj
	 fWT9w9vekJyNbEHhb7yZED6Sd3M8hZpOhADW36TS8zzg4Kpa/UBCFfEe+nmUugJcsp
	 ayOia0GyhApqVT5Odb25Due20ymL9lbvAS7ArdIIwkzztOw1R/8/keSA/NlQ3DzyjU
	 zi1o+kKloTiEg==
From: =?UTF-8?q?Ali=20Ahmet=20Memi=C5=9F?= <aliamemis@disroot.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+40b06a86af225236fdb4@syzkaller.appspotmail.com
Subject: Re: [PATCH] ALSA: hda: intel: Don't free card in the probe work
Date: Mon, 12 Oct 2026 18:09:41 +0300
Message-ID: <20261012150949.1840175-1-aliamemis@disroot.org>
In-Reply-To: <87fqybge5a.wl-tiwai@suse.de>
References: <20261011200648.1662935-1-aliamemis@disroot.org> <875wz7idx3.wl-tiwai@suse.de> <20261012143508.1830791-1-aliamemis@disroot.org> <87fqybge5a.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 12 Oct 2026 16:57:37 +0200, Takashi Iwai wrote:
> OK, that's a problem, indeed.  How about replacing snd_card_free()
> with *_when_closed() version that doesn't block in addition?

The work doesn't hang anymore but removing the device while the probe
work is running hits the same UAF on the first try.  azx_remove() still
gets the card before cancel_delayed_work_sync() and the put_device() in
the work frees it:

BUG: KASAN: slab-use-after-free in snd_card_free+0x148/0x160
Read of size 1 at addr ffff888007724852 by task sh/97
Call Trace:
 snd_card_free+0x148/0x160
 pci_device_remove+0xb6/0x1d0
 device_release_driver_internal+0x38d/0x540
 pci_stop_bus_device+0x122/0x170
 ...
Freed by task 30:
 kfree+0x1e8/0x5e0
 device_release+0xcf/0x3c0
 kobject_put+0x169/0x320
 azx_probe_work+0x495/0x1fa0
 process_one_work+0x937/0x1800

> Staying the card means that the card slot will be kept, then if you
> probe another card afterwards, it'll end up with assignment on another
> card slot.

What about calling snd_card_disconnect() in the work on failure?  It
releases the slot right away and the card is still freed only in
azx_remove():

	if (azx_probe_continue(&hda->chip, false) < 0) {
		hda->init_failed = 1;
		complete_all(&hda->probe_wait);
		snd_card_disconnect(hda->chip.card);
	}

With that, snd-dummy loaded after a failed probe gets card 0 and 20
rounds of the remove race were clean with KASAN.  I can send v2 if this
looks fine.
