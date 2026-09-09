Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847B358598F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986473; cv=none; b=oQgqOlpNPKuf6O0MbW3WWicMJqa1gcpaC417IWFcgBCO7sVukwxDXuhQ9eWOsB88CNgWg/2aaTBE2HWh5RkJx4KQlUucHtUj4OlX7+cwgDYzC9+QQuAlm3BUWHswWrHkMN7sG9EixOc8zhdYTYGx7RJTnh76T2kPbK48TLtRJJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986473; c=relaxed/simple;
	bh=dVKIiNAEgVbAcUmEZV6u+JTcPDwaNXloRQ0M0HcerBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IJYbeXo/HY+i+QJotsnSxRM+FPuX06vjAhpZ07H+1RxPK2zwNKCuXc31zJD7Tszxt5ol4C2jc47C5utlb5lMpDXPAhAUt3j9hQTQtHNmett2L0VppONJOsbA47CZTUQrC0hBO0JCj8dKORq7Oi6Ojmph9RRK+5IM4tiYNp35mBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n8xP1iDM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n8xP1iDM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so9414625e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986451; x=1789591251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BMGCVsS43Or0QvhvusoStvupM2eWy3k0/84tq8T1pu0=;
        b=n8xP1iDMRj8LCqfLe/W0QVzRI9T+A4T+YmnXRgi5ny6Dzmw3A7a7BXPiPR/0A5kdIl
         94nlY+hOTZNyDZKaCvSwOvU9nwOWMnBvq9ZmU3N7dObmEyqtx2F7+DjAGsT9OEUhABke
         tntIxCRQw8RaYh/n+qqVNqEImKb59naDYccPCvdSjsNJuc4+TqAgpWZQU3Nc/WMLJ/mc
         27g7Y9TV61N5g/k1oHEWKDmvcCivR2hWJzfTA75jzHZOzu52CdgNpzLmSp0QKiTpQsRd
         rls4qbFNTkL0nv834NeMhaEUOhZOSlOFgcg6515/YfzYJHICBZ57hnCNhhoYQrK/l7u6
         RazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986451; x=1789591251;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMGCVsS43Or0QvhvusoStvupM2eWy3k0/84tq8T1pu0=;
        b=hXPu/QJfXv6eRJNXL1Qv+JuwCjl6kUrxqGrq955XCXVhIKBjX5z5UwZ6J46Yj06Bmr
         TfJ2nvIlboxEjMpNO7McW8ROYG/LyOIgwfwN87y15dz/9u+kHLQuYVrUzZqmGCHRMRvJ
         Ny7wrRwN3vuELyp+7f/MtVZtNB7dyaMXJG5GXXraH2BjOJNwcx1wZAtXZsoQbmY64kH6
         uN6Mxo9EWVISK5CnMJ0Q84vWTS77ofrvBytDr1K+3qnQVEJWV+uM3+yP/1AM8dcavDtC
         VbZxLgNnh4haIPHWzNmVl1X335McnSU0bvmL2/BduUo9RGTIX9VIJE4l7KaM/gafujvY
         ru7w==
X-Forwarded-Encrypted: i=1; AKwUvBzeaGMHNgyHQ6v8E2K+flARVHsLPDv/uWofEhu62auMsUfbEVChB5gqHDrSseCMu5wlqOP7V4+ScQ7iEJA=@vger.kernel.org
X-Gm-Message-State: AFuF++les31sHdA/EHc6xccWMe/M7u4COoYQDovexbXcx4irouWnMFl/
	EyMGhzu8zudjdsaWRG3yTaLM4tzNAuvaAxPd0Z6794QKQanBvY+amUY/
X-Gm-Gg: AYBFou2FdVMvcqb/Q3GA5ctqeUBEUlLe+LHU5Jz8Il4ho6PBJEiTOus8CiiyuqmHBfY
	t/j3VdhC1ht74458Oe8ZFiZaSH/X0VUGdS9jCi0KcUR/4WD2REnX5C3iP68DxkQ3CxV9aLlt4to
	cUCB2k/DhMlccVonNKln9oKhfWrgxescLderMb+mgVDP2oq7JC2ZIrmiP3UkrzRdkVSZlYxhMgB
	sbl7AogiaPLTuWUQ8oF+6ivBBQu6ItORiK4zlPDGcdCZI9b31ezgiG2pPeHFQBCeqE6tb+WcQmD
	DmkEmAv66/aibSRrPr7ZPnbzM4G2edGP0VYm3d5N9HCvGbs2BNFRVZU0YYYK/AyT8SEXLZPbLD4
	sMM15DH50n04yUcbzECSoIN3Xyy/wWltjEgVge48HK4cERGbovWdfxqe/y3bbp7WuYMmM5QeRun
	xgqAlrOJl/+h5/UOvXkfVFffJLnw6OdQG2iQWhludhcob3IzRSVWMt8Cv1cOjTXl/WaIYCqvCTj
	vvhqmgd40tc2ILcjQ3xFyWahmWLVdv/iH25wj9mOo+sy9WmD0wpS3pyjKAVbW0Emw0zaZGg9hWn
	2iHgl8dYVBbwougJxYjiaAy40r0lTz0AisZLZyauUP7y4opmJwCm/DMNUmBtropu4A1k7bXcgwV
	FwtFFkf+wBTXGISYz
X-Received: by 2002:a05:600c:34c9:b0:49d:1deb:a629 with SMTP id 5b1f17b1804b1-49d1f21ae8dmr155804825e9.2.1788986450686;
        Wed, 09 Sep 2026 13:40:50 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c437besm17171315e9.11.2026.09.09.13.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:40:50 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump
Date: Wed,  9 Sep 2026 23:40:42 +0300
Message-ID: <20260909204042.46656-2-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909204042.46656-1-stefanghetu9@gmail.com>
References: <20260909204042.46656-1-stefanghetu9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 58bb5081cba1 ("ASoC: SOF: Xtensa: dump ar registers to restore
call stack") added a shared Xtensa helper that iterates over a flexible
array of AR registers (`ar[]`) controlled by `plat_hdr.numaregs`.

While Intel IPC4 allocates dynamic storage for the AR block, the i.MX
IPC3 path reads the oops message into a stack-allocated struct without
backing storage for `ar[]`, while leaving `numaregs` unvalidated. This
causes a stack out-of-bounds read when printing a DSP panic.

Clear `numaregs` to 0 on i.MX since the AR block is not fetched or
supported on this platform, preventing unsafe out-of-bounds memory
accesses in the shared Xtensa helper.

Fixes: 58bb5081cba1 ("ASoC: SOF: Xtensa: dump ar registers to restore call stack")
Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 sound/soc/sof/imx/imx-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 7a03c8cc5dd4..436fe49246ba 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -34,6 +34,7 @@ void imx8_get_registers(struct snd_sof_dev *sdev,
 
 	/* first read registers */
 	sof_mailbox_read(sdev, offset, xoops, sizeof(*xoops));
+	xoops->plat_hdr.numaregs = 0;
 
 	/* then get panic info */
 	if (xoops->arch_hdr.totalsize > EXCEPT_MAX_HDR_SIZE) {
-- 
2.53.0

