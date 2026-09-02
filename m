Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA44F48989B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350266; cv=none; b=eSxEwPOILpUo3b4kapNDe9m/7PqC2EGrCVZ/OKNU8eQQJUSZZwxwE56Od93/ijHINjTUXBOGRCSaclE0q7mUggAGpgYVOPM0kn674JsvzTpkt5LPOLUMbx/h+1ZLiYbCyy276y7/KAJ/eYBWIpMsbMpvfYe76JGIbpyhIQCXQ5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350266; c=relaxed/simple;
	bh=8SMX8raZ+hmw9c6gx/zwZ28NS4+6VTWeLrbJhslZaPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=swO/41ysdo7NQ1f+aUMm0qGoZsfvUjb+Q1mk0c891IXkeMqnnJYu+FU3EHI2lioPsAeG2GxlvHKGBa4DJx6CXWGcrlf21UQd9/34akYHA01qtYLkVt3RPbirE89Y9tx5k42684UC6a69tRKEucI6ofQoVBtF3gvwLtkBi63KUoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqRnWiCP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AEabJJF5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqRnWiCP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AEabJJF5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682AR8Qt1287679
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 11:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TBpg98HEt8ju+qpeLW1qM0
	eymXvDw1BWSmeFb5J4Si4=; b=LqRnWiCPLApTAt3F4UAI6buL1Eo22w40J6k+D1
	Dr9bemzyngFzKbDX1i2X/lP+55QOMzPzEY9/wl7GTsh7dML5v4b8jpBCtp0zQyEe
	8ah899mCj3L/EhkR5O5+F+XNpTblo3c1i3vFnM6+4twDseE3BQHJ4n8Da2TqscNb
	I4qy+5JeDJRPFgqsiHignR2eUo5YzZKrN/pLkAQYp01RCeQ+iihXgr+w9ZkZySLz
	HSiJrUa8O4OIAXzEjgA18PPZNHcGUYFjVfVCB4hDTnof7YNDx2F7PQX8N2BnZDDW
	R9OIl5PfX4EadHTHaZu/CZMzXGe77a3xz03BCyt42Sa/Vbaw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2c8aa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:57:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ef13b61bcso241501585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788350239; x=1788955039; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TBpg98HEt8ju+qpeLW1qM0eymXvDw1BWSmeFb5J4Si4=;
        b=AEabJJF5aZ44UhxIcRygT/YehQpgxgXNrKnwD1UwlTmPCgOb7+ra2Nn47889zA4j3j
         JGVPXJJOxs63kY1549ZXh3UgQHEtRDfKs9xF/3p6xeJ541lY4/wmP3+x/44wfsa38yt3
         ZERGni60j2Z7aDuRMkuTcdPkSbDW+Ef95ZFh/ofAr7Pnm5Uvck5TEMObHDz+EOCWPYoV
         lP6CPPjkLfH35Xw3DAWz0pR0IVzkPHuLc7UtUpPKXDMKP4pVDVsYlUxgOkPlanBOcfzN
         fIdLXdwqVbEWrB3+AA/Rtf6xvpvk+jD9Imi+jcm7S+rL+/Wxq0bJS2E7fIDpkldZXjCq
         GrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350239; x=1788955039;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TBpg98HEt8ju+qpeLW1qM0eymXvDw1BWSmeFb5J4Si4=;
        b=EgrOHDB0q0M+Fo9t82dHPdfl/R7C6aPD9+0vg4Q7JTR3fJ9DJbwkvTLhfDP8LgKQEw
         ArJF8Y1HQ8NKCBJqgUVmB5u1AThzned7NeBUKzXnFVdYg8Vr6ROHBDB9IttYrsqCnQk5
         b+N0vWDk80Ttwjb5V7pSnGLl0hgmMe0fua+WnGN1h6cUv5xZq7oB2LnJkpSHBbpZjYV6
         qIA2ZrbItXukhHigYG/9f3CeZlABniCqD+oxl5HP+fjbtKwh037CH5KJ7rxuC0nOjDI/
         1WJkzxFYtZJcHmjkgxRagQoLiya/M64gU204vlwuduTgDehJCmShsO/mo19mBv3oIUTV
         543w==
