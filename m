Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794440643;
	b=EFJHJxjOG3CLFAklz1w8mCyaeCNcJBF2KrQkEZyawRX33W3XMLVyn3ttqb+7r8v7MXoW
	 YpBCp+puuuTbFa2GoBLp4hTPjE/O05JBIpAd+6bPFKfJge60cjfwgOym+har/+4OIsj/y
	 kvz5/7kOsspc77bObtGeDVs1e1Epl2eLJHjzovRW7FAgFahzolUkacxawhlIvqmxp8wSu
	 FT7G3tqPHzeeAal1lZS0gw9NgJUAo3KFOBx0mRI+beagvLMMD9o2lrff5/LYV3HcNCAGr
	 N9hQrhWcZjSgC+Bm+1ZkVbZwOh6TdA+cQhpeY+C+9Xa/Vr6vr3b4uAEvDbLsnGYZvlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4nwTcWKBQd+TU0Te6S0UfHED4bkzf8en/Ar11xJ+i5w=;
	b=28P7XAbze+EkY+hTsFa8IZ7Cj/vnHdQNNqUMdCIIPijK4G6pnsFYsBwseqzIPcYWJAdF
	 uYlhxWmtcwFqwnjS5AdEEBW75hsqhpsa3gsdQxblxP2d0j/Zq2vu2W6AGmR9WIQYqbxco
	 BwaP25iJxgIuHZj4KJkjvu3s+njM7ZJH5tXxIiVCknwXylErjddysOwSXY2JF+E9mh2h/
	 4j1d753eTt3BsuMuGzEzhwqL+ElI57anPTN51MMrE+/TajMlhoYInYMP3/QUEGlNXDT+Q
	 vX5rlCQ+N8PEIuES7X6jioX7To3YmzEeRib+DRxwqDSzv5z/phb5VzWhJu5gvcoO2Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MSlQS7T;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BEB606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91BEB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MSlQS7T
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdd89d84521so120225a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794440642; x=1795045442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4nwTcWKBQd+TU0Te6S0UfHED4bkzf8en/Ar11xJ+i5w=;
        b=0MSlQS7TrxODbVyWhIXvjexrlj43q+xYfxfDzsruD2dHxTCYYhfyKpNRdKAx3daCR+
         v8TB140rqAYxCBkAN5NNZ8KAgjpXMG7EcPM63y18/UspOL3Q0keUwKwyVGueSHqAu2Yu
         X/5MbB+0J6RMSDmoUzYWgMoJzsPzFFYocRtAvWIYRYa0q367tmCJOcjfHqlxH03/eaUt
         M4TCxiGYgPJKgouC1D5OdTRKHoaP6WJxVzZ+IAaBrOUPELVpv8hfRi1OkIZXMB8vkp/w
         20UJTrBz6Z04q7FB5UOB57qgPcqbnyYuSbN72DfTdnQnuQG2zZ15SxgSKwHxf/m13S2o
         3FfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794440642; x=1795045442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4nwTcWKBQd+TU0Te6S0UfHED4bkzf8en/Ar11xJ+i5w=;
        b=N0srteZAPTW5arOD54+3Vb6u9ggPlSOAF6FEkUmWtmh0EEVmTUX4npAJfnWGYs+XpB
         U3pU7zfySexAf9X1WS8OXGtsljlW4fGuSESROf5nc0L12Bt9nPpMaYEaIvN38OvZI9Rf
         DflrVjy+o7mBRCbUtngLl86gThoNwP8fROU9uge56DvG4ePLjsvltOmNwHXAQYLHbQcD
         dgM0ghyQSa2U7zlP2H+6bQq8B3Wqq00n/wpCYa/SY26UxdJ8G9WDPr1a5YfL13K8OB7f
         JleC15yBIi8vWNhzsI+ZP0cYHJ7XwprjHWDt1H2bLBiELpmnivvgJUJmhARfwlcQ7e3t
         hNfA==
X-Forwarded-Encrypted: i=1; AL+hErFjSHMsNgMNOTAJo6qiMHkppOnhj0b2ga+eiq/t6B2JGeiXy6Y7tzs8dUsVJt6RRHGJUoQoZfk5pIJ4s/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/UVBEbm/rnDqGSSNcFpTtGsgSbFJCCbu7rnbTwyZ9l+qC2CpJ
	Yz2iuYeZhYzsVVPg+LJKqh44/y/XAznQ1kaUsuirK919/uod+Qnbh83D
