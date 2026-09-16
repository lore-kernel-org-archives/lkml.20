Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625F33438A8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560302; cv=none; b=s9DLuH5CLxUykbcAai+0uNkQ/HmIgN7HZ4lhh8Al7UwdkssXcKITy6FFigQm96DfTJvMz3nq9/xKBcailEzuqm2Wsp7m+x5nLjviqsD0XejM2jzkyxno+weL1BrmkKMI0cGWCnA4szu1FBSsC/+Oho1TsvI2qmFyeekhNC7RL64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560302; c=relaxed/simple;
	bh=C0BpY42SIB0w+8iKfEOWUwTJwzkmqTce3yk+pyiwXbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a2yeR5G8Z348oIDAM22Faj9/oQTngpXlNicMX6/1kB5nabVXOUDqR8QTs4kATe7vstFE0tYuARo5/tQfuynNAJqadnzY9Vxp+OgML1nDsvsXgFR1kolO70Y8Su8Fjhla76tWbZ4NnQHNlK2Kon2K4wlKIFnnQhN649Em5OePZ9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNLfxSZ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAp7IqiY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNLfxSZ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAp7IqiY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92gFn2348139
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=awk6pIqsCHA+sxQSt9Y0zl
	gxRNgYePRTmYV0bu7IlOI=; b=mNLfxSZ80U7ohFLylrXk9HgfjgP9SIFOHT2oQG
	0pvemc/t3YlZQc/RP/rVTYv+IuE0T3Bj26nRkhwW10CHMLjA00xjkYoPWTV4GVlO
	3CHvx7RkwmGfbACvlQ2SVE5EuQyxI72+lkoViA9Ov6pjgqSO7D/CzQLW2HaM3qpd
	E3lT/jkZzOL/TAS0kOjW3h2rgtjUr2U7gFy5+Wkjy50b6jC49PM0mg+I9mOmN4+7
	0zwOxskCZvt4pE/NPomFfGsFI4/nCnt8k6CVGWrGqC/bw0bYqMBUL6IuqLAwmuNb
	mMkivwBcD6jKFdw+nrNtD3StXLyDfPcbAtrM4mCzLFh6dcpg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywb4qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:04:49 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98308354abbso1059085241.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789560288; x=1790165088; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=awk6pIqsCHA+sxQSt9Y0zlgxRNgYePRTmYV0bu7IlOI=;
        b=IAp7IqiYeVD+PVXruAS/IQ+NMXOwmMJ4ujHXyecREia4BmRWHnIz3RZmWgaClPlxBe
         bdNdccv/sowEO9IC5Door8s/KK9NFa/HfYqkXP18cmyOldPOUdZBvTYBV9Fp8j2bcHVD
         t7czzHlQIU0uMIIJbjpX1a1MV5KIa/s3FCn0ATuH16iScyACN5Hsh9KB6Txt4Hh/O65n
         Ci+ZrrXJP76oqlwN1D0RhlZCT8rA083oi4OT/DyA60QtQO7gIYfJngSDxPoescvtwc/K
         Q0lhaQQ/x9Mc4YYEyT+a9iWYvi0SVCLFFiPVryAWg0dByJEGJu58uqvKLRJQadJRIuqv
         qroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789560288; x=1790165088;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=awk6pIqsCHA+sxQSt9Y0zlgxRNgYePRTmYV0bu7IlOI=;
        b=iahWzh60YZcjasEsQ+RAoVtZEGrGnJ7sZKQbSROGkHz7oFY71H0a/nRKd27PeJInnm
         X+a1KcHEuG9MZr7z1d+SZVQToIN7/N4TnB4I91RG3c2p9xD96k6JNwee1eFSQcZHI+a+
         hnxt93w0uryIZVWReNczORNrGNWhLQinIou0RbDjGs7qAdOYobM9Vwnj8q+gvJ0gjxf7
         0flYn+m/2uhsE/MbT8mTvbK5mnPVHuhfy2IYZTvpbWT9P0b1wcXQjmTgCNRz1hoCZ6fD
         XF0wfhPzg6xO4tptmwWuueoSJCio+V2kUIT2wIPFpjhFjiyn9DTXfktrjaVYYhqC6gEK
         r3bA==
