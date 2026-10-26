Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008673;
	b=VwyKWNF79EHriSHyHMlSvcz+xzPNd9tjB3R+B5rvE07qVrMdmmt0fOPKooKAJIDkOq6M
	 G61oPzwdsGccvzlJjGoVUVgrJad9M8t1XRBWOdcl90ctpUOlANoepKk4USRnx/lDqhPuM
	 QYUtxhIAQD12Br7mUqKxurASF6Cm5UaBxLMhqNe/j6/j4hShS453NM4nrp0kTozRIfYXc
	 sy6isk3J3Z5yObflycOpsflViM4y7DbGyfjlTHtObC6hnjpg4dvapPLlT1FbzQbWQcyFr
	 53O42C2SmMuss9UFHqLG/TvWXLGRnaBx1DVUnhUsBPuF+xXH9tEmkG9oV0hiPzqK4GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TRb4tYcOuZPVhYjPWbt4D3gJvCANnKN9gzX1O8Pld2Y=;
	b=0gsNEmo8QTXq+4MuVHZQJWme0ZEIjEg1PI/b3wpi+EbjE8z9/MfAJe7v2Fs0cVqL5kpn
	 MW/fCrFVe1fDmXn3xwlvUT5tboS+k/nSJmrphJjSQujdItOg3a1/LJUlYqb1Il3XcZU09
	 eoZ1QQrYrlN13D4yG6G6Y0HyIJf3Oc91bC8HeQgNQN4lvUiaaSrQPaGQz5ySJTiPxpEhI
	 aeJ/JmmKwAUoqn2SL0AEe6onoYMtOuDppFd/HcF4Gt4hnN6elISwx0S2vqeE8l16S13eP
	 QLXid9Fiix/PlwOPFCVDwaXTb317MWr26jd3eAOS4vTeb+2JSLuFltRiaL2m+BinRGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f4t4I0Dw;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB2E606A9EC
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FB2E606A9EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f4t4I0Dw
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06c60065fso2054050b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008673; x=1793613473; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TRb4tYcOuZPVhYjPWbt4D3gJvCANnKN9gzX1O8Pld2Y=;
        b=f4t4I0DwTnQhTb8wMngRE7s1DR8eNQfR5qcKuOPB7B6AYY4M+/5iOkNp0xudpDx9u0
         tbMowONYmevEJXoRerwi+6pQniiLt/UdOG0SwoiUd6mos1bham8RseN8oMdb6vbQMHET
         9yWPu0LK5BaXjkOWV//rWhwRX1ukcdzL50CCMy3Rw/QTOk9xNAWDofvAaEbETxmC2c+V
         Sn2jT5U71rWFcvf4SOEU7y87wyrEk4ZZmxHpADd38ITmcWF6TC5gyOQ4Onl+8nsP3gDK
         LzL08BK3+OBdVksWlDyTnJwjE6C2QIL4DX+gtOqMNKP6m4xvhNtwdK97W5/ywYyZA2RD
         AEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008673; x=1793613473;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TRb4tYcOuZPVhYjPWbt4D3gJvCANnKN9gzX1O8Pld2Y=;
        b=LkM7MKLW5hnWt8C09zQjVvkWBk+DVkMuMG/51ArJuTPqmWqiiZd0TJkeQx+IUKH2e4
         myxAhvskIK7dfBJCb3Pf82bIdheJPkJWoiAccUpjng9m/JDKDZbxJyvu08JuuV+YQVvy
         TZszm3mLUJwoPjG2djiz7EcVHZF356ibQ18/MfkBoMuZir5knZtGWlJZRBMhPHRkIzx6
         NuDoa1OqVAazv4KpkvRq7IUXBGBDJ6xNsEGznIYH7j40aNVEDie0bxyWc8k9SXEvkTda
         e/Ay49WcSmZPb2P+7pLjyIDq4MF5htf+pxq045CDxiXE7afEkX3f+iqn07Lm6UCH3uAE
         kkiA==
X-Forwarded-Encrypted: i=1; AKwUvByCVARFCxgGjoQ++cnitFQ6TLu3TkoyFiDiR/HBM5fZamXNIlinXsFKp3k4B9TcY5m8Zh7x+jtxsomho8o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIfr5msChqclZGFqwPveoqfWFoUIagnTOPD2n7p4Dv5D5YDyht
	wbv3MSnj3PedOGVzKA2zOcPBvZ98nMczZtK/ZkxuMqmqUDADwNQBiCGd
