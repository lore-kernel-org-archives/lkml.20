Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05804F7CB0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633228; cv=none; b=PqgQgpnOgtqfnGjfIv09wFhEsU5mWk3MfMHQpWsYxwYIftQ8WK1iezFFQ714/hHnDtRVZIXE7b9V0CMjSRZN+gKJiQV1jhuLr58o0gxsS/Xrgehinfyn9vNCMFtZaOhrlcNX+ilrxLj3h5BTGvpmMm/+8ZWtS5xW+zNGCqo012A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633228; c=relaxed/simple;
	bh=LBdGe8R4oviA310VZyXHJ88W41OaTYLb/e2Nhki1T4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IPykDNKv1n/X6UfE1hJ3+pww71qfEZluZzVTllM6biEbslMBETMEF4OT0eqOa/l8zLAp500HarsOzn2rQIBMeNPyufVVuzIdS2zr54uEaqnRNHChdiHVmPwKJChktBaeokFib91eOwc5y0hSAxFsPqAIopsFF9lXbl2KCiUGm68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1GF3vv9; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1GF3vv9"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c264788fd58so512995566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790633225; x=1791238025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U7L/fn4+DNGPLasPjiTA/4S/hqwTcpwadDXw7wo7nOs=;
        b=C1GF3vv9Zs5BXs9CHl5zyV7h+uldCkXp17idOSiFQB49P9YGxeJxqEgVx3iicqIZLK
         DiMXPeFRbNpxHPMfW7KPoandFxXfdgFTfFabopuFMFgw1nURwhJzlyRNcK7JjYm3D+vM
         00/2+leYkgNg5KpuX3JpePV3SjEyvPQHe4fzETVgKOagtN86gsUx0YG20g1PXx9OgjmD
         Tx+Dum1gg+FHmFjhhkCk5WZX/DGTqm5C5V0HuiYfV/EhAYe+SUrmutH65Ddwn6O9KZ6M
         cWK2UMY4u+VHVxkUkyXKPJclpfOpYku5c9ycCbocsa3fC8UgaZ294q93/1YkE2cFn+Sw
         3npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790633225; x=1791238025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U7L/fn4+DNGPLasPjiTA/4S/hqwTcpwadDXw7wo7nOs=;
        b=Zz3D6vt6sFSPL23G2cfEjYJljhsjDx2kQQeVEVUInftP+q0WBi5ZK/tORZQftvZRfe
         2U9PkC8cXdKPGAhBMM2/C+93oJuqDYofpeRdpPP+9PDausrhDuzGrrj15YE6AARmdI8N
         DNCc1+qCeFAYIDxUZ6h7E8rFNvFE0BNvQktymcNs75xAdcMhPMECNa+s6MTUFSFyOin5
         1HmSVQRpCSBbS5WozxajvDzMB1ubtKxig2NrATJnwl4OCZF431dy2u6qHXSOrCTdVGow
         TTGCMbT3lc+jsM1yPugqMJAfzao5TU0JohGQ7L0uOCpFl//1HenFNMUYrPJFMLtBxuD2
         n0Ww==
X-Forwarded-Encrypted: i=1; AKwUvBzx75nuuZc39FgeFFRx4+7bvl3uHOVaFCd+DfFH+fMuEuMv5eiwl6Sye0cjfSws394A5HsoJupyOHO/YLg=@vger.kernel.org
X-Gm-Message-State: AFuF++m8U8TgiRSoLNUK1Eb7EWprUWjOoUmPKPJsxzDXeIf5AgFEc3d3
	zXQubc/h86cn1S/VaP7fc0J3N7qMaaCAq4Eq+ep1hnoR99DZuj/QN4A36Xn+mMkLwzIUEA==
X-Gm-Gg: AYBFou3DjQl3IUCm6c12Tw8ec8em13fRGpqFaK2t0COEkdSOmDwR0REYIzA2P4ogNFx
	EAjDBAeLrxgZk6VvXUOYCFdnMe6kXuhBLVS6JQePSrmvQ/iVAKBk4VOO+sgbcOV/LKBCBieGv/3
	0blZi58qLI6MpskTeiOvcfUHiRSyTkMM3NBPdoL7dkmVm+Htxl1YncM2gAIRF01C1tfNM57nb5W
	Yi+iEno0H4EEVYXzSl6AY3DCZPQiU52/uVd65bB2ZSkr/SGGqLAPd6SgD/zI0mgTWhvUzQE+GJV
	UvS2s5P5WX1aPXC6qMGl6vPq7jPxyGIcPBh3A4trwwPp5WdzokVOlBQuURQIaGphXsqk4HifLZj
	erZm17+Mgs2T/TmoyjZ4iiu5YP8yK/VfzWHFs2p8j91CpQ+MlpcxkgOdjsDDxWiDy3VzrCmrBFx
	OXIc7hleNHCgcDa/0hhHJqkQ0zWodsYKeG2n8ew0uN5wDOjA4pyisJfeeRkSOMWXQ4MHPV5+9os
	Fg4aHW6o+kIlPTm9Qw3+0U8ibWO9Cc9dEBvh2XE9R4KQrGh+L7y5eWb
X-Received: by 2002:a17:907:c50c:b0:c26:2751:3da4 with SMTP id a640c23a62f3a-c2ae97cc828mr890313966b.13.1790633224767;
        Mon, 28 Sep 2026 15:07:04 -0700 (PDT)
Received: from localhost.localdomain ([2a00:801:793:68fd:c07a:9093:1956:b4bf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b50fsm520177266b.32.2026.09.28.15.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 15:07:04 -0700 (PDT)
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
Subject: [PATCH net v2 3/3] net: dsa: qca8k: fail mgmt Ethernet MDIO access on busy wait errors
Date: Tue, 29 Sep 2026 00:06:29 +0200
Message-ID: <20260928220629.238-4-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <20260928220629.238-1-yongzhao.derek@gmail.com>
References: <20260928220629.238-1-yongzhao.derek@gmail.com>
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
The early return also leaked read_skb, which is only consumed when the
read request is sent; free it on this path.

Fixes: 2cd548566384 ("net: dsa: qca8k: add support for phy read/write with mgmt Ethernet")
Signed-off-by: Yongzhao Chen <yongzhao.derek@gmail.com>
Assisted-by: LLM
---
v2: new patch, addressing the Sashiko review of v1:
https://lore.kernel.org/netdev/179054715863.3145.10179961093285192493@kernel.org/

 drivers/net/dsa/qca/qca8k-8xxx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 00a70c7880e..420b375b8b0 100644
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

