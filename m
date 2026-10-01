Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0138535FBB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869435; cv=none; b=VQwuA5mnhVneqIQk+R1VuTd7RAtC5h7FvGGP5011fGHdQdaSDcFhgXmD8rYWavmi+xdym065mnNbByGbWfTcTmSSazkhtMEjZ/48GadrmxGUsM9bpzCFvQmMO9XrWvZ7Qu1f+0Dh95keozKQ94t78sGvfiWkDLKSrgmuPiAmOfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869435; c=relaxed/simple;
	bh=CL6NT9NPb+SE4cewyKhPXsPbOqTK7Ga2km5UdId3qwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jxamqov6k2CdCJZ5G5CKK71ACcWqllURqB3/E0X7K6CoWlt/lke4AU/6w+nCCJ7Nhha73gyAOp3/UC973OIfDDENl59H6mtEc76SGxbee0ehoWas4ezTo/nOzkFn3Fj5lZpPdGhRV4xyhCcGaai5DtIk+aANh+jVKGjJR1HUlqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPrEJPCL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPrEJPCL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso51270035e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869424; x=1791474224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QuSJTIGS2kydrO7lTUFOMV5TPnPEsP1/p4j5H58s+oo=;
        b=kPrEJPCLSPTzUlEJ25kBXfw+3P8qSq4B+Abl4LKFvTb1nPp4R33uAObgErRRxCVp68
         m7e05kV8qdNYREkM8mMEXE084t3lNEdlHmRhQjlynpP4IaAz4V0kw8tFSQgX0zCVZLKy
         jV4yR3Zkzqb4SNWwqDxsHE2DHInGK6Un/R72XvNYm9dJ8RsPjzutEkR0Rp74iTegl4BY
         C5A446G5oiSn55hb0sh1f1LeiYEnVLpU666hAxSjbSvTW4LviIILQcAF6jHzi/FQhqxr
         BwxWu6hH/I5f3tertkioSHjbipUVCntLP6gJBGF7nOeS6FOoR6KIutmYUFv3B5Im07Ht
         edkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869424; x=1791474224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QuSJTIGS2kydrO7lTUFOMV5TPnPEsP1/p4j5H58s+oo=;
        b=a+cmNZ8HVOsjAMZbMVfMRG/+rlhC6P8AYOwbD7DFzgyI70upqSAy4rPkp7NqCjQgjY
         h7833NJFpoyOquL64kFfa75e0X9Q8LqZFLjh6WY8raG6jECrx8NIhMhY0Z/UqCpATmJm
         n0KFIm6uTzM4V01Y+8K+iQ202Ztf81JXxsmjBxRkUSk8j6XrK8fqBcJkROeNxh25CbRQ
         0LUjKPLnvqC3qM6lI5tjekN0Yo+tw8Q4FrZDPi6NGthtkHZMTqsSCLlsiU01OmsZW02Y
         2G8A4HYnj7X3ENKbcTrjnlHnP77IdomCFOxAvwcDO8sJUMu+m/7Ww5+UGxiisTkS/Tvc
         omsg==
X-Forwarded-Encrypted: i=1; AKwUvBxnKfGebbNrj7pn8HZ/L3OIuOH1fQI9EFks1fls5YDIaY2P5APxPfwCU+/zUcaozp3SzHEAEuR2K81nwM0=@vger.kernel.org
X-Gm-Message-State: AFuF++n1tb2Hm2JpIkh1LUDtnE8/lWLRKEriZVR9Ccc48VRvo1W3hidI
	OiAjBJRH3LPDv0jtl61YxPsginHRKOi2r5KcZr09VG8z33KyjBxqa0gT
X-Gm-Gg: AYBFou3ldhrvRpOfMN/0PwmyEFvLOaRWR/dTUMucWPdcBQKQI8LwbXUzoZgFOewhut7
	Zd2k1LjGPH0I9ugdMLJ8iEaFLuNXBkj+rQ196XvJHA/Ou2sCa7O8vsPxS7Cqy77q97hKXcjgEYk
	yahtE/uX7UoMvSVeKJLZLgQ5/Vevlxk5Ffm5T4Wfarq396FMLfLsjI986xD59bJ+5bhTPixuNrV
	cDm7EopnTU5/e09juJp3iVYLvwkQAXhAGwH9YrvfTU2RrWDk2z9516+CDUhZU89UcKLsqbV9QG2
	QVup7tNWEKmsryPdXN0jsbqApR8FqS3/wk10Ef8vaWp1sXnzBUqpf/2VhhDrMfmsiCQHwrGQWyV
	w6GBmlcYGzutC+EqahCumFua2rXbiySfaDmZQoSP3o7DUhLfa1V5sveH+qt4lnm1g7OSwG0rZ9l
	ialz3iCCWTaSNbJrIv+f9IK5TXwelxcJkhn+X/EAHchLERevGr92D2c8/k7lVkvmTPZAourMwar
	pEJcAhZ4LIK4BpjhTd/vuY/Adeza7EftVVWtByZY2KKhogncXz5iRsFx2FCrgSdTCrXVvZBFlDS
	corwe5ig
