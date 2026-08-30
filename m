Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E1C2DFA4A;
	Sun, 30 Aug 2026 15:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788102936; cv=none; b=WMpMOz7twZGhpvOESJr5vsU9rVpTa75yt0gUT9xFNkvBzgnKjU6XrXOnZ07UjLP2jMkIjao4QKL9nwOq9KpIONaDHZNn8kWwORW+L7RakjfpoAsNb8ETm5E64CK8zzeQXwAac9LdybNp26wO98f//MvS/tBK4oCRtQs8qjWQASg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788102936; c=relaxed/simple;
	bh=n5yfVtxbmsunL9nt+Ia8NlhHT5QQfO9bFHxkO9lQmtk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZmoDa4D7jKTsvMrMrFk2Dv8lNIceioAam5uoBzzXxd/KOA7o0wvrU7rVp6yUTJLCyy13+qEQyRxBsL6bSYuEp1xnRsPjREwgLhAd30zj+IgukgyWeGUiSBiB3SuawZHTvjmi4O606HcH6MMmEQr5KVt78kUq8P7l9feZwHTxi9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=F5cACGQ9; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="F5cACGQ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788102931; x=1788362131;
	bh=BrJuSbaF0l28rPIf6FqDTr5vweNavEQs/uTlqSl6ICM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=F5cACGQ9+2EcxpOIh9KHV9MJRwWBDIdbi7nu98JWjci0ViSXKvJCnQjy34aWmxtFt
	 oa7K2uaLWbp+Tva+0cLQwvcxW0BEGnambCau3PAfqk6RHje0xFbRivWBrtuwL6Ed82
	 PHa2mnivYFYno7TE4hoEoifp0APspJXfOAVQpReOYQIeHj1qo0oAHamXCvSQTZsQBP
	 Hy3IwMabEYcr8xK/mz7/TNBXoot+83U2RLpHS/b12XVqFIq271FBv3zSuy0yycSGIk
	 9EedCWI9nt+yfDHzD8lhWsouKVU59jArSVdW0TE+TpsFNMAm046WQwA4vRx2Lx/CNu
	 vIl7nAe346zEQ==
Date: Sun, 30 Aug 2026 15:15:25 +0000
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Bard Liao <bard.liao@intel.com>, Amaan Lalani <zlzzm2014@outlook.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] ASoC: fix audio on the Microsoft Surface Pro 11 (Intel)
Message-ID: <20260830151516.44629-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: d2c9b2dae08ebbd21b266d93fd8459f66f116a98
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Microsoft Surface Pro 11 for Business (Intel, Lunar Lake) has no workin=
g
audio under Linux: the speakers are silent while every layer reports succes=
s.
These two patches fix it, and the machine then works with the stock
sof-soundwire UCM profile and the shipped topologies - no board quirk, no n=
ew
match entry, no local configuration of any kind.

Changes since v2: none to the code. v2 was sent in reply to the v1 series,
which Mark Brown asked me not to do because it buries the current patches i=
n
an old thread and confuses tooling. He is right, and this is the same two
patches sent as their own thread. Sorry for the extra round.

  v1: https://lore.kernel.org/linux-sound/20260804225853.31585-1-lsa.uz@pm.=
me/
  v2: https://lore.kernel.org/linux-sound/20260830084500.6123-1-lsa.uz@pm.m=
e/

Changes since v1: two of the three patches are replaced by a single DMI qui=
rk,
which is what Bard Liao and Pierre-Louis Bossart asked for in review, and w=
hich
is both smaller and safer than what it replaces.

The board carries one physical RT1320 amplifier on SoundWire link 0 and
describes it twice:

  SWRA  _ADR 0x000030025D132000   SDCA class 0
  SWRB  _ADR 0x000030025D132001   SDCA class 1

Identical apart from the class id: same link, same manufacturer, part and
version, same unique id 0. The part reports class 1, so only SWRB ever
enumerates. SWRA stays UNATTACHED on every boot and on every firmware versi=
on
tested, including the November 2025 bundle, and the firmware is signed vend=
or
firmware we cannot have corrected at the source.

That ghost broke two things at once. It consumed an amplifier index, so the
real part was named "rt1320-2" and the stock UCM enabled switches on a devi=
ce
that is not there; and its endpoints reached create_sdw_dailink(), which bu=
ilds
DAI link names from link id and function type alone, so its SmartMic collid=
ed
with the real one and the card failed to register at all with -EEXIST.

