Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638427;
	b=wR3Dagcv35KZWueeX8irRhC0AuD6mQuzX9ZcD2Lc2dBUZ+5IDb2PtpSO6q7vZZHr+PmC
	 Zx1WC3kILMVXPnYsGx9jv/T+FXjwSjGsIdmfgxH6Avvsv2lxLVhpHdV3AcKPXnyCc9iiY
	 qqpmOPNt7kL2JUZDCWhGILWXpMzx4qcAFaEmxX0LBNmysl2nZQZD16/gEA3trm3PXB5ck
	 1hx7B5056kPy1GyCXiGGvr03gSYG6zK+8Cy07n30DjJjD3FwodaUvAf7Yu3B/z0KN85rL
	 PuoKBAQnMDXv5CYYPLpm3noZt/NsiyyczA7nYcwbcJyTukRRpp6/+3AbE5xCIy+rHbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/SI2PUcddBfYVKVC/aRECHCKeHfS2EJHFz816z3+gq4=;
	b=zwN2lwOTCZ2PSLnToRTFtgbcVgmwv9Grh7sDR60HAm5ZBGbLSH7vSR41jmioNst0j4gi
	 ANwjQjVPykNBy9ZU+EJ0zm6SYWu+wLCyDnTUFnX14sKbJuuIRegJV77ykM8k+Z9C5b/nH
	 tupqbiJF81VvinwF+C4qXCdItlMQlZ/4aAsfoey5t3yV1MedgUNFaeqKqLdrWKBlv9eWD
	 zz4QpLCEHjCcvCejbUotmFT778lIFsuW5dxAxhaqMWQyDvFHgOBiEZ2r81DrnpKZkuvu/
	 z1U25rUc8Bd8bbhmZHpDV4/tjGiTu9i00G6WNqJl5piNN4A+pskITIXgiNFVxLxsaBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mrct8IJt;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7D5606A584
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E7D5606A584
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mrct8IJt
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4649b35bso3118467f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638426; x=1794243226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/SI2PUcddBfYVKVC/aRECHCKeHfS2EJHFz816z3+gq4=;
        b=Mrct8IJtpCBAs8emeLa9gEOzLlPTC7ZbFWCaC4tZWeWvvw76PJTEj9hlsgEdvnc6Oh
         s2vUCBogGKkeslv+vcwtSCY8Ic0yjOykp7/j34zxJKsUXtFZtSoBhT2go7Q58IEcWKgp
         VN1AgmPogpMkxjLGDEWdCAnT0EG8mFxBbUMOpvnzwVnEZhA9pXYnJkV89tgPGxXgpCxp
         z3lEj4XEOH9h+NqB0HccWMQeRyljm6r6BKqsQFjtu9niERFQ+lKg22LukdPuoMmK2Dl6
         1ATyFrk90MhyY0xD3zU/oi3rNwNygeai099u4eKQ72YsDDwh/qgCJut7ka9QfwwUmuhi
         2aQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638426; x=1794243226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SI2PUcddBfYVKVC/aRECHCKeHfS2EJHFz816z3+gq4=;
        b=JQV8Zwx17ka9wVlDqNIcAPEQ0Wc8FwTNF8Cf0JcOc/PlR3CjU6QsXq/OSF2c/zEVFB
         KOLCSE2Z8C0ze8LLgiAoA4j/cclzjCBakrcw8VpJqVMgncfVar70P2XCaR9ZMZC8JQGr
         vkdWJOaROOv4prlgJl1FugrUEUvYn/fTixpdpbIqgabePLVmGK1TMwi5z8v4z95lUN6m
         z7WXUqi24avt6NfkOe86LgjGD8I28tlQgUAVH4CfdOhlbqknanCciN7gjlb2TGDACmB+
         ACuGZVqgnSGbGIpT+zKert5tQpOHsWr4nnK0GDdAejrnVa3Lfgejn4ov+HxB6okZAkwJ
         0Rfg==
X-Forwarded-Encrypted: i=1; AKwUvByUrTSLRq4WZBw6Tg2R73k7cxA38gIORUwfb/CvKwpbCurlZ5S+/mi2c7EtPmubVDm+GpLNvXFvhG0mSwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V/MOn1+zwYUrxFoESolr+rKPmDzhMPx0Lhr1Ru8nyhkdRezmC
	VNK86JR9GykdFG8KlTcL2IkO93jT8NgvSdqwGA7qkEGMDz2shjJIVp4=
