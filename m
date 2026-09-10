Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7F449AA4A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049330; cv=none; b=FepUVsVnX4g0e9UNlOveHUz6iB+/nKyoEUF+r4d7Y1MUYCt2spwaA+YXR20pb7Yy4A43wJzUHI6J0tAJ0rnw/EriGvyf7V9Qn4urrYD3I9n05OZKrOOyIn94fyojbP9jY0FnCNfZ8KPhUIasa8oeswoUK7WTCbuywNGvEORrwHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049330; c=relaxed/simple;
	bh=PJp7at6YbmABjQssQHHtns6pe+hmMVd0Nnzb//pLNGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IshCseTUIohinPgSER2FD/x3orDbz4XYfs1OQ3cTlFWRJbqpGkC8EQPe//KJoD5eX2dZSiADgE948JM32Kn9wzzeHj5gOoFyR2WdPxTeteZs34Rl+ShTwq/1q6ETkAFI9eKYFZHX5r5i1sZP2se+IbZIdu5LFRWFHwrRxtBuoJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NIOO4oHB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ee8+RV5G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NIOO4oHB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ee8+RV5G"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7jww1732473
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Xsa+f+27jsxypSSVPRpVMM
	g/ju4l/7cO2PJaOMBUNws=; b=NIOO4oHBcIOSEwcH1CMpjqjIFnwbS4Tz5CqtIQ
	5T1GEaxyl9UVtXKwKzitUiRK4FKyca8kxEgM8A2h5s3Opzhu8kIw/HNM4CzxBwXw
	rfc+kbnAYvhF7LoNjpYfF+Wa/5f+nMydlPxOKf+HU/YbviuWVBlkSQgjtVQyhwa9
	UuIwFKg/SyVCaxwQ48EhNucnbVT6kIU9iP8hBwDz3vzCSvCztGiIQkMLF5ZqlC1p
	Z0jllnxuIa+5bSOJAaqYEUk3Blm+hhAM7AQpG1Xo23/psM0Y0s9CG20szoYO05vi
	cRCftKkPqdubeXX0C5FKZ08+ZL2ebekXDR8X/Iw5aNcXcOBw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydm6sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:08:47 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f36427abfdso9663685a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789049327; x=1789654127; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xsa+f+27jsxypSSVPRpVMMg/ju4l/7cO2PJaOMBUNws=;
        b=Ee8+RV5GQPMQcU2qKhH3kXPCVOPtL7WqbmdBaTcqs5xT6s2ZbMaauA2DjatP26MCoq
         /FfR6eA0/2fM2JiN4mSVEet7gDuS9ucYq/77b/WaQ+/h3P8ZBLwo0L+Vcn20F2LtOfGX
         +iR8xA1cLjuSX04BLTn15hbNa61WwzkClpQPl/pI2cBbXoXl3EwQATvgPCFQeTsViB6V
         TkPzGeQiw+8EaiHlucZMKZ9/JsFwKm74MtJHt+cw+pDrxwfxP/nnKgLfMP+jxXAr3jGs
         MsJ1i/0F4n3w11YegliCpRhil95TCYGi4KWLByaSv9+/DMBPbZZCWtrcDsiIn1gBRhlm
         iG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049327; x=1789654127;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Xsa+f+27jsxypSSVPRpVMMg/ju4l/7cO2PJaOMBUNws=;
        b=fKTlJrtyBrF7y8ppF1fG6L9Ysa2GMWXVv+BiiIKghYVAT2ji9kI9n0HcpPZ2UXpnfa
         Pdtb6Qv03WqQSAwi3HnI0y+dNdLh3shLO4FEXBWTnOzXFFA21oML9zHf9FsrIanBrufT
         S1ZAYerjR5lrlSQdeyxXWtQmafdbA3aydbwBi323s9+QNZ2PoMJ+DxWBL1v9B5BCs30A
         WNgSoUirn4ResKMrh0spelQuFJ1yf9M93atWZ1FpMxkCVV8CQkODj9Hl5BRCao0KgCsU
         qnGeFPqygGRI6gXkGLwZmgVySagnyYD/9xk7Yo0IoJxZEeZjAVFUUx+N2GQQBdZx3Qa1
         q+Iw==