v1 fixed those two symptoms in two places, each with its own way of noticin=
g
the ghost. Removing the ghost at enumeration instead fixes both at once and
needs no runtime presence test:

  1/2 rt1320: the amplifier's preset never runs, because the driver waits f=
or
      FUNCTION_NEEDS_INITIALIZATION and this part never sets it. rt712-sdca=
 and
      rt722-sdca already handle this by also running the preset on the firs=
t
      hardware init; rt1320 is the odd one out. One line, unchanged from v1=
.

  2/2 dmi-quirks: remap the ghost _ADR to zero so sdw_acpi_find_slaves() ne=
ver
      creates the peripheral, as ghost_realtek and global_ghost_adr already=
 do.
      Matched on DMI_PRODUCT_SKU, not the product name, so a later batch wi=
th a
      different RT1320 version - and therefore a different _ADR - cannot be
      caught by a remap it was never verified against.

Testing. Surface Pro 11 for Business (Intel Core Ultra 7 268V). Verified on=
 the
machine's own kernel, 7.0.0-30 (Ubuntu 26.04), with 2/2 backported to that
tree: its dmi-quirks.c predates ghost_realtek, but the table entry is ident=
ical
and the mechanism is unchanged - slave.c drops a peripheral whose overridde=
n
_ADR is zero in both trees. 1/2 is byte-identical to v1's 1/3, which was bu=
ilt
and booted on 7.1.0-rc7.

  - /sys/bus/soundwire/devices/ shows only sdw:0:0:025d:1320:01; the class-=
0
    ghost is gone
  - amplifier named rt1320-1, controls "rt1320-1 OT23 L/R Switch"
  - card registers as sof-soundwire, 4 playback + 1 capture
  - no -EEXIST, no -61 link startup errors
  - speakers audible, internal microphone captures signal
  - stock alsa-ucm-conf and firmware-sof-signed, no local configuration
  - Secure Boot enabled with module signature enforcement, no rejections

Related work already on the list, so nobody reviews this twice. Amaan Lalan=
i
sent a series for the same machine on 2026-08-28:

  [PATCH 0/2] ASoC: fix SoundWire enumeration on Surface Pro 11
  https://lore.kernel.org/linux-sound/BY5PR02MB63701A05A58EF6B4D6CAAC31A0AC=
2@BY5PR02MB6370.namprd02.prod.outlook.com/

In substance it is my v1 2/3 and 3/3: name-prefix reuse for _ADR entries th=
at
differ only in class id, plus a runtime SDW_SLAVE_UNATTACHED test. The revi=
ew
Bard and Pierre-Louis gave me therefore applies to it unchanged - it detect=
s
the ghost at runtime rather than removing it at enumeration. Their version
hooks both the count and parse paths where mine hooked only parse, and carr=
ies
Fixes: tags, which is worth keeping if that approach is ever preferred.

There is also a body of downstream work for this machine in a linux-surface
fork (https://github.com/linux-surface/linux-surface/pull/1990), whose audi=
o
fix takes the traditional shape of a DMI-gated machine entry. I wrote up th=
e
comparison, including why the generic path appears to serve the microphone
better here, in a message on the v2 thread:

  https://lore.kernel.org/linux-sound/20260830122606.47028-1-lsa.uz@pm.me/

I have not run that branch on this device, so that part is their reports
against my measurements rather than one machine tested both ways. I have
offered to do it and will report the result.

One thing the review process turned up that is worth recording. The v1 cove=
r
letter said the DAI link name collision was "no longer reachable on this
machine and we cannot demonstrate it". That was wrong: during v2 testing a =
boot
where the quirk did not take effect reproduced it exactly, and it is fatal.
create_sdw_dailink()'s naming scheme is still not unique in general. This s=
eries
does not address that - it removes the ghost before the naming code sees it=
 -
and I am happy to send a separate patch if you would like it fixed.

checkpatch --strict is clean on both.

Sergey Lebedev (2):
  ASoC: rt1320: run the initialisation preset on the first hardware init
  soundwire: dmi-quirks: drop the ghost RT1320 on the Surface Pro 11
    (Intel)

 drivers/soundwire/dmi-quirks.c | 28 ++++++++++++++++++++++++++++
 sound/soc/codecs/rt1320-sdw.c  |  2 +-
 2 files changed, 29 insertions(+), 1 deletion(-)


base-commit: 7e9e0409cd57924c4099090879154300c07b8643
--=20
2.50.1 (Apple Git-155)


