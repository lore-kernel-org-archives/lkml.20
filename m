Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF48E36B920
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791610427; cv=none; b=itN3YRTSo9LR2P5yCBfbbCUhFfuSU/gdlhzEuPFcyS2ZzBuJHIuPcAnY15nCVqZA8pSIzvPNzeLzqiCz/A2QIN+R/dyZe4I2N3h0vo7qxS5ZUE0sby0yQQkGZYtG6ztDiHLydxl4yFyjdmwO3/S94w3KxtfT4tBaxqNO35TD4Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791610427; c=relaxed/simple;
	bh=ki44rZqsHENfxwVaIlWsw0mriK3sPfARHJY4IeNij7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cs7oL5nGSzFuJJYZgzXply8gbJcN8Ok7fAV6tyK5XqnDYm+fuT9ytIaZejnSmHSEy/zF8Iw+w/Pg3p6JV7AXYKtnTgRhP5sWg3UGRcdhDK+ChwWer2c0TG1e5SjTHEDAmY6nHEt3OMLPR+yhdkYNpO6BqRyF7OAarXhexyCRyMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YE7LAYmc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GARrECTm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YE7LAYmc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GARrECTm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A4BoqJ3207453
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ihzh9krNeTK
	98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=; b=YE7LAYmcCTo88TujnZaF+ZJ1Mrx
	X4sZ0y3CgpXlxtyvyse/p0u67xcdLMMH13CYJ+meD7Maf7whpr/87TBoaK5NBXdy
	5dxahD0NmjQuCoArfxZoCxjlz18fyCGQfO4etJeaf6lzW3luJlqIzqaXKUSWmi8o
	NGfbwk/tnWeZncbKYkJJkMVDb7tUkj3xQuQzug326MQOUCKqHsHn/nR4Px7Pb1mY
	6HfXLuxthIJ6AqpG4HoBboezVec9yI7q1/kPQr4ZCm9NlWE8Wu6BAbqlW3KftTJV
	/YhyhAKwqHp0KhzzAzEmoOhEDStbrjYh2FErmjRUR+iE/Bi2FsIEBiQ8oLg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4e84y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:33:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86261e66700so219728b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 22:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791610425; x=1792215225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ihzh9krNeTK98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=;
        b=GARrECTmT0Kjf8vvuuase8wg6Jvg4Bpi3iWEFOmq6H8xWAfE6XrTWK3NIhROiD5xCP
         /il5exfHv/jTQwaMJgITaTynCBM/WMu84ldXctD4wThhvBMqLA2GTGtsHjuOnWhmKaJK
         6CjlArmuhGawjVF5E1ECbyYUOo5HzkvSyx9fuXrHvg1w8pTaSHAmA/2gP4+L9zDvgZry
         jJ4c1p2jAgVoVH73nPlPNyYdaQBsufDhmUqGVZJQ7PgJoQABmbpj3OaoDVhhO84lRSNn
         Tz1Yj2WI0y7RM0qh3Sn/y+t3/XGIwzCB/aYn1eIIOx9W/nPtAWSD/ZtcLVT4VTjtwHJt
         zK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791610425; x=1792215225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ihzh9krNeTK98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=;
        b=VFfWsMhWmieBaNlm1cXzSU8vHRvx4YwGRH3CTqfuBnRwzuyCJ/OmuxG2uZAb+3rv8X
         QQfrrBFcQfwaedybNHy+95sObuYauaG2FJRjRShwBRRSpXaqskfhVDBRwLxpVZHoF8vE
         6Xn/wlGTOUP1lMlSBz1H5iuhpcaG4HE4SfTB6msstsm8Q34NaPqr8C8muqvF7P4aJDoW
         KzSRjtpMPHvdOXKT8C/LyjS9Bc9JHX2U3GkeLmHeZmlkQiUJxF3Zyz9tOH0hz4pV/NMC
         LAaTl8bjLnwMeVh66tgTIhQ9XDhaTZpQtdlLN1axrSNkrSM8jw8I5AzbpSgdeo/QotLV
         kOGg==
X-Forwarded-Encrypted: i=1; AKwUvBwm9aJpkermRCdLNcbxqLsvfifhcTX/7xFz6Z/AobVY7RHBpw8ubV1zs9xMvzyfJGtd7sy5YImqdo4OMWA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOLUnjC3oM4T9MuW7HCTAVX35Ck990hRMWl9dnkWgxzgVhub3z
	c1m/UEIzs7GY7kLbpkXfBO/hm6KV9hn6IB04ASwdTf4Y2MHo7mK//kiBOQVpP0gUZ3BrHxZZot4
	hxbGep0SHfo+dHhhVzytCjTVxUe60PBI1b79OqUqVhr2cu4nhhATpXLNpxbisunbxxPE=
