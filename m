Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84423988E3
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791048270; cv=none; b=gqvYyM4UIDYW9FRAwgzsjRy/FqxuMFfHGqNwCVzEFCzip7708rkz4FT8mH7nFqkbnCN8zu32H5H4DRP+f58qV3dLtfXzPynh/dd9/fNlp3bOfYMQ/n0fL1pbhIQxRgwESWbOcg1sQFFEoLMNV92jGwO61IwPpjYiBxqN3U4ucjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791048270; c=relaxed/simple;
	bh=j8WfZM25R0+QhyXpXjIjt66QepTS/1wm1XMSDTZKWPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pUcbcxsYGLx2dgjkD54sR559seZuzpaiLjdD6rgG1axcaMT4zPotTLP9hiaMvGoeyrAywNE0tmPuR/Uyx8MDxkyk3oSbUzvMh/djRlsrZZqArRtGiJNS67AUf1v6+QhfD9RFX7sUk+OMZ6IIOOXc7u3drQ3bPVykkAp/NgrNdVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mORkSbLy; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mORkSbLy"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso686226a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791048266; x=1791653066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwESjgjGmOODAosLiJdXPB6PaALuW6BTXcYd/o9buRU=;
        b=mORkSbLyRpbzfRNGx3luSy3By94hgJ5zZ6mEMRK35WiWCIGP5cZIOoRkJeJ9h9Q8Oe
         goD2aYVCsSbJekRs6r29yRy3Hln6Swv0YrazHuxToSxY0bBhqoZ26sYyyVy6EG2Eixrp
         ylKmHEvt5mbEnt6hINJY38Yg+4SFQTYMw4PxcjgvDSXcuNq+HQRhG6ch6kSERqy4zwfQ
         nGiIsCiYnBA5MdQaa4aDXzgPCfVCEl+cMJT+CIlAuGaPHoukRFLyoAbwWL0VdOb0jj3x
         GXowcMnOF3yH/rp4/HMTUfHoK5WDhiuda7JVnZfNovXJY2AoL9f6hTqh3Vvw+C/cgWh0
         wPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791048266; x=1791653066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hwESjgjGmOODAosLiJdXPB6PaALuW6BTXcYd/o9buRU=;
        b=xco0PtwxhM7LRf1TQ6fy07shuWVFIUQMrsmArSblVc739LJJGuZIV8Twk1Eqqx1Bug
         Xr0vbNz8D1F+ZoWG5+tXnI+bhwI+k1b9upLoEIeU0yL5qX3F+tIN5dVxZPYqXFqD6BBb
         pXitK/EFFOo5ScSWC65l1cRqIiXubu03abDwqHjSdmXxKu3L8GWgwIOdddRBZGTVIiZi
         Oe2Js6KulRw7BEMwObkzR6H1Jyc+haCgoENF5NEKE+Qap2TN2K6Y9cobVN1uD8GzRvnQ
         zmtZMMBR7asGjXx5lHS5BM+gjs32yKSCiu1c6qKMJCXX2Zx3Q70QXR7954SGDLn9PtA5
         G74g==
X-Forwarded-Encrypted: i=1; AKwUvBxTx4cjrkgjGRF9OcOysILLN87XKf4RgaNpWv+84C1xmnkbSmtAJph1w5dI6KNQkqeCyvQ8KfEbmr2cb+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgMJG3ivMW7wQIq77fPjiNceCgR0VgllFD1JIMurezabzstFgi
	n5hZs4YsGnvQFebxDDdbGAwKdXX4OoRcFAtPlaDZlAW/S/Jo7yALyO81
