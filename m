Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06A5392C4B;
	Mon, 12 Oct 2026 14:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815722; cv=none; b=XmAEBbBXuTTZ8CbcOVM7djUGdbDQ+J8E9ihiC9qgloD2mHl1Hf8CyueWDXnWaZ1qfAIWwHouE67hh212RT19I97Ox7PNWn40DcMMJet8ohyH1zuA1dWQhEc7aqJP/ODwSdHxQnWtsjQsOZsgjghktGn9iL1khzziOmX87eFBvLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815722; c=relaxed/simple;
	bh=NWrzgraRWu78nQaGz8kXexiJAg0Y4CmbzFwQ/Tmu2iY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hkDGQ7qH1R/+lVRgd5o62DIxdfMxHCSfSFFR+hUnr9MhbqxP3lK3Yg/rayO0owbc/DtfI+zF60g2Qtm8HvjpmOe+947tVpD2tkPiNPVDal2FxtNxepD/VeoNQJhliNnwxBFSEgJLy1crVlrVrsxPZid/X9XCpv1rE3jna3lFb30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=WgehxrWO; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="WgehxrWO"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 26AAB80C78;
	Mon, 12 Oct 2026 16:35:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N8nqTXKk5jMd; Mon, 12 Oct 2026 16:35:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1791815718; bh=NWrzgraRWu78nQaGz8kXexiJAg0Y4CmbzFwQ/Tmu2iY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WgehxrWOhkK1/NgnfH91u2sT1CTQmfYkmqzSgrFtloKI7842Y8Hhu1K7ZSRzU67hF
	 AQFhTV4xa/EE3ljrAo031E6uKGPeRNGv/ljxef4mNDJ0Uaey0X9jqpkcD1GQ4drXQI
	 ngKIG5pBZq9pygGyyat06vwed54L+QGPrt4fxWSVLWPm1AjjRRN07PgAsaSUekf0Sx
	 l5b8lBYWtshMrObPkkvzMSmgbYcbp6dDYapFI5AqIlgshwC7K8vY7xVL+HcT/NY4bG
	 GmvEgYh+vHiZujvfa9bbGy1Rb8EuBAp+2QSeC28rdPxrxuyXheMmfw/8z+ioePObOy
	 h78X9FH60ItCA==
From: =?UTF-8?q?Ali=20Ahmet=20Memi=C5=9F?= <aliamemis@disroot.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+40b06a86af225236fdb4@syzkaller.appspotmail.com
Subject: Re: [PATCH] ALSA: hda: intel: Don't free card in the probe work
Date: Mon, 12 Oct 2026 17:35:05 +0300
Message-ID: <20261012143508.1830791-1-aliamemis@disroot.org>
In-Reply-To: <875wz7idx3.wl-tiwai@suse.de>
References: <20261011200648.1662935-1-aliamemis@disroot.org> <875wz7idx3.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 12 Oct 2026 09:19:36 +0200, Takashi Iwai wrote:
> For avoiding the card free, can it be the refcounting like below
> instead?

I tried it in QEMU and it hangs on every failed delayed probe even
without a remove.  snd_card_free() waits for the release of card_dev,
but the reference taken in azx_probe_work() is dropped only after
azx_probe_continue() returns, so the work never finishes:

kworker/1:1+events:
[<0>] snd_card_free+0x107/0x160
[<0>] azx_probe_work+0x57d/0x1fa0
[<0>] process_one_work+0x937/0x1800
[<0>] worker_thread+0x4ba/0xd20
[<0>] kthread+0x331/0x420

It also doesn't help azx_remove() which reads the card without a
reference before cancel_delayed_work_sync() and frees it again after
the work.

Which user-visible change did you mean?  The card now stays until the
device is removed instead of being freed in the work.
