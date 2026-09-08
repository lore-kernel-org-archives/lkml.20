Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FB957C729
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886284; cv=none; b=XXVp0XpbcLX3AZ0M9DTTb4H1ySIehtIoI9ViAyJkTTkE4BnRarQX2YWWY2KQNtGSrZiREBxIxplvwJLfrJmmFpwv00iKq0mtxp+fhv2p5rmu5G258m30DGSTuJbRDg6QO2JcBoY9bvAjomhmFL/3eX2xqQFnDJe7V/6R9l3qFSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886284; c=relaxed/simple;
	bh=UfQvBvSuxFTjQyo4ge7nD5KznVnWw+/9dkfp9bppCVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fkDBm1UQRZP05lwSdyakcE8fvmj7p7UN9+UjGobM1A2Py+6IjujTjCkKU6NAEgp5uBqGDWwCEtZm+c3dvq4x2La+MxcTNVPGxfgiwW2eNdLsJCsKS78JocJ+N+Ps/AxjSDyUOovQICa3jl5yAeOEpbvuaErPjBdoHqPfgdgVT3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+C5l1zo; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+C5l1zo"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-853e2610bb4so3642221b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788886282; x=1789491082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=llq/+G51IPyNePo3r5tJVqAdU0RXFNXMCuQq3OACrvE=;
        b=L+C5l1zo0hlH7lW+ewtEA7Bl/X41puccls3vD4KXP4PTteMTnAKdvEgXBF+yyeAdc7
         kgvBOF4VueGQZXDuT17ZKm3MwyA7t07zECLeFWw0yo0c6tup5EGG8Wi+RDsV+trwhDD8
         /don2ozN9KwpTBDO95zO3w7VDSjIn7xM+cNWmW23a2pmb7Y5VqhIJ8BF+VAyv3Hlxe9t
         1AZ0GKWeqcr7DuSjhDid6TsDoQeM2KpW/GrVsreXYCzWE1erEuvt2s1R/h/Lp8i/+12/
         YK1bSfGkg4okeUZTZotEW1DrQ9+noqHaWOwsjNEc7yJksBT8CnuPw7KRv5ShxIbMTU6k
         oRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886282; x=1789491082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=llq/+G51IPyNePo3r5tJVqAdU0RXFNXMCuQq3OACrvE=;
        b=QInCu8PowmyrY1PC+FBThF66A2dWRQKFCQSvyLkzLK5HwdHILrb5Wg9pQuOLjDFNCD
         yXllHCFqY260PEUYDKOqCENLAF/iccMnfXgIWSFOJ7iUygRChHYlGXwukC7eIAKdhgOQ
         VH9fm0Ay5F1SfnJFyeLxFxC5nlqUH0G3uie7LgyfC+4ZR8gOeq7i0IFCbCCM3JOOWZgK
         oiYNORygdOY3OZcpObloT2MD+Bv1ky2tmLy3CCniue1yEpFqgPK5Ss45NTpwG08sb0Vq
         KT9vsl8NHUGjMstDhld1A0ZCu3PQ0d33aH74gaQzUclqNgh1mvt30Xf6kOrRqxMBX28a
         n1lA==
X-Forwarded-Encrypted: i=1; AKwUvBwY8D6v0hIqUHixg/Z37lbViAlikyZhqiCQ/G8qNbVvXGE2cKmaL/uFVOW1tx+3jV1N6oiRGVbk3sHYsw4=@vger.kernel.org
X-Gm-Message-State: AFuF++lla1/esbz0NSYBvQvIkOz4AhWNiOzohRq7P4SD8uyGQwf84bUg
	CwcbnemrhKD8nMaahTYuE79vETBpJZGOQIyU3FatygvzDYS4veFTlcJf
