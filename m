Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C98933B6DA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459372; cv=none; b=ddctyPuneGjHbL/jw1X1/SrKaR9QUqcZdHKY6N2YD3TTpWHTTuGYcwRjY0FC3UYdh/PlT/dDEV3L65LrCz3x4G1bfqx9DVzktfqSDP/0uCq03tvHraHP/OaWcxuQj5hkzhX7fLSEGij4ZgNv6dzgUkqzB3qt8xqGbi8IDVwVA18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459372; c=relaxed/simple;
	bh=52OWS8LnN4THzQP5thj4aW0prdXfz1T/78kDd7/irDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SOaMzeiI9kUJJiSk4dd1PCHOW8T7gvkhW0QSWFaK4AHfxe7U/Od4IKRG0UAKChiM+pgP5x87IfdtsRkIj+WnwR0aJfG+wiQ4jOhvPNkjT1JC7xEbtlUQ5pLP9pMZdOgG3T6AfAcO9fBFijYjXvMdDYx7ZQfv8HmYn+khNZHAWD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFYWjSWM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XJGxCV7g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFYWjSWM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XJGxCV7g"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZlRH2792529
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zFKzwv/5iLe0kTyFD7bp1j
	KPAZuYELnFQL/r2x17H+0=; b=IFYWjSWM5AfU6o0+W+L5/MGQq8OEVBe2PQu38/
	Oa1frtjQnwTIDJP5gvmwiFckYN9cQwa7BlliaRCSGWqVtc3SWTK+Q7Wsba8murso
	flLWVQcZfN7LpIOeVXdKpW+jo54C7RT6/IebuI8ffV4vH/6kROLRbdpHWqVGqNrZ
	U74xNHv8iEoU0CNiCRGZpoxpMTnovRqazpKvuw6zGfk4GxN+Xs/oAjgkbsyyuxDs
	MRo0kOnvR2JOXTGzEO1Vrgmbl3vGNWWCKCCed7Ut/XpePFImTI2DSScNy4yopD21
	zkmqIb5isFhHj3k1boVdkOn9TFzjnUCNtLlLQsBcKlHXCfjA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtm920-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:02:50 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78f4d6af128so829374137.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459369; x=1790064169; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zFKzwv/5iLe0kTyFD7bp1jKPAZuYELnFQL/r2x17H+0=;
        b=XJGxCV7gRAPllOErpL6KPMpIGhCM4EyU1WFvRWcp/a0VQn1Qc2LcuCInrayHraCckE
         ar78vv2c29klypIg9UsoKHVXjS4nQgPiMgTNcXLvAQ0OGuBsIveK47p11pCgtvycSGGy
         EQId/AazA3WVTdEBQ9jGvFYDKgGJmqXajSr12vqugBYlnZUpq56AmY/IPnGa7Xp4Fec9
         HhVRTvUOePZFDd4YMWjU1PDEKROLVBJUBIPAu05ar+qu7LVKJnCwlO7OR+w4BUKVyYVv
         0C3n9Esq5PS27xnRaqQC3NcGBz6zKsvuNSg0BwHESwCWaQKI+wZJvs5KBZL8jcAKqoNl
         fKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459369; x=1790064169;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zFKzwv/5iLe0kTyFD7bp1jKPAZuYELnFQL/r2x17H+0=;
        b=XDAd5yi5V/5p+IOQfLahzf6/azabTwjzUaPFLk4JNN+jLfeY8Qf9pTgQIraHdJE7wQ
         452qMWTbFNq2B7gtVx9py1m+RZ7toEiQweE9dVJe7ApXM1ngztTkuY5V88/0jAAqRARR
         puAU7tslrAWadvQxt2UjEV19Y/VXYa8BQbiMazZ/7DqoXzIsvbOUpjBU7bYsIx+i2MeY
         yZ7cIrIaBjRYHqTOC+hEyu0n+CuVA6npcQxjZ1PKHIk1dpU6au96xAfUUFZglQ5vkzdU
         U8KXEZl/ULo1sGwsOzlqS46Y5jjW9IDjgY7xQm1UyXupSINxJuzbKhDYE/gHU/F7KwLA
         TjGQ==