X-Forwarded-Encrypted: i=1; AKwUvBzwk97mKGppomSb10MUY7hdIUuxk2hwFpbPajb+PWcnXm9bz29ie+kotfhjtI9NkFJLTz7CclYeb9n3g7k=@vger.kernel.org
X-Gm-Message-State: AFuF++kMmdptT1FwXEaGIzhGqZCj0AryVm6KPq/uFpoOMpwQ3LAHvYp0
	n950Olpy8FS93vRGaHOHWDMi4+uiAarCP62JsiE0Ah4j+USPycehxe4Vbi5SLDh6fTLH9xLgJnY
	5qt8Rqo41YneDWD6OxfnNaHahpebyP1kNSpnSKjRPZ5/KtlNbUcid4R1WNMcP5vdcIvPMU5Lynn
	o=
X-Gm-Gg: AYBFou0ANlTEIyvjvRZ2k9GJUtV2fkicDWAtU1ysz6LBHjAuvgdCDounxSyBKi6fV3i
	TOnM3srBvYQNkn1i0gJsCI4y80qjzRifDhLzMNeL+q7bA2hjASjGZ3jFwdULaF6IfLUrojn8qQu
	KDtYb6gXcMK1AWUd14kn3zyA/Ry/KIwBntKgR/0D1ceL1YSCP+zWZIB2LQbC41X3W7hxVYwdMb8
	sGGIa5F2pP+XSzz5ayXwsvyk7RJGYyqRcK52TgAQhxEDXwlV1yJji5ZP2UGBpupiraKGzzy21Hl
	p1hjydml2eCq0osdPte0W398bXRUXTKOaivEpqCozvaI4sgr8Xl8503JKncY9BJJAZNfHCEx0ln
	UZBspUDyf
X-Received: by 2002:a05:6102:390f:b0:79d:a035:b6e6 with SMTP id ada2fe7eead31-7a050c29866mr720066137.3.1789560288524;
        Wed, 16 Sep 2026 05:04:48 -0700 (PDT)
X-Received: by 2002:a05:6102:390f:b0:79d:a035:b6e6 with SMTP id ada2fe7eead31-7a050c29866mr720003137.3.1789560287959;
        Wed, 16 Sep 2026 05:04:47 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dba8f4sm70514665e9.13.2026.09.16.05.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:04:46 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 15:04:41 +0300
Subject: [PATCH] clk: qcom: mmcc-msm8960: Configure PLL15 only on APQ8064
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-mmcc-msm8960-fix-pll15-config-v1-1-11fae0be111d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANiFqmoC/yXNQQrCMBCF4auUWTswKTU0XkVctOOkjiZpTVSE0
 rsbdfnB438rFMkqBQ7NClleWnROFWbXAF+GNAnquRpaai05Y5HDDe88R4yRGWOJvbOEXt+4hGD
 2yHPyOmFH3eh6a4kGDzW2ZKmb39Hx9Hd5jlfhx7cO2/YBFz7nXooAAAA=
