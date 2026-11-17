Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922715;
	b=xJI62LXkzznL0KapIxwrOhbEAW5ZOlmK+17t5WK7l+lCqF5ygWYqCnsNLVMY6/1oryYP
	 E1ue0W31m1ns0Fsg/mVd4aDvJXRHcuyGx/Jzxh6g/3+5+kMZw4Itr4YpAkOG/wvVT+zlN
	 T5vUZWQ32iSTcoSycgdC/7I/08GIn2S4ZI+DsfhvIhVeCeYc11BF2FP/GXcOjdU+sCP70
	 0NYtOwKa0lkc0nE1rQ7ZFlhwpl698IMG6qan6BvKSJnLT1/Yu+6LXHAvfQWT44XTlLHdP
	 rOPq+bTDFrhn2GV16wC/wlQKkRhb/8TwienP+vE6MwMsRBcPBBqbJWQfVqqDJjixD+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922715;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ypdzp5pZvFTic4IdTV8lCb2ZP8fhRRa6XxVVykZkffA=;
	b=sKtZmd7R1LT/ub2wYUf3CJCGOM09mPykJrTGyt2oObaXSBuZQcByLZQ9eBIYitPKQvGj
	 C9xklip9Y/FAD4PxWSFxEbO6uzPMY52m8MXRWd4KuVF8KHj3H4713gYjuZNC9dI7ydBWf
	 B9t5SdPQVaSSiX7g3oMcooya7hyGJcrHfJ2Dl/NShegGdb1XBRLzWtuLjjSE8PXDTqhAP
	 ueDR0uOLUwFrGHVMxrXSuSh2JuzUfiZuJ+4pNKcwMfa3KtHj9n7oF9vO8hmHPWQ1xGuDw
	 X9e7tigIYe3H4lkF04fEzp+i9XNI35CpYvZ+1Oi2/mfhOjUiK1DUj3n7uYCJYP6vFYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IaBduLal;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3HH6Hhx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FA8606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0FA8606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IaBduLal;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3HH6Hhx
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1NOt541722
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ypdzp5pZvFT
	ic4IdTV8lCb2ZP8fhRRa6XxVVykZkffA=; b=IaBduLalycAfhapOQyblUagfKvB
	Y908DSh7W/ocWxYwKauIW0x7iUFRFcrvfom2kMEaQroG1Hh4DGU968AL9TvEqTBu
	zxYKvhN76Hcd7hvMXo3Cvyk24napwL+dPSK34EkJGvKMnMxcSoohCX6dH0vLTpOz
	nTvFfgIJW+Z1rpJMuolv21bzXckQWRZWZmN/16ggo/a43O2zXJ2Lm5CXiUhM5EO2
	I/mDTRobudmQbUHd3ZAGFogshDPQbv9im8qiOv2Zu5gzQ4Lx2UaP3jh5BvydogiZ
	hgX3PxJV5o4K5LeDx8cgq/soIS/V7U4IcpRICUc9hJEbvcl67pldbMU1gCA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd1ncq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:38:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944138ed63fso708719485a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794922713; x=1795527513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ypdzp5pZvFTic4IdTV8lCb2ZP8fhRRa6XxVVykZkffA=;
        b=D3HH6HhxxsW8csObcOTpZrKBmKdmFbqvRZa3Lmi5fIlgOmPmnMfANjdE4gH46ZFYJl
         11Y4Jr0aPaw982oFT4SzTg0zsTNz8CyQGIPO/ghW1ktJOS6n/9qfi/Hmkn5Jx9L7Jb5C
         NuC5uFN7TaA80+Fg2JqmudFqUEdHcT1aGPXGfdz19ykUF4GfMV3fdALBXwOg9fijIwbv
         Ms+OczCP83VOeA3MZ3I/U/AybzcpxdPrZOl4ecgwZL0udkJ763AnIb6x87hMnJU8OlSY
         66F+0Fea5zAVncDLpJ4p+RhC9tFWy8w8f4KBg3t+d8npaJFDNqZtMmWAN7PWEtS+hbS2
         wm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922713; x=1795527513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ypdzp5pZvFTic4IdTV8lCb2ZP8fhRRa6XxVVykZkffA=;
        b=bW/ifSdnTLS+1poroUNI6prw0RFW6nLrvbbNwv+Gh/x2apv75PAocH3pWYURrrVn2B
         t41Q4U8S37eVz/aFEodgvJgH3+ovknKesysQG11qm5FDRqfJJlERjIv5n+Stpxwk5DiE
         tL3nrdbIYpdoUXdQDba0e2/AqvjNTrcRnf8IYc9m9UrrhLorMldC8EmtXaKNuhIT/y1i
         GoMZdglmzUJ99+KivHWkVH+CqhtgpAEKe4YcsydQqn9GoMwe9qUA2HD9s0YYBr8GxTfG
         q+VX3KGnB3WPVcygOFdjBK4W8IsbFvrL2mlak95R7q0EoDHpqTxj/UobmQ+YnbqAf5x8
         k7vA==
