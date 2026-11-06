Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954284;
	b=EC80gRoq2DVIuIJhqwo8/qhTziVzQitODsPujTE2KJ5NDJdKGfMpSznwkC7kJKzIcfH5
	 5up6QQx1fJ7Xfs+a+2AXZZHOS8s1mM2FZccPjdoGlJFXrI3ARFbRCLRBhFAnJJkRvWVwK
	 6kd6hO3SSv7r4psXRwk0ravcbLIi1IF3HyzZURrtX4NSr5VzT+LHwv/6Vkto6lljUdC68
	 XDClFDGGVWtHOHtM0vuYzpOZN+hVlJwLSPDqqpEbhOFM/S2pFpxhE0I4xCO+TsYgUJISZ
	 nX3Ve++rnHKMY0TGsq6rPk2BNUS2GX07EKsR0kqQEPlsd1HwjuHFmvgx/pChXbdwccA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lCz99xV0pwCuHWp/MF8TtxJKQhzQ+E9UJnv/R9Hy57w=;
	b=NAhMQ+MYls7KYLbhzkiCCvFC9p+kYxNyIn3F3+ku/8gYdOYFZrHuEd6F+gI1QiJyJhhI
	 BjpYBXx3O/MpSeXvL9pk4Vx5Q5KT602cTc6bRMSL5RAOFO9NFmVVBlACeGQ+752znPoff
	 +agriadYCz4nWRX2ROwism3SxLYlFMze3nU8RlKk2Id/IGgkUl3qLVrfvDNsyy1uI6Hu6
	 8cKR58aw5EmAaNrV+GFkc0h3QxbuGzL58Tw3GgccWxwc6U5mRw4lB//h9m576YBK9Cyh1
	 74oifd64Gy4KQk8THxsRI4IXjagR1+tTVpUJqnBEdWH2pLlsEHByE9e3bK33v8iqhxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+iunVLZ;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE831606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE831606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+iunVLZ
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e934c6c20aso4320445ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793954283; x=1794559083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lCz99xV0pwCuHWp/MF8TtxJKQhzQ+E9UJnv/R9Hy57w=;
        b=o+iunVLZDINC4ehShCH14286mSr9iLWUncdmU/oFy1R6yw2eha5PgvV65arbMyAnae
         J7DA+Z27xjCldFjukhRix37WsZVVJH6lG8Z2Ddit/qNgozGq67dT1H4pTDg1EM5VKg7z
         u2l2a8ytkN4O09k6zbSPuZtoVPuHcBzjJ1+VimKYZpIim0fW1I2Moz54DctKEqsFPe+K
         RMC5ANzJjI75l0lH8u7NpDeZprppkL8tIJO9aL6Je7LbCPRGcfMtt0cYifrHqnK+Mrrj
         hxVUOHqnne+f/CJTYJvFI1HUyy1X7vOe7v//e1p1nb7U9jFdNqMAkhU64AeIyumsealm
         Vw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793954283; x=1794559083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCz99xV0pwCuHWp/MF8TtxJKQhzQ+E9UJnv/R9Hy57w=;
        b=sSLpZAv8A5In6LU3kLW/av+trXsHaWXsGYFsOYcNCobRYTlSpyYpWW/syPOOWR6QqY
         JiTszCrZQtjEOeEnqBh81VukUodFn2GOPkGgqytoGxSkd5Gn4vDctU40cNMXlJZMh5/w
         Iey5zMgMr3G0rjkB+tHSgoAQ2osXgIb5/AYrdcLgbJlhDE+409YBGmW/gIlQOuDBg3Af
         mGsO23YK20nt0YUaUoAR0zZfMACdNBH/ubpv8p0oKIBjU3Dxp2KPo8g/frWRR4kcEvCM
         bXrwS+39FLBHA/UQVwWRSAXl8JdC0oMuc03Dw09V/AWz3PkOmU3vqW7hCD67CT010UW7
         LR/A==
X-Forwarded-Encrypted: i=1; AKwUvBztubEohIyqH7n3vyV8qflcJp4uipavdKogWklmdl99ta2uFMBKXjOvjiEz7Zn8xf9Sg3Xishs6H7ubdcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H7dAEJUg1hHJyWsPmdx5E0GwgbRE6/Wn3OjLbyF9osKyknozU
	fxDxw2O5DC116nxA9CJu0VCS7qujPOqMX+lCYrVEcht5RwhhD2enysTv
