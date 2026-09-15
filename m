Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26FD48EC8A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473829; cv=none; b=EkF2cX7Qzpz3Nwhk7lHyGWbayZP94xquXWEEcY7WKKNXOA5NtcOk/V9Tb7+pCZ4IA+VVL50liYOvWvTaHcHmDvsThFlUBdUuK0/gbIRfrd2zX3w3oXDRgAxPsHpkybhUqJwi/i+yJ/pCtIjMbvGIk4narLBROImvjJ6EISn6cMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473829; c=relaxed/simple;
	bh=USeaCK6kS59EWDmOqdlzsSzG6qUEuLIBdPOA9GEqXPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H1NOdccGqtB06D2dFi+ZSOY+w6VYqoy4CZbJ+jrhqN41mZgMx5QCtDSr+i20faOPVbC1jE9Xf6IkSUgiK0kcSVFw4KpZAMHekD+GKLGwEzadWfbfn5N2y5fQcq5u167iPrbIgwY51axx2Avr72ZAfDHO8d72l9PAA4E7CBJNv98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJMm98dR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYl3rB/t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJMm98dR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MYl3rB/t"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hCiB064544
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	khS7I5pOKUK1oUxYv+yyzdc9kB+GQQ6uJQXBiHHFqm8=; b=GJMm98dRDi1ild3v
	G3ZyxNh3T3CwhZ50jDdoFq4RLDbxOUVnHFLDPuukT3tEuEDzPkOcTZfJbtjkjKis
	VfJw3iA9BMQGMhmuthCoxN5sCsxAmTYPay1qMtUF0+Cf5b80l3JwL7DW6MBuhxxn
	wjjLL1CIsWwRPM+961xK/q4QHE3eq7U/4NE52jbE5f8VmDe99zvuRQtFje35OE5i
	6mhsKn5xWZoqUGwkcUJrTxpddyHVc1iLQY0fqWAfjoZeL26ikjblEelrc2pPLUoY
	oEwqKKbjVfE+usmBK8eACy7fqTTDoJ40t9rG4x6acR/slkmKdFGMogHuVHeYu3Ub
	8RwEaA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41ve8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:46 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c82fe2ba8aso4976839e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789473825; x=1790078625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khS7I5pOKUK1oUxYv+yyzdc9kB+GQQ6uJQXBiHHFqm8=;
        b=MYl3rB/tele8jTiUizu7EmarZ7w0vIoeusJ9vqaWqXmYH08uVkBONYJlha9GfiC8g9
         /4YkVVNeJtjDWhm8QyLG2zd/kFwjsaqEpDeeg6AMDSS1+04XD2GuH/A2vg34efAQvO3/
         6Rhnt+l7qD4zGaqBtbGlcwfYasaadzlqx5M7N1X/c/+oqhESZGqi4rpfq9lnndwpOVWt
         VfAQM31n5jqEwMmBGZDEKVissM7qjUa20eJTHjK3psBhDZkY4AcfCrLi6T8mu0D/Lz52
         ebjGom1ekdbRGj6/y3W1c/JplJ7aRyRhnXAUnQQ7BQRTEypzAmctrQRd/ccAS7VKW2Zd
         ox+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473825; x=1790078625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khS7I5pOKUK1oUxYv+yyzdc9kB+GQQ6uJQXBiHHFqm8=;
        b=Iso631ACetjPhKami6eDJetbbGuWmrUlI368SyBfWjQZg2FU3M0uD9libad/1yeKL3
         WsuLlJtEz8s9Wb0xpCFIJQsXI3rPSMUUqNmwvMaMIGZ1xYw9TEKViwgsnRic35vK4AE/
         ziwrWSvc4E9Z9omWQK98ASPjeEx14d0HxHoS5MX8Th9y4ONshz0atwVMYuTOf+kgw19b
         OW/SpbMHXZHAIEE3rswXX8oSXH1e8YYjreWf0n57O/AIqpgDEtHRv6TL2WGntztj0e+2
         Tu5mhNkcbdUcvuB11omrmAFRJ3KPCHJVu01nCqgaRhaIl1eR6pqKVNXsMKzpONVzvIv4
         ruTg==
