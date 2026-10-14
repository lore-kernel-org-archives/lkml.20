Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D142D47F1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005468; cv=none; b=AAUcEsWUuP4WRxbx2f001Hf40dvziS8MBDuK+/wt7khwI9oyPFDBBmJuqUcZyl9udR2qyXcU/ewK/XIq/lcmwY2RUltdwqanQgCxEUaCft4Rh1+69yKCrfX5MpAGyafQU097UhQIy+20m+Z03PS5V5XTEgDV/21AfyMqCAGD99Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005468; c=relaxed/simple;
	bh=BzvXDsUbUrOErUuhtGlLs+1T+RiijvGHxMTJGVit9j8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCG3w0wssV2ef7Kj6A5/g1fEaN3PYWbMB9U6bejDk4vaRGj7c4xzzC9oZis5p8DWojdF5jkY6yN+19sbTlbmFFT7EjPrKqZdDPHOH1l4febZ7QwIigryQe4TuGtMaHclkRPyXMzmG3ZW2/d1sKo5r+qetv5E0afqfyeaeakJSow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=hZnZMOy7; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="hZnZMOy7"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15756f82e8aso605249c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792005466; x=1792610266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xfWnkTj9bNHP7QujAsZEILR3pC3x+cnZQ9Gzj4eqTsM=;
        b=hZnZMOy7SJzeuohn7Chm/NVpZO9zgOX/NuUAi9bJXo/guPW1mRhmPnzoo2FB4etTNK
         gF/xBf0Y44RqHQIsn2I78bMTxov92bDtY8880ui5t667TxPWy8zGl2YlLwpkuOLREqyP
         IYr979uAYLQwSp9sIxDdO0E4OGHCdb38aIRgc92gOcbn+iMr7ri0qM101YIfjV7vkgMW
         hefaHaHY3dVsecuqJseN/rkk6K7JJfhkswtOBqRDZdYMbDrPFVF/sz8C3XAq/K+lJrYt
         3aygxHD30z/nC8EIzJaQvkIw4bp1s8auUyq/l6FZihLiFOqTiFA9Z8osXzOhc+nxv/Dz
         hR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792005466; x=1792610266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xfWnkTj9bNHP7QujAsZEILR3pC3x+cnZQ9Gzj4eqTsM=;
        b=UxEVz46xAxsgWaXsDlOIXo7kG1oNTUz3tW9X5LaC9mEzH8QQHE2hBrGmW+hr8FCmLd
         98P7YOAPuSnA6YMBWKLsmzgvak4JbythBP3OZM/wVW0joUl3qOWswkrozH0AvQisvBFm
         XE07EbkTgcnMvuz0ZoACNFKnwj9/zke1OJt8KBaVcxRbkZs9MSTrQsyI6ScxkJku2G07
         nfZVxTc4zQbDTQtTkwkZOQrM9OvWkVycdbYJnluVI735PFYRjoGo5Dz+a4QCAzrnqQTS
         LXMkKLofrHeyn86yij6yrkyPl8bUHvIzUwSxGZKbaR3AG2qdPqyiHTLHCZUjPCC9bONR
         gAzw==
X-Forwarded-Encrypted: i=1; AKwUvBxtWpQCBr6istftyH9SOwPBdBJRw/xwYNGXJ3BJvtG9w0ncE7kR99xudVCI9QBfUwde6rTWxwfXBnkH7hs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKw5wTYj/Tj6egnf+o8UpezqbKZ/fUyqNvejYExcoTWZaOWFv/I
	SNmhoUnEnX099DmE/fk3A+Lfeafx80mP4qsBLP0hPGNKqa/aHUW4+S1KMyaP2ns/Sk273QH+Zzj
	y3AhU49hfcw==
X-Gm-Gg: AYBFou2IpVCSBV1i+5NMpiobi3yZ9mzoXvM6eNUymEuyYRaELzperY2R9YEfGcPY1jW
	mV5Ow9zH/RSJYTDFUOHtIE6GeRviXyW9Q5AxPh/PjRdphSFt/kru6z+nQol3R3hfqVNuT5kSu/A
	f0JtZYPTYcGk7/K8OO7ojD2abXDMO2VOWQxD9DwWr/RR8b1nYOkaKC6HKHuze9Az8/gFXpr3AUY
	Y/G/ijjj3fjP5O88kFWHSVymTOT9Nre1Ws6+jxBYqhVaO4Baf3FEUS7fYXG+4fMnuHOe1XeBFYx
	a5+pRQf/+w6FE0N+mnaZtE6Lg/iKMZmKVzVuJZbULgSD3dn8UdyPBpDz8/Oum6t9JbI52SWrcNw
	y+3BVrPuXlljsilKH+uzM36xaz1XJK35DI2xeLApYfQG95rUew5IEbldvz0AH+Ml0/0flgJZzDI
	6gJdR5u5rpZ3MHz83SMTsqLGTb63/jwR4lU2q9KQLBlQdjAqZycRT6d+YHHBwllU22WO68fLcwm
	XRJJn9LU9CCRpJC3QLrA1g6Fotk7aTJ7H1T42q8Wi4/7rp9FfXzFqHVDeGAvJi3Yf+gw+JGvZkp
	CBqvdQ==
