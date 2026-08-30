Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F333A545E
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 08:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788079520; cv=none; b=KywvMbGqwJWofehaY3SCUMWBzjyxpZ1y5qbzZl9WxX+940/5IwSKJQMAQMWP+YDao0+l3e0Fk4bXsNqjD0bD/LiyMY9ZJcQTJV9VUUT2JSF8O1G8FAAYZqe46nA0NhIsEE2MOS0JN4Z/+hXt/cl1WWCmI4R+PUEXZH2FCBw5v5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788079520; c=relaxed/simple;
	bh=ju9eQ1JU6RAKhQ6ts7mkMS42tAki2oETtyHnN80Fpuk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W0+hZzFySDYOQuvm1S30J8iYu+dWk3rok55l0m0/2514XrLlUmMm4bhXhdpe8DctuB57KT7quh8cjDYMLTwgGwgVhuI9WJNNBZqhPYQVju3wo/rDEri4kAvoQhqd1kCnY+1jtwc1wSRBjQ3i2koUG9cpJ+sbiWnl1j2M4Ysk5nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=qqAuKqFv; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="qqAuKqFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788079510; x=1788338710;
	bh=Evqhy43oI6g/Ot6Iq6++RrkjjhJhgFIGECdoOXdMeD4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=qqAuKqFvvrBh2Tr6v2qNLM5ulRTY82im/QCQqUzuXGbYZ+nWDwOQeinXrdz8GYJv1
	 vVkHFweYkcyioQQVk7Pyf4GFlnI7rSrVRsjYUPkmfbdhDaoa536/6/Ztkw1VPWIFp0
	 wEQu1lmyGIm8fvgMk5Zo9CKMQ9A4TmU6UJvolyPinvYBVasYfwAvBol5NUkaWXAYu4
	 lCHbvpSw4ChX6r/MpyWUxcEtBWtGt9nFiPT4tRcrjZEINAycxfaXis1e1c/nFl2M09
	 A49iSiZ0jBe/mDJSDk4q7S0q9jdfORUSN2neWnx8LXyLvMyeOKu8eqaYRbo7oK3eBG
	 Nm4NmIKDg9+Vw==
Date: Sun, 30 Aug 2026 08:45:05 +0000
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ASoC: fix audio on the Microsoft Surface Pro 11 (Intel)
Message-ID: <20260830084500.6123-1-lsa.uz@pm.me>
In-Reply-To: <20260804225853.31585-1-lsa.uz@pm.me>
References: <20260804225853.31585-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: a87cc9d1a8619e2c6327dff5fe5c51bd1af5588f
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

v1 was three patches: https://lore.kernel.org/linux-sound/20260804225853.31=
585-1-lsa.uz@pm.me/
Two of them are replaced here by a single DMI quirk, which is what Bard Lia=
o
and Pierre-Louis Bossart asked for in review, and which is both smaller and
safer than what it replaces.

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


