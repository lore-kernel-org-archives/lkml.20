Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA4A476CFF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246426; cv=none; b=A+FvbuVO0pew9ks88753ENKxzTc8D1RzSVpQbmPMhTlAdfB5KStEoJWVkS/oVxbm60QeZC6RnxYTYJ/TmUq5s+qbroz5Q2pEUd9b7QnpCmvyjkoPgnJOYdLoymQg2cp1bCe0Ald0Rg1r/UF8r86FwmAWiLPX38/rNqkKjU2Gsmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246426; c=relaxed/simple;
	bh=det4iaX9v6ulwRd6ib7E1q1Jk+qVBw1JDKVElqTx82o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=joVZvirtuCLxR/NfOpJdKcKps9Hk3RSAFDFjC+FJ180538NIffOoUXtGSO+Q2GRs8xBfCBWQi7MXibg8A/hVmKyvS8ZME1pxxexuWry0XFBDxozqj+0yq5L+Jtkml/pMCDUhxhPzkCh75jQe+G1wfwjsn+VSzjumFB0B2TFEJg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a4DYb+P+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wt0UWYEK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a4DYb+P+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wt0UWYEK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1OMY2857947
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Th+Tt/+/3tqHfV4D+2s77l3jDH26+Q6yQKGLqEcxvKg=; b=a4DYb+P+pgswvB0m
	ouOZXZD8AvoBTYqDMzt8cOilkYZlK2BAX/dKq0/kq9sGAC+v3F1/wgSLqOYrYxLW
	8DdU0xItSxC/1KF4JdKR4hRQt/MWOpQBSS7vZGM4+Nv76i3bgzmSN15zRqfkpk7L
	m98srG1L1Qxw5skqaRCBtEUYFG8i7t5li01Q75M6zDdFdgfWkmkDLocK4p/HMM5m
	SZ0IZPnb5v/AJNL7piQshct7JJls2TXw7TlXeIfm+vC374BXk8ErqAiZU2cUm5TD
	Lp1MHOtQ5AHX+efO/3Thmles5Vln+BLFwD4wKjn0fr9S/L1/mYK/holQ3JiPFb5u
	KAqVWw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rag564-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9393ac4961fso248715385a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246423; x=1790851223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Th+Tt/+/3tqHfV4D+2s77l3jDH26+Q6yQKGLqEcxvKg=;
        b=Wt0UWYEKeeLqfcXGk0PwbIPKGF+z7s8DwZ0zpb1iazwsYX3WbO8OKobw/0Awg1688X
         DcZITE5y1iTavmwa7baQ3Pr1bprz2399OCTkUWBwydBN8D/nvTP1rxEb7NM28HKNXQOs
         9RPQUzqJFEaZ24dVcPoKJTwhxZOI9qTFD+HIbzTyMGHJjsWsn88Ep4yjejPaH5vXKKyY
         dKQATvklIQ4f1oc7087D8AYxqJRMAQ0U0lXL9KYYzxxW0BNeFaVPVfMYjip7rOI+Eovn
         tFOLDzdg3ypF2eYxoehPUg6Pe+j72cN4xuHaj5LemYy6CYZQGK+vfAuFrX0juo8JqLKG
         72cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246423; x=1790851223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Th+Tt/+/3tqHfV4D+2s77l3jDH26+Q6yQKGLqEcxvKg=;
        b=eI51JnqwwC4YEpFwJ5Iny25LUAw4xar2IoD5ODSqmHMdbU9yqw0p4N7iu3THFZlkmd
         Kiuq/wy9Ir3KnC6bfxe7/EhYxNA4aILxc35DimZifCzCp+3KqYS4F/O93VII82FBT5Ge
         CyZaHgrNVVK8somlMhlNEl8PBjxw6eEapQAAxloATbITfJYyI/hOAEhAjdWIYnS+NB+3
         yKpNSnnkG98QEu4McQojYaPpYNMUj6qg7vEDybHWZ2XrBCddSqZEgC+K5SFlJRZAw6ul
         PFgPzwP6vO6TPZon+VblHjwNFRhfU88/EP9oMPDOS6r4Wg0cp30Xb6xX8g5eRNfx3qGj
         VLvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzs+dDYLWsToOYd4QxvpzY5TeRwihM3b+tBklh3CoCqmJAUCDQNSVxPk7aQ/RCuTAQXRf2HQrKjzaHgysM=@vger.kernel.org
X-Gm-Message-State: AFuF++kVsxoMxndOjlFfKJkLSUZJL14vcQA4JqZxXA0kr9uRSt1sxdcS
	qLgfJ3M6aHBHOWA3aUXEYTd5X628uykeVQ4OiqvSBwxXorwJWEv+2ZdmXSpnoq4jE8zUsfpg9EG
	QNza05/QfvvzwwHGBapxVsPpERl/FupH6Daw4t8qGTC0BjqLdqq98lSNOpIz7FEK3u2c=
