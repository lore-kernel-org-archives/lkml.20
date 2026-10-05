Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2D547FB1A
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203169; cv=none; b=MO4jRXdTCP7BFDKK2E1hViFA9XRJ9yO84NMxctFg23aVXHiI3RaJpBsW+vWMRayEzdCZCHHDFczxJyuWPUUMp8w/v/0ozvCjdeBi0xDKeDok+ofwCO9QJWDAlg5EOOrSTP/eOcdiN/GyHdH33GqQ0PB3QjLkXj3oxkQpieOgnNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203169; c=relaxed/simple;
	bh=vJQuhX/oBX172FGrYO7vTJtYeipTicxxvpxXEYh0ojs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nd8pazzSgXzTYHn6hXa9xF05pStI5Mx3mrOHzihFUDMCtRyf7yKR2bTQGRbFRYf5c11u+yosTrA3CMg1MnnIYgxGrpmQsCDy4dwDBOWwiRQp9ZciCrlnRWgAuczJGkTbMGs0TsxCebLs4Kcs7pnd4UiBLWngDmeZK84GLkDFrXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RIrkrTfG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZERHzDq6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RIrkrTfG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZERHzDq6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFLDw1068074
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 12:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=; b=RIrkrTfGelOYcksL
	6SSuD/FSnKgYiewUFba2LpasulhJ1iUH3GQZAGvZiq6iXoozINxLiHxR79Xnr7ga
	IMmhAuQnSK8qCTf31sYhPvJ8n7OhEK9YNUj1pWeI7rWbdy0Zky7S83Btlzwx8B/i
	g4MoH1bXMlRRxO1fT7SuulaTgAB7Li/JJ1mdaHtpOBOq4V1MYjkZXYXbsc6D4JUj
	TZgCrpmoIuEqhB7R7Hi4XHTT+VOj2sABmvymBfe3JfvAyWYxQR7Hr+G+3dRpKOB5
	W7MwCMHKFZXYki3dbt4BTaWWAzsCTZmDNMy6i3asToD7zih6+AFFrHhqQtQYiVzM
	xGtayA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08npa6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 12:26:06 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-806004ec379so2485819a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203166; x=1791807966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
        b=ZERHzDq640eBjcXgM8LSskJheqCdUX/okLoVafCS8dbVF7UWPS7P7VwscNBp9w5w7p
         hr502sY6J0qR6H55IqgjFDYhrzBgrJIOQisLze4/OYh3ee+b1R9nR9QE+AKOvKtMqskv
         2Hj+jquBHlfIbs3CgGSkAM3bJ82XQV+WJWV8u/P4Mr7vEOpyttjnfj028EZxFcDwLrVa
         mwZIK8W2xQ1pPmvY9jyqwKOcAnxm0nHXn8jiNFzPzNKk+52vfIP+i2YaKEukmWV0akGp
         DZYFGCSfHwiT1NkT88T63fS+AKvIskPmZ1bMOXQRKNG/RKRdXM2xcxhjKvI4d6sjRGGf
         diPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203166; x=1791807966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
        b=ofmrT/sVHbQewlj9xEiK+ELzRiT6epoo74guQJaTnpXWf3amKyH6nx1YbXYKl2vTo8
         fHmXKsILx8Le9ITCHxYWcxfaMZsnIHDybOM5JfY3DOBHjVXFSMjo8tRTUKV5WrpkJqsj
         l13NqOS9lrvf3OY768X+Lr9W7zduB33nPvnKl0ak2qCFk7x7xlNoI3XBURBV2DHp9+gw
         52MWROZ7PhToZl9GNf6y1OQZ/g1aHKdkd1/3V1RtKNhluqjYl5eHmQlod1/ZgBTm85Dq
         ShSvsdZDLWOzvdG0AB8xiEWoY67PWwG/pREU/WcP7sXeqE6wqPRCjHIAucXw1rRINLYs
         JC5Q==
X-Forwarded-Encrypted: i=1; AKwUvBz2/fsx0MVYiBfkd3NupeBDtK6rLXSbRHPYBAeoW7ZnYWzny0GRMIuTRX+fLciGYwUY6n9v1lGiRDnRjuI=@vger.kernel.org
X-Gm-Message-State: AFuF++n4lmb9l037PWWG+6fdYl89tHZhThLDV++dV2MulgG/NlJVfxox
	KdhqfuUqMi/F7aUlhZTGyBR/RYhLP0jI7ulrMOKl7rr6sPH/A+o1rUtxd6xh4XTbNQVv9RuJEk2
	wmE6KcezHZSwNxZEoAl5haVZBhfd4GsabqqY+JwAESkm1fiiRDwtAZSD6Pv861cnS2W4=
