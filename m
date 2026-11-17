Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895742;
	b=vcvJwx3ibHZzlvmhAu8b6aHy/7m3fuSV/4sQT5fh64pufgnhXoJ5FwNuH1yvUBqkHn48
	 kb5DLs1IqVHb6hxwZ38Z4CTxt04ckE8235fhaRHjdhj1A/JJD9QVHSZadH4aV/XKLrFWu
	 /qGLxtBf6pZJOLQcY49CvT+jRW4B782UZFNobhde1z9avirjIzmtAYO1NBxWsGlnoebzo
	 6rMS3/UKrYsLGUta7X0a+nZ1NKAXtQs88z/0mTkv9l/yvVhnpVr/8mp6jwKsvZD/rXpDd
	 Ik+/EeB0w1pOlUz7tiI3/eaqEpVanssQAyvghjsT+JY7lyrp98zRFS7zDca0aCEIu8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895742;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hDaw2u5X0Ybj+FWYaRauNzPRP0Qczkn0HfxzYJ/zB7U=;
	b=5IHC4JLkyB7e07PnoztstC8QFYvRVqmJeTZtGp7DGADbFttBpojKSQgED9O/j7IMnzld
	 yTo5qXbo/y4Q9UgIJhDzhzTQqRsw3Qj4pXwqNJkx/CeF3ERYFXXK16r8bEetaBLIbE5Y8
	 czUfCOv8xaJEJaq8lWs1mNqfQOlZr8XcukbhED6HUw2BU9XNM7Sg+4y0xhuA5UZrImIlm
	 0NoB76AQMgPqkTggUAH3FAHG7MJAdY+gmy46Q4Z7YIZe+urBk2QaLQhhDyDv16A+lkaJ1
	 RDFabrULWERZAE8SNzM+gEdy/kNHdSfSuRAeykwXWF4CYtJzYJB5rw50JDglPH8L/Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fsEP4RUz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E2C606A32A;
	Tue, 17 Nov 2026 06:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E2C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fsEP4RUz
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aJC34146691;
	Tue, 17 Nov 2026 06:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hDaw2u5X0Yb
	j+FWYaRauNzPRP0Qczkn0HfxzYJ/zB7U=; b=fsEP4RUzXprAq7rU5XPc9ZatxgB
	338bhuE9OpTU50CvR6R/rTqLpgqCNB8z+PuJtE4iU6agFcK05n83tXbSG2nrRiXe
	24VU593tYaLe3twQ0i4HKIU3yuhsYx3X1schiG4cjb4fqozgpCy43xV2frQethFG
	KAHJiaXEeFgBgRsFYbxau0FERf4YkbXcNTst/7mfU8flM6/Zoit5yiyXf1HkCtC8
	FAci/smwjPzArZJi3BX6LO54SesWPnF+ijjMsKX0LYNObYxdspZzxeqS5rqzoQUE
	ptbIUQRTHwFZFyOV2GEQurZFXG3JDnCWoLohUPH+9RIYHzYF7P5g3/SflHQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfm0ym-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 06:08:55 +0000 (GMT)
Received: from pps.filterd (nalasppmta04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH68spL1884562;
	Tue, 17 Nov 2026 06:08:54 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-subashab-lv.qualcomm.com [10.81.24.15])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 6AH68rHd1884541
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 06:08:53 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 212624)
	id 7A9E1AC6; Mon, 16 Nov 2026 22:08:53 -0800 (PST)
From: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
To: sean.tranchetti@oss.qualcomm.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
        pabeni@redhat.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
