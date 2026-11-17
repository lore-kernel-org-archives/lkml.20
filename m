Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895743;
	b=3xbDSgXBkrXFcbdlDY4b2uAAjEgJyR29oU3nZShma7c7flslI6a1egsoMbmWi0gPAqJH
	 AIqG0HyCqvmRsPF6ixSwXK29HREJ1gNns+zngEEWqUX26EBtzu4vqk9gvLQ4279bNeWg1
	 laXCmNtYUsrEuSHaZ0X0KoNRQAV3gbVojdwrA8PaX4QxmXoiQOwgrYQyQw+iWy96RNQWj
	 8czCO33Yoyd23adq2nzuJ41IsUV57hkHrLlr+LxmEXPfK2y0dTf/OACXvpnpfupzbS0+Y
	 pnHuX6YyLv5c4aO31gt4yAJoeZtYJlDP+fL8HD18e67sSCxdTUP92To1ltQ0SHfOAcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895743;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yjw+Kxaug3hwj0gxE+vPaxrTkpJElXr0kdGsYR4noMw=;
	b=LOLjfdd/HKwQSiXyzB21EroomOQ5oCgS+vSdERhptUdNDX6P1F9SJtiofbDrQ9tmSBTB
	 XYGvmFVX5qyQV7PGVw/lvU1uADT2uRCQrUOg9wgmwz1qjtk/oLwSE2XIpYyj7xg9Bk+VJ
	 9IsJOhPhRRLPHoiobyt3sLPyWLINdqSied/NUbAkBhKdM1Ou/ezzR4bScKOrYIsGxWGKn
	 Yuhn9Et4oPm17A6PD//x8n+FhUJFCT6DErGV6qVpLyPYt+8klYecT+m/sLfE1i+ZOaGoS
	 QlcoCJbmyvkHc9SBbubMnhZRo7ZfiYY+1udIC3NLwdjR/lD84jb7l3KOFzhFQwMw6cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XB0q4W2S;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175FB606A32C;
	Tue, 17 Nov 2026 06:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 175FB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XB0q4W2S
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aKZF3624354;
	Tue, 17 Nov 2026 06:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yjw+Kxaug3h
	wj0gxE+vPaxrTkpJElXr0kdGsYR4noMw=; b=XB0q4W2SyB93VFPSw/gMkcH6Lmf
	uvhtjuAMYAXayk9L4qh8bDd6nRPed+cc3O/bKZB5dGmwGnQZf42wBuApWGXwpNFm
	QEkc1atwqbK6kbH+32kiqjPjqGPxcMn4yS0wgBZJpIZ0sJpP+47NwoEru0wBP85F
	WK7gzk1dDqLySZc/BrKSlmRRn483MvNzoq2K5XmupTWDhv5s5Vs7HSSoU8CjYooV
	N4iNDc9NRXsW3JRRKUrTpfHu4KphKUQnV+fMAetFvi5NjQpIlqBtKi2VnSl/DBcr
	FwFuhwEmLC0rmP0ue4G0m+iGHo5UTzFpejgJ4lRCWbCmGeJ3tU+k3CGVB7A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rej367-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 06:08:55 +0000 (GMT)
Received: from pps.filterd (nalasppmta03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH68t9r4110126;
	Tue, 17 Nov 2026 06:08:55 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-subashab-lv.qualcomm.com [10.81.24.15])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 6AH68sNx4110117
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 06:08:54 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 212624)
	id 735B2AC6; Mon, 16 Nov 2026 22:08:54 -0800 (PST)
From: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
To: sean.tranchetti@oss.qualcomm.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
        pabeni@redhat.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
Subject: [PATCH net v5 4/5] net: qualcomm: rmnet: Publish data format and mux_id only after the MTU update
Date: Mon, 16 Nov 2026 22:07:37 -0800
Message-Id: <20261117060737.2764327-5-subash.a.kasiviswanathan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117060737.2764327-1-subash.a.kasiviswanathan@oss.qualcomm.com>
References: <20261117060737.2764327-1-subash.a.kasiviswanathan@oss.qualcomm.com>
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNCBTYWx0ZWRfX57LUydipx6bt
 bpX2z4TBR+Lyh22U8drvk9pGbUl4kp6mkaznLexy7vTBtWbhfuNfTG5TGRLHe0IFRWdDjt1Zt8n
 7RBc5N2zAtPsxMWXPJ5KUxbvCivLfYQ=
