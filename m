Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794542608;
	b=fGBZx5hEO9yZcuRPC5VHjTZQKDUdy9gNRc1h0vtsdkpJW5e1lE3/ZRXQeYkXBAgP7i3N
	 5sbhcjbZGpjE5uIsmpb2gcONd/R34IuJziTK7rpsBZwBxpmCDrYHT3+Nq/iYAba/dKScW
	 FPiE9BbigiPsqqnrkOtmDHYKfcWBEOe5xHzCiIVzCr6hIKttJnieKcG3dZT4+wTuBKXzd
	 E7HXxi1QOBPH6bkbI8kalniIm9L8tPbtxaXE9vNbkr+cEXxDAxA1tWCmLz7ZBDxceUMDA
	 byPKIMb0jVJVbU+pNQolclcvJ+SAWFoqn/W7JG6VMjPzIRpEKWssKAR1FSeV+hry8/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794542608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h3VfCHvLvqBO4sImZGoV5l6BeIrK2r9kHf+KVVKvjY8=;
	b=P2ODnO+XaT20pgAnrNFiDUmLrP/qBUQPmb5ezdNQweHa++CfMZtmFrc345cely+lBjaw
	 q/z0XjD7LiocQUXcvXkjy+JFRg2eACwhW13EAUjtlu5/94PkiocZbB3G1DzfnZtRg32o5
	 aeLKuPSODE0jYKBp4+gdG2uQauKwm2jHrcTCNeFhpxOPQ1rLbY9iBpBJyaeRzWXn5/ucy
	 mu9XeRIe8Rz9gpAMczpy62p7TPe4s5r8cPgkOiQ5mvfXCt+9Q0WD2xxs57N+acILJGoLr
	 Q0IUpO4vHSw0C8u2Gx4OETrQ762T1UjTkHyWXcOWSvnN8YRX23vYMXaLGgbZsYZ2v5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHwZtRru;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6022F606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6022F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHwZtRru
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91e98301805so9859436d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794542607; x=1795147407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h3VfCHvLvqBO4sImZGoV5l6BeIrK2r9kHf+KVVKvjY8=;
        b=vHwZtRruk+RPcP4KnyJvGie743X+cb87JYRyMRIztxJcSvzuMGOg2/QY+mafApaTKY
         WZGKPjjzdXPJ6L8lamwekoV/8UeypJJtGuzE3HKrUSNgpZEYOPqL+zhOxQuo3ihjpIvF
         CDgcnEf4pWI1kXbDbUkwLfbFB14yAGtXx2LYcHTK2HtcnYvkBI8fqev/iKw+F8noMYTx
         oOWuym4pWtANXjlM37wyRJ98J3uuRRJ0/eCqrKgDEXt5tPgMgpYyi6Pw0nRkrgNN4DQb
         v2FVbTAEgF/RLYmTxDAsUV72yuxQbZj7Xen9gafXdKTXG1J7HG7OziCMfo6M6s0fbKHq
         y82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794542607; x=1795147407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3VfCHvLvqBO4sImZGoV5l6BeIrK2r9kHf+KVVKvjY8=;
        b=2MtmDyri+icqAbQB/Mj8CRlLMhTGgkM0bCbw1pHRnNS659GcseE/DDalga1qlFmdLm
         PQoyr0m1riKX0RUV4Gg2KN5ErPEJXmGziCG2RFgVm5c2EKY8/yMbJeIZokP0WP8GrkSl
         sSPA/EcDCAVpiP80ZEU0iF1zvoDB72jOh5GLQUC/VG1NM7vS4ZqBRgoLTBHrfxV1M5A+
         NvytBA328sHoVhODPR/6f2YtE/U//+51/dd14y0hgqdgLzB38fdEBXixiXUSVUgarrSv
         pAeLj43U/BubB4klpRLFG7xdVxdieC6RvStaMgt3+LwD7L+6vel2EXDXXXxQdsJZ6tyq
         te3g==
X-Forwarded-Encrypted: i=1; AL+hErFu25AB4n2rb3E1t6mZswlMZS4iKeUvNFcOPkalu+jwoFv6drOjsPxBiY5+LiJfFNONsn1P6ojgi0Vipnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IKr5u02dIzyEvWKC85iMR46Sbezrv4plJhdwVTKP1y8h04cis
	/Unf4E53w9GP7P+yxmy3KNioNuyCafEVLJCgQa6Ue1XeC91tIUWL0Xan
