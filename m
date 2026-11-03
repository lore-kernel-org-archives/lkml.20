Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708477;
	b=YHfQJup85wKBpNoRptlCRdPnZ2alX9wp+dDQkgZqTVTVHMz9f47vNeEaXqkO84749pA9
	 ss339aTrM6qFzcY9f0P4FnRb/IXAw7enzIyZKs+bqpURH+7/Yxrprk71gHrb2JZb23uC+
	 kwNUfK8ctzCiHkznYUJoqE2kchTdxBhr3s27ho0BOZetX4Btv/E2zKy0G67xF5RLtyguS
	 7ZKvvj1sl+4Ua8c4x/KDTA5jTxeDDxHQdXlxP4sA/qirg7Vd48HnNBcXuwVKR0HArfYur
	 VG6QVFYZaiXEr45RTv4HA/HoE05zoX1SPZIXsSdXuuYG81y/FYNBZa67sE/wT8iPYTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ftzGpP0ulPi0xGwIl3ZzcJGVoGV7Otzfx0qZQUNaagQ=;
	b=esPtQiKD9S+2CdjDKd31Me6xCDDPzX1DZjXVZFD9K3v7fjxmKnLSy0Yl84fXkloMtQsh
	 K5YwBsaQZENDU+NCnQrNKDWOMMmkPc3nYMZnPL4fNt1y86sHlXOoczi4YJKxrBPuDAMxL
	 tRkdZ+cfxTRQX6S8H35010o4LQMF+tkakBVfoupRrpxLVnLfLEc+0+NjgyODuKxE8YFys
	 B23U3Q2B0mC39muzt4UpmvgLqIo81mEVDRn4O7uB9f90QOPpuQdPClc4+M4+N3AAA8Idg
	 vNulXjpZVll9Fh8Xg5QOo8CFScjRDsNp2rvbx/361A6+5bSM+GKSXGNiISX+I0eKWHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvh2JQpB;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8939A606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8939A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvh2JQpB
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso45974935e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793708476; x=1794313276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ftzGpP0ulPi0xGwIl3ZzcJGVoGV7Otzfx0qZQUNaagQ=;
        b=fvh2JQpBOu6cM29Ph7fUxFpEYbdaym81ejC6CL8VJiAP7BOyDllLvM8BGNfB44Hfx9
         Ozi4LlYF8HzffdDY8ExE4TxcuiTSfS+woc4hiVBfCp9+LnI4HjfhgrQ3aIqqaTspn6Oi
         In6aaRZG8QYujzoip+UPV5MJ1pSQ8dAKxjoNgE+G3aFeskF6jnD9WJI0mpMgRvFj/9D/
         ZlXMDuYgtMOVCcKICTfFYDprdp5J9/N8wJ+I9YOMZDJkvzEF/pKjgSy+p5hykfYcMGKI
         8VJQL8q3/BUTBpEeuGK49JPTRbUs6eIOrHEss+F+BtHJX0sCez5Q49zVvnB1fpwkWsnQ
         F4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708476; x=1794313276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ftzGpP0ulPi0xGwIl3ZzcJGVoGV7Otzfx0qZQUNaagQ=;
        b=Sl5nqFcCj5IrnfgeEb8/84iNMLKPG/tdbBfN7SRvN9gY47PjH33tdZKZBfzeMyDX1U
         i3jwCfd9Jh1/aisQ3z+yqai8DzZ+4TDxzZIv0MdsJAklELjk6nAuioaVrK2HLrNpS3Ok
         QsOtAF7bWOUvLQcJNpGiPvzESqIU5lrHEDxFncf0OHnAFUBpCNK4wHvgm7Keo2ANe0GK
         MYieAOJ79rBXir8IV7tva8hF0usazICTKD6ctzZ2jln/GpriBPIGMtPXvFMPlrWnNMfP
         dSEH3E2B6vOtJtLchIYJgfcCCLBqW8XrjGb6WnLZ7eyBrc7Dx0YFsLjaHA2qL3ve+enS
         oFWA==