X-Proofpoint-ORIG-GUID: vF30e-S2Tw6uqNXku3RJdXjYeJFN8AwJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNCBTYWx0ZWRfX2ORBf8uP7yrt
 QZYk++6S/9zlDRC5P8HK7qqi2yGnMUHwq/IKdlmjMNEhCrbTA7FeAlzZIhEW57WH7bkqFXqQ9us
 mgra8xzAFLWJ7s4Z9um6kfqTUeTM2ZsSjC/IKBHQRlBGHagiCl5snjk61G5oJf2SHEf1D/im4Ad
 YluO8BnAKVxvFufgCAf0yf0nN0TFCPG0E2A1DeOu44DnHlKz6C2ZnIrR35mXIBqc/Gq4aDOBmL0
 Q3M0yfjg6bGb6seoxZ0a55FODcRdYwqTr4CbeNnoZPFKiIbUf1Yg/gjp5xp/csvP+3lcRWKnnWe
 +0/iwPEMH25et9ylfCOBlD+D/MfnF33nJGEWnJCZDg9qqtoWueLeu8P/J0ZWKgtLD/ehoQc6S8/
 oq/apZBeaTc/r/nX2fmfrMeCm4E5nQ8w8jC4xuhKZoHeueDcTvH0fBDEjmSaKCr+k04IOi7bBuH
 rvYma4/Qht9u6MutOfQ==
X-Proofpoint-GUID: vF30e-S2Tw6uqNXku3RJdXjYeJFN8AwJ
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afbef77 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=zMVAJWGL3Ejzn47avxAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170024

rmnet_changelink() publishes the new shared data format before
resizing the endpoints and reverts it if the resize fails, so the
datapath can briefly observe a format whose headers do not fit the
MTUs. A mux_id change requested in the same call is also applied before
the resize, so it is kept even though the call returned an error.

rmnet_newlink() never resized the existing devices at all, so a flags
change which increases the egress headroom left them with an MTU that
is too large for the real device.

Compute the new data format locally and pass it to
rmnet_vnd_update_dev_mtu(). In both rmnet_changelink() and
rmnet_newlink(), publish the format only after all MTUs have been
updated so that no revert is needed. rmnet_changelink() also moves the
endpoint to the new mux_id last, once the checks and the MTU update have
succeeded, so that a failed request leaves no partial change behind.
Return the error from the failing MTU change instead of -1.

Fixes: b7f5eb6ba21b ("net: qualcomm: rmnet: Update rmnet device MTU based on real device")
Co-developed-by: Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
Signed-off-by: Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
Signed-off-by: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
---
 .../ethernet/qualcomm/rmnet/rmnet_config.c    | 58 ++++++++++++-------
 .../net/ethernet/qualcomm/rmnet/rmnet_vnd.c   | 10 ++--
 .../net/ethernet/qualcomm/rmnet/rmnet_vnd.h   |  2 +-
 3 files changed, 44 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
