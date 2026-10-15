Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A393DD86B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032330; cv=none; b=Ujf1dujmFfrdSdpcwCVb0+No2BuNYgVKplhVZAgfZelscRuU8ypub3cj1hnSisOURw6QRLNKAIai5KqzcFPrYRZ6BND0cKIidATRcSug7dNz9OGN/5wDKU8lsICl0aSi2aHgkdvdHCR2sQAD45XK0xCuC/R96rFzMzCvhnQ/QeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032330; c=relaxed/simple;
	bh=CEllbMAyUh67mx9yvzDI34nz5d1ihwHNqICRZK7Ly8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pbeYFnVZvKSYUe89rh81z5DXMYohBiOX3OTfYtFhz8qDZwdSg+ebf3Gye3sUf3jLCzjA1tiAE4vvdWs/dcZAQw5VPVvvGlAg6cKoKCY9JSdQPrW6QWJPC0VduxwpXgr/z7VTbmSthCwM4u/3il8DEEx38WGXIOzZjg0FTdmNDk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgWOz76J; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgWOz76J"
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2e901e11520so6876585ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792032327; x=1792637127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6NL3C3h3ouQDJm0DgBtu/xXmXeKbd5Qh0OWlBa3GyWA=;
        b=AgWOz76JfXNoem8IXymToN5bRRODBRerZuNHgTFZli+WRkwceFWc1Wn7RXvbBT64ef
         40VB0k/+0WHdelFNPFFP7K4Aj7Zu2Cks0azcuJ4NH4oicavYHUIPF6HuX6F4XKxsVaXA
         7v5skfJRQdti3nRImj6vti/K6R17Ce9V6AeoHXT08xA0kgDhqaDj29ojyUI7rrLvMwON
         aP43Xl3zbxxAr7IsrFp3FVeMecbjwwd9hqmFvOcgaUHlbRML4qQT9fpZGRKFtKRwjsKx
         wmdOrjU+bT1vPaHvmnM2w7RJwLeh5ijoEybXpLk1s3FfeIsNqQUIv9KeMQY20OKlN+51
         G/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792032327; x=1792637127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6NL3C3h3ouQDJm0DgBtu/xXmXeKbd5Qh0OWlBa3GyWA=;
        b=vtK8AJKtSOSB0EC7R+X5iKeIpR5MZmvjzKWST0Y9eKCuP4Jqj3mk1kqzYZc45qffln
         NzaJBjhdFf7l4HwVDA8MjX+ybgrvSAZz7nqbYd7eEJAx/WIW8andbRjI4K7SIhEZ2jWK
         0ocqpvvlUF/B1ZGg2BUiShvHVRyZwy01cap/peADkgCVkXAXjTSgwDuPp+i268p3Ybd8
         Y1upadSzFB4VyT+3KQtIeUgCzDpkEjRYIwxS8+tJ+GYJOHCXKS2imxOKZ4y+mATdYfJW
         pygHwArkAwJbjWi0NuZgptzJ7WpQ1Jcb7MpF4BYihCOajdBiP0CPYl+GW2NcZ7Fcq5z8
         gFtw==
X-Forwarded-Encrypted: i=1; AKwUvBxEhL4c0AL3EyKU8Gj3felI6zB9Rq8QBNEasa+O6uR2KFUb3H8uUZOu6Qeshw3FOBug+vY5W//0186hKt4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYDEflj6ttYN9U0bSl8HMSTSVJc1d3Cb6RxM8/3+Li7x7lRSiv
	CDRKk1NDDu5480j94eVWLDoTrHnFuIPupvv90Uk0Mo8lA1ikoJ5CsDP6
