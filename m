Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318FD397B09
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985785; cv=none; b=qpsOxjUdSd30JsfpVMNEFS6o7GBS3OhMk82fu3RGx8yOx6uHJSF7elTkzuMlTIp0YBr0fcgElxbpeUWHBYbRvLR19Xp/Qde1hIP1/OTTWCJ+HFpiprNMr9g5Ak6reb9C1bBva4a+WY4LFcwtRA2ojw0fXyrW9lzTtXCqd7bZpf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985785; c=relaxed/simple;
	bh=n2O3OIrAFdMmFr0yu/uaSut1SXnpXWM1clMCDkvIz4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X/jfGhGkLEStxsT1MdVz2tkvymhsDJN8KXylzUdlkJ8ZGm/QaWd3/38f67vOnVB3ODQ7+3yr5X2KJwFLeCyAWokfaDWOZ39bmm3/akQRWcYbSXNV2TRmoDcLWNMcRQabrC0Kdatpk4M1PHKjpN2dHATcMFVdaiyckXOQaTJ2xEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJZ/KFx4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJZ/KFx4"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4956869750eso56175595e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985779; x=1789590579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qckaQ07GIjAycth+WTbJjXIHu8VJsW0kggwIpsbAbME=;
        b=TJZ/KFx44v+UViRzLR0kAbzUjkD34nLHd7nh7cjoz2P4FUsNjpjtrcwIfrE8ne+UVy
         AZp+n0hjllq7BK0rP2Us/OFfd8ShsVCDVFGUKxYtDOVuQe0NholSuwuRLjugwYcRiq6Z
         7ra/84LU7ycnAewMBOfuFxjjgB/VHk+j4KqmpzMShX8e/TZbyU9lTNe14/B0o+uxPgCr
         MPzZ7rd17jAF4i9DiMuQwL0wpPg5MhZy3qE0JEraB2LM6CYHwqcE2/H0nGslrPfYAwzO
         szCktNIMZ69atida+RWdfFNbfEcqZPfOPg8H39i0fy0b9xd5u9TVMBLhgNXmqAElDtoE
         /O1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985779; x=1789590579;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qckaQ07GIjAycth+WTbJjXIHu8VJsW0kggwIpsbAbME=;
        b=CBcPFfmVp0N2Uy3R58D0gb5MEHMPUgpe2i70GKqqks9MVerw5fxO9Kp7es5JqLeZEg
         NI78s8l8WG97Zc2GNNAYeA0iZzT67zaLo9IZ0XYvWHjtE11VHHhsqv2FdDnE3ofWVd9v
         t7DpYxdGmc/RvvvEK8xmvQ1gVzX/WhTlIQRC/AYV6nwE5hWpOiwJYG6fAMB1sQMltqAP
         zDByFeeNEtapgyfICTvlo/g5EFM24xLbQA852Q6DYZAs8i6V0xHR8KzmxhHVt/CPKHhC
         Apb4RMNRfAH7pfd0+EcxNhqXWLMQ98NTVjPC5Nm+u873ZW6vANX/FYBeRwavz/SkMf/f
         tssA==
X-Forwarded-Encrypted: i=1; AKwUvByCRHR0QC3R1rXg/RBJrJOYdjz+2kX0kYiCbpMMxkHSGwkFzATlXiknYzG9IxyHgDDYjlUfmsbpMJW1uV8=@vger.kernel.org
X-Gm-Message-State: AFuF++k26UYiVLuxcUafj9JP7dvzy/+CutqN/eHEnbs4qfbTCB47OmDf
	J+lDnZF8GgzyIp7lo3eUCCvMtNdrlyh6qY9+jEZGbRe+5V/GuOBClnjo
X-Gm-Gg: AYBFou1+0WdILGNOTmH6dN54rgCe2Vg7ZLxtBxPauHLhD+qg0/iwStEs4d4q17B+3vB
	1BtkXSwGjXLmkwkdl5Oy8wpX3z9Bn1Iu0HHJNvH4qdAFQD7HAfMthAxmuFxdje0AIq3S1ADN4cs
	+lDrntea3Ewo43q/bv7VPieGtViGfm4EFGEaK+WAZW5BoITAiaOGbR7np6CvneuoPvwPY5zPheJ
	qY6tDDmbtbKYMGATm2xRgkCn8iJKIRuDR5qfIwE/Fb7c/ldu0ZsszBd9sg06nBbvA31vnZ1XY5/
	6VJ3COxt58DeW3RZJnK3kuFeMW7nuRfHGoUKghoZ1JuMMi9JcagAzOaCfOZQeHfy2dEDzMkLtMz
	6MgBzxCFXO3UMDIEX1ZOQ+MPFhhQP8KczN7V3H7Y7onMPPXsc75VO3HTUG9NXo7kfWzfNjpx4Ie
	jrO+jAHq8GROd0ReySjfRl7gpCBqAcBYr5Tc8hX4KiHSoVqJ39dVNBoYeX5jBvZ4+sUxCUMOWI0
	/gqUCAbOyyzzKmweBYKkSRd+yrCEcaxKo8uxV1QRj0Vn8kkntMfJXMsWzc/BvVOSBLSx6e0F+n2
	YZncA1cb1NCf4Ktk8+o0AFGY9aSDsFthjpsoQ0eetDX3uqainyou/yscmi5G9XNJ/v7mOjQoMEE
	bgSjv+JUoFnCEnwYo
X-Received: by 2002:a05:600c:628b:b0:49d:2856:fcf6 with SMTP id 5b1f17b1804b1-49d2856fe91mr2796585e9.15.1788985778747;
        Wed, 09 Sep 2026 13:29:38 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26b7332asm16723565e9.0.2026.09.09.13.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:29:38 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH v2 0/2] ASoC: SOF: xtensa: prevent stack OOB read on DSP panic
Date: Wed,  9 Sep 2026 23:29:31 +0300
Message-ID: <20260909202934.37644-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes a stack out-of-bounds read affecting all platforms
that dump DSP oops/panic info via sof_print_oops_and_stack() (i.MX,
AMD, Intel atom/bdw/hda-dsp, MediaTek).

Commit 58bb5081cba1 ("ASoC: SOF: Xtensa: dump ar registers to restore
call stack") added a loop that walks the flexible array member ar[]
in struct sof_ipc_dsp_oops_xtensa, using plat_hdr.numaregs (a
firmware-supplied, unbounded count) as the element count. This only
works correctly for callers that allocate room for ar[], such as the
Intel IPC4 path. The IPC3 callers listed below allocate xoops on the
stack with no room for ar[], and were not updated when the loop was
added, so numaregs walks past the buffer.

Patch 1/2 fixes the i.MX handler (previously sent standalone; this v2
includes it in the series after an automated review pass flagged the
same pattern in five other handlers).

Patch 2/2 applies the identical fix to amd_get_registers(),
atom_get_registers(), bdw_get_registers(), hda_dsp_get_registers()
and mtk_adsp_get_registers().

Ștefan Ghețu (2):
  ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump
  ASoC: SOF: Prevent stack OOB read in the remaining DSP panic dumps

 sound/soc/sof/amd/acp-common.c           | 1 +
 sound/soc/sof/imx/imx-common.c           | 1 +
 sound/soc/sof/intel/atom.c               | 1 +
 sound/soc/sof/intel/bdw.c                | 1 +
 sound/soc/sof/intel/hda-dsp.c            | 1 +
 sound/soc/sof/mediatek/mtk-adsp-common.c | 1 +
 6 files changed, 6 insertions(+)

-- 
2.53.0