X-Forwarded-Encrypted: i=1; AKwUvBxLdJQDohnyoX3z/jaLLBSfltLxXEBNkSzwSyxoD0U9ZW0jCdHpTEqi98fJ+crrvGQGn15L/hOcHyuOyik=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rN3p5vSi33WKYxcBSGZV6XDOUy6hDYBMBJp8ewZ0gpFX+kzGr
	oMeaNSvR/30xWsSjCSR2vCTHel3TAmYCCWzj7fcVnyufQHrZW8OhEWq0
X-Gm-Gg: AYBFou2IKeUdfR5ROoAPdu/M2+tFzzeyMWhp3LqY/DT+UixUWTVaoCtw5Jo1KB4tDs9
	H5WhkcLKLtcWPpTWkcWkOIBKKl3SMZCCJlmTRuyrotyp+IgUT3tu4GHTXl1RXFOrdrhx/5qRtew
	qhKDpimj6AMrjRnvfCdRIVcrIDN2uwMhCHaOz05VyCkN4g/3xzPLw1P7yGV9z+MXrtSAWT1fupK
	Bh0OXBV3hZikXIqUWdfycOf8kd9TUlBag/eUSm/JEYv0GDh/zdPv02E4897bnsJoqN7btjjZCNC
	p34YKfxVCuqBF64xRLWC28d1xVAK4Ne009xPnG/OVm6wqRzZ2NwWwXPgRoAXTisP8LImNj3bXPr
	QchicqEyDItEfmguauTKzz8wvdgzBH8hSv9MkmyTmFVaMazQlD3U9DBH9346evZw3Gccsb61O10
	us/9AygCyp/oc8xFfBYVLokXaNiL/au+HSzJdbY2gd7HZ6OT7DEBwg9Bc59NuI216M66m1qO0zZ
	SaV0d3UUa5giBPPoAplz4rpmhpt6U/lPeoqPpXn4bqqPm7/kaTL/YIW99x3ul29TqI99p6VWifx
	YZgqAnHyXyNz7wVFKcUiPKafhcvbSgyNGagQHsnz1RL2Yvul+CGXYTDWaAD6s5nEBW8x5+CouWd
	33ffxU8fq2ycpf5aYGz/ecS29QIHo3JuX7HsKGAIZo+OhIP+QOeBhyT8T7QY+nBbbT7NlP95/KJ
	wnSfrwUdTjrvp0p/PmDWKVjfE=
X-Received: by 2002:a05:600c:a00a:b0:4a2:190f:cf6a with SMTP id 5b1f17b1804b1-4ac19802310mr295970745e9.35.1793708475722;
        Tue, 03 Nov 2026 04:21:15 -0800 (PST)
