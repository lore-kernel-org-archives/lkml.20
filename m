Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834308;
	b=kmgghf2OLfsbClSdkd9cs3ngFctU4aI4pDhg2UTgWJrN51db14NmJN0q4nQ7Ei32TWS6
	 7kzqUr7p0PhBWt9V/OSCgQcRPwZZQdD8508l+P/7D0Yq+lbK64GoOoF3neGkV2mhEYJAb
	 Ecnb5shlah0AlffLHR3cEgJY4I2744d+1XuDf8iqm8t9n0QoZ0eoSlXZSlzw5ziakchLC
	 /iHicTnKdL1yrmgUnw8wgBXF3HepPe6IrV/CTbas0/hTjTOJ4AAAjnVpftplAWfmdhFku
	 WeS8o9PrXqSf3CGEajCjh9KCeZ8nnDfvm3sNL8L+Asvw/O0CIo3uAej0J1u/ZSbMsFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834308;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=3qxXqZ/X61M4+HhIEifAtVtiu8v8azVt8M4fLiSx3jA=;
	b=zt/TAPj3cte4uPmecpkgFRKHSe636LdtSqn3yGzrZK6pe1IwyUH7aldoAIZ6hyIjOlNx
	 IbanhpvlhPHUcBYd7ZXIKZm8YKHrpmWVelaF19fHFyX0j0FozZb3KgaVaFCXu/kLSYppx
	 FhAuVN+DddOmbhGxcu+p9wArwJLH6xax0nFtcwgYjjQ2XrBZ9weft9LUKAdAI69v1/xU7
	 unqr96EPuE/RRepWOaiwpIirIA81WaMJpT7t2Qpz0YXJHMju8UHSy92nAVX8aO9ZG/NM6
	 CtEOEHlsSRD0IsCnqrHCvajMVhBp7sL/2MzvguqXYjL5eXWd9TiwSMr+dd8ZDcZZQ0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=becholey.ch;
	spf=pass smtp.mailfrom=becholey.ch;
	dkim=pass header.d=becholey.ch header.i=@becholey.ch header.a=rsa-sha256 header.s=protonmail header.b=PMCgDYtB;
	arc=none smtp.remote-ip=79.135.106.25
Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A57606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7A57606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=becholey.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becholey.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=becholey.ch header.i=@becholey.ch header.a=rsa-sha256 header.s=protonmail header.b=PMCgDYtB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=becholey.ch;
	s=protonmail; t=1794834303; x=1795093503;
	bh=3qxXqZ/X61M4+HhIEifAtVtiu8v8azVt8M4fLiSx3jA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PMCgDYtBnBPK1ZKDQ7DbnjyZw5Qk8BtfbXCcziXA94NnKabLlz80iNChAR/1/B67u
	 1D5oHPSidcBa5aUQO4dN+E+SKDDag6JdGLy2y9FCkxMAHTelOVlDCVA4juKALkBGTR
	 dhR43jW2CwcBQyDJhxKU5y3bEdBnDO7VHxMtT0W4sfB599FR5YK1r9qtf5ca9UL1o+
	 CdGIUIeRplMXXL1ADGrxho1cjxJ13X3vv+roabnRfh2wyJLj9iuQaheqo/LFfCxm3x
	 aFsFA15DLIJcYEj1FnPhu3j+Wy5i/LlzHKDr+nfi8D8DHG2r2597iAYoB5vfDBDiWf
	 ihu+u6LQNgfTQ==
Date: Mon, 16 Nov 2026 13:04:59 +0000
To: Takashi Iwai <tiwai@suse.de>
From: Alexandre Becholey <alex@becholey.ch>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, Hanxiang Xu <xuhx@hust.edu.cn>
Subject: Re: [PATCH v2 0/5] ALSA: usx2y: us144mkii: fix PCM stream lifetime bugs
Message-ID: <9nzdZSQp5vd2r7Mg_R549ViuvvmKFsd-c_XQfH6NUPj4efLJUQKDjZ-XW65QKX5nFWjoT7XJ251ZT4wXANpSkfVVE-Y_5oP8jS85HKpxfG8=@becholey.ch>
In-Reply-To: <878q2tynuy.wl-tiwai@suse.de>
References: <20261116071707.217448-1-alex@becholey.ch> <878q2tynuy.wl-tiwai@suse.de>
Feedback-ID: 60743817:user:proton
X-Pm-Message-ID: 34096f1d90684ec1ed54783d7d5f8273453d75db
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, November 16th, 2026 at 1:14 PM, Takashi Iwai <tiwai@suse.de> wro=
te:

