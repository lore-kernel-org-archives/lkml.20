Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6B647A0D1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246435; cv=none; b=Rwc80WVnNm3dMfndjzxQYqp0rfoqEc/EOK75BNyF4Y3+gEs+rFr7bwaVj1CG0gyYRiPC8LBNpueryFd/fYkzzA6LQVI5uQNxSg+9kJeyMFW0rgTmDWH0lY7T6cW8JeChYXe88NVVbUqyV7XzRU24hQ4882+pq8YMNsoxPnh+iKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246435; c=relaxed/simple;
	bh=58V6i2zx9JlKRMOzs7ZMIuq3pvZfn0TCTADKKyQzG0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c58cEjvvssiMQ7JtIyut8HbbI3Dnqq9AYwcB8E8lGJBWNQE3CM31YPU+J0dETec8FffyD13zx+EZRpeuAERNeUNIs1ZEWXPTb6vcUmqOUK6uVBelJvpk+slDtd0zU+LD0o9v2EYzGLU1joicR6t/ju3ekA/RQxqrDK0x2nwL6Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMzCMylE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P683YWBc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMzCMylE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P683YWBc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3Vkx538576
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uf/QL2Vr4XlivNd+DCAXvfo4McHGw2HB7d57MYD6yhY=; b=fMzCMylEz8xZ2Q0d
	FS8HsP3whf1Wu4jl/xVaqVQ49Qy7oMPrD9yY9+JVs2jAZOwbdaePZ/4LZuN+0UA5
	D+GMZidInknxte28+4fGBSMX+z6aisB279V1wS+4j5fAw7SbyVD8c2eXp/QZklv1
	LrY67A/tYnpLttAgO2bK4XLsSd1BndJ5fmOUYendmdSgMt2j1B0kmSdf9ZJK2raL
	XzXXlkhIcv+XK/76wpBhrOAsCSsC+vCB48YUSSt7bADr0czKUICx8WjNvX7i8gzR
	UKca9DLW4wKnBu/X8NFZfQsWGlfuOCpy7uKjbPx31KrbHzAMKtwvN511e3NEb7n1
	oHsEZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc84d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0312937eso228540385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246428; x=1790851228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uf/QL2Vr4XlivNd+DCAXvfo4McHGw2HB7d57MYD6yhY=;
        b=P683YWBcBCqZfS0je28aTI3o9+MgNP8h1RndwXyc/cqzNHblBwZO9FJLdIBPzXdP+4
         xBuwmyXBSJLnZop/U6/zUu+3fjDpyiOvQjimwveODSRTTOKr0zwiHJOVGlMjAAhrTRrP
         tyqJyii1ceVEddXmxy6DRW4BLlR3lfo8hbxIwCwzIRsroD66fUw3XXH9WrKqQNhE1Gir
         lSyBhUqMbJh6vD6GW6rw3n52RFXnpikWuyL9NmHjWaBHwjcjrVA2SUCCPqi7zZqdQfFW
         2/qxRkSrkTb5RuGulGhSN+ATUMJ86ouXG95vSdxEK6VJNbx19PvzkBDZaT50JAwSiOi+
         cAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246428; x=1790851228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uf/QL2Vr4XlivNd+DCAXvfo4McHGw2HB7d57MYD6yhY=;
        b=eA1KGC00XZotjfs4aciSMY0ukazo5va2pv8Z/k/Es+kM3bwvUwVigVm2p4yQf7fpSY
         RJ1QltdRIsiGwRlg8NqvvMSUH/VdnTwjHKu4CmGWs4HxlLNDY917FPHFgs5bSR9SdYZk
         6T4sIk29Ij2J74ZUdM3alwOrws9u/f3Z3ZDzrJOjMAmgVsq/GA5xdlXhICsGCxxj7Y0D
         Uizk3HXuYmg0jhSisTaJmPSg3fzejQlXyUssluzNZzg1REFyHkVN9P6KCSfEEE827MnG
         SgFCPHKi2YWuiIIw/jivUVmQhiap7t0gs4J4Dh51wYF1wTgydQr74Qd6hBaSTUnUESnl
         Xi0Q==
X-Forwarded-Encrypted: i=1; AKwUvByZTpsRSuBpVVQgbbrpEADXOGgpjYVNw/7jL1h9iVQMXKMibOasSn/xk3WxubTLADO1TjAd/MIEp5okY8o=@vger.kernel.org
X-Gm-Message-State: AFuF++njFmb64Tq3Mjz54s77slEkOqPf7Cf1S1C2qOrndmmPjxzy6RQA
	FAhoBv0GZ/jsmIkIHJA1nGMBw+X1Wa7IGDvOr+TJX10y7TB/EkDs6ZLT3xg9GIMz4RgU0C47quv
	KwNWmoKhxlTxF3skAxJrG4hT1h3nxuB14BT6dx/FivlS0YlZ1+SGlEmKd9saNG02DR2U=
