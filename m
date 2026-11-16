Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844935;
	b=s7S813qYiM/no8+X6ncO/GL6kmzftmrs+RrlogPAzfL2ZdmnuHESKEY0zmfZ6/8KlQCe
	 9uqvYvZvT5iU40+uAo7iz2gsleMmixfTyYSFIPRQuAbmVz1lyq51MstwVQl9O7x1wfgGK
	 +TY7CkEAIIWhEZp7T1mzze6f9VXJzAi+23HMG+k0G2fk4e5Joaj5QdFwuDSk0BhVL+qU5
	 oaw+8JoiEkdkUIWp7YklQW8Xr+aRSc1co5M56fLLnadH3WBS9OVIQvQaNbb5enm3f4NNF
	 s0C7VBL4nt1VBSoYIeAB4qsSs25yCyHn7Xb+bsUDJtTHQtj3TcV5okyM6V5hnK7Mx4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pAz0bLJkbkGyi8jrsmRIgtv7CQJzhkJpuiznWq3FIm4=;
	b=2O5gFrhRTB0GicRjgHMYgd7Bl2g3WPt6i6ic38MhmpEM3tvNKhXnQupcF/Gfwxtx9qbA
	 wVUF2XzFL8c/0JMhbrY6DDLVhnDUlzuTYTuRcMUA5FmXIsQDBoLklQB64cjXupeZP6EfP
	 /FR+PwkZdI8qFikFCnxM3fhJS+2babFrufq15f4EgiISbgQ9m/wKepEFjR95IJuHmuHsm
	 S9g+TP6K87I91F6LmG9A/jVj3nC2q90rIfQhtbXR4uFE/49Bg/wEJgZAbYlqWgAscVlu2
	 PZLLdIdgNzUJll1VnMLBnbMN759sZ6DJ5jIj2VPGWg8k0aGzCiulkY9OzCyArGMgTtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jiR3u392;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E2B606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4E2B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jiR3u392
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso1516945a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844934; x=1795449734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAz0bLJkbkGyi8jrsmRIgtv7CQJzhkJpuiznWq3FIm4=;
        b=jiR3u392bMbw0RoiMCnm7KG9uE35Hr1IM3HtBgOElXWwMsPJ26QjGfBjm48o1SYO93
         KoVHDTEvaGaDKeocvtrZkJA2bGFzGxrsxIoB47GFvR5vPAamGOWvUMjJHMqSk/eOzSvP
         C21II2c/x0PIlEprS6Vsnw8odj2Qovh8n9x2yp+WD0cLsniuXoI+PS4yXHwv37I41VrN
         R0zcpq+XTQR52/b4UQXMgB2EeHWKwl2AV7kSkNiV03+b+BcPYymjbq1DxeLYywije9PA
         KCS7Ps36l8sODZfeSR65bkUF3hVRitB5kWQWim/ujjaQW03lCYOljVd3+O4RuXcwiM7H
         tDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844934; x=1795449734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pAz0bLJkbkGyi8jrsmRIgtv7CQJzhkJpuiznWq3FIm4=;
        b=uCLKJTrKQMCm/XrMbMRhbX3lNEx8te2shIdNc++49IiLXBK9f0UT/zx1udCLyNvNSy
         QvA0inekCATw9dD81KoICx8IQmp7v1gLUKfFfljobrOqf9qV8pbaTITPI7OP4LmpWLKl
         gzyiRJF11ryufti0N96zfTas9dLkoSJBiJCYv1UF8hQ66+FPtZC4lZVQeElc2Z65bqar
         KiIrGCd9q4FKdl4A38OkzpcezE5D2UtmAHUBzy8hHjfpmEO3Hbn4dTSHNF7+PGQCAWz6
         Eh7kDzvcBN/7rkvocdbKCq1KPx5PgL8GHY4jVSihYZqrLvjDrL7JmAUv/kWhdz09XWxY
         wKTw==
X-Forwarded-Encrypted: i=1; AL+hErHEt3zhYWGH2gQ8dtPfRaxqC5YEyXQRlKouQ8g0Mud3Zs6YfsbD2TaKS6OMGgiJ//HYIyIZjbS9VkPYzkI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W4ant7WGCC2cKw+APlnUS4gtYnRS+WZyyH7fWNROJXl2OfRVr
	1dg3onlWK0eua9N4Rp1zvGIKkGv3DUGOXvM0OfimKlQBy59pgPrtCnFt
