Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895744;
	b=NE3M2wNVPKGhMxq8zFl4XjK2B0/vU2afE4diyOEyF29KUSitquoA8lm1jtjnEy2WFofc
	 Ds9NIegZ1tz2mv5xe7ioCtZHr+Vo/WHKegfri5lNlSRRSWKljPD6xhfE8U+93qUDbQuis
	 V+z37uk2ywVO+ICrbcfESLgWb9JeDYcKyc9ooBL6yi8Qqq4r0dZ8wlsGpORPKPOf0Xj6e
	 j1iIaSVBM2usb4TDkyo129NSoznoa37EjlwxSnrf9Uz7E6PyVANaiNGOOQjicDDx2IbyG
	 VpuITHnKCbHi+Xw2WMohsXJXUV3VIFB8S28k7lI9is5AWgW4gszo+eC8pW03EHE34/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895744;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lBKnGQaS55f4b479mEOZzayVum6Tb0iDTpsRylt6wWQ=;
	b=owqmsv2PpKruqxM5RXNaibC7s+KMhQdPdEAk09WiR236/2a6Q1tthHo/MdgMbpH6++HW
	 HO2sugWRTBtXKIqPtEJT1JHSZQXnTZkXjQehoyDQjLoVO69KYJWBD3tDhFmEQzIHlJ8OP
	 +LygQTQGYOLV96Pfk6c2czW+98HJuTCQxaHwMGQAEdFbSigb1kqYU0TLNkMY+G+6RmBoV
	 dl2yzAx2QaZQZamfQ3bKsvowDNbdlFL6D73IYcszEdNLWwXJVM7CuOettF/xAxmx09ag1
	 NmN2H0nJQICF4m1DaoVaz5yU7jdo6NvWm9B/lEgFZu29hIG1617oywYipnZiqG9CSVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5pXOle0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EBA606A899;
	Tue, 17 Nov 2026 06:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93EBA606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5pXOle0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aHUM1800725;
	Tue, 17 Nov 2026 06:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lBKnGQaS55f
	4b479mEOZzayVum6Tb0iDTpsRylt6wWQ=; b=A5pXOle0ehGFMIM0Z6ETWY6nq5f
	VC5Q9X3lrB0k/P2Arsofri4trbfW9grOEUtMr/D095/SvIaQmCsZ510OtmF4mBLs
	IZalANMEvhW0ttxYXphveStOq4XtPvKDJi1Lq60vRfeMFOJaX/5J67zMS8xZpVnE
	MsLl6k7I3BHvMRzADA9ji3P4pILe/+fvJcGMhkUOqdwTKjSGjMNVlX7bpM8S2rb0
	OMuRpWn7V2FldB6XgC0QDCT3mktpIYL+lW7/fLBrGZIeXn2rxOI7S+m9M5KUs5D8
	mpZQmRmVuW1C25xdtlVMafgM36A/40A1IbL3F2KDuXJUXTyq+uuEfjwQhOQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y3c18-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 06:08:56 +0000 (GMT)
Received: from pps.filterd (nalasppmta05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH68uZX1815585;
	Tue, 17 Nov 2026 06:08:56 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-subashab-lv.qualcomm.com [10.81.24.15])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 6AH68tn21815573
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 06:08:55 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 212624)
	id 43C4EAC6; Mon, 16 Nov 2026 22:08:55 -0800 (PST)
From: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
To: sean.tranchetti@oss.qualcomm.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
        pabeni@redhat.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