> On Mon, 16 Nov 2026 08:17:25 +0100,
> Alexandre Becholey wrote:
> >
> > Hi,
> >
> > Five bugs in the snd-usb-us144mkii PCM code, all reproduced with an
> > emulated US-144MKII under KASAN on torvalds/master and v7.3.1:
> >
> >  1/5 stop_pcm_work calls snd_pcm_stop() on a substream that is being
> >      closed (use-after-free of the runtime); the device can schedule
> >      the work at any time by sending bad feedback.
> >  2/5 capture_work keeps using the capture runtime after the capture
> >      PCM is closed while playback is running (use-after-free).
> >  3/5 the capture work and the playback URB completion use the buffer
> >      of a substream that was never started (NULL dma_area), because
> >      the URBs of both directions always run together.
> >  4/5 the playback and feedback URB completions use the substream
> >      runtime and buffer without waiting for close (use-after-free).
> >  5/5 a START retried while stop_work runs submits URBs that are still
> >      in flight (URB submitted while active, anchor list corruption).
> >
> > The patches depend on each other and are meant to be applied in this
> > order: 2/5 builds on the close callback of 1/5, the check added in 3/5
> > is only safe once 2/5 guarantees that the capture work does not outlive
> > the substream, and 4/5 and 5/5 apply on top of the first three. In
> > testing, 3/5 without 2/5 crashed in the new check, and 1/5 + 2/5
> > without 3/5 still crashed on the NULL dma_area. Each patch has its
> > testing notes below its '---' line.
> >
> > Hanxiang Xu reported the bugs fixed by 1/5, 2/5 and 4/5 on this list
> > on 2026-11-13, from source inspection and without a patch; we found
> > them independently with emulated devices. v1 was sent as a reply
> > to that report, and 1/5, 2/5 and 4/5 carry Closes: tags for the two
> > messages. The reports also mention close racing with disconnect:
> > that concerns a fix that kills URBs in .close, which this series does
> > not do (the .close callbacks only touch the card private data), so
> > nothing is changed for it.
> >
> > Changes in v2, both from the Sashiko reviews of v1:
> > - 3/5: also count the hardware position and the elapsed periods in
> >   feedback_urb_complete() only while the substream is running, so that
> >   a substream started after the other one starts at the beginning of
> >   its buffer.
> >   https://lore.kernel.org/all/sashiko-outbox-214859@kernel.org/
> > - 4/5: make playback_substream and capture_substream __rcu pointers,
> >   published with rcu_assign_pointer() and read with rcu_dereference();
> >   the capture work now also uses the substream inside an RCU read-side
> >   section.
> >   https://lore.kernel.org/all/sashiko-outbox-214863@kernel.org/
> > - 1/5, 2/5: no change; 5/5: rebased, no change.
> >
> > v2 was tested on v7.3.1 and on torvalds/master 97d73c825122 with the
> > reproducers of all five patches, with KASAN, PROVE_LOCKING and
> > PROVE_RCU: no us144mkii report in 84 runs (the same reproducers
> > crashed unpatched v7.3.1 in 8 of 8 runs).
> >
> > v1: https://lore.kernel.org/all/20261114172806.88710-1-alex@becholey.ch=
/
> >
> > How we found it: the bugs were found, and the reproducers and these
> > patches were written, by AI agents (Claude Mythos and Claude Opus
> > models), in QEMU with emulated USB devices (raw-gadget/dummy_hcd,
> > emulated xHCI, USB/IP).
> > A human reviewed the analysis and the patches. The reproducers are
> > available on request.
> >
> > Thanks,
> > Alexandre Becholey
> >
> > Alexandre Becholey (5):
> >   ALSA: usx2y: us144mkii: fix stop_pcm_work race with PCM close
> >   ALSA: usx2y: us144mkii: wait for the capture work on capture close
> >   ALSA: usx2y: us144mkii: only touch the buffer of a running PCM stream
> >   ALSA: usx2y: us144mkii: wait for the URB completion handlers on stop =
and close
> >   ALSA: usx2y: us144mkii: do not restart the stream while stop_work run=
s
>=20
> Thanks for the patch.
>=20
> But, I believe that we should rather address the whole us144mkii
> driver issues differently: this kind of duct-tape fixes won't work
> well for this driver simply because the current code isn't designed
> well for the concurrent playback / capture changes at all.  That is,
> it needs a redesign about how to keeping the streaming for full duplex
> and concurrent open/close or parameter changes.
>=20
> And, those patches generated by AI often make the same mistake.
> Basically, at the close callback, we shouldn't deal with the cleanup
> for work, etc.  At the time of close callback, all streams must have
> been already turned down and cleaned up.  The work stop and sync
> should have been done at PCM trigger and sync_stop callbacks, instead.
>=20
> I guess AI has been trained more with the older code changes that
> didn't use the sync_stop, so it tends to produce a quite old-fashioned
> code.  You can give hints about the above point, I suppose.
>=20
>=20
> thanks,
>=20
> Takashi
>=20

Hi Takashi,

Thanks for the review. Yes AI have a tendency to go down rabbit holes inste=
ad of taking a step back to see the bigger picture. I also tried to run the=
 Sashiko bot locally but with the models I have access to, they wouldn't fi=
nd those issues consistently.

We don't have a real US-144MKII, which matters for a redesign of the stream=
ing. What we can do is to send the reproducers and our analysis of the five=
 bugs to whoever takes it on.

Thanks,
Alexandre
