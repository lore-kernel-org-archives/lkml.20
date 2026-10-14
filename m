Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402FF53445B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995237; cv=none; b=iZDIpufhHlyGPia8rPWRRgg1KbGFnxF3IFUxsLdWwkAuEIcnLIV5l6ByDyxZDMVW5Mqqmmg/Iy1VS7UwdzAr7iB9KdiEows2o5PoDpkzEk8tkAT7ntbJj0jXDk6eZsaB/7oHTQvoQ+RJcIDf/BaJzK9wNPwAWPXO9k8a/KSBYwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995237; c=relaxed/simple;
	bh=c0yy33joFZEmbfuIHCPnHt1VOe6qCnqOzWFCVZq4LCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UCCvoG9nqM7zcz4FOSeqUq4SK9lVslHDQE1v4/KzwNh94lquZJU1F/vfY//TI3gYtotfNXdGA1ZmfoldGBm58X70+ymonGDbX/PyyBObSte0h9vxbGKOyVnoi1Qq3aTlFgsswIgCtilRlMTSaxfD6KuZbpsMzGE4VN096bSvQA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIP6YiS5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIP6YiS5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so41887755e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791995234; x=1792600034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yniGqF21dTRj7u5IQTGNCDiFri0/FKhl7euVY4lavmk=;
        b=fIP6YiS5uBOn9iL0/HAZVL2wLYrKAifvwzGM+6us1I/ZjA504WxZgauawr3Pty8zuX
         aKY+wARShGpyIOsRDKxDCbZ1srN7xXo5DXt/DBDwD4Tf/DpkkLti+Cj282L6+Jh1Eszz
         zaP6tersBa1u8KftitQZjTLfUNKexurjBwnvEPNxd1Cv9Hxdf9axwsE9SiMTg0QDtWum
         8gom47fmpbg/Ail2PaN5l1VTNrHLGtz53kh8a1ni7k8i8X51Qtq8PR9ql5RlRSF7QyVd
         9TYbng32CdWBQIj8pH5LGOc7lZJ2lBAX0AfJmJrxk+Mc6MGhCIHCcwCZojJuJnGvggxY
         zMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995234; x=1792600034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yniGqF21dTRj7u5IQTGNCDiFri0/FKhl7euVY4lavmk=;
        b=Rvc5XUjc+09P3bw65RYQ4F0Ux4mQZCBTVf3inhYRCsWLwTBiCFARFXSJyoQXDl0pam
         OwKDMEaQKlDH3mnRi2/MC8P4l6zMS9zGWlVzfFMQ1Mf6EjmYFk04/bNVvTR/EE94pdAH
         PvsMliMcamaUvf617NqOqzHxV/I4DeDyX4fgkoIkb7yDfFyWb07UjrhEU0fye2bAWJj7
         VsVeNeB4VxYKMu64c05UqDOELGYRrgGa9qyH6gCLBTrsy+J+gNysXuUyvdDM+QZ6WNIS
         r2IhyOENO1oohs4azLcBwxtBZPVOvWjAKT+4an1skQJ6ytc2PVTrUS7ZzUsdoyYy5mqf
         1fhw==
X-Forwarded-Encrypted: i=1; AKwUvBz7udrNdAUYedM5g7cNLA+t6RC+naStAINMfhRc2Zq/WoCLGYoQgr2iJ8hTPWtJ6Ns5nRMJvgiyiOlh2ew=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBpBlpA6CstWhkNT1/F6u++3AhFZoAWxwBHCtMtb+XA7/sHBTM
	X1AMOrG8SWxlakSMc4r3WEWDcUgqqodqAW/y0oCbLvJyQ7PSM7hA8SLA
