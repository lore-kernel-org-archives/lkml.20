Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AA139FCD7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896096; cv=none; b=GJ9+MFxNBWjQljmcL/fZLvn8mBTBNL7sTyNxU8tIzDxdfhW+GeM3is79Ox1psmU0MfkV0LL4AiDWRuI6B/arkTHOY6sSoCxMRjkADUhnoBgfd5X7lbUpM3pOoFCKrDBbApMHO7kUrzir+zaw2G5o+m9duCBZ5HeFGtesHtB4Q2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896096; c=relaxed/simple;
	bh=g9ZBkxWQkJ/c+RVm6Yxc9chr+fL1IMnzCQEXKVZqpT0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DDwzibp66AGwdoCRg/lmAoKxhg4o8uDkAd56MiFhmcEfGsi/xd5btrCOhoFAxca+DHMSwtw2RQGnWbsXfMnSy1PcOWS3zcX+GhvIkNl+gxUY/Bbpt6fJADKTSexBgSnUUa4a0GbfY09mTvX6SM0hPIncWZQy3VYV72ev3yhPx5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=hkOtcR1I; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="hkOtcR1I"
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 63C9C3F289
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1791896090;
	bh=0xB5BDPUdJFu48nRTbI7VW4KLiWRolohDwA7T2NysT4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=hkOtcR1IkdZ+yl5WxM9Ioux4fpXILBRzHAWC93rOjauhjhfy4k945sT6q0S/mg2bV
	 f4IKXwqqgnQe2Gxd3f2qHM9iLw9kb44mIYmEVR1dcEl9xIPD2AU82HXEUqCAtggdjt
	 KWgInk6XTNFla5u/y2aorc9Nzt7JvyKvvmRmKkD+Va1A45GGPAIsUQIwu66OFFxEax
	 Q9wxnKbdW7ivCTlXhwpm30BaZmEadCFlzJETx1jbvT4XSphu0jpyrN5WZ3qGpQyPKE
	 KqjSmZDdmjt3vpNwy6uJ2NJp3r2LP2dolFlBW1u4Mxi0Pier9A/7lX2283bkofy13o
	 xqEsfmoszFJ8wF2yoTFWhp0PE5hvoEp7sX4csl+95SiI2iDEKpb9x79VamzAgD/HlS
	 6jOawttEb4WMvcMGGCgUUSqcBUm+quysEN02g+uXpChlLkLXmVhbiSqgxtzcqI/ExL
	 E/ubnuLXqJodZs992+QwS5ZK6KPT9OPIJVQpG4swdtrbWcnBejboYHe99j1HcF1MN/
	 +acQVNWvbo6ga4S+hY9wP/ofiJ5YM7XhBIiJnbq5EgGUs+4BJziSJOjLyiTrpyPpnM
	 XYmFL7CkmW1509fivvMwu2ek7WWbrvb09B4kHO/Vxe72t1MlftVsEQzqmhBeBLYwqi
	 XUiP4bM0wpK6VnHXex0Sc6pU=
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d904f64a30so3216545ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896089; x=1792500889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0xB5BDPUdJFu48nRTbI7VW4KLiWRolohDwA7T2NysT4=;
        b=JcMP85/3kggOMlTC2XvivJdZtol2YMuuKM2lxYr2m+xdxqyaf3Sr/rj1M9NMksVlsA
         DE1z5hBIwkTyTwtPKr6c6H6RM1Psn6y2eSLCFZl1QUlY2nuCesbtLWEsmcr4Xtr6aN3d
         CpmgzZZjT9GL0T7figuAhAxPAFZU7l32mbZcz0psNpu2HArZXYoptAz2wmWLyRi3Mq5B
         RlRmUxR7Trtggvyg4IcNmNuAGWGHg82ZtF1N5zXmcvjaeumrLaByH9IpaK3U8xYZhkl3
         bU3fFIL0pHNvAhrVEvubQDMZ56WOkSAvRNA9MFBQAza/jHdyZekRg++r+c1G8Eo3NIia
         BKJg==