X-Gm-Gg: AYBFou3q7jSMAk4bsyTXlgWRJdp+FxCKAEH0XL2ShforSyaRRMqqFWAW3G7tbqa63zL
	DrhEtX8WBO2407kq9cTNpqyiIHwbtfzb2opItsP2qTu4oODuD7sp3A4MeNKTstG3TpMvNgVrbgh
	MZaQfwBcaNxwx9fwlOkEeICfYZZNdodcGOaQ557YBNC1xhpV5i1G9J9OOpmN96egqecdgClnmnR
	HxbBktzaCAkrxgPlpYdC68vS29y7CKzNvfY8bmD40d9ngoPGrmlKLm9wLqiSoroibnPFZG3kbrm
	gukeC1tWCInFXae+GPnnaYTAIoBYKqZvNJsKWzuGv12X/jj8Q09NwBsUIJWUedTHX05zhYyH/02
	2o+z2rAQBEURlUmnDZQgsd1Edga9bVBYmYQ==
X-Received: by 2002:a05:6830:82aa:b0:7dc:c7aa:22c7 with SMTP id 46e09a7af769-8227eac1882mr11375633a34.0.1791203165897;
        Mon, 05 Oct 2026 05:26:05 -0700 (PDT)
X-Received: by 2002:a05:6830:82aa:b0:7dc:c7aa:22c7 with SMTP id 46e09a7af769-8227eac1882mr11375611a34.0.1791203165396;
        Mon, 05 Oct 2026 05:26:05 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:26:05 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:13 +0530
Subject: [PATCH v4 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-12-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1198;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vJQuhX/oBX172FGrYO7vTJtYeipTicxxvpxXEYh0ojs=;
 b=fvscyC5ovPVUh2ckA6Ul2zePjK5XpmEJH0PrT6/u/G8f+7JQFD3KrBjqFi7Abo9fV65erPpYq
 n3zJF2DyoGmAPoUsrwO7Hl4syaepNSkZbaEH4IdASnDYNJ+rObeIVns
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: ymPRMHyY9gqwLMfRh-BaxBYB-osdLHTv
X-Proofpoint-GUID: ymPRMHyY9gqwLMfRh-BaxBYB-osdLHTv
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac3975e cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Mdvtvp0LKpy3kcB40AAA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX33LJgHlxSCBa
 t/a+zfiEGv6BbHSvk2nXBDvXTS88/UAEMOpJUYfqyA5nV+fFapCflvMr7rQJFTOigdFCO2V8gSc
 1NlwOFR87A6aXLW89TMWMHigJKltXNs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX2BqZu89a2pz1
 77Y1cQpV8ZHRnso5USH96SpH3lCo1ku8uLxoWjU27NrSKps/+8FDrNyMOImd4/1Fp2+yetO0nzw
 WhIsY+6TbEcpsgRrn7moodDxp0dEuadXycyzDe3yJIza/iHMdG6keVBRxW1MRaqMNqtroAWfrX3
 /ptk+zGxI2jShEwI4Xiv4Usk5ML/QLi0PTY0WBmsNxz7X3n39AdFvslM/3RMafMF0OtHTCa2Wj/
 hTe+9zZRTdvpeKYiqPahCJ1YYVL+dxrug66ZskT2DctJEoxsApZe6Uev3FAtO7/r/IiDhgXlSKH
 XuEzydFH4tbJ6CFF0JLjhQkPjsLLKdrt9pTZF+uFkwoRjqIlM3P1B3v3AfFsy5EHUlA+ppEoj+e
 mvQqGpNUlX/YscSl5GK2hx/h3GBWlS7JuSBHLwSYVJZkuLl1d2Zww4XwXObPicKKtgPF3Y+eqUL
 XMAxCuPOEjAXOG8BUKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for smb2370
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
index 1e02578e4ee3..4809b3d8cfe2 100644
--- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
+++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
@@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		sensor@4700 {
+			compatible = "qcom,smb2370-bcl";
+			reg = <0x4700>;
+			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2370_j_e2_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2370-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

