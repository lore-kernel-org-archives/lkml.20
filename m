Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5703AF641
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145321; cv=none; b=FwnbWoUdC0Gcs8XEyiD1ELvtzixzNshIgNDx2tyZkmxV+KN82gxRelE7rmrLi/2XKr8EdB6IYJbVuLYaP18LXsbvSNEqsvGXTJl65hkotNjaODOA8K1auyLkYhlIRMKbqyaoqBZPsaX+Afz7ewb8PShuCVO2DOZgLsS9WTomcPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145321; c=relaxed/simple;
	bh=Msj1DOVWipO41oW51gTwfsyr27KLZriNHjyoIbm6njM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L8N90AZD2GMugZtUbZcgmh6PWuLDOf0RXB/P7w+mNb2V8uFwnBY2JBtXLBmBapIeJV4owwnTeDq9ZobpCvAG5ePx3Yp2mhJMV/FTYsHOGmx1m0JorXWnqzprwdUtah7UCgtLpx7ah8PDCjcAd3JBE63FBB6KqnwLzTk8cUH87A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Imt6HGc0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwzn0Jb8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Imt6HGc0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwzn0Jb8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bd7V1010126
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oEsuGii2+Ra
	6CMzyXnbZHPQh8RNg3JuatHxegyg2aPI=; b=Imt6HGc0AG/UqhSQQCuDFCb+NGD
	HBD0cwRhzfBgGiXJxy3XorwadI/1p7vQgC/Re4ZIF/Om3++JVL11Ss2D5A2XurE4
	pGjyZaX1cB2vVZL3GCCQfs+E16dP1wkJO3IjVu6JRfK4fNwl5p/vggKuVpwqgCbr
	FqInYKZG1juGu8kd1qLu/KUwb504ApKNaheWivhX4zcrH6ixWfx6lQoOMJwjdBK7
	8nJlUxWQr0Fm/yaAQQBPplmG3Af4PsTgsIeZmJwK/qMOSfOyWZiX9P1AlckSgyC/
	WnlrdjJbdxEvNkIszYulVUMcQz3VRJTnbTV28B9SV+K8x1pgDnuk76JB41Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgv4ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:01:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so5093404a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788145316; x=1788750116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEsuGii2+Ra6CMzyXnbZHPQh8RNg3JuatHxegyg2aPI=;
        b=iwzn0Jb8Px2K9rqul8CJHlGHfrS5zZ77FTUfLhfUEJBo1Gqw5tfnUj1Ygw7KEO1md3
         Unx3VpCGLOFp1UVdiXvC8n5ty1uRCd+vcxxxtqNYkt8K4dGwzVv1dNf11bXnZKo4eJ2l
         0xkY3rXs1XzPi+OUU9UV37jpk2WrXrxfhtR4txK4gKhFiz4evqGs2nK3+eAmlnluXouR
         ZZ0HcYZAUF207WVpfEwTc7nHQfoZGxG2s/Wd/cQh43NoYahPqfdW9L0wWge+N1tUcfPC
         PtucdCLzc1Hm4sbZTO3Wpy8Ay+Gp5WSM4gBGWu31TqVvcEwLJdu6gHGO6n9PSj02lg8P
         VGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788145316; x=1788750116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oEsuGii2+Ra6CMzyXnbZHPQh8RNg3JuatHxegyg2aPI=;
        b=s9mVu1z9TP9PbwXqGorI9HYEWpWl+8fVAn4aR6Opj3R7KkmBbnKY8yHpvuUywU5fIM
         emjtjvOJE0tpizNIUE8lgnVQG7pVy6qvLhSGiHSI5Y8ForcWt4y0G+3xyjscKDQuRNQG
         rjmJ+nCmUk5XUbHxLmWvZ2wKsxuYQa65HWwI2VnFVjk13hB/xn9KW+c86e1GxE0wi0Ih
         1L1hlGSU22Fl8fwKxR3RtqNXZCj++x4/4IMQ2TNYE71AoWwx1kfc+d41ddoJ0uveI7oR
         EzIEkquaFeah+61ncXpp4dV1d2X+87wonjN0jKtMnHFPsSrY5w8Q2h+dwNnn/TH2N3xg
         OtCg==
X-Forwarded-Encrypted: i=1; AKwUvBwk+qjQyf/ZpFUuZNjSLQl6Jh4Ifnad2CZ/Prh/ursrzbh7j9U23IcUNE5mlnfIw/p/2vEu3LqMpvMOgLg=@vger.kernel.org
X-Gm-Message-State: AFuF++l/L3i17nAxtfHV4tB55QY7DhuoWp+gZ3Q/l8B0Q/O+03LCZAyS
	sxsdqHjCtrqvOgJpH/PF0+QNsvAgosm+TFPcGj/ftta3l24GZILwRBJ7S48x2ZfE4MRvN6xmmUb
	uEFJ3I2vvblK8Yy3+gic0q71B/xXHtbpc9iTHYQJ88lyyYeH7TNrs1IQ3zlQ5ZyBfSdE=
