Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895743;
	b=NcqSv+tGH3QS9PDrZcENM7TD/sLWyCS9vy+N12FX6L4uRBnn0m0bZudSLc24/I5I5g2z
	 ptNgHGgfaOGttTqJsO4gTuPN7WtATIsEvWhxEgfMmHQWBucE3JlNw1k1zp9Sgtx9ogE43
	 5nHuwJ8ng0Co6vtXYvEYc5VJ7MxqCwkS7vPcL+qJrFM1ZlfQKmY16+HyzHR9rDXDBTnuU
	 bka8/cMUmvv+CIXTQoRVGCKVmgLBc7c5iw3gj/jVSTTGInzJ8hco8sXFVerBnAXd5koCz
	 zswvDJPaAHh9t4D7RUqlpp/3nBtfFURS1/1fLXSOns+/qZ5ZRTPlwVmbFtbyA6BOkDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895743;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hsTRLBmtpbZOCBfIiR7TlwejdQd/X/WdkM8lYKfEiuQ=;
	b=AZ5OZgL8CGYnyif3dgGsQd+YKwyAwAxuZ6ei/UY+pOwdcjMzHyKLborrx0+JYpHUzvdE
	 P06RxJzvVVnF4tNRrQPkx/WfWeiaNYcFhZF7RD5t5prLvqXglqj+MPUX7u6E8cr1q0y4C
	 an8pMlQhhdSubigCTLo8hAuoeNgRcMEPAmNl3kzLCQb6xfa6staKVE+wYN81Ow5byDlwQ
	 JEVxLiKtbD9kEBg0u65JH31SQRl/a3vecCfB1HMrpSH7/gfzlts6x4YF7xTpQ1XFi9qz8
	 HFyQdg+ImMJltkeYnAj4AzjQZKPrTKdCLcwtbs6hZQ9lheGCQtorZBJqm5Tft30qtxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DK37VT+0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B55606A32F;
	Tue, 17 Nov 2026 06:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B55606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DK37VT+0
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aQus844338;
	Tue, 17 Nov 2026 06:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hsTRLBmtpbZ
	OCBfIiR7TlwejdQd/X/WdkM8lYKfEiuQ=; b=DK37VT+0D9mmBY4+hFuMeNkvmuI
	ouMQE+OFXr8wUgPLyeifFzTkFVvA6pEX4wESaZmVRW9jZkd3rO7iC+R3UnA8teLG
	qu77p4T/ImJiqEOLthUeDDZ6RdqXo88MY7D8rCvKJLpDWiCMVmMliISgbobnnEgb
	vVBFmnUA0qBnT6HD/Uhz77LmDhC+i4EdV133JDfGot1h5yjkvOb6XJvDTwKODKLE
	kuB4UBOGA6SgVTlu3VtOBuqjW8hIsoJ/KwGMXdp+aEBq4xI1+Gb5MtidPjn83uAm
	8R6lJyr9AQjzEUFTbHNc9cPPhTe1gpcKGE54/3U+GvZ7hs08prOk1dqf61w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h11yv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 06:08:53 +0000 (GMT)
Received: from pps.filterd (nalasppmta03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH66nZf4106987;
	Tue, 17 Nov 2026 06:08:52 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-subashab-lv.qualcomm.com [10.81.24.15])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 6AH68poG4110085
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 06:08:51 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 212624)
	id 7E968AC6; Mon, 16 Nov 2026 22:08:51 -0800 (PST)
From: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
To: sean.tranchetti@oss.qualcomm.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
        pabeni@redhat.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
Subject: [PATCH net v5 1/5] net: qualcomm: rmnet: Account for V5 checksum header in headroom
Date: Mon, 16 Nov 2026 22:07:34 -0800
Message-Id: <20261117060737.2764327-2-subash.a.kasiviswanathan@oss.qualcomm.com>
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
X-Proofpoint-GUID: YRSUssQ6YRlbqitZC-to0Ql_s_IM3YoY
X-Proofpoint-ORIG-GUID: YRSUssQ6YRlbqitZC-to0Ql_s_IM3YoY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNCBTYWx0ZWRfX7u7EiLS8nueR
 5DXz+dinphHsyGdY6u8gn5Bej1hO/e1rNbV371843vp9ln3JpvrRsvB1aF8+RRSn/RFlMO3kFcl
 jy18lkgZ7U6QrY29Osiwz02VcMApw713kfn5xXpatIfKH2RmPqV/iRl+HD9Jgx25ffUhdsRgCOv
 //4OCASYZ3Z2lXmXuAJbOKmuZEncTFbg1N5kIZa0CGhrgkDl8Y6MjdaVbVNVmSMm134k7j82hnH
 421jVCzxJ5GE9nWv3E9LOs2hQQGUwc6c6P8znhiV0i6Donb8BcB2fsinLg80wox/gxSSgyI0wpz
 UK1gZub8Ct35b3AiJpCVj3WIkVZicAyFc67iyfrrr/pPHjwoZBiwvugxdicNsudoCYQGcgQHV+7
 KOWQ14OR4ojtuL6FuCUq3XBjcj3nC52zb3L2f/6J3mKnjK20tdHki2fqjUtS1sBe2AFBE6CKmXB
 3xWUPMxhftXx8o2qfAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNCBTYWx0ZWRfXx1W/Vu5ZR/sy
 0Eg2Du9F7nXJvlw/LTrNhzzUkZ2kmlkE4yvjC2+ZLHiRzzTc/3bM4ZY+exdbqZzebtho3lsRn1s
 R39Sf8T8xRMbZi7kO1YqpPWJB4rLuxA=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afbef75 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=S7Ml1HACSiscvrRVoNkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170024

rmnet_vnd_headroom() only reserves space for the V4 egress checksum
header. A device using V5 checksum offload therefore gets an MTU which
is too large for the real device once the V5 header is added on egress.

Include the V5 checksum header in the headroom calculation when the V5
egress checksum flag is set.

Fixes: b6e5d27e32ef ("net: ethernet: rmnet: Add support for MAPv5 egress packets")
Co-developed-by: Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
Signed-off-by: Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
Signed-off-by: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
index 5f921cddf82b..fd10aa418be7 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
@@ -74,6 +74,8 @@ static int rmnet_vnd_headroom(struct rmnet_port *port)
 
 	if (port->data_format & RMNET_FLAGS_EGRESS_MAP_CKSUMV4)
 		headroom += sizeof(struct rmnet_map_ul_csum_header);
+	else if (port->data_format & RMNET_FLAGS_EGRESS_MAP_CKSUMV5)
+		headroom += sizeof(struct rmnet_map_v5_csum_header);
 
 	return headroom;
 }
-- 
2.34.1