X-Gm-Gg: AYBFou0Q9yErO6Y19FW6S3pT1kB26SRxKMDRRWI8cQ8haj048fYVMUfJYqiqtLdZiwF
	y7S6vU3+nf5Ayac5x0MKsW51j7uPN0Cc7jyWtCbuJHDEjfZkr0ZluICf9jcmm019+567Y/tmV+j
	jIQvpYamyHUW6ryJnTephPmlPvwX+3iko3GRaIWZ94MS5z8KzJYVbxYa29RRZmXXojAke6GZFms
	w+wc57YdSCFW+GqvSzyfpoD03o0MMMX6DgAxqeurQk8oDgujs3N+fa7kicz5TgqifgPsEo3hEHb
	PuyVXO8Q29/OectBggaIfCt7XQYUBAkN49/UZ6j3qgfOoO486gToMdgQ0fT00TKpvMUF4Ps8NQL
	qq6CQbUq6
X-Received: by 2002:a05:620a:4802:b0:93c:2223:7dc with SMTP id af79cd13be357-93c363e9b2emr235245285a.48.1790246427745;
        Thu, 24 Sep 2026 03:40:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4802:b0:93c:2223:7dc with SMTP id af79cd13be357-93c363e9b2emr235240985a.48.1790246427136;
        Thu, 24 Sep 2026 03:40:27 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:26 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:23 +0300
Subject: [PATCH v5 07/42] dt-bindings: clock: qcom: sm8550-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-7-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=58V6i2zx9JlKRMOzs7ZMIuq3pvZfn0TCTADKKyQzG0U=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3guu9qhsSlKcDH4fvVYW/oNECM0kkcwruzW
 MUpI5Xrg9qJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT94AAKCRAbX0TJAJUV
 VvOeEADHLbFU20gR/0G41jxOtVhAVmA8w/7w5BjwPwxu91G2MT+CJfRddkuT1EJEJgTrz9nynAG
 l6ertp619tQvXXu/C8K1U9KSiq4C/DyuQro3O3LkyypJW3UIiN2Qwf29LduS6ofQDjyD7k0ru9o
 Y66/7vwbsyN76+kp+ifmUxkhO1yPW1qtU0Pl9VyQPcOG0YjmFnS78wVMF8XtleZU3bCwIE4ThNE
 uh+enZin/XzbdNe4CjMKWCCQjOOes1hj3E1o45eje5Hr5whluxcKYU6zBIHFN0RXcuMgzI+rpvP
 Zm14+CE1tA0U/1PjZy9oiG9w+NtkoU6XUtF4Zlw5BFuEiIT+ohW5HZrbgygxcAXQcqOuhVPYfFh
 A8AsnEItjtZ2KBzr56ti3DKtECnYHFbOX624+OQZO1NRYd+8da+fCRL1BxkBVQhgTJYi6QFBAae
 SMyaXHku+HGz+6lr86kPaMSa+y4zYZLzwE2TMflI14eaFiQuHFepMrVv8HHytmto2aSQUAgnOPL
 joAGGeEXs8XbtPvFjpMzTBiq3nCl6JtOypM3vQT37hNtncpZwtc5hBnCqKUYMZN5ouqVjsqkTsE
 ARZKNFpbs8QdNtXvdLqaYSE59Jv50sqMv1yYC3E0mrsc9kLLGfsl60gSzr04EceYcjdP7CWeLcz
 CchQU3vHyLLfy4g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: t5fAcm0YbcCi3FLFuyA-JjcL49ejUfF8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX6wqmerXezt25
 nPjd7IwxJU9B7CxLLjsuOdf6FA7jCPlLFmkr711UBWG2V2Z4TKcvwhm5XikNiWhuD3EiEZ6Tn6m
 1QZoxxzKePCFnWOpWti/ayZ7wCCzKd4osVP5/YeASWYPvL2HLA0+UKOBPSpftjqhrfQWCOsomp5
 exN7jKZjlHo2nrpAGMtFFJdfktJqkYbqkzrdeZx79oyDIJvdcUvU+g665g7yTi/6hI9FjQE7uIB
 ahaS6lX9N9e+//xbQYjKy9DQXtz9HRbcr+Srot2n8gn6jZ9A8K4BIW6JaHWVvP7hHZUjFlD8D4g
 om4bSGhCndLVY3311nlfwyZzq/dz6Q4C+S33mcm+Ua9J7hFV5VPIJ6lQ8ET9Rn0/o9FgcbCpNUM
 b6HBvBisao3nSoT82hGnKmJ6H4pgDa/NKXgrwZb7EEcS2Y9gZcbaaXAmSbZvJ4mMidy1vXLnYXN
 2KHzhjxAO2lTBEjMYjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXxzX4ub7VciT8
 0toslEeQpPF8bxbCkB8/9UakgBdUTyM4Ptwiv5U5bldg0AXPqGLraZNA6LX75oOYuKSrWTx/gJD
 k+hEwbtE5asXdLzw6Ephf2EJw+yYLkw=
X-Proofpoint-ORIG-GUID: t5fAcm0YbcCi3FLFuyA-JjcL49ejUfF8
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab4fe1c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GDSCs provided by the SM8550 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
index c4e9b9bb63f5..f9423aff5dea 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
@@ -31,9 +31,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
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
@@ -44,6 +49,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8550-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -55,6 +61,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