X-Gm-Gg: AYBFou3H9GTfswMIN2KVTD5mcMSJI2vGogRHtyHW9bbTr2pCnPQsMgd4q+l6XR+tmrD
	W5i6GXbmRAmreVhEZrI8llD7lOH/k8R1Zm38aZgferhatw3DmKhNgRBkvNxZsSeA/fOrQQkMxRv
	149v1FS012N7enqOqR5mb6ECmUGQqsULYAUuKsrb7IYAYUGX6SoEShzP+UDlamog7XfNLMqaek8
	KZwpIKH9jcsq2IL6vaXJKmlE7ZgJ7IbPTd6LgJ/t8LKsYcwuA0wwUzCT4NnwfBxifd5yRSr4xHb
	nOqwq3ZZ+IVqQW8uGtOvcKHVZP7PnompON8FMEoTPIJyeQ9XQfY1jtNnaVqVrASSY/tfMmLAKjV
	N4uAJZKXv/gA1uGq8VxPto8xZ9Qxo6deoqwZQhNwBUNRCJKR03eWq7Q==
X-Received: by 2002:a17:90b:4c4c:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-396d0ebfb0amr33823022a91.11.1788145316460;
        Sun, 30 Aug 2026 20:01:56 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4c:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-396d0ebfb0amr33822975a91.11.1788145315996;
        Sun, 30 Aug 2026 20:01:55 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm30011973eec.9.2026.08.30.20.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:01:55 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v7 7/8] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Sun, 30 Aug 2026 20:01:46 -0700
Message-Id: <20260831030147.1500616-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX/KYsRS7Qdcb1
 WPSJ81PrOOhk8K/BDlodUlr5eOTgc2GuQyKjMcP2og0hasutgdiwJpPPBC5nly6pRgpUKsU435e
 RXKUYiShOFcXpz1NtqLwiwB6kRFCP7JRnC3m56IXu09Wo8NVdGgqWhlCQWEUiI3pgmIIgszj36h
 wIV5ntOxn6lN7n0hRcfXT8xXUg4/EanEFxswKDuOGieRdPPUVsoqwoCSCUlHU6za1tNdfDDr5Kc
 I9a/N+4Xw9YH9sitnjF4f5r514BkbmVQD9T8NJYXqpJA+MkNtaruJZmZPf1z1OPf/YxXdWsXhAA
 YVq/Jb3RtaR7Upc7nAvPOKzhVUHcdEpBbcaLo7akHlPycJty4e22OLYokR/HuTEX1vXv9ZhHuf9
 rR3HRywd3zzpepWooehLD4ROC0ybmg/mCWosjacHxaKm46aClBdE8B32QR4n2n5jMySMY2lZymG
 AfpAyB3I1tRt7IXtAzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX0ULcLlGf53FL
 ACQTtZ96NMVpGFaKuF/YIWKrwr2Mvyxrh27yyO4EDczDvxl956mYPkdJh98FuOoIeZ6n4A32T4M
 F8ud1miv8csPkwqf1na3HHomy/ZxFzo=
X-Proofpoint-ORIG-GUID: CJunv6o3GfA62-W_XAYrGlX6S_QimUVh
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a94eea5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=oDIJ3hVRoRHbvujwG_AA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: CJunv6o3GfA62-W_XAYrGlX6S_QimUVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310024

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

Fix the virtual detach handling by setting the USB role to NONE
instead of HOST, correctly representing the disconnected state.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 549c0d852bbb..605f675ec7dd 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -306,10 +306,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 
 	path = chip->paths[chip->port_idx];
 
+	/*
+	 * EUD virtual attach/detach event handling for low power debugging:
+	 *
+	 * When EUD is enabled in debug mode, the device remains physically
+	 * connected to the PC throughout the debug session, keeping the USB
+	 * controller active. This prevents testing of low power scenarios that
+	 * require USB disconnection.
+	 *
+	 * EUD solves this by providing virtual USB attach/detach events while
+	 * maintaining the physical connection. These events are triggered from
+	 * the Host PC via the enumerated EUD control interface and delivered
+	 * to the EUD driver as interrupts.
+	 *
+	 * These notifications are forwarded to the USB controller through role
+	 * switch framework.
+	 */
 	if (chip->usb_attached)
 		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
-- 
2.34.1

