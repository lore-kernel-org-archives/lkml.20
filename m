Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223973;
	b=xDDjCq+AhtdoZHHXFn6FJHKTBb/KhEhNtHz0BFLIS8fdF9XpjLLEFqcMghzURs/5pcEF
	 cheEz8ywhwkx78ojOQkEz+HoGUOGnFTwDmALHx00ZuiQk3jL8lKe2/u+gx36y8kPSIFeB
	 sI9jF+CcpTSoL0vJs642Id0k+64BxF3A0i/4M2X2z40h1LtsMzeax1kiwAbQ+pTJ7/m33
	 cQPAipdtrG1W4V1rosS0GqWKOAwYSS+cReqjSEsgP7SRd1w26ICnkwC/GhZ1aOBFOu7rA
	 MpFH1P56KLPtDbVMRHCBDjNRIzw+EGI5h+EbOElC2OVKZhr9zSwHvJdDPwa7esHFkcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223973;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/rANUhb4Xkx6JtKbuxAVHCjVLfvsKmA/04qLJNQgDVM=;
	b=nHANrMQFP9Tew56HZsjdkdnKWVn+rdQdu01DMYi1unpPzdT5Wc3ciNLwpawulapmfgE+
	 nVtgVgDx9hw2jzvSDrSxFQo4JuhBJ3qeGTHQJplF4/lFazIHdbMMcU2dmxRJKiFHNiazo
	 Pnoo8hO8XxKe45my1Cl9qHTXHsE71gUo5lb0rXd6kczrtm8/eSMKzDPLh9tGbu8OIQjQ0
	 OOymCitX29V2JlEC57nKkKcLjIxUeVPy3y3prk7XoaTxbj94xaA8anb0IXhc5CIFhElGy
	 N9fO3YTW1ccbsGhANS93I4ep8TATKEuPqgYg6GH/OnY81isFfWF51+ZJzcP/i4pioqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nGtEMaAU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QoVI5T+j;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA6A60A2626
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CA6A60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nGtEMaAU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QoVI5T+j
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SInp8Z1090705
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/rANUhb4Xkx
	6JtKbuxAVHCjVLfvsKmA/04qLJNQgDVM=; b=nGtEMaAUMnY8ZfsjlaZ2+w1jLt7
	L9Rx1iOw7xpmjdJiDoBju41uzaOx5ALU3siJwlPSCuyIc/BV7fUSjBDE58hEGYqQ
	d49m0JdYRqoEjx6QMroaCia2VPcjaXA5XxjpUTYTOhc0+a3GuJLddb+n0WhrTUxc
	qdV5BwU9Zpojo/mn8d82l9AedbW8G7iqdy6+uRoURISPJwZdQgXYtepy4NJeiSDA
	qFbuingji5YeNLrTVGgMhu9VI8Pv6jq21WpQAGEbXfCadbLLQAOG9/jLMS9z+loR
	8sewKtB9WXhjcX1aIofMer9wkjyYgArS/DG/AX9j2MGC5SyiPVFM653jkLg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb28y0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:46:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c7a26f892so31069856d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793223972; x=1793828772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rANUhb4Xkx6JtKbuxAVHCjVLfvsKmA/04qLJNQgDVM=;
        b=QoVI5T+jRH+ZxQ1uTqZEQixINE2mYFZ8zqc+6qOmLHt8uvaDwGNWRu7pFYLv5/Z2kK
         flSivR4TkoqlVosdQl5xAwddMTBqst5BoOTjxT2MZDYV1xfQSv3KQ4wRgvOrKziEMkAP
         RcUGGmeJAdKTVlWeDtZEeOtST4YRKzADMFTgA1JiOG77swoJHfdlUsammjLCMOwoUc2M
         6+j2aNBdA6Z06ScOMRD7KVWbCRfAfAGvYEYzp/O7ByPohQ6HOXDIR+01sNaVajn4WzhM
         fT8pVwEGDmok2pTz0fIA6V+CW41mas7wsXwkbUYXVPvubZjNbVHXCXQ+UYSVenk/YcRu
         g/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793223972; x=1793828772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/rANUhb4Xkx6JtKbuxAVHCjVLfvsKmA/04qLJNQgDVM=;
        b=DuGYvYbeALjFhyXMDyL4+27UqPh5g5YxiP4eLgmT/1Al2kV4Qdv5EMNwEgGtx43fk5
         YKKIu4OuWd1AholUVE44n7jQlImm+bLKeVeDQmyh88j1mKtrZSCXnUBzjXrCLkC8ToVq
         /S+Y2eKM9KiaBMaak6p5D/0GiJWl1Sokk+AJyPktDPtlSUpDPJ6KcFuM85mkQahKiQrh
         L4BQZfTUORreHKWaJz6jUdWUKxoIgXd2lFXdXE9mbY3p0Z4b4sCFPdzRcS4TFZHBrE/Y
         vOchYMFiVNp+mj9uG5S0/bJ1EjZLpZ3BCGFbcKRZX3XLWpeuwTlOZ+3K6PQ60jGSwABC
         QG5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwrscvD1serYwmX2jdp2I6GDyEWob8ZlyeavYlrUuEGw5Wp23F9kYMQkd6MmQcfTgimCsw9toaMop1HEGI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+vtyGxa7f+Yg16Qt2IWIg37Q2mJ5AeAZTBwZe97zTx2JgMPRW
	AnbZHcMIA5BKH6hHKmXXeK2E7jhZJJrqNTZTBagm45yhCCG7eVNCqm3AWViMHH2oZ8MMxvLT01l
	umS+LHxOiisS2rwgdwJYPtIwNFFjryf4Rln4qeAs+g5/yYhTJE3082aaWiceN8TVpHug=