X-Forwarded-Encrypted: i=1; AKwUvBy+a3rN6iRmwVjWQrFUXTh6cWQbcvFMJP5aAj7nwkDBEjH1+Gwupp4T0ztmYh3jCfoQXvFan2e/32J16ho=@vger.kernel.org
X-Gm-Message-State: AFuF++k41/9UpeV6uh/TKOYxyVmraYSV5cKrybVuMsP+IYtbcC1zjAyr
	ayqcPefr7206mpir+FfduG7GrVq2tFIlZlo4k6silNhexBFWCn2NtUkDX8H4TWj83suT20b936t
	mTMkaFi+J23TDJ4vb2qDmiq+BnfQbZF56X73TTJN2SOCKteBVB92DsmfO3Afv/m2f3VM=
X-Gm-Gg: AYBFou3Td4gAPZMGR1+c4oxIkUAPsSTIzOCCxmcshLzPhgq2UvAXJ1/6a2lYgbaANej
	AlsEOF/s19CC3P0vaDH0uP9+T00l1z8TB48FIJlojVFpFlzKggFK+47n0EelJ1VJUiuneSbheN+
	uHvJAysQUzE3NwqoDgUY2ZM2yy+2tFd/VV744AbIBRehApvs33kAgA5Faz/EBc5CwLiyg7m+10c
	FbCf7w86BofRQfl2TaLmxf6OZQm90OsATWb4jg5wBb2cwFoG8BDX04U0Lgu92Lyhp3bZNgl8GEC
	Jvf3OotDYvAgktwyoigdkjlNq/7KqjH7MGVcMYQeVgq2FZ0eiLJwOCbe2BZM4j/tMSipW0OFSdL
	FQXi39A==
X-Received: by 2002:a05:6820:812:b0:6be:4eb3:e1be with SMTP id 006d021491bc7-6be4eb3ed98mr5956686eaf.39.1789049326433;
        Thu, 10 Sep 2026 07:08:46 -0700 (PDT)
X-Received: by 2002:a05:6820:812:b0:6be:4eb3:e1be with SMTP id 006d021491bc7-6be4eb3ed98mr5956622eaf.39.1789049325769;
        Thu, 10 Sep 2026 07:08:45 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c494basm69712295e9.12.2026.09.10.07.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:08:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 17:08:35 +0300
Subject: [PATCH v3] arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-dts-qcom-eliza-evk-enable-gpu-v3-1-806bf0fc51de@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOK5omoC/43Oyw6CMBAF0F8hXTuEDq/gyv8wLtoyQJV3oVEJ/
 27BjQsT3UxykztnZmGGRk2GHb2FjWS10V3rQnjwmKpEWxLo3GWGASZBFnDIJwOD6hqgWj8FkL0
 BtULWBGU/QxKHqHjIFQnOnNGPVOj77p8v72xmeSU1bejWqLSZuvGxP2D51vv3luXAQaQqLCSmM
 qLs1BnjD7Oo3Urju8G2kxY/UfyFokNjLqMYRZQEAr+g67q+AJpAGEA4AQAA
