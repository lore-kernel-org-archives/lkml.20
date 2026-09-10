Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0D33CF213
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030400; cv=none; b=QyG2Ntb+DRtGKjqF4YVzcETm1SlgENyYCp67HuylhVwrPEKXlq8fa7BHKvJWl8notBiq4HgGQtpuz2T4kjaxyP6x1iOCqZwIEkpBSlAvdyUXf4W2LequTeMOQw5R9XNv46mItE5M3dieRm/3h6DJGUsgaZMgk9Ko6jwTwlBsNH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030400; c=relaxed/simple;
	bh=iBSctvwP08AQoCAKNFl5edlJZmKJS+C7i+kWmTBeRLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XuWmWthHCgv78YlcoReYhDAsJRI1TAMl43C6yzAjpcPPEZyHAQ8pC1Wy8IVXUWawbp6LDlTV7QiMH/nSUdsq+vXYum9aqCCgJacsQUdK4LVA66W6z6E5upXBBkkX0272ZLqjKkqjy4BTe/nQnpHWlFb1qZu6NaXAAWTxZKyIi7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AIgY5VtV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UGh48GvT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AIgY5VtV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UGh48GvT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8plCw1589610
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wccmpJpOsyajKFC9/v8Dobta4SN8o+sXF/mYs0ljCWw=; b=AIgY5VtVECSPiSl3
	RV+kf+6fEJxyqnT4Up/aymQTS5L/epgRAvSQCQ62UySSjEFsNyF8Yn7WJO7Cv9Y7
	Kb4Ah1YvGJWV3qRb1jFGmoUPaar3aPU+xoAi3C2VTOJkgR71CnfGiC40P2vd03/l
	skuuKAC2EhOoLQGQ9WE7MpWJR8070Os5eHvR6idPNKiWbqTY1TzxFQswxkJIs2wv
	irPVoXu4AVS5XNOIYHrSqvm9riCXkbEQEfDupkIba+SYvDvWamvaBbA2INWia6rh
	ZL22fC+zFkCuudQ5LUAqXjKLCutTthn0Qtupr3RGVUzRcVUGtNtWfyvoO+kX53ea
	S8GzYA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyhaxb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:53:13 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc44d708055so11500989a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789030392; x=1789635192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wccmpJpOsyajKFC9/v8Dobta4SN8o+sXF/mYs0ljCWw=;
        b=UGh48GvTDLdC7GrfwzPia6tvrvEzvXjqMOyblQmEPe6idA/iMwE31z63EU4JRaHa76
         2qZsoLgnBuLX1b4OWNvgZg+cMighauca6PdvXDpjFFdv7hQV4BLBUWNlIJ7OpzuMePZe
         hRLUDPSygmXhiUKZo1OMHFiLpKfsYDmh2zffgm1IITPq9pwnHjye/koc3kYrze+t1t0H
         /yPn+4Od79RxX211OlWBbwXDo1XaXizuXazV1pRwrTr6m0CYNZt3+3foXGaFLpwrMrZj
         S71dbf1s/myAaiGieXb4n2/xMAE5v+ZjM0mYlfNe5rbnG4LbFt0n00RO3Y/WiplurH1k
         7p3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030392; x=1789635192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wccmpJpOsyajKFC9/v8Dobta4SN8o+sXF/mYs0ljCWw=;
        b=J6Vb3C8EkH4P31/JMW2OydBl4+v7puF3VZPvTVRm/6eLwxM6SMoXgCSVRdt//7+H9M
         ocjGEc5Og0RzmnQ1Q+gY87/VHB4Y/4Ssl1YrksfoEPB8dGkEeTSZTuBVa+1NwVpJ5F+F
         WOOKei/ZDWCRkyCOHlWwZyH6d7cz1TuE07tdso1wbEy5dCyzdUtRg7QZOxJ3p5E83JiI
         rArjZ2hsmyQXekGCsxsQ+IOHz5CI+Bd/HcAUf4HkqQ1ufbCgn6fHeuf+P+cglgBlcBcW
         f8hmb+t57ZjsUu7rbdeoHt61aE952p17zwEc7iG57bf710tfmdk/s6j0HF2BIY/pzujP
         tmVw==
X-Forwarded-Encrypted: i=1; AKwUvBynLRe7O2txCmNPlXPMehO6+FQ+YvPS2LtxZ1DH10iHhAqeFa/l3hoXlQFbixcSzGyuIDuRommy+TmtvAM=@vger.kernel.org
X-Gm-Message-State: AFuF++l1N16tune9kPfOgN78Q1Gqb7KndHXpQpqDYtP4s8GX2dns/E+O
	/pE5931OAK6Pnv2Mn8SnqdR8CtZTf3HsY2X+eaqJlGAKgi5pG9jvjtXiIPud8t65o1rFdEL4bzH
	Q22JINk0XH08WbCG1u2RwFEfjVlF1jPG8aL2Sx5MuxRr2EawhRVPoHCVL/FnlONo+ErbAS8tpFQ
	o=