X-Change-ID: 20260916-clk-qcom-mmcc-msm8960-fix-pll15-config-404b986600af
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=C0BpY42SIB0w+8iKfEOWUwTJwzkmqTce3yk+pyiwXbE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqoXdBm951inBggT/YDjL9giHFnIz/vB0497cR
 SX11cPMFzmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqqF3QAKCRAbX0TJAJUV
 VmUKD/wIqvmQ+xGGmXTDmFU/zygFgTyRpcwSMs4J+zRnI3dQSgtDVHnseDr5PRnuiAsOT5zO0OU
 SuUUgrW4BTUlltdFOwNOZld1nnOOLaON2lek7whiy6wSNyj4eZyL7O1sCiIMdZ+ZLNOZt0N6qb9
 FWIRqZuUsgFHbLfyqJydbqdv2K5jj6yrIAr0EZ8k6E4iZCiBW3T1jJQHM+y4FLTAg0jyUenPBvW
 KVN3Q/3W4/ur3lJvXAv/EPiiWIXdxzMb63E+0Dv+cE82aKQYUAI5ba10Ya6EaV4fYc/kwXKC+rB
 q3Kv/necREQVCBxFbFVxm2/Xqk3cgSRIrw6ZREaki4WqZE07pt0fs2ytHmye7MFUUgLfvAPz6SB
 a4x0o5u/z9EAns6ggPEbm7gRPRFBAp8AtTHmH3Pa3PHYg9avrXeBbSrbddF9tTUGzTRi1wBx8QI
 a4PySbhIGTKnh9px75oXgBbS2WG/ppWAsWs9t3AmZcl6YO2CzTRUF2HKls5HfQeTlYBbyPjdVNc
 vxbcPsvwgxx7IBdr+Sy5Lfat4lzGZ/QPnDUmClmQhRgcwQ1CjpS6I1+IiA/xTFH17fdLTgJtyBq
 nOPbgI2XO0ySPuZQ+hIQq4wrJGL7XzFeQqWjD6iuc7/q7RGuMM8EicR9JFEildCZPn9c3OqzcPY
 qbsai2zK27gL0XA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: pkmMf958ouLgOai-ocXZ0LtGBRt8DdW5
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa85e1 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PDnXyD1IIKguCH5BrScA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE2MCBTYWx0ZWRfX+Gy47hyjrNhK
 /P0epy0W8O9AO8nCGCYupfucikLy8GwsyciIrBIq4ei3Aj9ipjSuxp40yNNIfiHZ61mIACBFu/Q
 /LfGy4NxktnEt3KM9xmt2MnFpF2+oYA6yJEvOMWSxuweJa4tlnDMmOR52DH145aLgvKCkRyOFzL
 jwmu5jsdzW6LwTSGTQcDFjgkL3Ysln+6LdwNQW18nXGMVUI+zlyWX0iYOWg404lL28+hGod94oQ
 CVsTC1hgv9Js2YxWlqcW7Uq6423KuW/212ETCRq6NQi51cqz/DG6ugSJTfz29HeDmszq5GaNhZT
 8NdEG933RQU3eiwPBSiTp9kFE2eM858Ow994o+PtFk9C31jZLLozEQTGycuUMK4fzCVoyJTQBfl
 K/rSgXZG8ZV6HMsm4c16gSHSOs9gwUwnVCj5WWghz6aO1uuAhC2mef84fmr3aZ/lWb8Tby5PfbP
 BO9W/et1vP1rf7p4Alg==
X-Proofpoint-ORIG-GUID: pkmMf958ouLgOai-ocXZ0LtGBRt8DdW5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE2MCBTYWx0ZWRfX4x99jacWy80p
 aXpqqNoRYZ7AORU/9uUgMgcCAn0i7x/6dGnkV3my202JFZ+tZjFf0oNklJ+kKZpaFv6F37yVB4Q
 8GY6D9unnYHcRBbcR3aQvtLHBt5JZcs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160160

PLL15 is specific to APQ8064, but the shared probe function configures
it unconditionally, including on MSM8960. Its configuration registers
at offsets 0x33c through 0x348 exceed the MSM8960 regmap maximum of
0x334, so regmap rejects these accesses. The PLL configuration helper
ignores the errors and probe continues.

Only configure PLL15 when the selected descriptor is for APQ8064,
matching the existing variant check for the GFX3D clock adjustments.

Fixes: e216ce60a9e0 ("clk: qcom: Add support for APQ8064 multimedia clocks")
Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/mmcc-msm8960.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
index a23440e13b71..a67df833592a 100644
--- a/drivers/clk/qcom/mmcc-msm8960.c
+++ b/drivers/clk/qcom/mmcc-msm8960.c
@@ -3170,7 +3170,8 @@ static int mmcc_msm8960_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	clk_pll_configure_sr(&pll15, regmap, &pll15_config, false);
+	if (desc == &mmcc_apq8064_desc)
+		clk_pll_configure_sr(&pll15, regmap, &pll15_config, false);
 
 	return qcom_cc_really_probe(&pdev->dev, desc, regmap);
 }

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-clk-qcom-mmcc-msm8960-fix-pll15-config-404b986600af

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