X-Gm-Gg: AYBFou1mdQyPtuFxD2QWcINGOMzYJfjSGu+p0U7ugTkfsflJLd+S4mM7Xel8D+ggt4s
	8cQ4RYURNr1WeToMYm7K12AyNodnUTaBD6KjcUgU19AHe7usWH8GyfS22/KOqsBAWwHUDN4Iv5L
	0IqOX4ttIv1M5p455BLlvI30haR8daQerCX53L4NPVhgZkESO1Z3yfY0qkyfbFZAIczEl7Lhfud
	Nh0gEzkyIJP2f3/cYK5KMzgYDjL5Ec7PeZBYrQ5Bz024wi8dJuX0TjzxaH+FX3hxYDmpfTHCCgN
	n5k1EmOeoWb5QuekvnmLqJmF9JRHlfn/Lwno/tEKQu5YIdexh+ba6qhqaNPE+1YYEuvw134EvMU
	avlhX3BWDpYfCgVzXV60Z1Kq5Obyw3a7sPynnjkg6anf3ejtyD1mfJ7njtlAVU0o8VqaDNo44/t
	QNC8Qtc+NFtQapk1G0uOJCq5oyQFIFVQFI69Sdrn45S+oaYMEz+b2LafrsGQ2hn3P7SbMPOrV+t
	/y8bgMmmU2glCXaysZ16uiC9rwWmYbKDxZPedTRG9V4yt9M2gVaTHSI+4f68HUInqjUcdGaJvJz
	xOMjH2ETK6Z9utYZrMGdknKFjhtwYULCR4qktvhLZvdwT+e9AFLsaGAhXv+5RnzIHWm75nY5pv0
	=
X-Received: by 2002:a17:90b:1dc7:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b197c81836mr533867a91.8.1794440641776;
        Wed, 11 Nov 2026 15:44:01 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c74bf3sm1328794a91.10.2026.11.11.15.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:44:01 -0800 (PST)
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
Subject: [PATCH net 3/3] net: dsa: motorcomm: Use VID 0 as the unaware PVID
Date: Thu, 12 Nov 2026 07:41:06 +0800
Message-ID: <20261111234110.1449602-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111234110.1449602-1-mmyangfl@gmail.com>
References: <20261111234110.1449602-1-mmyangfl@gmail.com>
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

The hardware classifies untagged and priority-tagged frames to the
port's PVID before the VLAN table lookup, and the FDB lookup key equals
the classified VID (measured on YT9215S).

The driver assigned PVID 4095 to the VLAN-unaware ports, while switchdev
reports the bridge's FDB entries with VID 0. These entries were then
installed under FID 0 and could never be hit by the hardware lookups.
Dynamic entries learnt under VID 4095, if any, took effect instead.

Lift the restriction on VLAN 0, and use it as the PVID of the
VLAN-unaware ports instead. The standalone default of 4095 stays, so
mislearnt entries, if any, would not pollute the bridge FDB.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index a2be819ccbed..376f16466cdd 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -79,7 +79,6 @@ static const struct yt921x_info yt921x_infos[] = {
 	{}
 };
 
-#define YT921X_VID_UNWARE	4095
 
 struct yt921x_reg_mdio {
 	struct mii_bus *bus;
@@ -962,7 +961,7 @@ yt921x_vlan_filtering(struct yt921x_priv *priv, int port, bool vlan_filtering)
 	bdev = dsa_port_bridge_dev_get(dp);
 
 	if (!bdev || !vlan_filtering)
-		pvid = YT921X_VID_UNWARE;
+		pvid = 0;
 	else
 		br_vlan_get_pvid(bdev, &pvid);
 	res = yt921x_port_set_pvid(priv, port, pvid);
@@ -1030,8 +1029,7 @@ yt921x_pvid_clear(struct yt921x_priv *priv, int port)
 
 	vlan_filtering = dsa_port_is_vlan_filtering(dp);
 
-	res = yt921x_port_set_pvid(priv, port,
-				   vlan_filtering ? 0 : YT921X_VID_UNWARE);
+	res = yt921x_port_set_pvid(priv, port, 0);
 	if (res)
 		return res;
 
@@ -1188,7 +1186,7 @@ static int yt921x_userport_standalone(struct yt921x_priv *priv, int port)
 	/* Unrelated since learning is off and all packets are trapped;
 	 * set it anyway
 	 */
-	res = yt921x_port_set_pvid(priv, port, YT921X_VID_UNWARE);
+	res = yt921x_port_set_pvid(priv, port, 4095);
 	if (res)
 		return res;
 
@@ -2270,7 +2268,6 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 {
 	struct dsa_switch *ds = &priv->ds;
 	unsigned long cpu_ports_mask;
-	u32 ctrls[2];
 	u32 ctrl;
 	int port;
 	int res;
@@ -2328,15 +2325,6 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 	if (res)
 		return res;
 
-	/* Tagged VID 0 should be treated as untagged, which confuses the
-	 * hardware a lot
-	 */
-	ctrls[0] = YT921X_VLAN_CTRLa_LEARN_DIS | YT921X_VLAN_CTRLa_PORTS_M;
-	ctrls[1] = 0;
-	res = yt921x_reg64_write(priv, YT921X_VLANn_CTRL(0), ctrls);
-	if (res)
-		return res;
-
 	return 0;
 }
 
-- 
2.53.0