X-Gm-Gg: AYBFou1r4um2lL5gxpHwWv7zbyv15fX6p9M4lcjRk0qVhmV/5n07XSrWqzhJRnqeDGG
	sfaNAlWhrOjEM7Eyj1vJ7aW2I40e9LwyIbX0fTvmCxP371ygenp1xd9Nc7gqTz7zL46unvuH0jc
	z0nQx3oBasqdV+qav2FBRQrpmS0deO1lO0hlrH4CpwkLj8WMkTv8UqYiHgo1pb9AJGcnMKeKsiX
	OfRdjmk76J1vQgtXSmIvyjuNialCFXpCH8hV7eDqTCryHakJw/E5DnljcBPEf+l+EKpUqmXm3Y6
	zzW+GHW36aoxdh99xzMcepxv5jCt6yWaMW9WNlpOM/SfFp3REfAWmc8TDFiKV3ixvTSKOz4aozY
	qQIUl5bSLbdM7j+CX5REDbxw9BEoRvWZ/yX/65e4mUkkFe+ORNkfSACWVmlsOSqkhXXmc/j5Z/U
	xSqCunU1UR4DqpMTQ918If0V1B5+4hGWMuZrjZzQJ0xRXl1o/fpxKTDETKbLYqx+2jnHsLaM2lK
	7owFxzgwHGNjSaSCU/N
X-Received: by 2002:a05:6a20:cf83:b0:3d2:ee7a:eba9 with SMTP id adf61e73a8af0-3da213cae76mr40530496637.4.1788886282481;
        Tue, 08 Sep 2026 09:51:22 -0700 (PDT)
Received: from 192.168.50.3 ([183.193.115.0])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cc455451bc0sm5851334a12.19.2026.09.08.09.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:51:21 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
	Xiang Mei <xmei5@asu.edu>,
	co+28eef7d8af9428e6@bugs.sh,
	stable@vger.kernel.org
Subject: [PATCH net] net: dsa: tag_brcm: legacy FCS: request needed tailroom
Date: Wed,  9 Sep 2026 00:50:47 +0800
Message-ID: <20260908165047.2786340-1-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The legacy FCS tagger calculates the CRC over skb->len bytes starting at
skb->data. When a nonlinear skb reaches the tagger, this reads past the
linear head into unrelated slab memory.

The tagger appends an Ethernet FCS but does not declare that tailroom. As a
result, DSA leaves NETIF_F_SG and NETIF_F_FRAGLIST enabled on the user
port, and nonlinear skbs can reach the CRC calculation.

Declare the required tailroom. DSA will then clear those features and the
networking core will linearize skbs before the tagger runs.

A KASAN-enabled dsa_loop test using this tagger reports:

  BUG: KASAN: slab-out-of-bounds in crc32_le
  Read of size 1 at addr ffff8880397086c0 by task exp/135

  Call Trace:
   crc32_le (lib/crc/crc32-main.c:38)
   brcm_leg_fcs_tag_xmit (net/dsa/tag_brcm.c:343)
   dsa_user_xmit (net/dsa/user.c:942)
   dev_hard_start_xmit (net/core/dev.c:3937)
   __dev_queue_xmit (net/core/dev.c:4926)
   packet_sendmsg (net/packet/af_packet.c:3110)
   __sys_sendto (net/socket.c:2281)

  The buggy address belongs to the object at ffff888039708400
   which belongs to the cache skbuff_small_head of size 704
  The buggy address is located 0 bytes to the right of
   allocated 704-byte region [ffff888039708400, ffff8880397086c0)

Fixes: ef07df397a62 ("net: dsa: tag_brcm: add support for legacy FCS tags")
Cc: stable@vger.kernel.org
Reported-by: co+28eef7d8af9428e6@bugs.sh
Closes: https://lore.kernel.org/all/jH6u350kaBRuqklDjd3k3BW4nWzp0tYRjq3p%40bugs.sh/
Assisted-by: Claude:gpt-5
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 net/dsa/tag_brcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/dsa/tag_brcm.c b/net/dsa/tag_brcm.c
index 411e3b57d16af..b7c49822ca888 100644
--- a/net/dsa/tag_brcm.c
+++ b/net/dsa/tag_brcm.c
@@ -373,6 +373,7 @@ static const struct dsa_device_ops brcm_legacy_fcs_netdev_ops = {
 	.xmit = brcm_leg_fcs_tag_xmit,
 	.rcv = brcm_leg_tag_rcv,
 	.needed_headroom = BRCM_LEG_TAG_LEN,
+	.needed_tailroom = ETH_FCS_LEN,
 };
 
 DSA_TAG_DRIVER(brcm_legacy_fcs_netdev_ops);
-- 
2.55.0