X-Forwarded-Encrypted: i=1; AKwUvBz52GbrjjXY7tU8ihBYiDF7IykYPXHrH4h9ZULAjN8PCtoer9yFCq2+qgFCLg1HPbd1w12WeMy/QIg0j0Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nNJzpCQWkOjveI+voUzpQBCp6COfsnYHSWnNgHA3u2VAmjiowk
	vrmAXhTXc4xNLUIxVscX50IgcwGw0lzkLsEYQP8ghjOgh3TL0Hz2Nly4yiLByvT89uhUbHTaQqs
	RASop8VgHilqTJaPzBhtMYsIo6d8WYdSe1u2D4ARs5lbl0tfA4VWn7y+3QKweXq7Naug=
X-Gm-Gg: AYBFou37Ntfj0V1Qv6/9AZfxyswgjJSX8R0fHGd2Xyj1ldXiatqnKKqUuEfZmXzPl6h
	fKhxpHeJfsi5BFU8cCckrWgXzsz295BCfZ6wFNgjmbNVemzcBKuzXOYijs4qQtPx+E7FpMukQFZ
	Ob4FFz3iv17ryHg+QK6R+nHXRwS9GxsaThK6tWDEWGY5v9BeDexI6onD6aGn746Q1kjMlkMFBlK
	ggSxocQtPxcW1gUAlDm+MFF/IDxn25wsNKBl5mgpnl6fNvVP+8iKvfHcrU9+yakbdNGnQn6KfVv
	JVbWkPc1BPKKop3BQCR8R57fNdI1sW+/xGvlBbWlE/8DYs8lU3+tHrCEi7Y29wSMoTToh0pqENa
	MKIgQCXY=
X-Received: by 2002:a05:6122:469f:b0:5c8:2a47:b111 with SMTP id 71dfb90a1353d-5c981d5aa78mr7873978e0c.3.1789473825222;
        Tue, 15 Sep 2026 05:03:45 -0700 (PDT)
X-Received: by 2002:a05:6122:469f:b0:5c8:2a47:b111 with SMTP id 71dfb90a1353d-5c981d5aa78mr7873885e0c.3.1789473824437;
        Tue, 15 Sep 2026 05:03:44 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm34247401f8f.20.2026.09.15.05.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:03:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:03:27 +0300
Subject: [PATCH v2 1/5] dt-bindings: arm: qcom: Add more compatible for
 Eliza EVKs and SoMs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-dts-qcom-eliza-add-ufs-variant-v2-1-86d72a2a8f47@oss.qualcomm.com>
