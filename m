Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED1B45561A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331337; cv=none; b=MW7wQetqpPGhzsm7vPLumvPJTdrGMEqDV+6VkL8MO+WkP/tGjRprRilUDbxn9ei5ykR7qfXbmsQ5FjZIOGnxzz8AOYBBCmoMtnKByVsFUKN1P9aS528np0bS23z1KcEQKm3iYkrHQqtxgwSmY6/eNpaGAf99K4MUicWLHXDUcm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331337; c=relaxed/simple;
	bh=4IBOCavmiL/zMpV41D0qn7Sb+iKJTdCa9K3O71dcDhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RLAknLwSDQqnkSSX3ElDQnQXVfkTqbrQpjuDq7dRTsr5gUeDM8UVagpMX5nuQX452Laa9gGzz8oAgAYV04QrC3byWWoSSrviowYJdfYfOpSJdM2Uy9nNYnUWh9M7vNgdmBYKInNufpne8zro2bnpdc5YwsnBFV47fy83PQPLE5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fgI3G58h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RKpYbdSu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fgI3G58h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RKpYbdSu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YbnY1193848
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hofw38uOjdyJknVDS7Uu6z
	l7zg1X1BAsmLdFtBA63zs=; b=fgI3G58hvSgwX2T81mKX2ZFH386A87rrwVjdCv
	QLEi826ju6hzlmYn4efUShDAMKPRkc8xpf8ksIyuAlP0TFVhjEpR4xIx7ExsQuVn
	d1Xk7lmgUhlw1qgfcQA3D7lSXf6cUbigWWhEsigrKrE80FpTVbax6XZBM7L0kKOL
	sHwtK3U+qEVMFKY8iXrbGTrIxiuIfWIsbOkiYXwnaoXeaeMLXwKy3Y7m9dnSgcng
	s2LhV0oPqwBBt3XZsJnETvOcGDX6YLan1IT/pmNCv7Oq8vTlA0bzje3kFsvqXlSf
	f9CGXSi1AiS+PhwbpGQr7w7rW5Pnr+0D4SbbvLTdKLvwXcRg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874k0js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:15:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so872606eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331335; x=1790936135; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hofw38uOjdyJknVDS7Uu6zl7zg1X1BAsmLdFtBA63zs=;
        b=RKpYbdSuwBi2pGEXBscooKlCL+WFs0Usd5kaO8khZb9Uw4rNrkd1W/MQnuOm1G25MX
         7C580UAI2HsoszND3y6DM1/kJuWw0Up7+PzCbz0iHcp32dDPlTmcyghIphqM/dwjIfbh
         LkkVyBGAB/10FBAzTfgXKXbKG6W9VTx+RLw5SpyVQSdBp17pPNQrJvM/sWbeLmpkj7qM
         pN8W7zqXenyqXe2NDMzqx71svnKkb5zRsUK2Df1NpXyuQ8BBuv405v+gMZprXU5kCiAb
         bvfgyeT8Z4YHF2DonpvarpZtjFaOW8brxht/3qiIvBelnRMQ0RAkoHp69YDjGyySkq3e
         PuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331335; x=1790936135;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hofw38uOjdyJknVDS7Uu6zl7zg1X1BAsmLdFtBA63zs=;
        b=GaywM/R4yLBRmyG5ZDwJ4t4l2SW1Gjgq1XIWs5hQLqIny7+we5/KZPP4aCzeGwYwEW
         0JoJoytYoPw7TCw6MV5TPEGws68pSzzc0+KUISVDFlt333rs7sjSmFTs45IriZheue2K
         vRTS3Zc2A1d82O89aTC5xPjxxlWDmFIkDHmFKTUhtpCwfLIeCBsJrY91qY0u19N5CxAp
         6/z4Ji/2mG4nUcC88IwgZncAh5lyhIJO5qSHJkZ/xFg+qrQBvyIox3lgCdwZiUO58wJe
         sF1DxVOKq082eJ19aRd9Cb526PP9wNFQuI7BKR0cs2b/SUpuA+OiG7dopJWv7vU8S3mm
         yv1g==
X-Forwarded-Encrypted: i=1; AKwUvBx0noAoHEFi67EeAaVJQbq/Qijb2QKZ/qiigx81f3z3o/u2WPJbyQ0UXb8Go+HPYNNtSzvTfH86zR1nvwI=@vger.kernel.org
X-Gm-Message-State: AFuF++mcn8WLPx4pMOxt5HM64sQHvTWdN/oMEF5tVDTnInDGbv8fElRO
	soGbVMAuzoprfy4GWAkxuB5f4R14KXCyfQvPE3ZDvVx3S3cXV7R1F6I9nXWkn4VrSnDZ6VNXL4m
	k9p6lGOQdgQDWhysztMnAH/mS77m8IRzWheMINeKNC9e4a0AmqD7qmGtTSD+J8+kOzFs=