X-Received: by 2002:a05:7022:b0c6:b0:16c:d83b:a72d with SMTP id a92af1059eb24-16cd83ba76bmr17326351c88.0.1792005464593;
        Wed, 14 Oct 2026 12:17:44 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:39d1:d8de:aae7:23dd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1746482c978sm28966433c88.13.2026.10.14.12.17.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 12:17:43 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	leon@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	mbloch@nvidia.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com
Subject: [PATCH 6.6.y 1/2] net/mlx5e: Don't store mlx5e_priv in mlx5e_dev devlink priv
Date: Wed, 14 Oct 2026 15:17:36 -0400
Message-ID: <20261014191738.24034-2-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014191738.24034-1-artem@trailofbits.com>
References: <20261014191738.24034-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Saeed Mahameed <saeedm@nvidia.com>

[ Upstream commit 123eda2e5b1638e298e3a66bb1e64a8da92de5e1 ]

mlx5e_priv is an unstable structure that can be memset(0) if profile
attaching fails, mlx5e_priv in mlx5e_dev devlink private is used to
reference the netdev and mdev associated with that struct. Instead,
store netdev directly into mlx5e_dev and get mdev from the containing
mlx5_adev aux device structure.

This fixes a kernel oops in mlx5e_remove when switchdev mode fails due
to change profile failure.

$ devlink dev eswitch set pci/0000:00:03.0 mode switchdev
Error: mlx5_core: Failed setting eswitch to offloads.
dmesg:
workqueue: Failed to create a rescuer kthread for wq "mlx5e": -EINTR
mlx5_core 0012:03:00.1: mlx5e_netdev_init_profile:6214:(pid 37199): mlx5e_priv_init failed, err=-12
mlx5_core 0012:03:00.1 gpu3rdma1: mlx5e_netdev_change_profile: new profile init failed, -12
workqueue: Failed to create a rescuer kthread for wq "mlx5e": -EINTR
mlx5_core 0012:03:00.1: mlx5e_netdev_init_profile:6214:(pid 37199): mlx5e_priv_init failed, err=-12
mlx5_core 0012:03:00.1 gpu3rdma1: mlx5e_netdev_change_profile: failed to rollback to orig profile, -12

$ devlink dev reload pci/0000:00:03.0 ==> oops

BUG: kernel NULL pointer dereference, address: 0000000000000520
 #PF: supervisor read access in kernel mode
 #PF: error_code(0x0000) - not-present page
