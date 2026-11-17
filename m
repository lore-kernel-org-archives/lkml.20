Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895742;
	b=awvDj9mbqhTorIbtUV4MVlQaNsVoXLGQqIzg0vj+QMAwcntCZxJU6wwicdN/OerWGdXQ
	 JTVOrChVkmUSKt7LyNuIqAkhi1sRvF4T1rUfqs3R8EMG4urGILGwxhJ8SK2tDaoKBDHYM
	 or+63IHIfP/pigSWYye0+l5MdIMEY5PCy28DTE6V4Talxa1eeKyIVaUrijA4rUcJsZyn/
	 Cj9y57iXh220ro1Cuw2FkmcYpZomxuxTRQLiuVOhIlBBzNgP75hv5Tbxr2vUnB/I33172
	 4Xw9eXUEZ6ZY3Togqf27W9FKGulhyUzq6sNc5oQ4WdAxMfyrzMr97Q0k2k3fGebqzQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895742;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JCPNRdnZcPQxHCC44tnZlV1h2wtnaQK8JNCPYF1dq5c=;
	b=xCF4SXepbeQDFBKTMeqRQ2u5Sm7tk/DILVOrN3JDnTsvnNlCvSTLZXH01JNH1uPa2i6m
	 wCOcXXZ2jJSI4URPTy766is7SEpbnovnYbGt0QB+qno1FBQnb5XzXSLBbgB9ox8w44STF
	 HVVZLflQFNTW0262vfWDSU4TV745+gsngfKl4nq7euUBquhRzuVCn/oDVnWdV1KDhCx7V
	 b0A8eUweKABC67/j8jBgJzObvLE/PWiFchMhmgkBE+dTzbqsg9sOerts8x69aNDk6NjC8
	 l33sqmK6MXdVM7n+lNUJXRpfpbq3MasAQd1eTYEI0je/uoXEA+4TQ69QjghaXJtSPng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gVXPKPOK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB85606A329;
	Tue, 17 Nov 2026 06:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBB85606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gVXPKPOK
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2a6IW2463385;
	Tue, 17 Nov 2026 06:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JCPNRdnZcPQ
	xHCC44tnZlV1h2wtnaQK8JNCPYF1dq5c=; b=gVXPKPOKNnw/9by392dEH/vzvcC
	N8F2wpo2tzNLaAimShZIsp70Hg4dyZmdJ1WMpOig6ldu68pOgD9S7LRic3sTb3nn
	r0csfM/xFdd2EPmZMl/o3I4UpsBHgSfhAsY75+5BPHBBEp4V2ScxjDAEudOVo+tc
	u4p5pqI0X2tc041m4iwUJFXiJ6yFtC3RJWoewnVLdvcKaXMxYQDm6sHjaRC25tn/
	+DeJIsmNHDBAoyWyuGKrQA07lzHJWayiuOIfiDwZ5dANHZffxkMzIkpqNsPfzwoE
	EE1Wq8PgmJNTKbTJVIr5Qu1NfUO0iqg43IyVpHsG4++d5g8GasQ5a/1lU6Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqgm71p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 06:08:53 +0000 (GMT)
Received: from pps.filterd (nalasppmta02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH68r3V1935250;
	Tue, 17 Nov 2026 06:08:53 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-subashab-lv.qualcomm.com [10.81.24.15])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AH68qRT1935223
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 06:08:53 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 212624)
	id 8B8FEAC6; Mon, 16 Nov 2026 22:08:52 -0800 (PST)
From: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
To: sean.tranchetti@oss.qualcomm.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
        pabeni@redhat.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
Subject: [PATCH net v5 2/5] net: qualcomm: rmnet: Size the first device from the requested data format
Date: Mon, 16 Nov 2026 22:07:35 -0800
Message-Id: <20261117060737.2764327-3-subash.a.kasiviswanathan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNCBTYWx0ZWRfX1NnyULIXoPTX
 uKQEPShmltIO8EurUpf6MIz7QfxBNbBBxAjfwPvLJRdqtd6Az01rgVmzONVKCaq5TRmJegI1rgI
 o3um+wYaqtTJLPL8W5Or0Ac2Bco+SdU=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afbef75 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=xjCUdBXf3EuXhAiaZqQA:9
