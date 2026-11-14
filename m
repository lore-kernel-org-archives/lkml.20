Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655795;
	b=xE+uCwhOGLyBpYVcaqc4Syj9YuLs9tmRrxNNk+CpgK84ADaR0sadATGSdjh3PU7yxmDy
	 ssuqJtsmkmI2UThQOCEmMzNb0GKIDwyPJjBs64+iDhPyJ68hx0c4z52f9W81xthw8+pLo
	 6K+6yS9jMGaNQW4kKhwwgBOo06sD/luC1cH2EB8KTb0g2mxfc9OPjoF06iqho+jC7mnro
	 PgOzbrMKoxHJVftQDvVkzz0gC1EqcHLJJpIxIVjFF1fpdWwHVthF5Sadq0scoX3QU8ab1
	 MzfJLZ+VArlF4yitUiD0qdXSO0EZGoJv04gydLoLVUrLOFwD7C6MXt3aN+xVo9lk38w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655795;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pTyV354OgCgsC+UdeFF5DsnhBflmhvuYXStEItKr1io=;
	b=enBu0stVphQh27ELIqKVf3VJPRh9TW/LHZchrrHnOmNpykRxLuI9jaAxnxdqwkOthITy
	 gj9APKfNQtsqEPgs7jtq7VPRwCh0bcq4hPt0kk12GE6g5VXFkejf87jrYkwIbDPzKqpTQ
	 G0ZY42+5FJbWe+kHQMwz+MFMCyDpyM+fwqqu+HluY1T9OU3YVsoNu2+ydpSiAbJfzbFIw
	 mt/j3C2e0HRYKKSHRkMFH6jQ5v7EaxcdXpZQ5/4nw3G6Z277Lxanw4VmQJYnf13t/npKe
	 9oxtMOrK/aS37C+ftU/3jJRrKSOSHbG5++Tdq9zHX9iG/bnzgpGVNya5+hqIfHWw5KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKQUzFz4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVFNaXM8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55692606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55692606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKQUzFz4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVFNaXM8
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wI0V464946
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pTyV354OgCgsC+UdeFF5DsnhBflmhvuYXStEItKr1io=; b=eKQUzFz43741krLN
	/oALLtSYyXkq0AcsL/w4XtHfQeZ5csEulv5/mfpFFrY/JJKvqe89fx/f2KSIy+eJ
	dISWagwXVvYwdrmxEgJKlLjP4BRroC9WQU8rXEIBjFB5NVm6p3jYJZAgQzT1jh6y
	y6yNldtHt2cU5ks8MQhQz+iABPoDl+LWmxBTIGkK/+vVPo6tUsfWgQrH7L9kBvBC
	BbZxkXQAC59IKutjCFhj5Hmv0W7oNolY7E95TBTBcGfEOsXLrNls59VgOLQL7RGE
	nAX9B58UXLgmi4qZwcku7szYxEiS0Lp3LGNCnoLEyS7Shlos+vN785DJchulAnly
	gwrJFg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdrmb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:29:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d2c49c3d9so786391cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655792; x=1795260592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pTyV354OgCgsC+UdeFF5DsnhBflmhvuYXStEItKr1io=;
        b=YVFNaXM8G7Q+6U809P2xSms1kFNzxHaFfJFKHJf3mL3kikA2u3FsydIIvtj4CC7slM
         OJxsaBxf9uNNjKuuuaJ5Bgr0zohb33nz1ZwDtUgwGq/C503AdAGwEH2FHFBYjATE27En
         PD0ML3G0+Y+p967UNPFTxkaMD1xExJ9K5WHs9Eteq4Ji0ebBsO80Ni5fLN8t4JmvQ5dE
         74dIfPO77tyhFimTLyXdxhHhoUbLiUYcKYRXrFh4ubNZkfS4DsR+uP+7vup8iJp5cAdg
         f7uemqBh+tD4yq5oVh2H64AS+LpjYvFdy1eskzqoHU82zSjUOQqj/TU3G5UdxPWuySBW
         idmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655792; x=1795260592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pTyV354OgCgsC+UdeFF5DsnhBflmhvuYXStEItKr1io=;
        b=NdjHDsq5e4JJneCVyXWtvJ2+Y6kUWYo+e2JbJxVQ1VCO8vTvpZe8FizHN/rk3Z+cPK
         bWmVEqZR0XwZEbklIHM2lOMvJAGInH26CfENxbfNDKzzFqCG+uWQhXyokRJfBOjaFLFP
         xHNooybDSIBaP9JcntDqtLpnsi0HjyaYDd9Kc6jVmho/Dnp4edEvtffuHi6vcZIBl0K0
         cPSv0ykYZhj3Vlqj4+hVbqzgrpc49o3TvaJNp6DKwgSvY8yNgLCn7WTz3gfq64biCorI
         lchX3bhSmxulG1SlPhRldXPxoBdNuyGTB/WezIE9dYNWjo0LUl/kQEZw9fy8n3BkqWEd
         ieZg==