References: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
In-Reply-To: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1457;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=USeaCK6kS59EWDmOqdlzsSzG6qUEuLIBdPOA9GEqXPI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqTQWHbKAOS5RVDFMCOysgQKwcd+J1/viYElJC
 6mP4eoA/HeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqk0FgAKCRAbX0TJAJUV
 VlWTD/41UFigp5E1zNiRXfL92OjCXddzKnObtG9Q31HlKhbVWi6fDWwLsumYjFYdQMI/TIz8Qh5
 T3fNoksuCqeCLIL4lQVcIjiKYXd4TOYwXJJY7Rp7fbv8Z3mE1dBH2KMg+nvHsGxEiCUfgGPH5BH
 ziy6q2GUWkgf4OXboRkiTLpD9dn8STBaSUm7ZaGaoC8JCDSL27LPBMp4pou1jCbjg2gjOJedW8F
 AXtuzLEk4uVhH6qesJWXB3TiD2SeF2fMjiUxMDtPpT4IcXMyFxeijKl4mRrbYa38bjpRvGOnH7i
 pb5Bo7joJRX5XSl53ZK2jjnEVheFvA6Ml/+ocIsmqlZJ1W8ihxEQr/YXpRji5wz9TXXGMknbLM/
 hw+3Vo/UwL5kQ6kGmE+FziKhKP3s0IO16ylgLE9k3HD3/6E6G9Ibp3OWpOMMjhyhcovOkyOfbG9
 FbepwWGC32cFz6IzaC6a7aKtdT1AYdaM6QFRthFAbjXZkY3nO8P/eYRsMBgwh9g10OCliJICORY
 DkffFvNQ2d67yoLQKLDXfl8FUXE6W0oLi8PTitYZXso5UpjsQlYpuQzBuhdS2jKZo4csj2lEea+
 BTCYF09+oZFQYZUbNa5lLxOUWIDeEWwT0bbdDh1zjG0ZRCbQbwvOy/kF4sP7OdhRM1mdHPb0gKa
 M78uRlnANA89Meg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3NCBTYWx0ZWRfX39F620MVYcWa
 dYJbO13uUMhRNI+frAQz1CwvDeyzcIDrZZC+ItaE+xIgFWUV7y9gL8p8w0GDqHOclqf3/yJCIG2
 7TVm3S5tELQ2uapWcq3m1U2nM/Wifkhl/usnWzllT5cCriMpzCPO3NqxV9c36nNIJ6ltGXZBgNc
 gWBud3jlzB83oIMvm0PFpJCbIvSgGMZ8o5iFZrGJ4fAx6oT2ZL4q3zoGBBWbqx5+XzviDeMAkbf
 /C/hMZgTGivAAOoa4koshZzEstu9fek3c9TslLoT9uq4gYzAsaul3lNW+5rpZTvscUaNJMv6mMk
 Z06kuYr67KPyUq131hEJ4MQq+eeLb0gFfpwqPJmfDS4bM7HLIlAVZQdAgHgftzsu8AoO4FhRIJG
 nKQhjU+tro+1XqGdlbiemrNWkAKtwWlMJ7+GUKnSaVzHo5iKtrf/Wv/6yqwo8unTNDx22qS0ppR
 U9XMW0ASWYHkk2gOwjg==
X-Proofpoint-GUID: u6sORTue7kO43ROdTjxt-mLiUjo3gWUO
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa93422 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=l6ELImiZ1_B-ckXs1ZMA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: u6sORTue7kO43ROdTjxt-mLiUjo3gWUO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3NCBTYWx0ZWRfX538SJp9CkT44
 tbRvQb7oFY0WFdA/B8xvidJjR4eIC4BGjggmXdkJgnM9xwOrzMQjvY1NeJHXjCdYa0YZvrv5L/B
 wlO9TgyjT/LFIZS+V7PVKb1hCmWvGIY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150174

There are currently two different Eliza CQS SoMs. One comes with eMMC
and the other with UFS. So the Eliza CQS EVK can be connected to each
one of these SoMs.

So document the eMMC and UFS compatibles for each type of board and SoM.

Neither the CQS SoMs nor their corresponding EVKs have been made publicly
available. Therefore, replacing the generic compatible strings with
storage-specific ones does not affect any user.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index eddf87fbd0cc..1dd187e92b68 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -56,7 +56,16 @@ properties:
           - const: qcom,apq8084
 
       - items:
+          - const: qcom,eliza-cqs-evk-emmc
           - const: qcom,eliza-cqs-evk
+          - const: qcom,eliza-cqs-som-emmc
+          - const: qcom,eliza-cqs-som
+          - const: qcom,eliza
+
+      - items:
+          - const: qcom,eliza-cqs-evk-ufs
+          - const: qcom,eliza-cqs-evk
+          - const: qcom,eliza-cqs-som-ufs
           - const: qcom,eliza-cqs-som
           - const: qcom,eliza
 

-- 
2.54.0

