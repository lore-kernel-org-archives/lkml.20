Received: from mail-lr2-f11.google.com (mail-lr2-f11.google.com [74.125.230.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0114BD0EB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473981; cv=none; b=C0uX0ar0xuOqZg/TKdVpLc4N2VNvrRlfGTgGDUU5GgZHUNcmyt+h/O1d178ErP0lTv5iu9PrEItyvXjey/IPyMnua47Zdc920Ge6ZAbwy+uSqhj7S9tokoEhMbF+9I50WmiPB878t2vNXVMG6FAhf0/brQ2GD8Vprtn6KGsf0pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473981; c=relaxed/simple;
	bh=xLj+jM2KSSSCsF3YlCQPUNC8nNLiz+oGj3+E5AkfP+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pEGwU6VxbFB2vwD6fwz8v44b/c1+SrBt36M5l4RYw5rhyPr9vI3v1XR6n43iwbfhiqRFJS3iok0/HdRZDDDe/ekC45bFaZnQCLmJMoL87Ip7qq7U/Xf22+jjYYrFhJUe3Rk6U9NRxbgoJ7WWzIP5M7ZvXB3Lk2xSW4RC8G0II54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9nYBiQz; arc=none smtp.client-ip=74.125.230.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9nYBiQz"
Received: by mail-lr2-f11.google.com with SMTP id 38308e7fff4ca-3a49e9e7cd8so25932221fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473977; x=1790078777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WuLMGh0XOazeaknZ4mouWBM1qCV14oE/XC3P1nwDqwk=;
        b=C9nYBiQzQZtHErsA8fNyzbcIXDEE7wqFu5H1CBf+6EAPtNYFvUEv4jZORiWChpO8DH
         WEhmuHOj8hd0m6OdpnK4YRFkB02wrxJvc5KaX8j8dNhRMvcLX70wi3N1esKWmsVulF/9
         ysfuea5FV8WcoUE1FQToLUC+6wSIknHHwex9mhI9o94wgRsDI2TW8Qy7I4LxktLHL3aQ
         IdaaIIv9YrQIoUYLzjSvJ22Y77eTM6beExg0CKzPmxyHWQ3b+ScYwxVON3IdwW8tcWND
         SqtYgn9WyogFju6xT4CdTh+v2AMd8wBL+6wczURhc0E1qX5oHk/eEbAFe3mP5HiWNrPK
         gEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473977; x=1790078777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WuLMGh0XOazeaknZ4mouWBM1qCV14oE/XC3P1nwDqwk=;
        b=WzB0ATVp/Txpa/stTUEKgGhNxrZF8cOXMei2vi5iOK3T1lgU/MkQZ1KETcQnAmGCoS
         UI35yeXc5CmcjRAzrCT7ANZcgeo4MZ2geTgqVOZakl2WRyfZUS/y8ApIZ4YxC6jfduB8
         lIaspFC8HMizyaFqE5zaulfDbRGZgNQe7p6gKVeUCaGDS/13ZMr1UlvZcKh6DZrMbO+V
         cOgK5xWo3BCoxoBJqTameTPWIVBuryIHI8qIJOXk/cQHDgK0qXtGc72iIXCUopd4vYvw
         GUjhXVgmmIaQvDLNTjHpW96VkZn/lnFMw52ld/cjjnhCfeXk3mYicihLeGDAlulzUwXP
         N5gA==
X-Forwarded-Encrypted: i=1; AKwUvBwX2bbs1Lv/kVhyfF1teLRmQNF2fJJCSqARIGXeuCq8Nak+O/vm41FMpbi35VtHkMqEzRz+aDjJTHMvIZ8=@vger.kernel.org
X-Gm-Message-State: AFuF++m4Rih4oeQpQ5iD2Tk5fJbR+6nwgsV98XQTr4gCQSoXFWSSzN1Y
	VBlsSgW/bdkiYR8knlFZ7uZF8YQaKlQ+cEX5Y5PUj1EoeQS6LWO5LuKA
X-Gm-Gg: AYBFou0sYzTGEt+iEM1M3ZBLLChlHhfp+m5ZGyny3JrZjzyFZukjLVpJzOlftq/vTv+
	JsDLaAQvuhIUg1SQRNkxROQcuUhZO3xy6tNpilIArsnJYi8emXdMJeIJbHhYbi4c7mvOIXPomCZ
	m9a4C9V9By73RvU1/YD5wLqQYeRkEbN9mY5A5t9V43GBd00EkA8Z0EWxCs4Kvaj79THFS1wfKlM
	rCsDizViPKPmZgLcaj4y16iaHCvBhq8tsWwvE0hI8vrq7/r1fLeQpK2wIWptl8skpESIJSotBSt
	77dWCrzai3vQVxx8VA9YOg1cwhTMS84NRDpQWlM3MXUFmek+7yRsw3LrKlpFmkkpGbCJNmH1QNc
	dBq+ev4pzdYTWYtTtphIqA6R97n7AWZRaZsRk4v1Pu/pof8nya6TpwQJ5neWhaEoR4J4macVFM0
	8cE3sgM5cTxYHtIb5AarO7TbVPLTtB5nvXS/7m1oWx141FkYGDf6phCSu/30AtfkjAQ6Ztkj93m
	g2SwGr9OnroCji/TEsr0jmBZ2I=
X-Received: by 2002:a05:6512:1052:b0:5b6:1a7c:fd98 with SMTP id 2adb3069b0e04-5b8b4fd5a9bmr186841e87.62.1789473976400;
        Tue, 15 Sep 2026 05:06:16 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047fd4fsm3186416e87.82.2026.09.15.05.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:06:15 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Koichiro Den <den@valinux.co.jp>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 5.10] dmaengine: dw-edma-pcie: Reject devices without driver data
Date: Tue, 15 Sep 2026 15:05:56 +0300
Message-ID: <20260915120559.106666-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Koichiro Den <den@valinux.co.jp>

commit 11d7cfe0c119691b2dafbb699bbca90258c678aa upstream.

dw_edma_pcie_probe() treats the PCI device ID driver_data as the
template for the controller layout and copies it unconditionally. A
device bound dynamically via sysfs can match the driver without that
data, which leads to a NULL pointer dereference.

Reject such matches before enabling the device.

Fixes: 41aaff2a2ac0 ("dmaengine: Add Synopsys eDMA IP PCIe glue-logic")
Signed-off-by: Koichiro Den <den@valinux.co.jp>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Link: https://patch.msgid.link/20260521142153.2957432-3-den@valinux.co.jp
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2026-72147

 drivers/dma/dw-edma/dw-edma-pcie.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 987ede1087dd..95d60feca391 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -104,6 +104,9 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 	struct dw_edma *dw;
 	int i, mask;
 
+	if (!pdata)
+		return -ENODEV;
+
 	/* Enable PCI device */
 	err = pcim_enable_device(pdev);
 	if (err) {
-- 
2.53.0

