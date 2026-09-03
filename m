Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0940E37F33F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413171; cv=none; b=HWmNMlPVeq9X/MTd5e4MW2E+Fw+phfEcHUyWIIFVuQE/OQesQfyr6rKKTWU7KE/DvOpM85yCnjjvVWQI/Shfnc1HAh6XA7+Gb/UzZMFgNptlptMfplYHbsWc2v3pFFLV8Xz8QaWkBNcJ9cDC9pBYYVKFWZdGBR+M/yXDtq2fpzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413171; c=relaxed/simple;
	bh=5ZKeJX0Pe2XaPJokiceoOf6fBWvsj9hj+Iooa05zS9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SxzYHuKnYBjLHnjiMYHNgK7M8Pu6YEuxqN/HQxupTCKfYtqWH8UmmDULYgzj8Uiv9sIjdNf4AlrN8jrlFMf43zspNmSEgkSwilmyXr3VKtp/KVCf59+55gFq2NMmweRonzdOIr+s1UDhehyE56ZrXHgV5R5gCt6PqpGIShpqXXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OV4BnH8U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJslfHaA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OV4BnH8U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJslfHaA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6832xt9A3275629
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 05:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m9X9wMPV1ZizICLacCYzxn
	SkTZv6Ifd9J8mUVYRMKtY=; b=OV4BnH8U/md85Q6CehBbydEQaoLwJ21pI7rXZM
	wSsia8PfajbvApKbrZ+2TxwpJrfxT9fADu6nOLaad9bh28O7TnnNNvIGwx8dKmeq
	QxS3Uqz5FAQudX7SIABQZBJRD5Gln2HkwcG0R3g9eKHaJBmGKlKvhqzvkDzoffNb
	siVhBqwPnKhqrxlnjmd2MnFa2a3saLGEf9zknZdiOiL9xJB24dXoEl5pvsFMr1Gg
	hydbWJzv4LY5LF7gZsiHCrY+iLvlrBktSetO/A3cHfiEoUD8TSPBXQaeqp6MHBAt
	0DF+Ah2w5/yNU54pNkbKQGHgflpGKl59Nm3QCnF96gvild7g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdu8t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:26:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7151120d6so30466985ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788413168; x=1789017968; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m9X9wMPV1ZizICLacCYzxnSkTZv6Ifd9J8mUVYRMKtY=;
        b=EJslfHaAWro1EHt+EJkibLnw+7e1sOSMcKCFnPNULVir25YCt1pY6keYBfMg2MrmsW
         0DomXtAOUyiECpt0lsja6tKyCDt3H8FvlCew8Nhwis/VhxrjLzprrKWLIiBsfZMsI6cW
         9tb9hIzWztkqXpiJqnL87E73+hwNvCgBO2et93rOfx3OF7+x0IkWY9yfeS9ar3FjM6T9
         gEdbq83r02Ixa+i/W5YDPwoAM8H+Xcx0CgEwgwVb6l2jMO5ZyXRbfimF2vfdyYxfljx2
         zi2hn+GGJPhsWDSPKXdWYfxh3Jn768Cj9ZXTSajqQbEIpuNFASMlPtvNLi76oilrfGO6
         NxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788413168; x=1789017968;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m9X9wMPV1ZizICLacCYzxnSkTZv6Ifd9J8mUVYRMKtY=;
        b=NZvpzZ1EVG9ZY0d1C0w4D7cjC7o+FFYaleFgyBSLedajQhuE8A5MghhMOTUM2q0Y2/
         LpU0BuCD+pSffouBM6ZaMLbDCCLWWNd6TvnRRPgTQmVxkyQW048+ioGj6CE4q0Oo4hc1
         uQOdDF+AygFqn8EVxgAkqTCNFhm1WUfB/eaX9zmYtPhLg8FCat9IBBehDpZuWx6psYxp
         QC43zzJj1qC94IobbR++QrptmIRCy3T1Gq0q/CJPETPezkx9bISoENpCSfxhj/Gvz2au
         K/Nx6tXPa41H4JHOJYysqXAzXHOkYj4Y1AAHQqf/XM3jWiivBW5b8QNFFiGJEO8FduCt
         6cag==
