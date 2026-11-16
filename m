Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867570;
	b=KFjMBGPUdcl4UVxrnZ5ZwL+ulo5MCkzXgOVUwNySeJaIYo95Xe93beNo0WksYJMEowRb
	 WjRMZjGIQt4ofuISK7RZlj8UqSwRzPjP7Dd2UIHicA9pIkheqEkNut4wr0e51fxvhdx/n
	 SL4eMyZdFygfQ6YTO/2TytUn3uQiZrYnbexTGt8f5LULUvCGDhK6B/JCfnux4pSd7YVmS
	 Ych2qa0anJAFnDQ/wDcoh0aa5bYEKaeo6CB146poI/A+UIvagvO9st5c0jsLfITDOsX06
	 JhKTtr7C4770i+oClX5Ehpn+pCT4FhnvG8PK2GnZvoH36Q1A524TOCYVdJNIlmea0/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867570;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Provags-ID:X-Spam-Flag:UI-OutboundReport:Content-Transfer-Encoding;
	bh=/Ai89hOcKV0zLKxpO05pU3gU87yPAZEJmEsqJWpoXTU=;
	b=asHShqxBkBrYDNpqa1CHVXQEMOzY7ssGLUNtUm9+8+jw4VHEgDBa0z1K/VUuBP+6HjRC
	 IA9g3sw1knTpDXkz0A5JqQM+fQJVRCJgejpuAimS/IIudC5X5hDCaYQVdxNp2H8fDbkQx
	 T7FY1X166SITadDl+jhPW++d4kFZn1YXwjaGstaSCf8AJH1F+LOfN8nQtJuK/BSwdvWAH
	 /BK22WPatf9gJG18C/t6EgO/bTgTs3Z48/sK38wsjL3pIZQxKaRhfk6hilkg8azUm+nuN
	 jevb71u+e/i06oHhMpeqka4F9VdlW+LWjeAACv4Yr0MbL7133hgB0OTly1nukRbppHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=X5Lf4h+K;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4F3606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B4F3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=X5Lf4h+K
DKIM2-Signature:  i=1; m=1; t=1794867567;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:TLQO51rSeClQniNxoifl/7anm+eO
   sBnZjkDGB9X52E0fvCqyDw1FdXMTgUUimRp4Mq1KfC4PXkPrs4yAgiH8N4yBPI63oKOpjJ7yiYC
   +mwcV7Ywnwkujwq/Nuc9PTvLxL83voERkzewloU5S5jdB3Nh8nYSeARpQYJcufyNJY8RTd40GPM
   2W28/7DKdDlyly2eOCJOK8vAlnQnB6961j2o+mkjyIa1qi6j3dRJKqTVKLVkAwFZjCV2Lo8STCK
   B3rPzV3DI0jYdRnITPssUZT3tR44rMGhYhJE2OWmG4noj6LjmqJ/C3XCa43Fg37H5uptB0LXZKf
   5ueinyvVxSUA4g==;
Message-Instance:  m=1;
 h=sha256:
   h4tU7VY1Y+UJ816i1U6ZxNQBYtKX539insD+hmNUGms=:
   TSYkpSIGkt3By0Xno8mU6eNGE94axqLWGqAX+L1mhSY=,
  sha512:
   M6zgSm59aXm0iTmVXzf3CPq6loYdr1axqXbPtO/wvhCfHvWiI9gO4zR5rtqNHPcNDoeTZQYb0pfkq8D53e6hjg==:
   FXo2HIHUTZj7UpHCSzByQba8ASBunpVfCqUNAeRSFUZlQwLZ2dEovDHQTJzRphfY65mpG99jgrlvdqZ1kjFz1g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794867561; x=1795472361; i=arc@gmx.li;
	bh=/Ai89hOcKV0zLKxpO05pU3gU87yPAZEJmEsqJWpoXTU=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=X5Lf4h+KVIV/JEyjZedqz+Q+AHJcHBVxlMDzpJGCieG98hQGEafI87c+jOBHROP/
	 wcVfC4hAtYM38iS5OLmYhq35Atne+AwljGY9Bxft9WEVmaCuU/IzqankQ1IBDYn6E
	 yOpc67vfdkOUVjWVa/+MFMhSkRkWpr7Yj9JnUD9TjK/BMcViJAKt26UQSt7k4unyP
	 MuZ1coASPqHEsDLn2YxYFKPPmks0JMSr715FkB/2NGO1aUW77vOp/3m6Qw16cFFui
	 TeROS1dqZyFnjhamt2ATZdkRwg1wm8yemsAsabIu95mURGrhoKiR5wXCQuuPWqNwW
	 ZYmO1EBCbw/3qcVX3Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7sDq-1xO9Mo3Zq6-00D0kB; Mon, 16
 Nov 2026 23:19:20 +0100
Date: Mon, 16 Nov 2026 23:19:19 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: Re: [RFC V4 PATCH 00/19] Re: ALSA: mixer_audient: Cache rework and
 simplifications
Message-ID: <avuBLGsTUysMqcr6@khmer.arcnet>
References: <20261115214336.17917-1-arc@gmx.li>
 <20261116025336.3718463-1-mrwillporter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116025336.3718463-1-mrwillporter@gmail.com>
