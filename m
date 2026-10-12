Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AC43DA7F9;
	Mon, 12 Oct 2026 14:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814373; cv=none; b=kgnqsKOzqrh69vL4pvCA+hDHb6RhY1kL3MF0YJMdow+E+I/vlSl5m7yXd0qJ1L1WK+DUHR9+e+vNsJYc0XrTJh3iTDnigyM/AR4FE9L8Nv8h0+62H5aVMMw2LsM9qutK4gex2Mw64vBeBeOcNpTXctgkEWSphP7FZp+TfICblTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814373; c=relaxed/simple;
	bh=7DrTE4LfL6ef3tZN5qq9xmNqooBTwIUSrcWTQ89zea0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=loJ5cZS3E2Qc8RgafG/Z8KMKHtKhFMVFHN7qhZTvemGxKL1IVtcU1PDVMgYmXdoKldyl4h8p6nAqPc5z60uREAmx/OMeYXX2lazf1daN86TOz5fa2PUjL8PdqVYtys0Wgbgz3CnXn9OB5qSuaz5GC+5Ww7SfSUuqu6kkFRyCCaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=X2Qn2SkH; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="X2Qn2SkH"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 49D8A8064A;
	Mon, 12 Oct 2026 16:12:49 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BTPy5UdRZVcP; Mon, 12 Oct 2026 16:12:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1791814368; bh=7DrTE4LfL6ef3tZN5qq9xmNqooBTwIUSrcWTQ89zea0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X2Qn2SkH1Q0/OLKoO0ySpOHILe9hC60RqFeBsu431h+wSieSbT8VT7LpZ9GNA3DTX
	 SE34oIBZ4LIOvc7XemJTkmX2RtJXhPMfzB+9zmVR4QEDLoTZcGscUF6R+fsU/mv8ek
	 ndTX430MUoJxkG4bpg2jBxT/iNUIULImurGDardr4osfzvuwIZoEX3q59Ian9/LJLr
	 fP0qG3O284mxxYDoKi+wsvFzGI2Zn0eFjT5LwqcPREeeUDXKYU45fSxEw6L2Q+e+O2
	 tFskZ0IrFTEdtMOXSlGaRFyi6MORTBqEXur03nj5cTZlGeminkAoZbDEO9RNplRqtp
	 JSCfRyBx4hY5w==
From: =?UTF-8?q?Ali=20Ahmet=20Memi=C5=9F?= <aliamemis@disroot.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: control_led: Fix deadlock between sysfs writes and card disconnect
Date: Mon, 12 Oct 2026 17:12:35 +0300
Message-ID: <20261012141238.1823718-1-aliamemis@disroot.org>
In-Reply-To: <874ieridp1.wl-tiwai@suse.de>
References: <20261011180627.1594051-1-aliamemis@disroot.org> <874ieridp1.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 12 Oct 2026 09:24:26 +0200, Takashi Iwai wrote:
> Hm, it's not clear to me how this happens: I see no controls_rwsem
> down around snd_ctl_led_disconnect() call.  Could you elaborate about
> it a bit more?

It's taken in the call_snd_ctl_lops() macro in control.c:

	guard(rwsem_read)(&(_card)->controls_rwsem);
	guard(rwsem_read)(&snd_ctl_layer_rwsem);

so snd_ctl_dev_disconnect() calls ->ldisconnect() with controls_rwsem
held for read.  snd_ctl_led_sysfs_remove() then waits in kernfs_drain()
for the attach write which is blocked on down_write(controls_rwsem) in
snd_ctl_led_set_id().

I hit it in QEMU with snd-dummy writing to attach in a loop while
unloading the module.  It hung on the third iteration:

rmmod:
[<0>] kernfs_drain+0x2eb/0x510
[<0>] __kernfs_remove+0x2e6/0x890
[<0>] kernfs_remove_by_name_ns+0x7d/0x100
[<0>] remove_files+0x8d/0x1b0
[<0>] sysfs_remove_group+0x71/0xd0
[<0>] sysfs_remove_groups+0x67/0xd0
[<0>] device_remove_attrs+0x181/0x270
[<0>] device_del+0x31f/0x8d0
[<0>] device_unregister+0x12/0x30
[<0>] snd_ctl_led_sysfs_remove+0x161/0x2f0
[<0>] snd_ctl_led_disconnect+0x16/0xd0
[<0>] snd_ctl_dev_disconnect+0x151/0x210
[<0>] snd_device_disconnect_all+0xf0/0x180
[<0>] snd_card_disconnect.part.0+0x25d/0x4c0

attach writer:
[<0>] set_led_id+0x2d9/0xc60
[<0>] kernfs_fop_write_iter+0x33c/0x510
[<0>] vfs_write+0x516/0x1340

and lockdep reports it as well:

  Possible unsafe locking scenario:
        CPU0                    CPU1
        ----                    ----
   rlock(snd_ctl_layer_rwsem);
                                lock(&card->controls_rwsem);
                                lock(snd_ctl_layer_rwsem);
   lock(kn->active#37);

   #1: ffff88800768a1f0 (&card->controls_rwsem){++++}-{4:4}, at: snd_ctl_dev_disconnect+0x10e/0x210
   #2: ffffffff881fdf28 (snd_ctl_layer_rwsem){++++}-{4:4}, at: snd_ctl_dev_disconnect+0x11a/0x210
