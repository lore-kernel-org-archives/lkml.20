Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C373F36308A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525058; cv=none; b=qNTIQnkkgnW39pPFSyNYx6JBPztRMn66geneglv+k+PQejcRiX5Ltt84P7KNwV+SZmlPKofslEViia/RfEZSb4ejai64aqxCIeo5Y35wxIy2/uZJY8REpSsXD1DS6B0Z3NOnbHPdLjDuw8M+Xm4Nk3vNDS+7Zp7Ja5HiXJlLHsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525058; c=relaxed/simple;
	bh=dMaBFIhHgvp6kj4ikE/WkqbjE/VbovpetLkGFImIOZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WbpHE/r+dIFlHsSxv8hq3cPNED63RsFWjQ3EdsLDMzQASvhu+2KLjsSBjddZ3yy53LLAdxzAmFk2Nch6wthJZsr9DLKoikf7DWeZMUv2Uo5hv4AQem5J+EXPbAH26yvFMXsrxZbCo1hFCaI08Ptwm8YlSylf4W56ONObDl502ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SB8PG/qi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i7QmglOT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SB8PG/qi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i7QmglOT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYr2U721412
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GbSdUBix7PWKvhUPV21eCSFWHOqn4Rr6vLWfPbupJ0w=; b=SB8PG/qi5oiPO+O8
	jacXbxjGdAi/MzTLKfb5280X0jkUcpQsMI6rAETSATs6+HHZUZMQwnelu7x7jXLV
	I5a8YMFmqkSRfK0/ZKPB3ES9MtGwlJy97FL+28CAN0rNpi673J03GlYlfxnCt3so
	M253THPFgXaqNBzOW36LfvnoFIgQhtguR59VNvKpC7+JpshQmHUQXkgUG9IhHrW0
	vHOePGU41Eu1OP4heHrWnE88TcYZSdx5Cyyz4zORXVoUadUs/YpgOs4s3Q/YGaFm
	wJQE3nFIF54kyHe3kRqdy+AvcsX+jcWW8ePPfoWuPpnkv1ElnEYpBjtm2sUsZiUn
	9d3Rcw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9su5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:17:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db5a30bd4eso11525855ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789525053; x=1790129853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbSdUBix7PWKvhUPV21eCSFWHOqn4Rr6vLWfPbupJ0w=;
        b=i7QmglOT3FS1N5kBEBogyqXnqCkhZx7up7n013DPnUIDKFUEEXwxWDNl8uYz7PrkSM
         Rra7qtnFo7/uf/LWEoPHL8F06uY04O/elZWEl1B0zUKhiZyuK11NZ4xH8lLO4nmbVtvG
         aZvJbJjUDtyBaHCpMUZyTPDFE84dRJmeM5JDekGO8v6bApLmCYu+7Z+h4ghvADn6IThX
         5FRPh/EZNo+bcV0NqRBwke1vk2u/vwCP1JtA1LkYsxP1zHe+rSgkiScWVV3US7UYaj1/
         +jKlBSlH2yUSHZwlJ96VCnErNxJwfLGpgnuLfC2rZrtRQXtaxHkJn1jaeuGsREreoEDq
         i4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789525053; x=1790129853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GbSdUBix7PWKvhUPV21eCSFWHOqn4Rr6vLWfPbupJ0w=;
        b=zM4FuGMydn1694rMZ0KKNUMuEYa8n7eiHwVBsyPrNfXtu/Y+fN8M9cX8WwjC8s+XF9
         qVT5gNDwz1t48m87oMW2pAgk/b3npcGyB9umw3acno/BiD6YOKQ0x69EuV6r3cHueeyA
         U5aS+5IF1eKhtJbBSg5dzbZI8thODW1C5FOc4r5WIHsQ5M+spAhds9/VokmODVW+qWYg
         yrEeKeP7xEAnQ8D0GfxYDtahYr6UazRIpx8p9DkNB6tGpjGR1NOynHWdKvVa1t4esPPu
         7MmNEJAcP0kZhOL3Zx+gTraw7OPbgabZGbfaLrJjFK6y38c7ZqHNHYFR1K63RXTzxiGj
         hPmA==
X-Forwarded-Encrypted: i=1; AKwUvBxtqxX7nrUAZAPps1KN+J5/Thw4zN6cDhvpRadfRTONdhs+9HoEyBVdpS93c2OZAqVr7FJRewhwXz3VfRY=@vger.kernel.org
X-Gm-Message-State: AFuF++lV5uCQ3PB3GfLkeL8RoKoRCbCK1XSc3Kw3ioyCPdcUqvivw3G3
	jtSlNyenF5d26DapUvmLDWhY7vHx6mMRKLb7Ue4kK7D6bgoTUvpkijmGlav94Xle0hSWePNls06
	3APjd6kkKkPoZK3TVMDW0uQAqmkCn/k7pK11qC0cLjVVpZKbxh+eCuroVpHWzEc4c5pErN3zv6p
	0=
