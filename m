Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559D12DFA4A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788102946; cv=none; b=n/yS308IydvDltY7Y5RLOwce7KJe+coNwdKQcYQ4Q/M/jRH4NtTw+iHyCU98zRrsDvslqGcnPIa/r8VMvQ9h3T3fdqhxd3lPc7UzPexu1s7JLaOBKNRZwF2mZZItsGBBlHW8Y4JBGtTRENc4PCppTaVuyTS2FqsKv7DM7gy9VbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788102946; c=relaxed/simple;
	bh=H4e7Ps1XtiKH4TO/3BjbXXc8kP7dZkzLPOEI7twRvAk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IS2+6Pe1pXrIycrOCv8J+2dl3mbSTo3ks8ugJdetPThDR+spimxCMXu34N5rUtbpyf4V9WKP3uRN0dGHZy38evvaSFX4OYzA9X8fOctqDYD868zwx2mP8ghrqZevQeWIZgTH5ekJjMEwUnxHW2ijXISCe5u+V8pqkrZglAw+igg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=hSpsWtHp; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="hSpsWtHp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788102941; x=1788362141;
	bh=rAjpVHNOuKzbCe4ywlmfVDM0tSDIwLDF//f7jRQKZz8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hSpsWtHp6hokVpmcJn3Gvqaw/8rsxT0+d9yE/d1q2MDowlYwob1QYdaWP6TzXUIIa
	 uXMqBnwh1igyQ2Naf3nYLVcpM49CCoga6gW3c02xRyDduVgNfhNvY9VaFug7QOWhEn
	 QOLOSkrynhLe1BwEgI8vze604Lod3vRsyXgBmaawq9Yxi2IDx3HTyLR+uezr7N0ayJ
	 I4MDnZcUle8hDd0h8WAhqBmtCi8CingqpZLqJ2xtHzgbWg1lYEiwj5kN/5CDGb7QTB
	 okmc8/nbaxmW8Y93YSBNX6kelT4UI+CXiyJqEZ/dk5WKVmVZnFgGBKr1HdUsQnaTix
	 gIMSPwISa1+gA==
Date: Sun, 30 Aug 2026 15:15:36 +0000
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Bard Liao <bard.liao@intel.com>, Amaan Lalani <zlzzm2014@outlook.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] ASoC: rt1320: run the initialisation preset on the first hardware init
Message-ID: <20260830151516.44629-2-lsa.uz@pm.me>
In-Reply-To: <20260830151516.44629-1-lsa.uz@pm.me>
References: <20260830151516.44629-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 38181b0fa2026e65e0047983b4278b82083e0fb7
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