X-Gm-Gg: AYBFou3bE9+Q/ukiZ1DOChenZ9APPDlf/54tk73RsnBi2Cn3P5GtIX+krv+P6/pFZN3
	ESmNUGlFpH+N7W+KEhde7GK8LNMRHpmi+H5rFCK4U1CM14x41cNRognL+L69+6kwpLETfS1W8/9
	VOdfWoZf7gNxTUZiWRTh2cQc5sd/O3kcbQf24JWNkLOuuEcpDo7yPP7ld++b2zHA802WsjQm0se
	MYapY5yFap+vZsEXTVqU0gV75M/vtaIY45nDR7JP3/qW37YQt1YyemDB4Jg1pqG5T0vURWke2ab
	EHZNt0zRW4oJM+Kbsd8A46r6EiAzXxpjjRICvyWWZ4NQpWuUf+yaHyNuU+4bCXV5yhbrdtJfKOr
	auKV2P4Py59REe4MYE11t2p6OQXrbYT50lN7CBMoK1w8w1Lr4AjQonow/ykJxK3Mr+vAL8yulU+
	Jv+2F0g+f77iBFsAwOOua1XzNL8zuPAJwTHCKiYvE5LP+qte7AdLxLK7dfPwHlBPCgFaayXem05
	ljPz3uP1+zL8K3DtLPuEiNpX1VbMPvCFKIdap9Bt2qrWASqx1+7joqPUNrX7Q5+j0QLJ9Bw6vZ4
	gPlmE+r/E01pa8verXddGv8+NW+V0gRifbRT4P1M7ALs0Wr4V7sy0HdcqQacu06fJZ1QDyDmM8v
	E5c4zzbQ5XfPLnsF9Dwa7
X-Received: by 2002:a05:6214:850d:10b0:91c:60e8:a8ab with SMTP id 6a1803df08f44-91f241f6b64mr16509716d6.37.1794542607209;
        Thu, 12 Nov 2026 20:03:27 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db49c5sm11193506d6.41.2026.11.12.20.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:03:26 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Moshe Shemesh <moshe@nvidia.com>,
	Aya Levin <ayal@nvidia.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH net] net/mlx5e: Hold sync_lock while resetting VXLAN ports
Date: Thu, 12 Nov 2026 23:03:23 -0500
Message-ID: <20261113040323.2090829-1-lcy8047@gmail.com>
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
Content-Transfer-Encoding: 8bit

mlx5_vxlan_reset_to_default() walks vxlan->htable without sync_lock
and calls mlx5_vxlan_del_port() for each user port. mlx5e_nic_disable()
and mlx5e_uplink_rep_disable() call it after rtnl_unlock(), so the
udp_tunnel_nic work can run mlx5e_vxlan_unset_port() at the same time.
If that removes and frees the entry saved as the next one in
hash_for_each_safe(), the walk then reads freed memory.

Hold sync_lock over the whole walk, and add __mlx5_vxlan_del_port() for
callers that already hold it.

Fixes: c5eb51adf06b ("net/mlx5e: Fix VXLAN synchronization after function reload")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus MLX5_CORE_EN and W=1.

 .../ethernet/mellanox/mlx5/core/lib/vxlan.c   | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/lib/vxlan.c b/drivers/net/ethernet/mellanox/mlx5/core/lib/vxlan.c
index c2292cab4592..b953bbc4925c 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/lib/vxlan.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/lib/vxlan.c
@@ -121,25 +121,29 @@ int mlx5_vxlan_add_port(struct mlx5_vxlan *vxlan, u16 port)
 	return 0;
 }
 
-int mlx5_vxlan_del_port(struct mlx5_vxlan *vxlan, u16 port)
+static int __mlx5_vxlan_del_port(struct mlx5_vxlan *vxlan, u16 port)
 {
 	struct mlx5_vxlan_port *vxlanp;
-	int ret = 0;
 
-	mutex_lock(&vxlan->sync_lock);
+	lockdep_assert_held(&vxlan->sync_lock);
 
 	vxlanp = vxlan_lookup_port(vxlan, port);
-	if (WARN_ON(!vxlanp)) {
-		ret = -ENOENT;
-		goto out_unlock;
-	}
+	if (WARN_ON(!vxlanp))
+		return -ENOENT;
 
 	hash_del_rcu(&vxlanp->hlist);
 	synchronize_rcu();
 	mlx5_vxlan_core_del_port_cmd(vxlan->mdev, port);
 	kfree(vxlanp);
+	return 0;
+}
+
+int mlx5_vxlan_del_port(struct mlx5_vxlan *vxlan, u16 port)
+{
+	int ret;
 
-out_unlock:
+	mutex_lock(&vxlan->sync_lock);
+	ret = __mlx5_vxlan_del_port(vxlan, port);
 	mutex_unlock(&vxlan->sync_lock);
 	return ret;
 }
@@ -185,12 +189,14 @@ void mlx5_vxlan_reset_to_default(struct mlx5_vxlan *vxlan)
 	if (!mlx5_vxlan_allowed(vxlan))
 		return;
 
+	mutex_lock(&vxlan->sync_lock);
 	hash_for_each_safe(vxlan->htable, bkt, tmp, vxlanp, hlist) {
 		/* Don't delete default UDP port added by the HW.
 		 * Remove only user configured ports
 		 */
 		if (vxlanp->udp_port == IANA_VXLAN_UDP_PORT)
 			continue;
-		mlx5_vxlan_del_port(vxlan, vxlanp->udp_port);
+		__mlx5_vxlan_del_port(vxlan, vxlanp->udp_port);
 	}
+	mutex_unlock(&vxlan->sync_lock);
 }

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

