Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352398;
	b=z64IE7YaEMhIz3vLq8qeL7/CRe61adYuCZUtdPbB0ushB349IeqIB3sr/jpzvAafHCu5
	 mv4QtJHBmCGmi2FLdgk9oijnp5n/TJziFPSOYGDxrou/Zcb+70n8Fp9KuU8CjR7PZO7OR
	 BO2oHCFQngeDNLA46dZcGj5jd242A7KsyBDO03Nvg3HbBniDLFiUdFqoK8vIdTB9MdRec
	 WtnLiKpqnfk/MnKbSQn2Hiqokf/6OLt7FM/kSwdWGbbO9Q98SvDssSe5XqJjML3Kbhuas
	 CGKUImqRMM1LgzGfOk5bYVET8VNuHrcU4+hf8ymvydQsClRaELXO+Qx2tnd+2SAjUMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WNPvGEKQXav9VSZ3J7/386PWbh2deprE17GmLSUj3BQ=;
	b=FXulwci/ioefk2Uo7U/5je2knVbeuj9mbtxDzStK8P/Gq61Wo5iVRMw6d8scNPwzMTy7
	 RKjlOZ9oHAtNZStQD6ZXV78TbjiS3ByeenHU2bh4Em8Vi6cxRyVxdGbQAsQQxi7kk18aR
	 wnxtIlYVVSdQjPTIacwwSwa6M4e/0/W7E7zASD6G73TZ4u8ip2djgJlzfhvQGrWI5RtlF
	 d1EdV9xo9IG5bRy26/47LLJoIMWQ3lx/64rfCGeIw5FBL2/QYlvS3Wi57Ykoplv6IQriD
	 FU0quskrrTrLt+//5By3fsElxw9KwAPjGMwPev3aV1wXNbv9C8WK2oCFC8/ADpbJQOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kSOtdwcf;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F2B606A339
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90F2B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kSOtdwcf
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc751eddf25so1359090a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794352398; x=1794957198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WNPvGEKQXav9VSZ3J7/386PWbh2deprE17GmLSUj3BQ=;
        b=kSOtdwcflrPTYOJkmiuF1ig4Gx7po9JWw0+rkgtDjdQhuPJEj3dJCcsicLlHPeWxQV
         8HF5JC6ZMi7dBxkoETsI1t9vz/ghr2gsgZ8UVwXjHeAB2Y6KU5eaInzFaGs0/G/Y5eCW
         zF/SpM1eLZ/O+vx06KLGL2swCjxEl2MSban0MpTZaCQEhUqmtmxfsvldqcX4duHfxvVl
         HCjgawbylZyc/msT/UQG1mO6Ykc1SyGApMJBlfxR9EgtNzQnfhdGj0b5suSMITWCtQd0
         UOmg7cjMSdjr3MfKvwP2GKpia65QcXcPJ9h8iBs/2rk6ZAwFMkXs+EdntslcJPCl0WFw
         Y0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352398; x=1794957198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WNPvGEKQXav9VSZ3J7/386PWbh2deprE17GmLSUj3BQ=;
        b=XumASeatocV1RP4ZFSmLA4WVXmcdkomkh8iez29iEgz23i2hnmmL/+aaKOT5eGchUY
         1bGOJenyRgWke/5gIKHY7Ifn/VLfAIm91CjcBUAVm8UTfL5L28ckjxYfdLd1mzbq5vDX
         OWQghkXU3JeyJAKEvSIL8uzxqRq/qaDbvKsCuvo5QlLCkzvkQwT/JLGK8H2kFNx7M6b3
         DvEw6LxsmOfDmpsodxykBShLAJN2Hz5p7inCK2EpwJaitII1w13R3Ogvg5ieT5+eqbgh
         2NCiFZ0IxcfWIPrC+Ob45wV484uwipYvJSJWt3DqjsMFxeVv7ADnazfX2/0Lc4J+nA3L
         fDTg==
X-Forwarded-Encrypted: i=1; AL+hErGCWjjms6EFxh1sG/erpzL5WwJ27+0eTRyr2GE20Hho1JAo+yFYF97uGJ04KbN3Ij0+6YeWLPgYzm45iXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jKcCs/+qitR2ugtxNX/NuphN1dnNDabKOJWivDfrAtisp8zHK
	sGE6YyKgyokBbL6ao2tst/SWuCMYA9/lIZrJ/3pmTLYGg81mxti1yE6Ll1sBpTAKCfU=
