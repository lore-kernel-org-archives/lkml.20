Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906400;
	b=5JXX0eBcjngFPCvo+ImevKwBrlXJsZuFfIHNXMZszTVFP2rrJnvQPAhagLWc34c3M/Hy
	 hcUI2gX+eRPiQLcQBJmeNXAKyqpi37dqUtjTM/9O9yZec1wuSIwEhA1Xm1BudpqZ/9rKy
	 zp8H+17KKQbeMgq++9pfqoK9e5Hhrx2PKJnyKOMUOf0l/RRHtqZHCbtnu068JMjIyWKeX
	 1uCeMlnxzC/Z5RUVVH334/9QSRyC75RJLZs24ZTl9kHSwLzKMsXxujavlpCBrnxgxILAa
	 y+IUC0Gkb6nq8MABJ4Mn4oksIRvOvsJStj3Rv0m1LemOXs+IDeHBv32upSpA+qORyqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906400;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NpeH6W2mGQSO9hdnpb+Cu3cWV0Cz0E/Y5lbQJMm9bL8=;
	b=OeVMzqfajQqs27me/gLS2K3k+GZHyIZkWyUVW9MYzmkr8az2sgGiqWFYGYOVKdbsD/z8
	 spP7UinqcCxboWvvxEtpTec78FZyuERFP/h3jp7w6p7wH7pyPhBAGrvn/hV1FwcEUUCPI
	 PHdfFeEa4rucPLM8v7DzoLkLw1M8M27FXpFOXRDYmz2dUJh8w/TXz95zNWl7C5jQpQZb3
	 iHO6E4/025ItdCibpRuTfGcMWxFmsRt7ySoJOYH6HCBgDhEk7pwdWqx5fSnYSY2r5sO9H
	 oEglUWcN+REEZkGwotqf33GxaZ+e+bZxNQXh1dmDtHReThj36jmcBkzDmZesuC/cJXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=el6x6M8t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bifP/rvE";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7305A606A89F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7305A606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=el6x6M8t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bifP/rvE
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8w1jG844320
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NpeH6W2mGQSO9hdnpb+Cu3cWV0Cz0E/Y5lbQJMm9bL8=; b=el6x6M8t0vNEK+ti
	wnjBqHEiVus7pM93+QJ5QcV8cPJVvxI+UbTFbdIOjPCgt8BIGptMRg3wTlZqQsMt
	ckoONXugdN8FRUlIqcT+A8IQTx41CiCGngXgBtQCBm6+xqjIILOtrS4Pn5A/ZAtR
	rCKVoaEZF/m4d6XVMwUltCNLnRgMV01usIRbWOSx3zYnc6QMpLs0QLz33+ni/yUu
	mfPKWAtsmGZlem1w+p9MZzacOYWPz02hOuHon1lM+gRKElIqTRi45VNa/UzOM6d/
	Flse3FVujAs8rHWgwyjD5DnhCeAQpY7CsnCsWN7DWJO4KMkc5CNOrrQl58HXHcxZ
	sO5k6g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h1q7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:06:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94607500fb0so339263585a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794906399; x=1795511199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NpeH6W2mGQSO9hdnpb+Cu3cWV0Cz0E/Y5lbQJMm9bL8=;
        b=bifP/rvENCezkJMpYyuOpqX1IfEK7dZQjWwDNvqi2Cgh1hOhg8CjXHK4YYxvpR4IcK
         qbL/D7Uj6j36o5u0Yjl5rHPledyhyFAVrNxT48rsoHrrD0tWqVybP1m9l6RZ03cDgnGu
         msFgWI8GYPnskFML+2xj9ZCG3bIyGaSpMvk5u+Pei6BZljLTdzEOR4oHvRBuu16NvOid
         A4IYRIl0jwAVI6mtFIS/VrI/ZLWqW6Oc7QVKzZ1ruZxAS1DhAv04UPZjKY/M6cl4NbFj
         tpN0VgG0F2FefOhlx8JT8uxQ356ZOxCLJX/CMEAf6WEUggsQtFspoAN2LV4qK+B4tRlr
         +PVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906399; x=1795511199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpeH6W2mGQSO9hdnpb+Cu3cWV0Cz0E/Y5lbQJMm9bL8=;
        b=RnpXfn7YCq/hEAj8kmLaMUPBlVjZN2hJUzMRq5L/Y0SJB0GUwCGKHmARlNMEynWUXk
         OyufPv3XHfyFw3BLN6O6p6ORIxQdMxg3zX7LmwebrmlDSrbPd+0tl3o9MCjvgYqo8epf
         ztccSQlsp6Oy/Ibkwb1jqPmmAETarW67okYHy7WDT1ujEZdAhk9JzzHIn1AlFGK0PfWg
         A39TvoDXEKKtmxlq1cgt2D/5ZAe1M99Em0EfwobILy449FBuTgcttdJF9SH4mO+DHCTp
         bZQgicZVl8Pagr11wOg+rv4LJ0vqhDO1APobKuw6UAOBMw3gQtbOxNGlAf0Cs003boIE
         /sEw==
