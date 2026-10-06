Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06E646E007
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304582; cv=none; b=hyUdq3uSx1DZhot8KjyNrnuXCKe3AKC9be3+aSnVxsQ30ZbCe9+xSnmKiBlX4GWea+U2WbhmRKrY3rffa7udyEzdTKsAJrGhjHqVuIwIGpPj12uegRU+lzibAb94wgP30L+ln4pHkAUwf2kdMIkLTQCvpyq1PdeRcZ/NGjxnbgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304582; c=relaxed/simple;
	bh=yDsaL9pf0Tb7yeaW7R0lXUvADbUkuAEMy7ZzrDm4dlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fGEAOkVkSX9RZ/ZrP3CaPqBrZqd7IKmtoy8RuFdweEFBxPBavRydIMmmlRVg+YteiW2z8TUD8qrTluH3kws8cRIStQXt+knuSwcvwqoeXryUuaD1tyCebCuJ2krsn9AY87GXJGMBjKuGI7wu9/r/zT0JXJOLOyXhjTzsGDUy24Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkKHEtFd; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkKHEtFd"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e4a61a2fa4so9927735ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791304580; x=1791909380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=foeiVoYiYuznXO4eJpvG+c8b8Xx79Qdyfmqi22YhLmg=;
        b=ZkKHEtFdEE9abBI2OBrHRWfqhKt/2DYKU6i0NHt0p+1FX58qK0byf6Wm/K2bx1rggH
         ke8QUU3pFgu0F9hjfvudU14TD2eqhH9a480Epeq/Tb2SZFMg3SAV5lk7L3SM8+dCQ/6V
         J7E6myQ9fH53od2wdrPHJ9Iqi03ohmcGyqqQcTkJuEMVXteKOSab0eVURs+VhXprIQmr
         FZnHih63qKt05YeTjPac9aq3BH+qbj/7zqfFKmxsrSMGBsao2wJ63bdZaG37H025JSa1
         SLK9pd7ANhAEOQRr/VA/ZdMyxB6EbLB9EB4hKXoZ4o+Kb4mimyrfXvAmuG4P14POO19l
         8YnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304580; x=1791909380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=foeiVoYiYuznXO4eJpvG+c8b8Xx79Qdyfmqi22YhLmg=;
        b=ES518WHIMJMNPiEOaKqeBrfuO9Cex/GsGv6XoVZK/vo8zSJsiEBo1n91u6G+zDEYhV
         ZFJGJzl5rlrIHc78FiUxFIcpLORY6JXssV+x98GgQlCxSDD7MQzCVExvbRlrWp14FCc4
         82gEYqO1iXbXcHz4DR/PcK4AG/nre168cz37YIHHKNQl8x41ESC9MPrKoE8gWsrho44M
         ZOCsk59b1bz5mzwS+mUHtx6yVEexxMBZI0qwHSLjA8rLLHM+N2zZ36+4KGhhPZr5l0ar
         +/3BCOepbful7eUmzGpiWvP2Pfiu56lEbYCb3FgiHp7lJaIf2CtuO5waf26Itf8zSO7+
         HCcw==
X-Forwarded-Encrypted: i=1; AKwUvBxJgF58ALZYOWRjvyNO/iXYQdP/ArVgJzDydD5rJM53uULNXhB20hGTAzo7g69y/t/kzYYTbUNTYHikk70=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzDrI2A+uUiHqM7kGDb3QiYlmKqM4gHAsXno0G94gV2d/dBRxz
	4us0JdMdDKFuSevfwVk04xQ/Ih2fb07LRpb2ByrUKreyF32SFiLDiNcS
X-Gm-Gg: AYBFou3A5YXTVn4bfBFeGAZnInSFz1XIWjvI4mLfk6j5DD2VHb367rUgoVNm/Bj71Sk
	sby/HCrGyIQjkjrLaXeNttok+iFkkMEGpKiPfIKkDQyQ9Igl6Pe9kFWvSEYO8y6UQ+VOCbrUa13
	FsBkna1EbLco6BGVxWLIM1hts/5onvUGvKoAmqUFTofNUTJl/OUmpPh6KThyUvk62GCG93ieNlj
	3EEjAElVA3kM+yvg3HecSollfC5jIr11FshrivmVAiPP+gXHl9tDdcTDlSuJvMMahrp5sHit3Bd
	3jGzj6gGpK2afbI+Ff2+Fd2V5DlBzpTSNncnyCKb5lDPvoiGW0asZkx0AthjvMJI5+T2aGmyhty
	g71j/amOQTggTRjKRG6vq0KttILhjc+r5aR+QEpsOFTYIVj4WV6ffk7szncploP9fpH96qeb002
	aIBx+EcxBRq/5zHt7kBOm4XLKZykVOc/oSzg0xtucvsu5vjOoiu9uXTTOQxsIwztHVg4Ej5A8aE
	HkSqoTUvSM1mfrMD0pwtyLntvuQ9hQmh61hQ0g=
X-Received: by 2002:a17:902:d542:b0:2dd:c100:942e with SMTP id d9443c01a7336-2e60053cc18mr111375ad.44.1791304579856;
        Tue, 06 Oct 2026 09:36:19 -0700 (PDT)
Received: from arch.localdomain ([1.187.69.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5ff91eb86sm388445ad.80.2026.10.06.09.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:36:19 -0700 (PDT)
From: Mahesh Saran <maheshsaran477@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	emery.hsin@mediatek.com,
	linux-kernel@vger.kernel.org,
	Mahesh Saran <maheshsaran477@gmail.com>
Subject: [PATCH] wifi: mt76: mt7921: clear WM2 from MT7902 RX all_complete_mask
Date: Tue,  6 Oct 2026 22:05:53 +0530
Message-ID: <20261006163553.11193-1-maheshsaran477@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MT7902 does not have an MCU_WA ring and sets wm2_complete_mask to 0.
However, commit 83c65e82e5b2 ("wifi: mt76: connac2: apply new rx
all_complete_mask") populated all_complete_mask in the shared irq_map
template with MT_INT_RX_DONE_ALL, which includes MT_INT_RX_DONE_WM2.

Because MT7902 duplicates irq_map but only clears wm2_complete_mask,
its all_complete_mask still contains MT_INT_RX_DONE_WM2. This leaves
the MT7902 RX interrupt configuration inconsistent: the aggregate RX
completion mask includes WM2 even though the corresponding RX queue is
not present on MT7902.

Clear MT_INT_RX_DONE_WM2 from all_complete_mask for MT7902 as well.

Fixes: 83c65e82e5b2 ("wifi: mt76: connac2: apply new rx all_complete_mask")
Signed-off-by: Mahesh Saran <maheshsaran477@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 56a914aaa81e..f87c44f2a8b6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -375,6 +375,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 		}
 
 		map->rx.wm2_complete_mask = 0;
+		map->rx.all_complete_mask &= ~MT_INT_RX_DONE_WM2;
 		dev->irq_map = map;
 	}
 

base-commit: 69f80fef3153299d9c72c53d1d71eef6354b6926
-- 
2.55.0

