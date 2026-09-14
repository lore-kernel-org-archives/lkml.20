Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBD343F4A1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382727; cv=none; b=kSOBT3iUHTICVKARxfzgetQMAq91T2UUawEvwaDcOdD+a1TyaLSHshLHVFLKUX1fXXpNG05FAeNT5Ic+1fG2m2ZTuQAUks61H16709pmgvBCYh+r/qTd9JumDmZr7YlQzk8ekjjiMFeVrRQqi/J/IYmibGcRBAbhKRQw4qnrD6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382727; c=relaxed/simple;
	bh=VblMUtasfF6RjPCwMXNJ66KxCQ5fC4RR8B1FbYJAMec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bzw3SEWKpvLBunMBYMWVBDnmTxmrCXxwx+L6FCtTOambrf6TWrgAjSPsPtTTFO2dsky2EybaceyoNVZiBswH+XjIUC/V4dnncTlVB/DVHQDnINhG0s4puzBcVa/Q+LgO9UgAWOy/9jY/Dulo+hUxUkSl+/1QLfsYsTpDMbPOCfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTCY3NoR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XKJZ8bUS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTCY3NoR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XKJZ8bUS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nSvA599739
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZDQ+7buSGCLpRXUFmxadkYINuEGI1foNY+nX0ZiavM=; b=hTCY3NoRxxVkl66c
	IXm8m7gpB4mR4T5eNRASpEebuV6jE7bzW8UWTTwlTPgJv/9KL9X2MqLzarXM9k9w
	m/6l428Uvuo+FqaEIiYfJiNl0h+cDaBob8tQC31bDRWI2FJ4X5eFl0LVVde6EN8Z
	ONeqLGiUaM8wj2mQ6wjBm0deUcQtasuXe1L4Zp3/01bY3trQffsuzEZTSKRdHYQA
	pjoE1J4ZXWxqoKU31UohsWmlhO7CuWxNQ2kLo4zIfLZPA3Th8Vfjj6MjtsDLMde4
	jrd0eBVuqF9v7fR52m2BKiUpbEkasdKYWMnRQmEgAHrkBwyzj2C+NMrs5VsON4ck
	F2rJkA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rfam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0050a554so507093885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382714; x=1789987514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZDQ+7buSGCLpRXUFmxadkYINuEGI1foNY+nX0ZiavM=;
        b=XKJZ8bUSD0GOFJfwYO0Lk+iZTxdQzpu5ZXNt2MUC8avXzc8BIZbZBNBbnJsl58MjB+
         B9mJBj88/kUD/qxKEkbUJ+r8rGktBPh/hSUwxocS4XVJ/0X5gE5glYoyMIUJ2l42mrzn
         m/X102mpj5p/oKwWay/MJ2i1fqjednLEGN7LgQtiZtfojF1yS97VDjIPD1BbDWgnW7Ca
         lc/XSn1XiB8TB5JHW5aWR6cGRSVgtRsgNmP08sKnylwDcTzsgvFUG6OAFatnmAc90iuS
         ZJCbpGt9UfAyOyr2cYG3V0pCKQ/kCXtIjl3QFW9DC7tXWQ4kvLAWVkx9ZwrJQ29Eulhl
         5P8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382714; x=1789987514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZDQ+7buSGCLpRXUFmxadkYINuEGI1foNY+nX0ZiavM=;
        b=WIGSMskgLLIv91TmYuTmdLqaz2WAUI20GvzvFweNZMQCv2dGBeSRMRgdhqm7W/e2hr
         kH5sFn6cHo/rdSdRGnjtA1I3d7tnkYwWCD8y+pbVFQpd96u+u7uW1Uauay1HgjS4H5Rf
         4EpKucReudZJPzg71pjXI11qh9leENOhwRQbb2UTYcpE/0810V6KN18QvWdFWreQQfm2
         mNwMGLDH1QrTvrLl4TbWYvD179qRtqw06MMH3I2HhUsrVDU4PaMTyFUVyqAetCmz60cW
         aHd2/6givVA2QLduNH1YO+V7y99IWf+H+nLvljWnWCl3qI9RdPTysrhWoe+IECAxdVaV
         ZRjA==
X-Forwarded-Encrypted: i=1; AKwUvBxOlToUuUWjGTucXM499nskBRCNYk0rz42RzUmnQjgGLnd9oC+9YjZloDN7xZJUT7HhX2MK11B0LSWeNRA=@vger.kernel.org
X-Gm-Message-State: AFuF++lPGi/vKRNwSGjAxMtHYpgEXR9pl7UpFksv3kTKfprgH/PY/sud
	IT82WUM+w+JlOd/UJBmKrlpyyKGO0yTTeoL2uz3aGHTud6AU7VQr8nbRZwb7354fUwq9DKMTSgJ
	H6XyEIPxbH/LzoERRxCJuIDTjZ+5MA0b/QFBM9y+H8cf0WgJMx9UtofV4HMNt+u9hHkA=
X-Gm-Gg: AYBFou1E7qzkX2CF3HNLNnN3H8rs9Fq8k5NJ3aHSMREutmW+K+QL3LzP3R0ygtgcWhP
	fLiITHkuhhrTFGCoPZhRvRgQzyLsYVH5XZJqDJL6CHHdkLZuEQLkCVoah71zmeK2F8kPYZASRkk
	JUTQSJWij0/LM3WS2vxBA6GJlwwFM1Zd8LAuk3BH1urXHk42v6TTGvw36BdLL5DgB0jLm/iW1u6
	VOZ8qw7ILgNXc8E8a0yN/2YesgPKDCW9IKfjhi6db8gHVGtMHzFEAqx9TfRbFrovD+yYSBhpU7G
	Zk/y0Ap0AWV64m1byRt5djOLiaEqvWbioqtVczSQNdeaz+vJdaWw5K2SVvv2066hBt4TMeazPBY
	bSgOGJwlN
