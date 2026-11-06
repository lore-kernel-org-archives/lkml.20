Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950670;
	b=arC4OFc5hpaXbkmdzljQJDnUN7jr7QP4WCQtZzpM92aaZ0X6ZlYDVTCjdKj6hqX+FyKJ
	 ffnNkB4A1epBFMJM2dwdpKlcOV//LcPt08r6hYWz+QI3yljuvB6nT5sQpYHK9fRyftwR/
	 ckMSgAHe2/R9bCpms0vFoduxFAOqicubFWoqpdgE/YotEygfBkVMXcEDaRcdIPgMdoJsO
	 5t/RwsQAciSNFZwLcWH3zvax5qXhPxvdCWkPq4IKLBX6V4brCjs9mG7KBviiOaYMssF2U
	 4HXYOKndRbT/NmmEgQEYhQRy0giyFNCkP5TSaluqIR43+Na2hLT8JinmMYLZre+hCCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XmBZz8J29Lp9GQIu57kUSr13Q3mTJePiIqWSZfKucsE=;
	b=WpF4LHt1CIZolrgeRsFDmIp4pojcxus2EmvxSaV/xlXDNruT5QTaUF40yk9JiFMh33c8
	 DBZNPOs/Vc5wHUK62/vy6U9ogsiAXS9dXZQwVkHxGmDBH9Qjoj2GEmoCFH7Mndn9f7jxA
	 GZV+k7yBSLrLN1jeWjuXdluZ96Z6DuiKLllu6Heh9MAytgFYiattmzorQzsE5dCszon16
	 i57yzxpL5FX+skZr0rayWHYA3tVjD6MCJxKLYrn/iiGzMnX+33DPFEui3zDV63O0faqso
	 nxk/p5qA7M+ga9iiqrih6/0ZsU0S6Inzf9D9CwwIiHynSM4vf0EiJgFhvNW+5B3zzvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZ04+8ec;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PMSwk5uW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FB4606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1FB4606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZ04+8ec;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PMSwk5uW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RMI02933606
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 07:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XmBZz8J29Lp9GQIu57kUSr13Q3mTJePiIqW
	SZfKucsE=; b=pZ04+8ecmdKCBnpBh2OngT6OWQDJP5SgMMUdEGtj6kx2pa2RVaY
	3UBNCPSuYTRJHisQftVw/P7WapUVCkzVhDslkykEWgUwflp5a+aipABQo9dKXN60
	v0fExz2YjcAsGMNdrWAbdRC66q9BlSFVuKYjr9W1JWY+zFgm9wHMCo0JKCj86P8s
	2UwA0sS075yZ7SaVFvQwU56zmIk9p/rea6NgQkP689YuuNtwAXaSZywWDdMNlOHk
	liQPe/F6QnM3AcujXI25sbYwzmGQKB3eTuUZ/Ck/WKrE7jGJdv8O2fQtqrO8KfdY
	0W8bXJC58wjGUkQoezrpeVKxItu4r970/ug==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1nr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:37:48 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99062be02ddso42033241.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793950668; x=1794555468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XmBZz8J29Lp9GQIu57kUSr13Q3mTJePiIqWSZfKucsE=;
        b=PMSwk5uWPIMjdE5vKl62nh+bNu6HwOSmQcA7n4SF2yJ11QRtCfbnqect4hRyndQgpV
         igVaZ/Ot2ZWZ244NlyeQdPMklnG5MBJXQjOvmQrYHMTQSxpxtRCnUz1DWCGpQK2t3j3E
         zUYO9K535o6Y0tqZEfaahr/rMjNHqKfbI4TmrcVsXDSi9B/6itLa1ut+6e1AJLGPZhE3
         dmx1UAYRBT5Z69xXS3DXW3hkbx0zCwnmbqVh1gQpQ7L9UmfbdtMi5dHWHG4bjVr2m342
         D+fSqZWXuuofecQrlo9YNsYVdvxooAe/Ka4gZ9dNzAQ6JkAGt43RFqFeIPrhXg8zp0Xg
         xdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793950668; x=1794555468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XmBZz8J29Lp9GQIu57kUSr13Q3mTJePiIqWSZfKucsE=;
        b=Hi9DfnlGEX8NZViU4YYFjALnY7Uu780E15ZwxY2IKPheTkRL/fPqX2bBaL1RqWsuMF
         5Fev04TlseYDiRSRVVJZ+crOxWNnJ9R7RqtOTdqt1HimVZZNSEsJbD7141kyWXO0jPrV
         MLunRXmB1nhFldlOUrN8gt4SZ5t2LyN4wZlh33sgW+mn/wUxY/wir4BT4T0Yye+to7Nf
         t7WJQP3xhq5NDLAwbH6U+TCKSh6rJqWkicqVUZA3gJHn6FerrUndyNlTn08jmgY0taEB
         qCRFXjwVVuWCEVvPjRP/soxpLcpau94Vxe5F5h4Eoede/pCxdlTtCHjKLcQmVROAAa9U
         dpAw==