X-Gm-Gg: AYBFou0jEvYHBS/yx2oM/LNVTISSQh7EfLXQ2TTjFEcmVMHXmgkHiFQDO6DhaFv3mGh
	902VRrSsrNGBgw8inlBWp8TUhrzsyyeHzLdg/Gz0yC2kXxaIqxzSSbCXC6YyUldaN4D7Vdeu8Ak
	0KZsimprT/p/mKzUVWr4QoW4ZJ3eK/UFHval5OUs69vXDddr6ewf8WcKdYExJj5FzdvymPdPG9A
	nYpSwBsnimvDlqmFgygWFCR2lIrP22FBCYBRgVDmzS+9sBfAbB3PKKfOqlyRCo8bJ2C1ZJvjX+P
	v1wXsA842sC6Ys15m07fOZ7RhvuwD+M4zd4FmndGdj3leOx7zO/WCyV7MaGMlJ+OLEnKe3Tjc8P
	jz+7DALydKaWNFt8ODzIJXGrLQqNouzqCVmrLbHPzjMfftqa+L5r3FYALOf9vgA==
X-Received: by 2002:a05:620a:40c2:b0:940:f224:5a57 with SMTP id af79cd13be357-94408ca17d2mr582262485a.62.1793223971624;
        Wed, 28 Oct 2026 14:46:11 -0700 (PDT)
X-Received: by 2002:a05:620a:40c2:b0:940:f224:5a57 with SMTP id af79cd13be357-94408ca17d2mr582259185a.62.1793223971096;
        Wed, 28 Oct 2026 14:46:11 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fead817sm18642395e9.12.2026.10.28.14.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:46:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: monaco-arduino-monza: Add label to sound node
Date: Wed, 28 Oct 2026 21:45:51 +0000
Message-ID: <20261028214551.108424-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028214551.108424-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261028214551.108424-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae26d24 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=cphMBCBa6KgUlh22nVoA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: -0GQ-9qqd-s6hFWHI2o98N-EcNRs8IbV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfX+g1yVCZBuM3N
 tPvRqmuI2o/TvFjSoJcVndjsXkOMPzANaQXPL20dzuRrLwqiK6lqQjjUei478Q8RzemzOJLFXE1
 g+bp7vhAmrNEGM+BBSWkyDttYUJFRqw=
X-Proofpoint-GUID: -0GQ-9qqd-s6hFWHI2o98N-EcNRs8IbV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfX6iVbCxSd5fKT
 554JQVwOlqoQE85SYjaslUOGEN4yo1p2OlALlRaGMYpeIUTRaqjy8wk3GmwVnbTQ1Udk/8YEx5Z
 UTuBMNy3rw29+FRu8OCdOB2kCpHeFnAHwER//8fkT7tHmWn0Vh+Hzo7o+q+gzqQEMqa+P6Tw9dS
 1Q2mHwTOvwppMLWfGGmJvWmv951j3m5rigIXE4+0mV99IkxbLpAqyoCkEoX3FMX/wsDf+knlWYO
 BLUKzxjMhhUihS+Md6nZL5LM0jFQvNULIPzrCjYMR4PP1wzJHTlKlRlMLyAznjOFFQD4ozEM2kJ
 Hg3R84tXyYeqz2rw5JSTRbmR6nxm+0p6EcgJjcxyUNLbkBxdUxi1nxrv6zgpFRxPX3VNnm48TY1
 5Qhsq1szF4p2qhRFkBdHXMNTmcrjTzGdbExr9dZms3rqxWZNiRuTHojEfvyqwnoqXR0Npw6GHcz
 gmaa5SqMliLcTHU1+Kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280086

Add a label to the sound node to allow DT overlays to reference and
extend it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 2fa652f3ae58..9ac2a04b302d 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -63,7 +63,7 @@ hdmi_connector_in: endpoint {
 		};
 	};
 
-	sound {
+	sound: sound {
 		compatible = "qcom,qcs8275-sndcard";
 		model = "arduino-monza";
 		audio-routing = "IN12",  "Headset Mic12",
-- 
2.53.0

