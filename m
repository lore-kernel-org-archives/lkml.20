Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA378560AB1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092361; cv=none; b=ffSgKC/XUeP+FZRsblhc/XnPiLGH0xjpGCTHHSeLI0g/2d+JxkZ+Ixy/trjHk4U7q16fGz+HqGaIS5xn2FrAq+2TAZLNAEMXpdjp3y6ApZskarqV4TWS6K7d+LJPQ5EQ+saaWXFXP7wOQW5LOSkpZCh+H2SkdCJKGtC5Uv6W7hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092361; c=relaxed/simple;
	bh=nCTXi0QrphbUuOg5+DmqnjVX+1Bepe6BZKUN+z7NmgU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JJrVOipisSi0jhxweQzW/ByvN9y0Mj/8WrLQzrte1c6qgGSI/3XZR4rBq0FecEdkrSeCYpZ2gyCMLN9tWIe/DX9ov9wsFopI/tybx/Ry8MvR7FSGmb+5iPV7dEsBHR/AVZwA6TG/pLq7MOzqNUxlMP2HyvM1NjhK8c8cN2rpMdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLK9aiDX; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLK9aiDX"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a803458ba0so3835a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790092358; x=1790697158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nsDs23DcdYwkDSFn0tiJfOUbVshOv/zFLmietT3ibk8=;
        b=GLK9aiDXA+0QuzEEzArRbvzHjk0rGx2bB+AbPf2yu5AKjmaNRZP13+bfvPVCuCEitQ
         NenSCgDjfbBWS7nMYBAoga0hwYWmEj13GQuN2Ia5hvV8P2acHHhwSPItW+SOARhHYUTl
         7MKt2WTFGOTHPYzFzonkPvSJjhU5eYlAkohpROKay/Vm51OV9mG/SI29lKRNSrO8T+ZN
         HGReicMNATHPbwOUyR1xhT5kTQglpEDL3jqgH3lYc9FlJfvMwGw7sXs70Ej6tu6yGvoP
         Re9P4AaQHss/SIvA3sp1M2f89/oXBUzZIKpS1lQZ8YeHGPz8x3mHjIJ9WRxiGSEik3S4
         Dj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092358; x=1790697158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nsDs23DcdYwkDSFn0tiJfOUbVshOv/zFLmietT3ibk8=;
        b=z0P6lzk1Q6Rm4ugG6Itu1XR8OZ5lsFp9+MQIturmDhSV5A4jcdX07ctDMJ7q3Prkjo
         9G97C9ML4w/oBx6J1ddTabd8C6ajx6RwIXTWwpcuLvIDOchinHGXZMItrKojvkdiG9ga
         zvi0Juy8MDvMXiIyR8FUsZ9Fonqa7JwbP5FLhRVuCzLW1u6KonTWoV3KjnX2bcFSyBcO
         5CY8sNZC6um7LoGMaCbie2JUEmtJwONimc6AxCViWbfrjW0etXC6hyTsivCWD0QfAmKC
         f3qBklS/XoXC08PEzYiODGSFypUQBT9QKyxVusaPdDuiH+cMlBqkO7rcRo+Tpku00Dn7
         l03A==
X-Forwarded-Encrypted: i=1; AKwUvBygSO8MW6c8lo2Bni+wFjmEITqUBElGjEz86pZPiSe/OluG75165pEIuZNqpLcTSD8Ikj/YrQpKOxcijLE=@vger.kernel.org
X-Gm-Message-State: AFuF++l7dJesnrrwSAaO7UG2VUKotBsgSawHH8tmVkXpuk2i4CzPzFKU
	4E9VwpqzPmSssIUHXU6FRMuJbgi2FeSnmn57yGbHyMXy07UkZIfCz+im