X-Forwarded-Encrypted: i=1; AKwUvBws7Jvu5t70fg4KQy/jryxCfQ1l5H3jGRWoDIFK8AQZzvt8yKCRA5Onr0x3QsunK0SuMHx2wdiHXZI5PuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z88CZDvvCfPtCsEm9k9V2WlGPr8rc5SRBqANUo+Gqm84QMJgzC1
	7UQzC2cBwD8OwFwyWR9U7CoQ90Z2+BdqEZZyJzidsD4ssKx/zykZ3pobbPTnt7dhohjeb9zueoi
	A/ifMTHJ60bqoRhvD7vGNlxtyY5jLEr7yvYbTuxvt9qkgVwg65d7TyyZ1hGo2HsesO0lFZxapyw
	0=
X-Gm-Gg: AYBFou3t1E4Kz8zuT+uY0+CqZQWWp+ay3/Dek5BVdrCtGabdXPKcRDi+W6GAwtnMtzX
	qq/PPqmKVBlWhFlMzHV+xSQrERqm7MUobqVQVl6/gookgIfTStVY7pmlZWo2KNHl6Y9fl+j9prx
	ToUQ3CECsLjc7Q/1i2lmnSIiyhL/VX4o5OfjKGTVtWuW3AxQNRLHE7pWXT2J22LAyJzcLWoqTq5
	5Xwp0H21xfxNGV9o1lWg7wEO3EFeqFZ2QTl6htjyVDqcKeyvP/FZb33YYyqKQluckUKAKS/9T8r
	ELfD3VxJ+1IlvxXdUlTyROtefKnUvlLNA90zHdDVoae5dMuHwKCOBqBajUDSznT0Wvu6nTkHSOy
	OtXt6q2IOE2UOC4Rs3RHN2517Ex3wTtcSESli899SnKDsYWlsFhkmndvJzNYN+w==
X-Received: by 2002:a05:6102:c09:b0:7d2:7c8b:3d8 with SMTP id ada2fe7eead31-7d2a16e4764mr925014137.36.1793950667965;
        Thu, 05 Nov 2026 23:37:47 -0800 (PST)
X-Received: by 2002:a05:6102:c09:b0:7d2:7c8b:3d8 with SMTP id ada2fe7eead31-7d2a16e4764mr925004137.36.1793950667464;
        Thu, 05 Nov 2026 23:37:47 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d84726basm2155324f8f.57.2026.11.05.23.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:37:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: eliza: Use GIC_SPI macro for interrupt-map