X-Gm-Gg: AYBFou2dAzXxzClqiTFgB7Pd1uhC0EElLJ/5/97wkv9JXEr0hdZt0Jq7WQA8QhUXrbj
	7I3e8z/O5ZbTfL0XjoqY5RFU09H8HthRz9vln8nRcCteh0qdXMjXCeNv32BEkI2ag70E46dll6Z
	RfdoCjLpmMCQYhikA/EOGTkQe6RcLCAFZhIMb0kUfOqgGsMMhdw6pInUp38RdSMuljQf9KKU2lL
	5/icDjLpZT8OT8RZi1F+8w8A85kSwDdB0mJeQr6QCw7gusVhk7oERPmrqyenPAHUwaYgj3Bhtpz
	ME3nybGnS7vFIsQXrAjkpDAP7BFRjgfw6NLp+kUd4RpCLUSYZd5hD3Nisft5A2PO/pLJwqvQyW8
	QoASXgRJkk/0va+gXjp7N0xcVyKti+uE=
X-Received: by 2002:a05:6a00:99f:b0:886:61e5:cfbd with SMTP id d2e1a72fcca58-897c79d7cc1mr3405934b3a.45.1791610424139;
        Fri, 09 Oct 2026 22:33:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:99f:b0:886:61e5:cfbd with SMTP id d2e1a72fcca58-897c79d7cc1mr3405915b3a.45.1791610423647;
        Fri, 09 Oct 2026 22:33:43 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89928fd8469sm174028b3a.61.2026.10.09.22.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 22:33:43 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, p.zabel@pengutronix.de,
        wesley.cheng@oss.qualcomm.com
Cc: sriram.dash@oss.qualcomm.com, jack.pham@oss.qualcomm.com,
        krishna.kurapati@oss.qualcomm.com, shazad.hussain@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v3 7/7] usb: dwc3: qcom: Enable VBUS override at probe for default peripheral role
Date: Sat, 10 Oct 2026 11:02:46 +0530
Message-Id: <20261010053246.2991984-8-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
References: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfXzEZe3JnN0lGq
 SDDMT9+NadBWTPhj1lJUnmi4AXb3VAJvnujdBxOxEyGLzrNSFkTYoEny4lZv6kMegl7Nfk4b/7W
 HI8j4VdX+FQoqSBgcnDrmn+G/UiQtoSiILXnWJG0ziDhCsmf4QuB5vKM4oJQHFUzGr/yCEbFePc
 aUeBaykbSyDCVT9oZbOCMsCcM/UOJgfU+AORxi7qGZq7YDwXpwZVdzLU22EplLNlDcquZ4Wh9Ee
 LLo1sEHYzUAgrh/7yEUXX7evCsOLFYUzGW65hK/ZwhqWJUeiXR9WjjvPVcwcwb+2A7wkXU9Po9Z
 BDIX8jOn/DQKo61lRUp/oodeTP0ZKmsqROwWd8cuqewckIif9nz4MhXPB8/vx05miyr1ssvyxIf
 ihNwx5IR80OclrOzkMSR3H7IijKEQRsKuQAQ/BPzMw+cKdHirO1zXST2byISFb20jfsWh2Q4SN4
 3oEEol2fJaJXzfBhjtA==
X-Proofpoint-ORIG-GUID: HpPdzPA-T1U3vGZe05FPkYY7uZhgJ4OR
X-Proofpoint-GUID: HpPdzPA-T1U3vGZe05FPkYY7uZhgJ4OR
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6ac9ce39 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=KL4VWcfqKbbHtFUGL8sA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfX7/UuzfSOTB/D
 a6Tb/bxHYCcaJnkFY9ugsiz2aLsppWM9oS49AIMnaha10VfLuhwyCwiIzc7Rqt6YbS//FW9yKVO
 uyt4nHyci1p3YItMtZPFltAd0tgtKz8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100021

When the controller is in OTG mode with usb-role-switch and
role-switch-default-mode set to peripheral, the role notifier never sees
a transition at probe, so the QSCRATCH VBUS override is not programmed
and the device never gets a session-valid indication.

Enable the VBUS override at probe whenever the initial role is
USB_ROLE_DEVICE.

Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
suspend/resume iterations completed with no failures.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 0896a323bdda..92f1223f7b21 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -953,10 +953,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		dwc3_qcom_vbus_override_enable(qcom, true);
 	} else {
 		if ((device_property_read_bool(dev, "usb-role-switch")) &&
-		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
+		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST)) {
 			qcom->current_role = USB_ROLE_HOST;
-		else
+		} else {
 			qcom->current_role = USB_ROLE_DEVICE;
+			dwc3_qcom_vbus_override_enable(qcom, true);
+		}
 	}
 
 	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
-- 
2.34.1