X-Forwarded-Encrypted: i=1; AKwUvByuTYdhgkoL9bBUwf7G7BfvPFJrf4WxrsBqdbOONx3P79SwieYc3i9tEL3H4pPrufQha7A2lJYxjkpe7CE=@vger.kernel.org
X-Gm-Message-State: AFuF++mMN3KYCx95tWbEs5tl8yHy9n6tz/qKeSY2ocud1REdQYiW6pUd
	4fmDBMQbUoBU2rFxDvqVjR0wdlBuVsuryvvJXRHUxpf2koUoTv3rssTfifoxQ4dVN0NJlkEZ6T8
	HLfMGHfcBL/czca/kv1XVrpPGPt5P4T7EqHSBGECsUz+m//23+d5SGe3y5cDec687+R4=
X-Gm-Gg: AYBFou2Xiy0miR6v7JFWCld4aNPpS/OkZzd9Lua38+RCGImNBaTRPxtK9oOytGpXm+b
	BZ6gyhuCH3wNx7tbZjMsa1rYBls9EnAckK5gBdPaAWaDUnBqFfHjgZTySPoshLvmK5zjmkbbE0q
	3GS7lXj8TDRwy4PV45hD7reR7w/GJlrWCMfd/Dpl/fFbuFL8UFFEM8xijHcEKc2zbMJ/1wJAsyy
	MaIWl0iVrQX3p3IMs7q+RkuY5bvPl4WgaviFSe4sZMDzJIsGN/2BxxjysXhQPC3O3F5hX2MnJcM
	hy14hHrkDfZrghUdGvXabi0px6aH481oYhJ/LGul7m3BH61miiYN1x2buK0nGhHPKHYj4utxQ9I
	HinMmB3d8
X-Received: by 2002:a05:6102:41a6:b0:777:4e99:6f84 with SMTP id ada2fe7eead31-79ed3794da1mr32207137.1.1789459369310;
        Tue, 15 Sep 2026 01:02:49 -0700 (PDT)
X-Received: by 2002:a05:6102:41a6:b0:777:4e99:6f84 with SMTP id ada2fe7eead31-79ed3794da1mr32146137.1.1789459368728;
        Tue, 15 Sep 2026 01:02:48 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48556425e9.4.2026.09.15.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:02:47 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 11:02:41 +0300
Subject: [PATCH] arm64: dts: qcom: sm8150: Use SM8150_MSS for the SDHC
 power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v1-1-c4f3857204fd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKD7qGoC/yXNQQ6CMBBA0auQWTtJi6lWr2JYyHSQMWmLHTAkh
 Ltbdfk2/2+gXIQVrs0Ghd+iklOFPTRA4z09GCVUQ2vak7lYh2FWfFGOqNFbZ1DDSLgoY1TFIRe
 cAkoKvCL549n1vifnGWpvKjzI+nvdur916Z9M83cA+/4BRdMdRI0AAAA=
