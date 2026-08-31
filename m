Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE346392807
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195446; cv=none; b=i8G1lsvEDmasuaIDa/lzNf0QDpg6qEz2rI7WVXx0lD/zWwtOQgJyq3VSFLDyx9cFeWAkRWtktQ6Pt0kee0QGKZ0CdhM/Z80jm7C0UzVUpE6TZ9S6l3jsqNRHI2K5K3wsSdxQ8YLtZM5Tsz491TWUB5e0lwXGJPlaMdvUBTn8EzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195446; c=relaxed/simple;
	bh=oELWqkmwsoza6haH/PioIO4100T5ZawOEUyQYNHAfK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FloEQsI4VD6+ru6NjtE/iVKq+qSRVuchDMFP8ZgBAGMo2U18swtVF66mIL2HMPbKRa90SSyRsh55Eylzi7VX1zVn+kJsYD62hAfRlp0mfrgvf31ihziYoFQ3BCfMvwIA1nAag13bef5WqcegA7KPbfEp2VqtMRQXEdd+W0sPuUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+rW9QHY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QeKfJRxu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+rW9QHY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QeKfJRxu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFpoXK3477005
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xzdw4ANgdb0JZMmtXD2iK8ZBkWdE2x0Je1CrCtG6Ms=; b=Z+rW9QHYKimjcI3V
	oO/CpTKIqA0Ig/hruD5f8t4j6U6+JESdoyizgIF41ZpFUxnTYpL7M27udU6xIqRS
	C4pz3zJxycnMtmIftvkVN5WYks7sj3h6hpKvVXo8lZZ+CejOl/ESGvL3NEpPLG1L
	92mCMN7x5NjmumCQe0FF0fthCko8RoIF4yjNO2g2/3ouwUFv2ao0cVyGxXZalgpQ
	rinT5q/VGW1iK+sdXwx0nOtvIaBZrnHz4TfBfuA87PRSabwqO4z/azj3/z9rIr3D
	vUqPpJ41b3p1Ytg03isOCMsLg18RtqWXK23Bqfn/T7j28zzabJSyDhNXzugR+JEW
	J1eikw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6ayj5aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:57:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936708f129aso474459585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788195443; x=1788800243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xzdw4ANgdb0JZMmtXD2iK8ZBkWdE2x0Je1CrCtG6Ms=;
        b=QeKfJRxu7vZapOiEcXfa4oNa+X1xck1mvkDEYfbnRVXVM86zHLT3MGlVfv14eaatx4
         ku6FksmNds0jTtOHfg9VQdBf4o8B+SNEJwN2W6UosH6coA3IcN9bNEpKJrub+3ceup93
         Z93iMx8zKDz+tgz16dtuNobG023Cl8E8hOAHBm3upW68di8yrfQJ9SIRG4d5I1ujdGnQ
         WAQoFzSu/GRJTqBzT5Jc87ggpF23aiUGWkjfQU69OeGaYvaz7KZQBrqxR+LetcXNXioA
         t5jXBjoygTx23FSI7CLykJy41h+gPnWQLsAJr/yvS55Qttaox3CiKeN/g1ZWhJj2C+JN
         asag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195443; x=1788800243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8xzdw4ANgdb0JZMmtXD2iK8ZBkWdE2x0Je1CrCtG6Ms=;
        b=DbXu0dSwp0siUpTDuJcBjm1ATn66fNHmYQ2sfwem5r1IOU120CWxcPGAKkRqPzEw5H
         pMzHAZVXSzOpEj108rNoN24pfmx5z7GcEr/Oy9K9jnIsqQ9+56X7l3XSWa73Rv958LaH
         q446gFbcw+ObXCEMY6nywlNgMduxjg+6isbW1pCCXr+ByxSUURd5+9Nb5U1slScHhiaF
         rNN11TLS0+eEmec8CGxpUyIR/Hl7Uq9qUI/pD99oL6DCyV19+0BFcdUk5PQFhwG4rFvJ
         Fr/SlpAajFk/QzH7PqeAOAyRG3k7CiBVgJtc+kK1fRQf2bcY6f0cQo1aFoDhlZJl5Sq0
         Re8A==
X-Forwarded-Encrypted: i=1; AHgh+Rqg/lHjhHJHir7qSLKcx2JtqyRmPelHbDWxvXBo0x8X301+SSRtLp7r8VMUs5xwNBoMBszRLy75+sM6D0Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lYxqZA0Sehnv4Q8ZLIszrrV2IBtk2MkPzjF/wCbEFuBJerL7pi
	LpsuBTIXVSYhShHHoT6TXZhWZ9BOMKFHLcSD9H+X9qvMlSNPQV76TVq8pGCzWYu7DTzDdK1bTk9
	Fe+4dH3Tpp+cdkNbIDmHigtP/aJxvsm23qzug6YYoRE9p8jlUXNB4B/d//Oml73IkI2I=
X-Gm-Gg: AR+sD12HgItB//1b4FwnLW+jy3n+M9Oiu0alhQxlyQILXKrAcsH5omtlZREvvaU/XSS
	CUGtWVT3Japi27NTRy7O8L15d6SNVF7kDkSq9jP93Nubra+g2yqC3YIy00bt8AnYaRs/DeqJIYa
	lkWDxPvb7DwLMtHr28n3gD9AB5XJOiwZH7gb+CWGCxC2q/70MvIGxEZ+Wei1FGgcOV7Gg7PD7TB
	ACCly31K8v5pLrin5dot3UUTbnjHmQ8wOLFM8DATI/WOX8OM4SnD6+6MT1EyYeqUaH1MqPuUCKP
	kjiQy8Z1+G7296/z3CgE6d0cVWZnytfn3yDv87VL4tsSf5u8gHBi7hyWXTqFHdAyNAzJ6ms6jiG
	I5/2Asw==