X-Proofpoint-ORIG-GUID: XT8sCXhwMVvzZjH1rqoKBLnMbIKZN88q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNCBTYWx0ZWRfX+t3pDYk1Zdx1
 mbyIxw2HBkwBDMnmOtG1U0tNWv67zrel09UzafQ3ZleuBo7NW2Mx9MoJhXrogRJmpWtrVdKRopu
 PJwNxcF1XzS8mKr0GvTL+fu1yGcs5U6XKYi09ML0ODoKnw/j6qeZmtdhUAcFhRpvUDa4QZi23HG
 6bgbGK1NGOY/zmNZ1wNLWiYvMKG283k6g9k50zSF1jwmu+XlxTqcROVAB+oTci7TfwC2asBZsTU
 mbULcC9z9oa8Ceud1ZBEWNQAiJk5q2HEzOHjinrM3rtAA3jykXT+Rp/6emkSVCERx+o/+1J/Djr
 ojx/MM2rew1/XSYPODH5e9LZ/LuGg/xaitRMwrUri90PIB9mw+AHrbiIBaJ8MKa+iiJdfswgi78
 XVavpHadb/cAnwKY3wN9EBOu1sBFcD1KOXIuUuTqonO0bKisi+nnKvLVc0e6iHDuF1tAMAQaISg
 ZKi+Yxw15Qgv2upkAgw==
X-Proofpoint-GUID: XT8sCXhwMVvzZjH1rqoKBLnMbIKZN88q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170024

rmnet_newlink() sizes the first rmnet device from the data format
currently stored in the port, before the requested IFLA_RMNET_FLAGS
have been applied. The MTU therefore does not match the egress header
overhead of the format which ends up being used.

Apply IFLA_RMNET_FLAGS first and pass the resulting data format to
rmnet_vnd_newlink(), so that the headroom is calculated from the format
being configured.

Fixes: b7f5eb6ba21b ("net: qualcomm: rmnet: Update rmnet device MTU based on real device")
Co-developed-by: Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
Signed-off-by: Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
Signed-off-by: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
---
 .../ethernet/qualcomm/rmnet/rmnet_config.c    | 19 +++++-----
 .../net/ethernet/qualcomm/rmnet/rmnet_vnd.c   | 38 ++++++++++++-------
 .../net/ethernet/qualcomm/rmnet/rmnet_vnd.h   |  2 +-
 3 files changed, 35 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
index 61b04c6c0390..40544b75e602 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
@@ -143,6 +143,14 @@ static int rmnet_newlink(struct net_device *dev,
 		return -ENODEV;
 	}
 
+	if (data[IFLA_RMNET_FLAGS]) {
+		struct ifla_rmnet_flags *flags;
+
+		flags = nla_data(data[IFLA_RMNET_FLAGS]);
+		data_format &= ~flags->mask;
+		data_format |= flags->flags & flags->mask;
+	}
+
 	ep = kzalloc_obj(*ep);
 	if (!ep)
 		return -ENOMEM;