Date: Fri,  6 Nov 2026 08:37:43 +0100
Message-ID: <20261106073742.99552-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=vGSbtJOHPFOx04pTR/hXiaYZy2s4Vo3dK7FLfdtdByM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq7YPG1leJxhCjOcL60LaENzMRXglqS58e7X6H5
 S6SXsgTb+mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCau2DxgAKCRDBN2bmhouD
 1ysBEACMKwXl2Jjl/OihJ+/SF7ONb1yHYvXj0qJ6IZeQSdpL9NOUNdqMQwosR5eboVUH8KLb6E+
 oUtktzahxXUSsWJw1vdtvSXZMKu9gKV8tykPPlxUYNIfG+Zl9gaYRy3BMhgjSjKvLj80GI+9TUD
 /GfeMfFELUnay0F27WpOOBjua3FZEvAV/2t3twVy9tCbIKpDkWGvMSTAzKBjoMvvn+jjWTA0rnE
 WlhHGiOpKZgLZ0rjpFn5uR7q8L9eiAkDgHUHYhyxQqAYAFPh0WS3nian6ShEB3nHLafulpBs27X
 LkCurfbfqhFKADiekIZeFbxK+evrBEPZPLQH38GcS5NzyLfbjeqn9yALHnJBcn+OMWkXHheVyJ/
 s66B1BtNFOJ821DdSdOHd1Igeb7dyrThBB6x26B6gPZGqjK80oU7rYD4bpC+ZjRNLeJhUGOA8VH
 /SfN89Zqss4fR/UKBOZa9hN1oFeYu5uS2Tt4IUkCsbFTPFYdY4vYQKk7s1xki0txzDJ++JnAmWc
 MwhVJ9WSsFKKCf+pUdp/49pm6xZjEk3yrbdcIao3rNL61F9+6jQRPbLqWoqYWFAt9ei/Odsj65E
 A4sD11p14EcaKe35bI24czFRBswEts9H1m50L+3wThJsRjmmynX84bSCVJTHjlUujAq6OS1AKmy oZqv8iCe6zC0cMA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xxaBubMDTzzQFABQazeBWF8saSDN4XzA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMCBTYWx0ZWRfXx/FjRZ1YJYmi
 nraEb5DhR6Ki8I/nqFDt6zHqfAdk0VwwIIIZlVAoOrxkmm+Qn5cI+MmD6IoKYODiv03n4+7p1KU
 6PUmTk9BnvorYfBi3VZw7+LmjnA0vTd5huStBYXSauJGX+RlaDU2zwwI165EJNORA8TsO+U5Ggh
 BECXEoaBrHqpJItniu5jFib03R2PPXCwGMj/749E0U98yohizkLiNdH7N3AdOvr2S8EYZs9CaOS
 0iUkxylqI6GZu5ZzGwTQmrdtuvQuPm2vq/dTHlRyhtERy79+M/Dr+FNj++j1mJ0VvyLqBEFkjtp
 cMWW+zDNO7no/aebVfMcMh0Im60ZgfE0pcwVviUivJePIrkVBlD8MGULKraGdXnQGF89dHeZa7X
 ArEcDaJq/Z31Z5+cftMUAusphy35+a4/ItF7rdtmmohSqeaW6N7L+QbzIlJWqXLD88r6z7W/rd+
 NFfCILVQdzMyVfvxkcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMCBTYWx0ZWRfX/nQ6ZwhlUW8m
 84Ws9jM6LjbRHnXU/7jBTRqLNqPK4bO2UThplX/0TQgv4GKHr4ddxzNjsdcYWHMxuMT5ucBmNk3
 2fsK8C4gnk/NTwWdgGjRcfQJlZuTe/U=
X-Proofpoint-ORIG-GUID: xxaBubMDTzzQFABQazeBWF8saSDN4XzA
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aed83cc cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=7azGx4adrwFQZ_FdwBYA:9 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060030

Make the complicated interrupt-map property (with multiple '0' entries)
a bit more readable by using known define for GIC_SPI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd07..2997af2f3c70 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -1915,10 +1915,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			iommu-map = <0x0 &apps_smmu 0x1480 0x0 0x1>,
 				    <0x100 &apps_smmu 0x1481 0x0 0x1>;
 
-			interrupt-map = <0 0 0 1 &intc 0 0 0 564 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 0 565 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 0 566 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 0 567 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 564 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 565 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 566 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 567 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
 			#interrupt-cells = <1>;
 
@@ -2085,10 +2085,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			iommu-map = <0x0 &apps_smmu 0x1400 0x0 0x1>,
 				    <0x100 &apps_smmu 0x1401 0x0 0x1>;
 
-			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
 			#interrupt-cells = <1>;
 
-- 
2.53.0