X-Received: by 2002:a05:620a:1a13:b0:939:2d94:667c with SMTP id af79cd13be357-93948103974mr353626385a.21.1788195443087;
        Mon, 31 Aug 2026 09:57:23 -0700 (PDT)
X-Received: by 2002:a05:620a:1a13:b0:939:2d94:667c with SMTP id af79cd13be357-93948103974mr353620485a.21.1788195442540;
        Mon, 31 Aug 2026 09:57:22 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm248426785e9.1.2026.08.31.09.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:57:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 19:57:12 +0300
Subject: [PATCH v5 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-eliza-add-cdsp-v5-2-dda8af2d2920@oss.qualcomm.com>
References: <20260831-dts-qcom-eliza-add-cdsp-v5-0-dda8af2d2920@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-eliza-add-cdsp-v5-0-dda8af2d2920@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=867;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=oELWqkmwsoza6haH/PioIO4100T5ZawOEUyQYNHAfK0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlbJq5T6qAv8D7olq/gmlWPFW/Y1nVREp7jVwZ
 srLcGvsWkmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapWyagAKCRAbX0TJAJUV
 Vo6vEACCLDSwEn7cA+QkfxJohXWCArq4F5Nfeyf7J10KGsN6zlpU9ImQerjngAAzJVP+pE8nVIW
 ZEfrZToG1iNqEaZvOEyBSDMoxA+oDJexPKlibGASRwfuWY9rlMDnq70nB/AYcV0i37qsnPveqqD
 qNyRPEWoIP2EJPe6I9+yAWuVTit7HZuRBIxH4CVywtQ5L50avzc4a1ryT5d+rqvtd/sJmNn+OLs
 JcU9f763vTiMJMRAV2J/05vm6oHIcFo7lblWijjUrXHywPMUBQIs/GtEV8b5nrWHidSANpnJCpG
 i1oniipq+MLsugf9IGlPVTP+Gb+sETPT4Wnq8ODDdUbNDG/EN6sWaIlSaLh3dKpdJtGhqwINzae
 UZKa5/dVIB5puJe5AqWeujcA6U6QUd5Y8gBmlx7F8I2+Bz7mSEjdyeEqcFUv7b7Chon8kZSvelM
 fVRuSzYTNaP1aBCVECXB5YKVnIPNhDgBzCVmejy35aG5OCaohk/QTkhrRocUQHnx/eY91gzs7RB
 q6ms8yO3sXASPUmbSaeM7oxtpxLyBnHeMgTSGU3otoLsG0B1qNvAXhVYOVlIOvSBZUw5RKSFIh3
 StF9c+N4FzmYH+nUr1prdSWiS2rpC+JvTp6QS+aC076TG0dMSbQZqaRnfyGQewDoyrcUCklpKt2
 QDtN/nsdUdhmrjw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0NiBTYWx0ZWRfXzZrBQ8vDu0qC
 vtt7BQ/OJ0fy5MG9WPU/76cIvgQMZRW+y+adB5i+nk9WsT7BwUmwab/KuKHy9XvCFoDEH9TN5WX
 j0yOolHdLr+yNlL6YjG9Fjk/CJIYvqg=
X-Proofpoint-GUID: Hk8zNJD1fYBN4QqwsFSRaIOZo59_WP70
X-Authority-Analysis: v=2.4 cv=CYE4Irrl c=1 sm=1 tr=0 ts=6a95b273 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=F2_fgvKzopLLhFp2320A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Hk8zNJD1fYBN4QqwsFSRaIOZo59_WP70
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0NiBTYWx0ZWRfXyGO5pUPbB/8H
 ofUFNXCDK4zTORCKaotRL+B0iK2532Gf+lTgZp33niiCSFzP7EHpuLH5IQ0M5pcCrNG+R8jcnS0
 qa+wgPRTtvzj3ZHwOunP3WagSpuw6pmnelsxGgfWLQWnBg7B5lb/FwcU9UmVeTsM4b5vgVIcovv
 QDgLN0bP2v5tukjEw414AjNUU0agmuvzyZajSV0QReEK1xDg/K0Ycb06xvrJdXFsgDVWb16r09Q
 T15hw36GxOs9bG8WJ6yrHtFgx3YaB/928c+PGXoiQPBqF3S0AX9Kah7hs2mKzX0yeU+g2akQaFN
 hn2gzf7w4V3QGKAVqvW2/IgNyNxJEBAMEQCxmeqKI6U38irCrcHaN6cAN+LezSSpE+ABaP3nCLD
 lt94dbc/ZPec37IEIpkK8ToEplWZl79vWS+9uJ4T03JFR91IW/JgKaCfnMLdU4Kdm2zSF2LA3J5
 oiBS2UFsXbFr10h0EzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310146

Enable the CDSP remoteproc node on the Eliza MTP by providing the firmware
names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 868ae6c34830..3fc9aa3be463 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -484,6 +484,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &spi8 {
 	status = "okay";
 

-- 
2.54.0