X-Gm-Gg: AYBFou2ZExPVAZhKfo9u/4lFYYmkII0hXGlbK5C5elAkqf5poS3DRr3kCU4gI/AzZWV
	+oTQXVseryqs5dWW0vOrQlxUcPpd1mJHi8sOtigPZWZcTgtgbmlA1hY+RDJCpa7jFyHC6S0vNdP
	zHVGlyRQpI+kJRLMUr+baZ8XkwomC3RuvNwF6mSKwDjPthpnOUY5wyPKc7n83Wg/7zep53xCq1D
	Vv1LaTPoSqXyi6tkGA1e3uI1SOQTdQDPyLJZqZXa8q5S2jzi8ITd8gTgIqVzVgU5YegS816GArd
	uAG6cBJ2uU3mQdt84zm5SaTji78DZwST2b4eRDHmIpRKpkWxbr5KnFTjAtfJy/g+0mdfS+T1fl2
	OOTOALcaOQXy4xw2rOZNvOf44TCL4BDG+vTxaahTSjRnFCMMi3HIg6+zK4B8bWEYkq/Fgj27jEZ
	pd6tJY975wSQsKkXPKXuy+yZ00+yvc8WyRbaeqIHpO+AzNdMLA4FusxNoKc0IkF2ikppQcmk7LA
	R7CT4MW23g8/L1Lquz49BFZENOzD3DUdY1f7DdWYc8DYX6Yt4A+BHTaIAYIqEYg3F+hpPdwZYiz
	VxP/mHnccUgsmRRd+HnIJuJTaiX0/vQPk/h2NSg4nSiTkcA=
X-Received: by 2002:a05:6a20:1449:b0:3eb:39fd:bacc with SMTP id adf61e73a8af0-3ebb2a9e69dmr2297053637.50.1793954283154;
        Fri, 06 Nov 2026 00:38:03 -0800 (PST)
Received: from localhost ([164.52.124.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3596fae32sm414537b3a.21.2026.11.06.00.37.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 00:38:02 -0800 (PST)
From: Jiabin Deng <dengjiabin2023@gmail.com>
To: netdev@vger.kernel.org
Cc: Dragos Tatulea <dtatulea@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net/mlx5e: SHAMPO, Disable end padding when relaxed ordering is supported
Date: Fri,  6 Nov 2026 16:37:19 +0800
Message-ID: <20261106083719.22798-1-dengjiabin2023@gmail.com>
X-Mailer: git-send-email 2.56.0
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

When SHAMPO and relaxed ordering writes are enabled, aligned RQ end
padding can corrupt TCP data received directly into GPU DMA-BUF memory.
The receiver gets the expected number of bytes, but some payload
prefixes are zero-filled, with the corrupted ranges ending at 64-byte
boundaries.

The current RQ end padding selection avoids alignment padding for LRO,
but not for SHAMPO. Extend the condition to SHAMPO to prevent this
corruption.

The issue was observed in a two-host test using a BlueField-3 NIC and
an NVIDIA H20 GPU. In the original test with MTU 1500, 354 of 400
transfers contained corrupted data before the fix. After applying this
change, all 400 transfers across eight message sizes from 32 KiB to
4 MiB, with 50 transfers per size, completed successfully, with no
incorrect bytes or corrupted intervals.

Fixes: e5ca8fb08ab2 ("net/mlx5e: Add control path for SHAMPO feature")
Closes: https://lists.openwall.net/linux-kernel/2026/09/15/154
Link: https://lists.openwall.net/linux-kernel/2026/10/20/1322
Suggested-by: Dragos Tatulea <dtatulea@nvidia.com>
Cc: stable@vger.kernel.org
Signed-off-by: Jiabin Deng <dengjiabin2023@gmail.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en/params.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/params.c b/drivers/net/ethernet/mellanox/mlx5/core/en/params.c
index 5caf7820a136..159f79302a08 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/params.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/params.c
@@ -911,10 +911,11 @@ static void mlx5e_build_rx_cq_param(struct mlx5_core_dev *mdev,
 
 static u8 rq_end_pad_mode(struct mlx5_core_dev *mdev, struct mlx5e_params *params)
 {
-	bool lro_en = params->packet_merge.type == MLX5E_PACKET_MERGE_LRO;
+	bool no_pad = params->packet_merge.type == MLX5E_PACKET_MERGE_LRO ||
+		      params->packet_merge.type == MLX5E_PACKET_MERGE_SHAMPO;
 	bool ro = MLX5_CAP_GEN(mdev, relaxed_ordering_write);
 
-	return ro && lro_en ?
+	return ro && no_pad ?
 		MLX5_WQ_END_PAD_MODE_NONE : MLX5_WQ_END_PAD_MODE_ALIGN;
 }
 

base-commit: fafbc4051123d5459ea6950899cec08ed946e278
-- 
2.51.0

