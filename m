Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007689;
	b=qhNVpsteX3DkdGLE0HizXYZfB15LFt8i9EG1LIdm3IpOLDUBNLzEYYgiIMHKokJ6i58j
	 XmoXA2T9W+YC5E6+9bX9wGdYN60bLUGJZPZvstaWaa9shUaqre682qM1IcgxAUgYWMFyb
	 yiWUWZ/D5rfqqwjSNG+X42AWw7dPkJvk13dAp2MxNDBISZmooKK3thoNcq71L1qHooBdg
	 4oTT2+UMponls6mERrqRcRLllIFew+dgpCygKl5iXDgT3OvVWPPQfKWfwMpWY0FfCaE+l
	 ZSfEdrQ2Cx1aB1olaDL3RLLLkKDQYZTIxXC1olbMQe5ZgZNAr4XrYneRLOXo+YL/36w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007689;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+e6aO/DBAk3mai+cjuiy6QYgP4Tjql273PkqknjpX/0=;
	b=ACfJZfZ7yoACiZSBMd9EZ88Sh1rBhMYkoRo6AvrbBS1bKDM8zC2TEpApIdOH1wxpjbiI
	 lcvhzsUOQPOUZ9QvZTFjOZkklt3bT0TM7tdZ0RGwJ2M2e8ZUwN1M6IhfzF/rhPRIonVk8
	 PVj1lrA6nV4zczrrH/a2gH6pELWpIXmYnR8SCg/riS6AJz5GU50Xix9ZldMDok1qLUHWT
	 ocTDcjMp76wWN+rUgFERbj1wZL5uV0XFkJTLlGRqzpV38eWFT3Mj2tbyGCQpv6u2Jesn4
	 D9bkLNLfqn9ZBxPkzxbQlZqQ9RB+oNt3dqGN8y7s2z7xhHmCV+oeNiOzD0liWgfruPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLKlw5fi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R9dO2XQi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CDD606A337
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0CDD606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLKlw5fi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R9dO2XQi
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4araT1181776
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+e6aO/DBAk3mai+cjuiy6QYgP4Tjql273Pk
	qknjpX/0=; b=TLKlw5fiVJflwNmMuvHHaDIZeW8FtofXsBWrpqFH9qwQUABl0Gh
	AU8r42ModYcPvZ1Buvvv1tM8hkcU/TZUudtyN/z4janCRPTeDx3jZWmRMxeivMEl
	BE+uXHghim1wLP6HMr3JHZExVCJ5XnNnAlf9pD1qnEDXNyaW+q0NSsMVxvM0S8RI
	yWtqwsSd3Yd75Tf34xG4eqEsZX80uZkQhe1YC9MdQ3hdyoj0fVth3MvB11Q5hKkw
	S4mHKV8sJVEepA3ldZKeg7bC3gU2P1oNJIWYboCOtE4YEKDIgMSKcAuJzH6cvjUW
	gKydjrlhBA9OBytHAt6Qx0F2eP0irtJaYfA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27wrjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:41:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad91787a1aso1982620a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007687; x=1793612487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+e6aO/DBAk3mai+cjuiy6QYgP4Tjql273PkqknjpX/0=;
        b=R9dO2XQiy+A147qxfdDJiFwy0AG3bkz7yuv8uFlh4peSEShvbsb17UQiSqgylBzDSQ
         +etVjpnfuV9YLO4i7JubQtgg6mJm5i5MBvflXt1/3maiNYkVnYn7e+gUzoKccgNRb8Xq
         4qiK/EcYskwQs5WQ3aXRMeAbwVCRHtyBF8B4NxppcqPnBi8my7kmdPdaagGeo8FqXEY3
         XwziaRlFSRTa91h0eEpIzVVP7KK6mBBUvHa6kt5XqTwe3FoxCoGQSCisUkOouCmSc0Jh
         xqPHsexK1qutxlX29Dx3yr3VwdtR7rP53cEyjT7q1Mmd0HKDJ7ghfcUfKkcT1Dw92Nh3
         NURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007687; x=1793612487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+e6aO/DBAk3mai+cjuiy6QYgP4Tjql273PkqknjpX/0=;
        b=yu96h61vlW3gCGxHj36B0IRPYVLqAw5GGzzTF4lqdGwc/vuVZqK6VJzkwr4P6YovjC
         xrarjp57b4XRjrPl4hFcrv/WyIIsWPdOER36roJRy42Qp8nGj8z12mAcnpzSRS6ocFN8
         tXapsNJaHAAAdAG3L2QIPokqsWh7O50Mum19U4CJ6QXbH+8RfkAU/TtsHMtKVt3EHz9l
         ARh/JPREaVCDknMQoPfq38Lj4ooWuEBB11JfeCpuGRVJrzbi4XsLzQaG2MS2BYD/gbDe
         0b1iDmmdpnUv5GT8FclCxPQfb32ixwSdXHFRoqo+yZ/rnzI75PHoyXgMXgqZPTQ4NOLp
         FZsg==
