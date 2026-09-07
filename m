Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DF043E08D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788818087; cv=none; b=RV3el8/KWXDwDOqzTnrwk4BiLiQFSiuw0Ry1tffgQr+bwzM2YkrdGI/DQEmTb1b/J+eAlIbxs0PW/a+U8um8KEL7WlCpJEwNGISS3PGO7Ji+D2+Pr4cevDojflt4ksLomw8O/MsJsXgdSlICVKNfO/WSZK2cNChVTkyflAIao+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788818087; c=relaxed/simple;
	bh=IP3L6pBU5bVozJYxZfL3JKIxB2jBBWGILGPvMqinRBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NDjmiXDqSy0hYeKVfbGTOBWVRNKz+siDUPS8fEHImufw3gJGG9G4HY2j+s8oL4yu2rvEmiPIbQIFJ4etQ+KFuoAXBpssLk5LEHYiAu5g20VSNCYfungXW3sAERxsnGWj5+rHEW8kmreIToPfJxDJJoJB+8Z/HecK3E9xvgCpiG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5NmP/Hn; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5NmP/Hn"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d4eb63f16so2583327b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788818084; x=1789422884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6RHq+lKbojD+F3T7fWOVIQ9NEbYVOA2OmDM0VbI8dbM=;
        b=J5NmP/HnBJ7ZjJCq3g6ztm66yqqE2J2y+e9rQlaXHdXrc+bkRjsbLGY26EVlih62xY
         x9/X7HlAgQuLvjzFiwPbZwWv1dqwvg/OpzAL9MKuIwb6W16A/fPeFfOB8akW8hOVaMVd
         6Si9owah18wNXF/wxlirtVsjimFaKoGN4BRwtxHNqY+8MIdWSa+pMXCBnk5ZYhf13Umx
         o7np9GHw0mPBmotTX5PPy8+00yps9K21hmRxB6NYAo3rEGQN/mX6JrdHQk5DUXJxNWBK
         tf3iTaO2gR2On0tw213e0WHPw2nPB+ttdK9HlZZ2bPSPcNxqh1fUaLRiDKAjQqK/wfsu
         93oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788818084; x=1789422884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6RHq+lKbojD+F3T7fWOVIQ9NEbYVOA2OmDM0VbI8dbM=;
        b=MwZQTnQ988omtM9S1/+eYRVbVrboxQ27LjPXkGjLrSVhRBcvtfbozLiRG9YITT2YUj
         p60DS/S9gRg4yrZtjYp+sBVHMDwAjRWPj+lfu4qwGQvxiU1vo6zvk6bDErEoFjeiLUwp
         P5igXXojsNh9zzJ47Mz/OSPmudXpApcdc/B2xNikbPMJTfKr05/F9MwsqtAm1Ut1noAK
         HFb3k1KAqKN2/2e/SK1S3IujWhTrHeqnJiPiJy1TAFZwNhmCqy0lEDYBy3c4dIlcYV45
         H7FB+6/g4ioqGZyG9Hvsl6zTw0xBACZ5R/efuF+wx16RWOIlXOiBMQ6xqCpm3NZRP3X8
         LT8Q==
X-Forwarded-Encrypted: i=1; AKwUvBx4OHpaP42b+hb/VYko1QB7zXB3GuU/md1n5m0I3b0dVSRBv8EPSHEURsGtTqiUGICWic3myoB5/GbeeU0=@vger.kernel.org
X-Gm-Message-State: AFuF++kPkagDGOqhy0r4lJX8irRYBstnDiolOJI4BMAiAwIfX5h8EZam
	BccKuCUcn3HKEBqHE26mGMYhvGnvT0Hk21L35Wg0VWhQebq9p5jVF4R2
X-Gm-Gg: AYBFou1Bpjl7kCmodnq5wQxP/JQNLEOp0DJfLy6Kp9yB4l7Q9qXiVlvS0GvlM8DP47F
	Zw8SRmLpWW0Nx85P7Ul264VtT2x8NFfOAb/NrpJGBufdbep/FpoPy/TWZIZs/VAl+CF27LcUToj
	oHEcfp89jYBfuOIa2kSxI+Fg8d/Oec8QrYflI+ZB629QxhXjxtRYhsxf7VtB5wP9gy7y0uwUi0t
	OvvTg35MycRntLiu1D5CPTiFaLM5wOqk1ccG6s69AlyctUUWy5l2t7yt1VK4X0g9sho9Jb9ItKg
	3tk+yeH3hptpHxGTmx6C1DSoNLeFH54jJeVy8aBYAWQhX3L9LNNhNL1XN6vQSQSFNiazDXsp9Ls
	gWTloxRpxyTl6JvYCzDV+Ko7tYJKVx6spkKS88yO0Bh7+IK3mAsIc11dwP1vurUahrFLfX0uFOn
	XZcpja9nyr1rANiWsuziWDa7n/CZnssep7xvLRM1uUvdLX+OM2Y1dyYlEQhoakfQtNHPie3qnNY
	912t2vNpMrAxoZAy8vYXTZ2LIzN
X-Received: by 2002:a05:690c:39b:b0:7ef:9fd9:db07 with SMTP id 00721157ae682-87c098a896emr9838697b3.12.1788818084460;
        Mon, 07 Sep 2026 14:54:44 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87143bb048dsm77918817b3.1.2026.09.07.14.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:54:44 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Prashanth Kumar K R <PrashanthKumar.K.R@amd.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-usb@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 3/9] net: amd: xgbe: use linkmode_and() return value in xgbe_set_link_ksettings()
Date: Mon,  7 Sep 2026 17:54:32 -0400
Message-ID: <20260907215439.409858-4-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907215439.409858-1-ynorov@nvidia.com>
References: <20260907215439.409858-1-ynorov@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bitmap_empty() is O(N).

Use the return value of linkmode_and() when validating the requested
advertisement instead of scanning the result bitmap separately.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c b/drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c
index a9f4fcc4daae..113a10855938 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c
@@ -231,6 +231,7 @@ static int xgbe_set_link_ksettings(struct net_device *netdev,
 	struct xgbe_prv_data *pdata = netdev_priv(netdev);
 	struct ethtool_link_ksettings *lks = &pdata->phy.lks;
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising);
+	bool has_advertising;
 	u32 speed;
 	int ret;
 
@@ -267,11 +268,11 @@ static int xgbe_set_link_ksettings(struct net_device *netdev,
 		  __ETHTOOL_LINK_MODE_MASK_NBITS, cmd->link_modes.advertising,
 		  __ETHTOOL_LINK_MODE_MASK_NBITS, lks->link_modes.supported);
 
-	linkmode_and(advertising, cmd->link_modes.advertising,
-		     lks->link_modes.supported);
+	has_advertising = linkmode_and(advertising,
+				       cmd->link_modes.advertising,
+				       lks->link_modes.supported);
 
-	if ((cmd->base.autoneg == AUTONEG_ENABLE) &&
-	    bitmap_empty(advertising, __ETHTOOL_LINK_MODE_MASK_NBITS)) {
+	if (!has_advertising && cmd->base.autoneg == AUTONEG_ENABLE) {
 		netdev_err(netdev,
 			   "unsupported requested advertisement\n");
 		return -EINVAL;
-- 
2.53.0