X-Forwarded-Encrypted: i=1; AKwUvBxAnHKG2OnCJMTAolnReIVTZ9YrvYK2rJfg1cgfJmbU8Zd3f86JUAf5rwcvlxhk5SCxOpSfzEKofbbwfwQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nQ8uw0r4qD2jDs5qNnRp36MMRcRkgx7/9cIB1BUEIeRP9Vx9Yi
	jYolHuro+vxWq55gjrDhd8MMoHYbHMBq5/yuSFHwlPx+hwfwo+IEZV9GHofDSMPsu6zR71nyrSA
	GIep0RXfXk4T14UT0ZMySd0Z0sluYF1h9ny9NaKr8uo/MA7o8QrzfGWFbqoqXMpyv6zQ=
X-Gm-Gg: AYBFou2BYFJzhR/opWDEXU6lyJa2wlF3lXX4ljNP5/ZzvI+LJlNFzYztQU1Oqay5rfG
	EBLsOhQcLvfCi40fkaPnaMM6MVqwaHijs5D0L59Nzc2U1j1NmUuvph16ImdUDuHiRVhWcGej3us
	25Ek2rhwQl5BHxotBg4hkrs9kfP8tU1cZiEi8NAo30Cq0MXr3N+wU+6+KKovI+64LaEmKeQOZ8j
	jaUxu8kj3bvQvjwZ0t0VV7ZzkVK17UNfmWxu6J+gH0RHc5qmcjUkTwoegT8YGN6kZ1IsUT6TgKj
	X2najCTd/KkkF1TxK6Xfd7Vcxf6bNm63BBDyMMZzHLjjLH3/VCm3WkFuGoMzjBRjc2lcOKiFqFD
	xGG8XKGGjp6CxGKRNiFD2/W/d6qBeJz5ZbLBpiQ==
X-Received: by 2002:a17:902:ce8e:b0:2d9:4871:393d with SMTP id d9443c01a7336-2daec79d31amr128573575ad.21.1788413167740;
        Wed, 02 Sep 2026 22:26:07 -0700 (PDT)
X-Received: by 2002:a17:902:ce8e:b0:2d9:4871:393d with SMTP id d9443c01a7336-2daec79d31amr128573125ad.21.1788413167328;
        Wed, 02 Sep 2026 22:26:07 -0700 (PDT)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256902f6fsm3215968eec.31.2026.09.02.22.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:26:06 -0700 (PDT)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 10:56:00 +0530
Subject: [PATCH v3] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Maili
 PCIe PHY compatibles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-vdev_next-20260902_new_post-v3-1-108223cbcc10@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOgEmWoC/y3MOwqAMBBF0a3I1AaGiN+tiIiap04TJZEoiHs3i
 OW5xb3Jwwk8NclNDkG8bDYiSxOa1sEuUGKiSbMuuOZMBYPQW1yH+pOOOvt984cypmKg5HzMNcX
 D7jDL9d3b7nlel5WXbG0AAAA=
X-Change-ID: 20260903-vdev_next-20260902_new_post-dd80ee705b52
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788413163; l=5804;
 i=vivek.pernamitta@oss.qualcomm.com; s=20241114; h=from:subject:message-id;
 bh=5ZKeJX0Pe2XaPJokiceoOf6fBWvsj9hj+Iooa05zS9I=;
 b=B23HGy7dwbHuDA1oOEciBPpBzzmHe9K+ee/kapfNyIy7ss298f/jeYd+pwCXjcKc3siL61PLS
 Nqt73YGy42ZDQuXrrLTwTViYjzGkzSINSYFFlNx3D391OJZDfCMmJ+s
X-Developer-Key: i=vivek.pernamitta@oss.qualcomm.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a9904f0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-EJkK5gzETyOJOMAgRsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: _wyHcArwSIluPOT5uw4y65YaXZM36f8y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA0NiBTYWx0ZWRfX75Ctte4Le68Y
 A24md7uMKvQZgWHqqlPmgm2Py6HduD9LfjpbN8ENN/jMsfR23dSPTmMKEdOBHexCVXKOEmGjB3q
 rGyMnWxEyO7UykfDyjibdYuf3FuywuxXO4M+YcrLva+M4f0QLbtKOw64yyb8SQiTpyntBGkB7T8
 8z/KGEys0tDDhi4KSlkx4+CjSrNyFDePUbB5Lobl90HI3Yf91r8jzZheFK40iVUqvgyF/Na8Aam
 RPLNW5m2pfFOwaw2udsfLWf9Esp69P7ruKQqZpEeuA4a3n9xrd9E/JZPF7ST6MauxGBWuffLlMj
 3HCVAdhvziq70QBY43bBCkxEScxG97z0pDxiGKVxrOpnOs+1MYdZAKejslbBsDIvUfjPQ9o1OQo
 C6zFYrBpaCWyELvk0l2m6e4lka8Zq+48gIy4QYU+Kjy5dPvI6I9plmSRlB6g3IqRTIjy1nBi+mD
 9ZpmwPFVtlhs+XxGlaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA0NiBTYWx0ZWRfX4TtvzSsvaUtA
 qQ/RWOEycVmtDEbTLWQoMGDP6DVtND7ROQicA/HBPxh4obdbQuFnl38zpOyjm5aZ6C6PliZKVNa
 ZV00SV0G9/1ZSC3DnyFzL91IZu3QgXA=