X-Gm-Gg: AYBFou2ykbarT2Wpa2KGoOzWGZk9ZpZemzr3ryAWkJG4C9TLmsO8b7rWKAgbffh5/YR
	2gRfU54Ryin+KBr2VepDRlgdXUKzHdS4acp25QqVT3wkILfyZ+4Q+HeVfAH5FF+HvO0i20hjSLU
	NT25pTBJi7HHZzrqcN9BzvgPOxshTt8hSwZ2csqr7Q62kUkyEyUnXogBM+mFZxqxmloDVh65gAa
	Wgd0i/rHC7j76+tCuo1bT1w9xsxrqlPSLu84GzSjUlCjAZWcmjVVIP+z0QmbxA7fp9NDNymVQHp
	/ZZLY4Ta6vvcejkgJ4AIFQCZmbl3LwZFqLjQPGRpS4CNJAFIqPWs+MgSel+lkxuhqOsLs2edktH
	dtjf8iHrkBrZNGpRxVn74ZU2cMCOaPDWH
X-Received: by 2002:a05:7301:9c91:b0:33c:342b:3742 with SMTP id 5a478bee46e88-341973d0227mr1336798eec.12.1790331334641;
        Fri, 25 Sep 2026 03:15:34 -0700 (PDT)
X-Received: by 2002:a05:7301:9c91:b0:33c:342b:3742 with SMTP id 5a478bee46e88-341973d0227mr1336588eec.12.1790331329179;
        Fri, 25 Sep 2026 03:15:29 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341451457d0sm6234108eec.21.2026.09.25.03.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:15:28 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:45:21 +0530
Subject: [PATCH] PCI: qcom-ep: Clear runtime PM error after
 pm_runtime_resume_and_get() fails
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-pcie-ep-rpm-fix-v1-1-855d56cce43b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALlJtmoC/yXMQQ5AMBCF4avIrE1SRYOriIXWYCRoWkQi7q5Yf
 i95/wWeHJOHKrrA0cGe1yUgiSMwY7sMhNwFgxRSiVLmaA0TkkVnZ+z5RC2LohU6VZnKILysozB
 /xbr57Xc9kdneDNz3A8glPyNzAAAA
X-Change-ID: 20260925-pcie-ep-rpm-fix-b288a0b36464
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Rama Krishna <rama.krishna@oss.qualcomm.com>,
        Nitesh Gupta <nitesh.gupta@oss.qualcomm.com>,
        Ayiluri Naga Rashmi <ayiluri.rashmi@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790331323; l=1725;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=4IBOCavmiL/zMpV41D0qn7Sb+iKJTdCa9K3O71dcDhs=;
 b=VJhc4I0TBheA3EYunjvHm4gVU3/uJyIjqPiOJSpk1S66AB9Aovd/0sfMqGFlw80utyc9zxQTa
 Le0SrL3dY9nDRYtU5Larnj1q+MYz/MDn27n/L/icu3ezOQbEo6Wqcl/
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-ORIG-GUID: xk3Pnj1d-imYmEraLTNkWOgtVjXW5YTx
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab649c7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-MF1NldnQhdhfN6ga6QA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfXzS19+1X/kh01
 U6krgh+xF7ajCt0HZwdKky/H8GgFlDKSwdt+4pgN+g3XDIgnSKDGpKUiNg1oele+Ej58ajYdNiY
 1om86iRPFy6LVy0OGiikEuYBJyyOp2+hkiW6PA3mSlP+c+gV/34ik8tlW+riwfa9FLg9DuNFbCW
 soiK7RdSI4LNsBFuJFJrFmHC2LFLKrXdGbJ4MIgy77/p5lRA2SGUrT+E5Rbr0wWU2iMN0QRiel/
 UIWa1KU5w82B5baqDZXWO0/kG/LwUOYGaZXgBkCfG6uFYc5aFoBAk3KJ5MX4PAXNVhtYWay2yrA
 ssT4cHRKOM59P1FH0qwlQoiKQqu8Az8UwPV41mdsZQT4Ayls5tPXdQMQ3PX6pp89hwHhVKAzTLm
 jTTgnGLHlpaS27sQtzgrAkKwbhXFLbxBhHhf4lMNAcCmPrnEpSFIf2D4y5wkyPfbv7Cv0izm3mg
 rgtdDQwZqvuHIrbvMjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfX6Gk785Ktlyhs
 HTbp00PDPQYZOJR0SQ8zdx6t4hd+xLOnHqfQgMesqCRjLgBS0W0ZPiLZHr5umxohZDZdlrXuBLc
 PGWJUcRWFpcWntt/vo7Pu2559DExMYo=
X-Proofpoint-GUID: xk3Pnj1d-imYmEraLTNkWOgtVjXW5YTx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250040

pm_runtime_resume_and_get() sets dev->power.runtime_error when a runtime
resume fails. As a result, subsequent runtime PM resume requests fail
immediately until the error state is cleared.

In qcom_pcie_perst_deassert(), a failed resume during PERST# deassertion
leaves the endpoint controller stuck in runtime_error state. Any subsequent
PERST# deassert event that attempts to resume the controller will also fail.

Call pm_runtime_set_suspended() on the error path to clear the runtime
PM error state and allow future resume attempts.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
This patch fixes a runtime PM recovery issue in the Qualcomm PCIe
endpoint driver.

A failed pm_runtime_resume_and_get() call during PERST# deassert leaves
the device in runtime_error state, causing subsequent resume attempts
to fail. Reset the runtime PM state on the error path to allow future
resume attempts.

Thanks,
Mrinmay
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 8364696a1b98..5a3dfea702ce 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -404,6 +404,7 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable device: %d\n", ret);
+		pm_runtime_set_suspended(dev);
 		return ret;
 	}
 

---
base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
change-id: 20260925-pcie-ep-rpm-fix-b288a0b36464

Best regards,
--  
Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>

