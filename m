Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE303A4F35
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789527628; cv=none; b=mbr9/th1jRR4y+S3qr60r3qNPiI1DLLpi/GkYbgH2mruYz8U7Pl4osUQQ+8r/3YS1HL/WF1ZoNaOhmY7GJ6Vna7xmPA3FJAT0YOQGZvZDpP7C/EUY5WWIK6W7zaixNDpQN3xdQmNowpWZA2E5In+GhHy/YmTQkLvl6ny7s8EjNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789527628; c=relaxed/simple;
	bh=RmS+xdgWocibZMZYCA84W4qaV1yXYkVlLzdVkYyMD5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kvPyO9GxNAetwHfChRNmKnFMArLWHI2z6Bugaye6tSNXKNwYMZHt74Tg+roG/jX0xWjWS5fyquv0nyJW2iuznfMbpTyx2jrcUjgRc5rp9xmO7NDOG3CgMO6+MObnVcTJ+QJ43cY0G8/jsUz8ayz/+MLMNAuQ94HHX8S4efeN7fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRO2IsBn; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRO2IsBn"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd4f99cso441954a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789527626; x=1790132426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jVvxgQIw7AeCLmLEQiDzAuJvlTjekJJ3lxgJZwxjO7I=;
        b=FRO2IsBn7A5sw6+At3iy+Hv7iM5Q4dItUOzD5FevIWXH8KmHuHGdQYHMV7GQqvw3DO
         ox2z1ZWb7RptCWNdtp8A5pwufxwYaXiRuJgTRXL92CXSgzwne4nJQsFZDPhhYtGhXIRo
         gde1t+ip/ntDSFyB6zfqyoO2lAX52ee0X/2TsKywty9vDPYjbke7tUk6J5od2AMQwCs1
         grTjra0u+oqLEYU4tCyVeGZP8L1axqBWuuoft1h+4o553wUfkmIcnIp0QjWGaTOE6GRU
         WSWDlbypD/k7O/eozwyePZ401UmR3ek5TPhQEuZjWVaAmrjeRFOoia4FLyxpXZbEXlkw
         IZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789527626; x=1790132426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jVvxgQIw7AeCLmLEQiDzAuJvlTjekJJ3lxgJZwxjO7I=;
        b=GD+6dZaTAjW/DuI2vrz4DENr10sSFjJ0xpE7ROyTuY1y5sn2P/TSOsgctIcbOBGSE3
         7HHwYwbHl2F9tB0FKM3IX8ZFb4QzP6OxrumKFaymyGINZ9smnYitF6FDnWZOpy5kLB3y
         AEHKZK+5OlXcLpsM2uvoJMHnYZdQdjBbq9snTBZCPS7xdE1eSKP81c7IMhEzonZQABqG
         OAowFzJwMoDgGFshlOG5uK7m+F2ZbxWVR14eM+zUDKH+6UPPaPMxkR8gbHIxpRHptS5O
         OEPZkUE1uewudOfNdD/udEX0mnWf+DKVYSiEfRBYKVV+hMqG1mf3pZCs0FaX+VSzaRL1
         TSfA==
X-Forwarded-Encrypted: i=1; AKwUvByPrQMv5C+MV9QFtRdhzNotPLMuWpR76LSTRtceESU7b1TZbpNR+ahostjgcgnuu0IfgWLACmLVB8y25JY=@vger.kernel.org
X-Gm-Message-State: AFuF++kII/BDn4vFQn5PrXc7Ekbidf2Z3FGJytkdS5KLf047rhBhWTsj
	P2ctEG0vCZmMa5Dz7LC1drUOPsMbCEpzDcU7Kwp7wx8YELHWOWgNwvTK
X-Gm-Gg: AYBFou0mpEomGcXOefZM0bxXtv+osbpKFQEkUh70EV2jIB+Sz6ggYraFUV0CQwFKwUZ
	/zGz7pqUa0ymT8+5ot+U9wLjP6QBG7mUGNoE57JuoSGVHeKC9iVqOCpKlIDn/5PdNaiZgjrsZma
	ausb/g72AUf8HjBQQLN+TZNrGAxt320gjy9XbmdsGXeVModJiQ5yrx0che4ECRkdNRPfo04X2Bq
	yKa5HiqorLboydmGLdvSB0qprazOYvPWq1TykaFL+xPtBlealsKbPhJur9SUxpa3YYZ6P6HQ3Bg
	U9C7sfc63rN4wmuYtnkRcfzlmq28pMZGFoP0C+INXhzUGT0mGlJlnrmPyBdcrMj8DmHVUW18wQp
	6mmV4husErZTYd5jpR+1LWMLx+zpuH+nz8JsPwGfs7uyREjht9ZakvIgOaCYGzTvt/qETnrYoAF
	OQLLhNcNT9KsHgSSXYyufnfbO62nP8XxA5APl2H2YtuAEAeChYXbe/tQ==
X-Received: by 2002:a17:90b:4fcf:b0:398:b1eb:136c with SMTP id 98e67ed59e1d1-39e1e2f3dedmr2184461a91.9.1789527625769;
        Tue, 15 Sep 2026 20:00:25 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395caccf1sm2428257c88.2.2026.09.15.20.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:00:25 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Yangbo Lu <yangbo.lu@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] net: dpaa2: ptp: fix device node reference leak on remove
Date: Wed, 16 Sep 2026 11:00:15 +0800
Message-ID: <20260916030015.2818545-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dpaa2_ptp_probe() gets a referenced device node with
of_find_compatible_node() and stores it in dev->of_node.

The probe failure paths release this reference with of_node_put().
However, after a successful probe, dpaa2_ptp_remove() tears down the
PTP and MC resources without dropping the device node reference.

Release dev->of_node during driver removal and clear the pointer after
dropping the reference.

This issue was found by manual code inspection.

Fixes: d346c9e86d86 ("dpaa2-ptp: reuse ptp_qoriq driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/ethernet/freescale/dpaa2/dpaa2-ptp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-ptp.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-ptp.c
index 4497e3c0456d..440319a1e775 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-ptp.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-ptp.c
@@ -232,6 +232,8 @@ static void dpaa2_ptp_remove(struct fsl_mc_device *mc_dev)
 	fsl_mc_free_irqs(mc_dev);
 	dprtc_close(mc_dev->mc_io, 0, mc_dev->mc_handle);
 	fsl_mc_portal_free(mc_dev->mc_io);
+	of_node_put(dev->of_node);
+	dev->of_node = NULL;
 }
 
 static const struct fsl_mc_device_id dpaa2_ptp_match_id_table[] = {
-- 
2.43.0