X-Gm-Gg: AYBFou1XaK4l6x6L3PJnGq4EIKluefNv410f2ncHWh5FnDlg0vXua4i9oa9L+AJi4iJ
	7+a6GvVTyFotSgaEycErOYyqxcfexM49AUAm8cXArdPkAj/78oUwQManS+ncTL0U/51H7szCz5c
	tFD90GOVKgwoW2+lOIn3Nt/R+2k801HW+nc0m8no7oPCQmUf0PZRVLCQy5AqH1KmjEpljCeY4eo
	eVa2/32svi3bI7Mn5GSsRKl1fYIyWZ2+DLetxP+i2GoGLtRZqfsUs8wtgQfoF8DGhE9cXlI82/F
	YWwCFaUQsKx8NtG4Hm6u6buy9UxETrRCYVS7UcZdZARTr36oCzZop3cZdlfrHMx72e5esjeLTvx
	+U7uKg9c8MQLkv1mwad6fyLIMnVw6
X-Received: by 2002:a17:90b:5344:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-39b261e0f14mr60174291a91.15.1789030392320;
        Thu, 10 Sep 2026 01:53:12 -0700 (PDT)
X-Received: by 2002:a17:90b:5344:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-39b261e0f14mr60174265a91.15.1789030391867;
        Thu, 10 Sep 2026 01:53:11 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3397d6d1c16sm12398722eec.13.2026.09.10.01.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:53:11 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 14:23:01 +0530
Subject: [PATCH 1/2] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes
 for read request
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-rsc_read-v1-1-c9b7fa3cdde2@oss.qualcomm.com>
References: <20260910-rsc_read-v1-0-c9b7fa3cdde2@oss.qualcomm.com>
In-Reply-To: <20260910-rsc_read-v1-0-c9b7fa3cdde2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789030385; l=1627;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=iBSctvwP08AQoCAKNFl5edlJZmKJS+C7i+kWmTBeRLA=;
 b=kv14yc+twZQcTmBPRdP9oFeOLap/Cmga0U4ZLkLP9hQEJeO1vAS26McKgDxfNjmzhgtxGF3Ln
 7kR3VdQxx6TDaIQP3IuH3op4V7hZ6GI/Idp/GwukLN/sdF9n1X8z2Wr
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5OSBTYWx0ZWRfXzjp0wAcx1PZa
 xYt2o7hlAMnZHeuJ7yqK4bGzCgriDODfm/HKW4uZ9HArcB7ZiuO99guyjN3HRomFgdteSmxiA0O
 NhppTxQhnJbxgAKJQ/ltbNIc2SD1DD4znNpI7vI+qagP6FptkSBHUzLNg9oyia/8R1N4B7SwUYv
 8dduGzfmr83yhRH0t90KfQc/qHIVDpGwfFLVtNLkZL63hjAeoXK/mm/DfEPmCk9Z7pdGeUKXj59
 3tGrq/cD36og8cXenwLQRnNmBUYiEEkZvEjvfhQyPEjr/pK19h2TgYYLvmVscza/H94+dCKUqvq
 hR5elKmaFmY80zQRIHe39Muc6diLqR3kxAsif2c3R60V6svWyvTRiBhYhBjF86RjduCdvxxz+Gt
 dCFh4CcG7OLPyhp7gXIQzSDZIGGmYpLyh6ycj39Rae9LEu7BLURm/4AviDCxDKwF2C1kBDrVE0J
 SlBLfz8x7ItznbC85rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5OSBTYWx0ZWRfX1Af5Hef4UAzq
 TbDJZajgEr4UuVGxDT9ZlapoOQ1D/sSoaSbvMextVEAknrnfswRulr6wUld1MSv7dqv5fqVC7dF
 v4sl3uNRBE88k4R1AHqh3R4RT696CTo=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa26ff9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nkXt-CTaWekHWkLlceYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: f0XgUHcRPuIta6zJ6Kyft9w5Ow5kRRA7
X-Proofpoint-GUID: f0XgUHcRPuIta6zJ6Kyft9w5Ow5kRRA7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100099

Newer SoC like hawi with RSC version v4.5 support 4 byte message read
request instead of default 8 byte on older SoCs. The write request
continues to be 8 bytes.

Update the read request message accordingly on RSC v4.5 and higher.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh-rsc.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index c4542318eac4..f84a399fa5dc 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -86,6 +86,7 @@ enum {
 #define TCS_AMC_MODE_TRIGGER		BIT(24)
 
 /* TCS CMD register bit mask */
+#define CMD_MSGID_LEN_READ_v4_5		4
 #define CMD_MSGID_LEN			8
 #define CMD_MSGID_RESP_REQ		BIT(8)
 #define CMD_MSGID_WRITE			BIT(16)
@@ -499,15 +500,21 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
 			       const struct tcs_request *msg)
 {
 	u32 msgid;
-	u32 cmd_msgid = CMD_MSGID_LEN;
+	u32 cmd_msgid = 0;
 	u32 cmd_enable = 0;
 	struct tcs_cmd *cmd;
 	int i, j;
 
 	/* Convert all commands to RR when the request has wait_for_compl set */
 	cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
-	if (!msg->is_read)
-		cmd_msgid |= CMD_MSGID_WRITE;
+	if (!msg->is_read) {
+		cmd_msgid = CMD_MSGID_LEN | CMD_MSGID_WRITE;
+	} else {
+		if (drv->ver.major >= 4 && drv->ver.minor >= 5)
+			cmd_msgid = CMD_MSGID_LEN_READ_v4_5;
+		else
+			cmd_msgid = CMD_MSGID_LEN;
+	}
 
 	for (i = 0, j = cmd_id; i < msg->num_cmds; i++, j++) {
 		cmd = &msg->cmds[i];

-- 
2.43.0