PGD 0 P4D 0
Oops: Oops: 0000 [#1] SMP NOPTI
CPU: 3 UID: 0 PID: 521 Comm: devlink Not tainted 6.18.0-rc5+ #117 PREEMPT(voluntary)
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-2.fc40 04/01/2014
RIP: 0010:mlx5e_remove+0x68/0x130
RSP: 0018:ffffc900034838f0 EFLAGS: 00010246
RAX: ffff88810283c380 RBX: ffff888101874400 RCX: ffffffff826ffc45
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffff888102d789c0 R08: ffff8881007137f0 R09: ffff888100264e10
R10: ffffc90003483898 R11: ffffc900034838a0 R12: ffff888100d261a0
R13: ffff888100d261a0 R14: ffff8881018749a0 R15: ffff888101874400
FS:  00007f8565fea740(0000) GS:ffff88856a759000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000520 CR3: 000000010b11a004 CR4: 0000000000370ef0
Call Trace:
 <TASK>
 device_release_driver_internal+0x19c/0x200
 bus_remove_device+0xc6/0x130
 device_del+0x160/0x3d0
 ? devl_param_driverinit_value_get+0x2d/0x90
 mlx5_detach_device+0x89/0xe0
 mlx5_unload_one_devl_locked+0x3a/0x70
 mlx5_devlink_reload_down+0xc8/0x220
 devlink_reload+0x7d/0x260
 devlink_nl_reload_doit+0x45b/0x5a0
 genl_family_rcv_msg_doit+0xe8/0x140

Fixes: ee75f1fc44dd ("net/mlx5e: Create separate devlink instance for ethernet auxiliary device")
Fixes: c4d7eb57687f ("net/mxl5e: Add change profile method")
Signed-off-by: Saeed Mahameed <saeedm@nvidia.com>
Link: https://patch.msgid.link/20260108212657.25090-3-saeed@kernel.org
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Assisted-by: LLM
[ Backport to 6.6.y: Derive mdev from the auxiliary device in the
  older remove path. The auxiliary device only binds after successful
  netdev registration, and the target uplink profile-switch paths
  retain that registration, so remove performs one unregister without
  upstream's NETREG_REGISTERED conditional. Use that hardware owner
  when clearing the uplink pointer if profile rollback clears priv.
  Apply after the pending 6.6.y backport of 3d5918477f94 (net/mlx5e:
  Fix netif state handling), which makes probe registration-failure
  unwind release resources even before netif_device_attach(). Patch 2
  of this series ("net/mlx5e: Pass netdev to mlx5e_destroy_netdev instead
  of priv") uses netdev-based destruction. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2026-22996 to 6.6.y.

The code changes follow upstream, except the older remove path derives
mdev from the auxiliary device and omits the newer registration-state
branches; see the backport note.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series on x86_64
(allmodconfig, CONFIG_WERROR=y), changed objects only; no runtime testing.

Thanks,
Artem Dinaburg

 drivers/net/ethernet/mellanox/mlx5/core/en.h      |    2 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c |   22 ++++++++++++---------
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en.h b/drivers/net/ethernet/mellanox/mlx5/core/en.h
--- a/drivers/net/ethernet/mellanox/mlx5/core/en.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en.h
@@ -947,3 +947,3 @@
 struct mlx5e_dev {
-	struct mlx5e_priv *priv;
+	struct net_device *netdev;
 	struct devlink_port dl_port;
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
@@ -5998,4 +5998,4 @@
 	struct mlx5e_dev *mlx5e_dev = auxiliary_get_drvdata(adev);
-	struct mlx5e_priv *priv = mlx5e_dev->priv;
-	struct net_device *netdev = priv->netdev;
+	struct mlx5e_priv *priv = netdev_priv(mlx5e_dev->netdev);
+	struct net_device *netdev = mlx5e_dev->netdev;
 	struct mlx5_core_dev *mdev = edev->mdev;
@@ -6022,6 +6022,7 @@
 {
+	struct mlx5_adev *edev = container_of(adev, struct mlx5_adev, adev);
 	struct mlx5e_dev *mlx5e_dev = auxiliary_get_drvdata(adev);
-	struct mlx5e_priv *priv = mlx5e_dev->priv;
-	struct net_device *netdev = priv->netdev;
-	struct mlx5_core_dev *mdev = priv->mdev;
+	struct mlx5e_priv *priv = netdev_priv(mlx5e_dev->netdev);
+	struct net_device *netdev = mlx5e_dev->netdev;
+	struct mlx5_core_dev *mdev = edev->mdev;
 
@@ -6072,2 +6073,3 @@
 	SET_NETDEV_DEVLINK_PORT(netdev, &mlx5e_dev->dl_port);
+	mlx5e_dev->netdev = netdev;
 
@@ -6076,3 +6078,2 @@
 	priv = netdev_priv(netdev);
-	mlx5e_dev->priv = priv;
 
@@ -6127,9 +6128,12 @@
 {
+	struct mlx5_adev *edev = container_of(adev, struct mlx5_adev, adev);
 	struct mlx5e_dev *mlx5e_dev = auxiliary_get_drvdata(adev);
-	struct mlx5e_priv *priv = mlx5e_dev->priv;
+	struct net_device *netdev = mlx5e_dev->netdev;
+	struct mlx5e_priv *priv = netdev_priv(netdev);
+	struct mlx5_core_dev *mdev = edev->mdev;
 	pm_message_t state = {};
 
-	mlx5_core_uplink_netdev_set(priv->mdev, NULL);
+	mlx5_core_uplink_netdev_set(mdev, NULL);
 	mlx5e_dcbnl_delete_app(priv);
-	unregister_netdev(priv->netdev);
+	unregister_netdev(netdev);
 	mlx5e_suspend(adev, state);