index 40544b75e602..9e66f3804de4 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
@@ -171,6 +171,13 @@ static int rmnet_newlink(struct net_device *dev,
 	if (err < 0)
 		goto err2;
 
+	/* Update existing MTUs before publishing the shared data format. */
+	err = rmnet_vnd_update_dev_mtu(port, real_dev, data_format);
+	if (err) {
+		NL_SET_ERR_MSG_MOD(extack, "Failed to update MTU of rmnet devices");
+		goto err3;
+	}
+
 	port->rmnet_mode = mode;
 	port->rmnet_dev = dev;
 
@@ -181,6 +188,8 @@ static int rmnet_newlink(struct net_device *dev,
 
 	return 0;
 
+err3:
+	netdev_upper_dev_unlink(real_dev, dev);
 err2:
 	unregister_netdevice(dev);
 	rmnet_vnd_dellink(mux_id, port, ep);
@@ -302,9 +311,14 @@ static int rmnet_changelink(struct net_device *dev, struct nlattr *tb[],
 			    struct netlink_ext_ack *extack)
 {
 	struct rmnet_priv *priv = netdev_priv(dev);
+	struct rmnet_endpoint *ep = NULL;
+	struct ifla_rmnet_flags *flags;
 	struct net_device *real_dev;
 	struct rmnet_port *port;
+	u32 old_data_format;
+	u32 data_format;
 	u16 mux_id;
+	int err;
 
 	if (!dev)
 		return -ENODEV;
@@ -321,12 +335,17 @@ static int rmnet_changelink(struct net_device *dev, struct nlattr *tb[],
 
 	port = rmnet_get_port_rtnl(real_dev);
 
+	if (data[IFLA_RMNET_FLAGS]) {
+		old_data_format = READ_ONCE(port->data_format);
+		flags = nla_data(data[IFLA_RMNET_FLAGS]);
+		data_format = old_data_format & ~flags->mask;
+		data_format |= flags->flags & flags->mask;
+	}
+
 	if (data[IFLA_RMNET_MUX_ID]) {
 		mux_id = nla_get_u16(data[IFLA_RMNET_MUX_ID]);
 
 		if (mux_id != priv->mux_id) {
-			struct rmnet_endpoint *ep;
-
 			ep = rmnet_get_endpoint(port, priv->mux_id);
 			if (!ep)
 				return -ENODEV;
@@ -336,32 +355,29 @@ static int rmnet_changelink(struct net_device *dev, struct nlattr *tb[],
 						   "MUX ID already exists");
 				return -EINVAL;
 			}
-
-			hlist_del_init_rcu(&ep->hlnode);
-			WRITE_ONCE(ep->mux_id, mux_id);
-			hlist_add_head_rcu(&ep->hlnode,
-					   &port->muxed_ep[mux_id]);
-
-			WRITE_ONCE(priv->mux_id, mux_id);
 		}
 	}
 
 	if (data[IFLA_RMNET_FLAGS]) {
-		struct ifla_rmnet_flags *flags;
-		u32 old_data_format;
-		u32 data_format;
+		err = rmnet_vnd_update_dev_mtu(port, real_dev, data_format);
+		if (err) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "Failed to update MTU of rmnet devices");
+			return err;
+		}
 
-		old_data_format = port->data_format;
-		flags = nla_data(data[IFLA_RMNET_FLAGS]);
-		data_format = old_data_format & ~flags->mask;
-		data_format |= flags->flags & flags->mask;
 		WRITE_ONCE(port->data_format, data_format);
+	}
 
-		if (rmnet_vnd_update_dev_mtu(port, real_dev)) {
-			WRITE_ONCE(port->data_format, old_data_format);
-			NL_SET_ERR_MSG_MOD(extack, "Invalid MTU on real dev");
-			return -EINVAL;
-		}
+	/* Nothing below can fail, so move the endpoint only after all the
+	 * checks and the MTU update have succeeded.
+	 */
+	if (ep) {
+		hlist_del_init_rcu(&ep->hlnode);
+		WRITE_ONCE(ep->mux_id, mux_id);
+		hlist_add_head_rcu(&ep->hlnode, &port->muxed_ep[mux_id]);
+
+		WRITE_ONCE(priv->mux_id, mux_id);
 	}
 
 	return 0;
diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
index 2f3fefe58bce..8bf87c5ecb43 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
@@ -431,14 +431,15 @@ int rmnet_vnd_validate_real_dev_mtu(struct net_device *real_dev)
 }
 
 int rmnet_vnd_update_dev_mtu(struct rmnet_port *port,
-			     struct net_device *real_dev)
+			     struct net_device *real_dev, u32 data_format)
 {
 	struct hlist_node *tmp_ep;
 	struct rmnet_endpoint *ep;
 	unsigned long bkt_ep;
 	int new_mtu;
+	int err;
 
-	new_mtu = rmnet_vnd_target_mtu(real_dev, READ_ONCE(port->data_format));
+	new_mtu = rmnet_vnd_target_mtu(real_dev, data_format);
 	if (new_mtu < 0)
 		return new_mtu;
 
@@ -446,8 +447,9 @@ int rmnet_vnd_update_dev_mtu(struct rmnet_port *port,
 		if (ep->egress_dev->mtu <= new_mtu)
 			continue;
 
-		if (rmnet_vnd_change_mtu(ep->egress_dev, new_mtu))
-			return -1;
+		err = rmnet_vnd_change_mtu(ep->egress_dev, new_mtu);
+		if (err)
+			return err;
 	}
 
 	return 0;
diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.h b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.h
index 5d54c24f5c8c..901ef36900ac 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.h
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.h
@@ -21,5 +21,5 @@ void rmnet_vnd_tx_fixup(struct sk_buff *skb, struct net_device *dev);
 void rmnet_vnd_setup(struct net_device *dev);
 int rmnet_vnd_validate_real_dev_mtu(struct net_device *real_dev);
 int rmnet_vnd_update_dev_mtu(struct rmnet_port *port,
-			     struct net_device *real_dev);
+			     struct net_device *real_dev, u32 data_format);
 #endif /* _RMNET_VND_H_ */
-- 
2.34.1