X-Forwarded-Encrypted: i=1; AL+hErFCTbdVLeJup9f7uZx/k5h9AU1lwmpQdcoMAjvnVRA6aFoO0Nq0LsJlEOOnHhrm6OVJCHPj3b+Ouangy94=@vger.kernel.org
X-Gm-Message-State: APuU4Z/C4cvmM2GneWu+lJD51k+6YGHbHzuZ+6lEjeFDfiMqw170YajG
	W6kKIcmCUyq0FodXQt4eHx0CSM6kH4jK6c6OYpcHCpCrhYh7r8GW2+qsGbI6RdSEElJoC0OK1qq
	IQxQcpqEXChdwckGswap4u0abWOwLvkBogFShbu+qFNCp8zAOU6Hi5NL0QOYOCfK4Dbw=
X-Gm-Gg: AYBFou3w7Xo2zM9lWnTvW/tlcREQyi8CGKFEkfPCwRBIZTEppQQA2cmvg6Q7lulwaiP
	ivIE2diA0wFzHPfWSRgHVyrR/ldMOjKGgVLLe3akcaqyz4DWTOesAQnAbi+JCPKv47xy7eIo9CN
	kYjaOi5OqUgIn8uPd8YhpeINDhQO7/wOn1rn2342nYz6iQNefass7K5l1S+IdZUuH0i0QhavL/u
	+doQ8hk6g9UOZP/aUIA5U9fOG4MnyfoShwnsvt5ylmFouZAx4uxUv9009n18C8CRRmio+ydgfko
	rMIyht4e7z6YyuNETHdkmnaZWXZdoXiVAxqoXTeZLRuJQbHnrrmoTfY3su5tz9y5eK966cPDbnA
	0fRgpBqoWSSatSq3NvfaUzBd8q2xNIJAhuScN5CWv4V9OQ3POr/6vPrjrMInXbA==
X-Received: by 2002:a05:620a:2805:b0:93f:1ed3:a9cc with SMTP id af79cd13be357-9494bbdd1e6mr2356259985a.17.1794922712878;
        Tue, 17 Nov 2026 05:38:32 -0800 (PST)
X-Received: by 2002:a05:620a:2805:b0:93f:1ed3:a9cc with SMTP id af79cd13be357-9494bbdd1e6mr2356255285a.17.1794922712412;
        Tue, 17 Nov 2026 05:38:32 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a3d39b8a37sm4080746f8f.46.2026.11.17.05.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:38:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: Remove deprecated hsuart aliases