X-Forwarded-Encrypted: i=1; AKwUvBw1A6ztGFmyXBd8E/Wl1z0UiAB6Ur03rQWXap0s5rgY+8EpfeTTz0UhhhRMdW171u16eVnEgFghS4xA6Cw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUE0+g4mh8U3ftIYSIFTaEyiQVSMam0d57F2bxKrX90Zo2hZgS
	g4MatIQcBNyV+H62t50Yjwy1xffQ36sM5898vBWxOEGCGD/bzRjdq8poC/52WFLrnVNTwzAn4jn
	bRWD2vL+snmBIXugH+SfDkzziLm+ispFkjQxekwnPczQpjkiqbg8iqXCvxqBCMCKaZostQPi2sW
	nwHB/q8/7aDEZoLg==
X-Gm-Gg: AYBFou1Ag46dXxxIIFU9/GcPj85UJLXCr7HOqKnpd95qWj+dGCnY7p9o3nBG4SdUyF+
	2A2ELWay1PwwOdiY4oFFiyUHUKnAhBUYESV1Z8ZXAzYRVLAVGM+T+/2XlQZ/exFNUDq9DE2Ifhy
	GJBAm4yHDo+zteSW4gws4/BXiQTwyW27rql8lQCBlDOl6/Dl8ZRTJG9mIZvhcq/a2YGUAMqAcaf
	uVDCdJvz/Pa0AIwmL8d0yE/IRjYJRQVOxLuuV4u1TfVkVz0R2iqHvl5MMJ0Ojjr8pkodFLLDViG
	60O5CDbmPB4XTqd0eX5+hslbHeYEgSuv4dgJbhx6iS72P4adQ8hXQeBu+8M2o/bYc9QyeYrM/pn
	BYcSxkQ9RZQ0JrmakEC3ieU4JmdjNBa0eUY24lzhDaGUnACefgM9qYF6u7LCHwXVzlz0snKQL+o
	z/nDt/6ArbC9q+jWop7s49ZOzc3Hpzi6Aq4yZT0lDtMi3hPYfFUGVEveJqO9qRkdOkcKvsEVDoi
	2AM2L9kr938cCCJmFKOgEKAwOlfl+DX3sTwn+NwqoA=
X-Received: by 2002:a17:902:dac2:b0:2dd:b95a:e1db with SMTP id d9443c01a7336-2e8429a9f89mr170224585ad.3.1791896088733;
        Tue, 13 Oct 2026 05:54:48 -0700 (PDT)
X-Received: by 2002:a17:902:dac2:b0:2dd:b95a:e1db with SMTP id d9443c01a7336-2e8429a9f89mr170224335ad.3.1791896088316;
        Tue, 13 Oct 2026 05:54:48 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-d938-97aa-f951-52ea.dynamic-ip6.hinet.net. [2001:b011:2008:445c:d938:97aa:f951:52ea])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a05f70sm54894715ad.7.2026.10.13.05.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:54:47 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	kiran.k@intel.com,
	chandrashekar.devegowda@intel.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] Bluetooth: btintel_pcie: guard debug dump before hdev setup
Date: Tue, 13 Oct 2026 20:52:41 +0800
Message-Id: <20261013125241.1230408-1-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An MSI-X interrupt can reach the debug-dump helper before
btintel_pcie_setup_hdev() initializes data->hdev. The helper then
passes NULL to hci_get_drvdata() and crashes the interrupt thread.

Return early when hdev is not available. This covers the GP1 and GP0
error paths while leaving interrupt handling unchanged.

Fixes: 190377500fde ("Bluetooth: btintel_pcie: Dump debug registers on error")
Cc: stable@vger.kernel.org
Signed-off-by: ChunAn Wu <an.wu@canonical.com>
---
Changes in v2:
- Add the missing Fixes: tag required for the stable CC.

---
 drivers/bluetooth/btintel_pcie.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
index ac7193400769..8d7927bd75b6 100644
--- a/drivers/bluetooth/btintel_pcie.c
+++ b/drivers/bluetooth/btintel_pcie.c
@@ -297,12 +297,17 @@ static void btintel_pcie_prepare_tx(struct txq *txq, u16 tfd_index,
 
 static inline void btintel_pcie_dump_debug_registers(struct hci_dev *hdev)
 {
-	struct btintel_pcie_data *data = hci_get_drvdata(hdev);
+	struct btintel_pcie_data *data;
 	u16 cr_hia, cr_tia;
 	u32 reg, mbox_reg;
 	struct sk_buff *skb;
 	u8 buf[80];
 
+	if (!hdev)
+		return;
+
+	data = hci_get_drvdata(hdev);
+
 	skb = alloc_skb(1024, GFP_ATOMIC);
 	if (!skb)
 		return;

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.34.1
