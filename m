Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838784;
	b=mCT0YyXTyF5edHq0NZvunIoNJ74jeEzOj8r1vE7hUpbNHO2TxAOubPz1B4Go90E/6Ek4
	 EHl/vMliTExc8WH/Bk/zkyONP69ymwYBWbGEvM4kIf3ssw6HjCUfQ2KXpdo0JPYoeGkaa
	 yxAeNOYSWxLFUFYBkfPzVrAVOVi0fLLGJiiYmSlwdIyikHK61CSdtU+zR7oqcrHF4g9Ci
	 ZGauz/XGGmJz09Yylsjp63AZeEMrAoPe5rsR+MbxhUE7MqOeGdVJFgIqA/nXqfrT1Zi02
	 nAsVVkzA6HmplEZlZYUILIKrK9SljXVTb/tB+byir+DpDQCP6foC6EnjLRu/ui/Ztpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838784;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=otl4c7sw8cCEVIAVDR1SXI7wOGAsQDrAt72bD+YeYx4=;
	b=KnOaBos1bOnTnc2QjnOzadcy30gritnH1lasVYbSkDKrN4QOWftvlDJfW1i9l2zW9aCh
	 QWKFEEnIy+/mVeOtTAVijXEXSynQtsm9WOySREMuG0rLi/7BLhurTArWlVi72FbgLxXTN
	 U0xJy80F6oG+luZctVc0s4OE3O5AOnEiY0weT5aBqPCTAcZ1G+lwZYWY1utnTs3ywPsAt
	 0uawZ5meP1cDAZZwqID2dLpWkJQCNpVVhyvFRL66nQF2E3aHG07baP2HpyvHf94dbGMTE
	 fGq729F1pUVHzs4j8FuZU4SjyC38peAi+YK/b2zDaxGWF8GjFx7NdR49GAblu5Py+Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b="Axxtjs/u";
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26670606A337;
	Mon, 16 Nov 2026 14:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26670606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Axxtjs/u
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54db447b9;
	Mon, 16 Nov 2026 22:19:35 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] igb: Fix potential I2C adapter leak on probe failure
Date: Mon, 16 Nov 2026 22:19:35 +0800
Message-ID: <20261116-c29ba55625-net-igb@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1e4ba485903a1kunm4914b35410e1c6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaS0NPVkJLH0oZTkIaHkpKS1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=Axxtjs/u0WODD7BOmpbpeuEyjUePZDcu6qVabOD+aEna2ZiRkjECGFMWsvqmv6IkJUcFzVnARpDJWAnJhr/2VSG14tQ/4j1HZkHFx9A402wtcr/thhtQBOUcApaF68YEF5ZAdHJdeL8WnZjS0TDNO5jDn9SBjt//63YBRBRTN/U=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=otl4c7sw8cCEVIAVDR1SXI7wOGAsQDrAt72bD+YeYx4=;
	h=date:mime-version:subject:message-id:from;

If netdev registration fails after I2C setup, err_register clears the
embedded adapter without unregistering it. I2C clients and the adapter
registration outlive the freed netdev.

Delete the registered adapter instead of clearing its storage.

This issue was found by our static analysis tool under development.

Fixes: 441fc6fdb47a ("igb: Add i2c interface to igb.")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/net/ethernet/intel/igb/igb_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/igb/igb_main.c b/drivers/net/ethernet/intel/igb/igb_main.c
index d4a897a8c82c..ffb696500d9c 100644
--- a/drivers/net/ethernet/intel/igb/igb_main.c
+++ b/drivers/net/ethernet/intel/igb/igb_main.c
@@ -3657,7 +3657,8 @@ static int igb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 err_register:
 	igb_release_hw_control(adapter);
-	memset(&adapter->i2c_adap, 0, sizeof(adapter->i2c_adap));
+	if (adapter->i2c_adap.dev.parent)
+		i2c_del_adapter(&adapter->i2c_adap);
 err_eeprom:
 	if (!igb_check_reset_block(hw))
 		igb_reset_phy(hw);

base-commit: 2e54b3e187300893688c2c7517894f5d96732e05
