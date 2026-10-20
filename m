Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515854;
	b=00AlyGSN+UqKmW/iOKFgPxnZfiAlZQqW9dMrijWBQoXtmAo7UWSpV59T+fAFYMEGDRO/
	 Y4GihKbyHAgLWMlMuwAZztMBiCgHe4OSCGLpcg9XDRme4QF2UsciynUfy/0VfRL5Igu0p
	 VRfn4VJjE8CMmmhhTJ4Rr+XP6CHdS+y61kvXdBkKs0niPHt+tR8lTeyQyiwKxznmsuaq0
	 j5AIrZBsFB/swnNgCfd7pHt1wyOte92Q/p7vsGV1FluClbE9+ahLF2OZ5tHzbvAMGa3U7
	 z1fDR31x3xbaJPP4CiJFL0/w++xX+hITTqJpHP4bUjUKQP1S7c6fwWbQ60mXQhyVrWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515854;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ilOCs9JW1eswWZldgI01PyWwMif6Q2IZWcYqSQMNIxA=;
	b=gQS655SP2TSClUPCwU88xGw9gK6OFhf82Ab93jnccr/Wa3g0wNzGS2ICFYQAsddf+Ope
	 8FZmx5N+7s44JYxdjmSk9COkidVcYEcxEXGNlS9PoDsIovZfW47LOYQc+7nA3KjtoeZOt
	 xET9nGn/UMsLkeSZd+0LXee+WqTe05DELoBTfrOnmeWGwpB5l8m6UjdSw693UJZfT4YOw
	 Zuz4ckwXR4dStS1ASnWZJQQjxQ5R6g9QhaxscnsKFQ5NRQKiE8dPnl7QjWt6bBgxncLSv
	 MDzzwzCEJctQYvI3+eWHa0x+CWW8pburMeGUt2KmUfHOY2wB6py3zoOzEf9tStbV+eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=vVVPW8rl;
	arc=none smtp.remote-ip=91.218.175.100
Received: from mta0.migadu.com (out-100.mta0.migadu.com [91.218.175.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96179606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96179606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=vVVPW8rl
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=V6YUdxWoTDNnXagrWvpsYWqhtgXuh09OxHBYpt8V1OY=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792515848; v=1; x=1793120648;
 b=vVVPW8rlAWtGlBcXnOSiY1L+7yxBfBgbWoHTFjuvyT4G8C4CkoIoQeuebeLr8HWfC2tcdBoK
 utm2tY11sqh4t3QLCXRI+wYV08ojAWkdAJ2gfB/p0rOjfisK+fJsqBrJx40P0CCfqyusA9gOZlT
 4dTYMDtu09Ne+W+crI0ivq+VBuVsL+INHvSJLo7CNbNQyT4xVpmlgyW/ES2SBxTnTctCFhNpRSO
 zkpIY5ORVO4Mv95s5VdSkovA/MXV8jn4wpq53Vmj/zmY/wgMN2N6EwELSrle+/3UETVawwT2hV/
 Cd96HEmKpmzVi3x6r5Gdn1NprW7XPkVI5MJqrbn7z7Low==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 22d13bc26f5e4975;
	Tue, 20 Oct 2026 17:04:07 +0000
X-Mizu-Trace-ID: 22d13bc26f5e4975
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] ASoC: codecs: wcd937x: add USB Type-C analog audio mux support
Date: Tue, 20 Oct 2026 14:03:24 -0300
Message-ID: <20261020170341.1641325-1-val@packett.cool>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently only wcd939x has support for USB-C SBU audio in mainline, but the
older WCD codecs can do the same thing 939x does with USBSS, with an
external 3rd party mux instead. This series adds support for that based on
wcd939x code.

Tested on sm7325-motorola-dubai.

v3:
  * Zero initialize the device_node with the __free, oops (sashiko-bot)
  * Clear the pointer in wcd93[79]x_mbhc_deinit before tearing down the
    actual wcd_mbhc object (sashiko-bot)
    * Hopefully this is good enough to satisfy the concern about
      getting a typec notification *while removing the codec* which is
      something that has an extremely low chance of ever happening in
      practice anyway. I'm not adding an extra mutex for this. I'm tired.
  * Pull R-b for the commit in the middle but not for the other ones
    because of the changes above.. (prooobably would've been ok but well)
v2: https://lore.kernel.org/all/20261020082631.1509275-1-val@packett.cool/
v1: https://lore.kernel.org/all/20261018231244.1266926-1-val@packett.cool/

Thanks,
~val

---

Val Packett (4):
  ASoC: dt-bindings: qcom,wcd937x: Add USB-C graph properties
  ASoC: codecs: wcd937x: add USB Type-C analog audio mux support
  ASoC: codecs: wcd-mbhc: guard against NULL cfg in
    typec_report_(un)plug
  ASoC: codecs: wcd939x: fix ref leak and NULL deref with USB-C audio

 .../bindings/sound/qcom,wcd937x.yaml          |  15 ++
 sound/soc/codecs/Kconfig                      |   2 +
 sound/soc/codecs/wcd-mbhc-v2.c                |   4 +-
 sound/soc/codecs/wcd937x.c                    | 170 +++++++++++++++++-
 sound/soc/codecs/wcd939x.c                    |  21 ++-
 5 files changed, 198 insertions(+), 14 deletions(-)

-- 
2.55.0