Subject: [PATCH net v5 5/5] net: qualcomm: rmnet: Resize endpoints with dev_set_mtu() and restore on failure
Date: Mon, 16 Nov 2026 22:07:38 -0800
Message-Id: <20261117060737.2764327-6-subash.a.kasiviswanathan@oss.qualcomm.com>
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
X-Proofpoint-GUID: buqTWs8W218_Ts1D-yGaqsgKIiBhxp7M
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afbef78 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=neem1WTNS2RG_dxUvocA:9
X-Proofpoint-ORIG-GUID: buqTWs8W218_Ts1D-yGaqsgKIiBhxp7M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNCBTYWx0ZWRfXwdUi0l1ZkvCX
 Tu97H+ZS1D6K3aLw3kJRdHqIYX9X/Vu28GGUP9mHXccYII595fh/7MMK6JP1Orn1E25En+nGB3w
 6Z6FaOH+QPK7Cujtq1l1kI9srV0w5pk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNCBTYWx0ZWRfX6XnoOAgaB7om
 x0jL6bxI9LjtcDCXsstk0DfFpPnFIYzmYjuqMAPIGzAHIul5KM/Y4SjN9b6vtKnAtxQSj93b2Ik
 6JKpLOkrJ1gE1zBv6RnWgPURBkjVrd2YhatXun5ZNzVVZqx+uglfFWiUeIThsJizbKrQtMf6Qgz
 yJ06rx9xmoKz+yNzDaPZwJF3zVibjLhhOo9BMGJr1JKo/0WdT562Q5tAVZceuhqHW5lBIGyMKao
 C+WfsWz0oxA6hQViX7jDk2Z07sl/FCoR6HRvA6bOiuQvovRru2iDa69O9DpGrE4fRxxcDs7WNpK
 rqBONPlybHKnVF2Ksq3044hsh9X0x0vZart4SlWoMT7lhEhFW2sOG8QjYL0t83yng4vePWBB+iX
 3SgA4eskXtK7FAiVIxzbZs+CZPsmNl7yzKi3siFn793BeBdhaTSseIju0Lk+LgT0O+IsICFTukx
 bh8bA/nE+jOaanoWqHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170024

When the real device MTU or the data format requires a smaller MTU,
existing endpoints are shrunk by writing dev->mtu directly. No MTU
notifiers run and userspace gets no link notification.

Resize the endpoints with dev_set_mtu() so that the normal notifiers
and link notifications are delivered. If resizing an endpoint fails,
restore the endpoints which were already resized, ignoring any errors
from the restore, so that a failed request does not leave some of them
shrunk. The data format is not yet published while the endpoints are
resized, so the restore is validated against the format the endpoints
were sized for. The error from the failing dev_set_mtu() call is
returned to the caller.

Fixes: b7f5eb6ba21b ("net: qualcomm: rmnet: Update rmnet device MTU based on real device")
Co-developed-by: Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
Signed-off-by: Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
Signed-off-by: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
---
 .../ethernet/qualcomm/rmnet/rmnet_config.h    |  1 +
 .../net/ethernet/qualcomm/rmnet/rmnet_vnd.c   | 30 +++++++++++++++----
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.h b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.h
index 5adda0323dda..47b8db3206b9 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.h
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.h
@@ -19,6 +19,7 @@ struct rmnet_endpoint {
 	struct net_device *egress_dev;
 	struct hlist_node hlnode;
 	struct rcu_head rcu;
+	int saved_mtu;
 };
 
 struct rmnet_egress_agg_params {
diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
index 8bf87c5ecb43..dce436e4c630 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
@@ -433,24 +433,42 @@ int rmnet_vnd_validate_real_dev_mtu(struct net_device *real_dev)
 int rmnet_vnd_update_dev_mtu(struct rmnet_port *port,
 			     struct net_device *real_dev, u32 data_format)
 {
+	struct rmnet_endpoint *fail_ep = NULL;
 	struct hlist_node *tmp_ep;
 	struct rmnet_endpoint *ep;
 	unsigned long bkt_ep;
 	int new_mtu;
-	int err;
+	int err = 0;
 
 	new_mtu = rmnet_vnd_target_mtu(real_dev, data_format);
 	if (new_mtu < 0)
 		return new_mtu;
 
 	hash_for_each_safe(port->muxed_ep, bkt_ep, tmp_ep, ep, hlnode) {
-		if (ep->egress_dev->mtu <= new_mtu)
+		ep->saved_mtu = ep->egress_dev->mtu;
+		if (ep->saved_mtu <= new_mtu)
 			continue;
 
-		err = rmnet_vnd_change_mtu(ep->egress_dev, new_mtu);
-		if (err)
-			return err;
+		err = dev_set_mtu(ep->egress_dev, new_mtu);
+		if (err) {
+			fail_ep = ep;
+			break;
+		}
 	}
 
-	return 0;
+	if (!err)
+		return 0;
+
+	/* Restore the endpoints which were already resized. Failures here
+	 * are ignored since the original error is the one to report.
+	 */
+	hash_for_each_safe(port->muxed_ep, bkt_ep, tmp_ep, ep, hlnode) {
+		if (ep == fail_ep)
+			break;
+
+		if (ep->egress_dev->mtu != ep->saved_mtu)
+			dev_set_mtu(ep->egress_dev, ep->saved_mtu);
+	}
+
+	return err;
 }
-- 
2.34.1