X-Gm-Gg: AYBFou1TM1tleFCNkJbltgX9AzULnp5XqeqC35Nh4SSv1Zl14UV+hZXuHjOrJT12Y2x
	KTcAmddijF2p42Qu4apIAV3PiZhPeU1zmsZOyz5s3HjxclWhtU1xtJjWwW6IgM7L+5Fzrk5fDuw
	e07pnkfVU/Jh+4VB3BI/iBStG8x6lknjhWKE7Jywc4fWjUiKFh5c6OVP+It6x5Cl5OntR870yTa
	iIAw/atZTFerTchtD0X+jn1MExxrex8C03MauL6kGSQrXI9usI75BSISUu/7hS6vloy2WTewUN6
	Ilf1o+U4JzIoRVjGEMWBa9+HDk3SuSnoYkBdAjVwobsRQPLzfE2+0pAUqKjdnr4xY8fom9JmNtK
	18Yccv5PqmYFAtOl5Ic+t12DwsQ8hHdyLs5XtpCk6L3iUreZ80q5YHAMHy+0YMCdIGK/bbJ+FVC
	bP842VkqXVXJzsIuE09EtnJd/1jXtjB7iB73PH7kL3J7rEZZvrDZGhgq0pHvSmECu0Eqj6z/8sY
	6/UcCdC6mdV8SmfbiVvVwXoKZ59vp2lXZozJ38OIuRkd8bWMrimTGgD
X-Received: by 2002:a17:907:3d4a:b0:c25:6230:dfcd with SMTP id a640c23a62f3a-c2e4ad57a39mr567457566b.15.1791048265976;
        Sat, 03 Oct 2026 10:24:25 -0700 (PDT)
Received: from localhost.localdomain ([2a00:801:793:68fd:7995:7ccd:ec2b:6712])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf87430sm211407666b.64.2026.10.03.10.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:24:25 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: netdev@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	John Crispin <john@phrozen.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 3/3] net: dsa: qca8k: fail mgmt Ethernet MDIO access on busy wait errors
Date: Sat,  3 Oct 2026 19:24:04 +0200
Message-ID: <20261003172405.342-4-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <20261003172405.342-1-yongzhao.derek@gmail.com>
References: <20261003172405.342-1-yongzhao.derek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qca8k_phy_eth_command() polls MASTER_CTRL over management Ethernet until
BUSY clears, but only bails out when the poll timed out and the last
poll request also failed. If every request succeeds while BUSY stays
set, the -ETIMEDOUT is dropped. A read then returns MASTER_CTRL data
from a transaction that has not completed, and
qca8k_internal_mdio_read() does not fall back to the MDIO bus.

A failed poll request does not stop the loop either.
qca8k_phy_eth_busy_wait() leaves the value unchanged on failure, so the
BUSY test then uses the previous value, or an uninitialized one if the
first request fails.

Stop polling when a request fails and return the poll error or timeout.
The poll-error path also leaked read_skb, which is only consumed when the
read request is sent; free it on this path.

The Sashiko review of v1 identified the dropped timeout. A userspace
model of the driver's functions reproduces it and the poll-error path
with scripted BUSY responses and failed poll requests; these cases pass
after this change.

The polling loop comes from commit 2cd548566384 ("net: dsa: qca8k: add
support for phy read/write with mgmt Ethernet").

Signed-off-by: Yongzhao Chen <yongzhao.derek@gmail.com>
Assisted-by: LLM
---
v3: Target net-next and drop the Fixes: tag. The commit that
introduced the problem is named in the text.

v2: new patch, addressing the Sashiko review of v1:
https://lore.kernel.org/netdev/179054715863.3145.10179961093285192493@kernel.org/

 drivers/net/dsa/qca/qca8k-8xxx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 2708430413d..07227ae8bc0 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -728,12 +728,15 @@ qca8k_phy_eth_command(struct qca8k_priv *priv, bool read, int phy,
 	}
 
 	ret = read_poll_timeout(qca8k_phy_eth_busy_wait, ret1,
-				!(val & QCA8K_MDIO_MASTER_BUSY), 0,
+				ret1 < 0 || !(val & QCA8K_MDIO_MASTER_BUSY), 0,
 				QCA8K_BUSY_WAIT_TIMEOUT * USEC_PER_MSEC, false,
 				mgmt_eth_data, read_skb, &val);
 
-	if (ret < 0 && ret1 < 0) {
+	if (ret1 < 0)
 		ret = ret1;
+
+	if (ret < 0) {
+		kfree_skb(read_skb);
 		goto exit;
 	}
 
-- 
2.43.0

