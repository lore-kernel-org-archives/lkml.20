Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913747;
	b=GDxc9ggClISQT/s3Cfb7SH0icdgkOGkHI989j1w06S0FGlpEs7zR31u9MSRZKDAPXMEJ
	 T+nSXNEiun/1798PAKA/IUVnSMZNy9tRnTfwBA6k2oKtQzjb6BYf64uvF/+9L7q/GNMfd
	 3lnK89GH5kSEUS/T9by9rCCBJWmdiqqnecJ24RaE189JwX9tdoIhuenlpS2SmMMmABetf
	 bLTIqZhRYtU0XCCj0NpnxptNrzNavLGpNQmQGCSzSSEMaVRaOJhdqur250hUDY2Jw3Jld
	 b4JDG4G3jao8rrG5+UQdOVSr8st4unQNf22xND0GaN+wHIHg/OHCU4rVdEcfSKAO/4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913747;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=a4SauZhnn74wjgYI6khUMMapX+qeM6sZyodz3gR1I0I=;
	b=VE0LV0Y+rVaIsAjA+zZ+6f7oAWtPQhcsJZjdT9+R59wY0bkDBh0Rla5JQgd6ghExMGFZ
	 3sgofRi4kt+M5UlXZIID2+lCpegt3kB1CwtFMF0i+VpzUq4DeqNh7oeEqtwJ192IAanLv
	 NGZZ4hR2YsoQcG/zTEom5B6064YvTJAc/+vIyP6wps9isqg20niA4kpx9GIoQu+mwljVD
	 yRMTo9xxZ+WZpho59yHMRPeCEOurxTz53Q5nwrLHGJexvAt7sYaOSnX4A1blzKoPKjwAz
	 Rz4vzefu419hECJmAZK9PhA43OJYq6jF6K5GZob3kdaEhwVw8mZ0eOoFr0br3tzUZWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HCJ6zLLu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B61606A31C;
	Tue, 17 Nov 2026 11:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B61606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HCJ6zLLu
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH9cLt31699357;
	Tue, 17 Nov 2026 11:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a4SauZhnn74
	wjgYI6khUMMapX+qeM6sZyodz3gR1I0I=; b=HCJ6zLLuCknYDhu2UE2CRpuDs+u
	soML57saoPa/r/OsOoBR0stLlT1yXDt6uvjg+P/a/k7F0cLLUZFS44XELZS2MX6D
	kSWKDHlZUQ69xLUI38DGvuNrJFPd8buprcWn4cwpEUSN4JmrOu1FgWdBJtjYxEa3
	7uTR6eFIB7G5JiB5pl+r+2iv4Toamw5L1fa4O50wn45HFC2GZMPRyXB3zl5/+Zc1
	l350fidWyho35VEkS+wabREWiLKKUdrx7aZPoyszNMSo7nLxJagfCZVIk2+6pgz5
	hJZB7kUiLLJvIlKM6j46bSn9SZp2M7ihm3lIVyR7AIQd0rr24iX72OUhUNw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0fjuhjmd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 11:08:56 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHB8sHh423705;
	Tue, 17 Nov 2026 11:08:54 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AHB8r6g423689
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 11:08:54 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id DDFF967D; Tue, 17 Nov 2026 16:38:52 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 3/3] dt-bindings: sound: qcom,sm8250: add talos-lyra-sndcard compatible
Date: Tue, 17 Nov 2026 16:38:48 +0530
Message-Id: <20261117110848.465407-4-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117110848.465407-1-karthik.s@oss.qualcomm.com>
References: <20261117110848.465407-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0NCBTYWx0ZWRfX/xBAyN8urH3K
 PtIKzY+hTaJOtYin/CBcukHBLsXkl7A53U6YO9yV7arif4A7rAKFLLzt9jNi/Y+taArYumzCBs6
 r25J5VoOO0QoEdYCL6Mip9KezT/KgQl46x+Z0Zov6+F+ZVzw6uW8Xmui5cY73stMzY1HWImqCwC
 tfN3vso4RNGsOaip+vW4aAFjknJ1wHPoff/JWWEH/p0rbh3hQUpvatBCjfSIixhNCpSvuz0VB+b
 pJnT5z210TVQjwK9f6eGmqdZeIrGmcInDKNQmyRaXs8gZgwOSfHA/SopfyyWwH43xAb6cSzfwwy
 jHNAVxUTkzeL+wi7sVrXIERd5ujEzeE3d+70KqU4u5WaQbw5ifVES2fSugzvnxvQIHuu9cIGdGx
 hRbusbvNxubptS8r0xuFp+7WyZX2fdowP2HiYbL7jNWDWk+hnHeVo/+Ns8NGmQYadbs46ZidtnY
 44hFCnHd6B9vNxxuA/g==
X-Authority-Analysis: v=2.4 cv=JfIpPkKV c=1 sm=1 tr=0 ts=6afc35c9 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=mITDVRH8rqty5lmV4ZcA:9
X-Proofpoint-ORIG-GUID: ptn2bzZc29Usht0WvtsBCjL6thvs9LiM
X-Proofpoint-GUID: ptn2bzZc29Usht0WvtsBCjL6thvs9LiM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0NCBTYWx0ZWRfX6BGqVOW4CQ1b
 l5d1LbOvWHEE5lD20SENGyIBAxKiAtqLypickb5WZ5ljhJnoCI3Of+qlJadww9VwBF8qNN1MJdC
 /g9U1JKq4yY1mIwpvTh/lOKV+qckedQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170044

Add the qcom,talos-lyra-sndcard compatible string to the
qcom,sm8250 sound bindings.

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index e2e3fc99e6d9..40b68b72f8f4 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -55,6 +55,7 @@ properties:
           - qcom,sdm845-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
+          - qcom,talos-lyra-sndcard
           - qcom,x1e80100-sndcard
           - thundercomm,qcs6490-rubikpi3-sndcard
 
-- 
2.34.1

