Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B95534E01
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420774; cv=none; b=D0QB7OfA6HzD2ra/xPTBLD/kne7k1ziLnsE6u7gxHYCIFAd6owb1BiIidvLYosgh3Al7uX7zv5VL8U4ORoSOxpQvYFkhpxlJ7YPt6ZLKFiLgO/5ixde5R8fcK4OzXZWiUc5dTnF/gOV9bZdrEU1gl6G3LzmCwqkmdBcR7bkG6+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420774; c=relaxed/simple;
	bh=2h9UIOLonoKrDR56nbeC/nC3gznJkCFahloq+sP53xU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CxorBpxr8/s8xk3BiujC5CfkCPRyzIATDWYvJmGxA/KV6oDVMo/mvICM+Yn8CPVWwOSElVxZLJJ6vca9fe1ETKgR5dWTIBRgStsYl733Lor8EpEBE8qNSP+nabquv4ucargtrRUpZWc8+f3bxR8odwg9b1IbxYMuu2VmnNmAv5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OM36+XGb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cyBvzkYD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OM36+XGb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cyBvzkYD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0GsD4042676
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sb69aQPpuRDPIxY/hTHIVb/r+8ocignrD35XzySTbJg=; b=OM36+XGb92Zv1aKx
	jkn4DkAPA8yjiR67WxcpgheEbDLJx0FXCoLYgSPOJN1QLjV076ATYbpam0nIOJZT
	2iawdUFQfQktICkzmegT/hIqhSQfX4efdzGpZq1uLI0dU3TKud0oTTBR50eaICC+
	AFzYL8IHVyvqeCG2rpLuDWI0hGExTS3PzZ68Hxtg/vWwDcFGbtu5VYA053KVzKrx
	quTzLtGWTPk2Fo1KRV3QNNYpfwJJRKMLOTOJhW+8KI2mUfZj7M2DaBm1FS7Fdagd
	I8sJ9L1APaM2VpgZddKcbo19y4z++pKeSyJJRvH2olBG6BLfOj2woB9DwCcJ+KCn
	IoOhhw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf47hq8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:39:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f322ef7d3so365873585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792420771; x=1793025571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sb69aQPpuRDPIxY/hTHIVb/r+8ocignrD35XzySTbJg=;
        b=cyBvzkYDwtzjmDpRn/mmIFdRD4XiGDmbMXI9thvOQp79stBzwnkxSIpOJOLNBw6qQB
         DwvkKHhD5nPXAcLkIM+1VkFCtZyDJQBgaAPC8NU/XKdEELpRRfr3/8qriem3qw2//rae
         B4pvUf7dVlDw6MbbRMV8dsyKyw3EEWmbzrWsNq56utrvcnQWHiuF+p23Wlw0jJ8v21cH
         gBSBQD6H2TstXeQST1cxAdQsPAz+3U1/ZZ2V9M1vAj8Q7x8ACsFyBrT4+H8GIQQVVV8A
         O1jsL76xv7sIEcAj21C4QwQUDY7BvdXZliWWE0W/j2bndPXPwGI0Z2gEviQHkqO8gNXi
         7RnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420771; x=1793025571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sb69aQPpuRDPIxY/hTHIVb/r+8ocignrD35XzySTbJg=;
        b=WXGQpMurK7lpFMfGofEyNqM98C2psSNzOp7odxbPuLfzy8TxKgK61kezqKiDnL7x1i
         jTozBLbRu6jpb5iCRzw9s5g/UHViJ47I+vy8uGkk9CKEGT5OoC80+9JD76YNtx2Jgrx1
         Ech+DGePZ1uNldrd3RwS5LrZAKaYzGq6GXCiwZQ5MvWfh5LFCv7gUyRpWNAEjBw4//eq
         EJ28M6mKkM6WMiLiLnyjbqIII0KO7kfpL7BSNBo7XyC9StwcmsLY4A6f0l73XqIvXF57
         dXsn2fR3UEKyTjkM7PztgxKT76LS7LmBhqBVq/wPf1f6JOrD3g00NUqB6+VR+khTfApD
         OiCg==
X-Forwarded-Encrypted: i=1; AKwUvBywDZf86mrngx3BN5GLUSHxQj/g3qRp1Q4RP/6XUTfjJbym7Ow2+Zih17MT1Onog75P5QoFFqiUQFoOJVY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLY6lbO0f/w6YuRgO/fVAx/8Odh//xr1lowE8NVQoKkFqCWElf5
	aEyGdxAfA3hMS55lK+vXAHwGUglevODPSGrL+0Rhk7yAnpF2GzasZNYpKlMlS5+KVWoPO4dx83N
	gMlOeaSMqkZEqwwz5Rc83ZvwCKOBsYoFatXk7SHoEaZq0+OqG8y6Uj0tWMKGDfXczx0c=
X-Gm-Gg: AYBFou3YlTBFNoDhHsVzbQZmRtKNSM1gvcXA5N7QwThZmczkhWjvQT2qwq5uMf7Zt1D
	9RX9+fHTp8V0nx5LWmF41bThftMwtZBzaMtLGUMOqZ55oV3rbUmwoc8SaqMetnn1R7xzKAtMxEJ
	CTtB/YDX19Qv/pnKZmcBBWttbpd2nh6EXbR2KoI5qdtWFaK5Uqak7e5PF3l3Ih33tzudlceibId
	qoysfHysAz/6kaFebWCi07ltFdNvw3C90rESSvKkllV3qlL5lyuAs6dsS8XHlBATXlUBa3tRdJi
	QYzz73/O8keQ/fEtc9fdGsH+8Sgtrop+VETvVoJLHW3bC5gpxxh3pQD9T/FiH34XGsw7B1WSVX1
	AlizuktSGJvaXpdL4qZH1SLsj87bauzKYcZs48XHpmVd0U0y/7AFSyN13e0YbqFkJQ6bJ6UHqcd
	6izQOd2l0xqIUk