X-Proofpoint-ORIG-GUID: _wyHcArwSIluPOT5uw4y65YaXZM36f8y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030046

Add qcom,maili-qmp-gen3x2-pcie-phy and qcom,maili-qmp-gen4x1-pcie-phy
compatible strings for the Maili SoC PCIe QMP PHY.

Maili reuses the Hawi QMP PCIe PHY hardware, so the compatibles use
the two-item fallback format with Hawi as the fallback:

  qcom,maili-qmp-gen3x2-pcie-phy -> qcom,hawi-qmp-gen3x2-pcie-phy
  qcom,maili-qmp-gen4x1-pcie-phy -> qcom,hawi-qmp-gen4x1-pcie-phy

Since the allOf conditions use 'contains:' to match against the
compatible array, and Maili nodes always carry the Hawi fallback
string as the second compatible.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
Chnages in V3:
- Adding the falling back relationship between Maili and Hawi as per comments from
  Jingyi and Krzysztof.
V2 patch link: https://lore.kernel.org/all/20260831-vdev_phy_next-20260828-v2-1-08fe5dcd4b86@oss.qualcomm.com/

Changes in V2:
- Rebases to the latest code.
- PCIe controller dt-bindings: pci: qcom,hawi-pcie: Add Maili PCIe compatible
  change is already merged, so dropping change
V1 patch link: https://lore.kernel.org/all/e5516c61-44ea-4224-9da2-1694eac10fec@oss.qualcomm.com/
---

---
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 91 ++++++++++++----------
 1 file changed, 50 insertions(+), 41 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index b353b7bfb839ce9cc43ecd9ef96d174a7750b35b..31ba711bb114a43647a242520acd6c2e42ffa12c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -15,47 +15,56 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,eliza-qmp-gen3x1-pcie-phy
