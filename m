Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6D43B38B9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702196; cv=none; b=Z74/grQKla9/PyGYDOy7lG5gErA8iHdskt5oK7L4zFFO1aGSRvqW2ilAuZEhVZq8QENvOSM+dlGEp7vtYBcVEePu4ew8jd+mBz1OT1XVpMlRsowu5bD+fS2hBBqaVAoGQN64K6w08Wcs8a+xijae5VCZCjeix93wcxOiGcIkakU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702196; c=relaxed/simple;
	bh=OrS6U01+iuao8UmR3n3HuiCLZRiCE5UJWbtnDDZt3zc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eftuteo3hMgixFO1owvD2KXc57ZiaPXqLGE+323ibHty/cS8vElPtFZiu8/q3CisEX0sjm0IUGFaXJfQPDiPo6IXya42gsSTF67pj7FvpN4JNDYwMiHT5Nsgh16Zg2atOw+qqEdBI9hkJtZL73FsfGzCBsnrfYd/XpADflA5dfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbi73fqX; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbi73fqX"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fb334ddcso2353855ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789702195; x=1790306995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YMfMBVGtPSJljFVAV+D5AOSbTsYVYsLFP8jVbT0c8EY=;
        b=nbi73fqX0OZBZeppzXw6XrogpyDRJR4XW0M5fmaSlyRjK37/Ptci2CsEikuXN7RC+N
         ssX7W+XXDRVaVo6nADqimOg3D38DoTy14WUj0WljX7tNa5Eza0Ak9DGKMLzoksByfRLZ
         jSEbesvJyOAZuzX2Z9jfMmvqiliJgseU1pfJ/oNmhAVSB8hgeTCP7OOZx3mUf0dfHjS9
         oAgbSJag96AAulbrLEaKzLJXC9goaf+seuk5bze9tDzMnf5lLQkQX+CEI7F878gX5s3U
         OFcY2TwaaTVfP7y4GF59jLE1IJzs4opPxGo4JGVhU1zDnVQT73h+ms7z4Y9ttR4Wc9bh
         HsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789702195; x=1790306995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YMfMBVGtPSJljFVAV+D5AOSbTsYVYsLFP8jVbT0c8EY=;
        b=k1cBqXODYMw6zsoCy6PWAb9W4JzFW1fjJi6L+5PdjPGWnLaNbmxzX0OGulghfFY54i
         ARc33L5uq7vdCUJ2liVGZR535AQKlYAXVjnekMinInTKjEfB3GgyVfN3ni4equzAKgpK
         IM8sirv+ZE+kRO1snBdBYz2toCKV1mqdx4JCE52678S0BOAzMDCIOX2KiwZUTj6d+w8q
         DPzJU4QjfPnLUDwPh/tz0wPec9gnLf+kwWRIU6ee/+uV01+nb3ydyhvK0rv4zEfdfhuX
         ZP8Ch+sb8vaIxL81DeGcIva07zjXRL4j5kDPLFy0AFrz5/yUFtk9dEpkK/uPdAniWWVQ
         GB5w==
X-Forwarded-Encrypted: i=1; AKwUvBx3zrRqKvHZxVJOI6kdy9/SHxzotOTOtbBiLmbCejnREqaOBD5gaM6mnKRa1JScIMJ6ei7Wyrb5DI8Y4ss=@vger.kernel.org
X-Gm-Message-State: AFuF++nbq9KJPJq25NS0ILBH40N2S0Vku0DNFreEpBNFwxgTuuXkQEbi
	o2sZ1EygsjNSJPR+gIOHlbT2y4IxCyoy/IibpCtgDAKDSPZlTsOsBvii