X-Provags-ID: V03:K1:K+xOneaBgk+z1j3+QVuvB6u5CmJLlgD/yY7Wx0Bre22bYqCONsr
 ZlE72sA7lvGbBHBwrCUzsI49Ae221Er+BHN7d++JJ/8yYr/2UXZakGd/uRLP7aHn2i/NF65
 H8FhOnZufFssV5XFmCY2cj4uR39X1G0wnPZUZ5ckjVrFwpuIzno99CpPhBDxU4yxocTsR6c
 obL3cHFl5yRdPHN9No08w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9kOo0/loZvg=;tlqhpkPtjPpD9O7KSxKn1lkJJqV
 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
Content-Transfer-Encoding: quoted-printable

Hi Will,

On Sun, Nov 15, 2026 at 08:53:36PM -0600, Will Porter wrote:
> [...]
> Patch 19
> --------
>=20
> I like it. One thing: the FU 12 type has INIT_HW and CACHE, but not
> GET_BROKEN. On the iD14, GET CUR on FU 12 does not return the FU 12
> value. It returns a reply buffer that the device shares with other
> units.

Ah, OK. I had understood this is only a problem before the value is
first written/initialized.

> If the probe write of a Cue channel fails, that channel has no cache
> entry, so the next get or put sends this GET and caches the reply.
> The control can then show a value that is not the value of that
> channel. A later put whose device value matches that reply sends no
> SET for the channel: for example, a stale 0 dB shows as 127, and a put
> of 127 sends nothing. A stale value below -127 dB can also show as a
> negative control value.
>=20
> So FU 12 looks to me like a write-only control with an init value.
> With GET_BROKEN, an unknown channel reads as init (mute), and every
> put sends all four channels, as the comment above ID14_FU12_* says.
>=20
> I checked this with a test build that skips the probe write of Cue L.
> With V4, the first access after the load sent one GET for Cue L. The
> reply was 0x8000, matching the value just written to Cue R, so Cue L
> showed 0. Puts of the shown values then sent no SET, also not for Cue
> L, which the driver had never written. With the diff, the driver sent
> no GET, Cue L showed 0, and each put sent all four channels.
>=20
> Does that match how you read the flags?

Yes, if the read doesn't work we should not rely on it so let's mark it as
broken.

> > We could even get rid of the FU12 specific value type if the iD14
> > accepts -127 * 256 as a volume setting
>=20
> The device accepts a SET of -127 dB without a stall, but I tested
> that only on Main L, which the firmware ignores. On Cue, -126 dB and
> mute (0x8000) both measure at the same small residual level that the
> headphone output keeps. I have not tested a SET of -127 dB on Cue.
> The type also has to stay for now, because it holds Main at 0 dB. So
> I would keep value 0 as mute in this series. Could we do the plain
> integer together with your don't-touch channel mask as a follow-up?

agreed. let's push this into the follow-up.

> Patch 18
> --------
>=20
> The old gets read only the channels below hwchannels and filled in the
> rest. The new get reads every channel and then ignores the value of
> the channels at or above hwchannels, so an error on such a channel
> fails the whole get. I think this affects only the EVO4 "Mic Playback
> Switch" (4 channels, 2 on the device): it now also sends GET for CN 2
> and 3. Does the EVO4 answer those? Either way, the diff skips the
> transfer for those channels and keeps the values they show now.

yes, the channels marked as sw-only are actually read-only. Probably
something to address in the follow-up if we want to make it properly
clean. but your patch is fine for now, this way the behaviour is
consistent with what we had before.

> Small things, also in the diff:
>=20
> - raw_get_one() and raw_set_one() accept cidx =3D=3D MAX_CHANNELS, but
>   cache_val[] has MAX_CHANNELS entries. No table reaches it (the
>   highest channel is 55), so ">=3D" is only a guard.
> - Two comments from patch 10 still say FORCE_SET.
> - Patch 19 removes extra_init but keeps its comment.

Great, thanks for reviewing and fixing these. I tested the diff on 7.3.4
and everything works like before.

> Next steps
> ----------
>=20
> After patch 19, nothing of patch 16's own FU 12 code is left. So I
> would drop patch 16 and send one FU 12 patch after patch 18: the
> control as patch 16 describes it, built on the unified get and put
> with your code from patch 19. Would you like to be its author, with a
> Co-developed-by for me, or the other way round?

I think it's best if you're the author if you agree. My patch 19 was
little more than a sketch, definitely not intended for submission, and if
you want to replace patch 16 altogether I suspect you'll have to rework it
anyway.

> A note on trailers: V4 dropped "Assisted-by: Claude:claude-opus-5-5"
> from patches 8, 11 and 12 to 16. I put it back on them, and I added it
> to patch 10, because patch 10 now holds code from my cache patch.

Yes, these tags don't pass checkpatch on recent kernels anymore and all
mention of it was removed from the documentation in commit 1e035297ffdadf.
I don't know any more details than the commit message but apparently it
wasn't respected and thus useless.

> May I fold the diff into your patches 10, 18 and 19 for the final
> series? I would send it as a normal series, not as another RFC.
> Should it wait for Takashi's answer on your four mixer_evo fixes, or
> carry them at the front?

Yes, please do so and add your tags to the commit messages. I don't think
there's a need for another iteration unless if final testing discovers a
major flaw on either hardware. Concerning the four fixes let's give
Takashi another week or two and then submit with or without them,
depending on what he says. There should still be enough time before the
merge window.

Thanks,
  Christian