-      - qcom,eliza-qmp-gen3x2-pcie-phy
-      - qcom,glymur-qmp-gen4x2-pcie-phy
-      - qcom,glymur-qmp-gen5x4-pcie-phy
-      - qcom,hawi-qmp-gen3x2-pcie-phy
-      - qcom,hawi-qmp-gen4x1-pcie-phy
-      - qcom,kaanapali-qmp-gen3x2-pcie-phy
-      - qcom,qcs615-qmp-gen3x1-pcie-phy
-      - qcom,qcs8300-qmp-gen4x2-pcie-phy
-      - qcom,sa8775p-qmp-gen4x2-pcie-phy
-      - qcom,sa8775p-qmp-gen4x4-pcie-phy
-      - qcom,sar2130p-qmp-gen3x2-pcie-phy
-      - qcom,sc8180x-qmp-pcie-phy
-      - qcom,sc8280xp-qmp-gen3x1-pcie-phy
-      - qcom,sc8280xp-qmp-gen3x2-pcie-phy
-      - qcom,sc8280xp-qmp-gen3x4-pcie-phy
-      - qcom,sdm845-qhp-pcie-phy
-      - qcom,sdm845-qmp-pcie-phy
-      - qcom,sdx55-qmp-pcie-phy
-      - qcom,sdx65-qmp-gen4x2-pcie-phy
-      - qcom,sm8150-qmp-gen3x1-pcie-phy
-      - qcom,sm8150-qmp-gen3x2-pcie-phy
-      - qcom,sm8250-qmp-gen3x1-pcie-phy
-      - qcom,sm8250-qmp-gen3x2-pcie-phy
-      - qcom,sm8250-qmp-modem-pcie-phy
-      - qcom,sm8350-qmp-gen3x1-pcie-phy
-      - qcom,sm8350-qmp-gen3x2-pcie-phy
-      - qcom,sm8450-qmp-gen3x1-pcie-phy
-      - qcom,sm8450-qmp-gen4x2-pcie-phy
-      - qcom,sm8475-qmp-gen3x1-pcie-phy
-      - qcom,sm8550-qmp-gen3x2-pcie-phy
-      - qcom,sm8550-qmp-gen4x2-pcie-phy
-      - qcom,sm8650-qmp-gen3x2-pcie-phy
-      - qcom,sm8650-qmp-gen4x2-pcie-phy
-      - qcom,sm8750-qmp-gen3x2-pcie-phy
-      - qcom,x1e80100-qmp-gen3x2-pcie-phy
-      - qcom,x1e80100-qmp-gen4x2-pcie-phy
-      - qcom,x1e80100-qmp-gen4x4-pcie-phy
-      - qcom,x1e80100-qmp-gen4x8-pcie-phy
-      - qcom,x1p42100-qmp-gen4x4-pcie-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,maili-qmp-gen3x2-pcie-phy
+          - const: qcom,hawi-qmp-gen3x2-pcie-phy
+      - items:
+          - enum:
+              - qcom,maili-qmp-gen4x1-pcie-phy
+          - const: qcom,hawi-qmp-gen4x1-pcie-phy
+      - enum:
+          - qcom,eliza-qmp-gen3x1-pcie-phy
+          - qcom,eliza-qmp-gen3x2-pcie-phy
+          - qcom,glymur-qmp-gen4x2-pcie-phy
+          - qcom,glymur-qmp-gen5x4-pcie-phy
+          - qcom,hawi-qmp-gen3x2-pcie-phy
+          - qcom,hawi-qmp-gen4x1-pcie-phy
+          - qcom,kaanapali-qmp-gen3x2-pcie-phy
+          - qcom,qcs615-qmp-gen3x1-pcie-phy
+          - qcom,qcs8300-qmp-gen4x2-pcie-phy
+          - qcom,sa8775p-qmp-gen4x2-pcie-phy
+          - qcom,sa8775p-qmp-gen4x4-pcie-phy
+          - qcom,sar2130p-qmp-gen3x2-pcie-phy
+          - qcom,sc8180x-qmp-pcie-phy
+          - qcom,sc8280xp-qmp-gen3x1-pcie-phy
+          - qcom,sc8280xp-qmp-gen3x2-pcie-phy
+          - qcom,sc8280xp-qmp-gen3x4-pcie-phy
+          - qcom,sdm845-qhp-pcie-phy
+          - qcom,sdm845-qmp-pcie-phy
+          - qcom,sdx55-qmp-pcie-phy
+          - qcom,sdx65-qmp-gen4x2-pcie-phy
+          - qcom,sm8150-qmp-gen3x1-pcie-phy
+          - qcom,sm8150-qmp-gen3x2-pcie-phy
+          - qcom,sm8250-qmp-gen3x1-pcie-phy
+          - qcom,sm8250-qmp-gen3x2-pcie-phy
+          - qcom,sm8250-qmp-modem-pcie-phy
+          - qcom,sm8350-qmp-gen3x1-pcie-phy
+          - qcom,sm8350-qmp-gen3x2-pcie-phy
+          - qcom,sm8450-qmp-gen3x1-pcie-phy
+          - qcom,sm8450-qmp-gen4x2-pcie-phy
+          - qcom,sm8475-qmp-gen3x1-pcie-phy
+          - qcom,sm8550-qmp-gen3x2-pcie-phy
+          - qcom,sm8550-qmp-gen4x2-pcie-phy
+          - qcom,sm8650-qmp-gen3x2-pcie-phy
+          - qcom,sm8650-qmp-gen4x2-pcie-phy
+          - qcom,sm8750-qmp-gen3x2-pcie-phy
+          - qcom,x1e80100-qmp-gen3x2-pcie-phy
+          - qcom,x1e80100-qmp-gen4x2-pcie-phy
+          - qcom,x1e80100-qmp-gen4x4-pcie-phy
+          - qcom,x1e80100-qmp-gen4x8-pcie-phy
+          - qcom,x1p42100-qmp-gen4x4-pcie-phy
 
   reg:
     minItems: 1

---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260903-vdev_next-20260902_new_post-dd80ee705b52

Best regards,
-- 
Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