X-Change-ID: 20260901-dts-qcom-eliza-evk-enable-gpu-6532c131cea1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1525;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=PJp7at6YbmABjQssQHHtns6pe+hmMVd0Nnzb//pLNGo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqornmBIN7oAX3fVfYgFv0vXR0ZXLqJyBqphYi4
 UaQeo0N90SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqK55gAKCRAbX0TJAJUV
 VhFQD/0eyDEQSNWpja7ldWoi9sap4iQuBgCTYeeOgUrlRSKbfOYW8NO9m35fcHkCDM2om2qIVWQ
 6w6e9/srQRV1LbaWfUxsK488G+22jlSQ8QWyQPqW2FrgeKthdUS8csvLZbVKOo2sVn04I9/ccAp
 YCylwhOhQjARXVmGWdPRao2+LJld8NI8NJssRoBcdj8H9dJdxko7VKNn1y/ljr9uFhzF9T5QTam
 cIZO2fP/0FDRhGIEoklEHE2voMJVUd6K8gFD2Vedbrd3T+RnXmAxL2KLQCDg238loqgVOtd8kfS
 iRkwpd/IAttyVU70UX9KhAeEOYbslwzHfEtV/fQD8CWjLcu5cSZbX6bBtmezwZ8jdHUdDPiq16R
 +aXfOapWKDxvBRHrGjJKOvf+ejBFJ+kCzVJnffR7YFuAf1Z1vRJqy8sraS7cNPtsGoYvyaylhpJ
 wmFN7KzZwe8uwqiH1CQi80ve/GwEKPzlkYSPa/HUaQi/MDuFCecTWWdP35ICr5aQ/qZqUYOcgXf
 cq8hSI+zKafNhAilwxZVVQA8aG3M7GUqcAg5Z9ROpprIvFT8LRs/DihG0CPa7ElcD+vhdCNhOBh
 dZXUXj192hyv0wpel1uMnpwgtdA7blNyLYnDYG339XAZ4DCEux1zY12fLDE5FTGA1TQF/0vW6S9
 f2SyQMVlrgMMaEw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE3MCBTYWx0ZWRfX3XlEA8dgQps8
 zwE9VXNAuTeDZNX/0Lwwmraq/sjp9lcZ+fJnw0D+Xd/ScIxYTDj6HaYDkjrCKFI2GWvBpoCpDtY
 42gI7arKbGw0pszMYYnV/OzWCwZ7260=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa2b9ef cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=cfKdWksii-jdlWvcsasA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: W4o9vjoIR2aK9-n4hcyeTFeiIyHV-4r_
X-Proofpoint-ORIG-GUID: W4o9vjoIR2aK9-n4hcyeTFeiIyHV-4r_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE3MCBTYWx0ZWRfXz8cwrhZ4aYPm
 ZgiIxyVNALT8Vu3JaKQQ2ztjNZqMP7Rq+1J0D5SmBpkNdte0hz4wOmqU78EtVGQgaj3unDoxAbd
 DRjDXABU5HRXgLgN10XolzosGufdjFxhfeYn7AhkQov4jVbsOY/78DLGJRXe5V7gKojsVR539u9
 ubGLHDi+PkQC1DVtR34iKYrzYofDmjpwsVYvmSfRcc+w3noeEcnFlvC+hLXkOt7Lpereb8FPQZd
 +YhCveZsFWnL6yn3BYx41ZmDy10HLtLPY/aH5AA9UxLhtEno5Tf7nZIUGrn7e2AwYZJEYdSu9wg
 JN9xbxHAbCIcEaS7CImKvEYZDYx7atLvVILJpJXNoq8Sb93pNX504igOj7wOWmdo0YB4hCJCXyj
 Fr2GWrHF7MA+ZVDtJf2Q0/kJcRc+P4C6/Da7d+f/jZ6HWVhlNvWcNA8apaVPB0mDPwfN7u4xZNQ
 OwWZSC8FrZIpPAs9xJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100170

Enable the Adreno 722 GPU on the Eliza CQS SoM board and provide the zap
shader firmware path.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next-20260909.
- Moved the nodes in proper place, to preserve alphabetical order.
- Link to v2: https://patch.msgid.link/20260902-dts-qcom-eliza-evk-enable-gpu-v2-1-51b452a460a2@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260901.
- Picked up Konrad's R-b tag.
- Reworded commit message as Konrad suggested.
- Fixed the zap shader firmware filename.
- Link to v1: https://patch.msgid.link/20260901-dts-qcom-eliza-evk-enable-gpu-v1-1-a7c3fb27b4e9@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 5ef6c51618bf..fc2d419cfc09 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -369,6 +369,14 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/eliza/gen71700_zap.mbn";
+};
+
 &pm7550ba_eusb2_repeater {
 	vdd18-supply = <&vreg_l7b>;
 	vdd3-supply = <&vreg_l17b>;

---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260901-dts-qcom-eliza-evk-enable-gpu-6532c131cea1

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