X-Forwarded-Encrypted: i=1; AL+hErGX/WvoNjWANejyYyA25mQLBdbTGdEbRdm1ow7Jgmg3RvkSOuHT+kusIkm7qySKpeYMQc6axD20KGcQie0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kjUI3fzQpIUCRhAAI4jG5hvET1ur8MrcNsmz0wSvvv5Xet/Ku
	LTOluts+BFhlMY17ZIHWqvBLRdyXBkx9jIFBVu5FyfP9nFK9KpdATgzEuOnrhNpMoPvARi67j7/
	FhpZbWYVQbZCDzdXpQ3nSGduFMpfQVNVFJdCx/kKsOox5dBWNDwIVQznWW6LGGYYVx8c=
X-Gm-Gg: AYBFou3O9K0xp16tFPJN2LrbxKXTBpn/HTHuIraQ9A385FzOWXcbowO4DMOWq0Z9mRN
	Y3xs1Je8nVD4tSxyiYZBcgOAJiaUTNgz79Cu4vP1JNmhf0hj9uQTLOPSCqq5uzNYgZ/2l/tbOJR
	Qwrj8TVh0uDwfAfpH9eNt0aTpvPTK9LGb8afVWYq05kr92x129X1bn4jkS/0jNHR1TwcOUOjpS4
	a7LBsBlm/BuR9tmeXQTL76a5dXaydwsVdkXumk2AJ3vt9/2wGFcxi62VT2Z1KjznDS/BbP23GRZ
	9cQtVjISjroKSjcViRv5HxZLs0OHqfqn1wgVPdjg3qRdSToSqswHP9eVhMvUTHz4azHPjHeYR/8
	H/OeIxKisldh4s7zaaDP+Em4sFcP9ASMgi9F9Ru9s/jG9xXD9hccR+Qytk0JJtqgjw/kwlZWG6J
	8=
X-Received: by 2002:a05:620a:a002:b0:949:5e26:e92d with SMTP id af79cd13be357-9495e26ee4amr1439147085a.31.1794906398633;
        Tue, 17 Nov 2026 01:06:38 -0800 (PST)
X-Received: by 2002:a05:620a:a002:b0:949:5e26:e92d with SMTP id af79cd13be357-9495e26ee4amr1439144985a.31.1794906398123;
        Tue, 17 Nov 2026 01:06:38 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm27310657f8f.56.2026.11.17.01.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:06:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 10:06:29 +0100
Subject: [PATCH v3 2/3] dt-bindings: phy: qcom,snps-eusb2-phy: Add Nord bus
 clock
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
Message-Id: <20261117-qcom-nord-ahb2phy-clk-v3-2-ce5ee1073208@oss.qualcomm.com>
References: <20261117-qcom-nord-ahb2phy-clk-v3-0-ce5ee1073208@oss.qualcomm.com>
In-Reply-To: <20261117-qcom-nord-ahb2phy-clk-v3-0-ce5ee1073208@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2721;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QBN+1dwmLBD9e987Os73d8yZUxWyOR/u7FUNVAxo3UA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq/BkX2COVyIWDrc1AcaLuDUCPBKBRpAsarEgxP
 XI8WM7T2UmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavwZFwAKCRAFnS7L/zaE
 w4meD/9NKT71+HUIz37juikjPPfGnNgEnYUYsc19fMFokGZkeLFzkTJ6EdiRvZkHUmWFiUMtAXe
 eQ/sGAUzF4bDux6v8+zdzY028g+PdH/31Vyn5NywV6vAWbN9nSuTZA9yVNNDqLrDHNmhZ7U5+2F
 5tcktQEO4VyzM9kLS1gFhH5oj/hCm+y+nBcL0/fgTLVChXP2M6ChhIR9FKwmhTrww9UImhj8bWF
 zwAPsHj3xBWRSLEvOodkc1RsDuAJYXGLtGc5oYiVlD3qLm57KsICyT7UIy+kY23bgteSlQnvnna
 HN5JppU1tPjtt6tki49eLBqHVDocZ4VU2sWyUhXoxiqIF7lLEb7xLQC9BgTzzbRdbMQP4tT6Y4+
 1ZB0MXnT3UcTZxqfJ2SXMWZzFqsQC3NPIhqpsObfilL8xYzVtR4Mey5YAIkvlgPIq2ulxN0hmzu
 TqufLxQ4AYEKlL8Y7ofVqjYYGpF67wNQDdaNWSEl8My04RiputgrNqEbZ5IflkWLXumN8TKJYVy
 m2nyH5e+8j2LaBzjnJpZiRPwcIAO2LeU008+M8DZdeP4mBcs36OjH1/MPratQQO8UstFfj2LBee
 ElrtOxrcR2LvBGbamQ7fLtk256tHtMeZTtxzMxMe4Zk0L3Wj5EmWH5hN8IXkE3h8XeAAcuYBRV8
 lY18lkrolGEOCBg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Wg6OlP5LVYlPTVmpLKJkIZ8ToHhDHdb2