X-Gm-Gg: AYBFou0vyHBT5842bPWun4radwr3DQ0jiX6ZgxgDaY8JGsHDJ75xnHLw5a61lwPWCh6
	BIIF6SA3P514gw01K4oduFENP6f/5tQyBKtzFNvyNU7Qp5DlX80ZtCMd0mh9k+Hq/znU2c8+BZo
	nTdvum17/WyHFHUo8+mQbSNpJt6dy6z4G4JI7zyBlubsav5MclhqwVSrmy+9sFUyMpNhqV/cz+c
	piBexE53bqI0djBSu/udeGUAqiEfC1+ecO2zZcz1ZQ56HMgl800NqfkHQYDHbBm3UUhDdV+H+Jy
	TUHClqYQf17tRrGUdGKCPWQgGfiSehAYrerhfjOqepz+Y4FNjwUbdCnEFHypOnsOtBqgYMIHpoD
	Tdw3WpuNN29cmCOt28auBNyXeWUpDl+9+KtwuUltiCFr4iVxrhzFsy6jzfb7G7OyTLeTx73lv91
	vTe4ZLAa77eMI7u79Fmi/ml8SHF1u37avJsT4sW+8AntoxyDbrZEEC/oL8q+vnvajU0Nk+U6sZp
	ILnKJyo2WO1NmB9
X-Received: by 2002:a05:6402:274e:b0:6aa:9f93:e991 with SMTP id 4fb4d7f45d1cf-6aa9f93ece3mr3291043a12.3.1790092357607;
        Tue, 22 Sep 2026 08:52:37 -0700 (PDT)
Received: from localhost.localdomain ([94.240.182.136])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa44e6262sm1347326a12.11.2026.09.22.08.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:52:35 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: kuba@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com
Cc: andrew+netdev@lunn.ch,
	ffainelli@freebox.fr,
	auke-jan.h.kok@intel.com,
	jgarzik@redhat.com,
	joe@perches.com,
	aleksandr.loktionov@intel.com,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+ca1ef9e2e234b8d3599b@syzkaller.appspotmail.com,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Subject: [PATCH net v2] net: e1000: fix warning in iounmap on probe failure
Date: Tue, 22 Sep 2026 18:51:39 +0300
Message-ID: <20260922155139.67364-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During a probe failure, the e1000 driver error handling path calls
iounmap() on hw->ce4100_gbe_mdio_base_virt and hw->hw_addr without
checking if they were previously mapped. This triggers a kernel warning
(WARN) rather than a fatal crash when passed an uninitialized pointer.

This issue was found by Syzbot. The exact kernel configuration (.config)
and the C reproducer used to trigger this warning are available on the
Syzbot dashboard.

Fix this by adding NULL checks before calling iounmap().

Reported-by: syzbot+ca1ef9e2e234b8d3599b@syzkaller.appspotmail.com
Fixes: 13acde8fffc0a ("e1000: cleanup CE4100 MDIO registers access")
Fixes: 1dc329180fe22 ("e1000: Use hw, er32, and ew32")
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
v2:
  - Expanded commit message to answer reviewer questions (reproduction details)
  - Added appropriate Fixes tags
  - Added Reviewed-by tag from Aleksandr Loktionov

 drivers/net/ethernet/intel/e1000/e1000_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c b/drivers/net/ethernet/intel/e1000/e1000_main.c
index d7f5c6f16142..156903089fa6 100644
--- a/drivers/net/ethernet/intel/e1000/e1000_main.c
+++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
@@ -1227,8 +1227,10 @@ static int e1000_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	kfree(adapter->rx_ring);
 err_dma:
 err_sw_init:
-	iounmap(hw->ce4100_gbe_mdio_base_virt);
-	iounmap(hw->hw_addr);
+	if (hw->ce4100_gbe_mdio_base_virt)
+		iounmap(hw->ce4100_gbe_mdio_base_virt);
+	if (hw->hw_addr)
+		iounmap(hw->hw_addr);
 err_ioremap:
 	disable_dev = !test_and_set_bit(__E1000_DISABLED, &adapter->flags);
 	free_netdev(netdev);
-- 
2.47.3

