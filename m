Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579590;
	b=AAgWt+hJk8kEboeKxjm2CJLpbtREBx/TS8nJEwTsQxRB9yg4U92U25G+4NYK5gmY0TkQ
	 Ncc1XRwkBcDTP72YZNGo9cdD0oKZcbS1fQOweUgDzVR+4d4ExWspnGjqplSLsN0V8Ls7m
	 7QXeGrrZHJpSwWcTI/8idQIBNPV+P0OmPJK4vmLPDjRgAU7JgZ9Hl4i/2/afKS5/315wg
	 BdDJxsZVMDBnnUqM2LZaE/geMt7q1IpAVW4+D6eJiAtLTHishXmDu0tc9BcfHicQHAtZ+
	 KRsGfBYHvjnIGsiYEufZpSY0eLhPVrDEx9p1X4bQBBQXfZDTC+7JSGXQLyW9USTbWWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579590;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=4Oy7fzcIG3y0nP5b3iiI/X8Ax2z/W0aXM9bqY3TYz14=;
	b=iJvT8Rxi/4XRCz02Jz9uAOKXxtJ0XatfdbyaHf8M81lWVA6ZoPpKgpgoTUVCySCqRge+
	 fOy7Ffn/j6hbRatCfAmYd8a9EfRkl40K9jRyOA4Xv8hhRSnoFPx3G5b4nFOGIpMtySp2F
	 r3pyDGDCwjMhmjwcdTx+0E+XWBij4h/fHC3eoGibrEdZabPLr5fqGx6C+74DtjIhgcJ4C
	 UZTU8uC3ck0/N5Chnfj6IShVjA3JG/Vw0AbntFXJpYSAW48cMSa334I8OeoTAwB8BwOqk
	 vtjkkWWmlxiz7UB29FyI8wbrqOOCnEDvT/fKvKDqKb9ZMd7iijVAR/JzCHrrsPpR7tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b="i/0XDMwn";
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5347F606A33D;
	Mon,  2 Nov 2026 00:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5347F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=i/0XDMwn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793579579; x=1794184379; i=arc@gmx.li;
	bh=4Oy7fzcIG3y0nP5b3iiI/X8Ax2z/W0aXM9bqY3TYz14=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=i/0XDMwnBYLmcP5VZ3Qx4mdpfXrZswAf8fm5h1gRIu+ziAg2EyyRl6J06WHS96Mr
	 ADSvuJMe09+PFplxdM+phRNDylT9xph//tCBcQUI5JXjwcOah+xJfnvwcD+YPI8Rm
	 g+9BNXd8SOnFeOrL3d3fI5GXVAIURrRaSFTWmkBjPInGOa0qEdQzeCAzLA7H+Ppbh
	 y4cRyqfVFFk+Qlxja/5evT45gdEAl2klaNPDddz8fSul7ukLEaLKz3EWa51J5ddCW
	 yZF5/dic/9dxUengeEpRKunQajrzSbwq2701Bt5IEj4VU2og/U0GwxardiCMLjYXI
	 AeIIsbcqYcmscFqS9w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McY8T-1wpAAw2aXF-00jWYL; Mon, 02
 Nov 2026 01:32:59 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V2 PATCH 00/11] Re: ALSA: usb-audio: Audient iD14 MkI vendor
Date: Mon,  2 Nov 2026 01:32:46 +0100
Message-ID: <20261102003257.10134-1-arc@gmx.li>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101173557.221869-1-mrwillporter@gmail.com>
References: <20261101173557.221869-1-mrwillporter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GMrxYsBxu65rFWoacF4eVQHqFjqSAzmyGxDq24XwLhVB6j2IDIj
 cBLqt6Clos/OWUZs9zwkiqhbfKBqap+pjSl0FksxZcHqGSdVnv4aW8Y2/9Uc+dbH+CzmEhz
 SBwAsRJoTs16JYvgcTCQPEJbGLZh38M/LQ/LwOFrHhjw5de4XFyYqBm/NlFlyv2qn+RF3X7
 w5+mXxR1ePCeD9ED0Nd2g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:65YUDJ9lyp8=;1HAjsCvi3S9LjrfGLDyyyDwH2HQ
 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
 UOQgo+H9T5mnyqS

Hi Will,

On Sun, Nov 01, 2026 at 11:35:57AM -0600, Will Porter wrote:
> [...]
>=20
> 1. Patch 10, cache index
>=20
> The cache has hwchannels entries, and the probe fills it by element
> index (cache[i]). But get, put and the INIT_HW write index it by device
> channel:
> [...]

Good catch and thanks for the fix, applied in RFC V2.