X-Received: by 2002:a05:620a:640b:b0:939:34c6:a333 with SMTP id af79cd13be357-93a29b98060mr262861685a.40.1789382712760;
        Mon, 14 Sep 2026 03:45:12 -0700 (PDT)
X-Received: by 2002:a05:620a:640b:b0:939:34c6:a333 with SMTP id af79cd13be357-93a29b98060mr262796585a.40.1789382707562;
        Mon, 14 Sep 2026 03:45:07 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm26335926f8f.15.2026.09.14.03.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:45:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:44:48 +0300
Subject: [PATCH 1/5] dt-bindings: arm: qcom: Add more compatible for Eliza
 EVKs and SoMs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-dts-qcom-eliza-add-ufs-variant-v1-1-78b3249eae61@oss.qualcomm.com>
References: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
In-Reply-To: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VblMUtasfF6RjPCwMXNJ66KxCQ5fC4RR8B1FbYJAMec=;
 b=owEBbAKT/ZANAwAKARtfRMkAlRVWAcsmYgBqp9Aqs5iHvG2s84MOEmhkMvVd4hCbHTdX/Q5Tm
 3FfsjY4N5CJAjIEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfQKgAKCRAbX0TJAJUV
 VmDFD/jdG9jdHPRnideqfQTJhabo3ZvtckWih8iUlO6kI0euZqW76D0PNH2AM8MK0xsokbyok2H
 8ZWSMcxsgRiwgV8MMXIyP4WXFXRE9hCCwkDbfWHMZ15/6MkfZU5aB1cySIGvdOABuTxeHpTwJrr
 dpuV4hIER4Wfqt9rvttfWtGI4szY2MA+vr6GgIgDcxuT8R5jSEL5z7IyTzyi95BbwumPEbTfMNA
 1d6KF4xYtG936nJLeGGBeuAONHt7dTgOOcA62oP8Kz7odv5cVLxt34iCsZnq7nIVzG9bnXW6mcb
 t8h/RYkOC7IqpoJT8HwzrHfRBytpcGkfbKLzuullbvAGe4nlp+G1RhaqFH0f5AXSg4jLHdYzWsd
 02sllhq9VawQCACqEpWwGqFMre/Mi+CI1jzB59ByTYWLWLpQtM79L4SHJmNaNji/MpkGgFt1aY8
 O2U1+qbsd6h4qxc3isw27jLD7JVUWk0Aw/5XpoHWIR+MwzU2jtzmdqxxvpRoM43frIMjYK1d4/t
 9SI7WrDbUnfeUTkbSgBqzvnjamgrjzpIBg138eXU8LSnfa8IabWCeENy5chIEQ0PFVU7FQyS0Ms
 weOoWiS1Yyq71TqihsAEd1y8Bkx8OA8vali3nTgcpnDi/3BZE+Ts5o2KtpDGK/kTFGp+1cHUXEt
 h3Wea9D9zOQOX
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfXy2DH+j31jGS/
 x+yBo23UK1Gshiw07zb+PPj3soVsv7xZaf1BUaeyJzSTaVk1fbebhODEsbydvXknkYtKTQr6knk
 Hb61Jp+xWL0vzL9m0Etj2d2DJYb+dhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX00goJj4Zjrse
 SNV203C+XyaZvIvD+2P4/M+x2Vx+fCH7R1e2Ho2MP8+dneKUgTQohvtlsmZjhRUZyxWLMlABciT
 F54rzg8bHf1dViGHBOaKDx+xjfrjIufCKa/xcB16wFzDCuZSGggVZrIdZ99npjUVIhZQWGF0/Au
 z0gwXMHk8ueJ+ZAgpC1CWTKbhMKrCUDTa6kzfBd73IYsg/BdykCk+mnqmBPY4SMbM1Y5WyI6f4A
 dmP9G7hSlUBJWUCaPzcAkFiqBUdgOyHBW4c4vpvafCzaCZyMJddsrvt/BsGduykBBYUjVu+xZAl
 FEPVMG/fsoyP5m1nmkMxbi2nAUIOlb1Mm7IoexEgjRNu+PxmT2eMoI+kfZ5h5yCzrjeoo0XhlWH
 VReBm8UtsMIh8cpgLxeX88ePTyZ9BhqAoqLQIIycNwrBSPMocSvEhUpFnwLhMq0SQrike92cUZl
 R/s8o4zi+e6TBpR2phQ==
X-Proofpoint-GUID: OJDo9oGVOLuYK2ef9lzq7jAW4Wdr1kto
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7d03a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=l6ELImiZ1_B-ckXs1ZMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: OJDo9oGVOLuYK2ef9lzq7jAW4Wdr1kto
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140154

There are currently two different Eliza CQS SoMs. One comes with eMMC
and the other with UFS. So the Eliza CQS EVK can be connected to each
one of these SoMs.

So document the eMMC and UFS compatibles for each type of board and SoM.

Neither the CQS SoMs nor their corresponding EVKs have been made publicly
available. Therefore, replacing the generic compatible strings with
storage-specific ones does not affect any user.

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