X-Change-ID: 20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-c8375b8bc58e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=52OWS8LnN4THzQP5thj4aW0prdXfz1T/78kDd7/irDc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqPulwHkfYoggV+VdpxYsQe70bjox9WQO4abDx
 i6FRV4PcsqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqj7pQAKCRAbX0TJAJUV
 VhcOD/0av3hwj0UPUJ9e703e5feEMCEx7U+phqXvXXv7Gq28E94n5JrG2CR8YlJkiZ44tYa6rWz
 gvf9stzxuOYol9iJfcSaoTsaZnomc+i7NoFM8ByIluzhGKzcW9GDwjnhmx8GvObwdmPxb3qS84E
 hbFMceTfSjkNcFmm7l/iboXSUjgpaxB4kaRN6fcAd/NLzZH5vtgNJ2GyQJ/pflHWV+L8SYYCKTe
 waUgFkt1n6JthA/YRZCL+wIZYafu/+xhVGXkjhj+AY8duvQxcWYtsUvDB6tW1hfZIuy0MyhG5OT
 EDi73k56cruu3WwwamKogpsDb2obszDR2wssCOgxZ0OhhZUjWV/H6uIMPfiXs+puf81TopH8W5D
 qb4WrWPnl/BfjVT5f66OiFu7Kbc8TEJ0PxAUmvXWVVvwBGPIB6j6TuyCHEg3iDIkfzzXGc2rump
 O1Yw1HnmwJHfNSj8YUaT8mieLAa81IAIjj6ETZj/r2KtE9ZbpktCEqZgUnYPfNv5EqpW2n4Qzl0
 JvYBnC0Un9Z3y1yBiFABXj1+MDgzybLYlxKW4du/eFdnbV4VE5YakST67FpflUouKHkQxS1q08/
 UWX54zpZ6HfZmlZEa3N5SSNZBhP7AWbRYRwXKBDilroZb7CF6XMWEZY9lnDip5oXq9RuRyP/eyc
 Y2hXWS/t4d8nmKQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa8fbaa cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=G7FdngZgBNYIGrhQwqgA:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNCBTYWx0ZWRfX1SHWHGWAoN7h
 fJtFgavJwugKDyPeSbVXulMS5bKdnmOWgBbq13gGpBan7wIlkV1FDbjXbVxCYPaN7TqIMkEXWT7
 SLH6LI21/uzIsMjq44oMW6o2WDsGvEt+pvNvFGel0r/cdK2GGOB2KcKDISwGDF57HrHdi13GRvh
 Lt9X3LQ8NonrIlHwhRz5+MEBrdhWXz784LvKBkokF9neh8nFuAm+FI/1WepyB/W7QlijCAhbs4T
 b99l2y/ZSWDMtclWJ93NUCCSemuGEOakcg7iti2B4s9RiJzN4zK6gRDpOb3qrTrJYfBV/ixUBzO
 JYRlTXEK8AdrtefS5wzgvkmbpyrT8io7ppUz8TmvsKhMHK9+KxBQE8Kw5NWRGahOZj9XPImQVYP
 xssETlcVMl1B1fx7lD+8I7qKe1CJ5Ss7J5pI1Z40aHUgD0Q/hP7iPLoV9cJSZoEmjaHasnQ+hF1
 ehlrOHBHDiN5b/RUJrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNCBTYWx0ZWRfX6cYPkgUQdj63
 Xsre6fJ8OeJ21lNNr2umlEw0H/nu6twU8758WHLbwM9bjjNOfEl7C7idqaBuUwMLtbQu9RRi5Bp
 1cvs8dfVZyUYQCqOFpKYm4f9CCbGJPM=
X-Proofpoint-ORIG-GUID: tpFvcIaIh1t6iM5A-ru4VjsxL7HkI8em
X-Proofpoint-GUID: tpFvcIaIh1t6iM5A-ru4VjsxL7HkI8em
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150114

Replace the raw power-domain index of SDHC2 with the SM8150_MSS binding
constant. This documents the selected RPMh power domain and avoids using
a magic value.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=45
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 94a3b02cb289..ae2c259e8476 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3574,7 +3574,7 @@ sdhc_2: mmc@8804000 {
 			iommus = <&apps_smmu 0x6a0 0x0>;
 			qcom,dll-config = <0x0007642c>;
 			qcom,ddr-config = <0x80040868>;
-			power-domains = <&rpmhpd 0>;
+			power-domains = <&rpmhpd SM8150_MSS>;
 			operating-points-v2 = <&sdhc2_opp_table>;
 
 			status = "disabled";

---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-c8375b8bc58e

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

