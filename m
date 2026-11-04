Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794983;
	b=a4tG6D61qCwk8Knx/DdqjugSUkmm5gGjQ1GBkGtzdNwmTXazvZvH5u6vY+0yPxpYpfRU
	 ov3xSTXyNPU4VTRE3igZOU3V4oewtPA7Ohxdoboyhjr1jtnA8dX3NuwofPzUVnKecky67
	 RogICHEKohGM6xC52ykebF3llfb6wxpw1c5bUChEDYk15+y8LBqX5+7S2syg+pP3M8mRq
	 LDRhUIR6mestDp11PPdsEpRBLZN3bkwf4bUa1lixJb4ORqKfiWObp/NJzSJXGG/VJw9qe
	 TAs7CViupnP07HZO0n64hO8nMOyxx757ekT8wjiv5m9SRlr9KibsnFXwpXNjTbMQWlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794983;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EKNkHe58jkoDMKUXvbrXleOxHAGull+uYnWOftiZvcw=;
	b=foFF4Rzwt3svFDDuM3lOsaWt88eH4nCclmIGwsSquRCfU7c4W2UjyBzCbu3GXPirbWZC
	 1ZgquZNF2QGNLShTent+qc9xt+1uq4aWFQVRCte/gRqambv4ntvOQuMCqugV2CnsuOQRj
	 KP9sYedxNH+9Jgv1m8ZOkR1GbqS3pRNNnr04mHuJZ+FjjrAs5HTH4bwixIY2jahf+1EJG
	 rrXmF3bBC8y1JmsmCrHOpX+ZaO/P+7H8Bilchw9g8swIUKpv4rekfeZDrhnQJyNG2cvix
	 HTGhfZx8z3Vl2vK/U028Zpv3fOCXaoAWFhvBG4jnkqjmaXaow2DmuXg3twfDK32KjNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bTOu/qIa";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534CA606A326;
	Wed,  4 Nov 2026 12:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 534CA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bTOu/qIa
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Bo0nJ1387564;
	Wed, 4 Nov 2026 12:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EKNkHe58jko
	DMKUXvbrXleOxHAGull+uYnWOftiZvcw=; b=bTOu/qIaHiwRUPwcYLu3kMFsi6e
	dvh5068Wsb5x+mxehbimCBvuVD2erLUFQwZWAPLDXQbOyOLJkEImK7uFpaqhQZgw
	T3FcSzeDqIIuEBYDyAc1t0BcO2C7bGQ5Z1Jdx54VJvtC0JIiIKsjt4x/g0uSYpv0
	KViyCwN+zAdyQcj3waVFFgPJ9HY54sWb6cCljpg1SfoAvVdosZ0FpoS9uLfz+3RJ
	YjgNYtCjy3/gm9ShAlQiqz45p1n9R0gsG+V3IDwQvbfcWQjpCnru3WcLBDjJOKxc
	CSsVcwiq76c1kCuFEySceIjDx3fw20r68ijrNNdYCiAEkvaETsN5QTJnKbg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsga1va-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 12:22:45 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4CM69a2768594;
	Wed, 4 Nov 2026 12:22:06 GMT
Received: from hu-devc-hyd-u24-a.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.147.246.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6A4CM5442768581
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 12:22:06 +0000 (GMT)
Received: by hu-devc-hyd-u24-a.qualcomm.com (Postfix, from userid 429934)
	id 1107E21577; Wed,  4 Nov 2026 17:52:05 +0530 (+0530)
From: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: mukesh.savaliya@oss.qualcomm.com, alexandre.belloni@bootlin.com,
        Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, shubhrajyoti.datta@amd.com,
        shubhamsanjay.patil@amd.com, adrian.hunter@intel.com,
        manikanta.guntupalli@amd.com, linux-i3c@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
        wsa+renesas@sang-engineering.com
Cc: konrad.dybcio@oss.qualcomm.com, andersson@kernel.org,
        jyothi.seerapu@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, praveen.talari@oss.qualcomm.com
Subject: [PATCH v7 3/3] MAINTAINERS: Add maintainer for Qualcomm's I3C controller driver
Date: Wed,  4 Nov 2026 17:51:55 +0530
Message-ID: <20261104122155.3789346-4-mukesh.savaliya@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104122155.3789346-1-mukesh.savaliya@oss.qualcomm.com>
References: <20261104122155.3789346-1-mukesh.savaliya@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeb2395 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8
 a=LDBv8-xUAAAA:8 a=yC-0_ovQAAAA:8 a=tiOelxa7q5ZmzYUgxBwA:9
 a=1CNFftbPRP8L7MoqJWF3:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-ORIG-GUID: M8I7Q6Ndt_1x_JMcYBE7YbHk27NQ1S3o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX0caCxxONcvUE
 XIgKKkBBm+pEbH+reor4RuKpDhpWz/hYpBa0QnqSf0LBBGKCEcktb2suKILT8Lvp2tOv+sCBapc
 zDB6kt6WO2hJWWBczLnS3UdlyVL4FHg/j866Vju7WzY4rthAbKkhpZr7yt+fbSGTKlWD/ixqLBQ
 ayXOrRxkdLj2Xb6TTF+GU1fjdqtAiXfImEhVI3Hq7XkLFdxWR0UBlfl47ie1hd5gGKp+16F9iH/
 wjWGsquvHsLsZhQEsfmq0qkTzZsvsKD0cMqAfUcwWsv0R5VLkVUPbqxVy13BrcbAJ53CMid8/N/
 14gDsc3wy6IARPF/S+yl0YKJTVeRVB2xNhe8QaOsVe6Y37AyTp4drDiDpVCUAqgIyf9v0gvghO8
 J1tZ1434rvdMTspUy9a/nD5yf7KPuSe/FkDe4DEnzd8bfHsQgIdgcNYS4ho63R0eVFdBgf/cEmg
 qwDVLqBAkuRk2aPWZBA==
X-Proofpoint-GUID: M8I7Q6Ndt_1x_JMcYBE7YbHk27NQ1S3o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX14fEbKToTCAC
 QtWl37EHCqpU1na/NciQnkvI7rFK3AGsQhcOhX3vSLIPYBTnLaxiKCCVyEuGdOir62d3ovsMJZc
 uwCdJTQXfbCUL09caKICb0DbTQ/KhXo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040049

Add a new entry for the I3C QCOM GENI driver to the MAINTAINERS file.
This entry includes the maintainer's name and contact information,
ensuring proper maintainership and communication for the new driver.

Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46c416cadacd..43c5730dd007 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12637,6 +12637,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
 F:	drivers/i3c/master/i3c-master-cdns.c
 
+I3C DRIVER FOR QUALCOMM GENI CONTROLLER IP
+M:	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
+L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
+F:	drivers/i3c/master/i3c-qcom-geni.c
+
 I3C DRIVER FOR RENESAS
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 M:	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
-- 
2.43.0

