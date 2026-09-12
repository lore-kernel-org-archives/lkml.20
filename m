Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0AD3F12C4
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253597; cv=none; b=VzTwEDrfqOOyFguxeJVkFo2C8o6MDjxkpnkYRw5KgV5H9RJCmRzxs6x/AighnT4pkOIzxFpfFB2NUp/mS6HhtQ5ivsgZD2DzTgZm5Z98YwuC826cqVG3NTeCPyBvw5oV51dkO0WJ8tD1M0aFKS5Pyt/VFpNaB4ha333jazgECqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253597; c=relaxed/simple;
	bh=rzM7FDp46PONIU3FuZdRnR6emc1m2RW++R52letOKIE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U86qgrH44FSrwNV7Uq4AvyElsbYUDQEdGhZy8gd9ui6tBepbvYnUKVxqUigL6hrynAzMjt0o6JhZJcn5gmzkK9nCdnqg9Ml6T2y6LKySUyFzWw6GhpMpbKodg2S1d0apHmULFKgxY+UTs/pjDnYvxJ9xYxhfuF/X/1yNAZb62E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a650BmU+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Coc0jq0C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a650BmU+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Coc0jq0C"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CMjAAu927537
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y9biAXn7ssv
	b5YgyKLJsEP0aTZIozodH3BSXfrvWTnw=; b=a650BmU+K9WLJgRcW2DgzwEKaY+
	RfG1z7xTXtfzL6gya+09Led+VFjt37ZE7fjjlAQofCMIAVuKDP6wXwHiVAwQ6fVg
	1n94cDldCb2SEAA62CO4VP5mXzYTJ2X2Pw8khs55aroKyJNOdT9JpKFbBtVPxbDU
	xjG8Wr3kW+CTiPJ9NUPBNE2nz0+cpr70GIvBwNUCEo0+5LH3vKD/mUQzV1gkfi6L
	WXcTvrMsIDNr+B/LHYlSB1qTBdnEAHmp16Rg3bjzv/Sbm8gpWarN7ofUO1z0YYuh
	JWT3LX+afLEAqIJjEoGVHN6sKZGAeIsyOg5eywUKwgf1qJ+G7Cq7VoFB4tA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ca31c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dc7337e2a7so24955385ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789253593; x=1789858393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9biAXn7ssvb5YgyKLJsEP0aTZIozodH3BSXfrvWTnw=;
        b=Coc0jq0CgEQO0HH6zi8XZSex9XuZfB6PQ0GntZLeGlVPfgiEKBWkzaaMurhlkKQTz8
         hleQJmbM45IBb2v3YTIeYY3BnNNKVrUA0MrcQwr1wJec2JKIRBteFN8jtxSkjucVD6Ni
         rtKNBkFnfvvaCtxUC/ebHiD+P8s+nDdxLvlI6XnlDZVRYL/1iKiTIGNkXhCLJr7kEnmo
         vOk2jy21laMZ3cqtja6t1DadKFkM5CqVbKtgX6WexDbuZbvMbtlViV4iX2ALsCG8kAj+
         y5a7SWFbWsbFmEnP7F7uH8QAmsORQBAgWMLBwQERMtWXv129dMb2+zAQ0T4FXxgZoF5V
         SfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789253593; x=1789858393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y9biAXn7ssvb5YgyKLJsEP0aTZIozodH3BSXfrvWTnw=;
        b=Ex3N5wD49k6OGgxQenqInIfAguyIpneG89Fle6gj7OtMwWJ+Tl9bSiTQMZk6+86of4
         GhfP92YnsfPB14bHqUIulfSfY2Ha7Nc6XwqxX8GYr2OTxwXAdgnsj8pWu12XogAsbqju
         mgKdfL7h+cOT5jALHur7Jmg7Zlfyb5A50e4cG7roSDbL9ZrCqJxsNuDU/8XX6QVDoKX3
         RjjHEROCt/JBw1omd2tDLNjl7ZGBN9oYIF+f+1/Ld4qh1A1Xk4Bdj6E6Zel2sqAUYo4a
         sLANFCnBy7VNIOmrH8dDCkqwMtzjJHewZwgYGgu6zGEsr7i3NbzirqnAkVcLvE6VHF3V
         5IyQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0YOfJpLRzEPPuC/V/7bTa2j5X9xaLL1rTm12K6QSGMgegO0zxjQA4EkMc6zFFl3n2kJzvEXeji66ezts=@vger.kernel.org
