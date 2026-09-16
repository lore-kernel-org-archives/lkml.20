Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9B73E6DF7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789539069; cv=none; b=T6zV+3zY1rs5mkmZlRMXvN9ccAuUW7QDuMdwGnEnMsItybYIJ4OavI9Nra2cEl2gsj73GaRxOk00kjqT+134mXhzphTkne7WFWwDydAFLWsOZGP4YXLKjG/gaaoAPLS+mgJxZBaxcIThpnBIxj5vKXYFItFJuU7t2kw8Q7ArBwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789539069; c=relaxed/simple;
	bh=LCQlOENHLpgDLFIJjB+UUCKmKYjt9PyQtWzPpaNJYRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LWb3XAVp7slFnb5QCCp9qAi/gb9aNI0QAqtDhnSoFhXrQr5YFyjq5Dw4dFf2dMMLVeqTqG1y5F75BaprGIFvrbXXPHPOWwY84m/dpUdqgEmp+92qBW0Ybi2REt2hKNtOyPhZ26/lVkbMoidBd+lA1tLkVpnkPlAM7DuUs6jgzCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVyFxUbt; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVyFxUbt"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so512581a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789539067; x=1790143867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TmAAY2RsOedvqqE/dv3Tvbl9f0z0X1eUeI0/bSG7dyI=;
        b=YVyFxUbtjjPyq2bxlYUyZB8mVnZY2F8OSFvRFfGT7gMxR/6gBR/HOlAnZTqS83zXoQ
         zjL1odG7IMnsVOU1HjniVbsBtEYn/fNykmfGAWYl7HB8gq5p620MPTMG0k0PyapLbfZr
         7BhQGh8+e9YLpvWtyFzY4VQv3HTUglxqGKfvAAzDyvitLw9vng5LUFLUcFoKu8lbKYtQ
         ld4J+mxLVCimQ0r/zFrjyFqXIlaM7pM6r2mZ5ZkgE1J9UWUgH9/yl1cuwQ54ix5kwZEQ
         zwMDg5F5Z9WVf0oQiIOpyN9jDGiqtHiL+mMQvkelaqy6v16rK6tkemTTbiBls3Xw8X6r
         E7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789539067; x=1790143867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TmAAY2RsOedvqqE/dv3Tvbl9f0z0X1eUeI0/bSG7dyI=;
        b=m3NkqHV6qKciamzPkEkrHstyNTyMW0HffthC8nVM6siFvSr4NLepM24CrVgxuBDE2j
         W8qrUeo9kl14dePfRdXQnJvHwlqw9XUA0qad4yZw1UxUQPd1lb40u5bUU3YfJDfKhBcz
         vL3dXCAaCo9YqGOTuGNHXdItgMnUTfsveHMEEoZxvixd41B442mXs3RMvvpG87F+VVm4
         NRNqcc/zF4nqErldsIqh0lyd6jjKVzTwaeauUHwoog5TvfymPipCEzL0D9w6PMX1qRmZ
         SDxAAooOa9J6jqp9YeC0sajy9UH8gYtTtMV+W6kJAmQmLzGwJSHgs2B8Sn9PUf2q5ODO
         e8eA==
X-Forwarded-Encrypted: i=1; AKwUvBz4knobw5914Q/CJaS+1HZTFf/mgI0VxNWAD63JK1Vl1rk9lP5r3n8mO449vqAJKhFXOJevY+mCg0jqPQU=@vger.kernel.org
X-Gm-Message-State: AFuF++lAbbfWhx9y5cahu2R+YrGmxrtIWAjRgxz/nUiLGjmfsc4RQ+Lp
	8z/qm2wonvw3RkojQSMNsk4bCNPgVEma53MMW62EBewc1kjgW4YH7Qgm
X-Gm-Gg: AYBFou1cpdIP5n+xx9qmmtM2hcqA8wsuZf9Mf8eAFw5ombCAJ5diV9TfZuL7orRvI4M
	dxu233QxdP+NhNGC7yqqqvf0HqN2iFTBsuPT6xf62xFaNyhpvpypW6kALKuI/74PJNnTxJVWa8A
	ncbIy0M82gyUfX6vZ0abxwJYSpDM1SnhofO4NRdAlz3+uf8XZA5+UdCSW03ZWxILk7Sr6+PXB3z
	B4BU1At9jk3wL+Y1SKqBnc0B6rSkL6T6os/OaxJ4BawX991y6GW2riGzL7Uy3reX9vNYzQxJfXq
	/HtgkW/EaiUATAIuQQhDSRDA+FQv4GAqWIuflM2fvEfPJB68sDkbZu9BXu6YJz/qfzPBFOioGwg
	8BhiCApiWjMqyDpoMblO2HWBTraIHQiEIWikbbeo09Ukm2wAMuL0ISbP/LHusmUt7v9hf7RpQvG
	POm9qFqk5MVnJWkWsLnIGQMH25y/BmPVyjpdXEg5IsNLATbCyNjjex2Q==
X-Received: by 2002:a17:90b:390e:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-39e1e424a7dmr2996805a91.12.1789539067435;
        Tue, 15 Sep 2026 23:11:07 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1c4ac8cbsm668374a91.2.2026.09.15.23.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:11:07 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Samuel Chessman <chessman@tux.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] net: tlan: disable PCI device on remove
Date: Wed, 16 Sep 2026 14:10:56 +0800
Message-ID: <20260916061056.2917164-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tlan_probe1() enables the PCI device with pci_enable_device().

The probe failure path disables the device with pci_disable_device().
However, after a successful probe, tlan_remove_one() releases the PCI
regions and frees the net device without disabling the PCI device.

Call pci_disable_device() during removal to balance the successful
pci_enable_device() call.

This issue was found by manual code inspection.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/ethernet/ti/tlan.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/ti/tlan.c b/drivers/net/ethernet/ti/tlan.c
index 274a1837025c..0a8bed6c9ca0 100644
--- a/drivers/net/ethernet/ti/tlan.c
+++ b/drivers/net/ethernet/ti/tlan.c
@@ -302,6 +302,9 @@ static void tlan_remove_one(struct pci_dev *pdev)
 
 	cancel_work_sync(&priv->tlan_tqueue);
 	free_netdev(dev);
+#ifdef CONFIG_PCI
+	pci_disable_device(pdev);
+#endif
 }
 
 static void tlan_start(struct net_device *dev)
-- 
2.43.0

