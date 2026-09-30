Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907E04E4C49
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777941; cv=none; b=h2NDJiakz4nZ84qX+eReAV6Usak6YWL6sjSBuCkZnyXK35N7rI61FQoFK8ODdCKZMDFDxEwhyHe+4cU77ETT2MaTfh06pnjVPVFxug9dQBnzo5qBv+r51c+FvZa5iad8ddxuC3dqjAlO0OeXM84oM8qpkXu9cKQPSk3SJlyObJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777941; c=relaxed/simple;
	bh=Zm8g3oz3CixIaRv7oE5kxbGfu8YwCAXLueO/nrs5VlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MndBI+Lc4OCLcdI/EpUwY1w0YIJJ5IKircYA4gfdDzVvq+GCmoondP/jcBcCPBsMrvdik4GZkYa25TDmFzpgdYMiSfs24zPRDGsqtSoWbU2nxamDCd52p0+m3cfIXVSEQo7KDLts/3b/ZZM9WYevlE7ICVLWvFj016RRLdYPSS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nVof+tCL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yub9wDrk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVof+tCL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yub9wDrk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxss62404711
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7bpTUMb3ODR4fZWLx9HiLu
	8A5gFtV2lcsTUwtO9Pqao=; b=nVof+tCLqQBe7mXow4oTRma/zpt2zBN+ytou5j
	d8R2DOwcoTGwIHvYAG39TDHTTV+8k3ocZ3041Wvr7NmCyVz+xwLHwbrZW2C0LCti
	iUwMJS52KtrY3vzYoa5kTtDJBDQD9G2y25ofDpgCzshs8V028dHWPcSAbD0nVBhC
	jdpmjQhfYJScAWlglHma3pdCP7YC5ydlTvf8ceaq9bGaIAjWsqvSLjjtr9fry0zs
	r5h/Hx+J88DPQyiKbzGR6SiKZSO/ZkW2L/r6AACAXeGDr/mY2597J/ovcigEZT6Z
	kc7/9fwF2bccNiY5no0WavLdFvKv5Fw3x8V1XcxPcUmDm/1Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c1rym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:18:41 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf6e54f4cdso4221137.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790777920; x=1791382720; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7bpTUMb3ODR4fZWLx9HiLu8A5gFtV2lcsTUwtO9Pqao=;
        b=Yub9wDrk6l4srXeqWmXJTQ73x/J372FbdhyeMUY2oF+DHlb7iSkQ7Vac00MTw+1DLS
         qPZ3VIVJQ3D+zDtEcL6KgHaah2+QIXDRMTKydCZ0hyzPthhtB5cEYEW5HwoFFy99SCtB
         tw7Fff3t6Y0AIsjmT8eigteM+hNCGrpa5lEJmn3sRFpWeWkfmsdkjHxsKg9tNEqKxD7+
         ugGogAnKum/PsT8u5neiGZb2jpmf+5dv2HRpkHEZH9IbA8lEh6mDX+dVhb6q8Cldi8hR
         TALup3+n4xWBOcqqwUpHz4C0V18lu+jUmYeLBeV44n5AcW1zMsn5qmLAPtfrQ5oyTDAE
         HZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777920; x=1791382720;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7bpTUMb3ODR4fZWLx9HiLu8A5gFtV2lcsTUwtO9Pqao=;
        b=mlmPhmJESxJ5ELxCEifJbpVmLe5LUtpcBt5t/ImOdPJThh2Ou7+YG1e/CeoXpCM1iz
         jkPLv/oAO4+gMhvVEzrj2dmmKUe1EKktEfq0KOxX0QebVPKgy2a/HyLSOiW0VYLKvN6t
         gehuDubEX71EWTVE0ptVvv8iiECC8JGU2Y+qlHIXL/QLyq3VwYKsfK1jRaW7lJOKsqWb
         3yz00r/8xCJlqPU6uDdoYPhBdgt2mq8BksoKUIXWK27mhOvL/SMYSj5FMdA3MU3eAf70
         Ou6tp9xHx4uRbdBFc9nWUaldNJE4dO45C98k9tcvxVpd/8UbT/fpgNqRKkBP+HagGN+N
         KnAg==