@@ -154,7 +162,8 @@ static int rmnet_newlink(struct net_device *dev,
 		goto err0;
 
 	port = rmnet_get_port_rtnl(real_dev);
-	err = rmnet_vnd_newlink(mux_id, dev, port, real_dev, ep, extack);
+	err = rmnet_vnd_newlink(mux_id, dev, port, real_dev, ep, extack,
+				data_format);
 	if (err)
 		goto err1;
 
@@ -167,14 +176,6 @@ static int rmnet_newlink(struct net_device *dev,
 
 	hlist_add_head_rcu(&ep->hlnode, &port->muxed_ep[mux_id]);
 
-	if (data[IFLA_RMNET_FLAGS]) {
-		struct ifla_rmnet_flags *flags;
-
-		flags = nla_data(data[IFLA_RMNET_FLAGS]);
-		data_format &= ~flags->mask;
-		data_format |= flags->flags & flags->mask;
-	}
-
 	netdev_dbg(dev, "data format [0x%08X]\n", data_format);
 	WRITE_ONCE(port->data_format, data_format);
 
diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
index fd10aa418be7..984c66bee863 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
@@ -66,29 +66,27 @@ static netdev_tx_t rmnet_vnd_start_xmit(struct sk_buff *skb,
 	return NETDEV_TX_OK;
 }
 
-static int rmnet_vnd_headroom(struct rmnet_port *port)
+static int rmnet_vnd_headroom(u32 data_format)
 {
 	u32 headroom;
 
 	headroom = sizeof(struct rmnet_map_header);
 
-	if (port->data_format & RMNET_FLAGS_EGRESS_MAP_CKSUMV4)
+	if (data_format & RMNET_FLAGS_EGRESS_MAP_CKSUMV4)
 		headroom += sizeof(struct rmnet_map_ul_csum_header);
-	else if (port->data_format & RMNET_FLAGS_EGRESS_MAP_CKSUMV5)
+	else if (data_format & RMNET_FLAGS_EGRESS_MAP_CKSUMV5)
 		headroom += sizeof(struct rmnet_map_v5_csum_header);
 
 	return headroom;
 }
 
-static int rmnet_vnd_change_mtu(struct net_device *rmnet_dev, int new_mtu)
+static int rmnet_vnd_change_mtu_with_format(struct net_device *rmnet_dev,
+					    int new_mtu, u32 data_format)
 {
 	struct rmnet_priv *priv = netdev_priv(rmnet_dev);
-	struct rmnet_port *port;
 	u32 headroom;
 
-	port = rmnet_get_port_rtnl(priv->real_dev);
-
-	headroom = rmnet_vnd_headroom(port);
+	headroom = rmnet_vnd_headroom(data_format);
 
 	if (new_mtu < 0 || new_mtu > RMNET_MAX_PACKET_SIZE ||
 	    new_mtu > (priv->real_dev->mtu - headroom))
@@ -98,6 +96,17 @@ static int rmnet_vnd_change_mtu(struct net_device *rmnet_dev, int new_mtu)
 	return 0;
 }
 
+static int rmnet_vnd_change_mtu(struct net_device *rmnet_dev, int new_mtu)
+{
+	struct rmnet_priv *priv = netdev_priv(rmnet_dev);
+	struct rmnet_port *port;
+
+	port = rmnet_get_port_rtnl(priv->real_dev);
+
+	return rmnet_vnd_change_mtu_with_format(rmnet_dev, new_mtu,
+						READ_ONCE(port->data_format));
+}
+
 static int rmnet_vnd_get_iflink(const struct net_device *dev)
 {
 	struct rmnet_priv *priv = netdev_priv(dev);
@@ -310,8 +319,7 @@ int rmnet_vnd_newlink(u8 id, struct net_device *rmnet_dev,
 		      struct rmnet_port *port,
 		      struct net_device *real_dev,
 		      struct rmnet_endpoint *ep,
-		      struct netlink_ext_ack *extack)
-
+		      struct netlink_ext_ack *extack, u32 data_format)
 {
 	struct rmnet_priv *priv = netdev_priv(rmnet_dev);
 	u32 headroom;
@@ -328,9 +336,11 @@ int rmnet_vnd_newlink(u8 id, struct net_device *rmnet_dev,
 
 	priv->real_dev = real_dev;
 
-	headroom = rmnet_vnd_headroom(port);
+	headroom = rmnet_vnd_headroom(data_format);
 
-	if (rmnet_vnd_change_mtu(rmnet_dev, real_dev->mtu - headroom)) {
+	if (rmnet_vnd_change_mtu_with_format(rmnet_dev,
+					     real_dev->mtu - headroom,
+					     data_format)) {
 		NL_SET_ERR_MSG_MOD(extack, "Invalid MTU on real dev");
 		return -EINVAL;
 	}
@@ -387,7 +397,7 @@ int rmnet_vnd_validate_real_dev_mtu(struct net_device *real_dev)
 
 	port = rmnet_get_port_rtnl(real_dev);
 
-	headroom = rmnet_vnd_headroom(port);
+	headroom = rmnet_vnd_headroom(READ_ONCE(port->data_format));
 
 	hash_for_each_safe(port->muxed_ep, bkt_ep, tmp_ep, ep, hlnode) {
 		if (ep->egress_dev->mtu > (real_dev->mtu - headroom))
@@ -405,7 +415,7 @@ int rmnet_vnd_update_dev_mtu(struct rmnet_port *port,
 	unsigned long bkt_ep;
 	u32 headroom;
 
-	headroom = rmnet_vnd_headroom(port);
+	headroom = rmnet_vnd_headroom(READ_ONCE(port->data_format));
 
 	hash_for_each_safe(port->muxed_ep, bkt_ep, tmp_ep, ep, hlnode) {
 		if (ep->egress_dev->mtu <= (real_dev->mtu - headroom))
diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.h b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.h
index c2b2baf86894..5d54c24f5c8c 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.h
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.h
@@ -12,7 +12,7 @@ int rmnet_vnd_newlink(u8 id, struct net_device *rmnet_dev,
 		      struct rmnet_port *port,
 		      struct net_device *real_dev,
 		      struct rmnet_endpoint *ep,
-		      struct netlink_ext_ack *extack);
+		      struct netlink_ext_ack *extack, u32 data_format);
 int rmnet_vnd_dellink(u8 id, struct rmnet_port *port,
 		      struct rmnet_endpoint *ep);
 void rmnet_vnd_rx_fixup(struct sk_buff *skb, struct net_device *dev);
-- 
2.34.1

