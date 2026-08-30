Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8523A453F;
	Sun, 30 Aug 2026 08:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788079522; cv=none; b=FAFKREy5fHn5GoWR6pnhKaixaGNqZ/jjvvXYgymVO38M0/Hld0hDkfUBMGQGWXO5GjFG80n6NhVc5OTmtQDeuLwPMjl0khX+wFNBUO0p8PB88olS7Y0XdgtYHA+uiiHekaLyk2RgszveFgIKE25U75vvPTFxc3/yamQKX2ESUQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788079522; c=relaxed/simple;
	bh=M+2CzBP2SNCXi23pIvjDvhBtCBLYWz+s0iHo3NWVAwA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dyv52kk0/vAQEP2OyW0K74nHj14/644nClC9WQBmA1EmWmSjHJh28TjwyYePVvUHt2oyIVlRhT2hjAHGz0QpPQbA9ZAnmddl2plsfb9On5ctS3SmzhsgyjXedu0okqFnYCC5LmfwhEACHsX1aYRMPIXltMxICsKi0ML6XLniS8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=jPc2a7js; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="jPc2a7js"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788079518; x=1788338718;
	bh=48SIRkyGAVLzfF/HnjP4LMKuskjW5PPU88cEiXQ7lUk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jPc2a7jsUzNUB3W11crKg/wla0mo0wdvivrO4Wl2W4K7jJgBydFB/j4SJfvTSB9lt
	 llzen1wFqBc7IBM1CCHbRkWmZ2YN/qQZriTq3NbJxPIn8Th4OZtr8P6V/P2R/ey+nD
	 WeJU4s5zlAnHrnEUW+ZYZTpr0JQsVpwpdhkTqY1UarUANgvfxOiZ6xaQ4JwP8hIKAk
	 wbXzEm6cqKHSQ/0dbxYwEBLJ41nBOCxPmkSFuARtGDWDFJ3VmFtCRyP352NwXowy0P
	 pz05sCY0MgcQgumwf+GSQ7oO28iHTDL2IaG3apRTIHvROB17PU87mntyrfJzLSJs1s
	 pi6vVxqULXLEw==
Date: Sun, 30 Aug 2026 08:45:13 +0000
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: rt1320: run the initialisation preset on the first hardware init
Message-ID: <20260830084500.6123-2-lsa.uz@pm.me>
In-Reply-To: <20260830084500.6123-1-lsa.uz@pm.me>
References: <20260804225853.31585-1-lsa.uz@pm.me> <20260830084500.6123-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 5ef8b422a69b8e1b459b6d11ad5bb78896b7ec8c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

rt1320_io_init() applies the vendor initialisation preset only when the
amplifier's SDCA function status has FUNCTION_NEEDS_INITIALIZATION set:

=09if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION)) {

Its two sibling drivers guard the same write differently, also running
the preset on the first hardware init:

  rt712-sdca.c:  if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION) ||
                     (!rt712->first_hw_init)) {
  rt722-sdca.c:  if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION) ||
                     (!rt722->first_hw_init)) {

On the Microsoft Surface Pro 11 (Intel) the RT1320 never sets that bit.
Its function status reads back 0x41 on every boot, cold or warm:

  rt1320-sdca sdw:0:0:025d:1320:01: rt1320_io_init amp func_status=3D0x41

which is NEWLY_ATTACHED | FUNCTION_HAS_BEEN_RESET: the function reports
that it has been reset and does not consider itself in need of
initialisation. Bit 5 is never set, so the preset never runs,
rt1320_vc_preset() and the MCU patch load are skipped, and the amplifier
is left unprogrammed. rt712 and rt722 would have run it via their
first_hw_init fallback.

Add the same fallback. With it rt1320_vc_preset() executes and the
amplifier reports RT1320_KR0_INT_READY=3D0x1f where previously it did not.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
v2: unchanged from v1's 1/3.
 sound/soc/codecs/rt1320-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 13493b85f..d1f3b160a 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1900,7 +1900,7 @@ static int rt1320_io_init(struct device *dev, struct =
sdw_slave *slave)
 =09dev_dbg(dev, "%s amp func_status=3D0x%x\n", __func__, amp_func_status);
=20
 =09/* initialization write */
-=09if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION)) {
+=09if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION) || !rt1320->first=
_hw_init) {
 =09=09switch (rt1320->dev_id) {
 =09=09case RT1320_DEV_ID:
 =09=09=09if (rt1320->version_id < RT1320_VC)
--=20
2.50.1 (Apple Git-155)