X-Forwarded-Encrypted: i=1; AHgh+RpHFCT7zc3zeqbmi5KOH+Dv6iClycsnAV7FGsnpsxHlM/vZfNXcfPN0R8IQrSdkrfLmD9udUvZANIMzH9c=@vger.kernel.org
X-Gm-Message-State: AFuF++n64NcedRW99RjACmbeFd9ZB4MCOuCKW60+hrDQpAXX2K7W6/AO
	PusJotkuGghOhEV4wYxipknWEr6etiBIyJ8RvsJwA4Z/LiTtkf27s24vNrmlDJfH0L0fiJoeVJ/
	RJ+/jtFVbEDEhxuO5ozPFnHztIxnLVige6m+DqgylHQWkraU4Bt/rMWZOEje4yS4x4qPRpJzI3/
	A=
X-Gm-Gg: AR+sD10Q0P2lPylaG/v9x06fX9SDaAHV+8dps/NKAFwfldVRoao1x0srgEZiUVP3AOb
	NcSP6v9YC2Eevcx93my39JEbRX8Xqf2SWoypum8epaOweVHnIXxEX2RejNfSmfDlx09HFqGTsaC
	EFO0Q7U/PUv5eMSGkLfBYJDV6j0hLeUBlOhdvAtGB6yGe8lOLyXXx81n6/J+tYY57PmwJPdVpRU
	MOLppMzFlfcCE08MBWD2V4NyME8kvq8H+Z8KRJGQZxmrA68MxjuvimL/Y9R23/hCNHpzhAelW5f
	DYHHFUehHn8qgFCtX7qOY2tb23b8/VBj2hwu4R5UaSUgpQleTY0l0ofL4OevrHyFHmPD1lwGGpV
	U7lqWCf10
X-Received: by 2002:a05:620a:a0cd:20b0:936:ab1f:6aa4 with SMTP id af79cd13be357-93960c909afmr395660885a.1.1788350239441;
        Wed, 02 Sep 2026 04:57:19 -0700 (PDT)
X-Received: by 2002:a05:620a:a0cd:20b0:936:ab1f:6aa4 with SMTP id af79cd13be357-93960c909afmr395656485a.1.1788350238885;
        Wed, 02 Sep 2026 04:57:18 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm6463199f8f.34.2026.09.02.04.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:57:17 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 02 Sep 2026 14:57:06 +0300
Subject: [PATCH] MAINTAINERS: add Abel as reviewer for linux-arm-msm
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-maintainers-qcom-add-reviewer-v1-1-82d6126df520@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABEPmGoC/yXMywrCQAyF4VcpWRuII6PUVxEXc4kaoVNNWlsof
 XenujiLb3H+BYxV2ODcLKD8EZO+VOx3DaRHKHdGydXgyB2pJYddkDLUsRq+U99hyBm3J0+seCB
 H0Z+897GF2ngp32T+9S/Xv22MT07DFoV1/QIkzKbfgQAAAA==