X-Proofpoint-ORIG-GUID: Wg6OlP5LVYlPTVmpLKJkIZ8ToHhDHdb2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfXzfRc/5uwHgN2
 VSt1+A/KXoXcLaCmJ7CrErvixLSEeS+eNnGOmZx1EV91v3VpeygzXRjNig+3kkfjwPyulBlf58l
 r6iz/WUHRT+Sbmmk2rwAVkOSAUIYX3yD58dXLyUvnrvwMyKov0dmB8+4gSh+eeAcsI5Rh1z9f/U
 CP9K+euPX53w6dQcRI3AcViipk2EuwmW4nI3bpAUbv7nynF+/jFxVWRXNaPb/9LiRQoiRQOSAvw
 H3lVZuH7wG3vq+m4UvVvmzbF65cmA5XQE+z1CUQ5fYDQLMPf3EP/7kxvCyA4Y68T0GLFEaeGUD6
 puNSk/SoJug+H+Y+MPSRSlbchda9tO+EHkLNEPlEBBrPHFkZy11oCnA2BOgFG51bYwC5AK+SYnb
 Iqun6l3e4RD+N5YbKeGd8hI5Y2GgS8pVIrOhjdo4/WovxriO9qWCENG9sFXgVETHvVDOFlgs/21
 +AjOuCgCSIYwAVtV+5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfX7iOztUMSS/tm
 iMS55y46KpJW8YPWpIuj6jqI7TJGbfK39oCZJT8IMURv4U4TVWr/XRPlqkmm2BXwqiZzHNvmmvA
 AGRwEOceRLRZ6NT2YtAFJJ/Thr3IgEs=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc191f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=tP9VjBngxETQ9kDmeHQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170036

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

On Nord, the eUSB2 PHY registers are reached through the AHB2PHY_0
bridge, which is gated by NE_GCC_AHB2PHY_CLK. Allow an optional
second "bus" clock for the AHB2PHY bridge, require it for
qcom,nord-snps-eusb2-phy, and keep other compatibles at the single
"ref" clock. Since the Nord PHY needs the second bus clock, it's not
really compatible with sm8550 so drop the fall-back. This is fine as no
DT source uses it yet.

Fixes: 4d1f3875f328 ("dt-bindings: phy: qcom,snps-eusb2-phy: Document the Nord eUSB2 PHY")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
[Bartosz: don't use the "qcom,sm8550-snps-eusb2-phy" fallback]
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,snps-eusb2-phy.yaml          | 27 ++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 931cd0e7d297e..40c0b8b42182d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -19,13 +19,14 @@ properties:
           - enum:
               - qcom,eliza-snps-eusb2-phy
               - qcom,milos-snps-eusb2-phy
-              - qcom,nord-snps-eusb2-phy
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy
               - qcom,x1e80100-snps-eusb2-phy
           - const: qcom,sm8550-snps-eusb2-phy
-      - const: qcom,sm8550-snps-eusb2-phy
+      - enum:
+          - qcom,nord-snps-eusb2-phy
+          - qcom,sm8550-snps-eusb2-phy
 
   reg:
     maxItems: 1
@@ -34,12 +35,16 @@ properties:
     const: 0
 
   clocks:
+    minItems: 1
     items:
       - description: ref
+      - description: AHB2PHY bridge clock for register access
 
   clock-names:
+    minItems: 1
     items:
       - const: ref
+      - const: bus
 
   resets:
     maxItems: 1
@@ -77,6 +82,24 @@ allOf:
       required:
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,nord-snps-eusb2-phy
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:

-- 
2.47.3