X-Forwarded-Encrypted: i=1; AKwUvByBiXuHVm6xso+5hMc+Gl7OV7+hpveEGHXkcHh/TF3vmFBZ4jf5LoYX7X3JPa+lwiPBbeWT3iXpTt6AhIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNOhdRwQFJOfMVzPqY1TG3PqpjAa9txMsHvjgf3K9Rg+WgaaU6
	oC1XZxyW+ItH+dpsGzfj0TW6b4N4UeEY+C5cjevQbAe3imE8BcQaz/cYvEKQdJhxzKDNQFwhXlf
	IFxz3ChqW+NgU9ofzmDUl68rJfDunyKV/dGgzioKnX8teKxD//YvWiZEBrFpmQUVbFio=
X-Gm-Gg: AYBFou3QnVrD6ZVESPEvI2jeLOgQ8HL0VZqEyKoiWJfcaEl6TW6qyFN/oMttR3XGb8r
	KPd7uXZqtObYtsAggVg14h+GEcGqNppuuHYPVLWBXhshtjzsdOC882r9B4NzGL9nWKcgGa6wvA9
	8uoxcOy8cO9E3rMWV/YYX6BDHd6dPbBwdwtFk6DxbzpWDE2dS9g7vR8XDLLwxpe9W17medJzVIv
	SZFFN0upmS5lfYB4CZB9PrtyUblchE8K0X+5W+7kuDDpvDs2BfTfJaf499VIrTorE4dwZxUwBgf
	274CnNYUsoTIs9lUBUdmnaoILAmZysycIPvmTtU75CWcT0jAYMzREAZRqG5lKGWs3XvWu8GXLKm
	EffUeV0w+AjSktyq3OPEgw+Mrots=
X-Received: by 2002:a17:90b:5647:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3adead4c290mr4669287a91.34.1793007686669;
        Mon, 26 Oct 2026 02:41:26 -0700 (PDT)
X-Received: by 2002:a17:90b:5647:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3adead4c290mr4669278a91.34.1793007686213;
        Mon, 26 Oct 2026 02:41:26 -0700 (PDT)
Received: from hu-vhiren-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa4102sm7847966a91.12.2026.10.26.02.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:41:25 -0700 (PDT)
From: Hiren Gohel <hiren.gohel@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hiren Gohel <vhiren@qti.qualcomm.com>
Subject: [PATCH 0/2] Add support for SA8797P in the phy-snps-eusb2 phy driver
Date: Mon, 26 Oct 2026 15:11:16 +0530
Message-Id: <20261026094118.3264112-1-hiren.gohel@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf2047 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Mr6FGUSrUdoPtvCTGQUA:9 a=ZXulRonScM0A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: vTLOgtwUU5Yy4SMBXR51o995WqK8frIi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX6yvdaaD5Waa0
 fi+9b8vMUUcCEwTjZXsq2SFUZ9DmyaG+GuG2+QuLor7YLqoEF/q5dvixBZFQWRzpBEunA8MEPEe
 DTjUPsei05iZ32AVA+0iy/j8vz5KSSY=
X-Proofpoint-GUID: vTLOgtwUU5Yy4SMBXR51o995WqK8frIi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX4JunSBp95VPr
 njh5ggQyeVwJuvmzTPur2PdVJsifw7SVnWAD1zLzdl6/+67lJ3btEENHeJqB9uRu1Ln9TUloQm1
 C3LZ9Xzp8i6TQHGh20gtgit9+vGdfWbD7gD4PMCHNgwQqTK5OvepbEUhCsZfORFW/Dzq4oeL2QT
 rCxAnNmfqKtZ6MyzBvijIdyCHgspxUF5mpjEy9+1LNtQchUWioeTWhJo0fw3v0hAtNmBs3MFqVq
 Z0WPhailTG6/N1jLK34xvvy2odfTuifA0UzXd4SIiyRjxoos/Im1oRNGGht9pO+p9h3vcu1GQvE
 h1v38Xzdcz6+Od4Stw4WX06RjsGXjzKL88Y1v4SCsflQ02IxALi5aYWadgG71I+us9Ge9Chf04S
 9seMU0V8g/jmVQtYnzusq7sHOZY9Y02Xjwe7r/NLQ7kNINGDkbUZWuJdDcVK20ri7zq3qxw6Fdi
 /aHYudDVFJXHgBew0fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260038

From: Hiren Gohel <vhiren@qti.qualcomm.com>

The Qualcomm automotive SA8797p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power on/off.

Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
whereas power domain "transfer" controls clocks and interconnects.

Hiren Gohel (2):
  dt-bindings: phy: qcom: Add SA8797P eUSB2 PHY
  phy: snps-eusb2: Add support for SA8797P

 .../phy/qcom,sa8797p-snps-eusb2-phy.yaml      |  68 +++++++
 drivers/phy/phy-snps-eusb2.c                  | 183 ++++++++++++++----
 2 files changed, 208 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,sa8797p-snps-eusb2-phy.yaml

-- 
2.34.1