X-Change-ID: 20260902-maintainers-qcom-add-reviewer-3020b57555b9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=807;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8SMX8raZ+hmw9c6gx/zwZ28NS4+6VTWeLrbJhslZaPw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqmA8clLb49Baw5W8IBpWhXebosBwKHjIGTfyav
 DNV0E35YDaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapgPHAAKCRAbX0TJAJUV
 VsvQD/0WraNn9IoUUXgOMd9teHZl2NleI4PtBfgQyC4wYeA64ejKQHvPoZ6feTkYh9iEHGmgqaK
 +stU90MYT5drPdkUlzmPtuKLUNWp4W+FXq7iVot7RplhEsxh34Co9Cp4v21ixqt9PbpjHlTB3yi
 Ga1mNB7TacGAPqxRME6BC17URCiNdhp8v/oeiCbWfjGMh7LoiB+GGVYJK4nc8FtDekYtHHXRO1M
 O2mKOKz6ftuVBwbdWFSNWHJ0jjOEkMGXCCKVZcGf1oRDbHsFGn5doojA96e5XDtpp1stDji1xIi
 U0M+N/jchoRcJwDIn4EER5i2pDz5ZKBn4xT3WCP43ZVW6uiSQM6v2JLIYq3c9uHbdgxMKAC8HsG
 aSRTCRXQ5tnBhaRxfaf8FiLuE14iHeY4WQUazK0pMyNjMGsKYV4szxjeRqVwpzrtsjQ/7moQjlO
 jwMwTKCqBFR8XyvdMrm0tppt9GCAaNmFmhzwLqM/nvASnMGH91kgUn8YUR+Z+NE5yCLXXNj+c1I
 ekG3wGt3I/M5vlvrNerxV5FQE95q2tyglcNrXw4DUdvrzw27gmop7Nhskcja+bLH608DtKdNRWv
 IVnOk2Vt9RcnG7+7b0mWlCccjY7xA63MRN3KAge2hGtWc3rpqWfuJn1ayuTjY/DDWa8HOijk2vX
 gHfyhNojdcGWw+A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEwNiBTYWx0ZWRfX1XTE7L7W7w00
 cXQf0hu4pB7rJs6N0EvnC8NpUOFTbH5jXd2cF25S3nV52jkeFV54zcbu4JpB1bR0Jl+IzkXtrHQ
 xG83dQWEQun4g4tgS8On7s/EQarYCCY=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a980f20 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=YL6Xjd1eAAAA:8 a=koLSwC8SgX8DfoFOMGQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=yLS1KB8ZbIgHeRWbGdJx:22
X-Proofpoint-GUID: H5bMOLhjS15Js_nV98ED2kcMclditf0P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEwNiBTYWx0ZWRfX0m4q9rry7KZT
 EMOP2CPG76aTOnVi45e4Y/IP+XmVsL9Y12xS3PXIZLSkMN6FpGF1mykfhQPssZklLTl8TV89pIx
 R61hjRTX/qW5qzk7Wfp2wk5Vm/BlEjvRtNWUrGQmj7ALyrG9JsEq24QEPKPZ1+8uDWszUXFaZK/
 0+sb9QipXemmY/NcjgFu7i+X/R7Z/ZfYowx0rCcZoPljhxW7gtL5LaWCNTtnH19GEH4deeoaFGO
 MpJj0QdgfjQpmDEYONKAVRi8hWbPLkdYGaTQKmA00hxgX3a7oyPZ5/w7g9VoR5yqAR6odu+/lKx
 RH6gLy8LIEEfxd1dnD15yTVwXhqsfY7hI4yWonyYuet+Yg76X+vQDKsXtNnuzT2APEtxLzYWE5E
 XyV2wKTDGwpXYlsmlZRDSqhRYCd0V2TuYiyPBuByTtWsx283y0Fk+Z0arZAAe0JOyka9R1AJzge
 w6dwZHJk8BEQK4wMG8Q==
X-Proofpoint-ORIG-GUID: H5bMOLhjS15Js_nV98ED2kcMclditf0P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020106

As agreed with Bjorn and Konrad off-list, I'm stepping up as reviewer
for Qualcomm SoCs support.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7291238bc09f..1fdd9ce83e2b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3432,6 +3432,7 @@ F:	include/linux/soc/qcom/
 ARM/QUALCOMM SUPPORT
 M:	Bjorn Andersson <andersson@kernel.org>
 M:	Konrad Dybcio <konradybcio@kernel.org>
+R:	Abel Vesa <abelvesa@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 C:	irc://irc.oftc.net/linux-msm

---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260902-maintainers-qcom-add-reviewer-3020b57555b9

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

