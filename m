Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791005;
	b=sbY3ysmuR2UxLvcM/nst1xzr898TizbD9w6QQuk7+3kCW62LKLhX+2NoWv/h3fdLol2t
	 k3Saqi8QXVmLUixKo+iW34JcPunFCyopu/8vu0xtCDpal3AeIBs/TjNsbl7H+ngVselA+
	 QQaUlSs982DGzZdioVSC9GuvKCUQH782d/7Uel9yU3C3Bl/JSRMdHH+s+6JJ37061qRAq
	 eRgz6Vz6JD0yQpUAkXyrQIXSC4ouQnj0+ff6DXUFWl0kCEZ3xum+rvXr9xzBsCfrpGNAZ
	 NSfRaFO6bcT29YAx7bj/VgmfprzPQugp9jKcaV3rzMX1NkDbLaXYsXhQbidtdU1IwLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791005;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EKNkHe58jkoDMKUXvbrXleOxHAGull+uYnWOftiZvcw=;
	b=dfGUAfKxM9kOIkWd5JciW+z6J2RUY/Mq53Gv25UaUlVnd5GoyY3ynZTo7vo9x7RpxYR4
	 KjPFH9fJM8Pp/jM0e1gTrV9AcZTZXpH0YfKpTIcOYpQJ3NaTx1fQR5L8nthgI/iiJEvWM
	 G1nqEfcnIUpzPy3d7Pjp13JzLS8clxwiZz8inJtJvqNQq7mBIP1JFBySYPsbvp+sLDzBH
	 8S+ofH7/x34GOUEutGuDXdZZSsMmQzSqjzttMhCHR5GHM0IAUoNI/wz5DC9l4zyHruRJI
	 xeUtYyTT3g3S4JHVWzHoZWP1idRaeXyhJ3dSJxWS6hh2v26kJ6yjOcbHCjLDKCybqmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZhDwHyDb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962B1606A31B;
	Wed,  4 Nov 2026 11:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 962B1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZhDwHyDb
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4B5VaO2600273;
	Wed, 4 Nov 2026 11:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EKNkHe58jko
	DMKUXvbrXleOxHAGull+uYnWOftiZvcw=; b=ZhDwHyDb59ye51cMKfhgCqe6+wA
	vn81Zch/4w86yG8DlxY6+ecGLHujRJiEi4jD7ez1yVHJLZp/7nHM4RVlPZw11gtn
	pIk+0pCv2pKS3Xgu54JuzVBdv0GRv/iumKaGSslMah6O6OazfZBejCdqFPLyhM+v
	gM3YJ4FbF5nGWO6wsWlWaSfnCOcrTYAEJAzhyhjIigyAkpZ/TZQ6BAkzZTeJq0Cf
	+EEoN9i8G04Cd6WThbswxsaI3nzh9gGzCTIu7qIcmbiA2ppM/C9hjkEFY+iSbHFH
	bF2KDQE3XiJ6IoVQXOudUGdP2+eUNgMXvYavB+UosAA/H47a2vSCX/neatw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pkt3x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 11:16:22 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BGKeb2675674;
	Wed, 4 Nov 2026 11:16:20 GMT
Received: from hu-devc-hyd-u24-a.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.147.246.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6A4BGJkQ2675660
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 11:16:19 +0000 (GMT)
Received: by hu-devc-hyd-u24-a.qualcomm.com (Postfix, from userid 429934)
	id AF973216CA; Wed,  4 Nov 2026 16:46:18 +0530 (+0530)
From: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: mukesh.savaliya@oss.qualcomm.com, alexandre.belloni@bootlin.com,
        Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, shubhrajyoti.datta@amd.com,
        shubhamsanjay.patil@amd.com, adrian.hunter@intel.com,
        manikanta.guntupalli@amd.com, linux-i3c@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
        wsa+renesas@sang-engineering.com, alok.a.tiwari@oracle.com
Cc: konrad.dybcio@oss.qualcomm.com, andersson@kernel.org,
        jyothi.seerapu@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, praveen.talari@oss.qualcomm.com
Subject: [PATCH v7 3/3] MAINTAINERS: Add maintainer for Qualcomm's I3C controller driver
Date: Wed,  4 Nov 2026 16:46:10 +0530
Message-ID: <20261104111610.3739095-3-mukesh.savaliya@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104111610.3739095-1-mukesh.savaliya@oss.qualcomm.com>
References: <20261104111610.3739095-1-mukesh.savaliya@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0NCBTYWx0ZWRfX4b3yMqPucaBU
 zZYp6XCB9uI4FA9Sy1o8QEuveGBv69jibgks4Ji0U8RpEmL4RkCl9DtLh9TTMo31AjsGHf6CL7V
 bg08X8KfrgVMgY13FlbfCl8trhCLy1o4gpbE3DeGshqDqSg6YBv/c3L1qpQsyK6YNDM8h6e6EfV
 GtdAiLctMBDXoN09Iv2Lxja2roz6K1+hnuowhMHk+mgW713OUa+4OZAUcniwXU75yTIy9ue8rrE
 +XNOwm0j2YIbzTWMAqFTK1lk4vMteKpuMCEyEXOrfcuPHVG5XwbkNsRQhBvAJH8i5A1GYjOHKSJ
 9CxCOei9E5V7+lE5H6OlRzUgPq1TnUX2E3G4CzeCkFE5VbpxOOkqyQgqLdFf2dXHxl4XTpznuJW
 os+61r2mBiGP27gOpLfGsBXlBoYNr6MraeFngqNppNij5UFPFpNPcYVm15YfnyB1RTDU8drQBl0
 nVlwXeqdrmZtL8YrgFA==
X-Proofpoint-GUID: DILj6uuxh-N5uuwGQY9ZQyPrOlCmBUCg
X-Proofpoint-ORIG-GUID: DILj6uuxh-N5uuwGQY9ZQyPrOlCmBUCg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0NCBTYWx0ZWRfXzrmUCp2GJfqP
 KlkLESRRfxgsRhFt7OnIsprOyX/R7WvdXdSNnFeKUjxAbodkEUSWgbX2WnHC5sJctRhQpMnZBJw
 QpcIRTwk+oA14mhITR6TrdLhiFrS+HY=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeb1406 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8
 a=LDBv8-xUAAAA:8 a=yC-0_ovQAAAA:8 a=tiOelxa7q5ZmzYUgxBwA:9
 a=1CNFftbPRP8L7MoqJWF3:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_03,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040044

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