X-Forwarded-Encrypted: i=1; AL+hErGJ1il26vuQV1jxWv2LYXsDgM5Y3Pk/ZqRR25k9j/lCQdlPQNGwadw4ATSFVKONCYfZDilQ4uTtsILxvEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QgHyRllrdrEwrg96QfhUkqNFueHEtRQOp46G15DSzxvNHqGvx
	nIR0f/SH9Bl1XF4nXMQYWKKa4l4EVp01CCMo/R/aNa478IxxXpPePsurVyP31ndvG4M3QZzLl5o
	VcbYjDqmqsP1xwJjT/RO0g6zy2aYtmHD652HbEsQxPXsEaVNPXT3eIQFazpJj/DmARbk=
X-Gm-Gg: AYBFou3aUU2QZGTNpsQz8Q44TrVgUWS/RseIg6Iozb9wm0QJiJFKo1q9Ap4niJizST/
	o2ZBbyMvzurmkJPsZCLpkK6UbQt4F0jh9vE3WgtOC6AYdGmsHeC49kBSbKarYpLULD6YqCLPwpC
	74ifvqaDuz4YCmZPYvDP2HbVnNcakJkMv0vDE+xWJWUZgh2i0nRFEl3rGX3rXx7YkS99kZ+0ynX
	sGU5DuNM+ujGFeUo+DnpeItKLiGm7YQXvbTw2lX2+fjZEj675lbnX/OkmqSh68cFULgzWjS9b0Y
	qtjwVGDDHUCuaCGPN9ylwY0fJV/OasqWeh9nHKYOIsXDHmF0ggtGJU7XFoiLRxNkeyaXrbWJ1ri
	iLSKIlS6W3p2JA0/WmsKZ8D2JGUyCM26vlHr/9sLkGHgppIDDFF8QhbjjzAI48bA1J+4liu0V5P
	fH1QRTPP+eYBO/pVbCa3hhuEaSunc7bSnnjdRn/UYL
X-Received: by 2002:a05:622a:5c07:b0:55c:37c1:aef7 with SMTP id d75a77b69052e-55c37c1b4b8mr34089431cf.77.1794655792560;
        Sat, 14 Nov 2026 03:29:52 -0800 (PST)
X-Received: by 2002:a05:622a:5c07:b0:55c:37c1:aef7 with SMTP id d75a77b69052e-55c37c1b4b8mr34089191cf.77.1794655792088;
        Sat, 14 Nov 2026 03:29:52 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:29:51 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:18 +0800
Subject: [PATCH v7 01/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8750 CSI2 PHY
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-1-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1075;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=LFc6jx+MXDH94lWI3ZDmmoldzQASgCtkGLGfmGw+wwg=;
 b=qQbMkxieG7t3MHs39IJqk6/8ONMjTaPIKB7+zb7r390+yjZnta8SFA582Lw2EtjV9kt1MoFe7
 ZbB3RdBwSjZDb0AfWh6sGDhV1szHrA9qdW8cpbOGDDd8ztsmVi4NfG3
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6af84631 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=CbQ82e2HgpuiUCsW3z0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX0TtSDUDbA4rz
 4DBbv+7sVg5Fcl0yFqh37KUXf+00Ngqn/zXdY+ATzL0VPWU63fQ9REqvbZ/RYaQv1y9yl/M1bMu
 +d2ZOM80tDWkwymDMlGCOsVa8A6/5IQ=
X-Proofpoint-ORIG-GUID: DLLCAD8OCE8YAsdfa_s89t4E_l8BEGdh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX4O6ja1gZ03kE
 uH00tLRd8RNnHYpANHdQ3MjRsNI8pRtM8+NT872eQyhRWcJUbFBP7FCXh/dEtE9rYpc+ofNOpMP
 jOVNSNAyBK1QkZJQRAA+KLWspEowOfmQzd37Erh8VCQ6m6GFs93lmZ++bVt18yadt2FUrY3j2ck
 rk/myGyqFLJ6TXNqVDNQpg56DgF/O37MOyqzdxgI6DQhFvV6EDUlHBQKm757k59bGJ1byTUr1BV
 d8LgDhj15YN7cFGGsoz/9H8ynG17ooljOk3dcqRiwoyCcT7KIXfSs6TIG5I4eh5+NFxMMA/mZfL
 04diGJbrmGrKAhpVlPjzGKTZF8yQde02Da4AzNcWjnN+4sPRc92VJtb/3Wt9DzsOeyv3VB1GUfS
 wzZxtMB/QThzYn+3nwIIrUt8vjTr1nNz2QeYxpWOTcbi1m+vjsIfLgUoa/fGe5voFiaJKEVw9pB
 +d1mfL9tQNe0vV35PMA==
X-Proofpoint-GUID: DLLCAD8OCE8YAsdfa_s89t4E_l8BEGdh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

The SM8750 camera subsystem has six CSI2 D-PHY blocks. Describe them
with a standalone "qcom,sm8750-csi2-phy" compatible, so the CAMSS
binding can instantiate the CSIPHY nodes as separate phy devices.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 6e9eb8e265df93b631101ae13f31f6365b6239b6..8ff3df1d0d2787b2af0499c1e4106b86f56ff82c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,kaanapali-csi2-phy
+          - qcom,sm8750-csi2-phy
           - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy

-- 
2.34.1