X-Received: by 2002:a05:620a:461e:b0:939:13a7:70f0 with SMTP id af79cd13be357-93f29b761e7mr1412811185a.5.1792420771422;
        Mon, 19 Oct 2026 07:39:31 -0700 (PDT)
X-Received: by 2002:a05:620a:461e:b0:939:13a7:70f0 with SMTP id af79cd13be357-93f29b761e7mr1412805685a.5.1792420770865;
        Mon, 19 Oct 2026 07:39:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63aa17sm2033436e87.69.2026.10.19.07.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:39:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 17:39:20 +0300
Subject: [PATCH 2/3] soc: qcom: spm: don't clobber the SAW control
 registers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-fix-qcom-saw-v1-2-9c7ba3fc2493@oss.qualcomm.com>
References: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
In-Reply-To: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ilia Lin <ilialin@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2h9UIOLonoKrDR56nbeC/nC3gznJkCFahloq+sP53xU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1iuZr/aD81SWq8mJzMNHpjxVB55R04VWteNk0
 Y97uu0Gvg2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYrmQAKCRCLPIo+Aiko
 1YSIB/46ChAYMr0agN2qErsuiZmDmS6wBDy8ppemc89S/ayPCF4/hy3nbwq0aUYs3x1JYVrKYsl
 J4df7tFxk70DF7He4fpVJlyVnQ2CKhSildPAVt20Z6EyQc0ONLntuSpM5pej9GYDJHL55t0+kCX
 3ZlQVVxId9wK1TA8Pc9WM57f8X6gBw//XZejTX/yPYAf2eLvsjt3nhd2NoTaP88a9WXmPR2coPY
 YITKHv5xEo05JvGLP6IZwfFNJ8NcTIfKVPTSi/Jk4Xu3FLwFAXxAecn4txVWiqRH9CbBoTtVLG5
 mH/sbX088dBHy/cTiVinbuTTKP7LSBYhJ/cxA7iIb3Oze8RO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: gvobOcMFkQq0cx0KJOXAaWxqvOdG9Oee
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfXxvv77PmMlhU4
 W48Apn4ysxstS+ZWRSHkejsniJSTWINgOC7dKXzskvvuxwgHUoI3dyBuDcbgquzg+AB1JRPCe3z
 Tcgx3WzskYCCx+DLO+PG8+nkTfEyZKWdAMhPyouMcAOG6Z7shz5s9v3GDCYj/j/V4LHYZVvHAih
 lgVA1DoN7NB9XJbndqZkkFOIzw1m/hXQs/SJ7B7LxBvydJgBAnAs5BwtnFBS5fdwU9cjc0CiQYb
 N8+SMRo6w7EF7WcK9X8stDs4H661UbafDGOoRenpL3J7pm81egkqtek/CjWBvYNOeDjyP6b/MsC
 /A559XAt7ekg7re3/spMOr9d7bLLmQUR0hLSOG4vX2LvG7RDV7NgvdV7ZO1hQUmRR7NlKKxwWj+
 rck54h4DIx813pDGRls7yujag9G69Q9iqjI//V9QvGUBDn9OfHYFpY0O4wP9tyxwIp7U1N/IW2n
 OttpJvPVWxH9oulziYQ==
X-Proofpoint-GUID: gvobOcMFkQq0cx0KJOXAaWxqvOdG9Oee
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfXwZznD4LnDF4K
 at94/0IoW4eNyDPEqaI5CLx/29FZLKw6QuCZ3TM2U2m3bMUadN/WIekOLqfNCECYPcOoOtxNvk5
 PHXJfi74qwmcB39KGvI3yZWEIX7r02k=
X-Authority-Analysis: v=2.4 cv=cLt1IVeN c=1 sm=1 tr=0 ts=6ad62ba4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=lKJQq1FpCFxXXcX5SosA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190058

The SAWv4.1 and SAWv2.3 register tables have no sequence entry, so
probe copies the all-zero sequence buffer to offset 0 instead, wiping
the SPM_CTL, SPM_DLY and SAW_CFG values the boot firmware programmed.
On MSM8998 the firmware then still powers the gold cluster down once
its last CPU goes offline, but never brings it back: PSCI CPU_ON leaves
the first CPU pending and the SoC hangs or resets.

Only write the sequence when the SAW has a sequence entry, like the
other registers.

Fixes: 13e72c3e2261 ("soc: qcom: spm: Implement support for SAWv4.1, SDM630/660 L2 AVS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/spm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
index d41c94d32b51..6f2f14eb9022 100644
--- a/drivers/soc/qcom/spm.c
+++ b/drivers/soc/qcom/spm.c
@@ -528,9 +528,11 @@ static int spm_dev_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, drv);
 
 	/* Write the SPM sequences first.. */
-	addr = drv->reg_base + drv->reg_data->reg_offset[SPM_REG_SEQ_ENTRY];
-	__iowrite32_copy(addr, drv->reg_data->seq,
-			ARRAY_SIZE(drv->reg_data->seq) / 4);
+	if (drv->reg_data->reg_offset[SPM_REG_SEQ_ENTRY]) {
+		addr = drv->reg_base + drv->reg_data->reg_offset[SPM_REG_SEQ_ENTRY];
+		__iowrite32_copy(addr, drv->reg_data->seq,
+				 ARRAY_SIZE(drv->reg_data->seq) / 4);
+	}
 
 	/*
 	 * ..and then the control registers.

-- 
2.47.3