X-Gm-Message-State: AFuF++mOfC8FSHwmPmnx9aNN0g3HZcS2jAruq7L+kDzxz0pbczpa97+f
	XKL1/Lp2V+IvfA/TpWje/N0byTj8i0KCBYkaMr9iPxoxGPH0J3S5ouwEnL34aNQm+VmAvbKWSsL
	021zLuJSKoSoqkSfE6VteoMBtWKet6H8avbPEvbumXuw0m2tbaoWuBY3I0LQDaqxGak8=
X-Gm-Gg: AYBFou1ALiyiRb0/h8y9MMoY7IwZziI/koGkqyC/sd+/VByZDBVyp0X2WTWjESbD5pa
	EdyBho+4iNELpBoL6rH76XQm0N+9uajSDgs8WNuaR6pZeu3XGGiWf2PxLiFq/T7JpeWb3L5Gmxe
	TS5SWgJ48pBDePIf316RfAsgG83RpEtr/PiW8lCXfizjgLe9o2ff7iUbxAZRFQOEORaqgGu0zxF
	6La7PKt+LV8CUS3csiRHa5PxZxvngCnHpMOkKO7AOFuiG0kNQxBMh/myeXprZmpveeN7MiCr3g0
	T1eXB5R1lFneceDKqpjVA5+JYtDcIjrU9lUSmQ/7rRiFkpMpAe7QDEViz/PvFeRy6OoqI2EOnCG
	MyDHDNVlyWPg7frd0GK4S0NOgKbOfGrBXlLB6NGqOjej1LchaN9UOnQ==
X-Received: by 2002:a17:902:d492:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2dd2a1d8c55mr172889615ad.2.1789253593615;
        Sat, 12 Sep 2026 15:53:13 -0700 (PDT)
X-Received: by 2002:a17:902:d492:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2dd2a1d8c55mr172889245ad.2.1789253593104;
        Sat, 12 Sep 2026 15:53:13 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm19741555eec.23.2026.09.12.15.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:53:12 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v8 7/8] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Sat, 12 Sep 2026 15:53:00 -0700
Message-Id: <20260912225301.3396556-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfXz+x9m8i/llHQ
 nQxd/g5JQ/YfW5HnMFs6K9O/eYXCZlcDIO9nMKz+NFu3gijWGmDuCOzflKHwOr2Ro3BwJ064FdL
 /5dV6ghCdE6d0TewBrvs98uzQ7bVIZ4=
X-Proofpoint-GUID: 82WcRJ-48QaFoA8miRz9_RTbB3oBRhyT
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa5d7da cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=dOwNoGVJVf10FbPJOZQA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 82WcRJ-48QaFoA8miRz9_RTbB3oBRhyT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfXzOt8ttfQufuS
 Wta00AjaLpcQRiQpj1tFjJI9eXFnoGGMr1JBAVKeaq7v2TEsS1zEiUEeKjCe6IgFvOiKxEW4/Ih
 tYMx96BdCLpaTdJ+QhCMmzOa2FgsAXgyJdfR2gu+zvFOB8JoiwnkLMwNW3kZ3+K1gCLJZ0Qg//g
 3OluKQoYRYUPKT/UiS5UZZPb83Ncpupj7zuP8cR+EZZGoAM6doJLiXcdQVJRsLN8+5a/CvwcQdA
 6UeAN+l5VE2mFxQdrXWlz28AG6+qM0fPgL91pYP/hrgntbkKwDAUsa3mOe9iyAnu7oR7OANxokS
 myUTaT5TSrnO6/GzQTXGTl61VsdHuya8qVXhO5fgszddli3wz4NV/d30p4UyTubUab2hwL8TLSP
 OB/QTId+3OkP7uLjHcUY3Yn0uFMWmB+tXnDi4WzofHKi5LJsIJUczIVuy6hKUxzc/Ds8wYCkYy0
 M6PSeYZDYN1N3y0wfcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120334

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
index 353c45dfd328..669e2e00dd7b 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -313,10 +313,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	if (!chip->enabled || path->curr_role != USB_ROLE_DEVICE)
 		goto out;
 
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

