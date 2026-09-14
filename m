Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F6847ECCB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390124; cv=none; b=T/gz3KXoppj4nuCsx07KXQI8am5u2HlQKzrW4u/cYq1Tbuz6XnE+2YAX+KLcQAjDayrcY6U+Uw1EcPoWmW5rdE6HiWR7ez5TitKnVd+j5ImX3lkTEdyvsXvwkENhwRT/dh6RKE58OhsO62bAn1Ibduc2ZYpO3WAQN29WmSOT86c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390124; c=relaxed/simple;
	bh=ZkmFL+4zdve8+1H8mYRDiQtW+n0qcgkEMnoxiolI25c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gXdjo/NkXigoVmQCUlKI52SVE+wtS5Fr+DhFCc7+/Y4gpOYj+UXelyM0HbWst2WQ1fQvzXVixd7gl4r6F5YotM8oaBWYvnVW/LOapYdVayJdlHbWNFMk7fVG/dA59hMKrMRlkjBJ3ee6H4MdtBnYc0CJ3IAXD6bTIKd3Bc1RApk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMS9cXL3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdL7+8gh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMS9cXL3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdL7+8gh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmE8x531222
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z3q+Tq58q/nvJFI7sZXUAz0iutxnjup093ZHF9S3hq8=; b=BMS9cXL30d+FfHis
	i84Ewzla8gvhwKjI9mVTCBWgO2WfiMhcQBHPMgpzODRrkSlvtfMuvkVmZ2d0wfyq
	fo7hCsL/4zY9nGEHnK+TfA0sdkQiZUmZDlRhX/W/V9mq73b7CCSJseFs5NxcpC7K
	exaAVRzuBgU3ZOBvlnrNyWr2opWX7eoiWhlhUGu9nPY1lzQw5efoZR0Vg5N2+vIo
	YRvlMWDM/YnjKZVNJs0pShyBSdn7XuxEVTu4/U6iBr2AjyvGQTB9s+3Vu+rXJxuY
	ZrvWQSxltADwn4zSw0ZSJ0VRQQMC3Hi6VOOjdIlizw5Oa1L+FhBt418XXrEk9j5h
	heKwjw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hstfp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0c7126e7so282191285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390120; x=1789994920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z3q+Tq58q/nvJFI7sZXUAz0iutxnjup093ZHF9S3hq8=;
        b=PdL7+8ghwZPCME/oKilS/MVZNUWmwIBlFSM0LK4FVBbbWvWEIUZbv5lDJSBWYx9M3Z
         phbB1BdYzH3juVx5MyXXCecA75ed01wDUimkPLRbvhpoHh9xws2hzALz7GRh9bGFChQq
         wtJQiZpi85auRABXH7c7A3GaBEjSM+BwzB8dJGBhmemEDGOJun0jvqBe9oM2N2iukuc3
         kzmVpkk93JPtlMK2Rjcza6uRDXFCmzE/XCyrbTWmTspjRyj4cHlrklp6Hkq4G3pYuz1R
         7K2THrtaPAbGVxZLVu0ZdmCbAQjOt21JI5A5h+Y+o9LW/X2/LRekgF/7hBSjcDt+y0Hd
         rgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390120; x=1789994920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z3q+Tq58q/nvJFI7sZXUAz0iutxnjup093ZHF9S3hq8=;
        b=C7FRM04oz+4VMV+RrJDTna1LopWwaJ6jYfweubc66aNgw6cGVojBdGcqani67mt8hP
         Y6R2kOjipk3XdpgT/gE3GQB/ZZgt8jw+XlJt++qHuFNbXUBvn0Y4uFf6D07QpswTdske
         QbrBlKX3bKub312Pl/PtC7dsyWsKCAnLphuzPlQLnNxL4ZqWRwbcib1+rUVtPnxbt27u
         eYghXm++rFqp5DlDwz3ArzRqOlNeeTautb3cUIgG0YCbQ1J8qHyPNfDc4ui0Toc8KRuI
         4U/5GD1VGzx/8v64865K+THwcXfamdnnQvzapPXf3wpZ2PblM9StIPtCxdCBEg8rRy4i
         INcA==
X-Forwarded-Encrypted: i=1; AKwUvBw5no52ZjtjsRLJ2/ZezyL2eR3IdH1pB8/9XSYZT8B82/v14nQQK/jEae5i7cV06t3b8l4GRXAUI5DX4Vk=@vger.kernel.org
X-Gm-Message-State: AFuF++kvNJJ0Ijg+exhb4A0GHd0e86CuLhb4aM0G/LQgdpCE1AWCIxxF
	NTUl9VIIzvOfiB2MRnpML//bbfu64vBq3YlGEKpCs0vZlFsItyrtp0zM9TV7pGCJSvZyWnSe1mD
	/W2LcZgzvJyiCcb98fnOLIelrFHLt+9kIMha7ucUvprVsLCb6aAs7/1S+4RFgB/QhnVM=
X-Gm-Gg: AYBFou1Y/ai1IxcQaZObJN8Vlwd66zrFeXBACpwke7KMwakPlqSo7xtyW3WixMDzOnM
	5Od65hGsUSxQuhd8tlUhGtSQKylQIDaFiWoYmTQfZJxkBpx1sVZqKKARZIEqt1a04uEEJGD/Kt5
	1hNSsQAJRwMbo+DohqFqyDWYEwd29jFe2nJYcED8uHGff77X+PdMw48rFL8WRc19WPXNMQMvm6T
	+AFuvrWv3EZW/69qEPXmjAvtrchjriTO12ZeICoqa06idCKh9/nhoXoSCwcLuLrPuZmwF44t23s
	3bx3cAfIAJ6aUrJeUlWBvpFJf9emDNzG7HOpkr22VqJ55lh++udwNMbApCX4/ywPU0XhMhIhl0m
	5Z+m1t3ic
