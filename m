Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DA15921F1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887269; cv=none; b=H1Nem3lSSAKijbIyNLAlAvRVKfe/SQZQy5j+I6JkprgMnfky5ylCmEfz6xBBsvjADAVyyQI/XCibfDrl5TTOIIglJEuO+oZ5tsiWL1/Z4wHKnCtH27JOGkl4zV0332Th4KQpDZe/QIR1sJqnZi374AKYSXJ46rill5LSUaYY1Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887269; c=relaxed/simple;
	bh=dVKIiNAEgVbAcUmEZV6u+JTcPDwaNXloRQ0M0HcerBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AYu4vcKrXOHuJF58EI00LXMYDMVl9p+Qg0hKU/6G0x9pRdEal+29oo7p6EmQElIS3T/16Ez6WSTvRmcwZqopiZcA7mTLg9XI91VV6lEOVgXUlklekVVPrvh1lTVW9zx6jl9uKyszSnODkRdWlkmnNi1l13TWpFITNoMpEOYLCm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KE5+0h/x; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KE5+0h/x"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so673865e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788887265; x=1789492065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMGCVsS43Or0QvhvusoStvupM2eWy3k0/84tq8T1pu0=;
        b=KE5+0h/xg2nIeR0racTO0uBPAclzV6M5seTz+/krE9UjKk6jtj+OEbBBn09mQcWpW9
         9Kzq2IDufE+2fEGmJ1nLeRA6Ea9co4nkz2+/j/0VK00tvWNaxPv47TAwAjL1YcxIsvgb
         4fU/JTNWv485v+qYrOj94l4MiQNmVXrLrc3pneUvFY+WqUw0tiTlwXP2+2dPREIPRNQI
         3vn9ULVI7XN+TTJqAj9tg5mqFZWPRchVxp2pbDVndlcEgcpPjPrqimIu3rddODNEbHlw
         TX4ncPcVssjn5Z+XIdSCYoU3v8xbZ3rjEpGBse6ikpe5tJJZRHFKHuPN6b1WE34w6DZu
         3jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887265; x=1789492065;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BMGCVsS43Or0QvhvusoStvupM2eWy3k0/84tq8T1pu0=;
        b=EUJnyYC0eyL8r5dsEkXzQ6AeSjQqlH8dl1Y6iVsJDzLx9gfENw/rM/nxNT+isEThHa
         q5iPKcWycEPjbk32BjoEVOvD72kNK2GN1XvWizJosTXPZtJ5Lhh/saEPikYEgZM1FKla
         zPKNiQKXWoHFPSxl2Jcr2OssRn+o294gm84y+kem8X9gO1jamql3uPQbNTqlUt+MhdS1
         Td/N2G1sVp73nrwWQvkfKSgZajNYoPU+Y04ArGmF9RLtJvALFv1HjQ0X2+Iy1GrZmIvQ
         YM5zbQelfPnZrqkKZwLTiyCU7xw6HbvmNPsx1/Ndv+oNzkGIQr9ZPE4Yr1f+xn5rta9u
         DknQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAnfJfFtsZnon6bDSvAlcMv+uK47KmpsuNWQ8OE0r/4h8yru8byGdRliwPLFffnn5roak06xgEQ9znzRY=@vger.kernel.org
X-Gm-Message-State: AFuF++lk1+lbW+q0dn1k3zWV0Fid3eGZz+T9tCD1qPjvG2q/3YP8wQ/U
	cz6WpsRlSNMvnJ9vsmZeB/2B6xmVbon08SbqW38rQwbsWwLappRGaTgH
X-Gm-Gg: AYBFou2I5qvC5ULaFApqZ1bQQ1Qb2vdCzWqL8EVM776JIscJ1Xt8NoxTsNNV2VxzaVh
	hTd4QI8KOgjhISXttage6ukxAdqnK+do9+sib2My2jYjVi+XNHbJrj7/bANdVjckxdGRLDHYS2X
	m8+Fkoaa49jcLl3+DOBxuAVUnznPs0FejyDlG3F1g0SrkqHknUkWaN/2VyornOpHVD754UvK7nY
	o1dFY8H62FUxSkL1EzSbJdnO3yagJ8MLDi7763JpHl6V0EaRsCLsZitwaQgW2Iav/k8p+F3jYu1
	xsOqmpFWvp5gx6zLEYk2QZTmWtavi3g4F9c1DuNiyg/4LRI3K5/4Hg6G20bttWWDiGnjxUxFNsg
	s+H3r9uJ/zWQO4P/ODrtx9bNIg45HPMaRM4A01YHjqRHpKuj/9Krxuxzy104PP2Sxy1BZX0Mny4
	vzlIAvHnaHOdNmKpNuw3er2YmO2GS8UR8yKP2Zljd5EFTbSKjMfBEliIth42TeZUeLg+H9Wleef
	vV7MUUq76+ineevGRUJZ/hjoXMVF+4OZv0O+7PlJtouOSH7HQuu5q8UFsnsttvx2m5R4mwiXa8w
	FXGA/RcipjZxpWp8Uaekjso4ivHDcFjUnQZTUZXhm0Kafg/G3BcYLiMrK7TNegeAC10Cneo9xmk
	aETK50Q==
X-Received: by 2002:a05:600c:3f05:b0:49c:e1f1:3dd5 with SMTP id 5b1f17b1804b1-49d1f223e83mr13800115e9.4.1788887264353;
        Tue, 08 Sep 2026 10:07:44 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm304804615e9.4.2026.09.08.10.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:07:44 -0700 (PDT)
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
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump
Date: Tue,  8 Sep 2026 20:07:40 +0300
Message-ID: <20260908170740.276800-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
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