> 2. Probe-time USB errors now fail the whole card
> [...]
> Could we keep the card registering after a failed probe transfer, while
> keeping the cache entry invalid until a transfer succeeds?
>=20
> To save a round, I wrote it out; the diff is at the end of this mail, on
> top of your series. Please change or drop anything that doesn't fit your
> plans.
> [...]

Fine with me, I suppose the question if individual reads should be allowed
to fail during driver initialization is more philosophical in this case.
I don't see any harm. Patch applied in RFC V2

> 3. Smaller points
>=20
> - Patch 05: would sign_extend32(buf, 8 * ctype->len - 1) work in
>   place of the shift pair?
> - Patch 05: the buffers mix u32/s32 with cpu_to_le32()/le32_to_cpu().
>   Would __le32 buffers keep sparse quiet?

OK, these make the code a bit cleaner, added to RFC V2.

> - Patch 05: the transfer buffer is 4 bytes on the stack, but nothing
>   checks the table's len. Could snd_audient_add_ctrl() return -EINVAL
>   unless 1 <=3D len <=3D 4?

I don't think this is necessary as it should be rather obvious to everyone
touching the driver that the u32 argument can't carry more than 4 bytes.
Added a comment to the parameter definition.

> - Patch 09: with FORCE_SET, a put of the cached value still writes
>   (good) but also reports a change, so each alsactl restore sends a
>   change event for every such control. Could it write but return 0
>   when the cache already holds the value?

Makes sense. Added to RFC V2 (in patch 10 where the cache is added). Pleas=
e
double-check if the logic reflects what you had in mind.

> - Patch 11: a device with no matrix list would dereference NULL in the
>   loop. Would a check on info->matrix_names be worth adding?

Makes sense although this could also be held off until somebody actually
adds such a device. Added to RFC V2.

> - Patch 01: FYI, the file header still says "Audient EVO driver for
>   ALSA".

Fixed in RFC V2.

> 4. iD14 tables on top
>=20
> I built the iD14 tables on your series, with the cache fix applied.
> On an iD14 MkI they passed control read and write checks, the range
> checks and a loopback test of the matrix crosspoints. The crosspoints
> also kept their values across a module reload and were read back into
> the cache.
>=20
> On top of your patches I needed three generic additions:
>=20
> - a step size for integer types (res): the iD14 level controls use
>   s16 in 1/256 dB; I expose them in whole-dB steps, matching the
>   volume knob. The control counts steps from min, as the generic USB
>   mixer does with the RANGE resolution;
> - an enumerated type with a value list, plus one extra last item that
>   a get shows for a device value outside the list;
> - a per-device create hook, for the FU 12 control that does not fit
>   the tables (in the same patch as that control).
>=20
> The matrix uses your loop as it is: with 2 channels per element and the
> names in the order Mic 1 Main, Mic 1 Cue, Mic 2 Main, ..., element n
> starts at CN 2 * n, which is input * 4 + output on the iD14. Does that
> fit what you had in mind?

Yep, sounds good.

> 5. Next steps
>=20
> Would you prefer to incorporate these changes in an RFC v2, or shall I
> fold them into the relevant patches when I carry your series, with
> notes in the commit messages?

I created RFC V2 with your patch and the fixes you suggested. This will
make things easier to review when we submit the everything, compared to
fixes on top of a long series of patches.

Based on the same commit as before and retested on 7.3.1.

  Christian

Christian Ruppert (11):
  ALSA: rename mixer_evo to mixer_audient
  ALSA: mixer_audient: explicitly define full control names
  ALSA: mixer_audient: clarify USB control message definition
  ALSA: mixer_audient: Add length check to USB transfer
  ALSA: mixer_audient: make USB control transfer size configurable
  ALSA: mixer_audient: Allow arbitrary boolean control values
  ALSA: mixer_audient: Add integer range checks
  ALSA: mixer_audient: Add control initialization at probe
  ALSA: mixer_audient: Add readback-free parameter set
  ALSA: mixer_audient: add control value caching
  ALSA: mixer_audient: Create matrix programmatically

 MAINTAINERS               |   7 +-
 sound/usb/Makefile        |   2 +-
 sound/usb/mixer_audient.c | 702 ++++++++++++++++++++++++++++++++++++++
 sound/usb/mixer_audient.h |  12 +
 sound/usb/mixer_evo.c     | 526 ----------------------------
 sound/usb/mixer_evo.h     |  12 -
 sound/usb/mixer_quirks.c  |   4 +-
 7 files changed, 721 insertions(+), 544 deletions(-)
 create mode 100644 sound/usb/mixer_audient.c
 create mode 100644 sound/usb/mixer_audient.h
 delete mode 100644 sound/usb/mixer_evo.c
 delete mode 100644 sound/usb/mixer_evo.h

=2D-=20
2.56.0