X-Gm-Gg: AYBFou0Fg595MOrUJgx8c0bI9rELtpyR3J6IKyWLlMqm75//gUBAtwuYnlDL40Fvwdm
	H9fZGviH6OAr178h3atCi3ScfOB2kxNRdrze6/JU+YJ/VcKtKrEYdFvPbB7nxWZSCNvinMyHU06
	nnUuD+BfxLJqwk0Tq9yCqGrT8dkz1ETxRSdrfJfYKa8Q3mAc66xqDRNxrM27hO569LQSaXseKse
	LO8gJ71mISW/YKRwBz5P7MAFjetbcXNnIzdqUFxKpOpnueM0m12Z0fGGaYIpYCXEr/IDt8HlIAU
	suxir1kY8rLxyBUyynUlAVw686kWtgksj9FdV9FI0d1QE9HHzrGfT3+3jXh26fRXENO1eaG7KCp
	rTnBtQrt2S4cFfzWmMYtcYnOmT2NdJmxkx0x8TySH4Uq5tIUThLmM5op+uaYc+KsoToNQ+wpkCk
	KjOiwjBInqr/FiC/wh2Z2vE2YL2HE1a7WL25sIG7VXOooziBTCTx0XEoX51k8am+cpkBk0F49DV
	BpzOPX8ztHr3wC4F43xCbptPwatjA2UujEk570xQ5+YaKx3NpWzmGNf+0q4pm+uikrceU3OjUSx
	rj2obGGd9oErMLiirX1rF3/06NDdc1A=
X-Received: by 2002:a05:6300:6bc9:b0:3e2:59b5:a6a3 with SMTP id adf61e73a8af0-3e7a1b97c06mr4376109637.0.1793008672624;
        Mon, 26 Oct 2026 02:57:52 -0700 (PDT)
Received: from [127.0.1.1] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bf0f4dcsm1095577b3a.44.2026.10.26.02.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:52 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH net v6 0/4] net: ethernet: mtk_wed: misc fixes
Date: Mon, 26 Oct 2026 17:57:27 +0800
Message-Id: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHQUlJIzE
 vPSU3UzU4B8JSMDIzNDA0ML3fLUlLTMCt1EMwNLA1NDUwMTcyMloOKColSgMNigaKW81BKlWIh
 gcWlSVmpyCcgIpdpaAELEUQZvAAAA
X-Change-ID: 20261018-wedfix-a60905150472
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Sashiko <sashiko-bot@kernel.org>, Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793008668; l=2955;
 i=hujy652@gmail.com; s=20261026; h=from:subject:message-id;
 bh=549qJPyhyqlBNx06uotz1gnmv+Qgyf4W7lO1nGNCwHk=;
 b=s6R3dKe4amKcP5NVpaUVkILmnGN7AjJuw87IEHxjMsgOZ4RpuDVhDNjo6RwpCw1Nd9be1Olqg
 dFeUk96NAcuCyw/2hqTkfxI7BpUwpPLsEq0U1p4SG/c/MXdoXkslwoX
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=uXjqvnRsKEfHEyUr63sOg4fEJIDs4AmiW/rB1cWarXg=

Ths patch series includes some fixes for issues that were discovered
by Sashiko and one original patch fixing issue I encountered.

Patch 1,2,3 fix issues that were found by Sashiko.
Patch 1 was compiled test only.
Patch 2,3,4 were tested on a mt7986.

Patch 1 fixes tx wdma ring reset for WED v3.
Patch 2 fixes the reset condition for rx wdma.
Patch 3 fixes rx ring and tx wdma ring not being freed up
Patch 4 fixes WED on non-DBDC mt7986.

---
Changes in v6:
- Update cover letter to address the platform that the patches were
  tested on.
- Update message of patch 2 to clarify what's the issue.
- Update patch 3 to rely on ring descriptor instead of an extra flag.
- Squashed patch 5 into patch 4.
- Lin to v5: https://lore.kernel.org/all/20261016-wedfix-v5-0-8b02e78fd34f@gmail.com/

Changes in v5:
- Add cover letter.
- Add patch 3 to address Sashiko review on rx ring and tx wdma ring not
  being freed up.
- Add patch 5 to address Sashiko review on error handling.
- Link to review: https://lore.kernel.org/all/179000700034.2160803.10594281691384015089@kernel.org/

Changes in v4:
- Add patch 2 to address Sashiko review on rx wdma reset condition.
- Link to review: https://lore.kernel.org/all/20260730090030.201100-1-pabeni@redhat.com/

Changes in v3:
- Add patch 1 to address Sashiko review on WED v3 tx wdma ring reset.
- Link to review: https://lore.kernel.org/netdev/20260706101044.161059-1-pabeni@redhat.com/

Changes in v2:
- Address issues raisied by Sashiko in patch 4
- Link to review: https://lore.kernel.org/all/20260706101044.161059-1-pabeni@redhat.com/
- Add comment to explain the special case
- Link to v1: https://lore.kernel.org/all/20260630144831.1109-1-hujy652@gmail.com/
---

To: Felix Fietkau <nbd@nbd.name>
To: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Sujuan Chen <sujuan.chen@mediatek.com>
To: Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

---
Zhi-Jun You (4):
      net: ethernet: mtk_wed: skip ring reset in wdma_tx_ring_setup for WED v3
      net: ethernet: mtk_wed: fix reset condition for rx wdma
      net: ethernet: mtk_wed: free up rings during detach
      net: ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986

 drivers/net/ethernet/mediatek/mtk_wed.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)
---
base-commit: 7076f684d5132e6a6145e1da2fa74771ecd052e5
change-id: 20261018-wedfix-a60905150472

Best regards,
--  
Zhi-Jun You <hujy652@gmail.com>