X-Forwarded-Encrypted: i=1; AKwUvBwLAQE6R7M6CLdLROI5gD31zPlFAuIUdIWsDQlcRZOh8X5HE3cG/cz6wfV1LiLie+mSoWWt6g5sqltbH5o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBceUO0CYE0JO5LIykWLnkd7uUWYPaugfkQ7sV71NOwSUAEftN
	YWZZ4GjSmAn65X4gPiqJqZGjfWx2G+JkiQzN7OWLe96OZ8UGOE4qN8u2tmaxT3+SSAmaZ1otUfn
	Ht6Ri4EVYZ3MS6tMPNUqWF8Wwu4a4rs2i25JFaHOuKMaWZAHk5Phz6Jy3bTAUTLwmX4k=
X-Gm-Gg: AYBFou0A8Xk5R4AHblT7makAPssXRmJ/mkZfk+2FKG7TLGaRhDnK+tzCCgJB5x5Ithz
	K3Rj8HFwKmGMUNlPmYehH4gZPbnVLwFrCYOjoBU02+Fd3y56rhb/f5L8VhImfS8ndDWlxtFZa/p
	G4mMt2wu4CU7xdlRjV9SwUq+v2VZTl4EbzW7yBPkuFq2pj2PQfpU8zo1/N3n/ov3nieLFmpZHN+
	9+qvqwGg9coX6JNcmaUk3VAZydc887OiU2u7BzY38m+BTPuyL4w2cB8lDxu8ocMi+aBTxkpC8Iy
	qu9SIH87YhR1i1rKv4dKiGSYyryy1PO2GCDHzXoXUcjcn/wsJJdQNa69EfIe7Auw14XMnH3Azob
	xkzAUqPjX
X-Received: by 2002:a05:6102:26c2:b0:7a7:19aa:8a89 with SMTP id ada2fe7eead31-7be749844damr395654137.36.1790777920166;
        Wed, 30 Sep 2026 07:18:40 -0700 (PDT)
X-Received: by 2002:a05:6102:26c2:b0:7a7:19aa:8a89 with SMTP id ada2fe7eead31-7be749844damr395629137.36.1790777919567;
        Wed, 30 Sep 2026 07:18:39 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01e6607f4sm2469335e9.11.2026.09.30.07.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:18:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 17:18:36 +0300
Subject: [PATCH] platform/arm64: qcom-hamoa-ec: Disable the SCI IRQ during
 suspend
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-qcom-hamoa-ec-suspend-irq-v1-1-ad82713c8d11@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADsavWoC/yXMQQqDMBBA0avIrB2IqQTaq4iLOJnqFEw0U0tBv
 HtTXb7F/zsoZ2GFR7VD5o+opFjQ1BXQ5OPIKKEYrLHO3G8GV0ozTn5OHplQN104BpS8Yutaaxr
 yYXAEpV8yP+V7vrv+sm7Di+n9H8Jx/ACFJCDpfQAAAA==