X-Gm-Gg: AYBFou3QuzR0DrcgEftayr4MYCkqrBYzhMPYtXBwL40hMXw+jOlLF9nCyKlnufO82PI
	8L6KVu7kYcKVua8bQKLM+CpuwvaflOzuRWlQd8g8B+PZeZDhEO6r05zRIy5Ttr4QreJ40L2x1fU
	bBtiTxe9WD7UQ2UNsNRJSumNTA1boN7XkuZzO7dK79vAisEQCD9HyTmenoX7e4UIiC0N0/rr2Kt
	MXB5Ci91ThWr3NkRnQ51irKEJmkCCrTJRlMVDK8vvbY4W8ya9bebb40nFGzChhBay7QxLDNo/Ra
	YrfVAAqKoDBNfl+C9H1hl5xKdZQV+RNiVgmMKWox0g8PXJHVhOAzTc+ddxRQO0KrSY13phdkoK7
	LwT9vqO8pYYSGCL+oyaT4sgPiX+gMRA0ZWjXglJZn+CvX16ghD4Aw2FZgY1tUjrMW8ALhZ1mw9H
	9JzJgAUnW+DBX/qlcZQs+KEzGK5peE9sfyCCnhrs3MOSz5YVde7rQ2bL+/ZR6WoKLUc+ha5JchU
	SbP3CGcS0bvB/z/PWk6jIdEVD+jkpm0hsX/F/3UzTFz1KLE5dLKyOCL+IrAlsFIzmUqe5ddMw==
X-Received: by 2002:a17:903:4b03:b0:2dd:ad73:c937 with SMTP id d9443c01a7336-2ddb1b989dfmr26313645ad.24.1789702194774;
        Thu, 17 Sep 2026 20:29:54 -0700 (PDT)
Received: from secrnd-cstp.tailb7f510.ts.net ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb757b22esm1033265ad.50.2026.09.17.20.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:29:54 -0700 (PDT)
From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
To: netdev@vger.kernel.org
Cc: Sanghyun Park <sanghyun.park.cnu@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Stevens <dlstevens@us.ibm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] vxlan: use one headroom snapshot for neighbour replies
Date: Fri, 18 Sep 2026 12:26:58 +0900
Message-ID: <20260918032842.502409-2-sanghyun.park.cnu@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vxlan_na_create() samples LL_RESERVED_SPACE() to size the reply skb and then
samples it again to reserve headroom. A concurrent vxlan_changelink() can
update needed_headroom between the two reads, creating a TOCTOU race. The
second value can exceed the allocation and make the Ethernet header write out
of bounds.

The race is reproducible on the unpatched kernel. It occurred when
vxlan_na_create() generated a neighbour reply while vxlan_changelink() changed
the link headroom. KASAN caught a four-byte write two bytes beyond a 704-byte
skbuff_small_head allocation.

Snapshot the headroom once and use that value for both allocation and
reservation.

Fixes: 4b29dba9c085 ("vxlan: fix nonfunctional neigh_reduce()")
Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
---
v2:
  - Improve the v1 changelog
v1: https://lore.kernel.org/r/20260831054614.2069896-2-sanghyun.park.cnu@gmail.com

 drivers/net/vxlan/vxlan_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index c1d54339fa2b..3390e341d1e5 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -1958,13 +1958,15 @@ static struct sk_buff *vxlan_na_create(struct sk_buff *request,
 	struct ipv6hdr *pip6;
 	u8 *daddr;
 	int na_olen = 8; /* opt hdr + ETH_ALEN for target */
+	int headroom;
 	int ns_olen;
 	int i, len;
 
 	if (dev == NULL || !pskb_may_pull(request, request->len))
 		return NULL;
 
-	len = LL_RESERVED_SPACE(dev) + sizeof(struct ipv6hdr) +
+	headroom = LL_RESERVED_SPACE(dev);
+	len = headroom + sizeof(struct ipv6hdr) +
 		sizeof(*na) + na_olen + dev->needed_tailroom;
 	reply = alloc_skb(len, GFP_ATOMIC);
 	if (reply == NULL)
@@ -1972,7 +1974,7 @@ static struct sk_buff *vxlan_na_create(struct sk_buff *request,
 
 	reply->protocol = htons(ETH_P_IPV6);
 	reply->dev = dev;
-	skb_reserve(reply, LL_RESERVED_SPACE(request->dev));
+	skb_reserve(reply, headroom);
 	skb_push(reply, sizeof(struct ethhdr));
 	skb_reset_mac_header(reply);
 
-- 
2.48.1