X-Gm-Gg: AYBFou2280/VMDlrwbV4DMxmvtaC4/JP73TcIKvrwml4FGFn0wp6rhpoVAqCNXCJHnj
	2Lo4D0AlymEjk9Kb+Z+KtUP5JFguAOD0jtEkIUP/QDBGRbT6LVh8/EYogvRSZYbFKxxsD/SGsEw
	ajQXyoKs71mSeuR8WzkZV1+OgoAcEV+DtbRuC62kLnPCV90MV29JC2+cuUT/RX3p5DQeD35Hax+
	hJsSY5TbzbLdOoal8IVBN0F/Gi/tEmrvxMN0Sz6VVtRDcegszeKggyAK56Fjbid/j0qn4OqQ8ZM
	gM9zvmjj9AB7yWG7cyBJSjPAPSTeaIbouc3zOcrw5UJvFVLif8faaaAcNmtn3iI92mybNgzHxQk
	Ecrr4B2BmRNPGrertjaMNkWiC6ggM1qPWw2IMgxK25iU307rqHMfZKlUPEq/TrhXaqQoNVz+8Ao
	CmnA4kueIwJT/K263BWsdN6MsxFkmla3BWEASRwcNk1A2lhgCapE/YzwNOqYs5EnNleIJ7nqosL
	naKlttXhqhHfr1ftb3yWEDtMg==
X-Received: by 2002:a05:600c:820d:b0:4a1:65d2:7912 with SMTP id 5b1f17b1804b1-4a18e47b302mr298262975e9.8.1791995234315;
        Wed, 14 Oct 2026 09:27:14 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaabc3sm13076890f8f.16.2026.10.14.09.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:27:14 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Jiaxi <Z1529105815@outlook.com>,
	Johan Hovold <johan@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: [PATCH 0/3] ASoC: qcom: qdsp6: report the position of a drained buffer
Date: Wed, 14 Oct 2026 19:26:59 +0300
Message-ID: <20261014162703.10172-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit a93dad6f4e6a ("ASoC: q6apm-dai: make use of
q6apm_get_hw_pointer") q6apm-dai reports one frame less than the
position of the last buffer the DSP returned, and commit 44432315444c
("ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer") did the same in
q6asm-dai. When the application stops feeding a playback stream, the
position never reaches appl_ptr: ALSA never sees the underrun, the
stream stays RUNNING without period interrupts, and drain ends on its
timeout with -EIO. On a OnePlus Pad 3 (SM8750) this left PipeWire's
PCM stuck for hours after a stall.

Patch 1 wraps the q6apm position to 0 at the end of the ring, as before
a93dad6f4e6a. Patch 2 resets the q6apm hw pointer on prepare, which
a93dad6f4e6a also stopped doing. Patch 3 is patch 1 for q6asm-dai.

Patches 1 and 2 are tested on SM8750 (numbers in patch 1). Patch 3 is
compile-tested only; a test on a Q6ASM board (RB3, RB5) and on x1e or
sc8280xp for patches 1 and 2 would be very welcome.

The RFC "ASoC: qcom: q6apm: correct PCM formats and error handling" by
Zhang Jiaxi [1] touches the same hw pointer, in graph_callback() (4/4
"recover PCM from failed data receipts"). The two do not conflict:
that series changes when the hw pointer is published, this one how it
is turned into a position and when it is reset, and that series
applies on top of this one on sound/for-next without conflicts.

The analysis, the patches and this text were drafted with an AI
assistant (Claude, see Assisted-by); I reviewed them and ran the tests
described in the patches.

[1] https://lore.kernel.org/r/SY5PR01MB10600B2BE812BAA1B0FA501B4A1932@SY5PR01MB10600.ausprd01.prod.outlook.com

Vladyslav Tymoshchuk (3):
  ASoC: qcom: q6apm-dai: wrap the position of a full ring to 0
  ASoC: qcom: q6apm: reset the hw pointer with the fragment queue
  ASoC: qcom: q6asm-dai: wrap the position of a full ring to 0

 sound/soc/qcom/qdsp6/q6apm-dai.c | 12 ++++++++----
 sound/soc/qcom/qdsp6/q6apm.c     |  1 +
 sound/soc/qcom/qdsp6/q6asm-dai.c |  7 +++----
 3 files changed, 12 insertions(+), 8 deletions(-)


base-commit: 8ef28aef33f2d5da6959ad6b579ec3cfccc009f6
-- 
2.43.0