Subject: [PATCH net v5 3/5] net: qualcomm: rmnet: Fix MTU underflow and clamp to the maximum packet size
Date: Mon, 16 Nov 2026 22:07:36 -0800
Message-Id: <20261117060737.2764327-4-subash.a.kasiviswanathan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afbef77 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=CJtKzH9IZ1lB9C82RxMA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNCBTYWx0ZWRfX667cAi5eraMx
 CLXkV8zefi/xHohshu8GcAj3Z8KxibuKAwn2soTFLM5M70sbKY3K8rcnViLvQ/vBAnymovStg7e
 hprf7Sj62GGSaxriuRRKC1SNMk7Gmrs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNCBTYWx0ZWRfXweS2Vbj+F0WJ
 7Jvq0/9goYiMREIj8cezOVGj/I8z4FNlGcahOSJz0DNw7KfMGALUgeB2rcv6+fOkUaQlFEhvNJG
 tHqtkq9XqTigGtZh75GJzTInTi66JFyGudiZFv4jpJSGo24Ol6Chns3ypW4NkqYCIIB+iLCiVFM
 +YhT4sxemCprZDptQ/Swozlc0jAbYgN2Z4/l+yy+OClfYUjN51XaZ46oE0WwYKaJYthU+Xm6gN7
 PnEx5ZawXv8KbH0PxzL02o5Q0tfDuBQDfJ6qgBNU8r4nyxXGK1yhN0PLyn81s+ELZ2S46UmFoAe
 fzp6yNv+A+ffzzPhs4XQXlqDxUyprtDZkqYAGa2QBSWNElVqUCLWHw/2yNajRcbJJAoj/lLWto4
 A9zmHqC//0Dx7KhHaRixma14O6t1O2756tENeTAL2c26+7CfiMERD4Pcfb5A4sKpebzdpsK1Un+
 c9ppPZaDagFq1qeZ8MQ==
X-Proofpoint-ORIG-GUID: 29BhefQLC3Q12r8wP-iawqIhJAPZH5WP
X-Proofpoint-GUID: 29BhefQLC3Q12r8wP-iawqIhJAPZH5WP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170024

The MTU helpers subtract the egress headroom from the real device MTU
using unsigned arithmetic. A real device MTU smaller than the headroom
underflows and results in a huge target MTU instead of an error.

Additionally, a real device with a jumbo MTU makes the creation of the
first rmnet device fail since the unclamped value exceeds
RMNET_MAX_PACKET_SIZE, while resizing an existing device clamps it.

Add a helper which computes the largest MTU usable on top of the real
device for a data format, rejects real device MTUs below the headroom
before doing any arithmetic and clamps the result to
RMNET_MAX_PACKET_SIZE. Use it for both new and existing devices and add
the same underflow check to the other helpers.

Fixes: b7f5eb6ba21b ("net: qualcomm: rmnet: Update rmnet device MTU based on real device")
Co-developed-by: Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
Signed-off-by: Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
Signed-off-by: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
---
 .../net/ethernet/qualcomm/rmnet/rmnet_vnd.c   | 58 +++++++++++++------
 1 file changed, 41 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
index 984c66bee863..2f3fefe58bce 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
@@ -80,6 +80,20 @@ static int rmnet_vnd_headroom(u32 data_format)
 	return headroom;
 }
 