X-Gm-Gg: AZFdTZdwkzAPnW4JX1damnnqP4Hee3bVF4upbZyFoFIh1bQe4pQh62Lg3zcpBPk247H
	6hJquQ7wqr0hOn5nXLh7Y7wxYr1+kIzhjLlP5R1WTnAvWZhoxqhQHYFEFZ4q8YwSoc+gD4qny5k
	GM44wbGydigx7Vh4pUCbF+ubGw+zuNmNGiANqzbxl5CCAEnQU9ZeMOzYKLlEmi78ut4ctO2jXoC
	vUNA4BTgRwz28Q+2p3ZR873G5EVl6vNiyE+YcELox1suijUINOSjG0CVTZfBdRRPqf28Rnhj4Ba
	KS0aDbkkIdp3+5Scz5CSnCe1pY/IqF5ign/NGdd/paPLCzx0O8PvTRgJ5uwY6cBwnoQwfzZlJo6
	xFKcYBehjrLs21UliHol4ZgFZG2n50Ma8EqOmK7hM/8FzR7PKqo9NBYJzlhLAZDcpLVPGqGXKeb
	z0HLWGNPFcb0s04nR4QeaJfxRmiIsAGPLzqnPFPjyROWGU74Bk+Gi/0KQSwcVY/JWMHCM0RvGkQ
	2H4Qpy3+pLigrK913XWEeyAYR/8WY+82DtIxdRfbUUjArCn1cZocutCI+vKxOaZU4H2IYILjtot
	i6WrGRE1bIlwc91cmWPu37QmzD90vEWlyytQuypME914iM8wGSvUgA4=
X-Received: by 2002:a17:90b:2e0b:b0:3a0:e1f7:9b04 with SMTP id 98e67ed59e1d1-3b1b09f3b6amr11067625a91.12.1794844933552;
        Mon, 16 Nov 2026 08:02:13 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae98151dsm17432051a91.2.2026.11.16.08.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:02:12 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 3/4] net: dsa: motorcomm: Read the port PVID instead of bridge's
Date: Tue, 17 Nov 2026 00:01:03 +0800
Message-ID: <20261116160107.1351198-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116160107.1351198-1-mmyangfl@gmail.com>
References: <20261116160107.1351198-1-mmyangfl@gmail.com>
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

The driver passed the bridge master to br_vlan_get_pvid(), returning the
bridge's own PVID (VID 1 by default) instead of the configured port's.
Query the PVID from dsa_port_to_bridge_port() instead.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 863ebb6c3198..d84d863080ce 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -952,18 +952,18 @@ static int
 yt921x_vlan_filtering(struct yt921x_priv *priv, int port, bool vlan_filtering)
 {
 	struct dsa_port *dp = dsa_to_port(&priv->ds, port);
-	struct net_device *bdev;
+	struct net_device *brport;
 	u16 pvid;
 	u32 mask;
 	u32 ctrl;
 	int res;
 
-	bdev = dsa_port_bridge_dev_get(dp);
+	brport = dsa_port_to_bridge_port(dp);
 
-	if (!bdev || !vlan_filtering)
+	if (!brport || !vlan_filtering)
 		pvid = YT921X_VID_UNWARE;
 	else
-		br_vlan_get_pvid(bdev, &pvid);
+		br_vlan_get_pvid(brport, &pvid);
 	res = yt921x_port_set_pvid(priv, port, pvid);
 	if (res)
 		return res;
@@ -1102,16 +1102,16 @@ yt921x_dsa_port_vlan_del(struct dsa_switch *ds, int port,
 	mutex_lock(&priv->reg_lock);
 	do {
 		struct dsa_port *dp = dsa_to_port(ds, port);
-		struct net_device *bdev;
+		struct net_device *brport;
 
 		res = yt921x_vlan_del(priv, port, vid);
 		if (res)
 			break;
 
-		bdev = dsa_port_bridge_dev_get(dp);
-		if (bdev) {
-			br_vlan_get_pvid(bdev, &pvid);
-			if (pvid == vid)
+		brport = dsa_port_to_bridge_port(dp);
+		if (brport) {
+			br_vlan_get_pvid(brport, &pvid);
+			if (!pvid)
 				res = yt921x_pvid_clear(priv, port);
 		}
 	} while (0);
@@ -1139,19 +1139,19 @@ yt921x_dsa_port_vlan_add(struct dsa_switch *ds, int port,
 	mutex_lock(&priv->reg_lock);
 	do {
 		struct dsa_port *dp = dsa_to_port(ds, port);
-		struct net_device *bdev;
+		struct net_device *brport;
 
 		res = yt921x_vlan_add(priv, port, vid,
 				      vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED);
 		if (res)
 			break;
 
-		bdev = dsa_port_bridge_dev_get(dp);
-		if (bdev) {
+		brport = dsa_port_to_bridge_port(dp);
+		if (brport) {
 			if (vlan->flags & BRIDGE_VLAN_INFO_PVID) {
 				res = yt921x_pvid_set(priv, port, vid);
 			} else {
-				br_vlan_get_pvid(bdev, &pvid);
+				br_vlan_get_pvid(brport, &pvid);
 				if (pvid == vid)
 					res = yt921x_pvid_clear(priv, port);
 			}
-- 
2.53.0