Date: Tue, 17 Nov 2026 14:38:27 +0100
Message-ID: <20261117133825.245191-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117133825.245191-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261117133825.245191-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2384; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=aAypSiIb+NdhpmV/BXKYvfsEnu+oEKxqPUJEvUhAaXA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/FjSHEEXQ8xrlfvvBIHQ3+gVt9YSiaiwOC+Ye
 6YRCiNk9mGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxY0gAKCRDBN2bmhouD
 139gD/936Q6wb0ITKZcl21iLCpQPoU3xZ1qBFHjuns5nQk4f/2oxvvbUXT05V3hdbjJSgzbrmby
 gt3ytH3PPEQgrDrmoBKp2z08nGaIWeRIrAciGLSieQCmxRXEY1e+nBGj59g/s4/Lfl6Ng9VCXnt
 2plAi4sfDATNzKWPzjAC6QF1BLj6S3QQjMhFl6DOJ+LEbAxypb+r1bSVr5YXpCm+vZTUlP2d9MO
 Pw4wNWYoUqHUStr0GgYaRK/hnsToUn1MlkE5eGGYK6VJ3+CU4x27FmmB8jCiJD36RwK1RzyVKFk
 CSZ7h3yTOHwkF9i6M+/7zFGvPVaigJVPPgWNdSrmtgu3skZ8Z20cWRgkyq8cKB9XwZDtiTupgQF
 fGWX4BQJ9oqwmJDlBlf3hXHUO22bCeJtK7Bx0gYsrCOZPhZwTDtBd4fkzVdOVYvOXlYK61ja6Wt
 sLsjXi/0cRmFtcRMOuHS8Tv6UgJCMT03awPsd8eyViZtuAs78C1CYh87yS2ICwV0UP/ppa2n0oE
 pvCL6Ydq9a7YmwM2X7YWKmC52HTxzy3WmgFOeMbBxzy2zIYUL7SLVuS7S3D4rZBDOglsixnE+JS
 grYAWJ9E//WraBnvsxc5v/RPQBAy8uZZkha3LH3seLsIXa5UQtzIageH44ueQL68BJaImn7+XQe 9gsxv0/u7Utzadw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc58d9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=SxBGgXQjZoWNU_3oOncA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX8w9UKtyVHv9S
 rfXKJ7aWsozL47sMBgbkTEdm6ylwKn0L8F1Z0kjbVmeqFPFSRJ9KeyPlALKqT1LG3KeLbiF+DQc
 fpajEvdZsXCWSfVReTq0VFfnaXZ4Dd8=
X-Proofpoint-GUID: F0l90plFu2-IR2Mx1XGTssgukqDJrAu6
X-Proofpoint-ORIG-GUID: F0l90plFu2-IR2Mx1XGTssgukqDJrAu6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX9uUFdFpE+m0w
 c94uMAlS9kBF7R4Kidho+Q+RmuPSjIP2aJm6YwT0iHbw07VhEPxR6Pyg8M9Z9ktGwVrZ2g1B2Tf
 k1xXQY4rH3kEynA3uuaH+njoU+G700s9s5A291Si1pSOmiye4fmK3MEZuVvDtY3sVzfI+fX2ekX
 zmqhFOu7E+FZO1tVHNJT7OuK3PAMjEJIAVF5hsC5PsS8ZO+yLKngPE4YMPud24lIu/trTcdkVcG
 6VmysuyI7lEFjvwMfKsj2rIz+WzbK720jrFogJjrz/B60AaR4L9gsE8Trw6TMfy35ibqPeXgXzR
 Z/5nnKttbtegeWI9wR8dYT4OUcCRuTqRghPpVinNcdhXQvJykQ9Lk3H7jPeIWd/0lu+aftYHzs1
 DvCqvz3BfIgs0ZJQfkwKYx4PQbMinJYnCdFAb1Hs7Ybgz/cmrhm2D9AesmG5g/su/W9wHoqHyiK
 qhuuVdMsSDItIrCQWuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054

hsuart aliases are deprecated and not needed since 2021
commit 08b0adb1ae54 ("serial: qcom_geni_serial: use DT aliases according
to DT bindings"), because users should use standard and approved
"serial" alias.

Remove these deprecated aliases.  This might affect other projects if
they did not update themselves from 2021 to use approved ABI.

No new custom aliases are allowed for years now.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts   | 1 -
 arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            | 1 -
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       | 1 -
 4 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
index d9c70897b6f1..fccd0931a969 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
@@ -21,7 +21,6 @@ / {
 
 	aliases {
 		bluetooth0 = &bluetooth;
-		hsuart0 = &uart3;
 		serial0 = &uart8;
 		wifi0 = &wifi;
 	};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts b/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
index 3100fab18787..58b93c49ccf1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
@@ -21,7 +21,7 @@ / {
 
 	aliases {
 		bluetooth0 = &bluetooth;
-		hsuart0 = &uart3;
+		serial0 = &uart3;
 		wifi0 = &wifi;
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index acfb9937651d..7d830b25d8c6 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -21,7 +21,6 @@ / {
 
 	aliases {
 		bluetooth0 = &bluetooth;
-		hsuart0 = &uart3;
 		serial0 = &uart8;
 		wifi0 = &wifi;
 	};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 0e0bc8543f71..560a650b0966 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -90,7 +90,6 @@ mdata_mem: mpss-metadata {
 
 	aliases {
 		bluetooth0 = &bluetooth;
-		hsuart0 = &uart3;
 		serial0 = &uart8;
 		wifi0 = &wifi;
 	};
-- 
2.53.0

