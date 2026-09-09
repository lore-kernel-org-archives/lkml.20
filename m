Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D923A5A0AB9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788989050; cv=none; b=syF+NvuMhYxgO8MoBzvsvMa6RmklkPuPwmd3vJoOKc4aCsCfcmF/wbNHZjhX6ZBVM1q4wAWpN62+wdYfrfUi1/1wv749T8Jlmoavrk7UbzySMFtoWJg51pynmjve4omC/nuEiV+tK2vVuyhuNmNCxHf4C5dY11ggnkxS3M/OwvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788989050; c=relaxed/simple;
	bh=FW5whXPmaXHA5LR2dz0E+orKk8rccpIOS+ct8eSwStQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gVFBXZMu5IiuNtKcdUx4pQarE9/WgLNZkPbx3gtrXnsoC8NdDPZ4pjDcLZOsiE6ybRvHPfICAR6B3e3AEwvr91YxXaNvBrxYppW0Obyb7s94uqnmJS/jdjbI2txfLtyAsIQEfftiJGooB5H4heWGDfheWNUZZ0sGFpM+SfCzQcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDwPXaaU; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDwPXaaU"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so630386f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788989040; x=1789593840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gVfR3lqxcmlEuRpdPzCYb7K9yNG7tXcy09eud1ICyVY=;
        b=dDwPXaaUK7kfUnq1x8ECKYYkdLWmGFUJcX4ulACHuXStbxTYgvB2vAhBjCvdCITKjG
         fuKGb7YqE6UXJxWY/zTRkR07lmCuX+GPfBqMkpLYaaU6nrBD0i/XSCxSVkWS5FivUSxj
         pTwbPXkPCHjw9joA3Yo3DqWm+64zBbPBz8TG9ZD2ETDq17cWn8Jvq9497kltuUutH8k0
         F15Paw6RbRjZZVdwvjQxe3lzp711x2ThykTLfjkG6GQORNg+WMYVR9BLEJQoUUKv4NzQ
         +b9+VJ4wqd9Llm27NOgk+nW8I5U57E84CQhg1EBjjoblCcpHi7qK4FOz5b+qJntnolbl
         I+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788989040; x=1789593840;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gVfR3lqxcmlEuRpdPzCYb7K9yNG7tXcy09eud1ICyVY=;
        b=pw41CtZ4qcD3NcsTVJeakBJRN+lpPsDNUl40xGHVNJk6WnDgfhiE9kBUkIc9JfjrUV
         wO6jiViT3EULOu3EjLlxD1a50tFAkiyG9gaRpgTbYVc1tw1xlvPm5Qdmx4j0ibJGAkY1
         DBohhHlEPb5xiY6FRJYlfe7e95ZWDwSVRSjT7n8H5rM55Y9Gr2BMG4/tbz8V7ELQvhPh
         tPs+4MzbNZcj3YW1yLbAw2H7X7+lZtuQsrnh0BVFkhCBe1fh+5ixdml8dMgm4ku3VQ/d
         PyW0WhIt4M5jqa4/aPJwYhd/4PzpdNRblcg7rTSueAvHHNieToF+UHMU+4oiwMWsKtBt
         rSxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzu71bS3GnZVo6BUBWRZ2+7DZD6EA4fQ43L8XQD/o49LgkOqnDT9GX74zcBDH114AxOJ2vBeqRQBkK1M+8=@vger.kernel.org
X-Gm-Message-State: AFuF++n2BzReCaKDRjNjVmz6QXhXQpRyBaI4y7ICTxYsoK9jwPcBnzwW
	VxIR0Z3BXEM1YszJJKnrm8KrtPURjvx2/30kOvFp52TVJBWTK+RXXAev
X-Gm-Gg: AYBFou2lE8LhOWx206kd1F37YpNUwDoGM/RWW1q+QXg7lqTwh8nz9U1D/eN0l8idGtO
	KKvMa1V5tiaFEexgp9gEJKGUkKKH2FWFWmqjz/vKZ3mNwVblJSaMaPvIjOOtIN0M42QuQlTgpv4
	V/dBVoVQEcqGTol0CL2pMue0zGfyXrSv1FbZyTCSByYyeDuFmDAZ+va3WXxWScMgfCvIqwQC6Dn
	cqvqEZ8llD/tu5gJvQwVVHZNBVEM/nRZvhofQLDy6kgHVpjv4EtHmm3N+O+SOJusbV4C3MA8Iz+
	kqo0WYvm8T4P4SpaeZyCAvH2Khzu+QqTwdfI/BNM04i6SwEvOILzXPnh8kuMyeK+KuZLDhCoh6O
	+qsBCCEUIqwI/4KBilaENiEZd19jxFwRmpyfEAmVCzXkAKAA/wnGJOVWsivV9KQXWFXSfmyyTGZ
	IyT0V779vQ2wVKUZYsBV6uFM+Bt4/5w3COQE73cOLvTTgNVQcRGJJzGiFovwlyOeKXQq1dhI9SP
	SEZmLJc8WLk6m8b7ERRJgvTNMN3dRbrcQTWXUrt1iAE6mlcycGcmFUH9XYr4+Uyw7HvmPIl7U6z
	Uf0pOt4vsFJiq5n85U8ghOKlwulKWqgjAOlQFOBsfGJ8sqIh2HyokqSlOYxDOaAcI4KwD06BbKS
	EBb7XDTpoBBpMEtmH
X-Received: by 2002:a05:6000:40dc:b0:485:ac96:7251 with SMTP id ffacd0b85a97d-485c23e5bbfmr7228249f8f.21.1788989039805;
        Wed, 09 Sep 2026 14:23:59 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm46967470f8f.34.2026.09.09.14.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:23:59 -0700 (PDT)
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
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: SOF: ipc3: bound firmware-supplied ext header size
Date: Thu, 10 Sep 2026 00:23:53 +0300
Message-ID: <20260909212353.69599-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ext_hdr->hdr.size comes straight from firmware and is used unchecked
as a read length: too large overflows the PAGE_SIZE heap allocation
in ext_data, too small underflows the size_t subtraction (hdr.size -
sizeof(*ext_hdr)), producing a read length near SIZE_MAX.

Bound hdr.size to [sizeof(*ext_hdr), PAGE_SIZE] before using it.

Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 sound/soc/sof/ipc3.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index 85bb22bbe18d..6188e43726e2 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -598,6 +598,14 @@ static int ipc3_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 offset)
 	ext_hdr = ext_data;
 
 	while (ext_hdr->hdr.cmd == SOF_IPC_FW_READY) {
+		/* bound hdr.size to avoid heap overflow/underflow */
+		if (ext_hdr->hdr.size < sizeof(*ext_hdr) ||
+		   ext_hdr->hdr.size > PAGE_SIZE) {
+			dev_err(sdev->dev, "invalid ext data size 0x%x\n",
+				ext_hdr->hdr.size);
+			ret = -EINVAL;
+			break;
+		}
 		/* read in ext structure */
 		snd_sof_dsp_block_read(sdev, SOF_FW_BLK_TYPE_SRAM,
 				       offset + sizeof(*ext_hdr),
-- 
2.53.0