X-Gm-Gg: AYBFou0IfAEUSkaddNiLvWOu+HDsz5RZJ2CW3g1lzFz3j6NOS7NPpgUiQGGPn/a1cMB
	YnIfM7sfVoIUU1oAclAMcblT7s3xkhdxqNco4EvnETWOpMSzv93gbJW4PXxXkYmidlyfihECplf
	dIbt5WRzQJBsd0h+93cjMv/xOvTasXFm1sTO4LIU+AnvaboWz6DSCcC1oilLQ7wem8ZumbJKg5b
	n4PnRJdZ47oS+h+djIn9A7V5m9QycrBpUEutOmXMaqMgnGdPKpft4f7y3EGqq5Q2/BGorHD2T3w
	TD7pfhtresKfcyUQYROhakb0ZiDk0YGLhYNsQoG+C/CmUagwPW2EAPAkyQNt4r8rq8VCDfd7Kvz
	vpDLPRN0dh05ZLkbemDCTypBy7G9XvRnmY1IFzbTPbnA6vT0cqx8rATkggdKlzTATvBqfH8kxMp
	y8ydPFLP8vQOYrVyXY+7W/vIbCaaJVgpqJ0eUEEmzN7Ab8nDD6b6bCqaNN7N4cqQ0HuQd3u2yWl
	Sw1oIO8ZTsr4OV+zao=
X-Received: by 2002:a05:6a20:a10a:b0:3e0:d032:31c5 with SMTP id adf61e73a8af0-3e16bdf0d43mr14039255637.25.1792032326841;
        Wed, 14 Oct 2026 19:45:26 -0700 (PDT)
Received: from LAPTOP-QJLDGQ2L.localdomain ([112.224.221.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d802a459asm1710303b3a.14.2026.10.14.19.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:45:26 -0700 (PDT)
From: Boyan Liu <yymhvert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+02480a85e1a0d4f5@bugs.sh,
	Boyan Liu <yymhvert@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: f_ncm: Fix use-after-free in ncm_wrap_ntb()
Date: Thu, 15 Oct 2026 10:45:08 +0800
Message-ID: <20261015024508.3179-1-yymhvert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The err: path of ncm_wrap_ntb() frees ncm->skb_tx_data and
ncm->skb_tx_ndp but never clears the pointers. The rest of the
file treats NULL as "no aggregation in progress", and the other
release site, package_for_tx(), clears them after freeing.

When the NTH skb allocation succeeds but the NDP skb allocation
fails -- both GFP_ATOMIC, so this happens under memory pressure
-- the err: path frees both skbs and leaves stale pointers.
The next transmit passes the guard on the freed skb_tx_data,
reads ->len from the freed skb, and package_for_tx() may then
write the NTB header through the freed skb's ->data:

    BUG: KASAN: slab-use-after-free in ncm_wrap_ntb (drivers/usb/gadget/function/f_ncm.c:1044)
    Read of size 4 at addr ffff888108582930 by task kworker/1:2/1623
    Call Trace:
     ncm_wrap_ntb (drivers/usb/gadget/function/f_ncm.c:1044)
     eth_start_xmit (drivers/usb/gadget/function/u_ether.c:543)
     __dev_queue_xmit (net/core/dev.c:4884)
    Freed by task 4999:
     napi_skb_cache_put (net/core/skbuff.c:1471)	/* deferred dev_kfree_skb_any() from err: */
     net_tx_action (net/core/dev.c:5854)
    The buggy address belongs to the object at ffff8881085828c0
     which belongs to the cache skbuff_head_cache of size 240

Clear both pointers after freeing so the next transmit
re-enters the allocation branch on a clean state instead of
dereferencing freed skbs.

Fixes: 6d3865f9d41f ("usb: gadget: NCM: Add transmit multi-frame.")
Cc: stable@vger.kernel.org
Reported-by: co+02480a85e1a0d4f5@bugs.sh
Signed-off-by: Boyan Liu <yymhvert@gmail.com>
---
 drivers/usb/gadget/function/f_ncm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 500c9c19c78b..be1c2fa36350 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1132,10 +1132,14 @@ static struct sk_buff *ncm_wrap_ntb(struct gether *port,
 
 	if (skb)
 		dev_kfree_skb_any(skb);
-	if (ncm->skb_tx_data)
+	if (ncm->skb_tx_data) {
 		dev_kfree_skb_any(ncm->skb_tx_data);
-	if (ncm->skb_tx_ndp)
+		ncm->skb_tx_data = NULL;
+	}
+	if (ncm->skb_tx_ndp) {
 		dev_kfree_skb_any(ncm->skb_tx_ndp);
+		ncm->skb_tx_ndp = NULL;
+	}
 
 	return NULL;
 }
-- 
2.43.0