X-Gm-Gg: AYBFou1uu6TrXllInHOfUOhFcKmkwGskEB7iFI9tNNl3qh8K5mpZG5jCStXsYXAl5Zy
	gPbnwdn9Wj1j5E+7nsZHPZH/9thxUmvjjSnn8/AP4h37oXABGHcT6w9fYCMjmnrW90sFSOh16BI
	qDy2bFCkEp3XbSd0/2rVaUDo3jMxmr0FnWTK/oXWXqK2mR8XcKqwsug80DeIMPQ0jWTag67KeNQ
	pn9Pkhs4+54hl2I6ccmrN0Qd1drXneUWnWHyDQm4wFr5Rp/+/D94K2sT/vockWkyY+OnTBC7EWh
	YxeP2ZPEgyKi5dVm3VuZSSzhTOiOBpAg/t3H7vr+ETPHGAu1SFQfe71xoPDXuwAN1nQmxL5kL+C
	hJtabifLVO2w15asoZkri1rdibKy1bEeNxsIX6prBSnzvEiLfuSnP63kmrxzzk/9WcSqTU9amuT
	JMtJRa2wIzQBQkXqpXmxryi8MJUR/6pi2CvyMXB7IXjb5pQmTUA5hvDaxNgBQy++j/mgWCTNDaP
	RHNJTFV8jTYnzi5iYuBzRIOw5oGH4SrJOiaBnwgmrs/+pblyJWP/ao2Iq5cEoldSpTya21sKzRN
	J7CAUaZwuMvv5TAcbBPQ4Odleave45Lfc1ARA/MLLQs=
X-Received: by 2002:a05:6a20:914b:b0:3e2:5d7f:f630 with SMTP id adf61e73a8af0-3f2feedbe75mr719252637.54.1794352397968;
        Tue, 10 Nov 2026 15:13:17 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:56::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7cf07dsm1173961a12.28.2026.11.10.15.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:13:17 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>,
	linux-rdma@vger.kernel.org
Subject: [PATCH net-next 1/5] net/mlx4: factor VLAN parsing into mlx4_en_prep_vlan()
Date: Tue, 10 Nov 2026 15:12:55 -0800
Message-ID: <20261110231304.1859217-2-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110231304.1859217-1-joe@dama.to>
References: <20261110231304.1859217-1-joe@dama.to>
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

Extract the code which converts an skb VLAN tag into WQE fields into a
small helper. This helper will be used by a follow-up series implementing
software USO, to avoid code duplication.

Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/mellanox/mlx4/en_tx.c | 33 ++++++++++++++--------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index c5d564e5a581..00210dbae1c3 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -861,6 +861,26 @@ static bool mlx4_en_build_dma_wqe(struct mlx4_en_priv *priv,
 	return false;
 }
 
+static bool mlx4_en_prep_vlan(const struct sk_buff *skb,
+			      union mlx4_wqe_qpn_vlan *qpn_vlan)
+{
+	u16 vlan_proto;
+
+	if (!skb_vlan_tag_present(skb))
+		return false;
+
+	qpn_vlan->vlan_tag = cpu_to_be16(skb_vlan_tag_get(skb));
+	vlan_proto = be16_to_cpu(skb->vlan_proto);
+	if (vlan_proto == ETH_P_8021AD)
+		qpn_vlan->ins_vlan = MLX4_WQE_CTRL_INS_SVLAN;
+	else if (vlan_proto == ETH_P_8021Q)
+		qpn_vlan->ins_vlan = MLX4_WQE_CTRL_INS_CVLAN;
+	else
+		qpn_vlan->ins_vlan = 0;
+
+	return true;
+}
+
 netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct skb_shared_info *shinfo = skb_shinfo(skb);
@@ -902,19 +922,8 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 	nr_txbb = desc_size >> LOG_TXBB_SIZE;
 
 	bf_ok = ring->bf_enabled;
-	if (skb_vlan_tag_present(skb)) {
-		u16 vlan_proto;
-
-		qpn_vlan.vlan_tag = cpu_to_be16(skb_vlan_tag_get(skb));
-		vlan_proto = be16_to_cpu(skb->vlan_proto);
-		if (vlan_proto == ETH_P_8021AD)
-			qpn_vlan.ins_vlan = MLX4_WQE_CTRL_INS_SVLAN;
-		else if (vlan_proto == ETH_P_8021Q)
-			qpn_vlan.ins_vlan = MLX4_WQE_CTRL_INS_CVLAN;
-		else
-			qpn_vlan.ins_vlan = 0;
+	if (mlx4_en_prep_vlan(skb, &qpn_vlan))
 		bf_ok = false;
-	}
 
 	netdev_txq_bql_enqueue_prefetchw(ring->tx_queue);
 
-- 
2.53.0-Meta