X-Change-ID: 20260930-qcom-hamoa-ec-suspend-irq-464201cadb6c
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zm8g3oz3CixIaRv7oE5kxbGfu8YwCAXLueO/nrs5VlU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqvRo9FA4yIVKJXL+Kzp0rMyPHbfKar6YpEERZP
 szziYSGNCKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCar0aPQAKCRAbX0TJAJUV
 VjzOEACy4OimnPkZlHgRrvsZT8P4bvWbQmur/vPBuYj3aU3aG4Fqm/xtVP4T2qqWmNloud6hAGY
 0Z0RnZKny+IUQxeJRAYwm3lbX1cdsE7DScC/k0jfv2npAu0YCQE0WWE8DXpY8zSWa4VN/0bj6BY
 xm6eCHa4VHy+OCmerHb61cltJu6QSG8wBGoqcCxOpTWMwP9Zh1xtYqglHPtXGgYLA6Iy/KWU0NE
 tGhoisF95+75SnuR60QoyPlZ6a7Nps9211QMQpvof5rOhvj/bvvwUdqJ/33WTB+3YQVChAjBtfo
 8sAR2lrhNDD8k3MHtVXgr+HELIZ25+Xm1cQ+eNecwL78jTQCgbBkdUM9K01pmLmm89d5UsuheVf
 BvhXl9z1Ntvi+jK9KYeoDAY7coMM5shguT5eVOHaHcV9YigSt8RLaFhBlXUE9Hvo1fD4p9jy1dh
 NUl0w7aXHC+KBjPCaGU3552mLCrbNjZLXjrwPEpzbqIgaF4hHMveXlCpNdY/vDEM03sBNV1gAoL
 Bj0n9nlDNdr1B46jTwtzujI8OZBHXhabWVIAKBv5CkprWnZtk76rOVRxETmcHN58YsTM4DwY89Y
 +roMQasY4nWOMCpzjHMPZwKxPzNQCm6vDGaCcItisGBnYizivGwXZz7YSUSFr7/f9JIabt32DBJ
 3+GZcHfQP44IsWA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfX5LTyLANbfxgR
 xulK/IZYbkZ9eFZjHbOnjmFKC5jlQJGeLWThk6LV76aFdNnKw9lHdA528LAaqApti4S2TolTgEf
 3Z48XU+tvXjJSIIDVxx5j5rJYY98RWo=
X-Proofpoint-ORIG-GUID: vuhBcETIgmHWFpqamzgyeHGBrkmXY1Kv
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd1a41 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qH2p2g-4CMqcrQuKSa8A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: vuhBcETIgmHWFpqamzgyeHGBrkmXY1Kv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfX8i2uxWL2PDtn
 PbmlcsUs6yTwwASTS1ZbxXzb5eWsvEA5cPQtQJA7TBGyxg53t/elI95+Y569cDfsqZk73nQswhA
 R+bTYo4aA4IotLxrjlkx0AiAHWYdfY1LpFjospzJVoFy0k0+Ez/BzObX8XZiaFOhRG+hNP2ejuP
 MfUkDLe9onThrGMitrvMcJ/oPFDISLGIdGvml29ObNel/PT8Wtidd3nmjYgb2mfOZ8dxFShxOgZ
 8ESSA/aKRrm5iDp+AY/kYcjr5K3XmM5nSTK6czgQsWtD5o1wrYk1wPPG9YWYLwz04/1E/socMDk
 4bmqSn9Qh8+IIY4L+ysthB+NRoDO0nSo9z07mKq7QgV0OEbwcvXejGqtspyaS61YAhsP+iC8jfc
 zcOF83sDsebhdKeEPiYonikBgdsZr8UVMVWY9mezT6Y7MZMJ5IFVwB3npnK79qyPW/feOMN7F35
 8xs0TbZ30gQ8ephYbLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300056

EC SCI events require I2C transfers to retrieve the event information.
During system resume, an SCI interrupt can be delivered before the I2C
controller is ready to handle transfers, resulting in failed event reads:

  geni_i2c a84000.i2c: error turning SE resources:-13
  qcom-hamoa-ec 3-0076: Failed to read EC SCI Event: -13

Keep SCI interrupt handling disabled across system sleep so that EC
events are processed only while the I2C controller is available. This
prevents event reads from racing with the controller's suspend and
resume transitions.

Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index 4d2ad042a7f8..d34afd901324 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -331,17 +331,28 @@ static const struct thermal_cooling_device_ops qcom_ec_thermal_ops = {
 static int qcom_ec_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
 
-	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
-					 EC_MODERN_STANDBY_EXIT);
+	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
+				      EC_MODERN_STANDBY_EXIT);
+	enable_irq(client->irq);
+
+	return ret;
 }
 
 static int qcom_ec_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
 
-	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
-					 EC_MODERN_STANDBY_ENTER);
+	/* Keep SCI reads from racing the I2C controller's system sleep. */
+	disable_irq(client->irq);
+	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
+				      EC_MODERN_STANDBY_ENTER);
+	if (ret)
+		enable_irq(client->irq);
+
+	return ret;
 }
 
 static int qcom_ec_probe(struct i2c_client *client)

---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260930-qcom-hamoa-ec-suspend-irq-464201cadb6c

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