Received: from uk-shared-4.. ([62.89.143.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm105111815e9.14.2026.11.03.04.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:21:14 -0800 (PST)
From: Peter Morrow <pdmorrow@gmail.com>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Simon Horman <horms@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Morrow <pdmorrow@gmail.com>
Subject: [PATCH net-next] net/mlx4: drop the unused is_supported callback
Date: Tue,  3 Nov 2026 12:21:08 +0000
Message-ID: <20261103122109.1798144-1-pdmorrow@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Since commit 557d80138618 ("net/mlx4: always create the eth and ib
auxiliary devices"), both is_supported callbacks return true, so the
checks in add_drivers() and delete_drivers() no longer decide
anything. Drop the callbacks and keep the aux device table as an array
of suffixes.

Tested with this change applied to 6.12.113 on an Azure VM with two
ConnectX-3 VFs: both auxiliary devices are created at boot, and
removing mlx4_ib, mlx4_en and mlx4_core deletes them cleanly.

Suggested-by: Simon Horman <horms@kernel.org>
Signed-off-by: Peter Morrow <pdmorrow@gmail.com>
---
 drivers/net/ethernet/mellanox/mlx4/intf.c | 44 ++++-------------------
 1 file changed, 6 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/intf.c b/drivers/net/ethernet/mellanox/mlx4/intf.c
index 31860b4ab..1e136203b 100644
--- a/drivers/net/ethernet/mellanox/mlx4/intf.c
+++ b/drivers/net/ethernet/mellanox/mlx4/intf.c
@@ -41,23 +41,7 @@
 static DEFINE_MUTEX(intf_mutex);
 static DEFINE_IDA(mlx4_adev_ida);
 
-static bool is_eth_supported(struct mlx4_dev *dev)
-{
-	return true;
-}
-
-static bool is_ib_supported(struct mlx4_dev *dev)
-{
-	return true;
-}
-
-static const struct mlx4_adev_device {
-	const char *suffix;
-	bool (*is_supported)(struct mlx4_dev *dev);
-} mlx4_adev_devices[] = {
-	{ "eth", is_eth_supported },
-	{ "ib", is_ib_supported },
-};
+static const char *const mlx4_adev_devices[] = { "eth", "ib" };
 
 int mlx4_adev_init(struct mlx4_dev *dev)
 {
@@ -98,8 +82,8 @@ static void adev_release(struct device *dev)
 
 static struct mlx4_adev *add_adev(struct mlx4_dev *dev, int idx)
 {
+	const char *suffix = mlx4_adev_devices[idx];
 	struct mlx4_priv *priv = mlx4_priv(dev);
-	const char *suffix = mlx4_adev_devices[idx].suffix;
 	struct auxiliary_device *adev;
 	struct mlx4_adev *madev;
 	int ret;
@@ -211,7 +195,7 @@ int mlx4_do_bond(struct mlx4_dev *dev, bool enable)
 		priv->adev[i] = add_adev(dev, i);
 		if (IS_ERR(priv->adev[i])) {
 			mlx4_warn(dev, "Device[%d] (%s) failed to load\n", i,
-				  mlx4_adev_devices[i].suffix);
+				  mlx4_adev_devices[i]);
 			priv->adev[i] = NULL;
 			continue;
 		}
@@ -258,21 +242,13 @@ static int add_drivers(struct mlx4_dev *dev)
 	int i, ret = 0;
 
 	for (i = 0; i < ARRAY_SIZE(mlx4_adev_devices); i++) {
-		bool is_supported = false;
-
 		if (priv->adev[i])
 			continue;
 
-		if (mlx4_adev_devices[i].is_supported)
-			is_supported = mlx4_adev_devices[i].is_supported(dev);
-
-		if (!is_supported)
-			continue;
-
 		priv->adev[i] = add_adev(dev, i);
 		if (IS_ERR(priv->adev[i])) {
 			mlx4_warn(dev, "Device[%d] (%s) failed to load\n", i,
-				  mlx4_adev_devices[i].suffix);
+				  mlx4_adev_devices[i]);
 			/* We continue to rescan drivers and leave to the caller
 			 * to make decision if to release everything or
 			 * continue. */
@@ -286,23 +262,15 @@ static int add_drivers(struct mlx4_dev *dev)
 static void delete_drivers(struct mlx4_dev *dev)
 {
 	struct mlx4_priv *priv = mlx4_priv(dev);
-	bool delete_all;
 	int i;
 
-	delete_all = !(dev->persist->interface_state & MLX4_INTERFACE_STATE_UP);
+	if (dev->persist->interface_state & MLX4_INTERFACE_STATE_UP)
+		return;
 
 	for (i = ARRAY_SIZE(mlx4_adev_devices) - 1; i >= 0; i--) {
-		bool is_supported = false;
-
 		if (!priv->adev[i])
 			continue;
 
-		if (mlx4_adev_devices[i].is_supported && !delete_all)
-			is_supported = mlx4_adev_devices[i].is_supported(dev);
-
-		if (is_supported)
-			continue;
-
 		del_adev(&priv->adev[i]->adev);
 		priv->adev[i] = NULL;
 	}
-- 
2.47.3