X-Received: by 2002:a05:620a:6504:b0:93a:1b82:495a with SMTP id af79cd13be357-93a299c5963mr315570385a.37.1789390120069;
        Mon, 14 Sep 2026 05:48:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6504:b0:93a:1b82:495a with SMTP id af79cd13be357-93a299c5963mr315561385a.37.1789390119439;
        Mon, 14 Sep 2026 05:48:39 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:13 +0300
Subject: [PATCH v4 14/52] dt-bindings: clock: qcom: sdx75-gcc: Add CX power
 domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-14-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZkmFL+4zdve8+1H8mYRDiQtW+n0qcgkEMnoxiolI25c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zZKQeBV7wRNeQlpoALdPUnmK/IiYeRl9vrr
 ka9a47GnaqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs2QAKCRAbX0TJAJUV
 VkiMD/9BkMn0vVK5IqwcsGzY+1ukGFhnPn8184NeSnIYs1zBRmywT70IwWdOXciuNle/vWR5z7M
 kaYc3pk0PX6TQjwpxCill2Bho7O/Y1TbiUd/4puIwiVOZOOB+pMP1LQPj+Lo5Asj/WGRxPdksHK
 GRhTpO8+Ay9D5o5XRr3TkFFXNqZAlnq2OiACmLVH23hFkfPba4aWfhwRbcJhy9hLcvyFqv0EnF6
 dGlk/Jp7g0SFJw/1SB1u3Np+Hh1aHrTWA+OwDJJr5udmnrWARJggkBNRxzfIta7e7BGdz2sHlJa
 wOyYWDXOKhVYnMOOYl1Gugzl8pU/ckyN3mY5r14wQKZBFk1Gv79jxk8iqj3S2EltmHMyaUz8J87
 bX0AwwCfQ8VMFhJ0ZjB19G4C92vJig4FyRfzOK7Eq9cFOpmhIozM9womMSfZOAtkSindQfli9/B
 sBE+T47arOBQWnmY5udaNGsTN/YBlThCSv6iiKQQx7VWD/CLF0lzPYjWxdd97lPTwaFIxiGAw7u
 /yPsfu1bOVUpGifGZkDZhRt13q2L5A4Y7wZDlm/Lg0oyudkFN7f1JtzKoXw4hSsl0YQFa7V/1DG
 14iU4WHR4c/C5pz2Oj9PQZaQ7i6NjsJVgomI2VadM4gR+iW/xbTANY1HKPI5Gu0rSZitoGS94KZ
 zy4yahvOzBF3lHg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX/icOiE7BheR0
 /oJ9lIb4cc+v7YoZNk7NHihS8CT3+mIHotWLt2zei7LVeQcEUvVZryd5HSU0Qz39hFi2g+OxkMj
 J2ji6ln6u5p2FTTgadrxjbbkt2LIYKsGnnLWv8SfiUMvI8U/f0yKXgqD9rvEuNaAUoQD9plbDXJ
 F5XJFnzxgUJ/ln9wV4cp3LxeRnZn+FEgp40OHDJRf76clFHpXtIzjSxusZ5zpPkNjEwfXv3JJaj
 1+Q1Ullas162GMdBS/YJIN78VbXJNUuEQ0eSh5bUj/SGJCn1MeGCWa2L1kummR9AFvkLC86mW7X
 K7Ew9EvZxCFRRYRGcsFKAYM7Ow1uJT+AlHwSDenBw4sI80ftG+zJB2CMCyoZaVXvIlhzpZ1qvnN
 wPXjKkEcACViw64emF0TStnYdVKZkR/w0rXJhq4NAmeb5pb8JrkEBD6+zzJlhhk1XzoDJNY03fo
 sSjKOmuj9L18ZefX8PQ==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7ed28 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: KSI3YPgLvJubGW_72cdVzLdLd4A-G6zo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXyGTzXSzHeJM9
 xGjqmZeuSiNYPpmGPK1WNRbtAMPO41vr+CBecDE2qGzKFnTCM2qYCyDEmM1nMg7Pz5evPnwlBuv
 ld4Sdgz6GMYgmEY/Q/nC7Gou5qc5TSs=
X-Proofpoint-ORIG-GUID: KSI3YPgLvJubGW_72cdVzLdLd4A-G6zo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

The GDSCs provided by the SDX75 GCC are supplied by the RPMh CX
power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
may undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml
index 29a0b29bcb81..75a38e9f3248 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml
@@ -38,9 +38,14 @@ properties:
       - description: PCIE Pipe clock source
       - description: USB3 phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -51,6 +56,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@80000 {
       compatible = "qcom,sdx75-gcc";
       reg = <0x80000 0x1f7400>;
@@ -59,6 +65,7 @@ examples:
                <&emac1_sgmiiphy_mac_rclk>, <&emac1_sgmiiphy_mac_tclk>, <&emac1_sgmiiphy_rclk>,
                <&emac1_sgmiiphy_tclk>, <&pcie20_phy_aux_clk>, <&pcie_1_pipe_clk>,
                <&pcie_2_pipe_clk>, <&pcie_pipe_clk>, <&usb3_phy_wrapper_gcc_usb30_pipe_clk>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