+/* Largest MTU an rmnet device can use on top of real_dev for the given data
+ * format, or -EINVAL if real_dev cannot even fit the headers.
+ */
+static int rmnet_vnd_target_mtu(struct net_device *real_dev, u32 data_format)
+{
+	u32 headroom;
+
+	headroom = rmnet_vnd_headroom(data_format);
+	if (real_dev->mtu < headroom)
+		return -EINVAL;
+
+	return min_t(int, real_dev->mtu - headroom, RMNET_MAX_PACKET_SIZE);
+}
+
 static int rmnet_vnd_change_mtu_with_format(struct net_device *rmnet_dev,
 					    int new_mtu, u32 data_format)
 {
@@ -88,7 +102,8 @@ static int rmnet_vnd_change_mtu_with_format(struct net_device *rmnet_dev,
 
 	headroom = rmnet_vnd_headroom(data_format);
 
-	if (new_mtu < 0 || new_mtu > RMNET_MAX_PACKET_SIZE ||
+	if (priv->real_dev->mtu < headroom ||
+	    new_mtu < 0 || new_mtu > RMNET_MAX_PACKET_SIZE ||
 	    new_mtu > (priv->real_dev->mtu - headroom))
 		return -EINVAL;
 
@@ -322,7 +337,7 @@ int rmnet_vnd_newlink(u8 id, struct net_device *rmnet_dev,
 		      struct netlink_ext_ack *extack, u32 data_format)
 {
 	struct rmnet_priv *priv = netdev_priv(rmnet_dev);
-	u32 headroom;
+	int new_mtu;
 	int rc;
 
 	if (rmnet_get_endpoint(port, id)) {
@@ -336,11 +351,9 @@ int rmnet_vnd_newlink(u8 id, struct net_device *rmnet_dev,
 
 	priv->real_dev = real_dev;
 
-	headroom = rmnet_vnd_headroom(data_format);
-
-	if (rmnet_vnd_change_mtu_with_format(rmnet_dev,
-					     real_dev->mtu - headroom,
-					     data_format)) {
+	new_mtu = rmnet_vnd_target_mtu(real_dev, data_format);
+	if (new_mtu < 0 ||
+	    rmnet_vnd_change_mtu_with_format(rmnet_dev, new_mtu, data_format)) {
 		NL_SET_ERR_MSG_MOD(extack, "Invalid MTU on real dev");
 		return -EINVAL;
 	}
@@ -387,17 +400,17 @@ int rmnet_vnd_do_flow_control(struct net_device *rmnet_dev, int enable)
 	return 0;
 }
 
-int rmnet_vnd_validate_real_dev_mtu(struct net_device *real_dev)
+static int rmnet_vnd_validate_mtu(struct rmnet_port *port,
+				  struct net_device *real_dev, u32 data_format)
 {
 	struct hlist_node *tmp_ep;
 	struct rmnet_endpoint *ep;
-	struct rmnet_port *port;
 	unsigned long bkt_ep;
 	u32 headroom;
 
-	port = rmnet_get_port_rtnl(real_dev);
-
-	headroom = rmnet_vnd_headroom(READ_ONCE(port->data_format));
+	headroom = rmnet_vnd_headroom(data_format);
+	if (real_dev->mtu < headroom)
+		return -EINVAL;
 
 	hash_for_each_safe(port->muxed_ep, bkt_ep, tmp_ep, ep, hlnode) {
 		if (ep->egress_dev->mtu > (real_dev->mtu - headroom))
@@ -407,22 +420,33 @@ int rmnet_vnd_validate_real_dev_mtu(struct net_device *real_dev)
 	return 0;
 }
 
+int rmnet_vnd_validate_real_dev_mtu(struct net_device *real_dev)
+{
+	struct rmnet_port *port;
+
+	port = rmnet_get_port_rtnl(real_dev);
+
+	return rmnet_vnd_validate_mtu(port, real_dev,
+				      READ_ONCE(port->data_format));
+}
+
 int rmnet_vnd_update_dev_mtu(struct rmnet_port *port,
 			     struct net_device *real_dev)
 {
 	struct hlist_node *tmp_ep;
 	struct rmnet_endpoint *ep;
 	unsigned long bkt_ep;
-	u32 headroom;
+	int new_mtu;
 
-	headroom = rmnet_vnd_headroom(READ_ONCE(port->data_format));
+	new_mtu = rmnet_vnd_target_mtu(real_dev, READ_ONCE(port->data_format));
+	if (new_mtu < 0)
+		return new_mtu;
 
 	hash_for_each_safe(port->muxed_ep, bkt_ep, tmp_ep, ep, hlnode) {
-		if (ep->egress_dev->mtu <= (real_dev->mtu - headroom))
+		if (ep->egress_dev->mtu <= new_mtu)
 			continue;
 
-		if (rmnet_vnd_change_mtu(ep->egress_dev,
-					 real_dev->mtu - headroom))
+		if (rmnet_vnd_change_mtu(ep->egress_dev, new_mtu))
 			return -1;
 	}
 
-- 
2.34.1