X-Gm-Gg: AYBFou2Fy4dzHNHb3M0JllFwRICh+fTE3UQuzZ2Hq2m78pxFwIe4iYAnkkceHpsOq8Q
	BiJcN10jHY1Sj05LpeYu79FsPh8hBg1fWvz6pnm5Y+a4ek7pPvPeJGiUsXf0LtRAB7BZV3hWSaW
	IofMJ3vOoIapKNSv64hY3yssVA7Oetl92yfw/6siyIHYiw6Acw0+miKRm5wIaoMCXg68o9psgQl
	/KHATwSBEdK6qIzTjCM/QK9bTtEzxaTZyqTZz5DoOoF+rg5r0yOd5Fb2tn/cV2XBpkHBuAW/4sh
	MCkw+C+fnWaFl3LCgoR0iADVurZUGO3++zd7L9B2lG02Uqbxkn2N14Tm74qJbV1Qlmox8R8aVKj
	r6NxDzWCB
X-Received: by 2002:a05:620a:178a:b0:93b:6113:21c with SMTP id af79cd13be357-93c3625bfedmr231471585a.10.1790246422678;
        Thu, 24 Sep 2026 03:40:22 -0700 (PDT)
X-Received: by 2002:a05:620a:178a:b0:93b:6113:21c with SMTP id af79cd13be357-93c3625bfedmr231468885a.10.1790246422075;
        Thu, 24 Sep 2026 03:40:22 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:21 +0300
Subject: [PATCH v5 05/42] dt-bindings: clock: qcom: gcc-sm8450: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-5-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1760;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=det4iaX9v6ulwRd6ib7E1q1Jk+qVBw1JDKVElqTx82o=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3evxVa3Qe2bz6u1k69Uh1xNHnvdskXo59zI
 Wktzen+STqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT93gAKCRAbX0TJAJUV
 VnTcD/9AaCA+r3iQpUxj0B35EkjnEso9bbAyMzoPirtpabXE7CjFF56nTvXwVArIH+jiLyucdcR
 xAVtg03oeRf4+KNaALm5HzMUA0yVLSuC58UXYqwG232SMjoQJM7w04ckf2mWDNbqed9PbYZLyhS
 A5OGxxRn/7LDhqbzE0/rkEmkgl+Nml+GQ2q8DaR5WKHsqB4QeBNUH+QgdTH+OUUe/+hwUi6VQ1X
 eINrfUhU2+RaVa25a2QvL8l5JRHywGkERFF+SBWwVEWtY0vHF1zkwfezxc8jsbeAkWq/mM1dXxk
 s5PXsui48cr7BwE6kzcNz/PXpwBILaMcAPvVZVA0T+k8ARqafHqCNQfZOxl8MfyyTzjnjLh+xaZ
 /kGhAKuscOlZnLAL4mpqPEIUDSmdh3eYKMUP6pYe7UoIScvYplKaRYkulu9vCznj+9XnUU9GgZF
 B5hp/px5C0hbyAAFuToKBDtfmsfLGxrjWyrWrRlQmqzzBkqiOYkmW5KiNhx3TT6/U9pA5SJHK2Q
 SFKwXi+A08PflulsvGbKXx9FTfuv8SAfGaztvHYJqlJ9m77yhg61sbVio9fbXmEXgcVWqRz1o+k
 Afkm4BK8jih4FynkDzip1sAYS4dSiM3cIl392KgThpwIJbbdoX4k6LeeMH6i45Is3VOz0HfRG3a
 yAY9WpHdnnZr2TA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX1ZexvYHTMKkK
 2WcpvxTQvRT2/otaY/XXo5IFHr0Nxwo9WLD9im/NrV1cwgHmKDps5eJ522qvWFcTCESqFEj/Yta
 gkQvPGj6ZuoPurMc3xOYg7Aoi5MB16/xbmckPpx8nl5VXxFnpf9KDf0q/1FDA/9az8sJ/Y+tYPe
 zgGrmQsUwUBwKg9ckSWqnwdMyshpJUZSot6OmDepCXqsHEnu5zDHCFPShzOL+buWLevGOxAR0UR
 G6pTOV8GiHkojPMhuhmx1nK/y34j+v9Jz8yxq+318AR2jByd/kgOQWzvgKP024LA0VJvoOCsycS
 Z3wLoN/8kfodT3BzjWKyohq0ttoziP4HrygfmkG6We+zEQsMjjOk6gjbDJd/A/FYaDkxUQKz1eS
 /FHiKEBWZW1OGWiMFQSG9SrMP34yvmshBlvwLKhsOTVzhmGwM4RZTIj/e3HCs//lwSkAAKzlSQ8
 6wa7OVsNfRMuWPgkv0Q==
X-Proofpoint-ORIG-GUID: XJc224lDSBWPLjdkyHrhTus6OHhC5Kpi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX7d45FFrPiIzD
 Yss1LSLiXjdzD406KpZiJQsBoqobFwMTY1vGHSfVKvFyW+l8GkaFyt+MGtTXSQnmeIzTLtP59Nz
 U6WKofLD9FaZYbqwUNKJpwr+mQ/0UDM=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab4fe17 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: XJc224lDSBWPLjdkyHrhTus6OHhC5Kpi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GDSCs provided by the SM8450 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
index 3169ac05e1d8..793ee9e3ff10 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
@@ -47,10 +47,15 @@ properties:
       - const: usb3_phy_wrapper_gcc_usb30_pipe_clk # Optional clock
     minItems: 2
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -61,11 +66,13 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm8450";
       reg = <0x00100000 0x001f4200>;
       clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>;
       clock-names = "bi_tcxo", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