X-Received: by 2002:a05:600c:1909:b0:4a0:1e9f:6516 with SMTP id 5b1f17b1804b1-4a02751b008mr763815e9.1.1790869424097;
        Thu, 01 Oct 2026 08:43:44 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f6db98fsm65195615e9.0.2026.10.01.08.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:43:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v2 10/12] net: dsa: rzn1-a5psw: Add fixed frame length workaround for management port
Date: Thu,  1 Oct 2026 16:43:23 +0100
Message-ID: <20261001154326.754314-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The ETHSW IP used in SoCs such as RZ/T2H and RZ/N2H has a hardware issue
where the internal mgmt_tag_vld signal is asserted as a level instead of
a single-cycle pulse. This causes the frame length counter on the
management (CPU) port to over-increment, so valid frames are falsely
detected as oversized and dropped.

The recommended workaround is to program the maximum frame length
register (FRM_LENGTH) of the management port with a fixed, large value.

Add a management_port_fixed_frame_len member to struct a5psw_of_data to
hold the SoC-specific value. When it is set, program A5PSW_FRM_LENGTH
for the CPU port with this value in a5psw_setup(), and skip updating
FRM_LENGTH for the CPU port in a5psw_port_change_mtu() so that MTU
changes do not override the workaround.

No functional change for existing SoCs, which leave the value unset.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Added info about the IP issue and the workaround.
- Updated commit message
---
 drivers/net/dsa/rzn1_a5psw.c | 18 +++++++++++++++++-
 drivers/net/dsa/rzn1_a5psw.h |  3 +++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 0b0b4055e615..ce931442d49f 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -209,8 +209,13 @@ static int a5psw_port_enable(struct dsa_switch *ds, int port,
 static int a5psw_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 {
 	struct a5psw *a5psw = ds->priv;
+	struct a5psw_of_data *of_data = a5psw->of_data;
+
+	if (dsa_is_cpu_port(ds, port) && of_data->management_port_fixed_frame_len)
+		return 0;
 
 	new_mtu += ETH_HLEN + A5PSW_EXTRA_MTU_LEN + ETH_FCS_LEN;
+
 	a5psw_reg_writel(a5psw, A5PSW_FRM_LENGTH(port), new_mtu);
 
 	return 0;
@@ -990,8 +995,19 @@ static int a5psw_setup(struct dsa_switch *ds)
 		if (dsa_port_is_unused(dp))
 			continue;
 
-		/* Enable egress flooding and learning for CPU port */
 		if (dsa_port_is_cpu(dp)) {
+			/*
+			 * Workaround for ETHSW IP issue, mgmt_tag_vld is asserted as a level
+			 * instead of a single-cycle pulse, causing the frame length counter
+			 * to over-increment and trigger false oversize frame drops.
+			 * The recommended workaround is to set the maximum frame
+			 * length on the management port.
+			 */
+			if (a5psw->of_data->management_port_fixed_frame_len)
+				a5psw_reg_writel(a5psw, A5PSW_FRM_LENGTH(port),
+						 a5psw->of_data->management_port_fixed_frame_len);
+
+			/* Enable egress flooding and learning for CPU port */
 			a5psw_flooding_set_resolution(a5psw, port, true);
 			a5psw_port_learning_set(a5psw, port, true);
 		}
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index e952afd95dca..5bec33b23079 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -237,12 +237,15 @@ union lk_data {
  * @npcs: Number of PCS connected to the switch
  * @cpu_port: CPU port number
  * @tag_proto: DSA tag protocol used by the switch
+ * @management_port_fixed_frame_len: Fixed frame length for the management
+ *   port to account for the HW issue.
  */
 struct a5psw_of_data {
 	unsigned int nports;
 	unsigned int npcs;
 	unsigned int cpu_port;
 	enum dsa_tag_protocol tag_proto;
+	unsigned int management_port_fixed_frame_len;
 };
 
 /**
-- 
2.55.0