X-Gm-Gg: AYBFou1wuXNyMw/jTjdRaY/tZncCRgFKuIQco1PjAiMGE4JRLGb2rWocooD7T2tzS8r
	JCSUA79Y/vwcCEDvftCY1r9P36MeqIE6cO+GcvWU56d4nFiEaiUMIC9TVGzVZ3b9T9wH5IaV6UG
	msyMdoFo4FWlSDjOnZjA1E3amg+G6vRr/MJj/DIZ5I+Fv5XkxvFqcbP5VPv3kQy4/c4RTRjtTcj
	A0E0Ai21CyPXcVWCjZNNUjnw79HrP3RSpCpU6q192/aYdoDqMorfIqkob9S4rrJdzzyEHUk4vSQ
	0sBGGsQbyy4rtavxOAs74aVuzAShALvhUc0eeanQ0VwEVCk9rsV+1sMVC0+1fDvflfGw0Y/Mh6X
	5WA6zTKy42MolBKdVIjlALD4Oi2TUgBzmtzRf2NFKgk4JJhkRxHVaOTnE1XlogPB72lJW1XdHyp
	0pyQR0kl6W8VX/dSR5mcbT00v39sj73+/Psu3XwE384BdsFHAfMF0SrzmbzJYN6sF0DCwCbU3uN
	yDIg/3IIKimWIhWovQCPlmTc6SSav0Tlo8/aShgnLEUlWfU+4/GSN4b0fhReIiMXftxl6C2I0Ws
	H/3idxVLVGyk8BjH8y4=
X-Received: by 2002:a05:6000:2892:b0:48d:c186:dcc6 with SMTP id ffacd0b85a97d-48e6e5183c9mr24881547f8f.57.1793638425647;
        Mon, 02 Nov 2026 08:53:45 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8e5f4sm21479385f8f.40.2026.11.02.08.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:53:42 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard Liao <bardliao@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jorge Eduardo Candelaria <jorge.candelaria@ti.com>,
	Margarita Olaya Cabrera <magi.olaya@ti.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	tristan@talencesecurity.com
Subject: [PATCH v6 0/4] ASoC: cancel pending delayed works on codec removal
Date: Mon,  2 Nov 2026 16:53:36 +0000
Message-ID: <20261102165340.1558853-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

Several ASoC codec drivers schedule delayed works for jack detection
and microphone polling but do not cancel them on component removal,
leaving handlers that can run against freed memory.

This series adds proper teardown ordering in four codec drivers:
rt5668, rt5659, twl6040, and wm8994.

Changes since v5:
  - Patch 4/4 (wm8994): add comments clarifying why mic_work is
    cancelled twice (before and after jackdet_bootstrap), per
    Charles Keepax review.  No functional change.
  - Patches 1-3/4: no changes.

Changes since v4:
  - Patch 1/4 (rt5668): correct Fixes tag from nonexistent
    e13da14e8543 to d59fb2856223.  No code changes.
  - Patches 2-4/4: no changes.

Changes since v3:
  - rt5668 (1/4): track IRQ acquisition with irq_acquired flag.
  - Patches 2-4/4: no code changes.

Changes since v2:
  - rt5668 (1/4): also cancel jd_check_work, disable IRQ first.
  - twl6040 (3/4): swap ordering -- free_irq() first.
  - rt5659/wm8994: no code changes.

Changes since v1:
  - Unified series per Mark Brown request.
  - rt5659: guard cancel with jack_detect_work_inited flag.
  - wm8994: cancel mic_work before and after jackdet_bootstrap.

Tristan Madani (4):
  ASoC: rt5668: cancel delayed works on component removal
  ASoC: rt5659: cancel jack_detect_work on component removal
  ASoC: twl6040: cancel headset jack work on component removal
  ASoC: wm8994: drain delayed works on remove and probe error

 sound/soc/codecs/rt5659.c  | 20 +++++++++++++++++++-
 sound/soc/codecs/rt5659.h  |  3 +++
 sound/soc/codecs/rt5668.c  | 20 +++++++++++++++++++-
 sound/soc/codecs/twl6040.c |  1 +
 sound/soc/codecs/wm8994.c  | 16 ++++++++++++++++
 5 files changed, 58 insertions(+), 2 deletions(-)

-- 
2.47.3