X-Gm-Gg: AYBFou2E/Yyzju7NsP2zkQRN429bBffTcgk9u091HFAOrj+uFv82vXqAKSxyBFwnWgg
	/ntkG7DMFhJkZt3Cf5j17Xs9Aw6gUHgPakBjS1hAVlcjWb7yw7fmpLgCz9PdKWoA/3oypcEpuwZ
	0vM01AvlkC7sSMoyw/HNTgQVloCg19hEbWkeLn3Yx3hI14AxCOd22Ly+ELRyS8VhwEC5ShiqmnE
	ydf3k6UiZmQT8otprlT54bmU98mKPUxrt/R2kLrCcLn586ZgAFvrGMn+NQrvt5OV6KrqQmcVAhE
	qnIJPPHRJ2iO1vK+oYdZvLV/z2LzZVf6bGl0i6twL05p+pVoAsarGc9NWteojONQwk8ypvssPU8
	XWSTFgISq87yDb4mJHgfp4dCJu4IPu7PWfDTk1UjUhslwK4Y=
X-Received: by 2002:a17:90a:d444:b0:38e:c140:2a0b with SMTP id 98e67ed59e1d1-39e1e4e2964mr1274966a91.3.1789525053143;
        Tue, 15 Sep 2026 19:17:33 -0700 (PDT)
X-Received: by 2002:a17:90a:d444:b0:38e:c140:2a0b with SMTP id 98e67ed59e1d1-39e1e4e2964mr1274930a91.3.1789525052707;
        Tue, 15 Sep 2026 19:17:32 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad9ed5sm3200332eec.22.2026.09.15.19.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 19:17:32 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:17:18 -0700
Subject: [PATCH v3 2/2] Bluetooth: btnxpuart: Fix skb leak in
 nxp_process_fw_dump()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-misc_fix-v3-2-31fab8976ac1@oss.qualcomm.com>
References: <20260915-misc_fix-v3-0-31fab8976ac1@oss.qualcomm.com>
In-Reply-To: <20260915-misc_fix-v3-0-31fab8976ac1@oss.qualcomm.com>
To: Amitkumar Karwar <amitkumar.karwar@nxp.com>,
        Neeraj Kale <neeraj.sanjaykale@nxp.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aa9fc3e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ts5nViFRsRHbD-iAU4sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: fonxBqktUijj9DxIATbhmEs0NJ0dgiM3
X-Proofpoint-GUID: fonxBqktUijj9DxIATbhmEs0NJ0dgiM3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAyOSBTYWx0ZWRfXw9lMyRnYHk8Z
 hc5pPealuEW3cF1YrPheK4athDSp87ag4XJNywfJqUvCbGR7jOaWD6yCXLCgkyzZz1+a22VRQgi
 tBt174pTafAIf2m63xnhOQ5x3t6ecSoGZLHn8t+X0w0j1qKy6d5KmKakhttFrWETDofwBGfYPuX
 gJ5H+dbz3PbXNk8MJXIU9i8amM9l8IWeU5Kg5n6SlZR31z+7jl8U31vDvKRt6Mt4bhgEskUU4ql
 p8zXdp4fFKvY9B86UiQ2x9QfzsO+qOKTpWGBz63iqH3tq4J298Wb7lQvO52I9zmNY3ZRQOh38J4
 3eJybAgvLR/lrGpe/ZoAXbjHYW+km1VDdthC/zD1QTFO0fDbHLln2DikNb6GEptNm88ntND0F2N
 uZ6nTjET9RweVVyvEa94paSe13ZxxoJwZKNDl0WD+dscaLBjaInc1cBgS3RkMo3Cf+UekATMTPF
 L15h34axrm13vzTnQuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAyOSBTYWx0ZWRfXwMtzCSDXeNuR
 B1SbUTXsvqu7tCvmocbMChElQLyRsfoJt35EcmGbeEMk8AZXR7j5LAHEgNEJLEMYK/iPufaaSvx
 rIohKoKvdYYUUIUFgSlf8cJUrroa3qg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160029

When CONFIG_DEV_COREDUMP=n, hci_devcd_append() returns -EOPNOTSUPP
without freeing its skb argument. This leaks the cloned skb and also
prevents nxp_set_ind_reset() from being called to perform recovery.

Fix by guarding the hci_devcd_append(hdev, skb_clone(skb, GFP_ATOMIC))
call with IS_ENABLED(CONFIG_DEV_COREDUMP).

Fixes: 998e447f443f ("Bluetooth: btnxpuart: Add support for HCI coredump feature")
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btnxpuart.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
index b975a00eb6f8..5c730e336114 100644
--- a/drivers/bluetooth/btnxpuart.c
+++ b/drivers/bluetooth/btnxpuart.c
@@ -1383,19 +1383,21 @@ static int nxp_process_fw_dump(struct hci_dev *hdev, struct sk_buff *skb)
 		err = hci_devcd_init(hdev, NXP_FW_DUMP_SIZE);
 		if (err < 0)
 			goto free_skb;
 
 		schedule_delayed_work(&hdev->dump.dump_timeout,
 				      msecs_to_jiffies(20000));
 	}
 
-	err = hci_devcd_append(hdev, skb_clone(skb, GFP_ATOMIC));
-	if (err < 0)
-		goto free_skb;
+	if (IS_ENABLED(CONFIG_DEV_COREDUMP)) {
+		err = hci_devcd_append(hdev, skb_clone(skb, GFP_ATOMIC));
+		if (err < 0)
+			goto free_skb;
+	}
 
 	if (buf_len == 0) {
 		bt_dev_warn(hdev, "==== FW dump complete ===");
 		hci_devcd_complete(hdev);
 		nxp_set_ind_reset(hdev, NULL);
 	}
 
 free_skb:

-- 
2.34.1

