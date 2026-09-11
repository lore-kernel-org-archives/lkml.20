Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D7D46EC7C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117720; cv=none; b=fsMXrnxn4qvO41NT01x2qnLY1qQZKLVBohT3O6KOr2dm6ojG/RMdUdp+6wmUjxMf8aTACrIQJDgbFbVJ8kpU2BWjdyHKKZyUYFpHohu3PRCfPe0I7VudZ1NXhVNCRIIoS32ybE123nXqH/xOlMZX6//Al3ccPnR/dwS06Yth0U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117720; c=relaxed/simple;
	bh=gQ30Irk1ERtkf94Q1qOp9fKsE6KR2cqylJXQusdrZGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q4LxaXY1Ntzw7G0jyLOv6oT3/RkEhu4/iN22XCs68WCzTmkeKj5iy4wrHSULBygIBk4zxMPimkSKoqf7RibiV58gyDSfJ/4zPNCB5MSk83Be7C0JSQX8kV30AH7spdGrJHZobEzaRhWxbCyO5KdKorV1gFyq1rp5bZSwMBg9y44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WmeUiZYB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jhn7lUn0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmeUiZYB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jhn7lUn0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kpcA3513951
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2a3N2+wNwjbLewXIe+ddLf6mlt+qaLnsdXVF+2xnB5U=; b=WmeUiZYBMdQz6kdc
	KogxJP6gsG2wwwTplO+ctRnNvo8MytCs0UI3xn491oveOsTKWzIe63OEck58YFmE
	qLWPzrIFnL/Mp9DDYER6KuEPwPd/LFu6l2nL7OMTL2DXsUbxCUdoC9XtoMJECLRk
	NCF34Sitc8GbrF+h0zuvDrcWaixykn93dVI3uekqUZ2CCcfUM7uzX1xXynchfoBm
	3SfJailsBhWRNg700wmEf8TVayxioYoWIXfC50wtvfRsdgIA93YJrr2kUDglhdJZ
	SvXOFu2mJY+Nf6PHhgldxfTjs0Pg2PMFIoJcNxVm3Kk6FqsnRxE6eDuUVu/qo/qc
	axG1jA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd50ukt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:08:37 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e7624e584dso1113589a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789117717; x=1789722517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2a3N2+wNwjbLewXIe+ddLf6mlt+qaLnsdXVF+2xnB5U=;
        b=Jhn7lUn0aT3KQjKz6J+8VeR+JicpIq3DSONZyCcaVE9Myv8Abz/XQIXaVkpgnEltPO
         4f99uRRewTuiBgN5DHLI1lwFoQNIo8jrgi76RTiI0tSB+1CLiVUp4IO9PfqZAVR/Tw22
         SAdFjmjDPTYYvhxZhDayfJTBq/pOBtqqjem7mhBwC8hZxMlCXF+PnA3mMmhesoVaUkYb
         DWV6agQYsUhLErLcrKDkhYt6e0enmQgch6lCvsq9+uIFjHDM+9b5Om5TymoQoU9FVgYe
         umWWT8yYlVamDgtFJ8DlxhSD640eW44gHahhjh1i+oF5WnsBep0cxD5V+sRhppIuwDP2
         pZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117717; x=1789722517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2a3N2+wNwjbLewXIe+ddLf6mlt+qaLnsdXVF+2xnB5U=;
        b=TM6hfCQoIz1TsEeQZo+AKWiJuB4KUnU3hT4WYWVxd7KgfdM+fDhLa7jXYhASQ7lFLy
         T6jjoULRQGYt84zF/GXROTZJ+XXFuuwGM93ttHmmFZEMvnABxv96tQF9PFa5BhY3k1mi
         Ekv1P/9Q7lCZoDX4eLvropBSV3zji4xfQT8JcBRWWmX9z53pOcP8Qo70z3UUAWqKpMhT
         69Gljb6eR2wCiYUdWbyIXQkBOjrbRTbpjGvz6xTfVWiOjYgiVgkhBq43OIkpocd+L5gN
         TMvLEXc8lJBRVQqDsPJBm/SF+zvWPJCcTRcEaM2qhxkt/QzTtkbVqgJjdnW2HLRQ6tJC
         ICmw==
X-Forwarded-Encrypted: i=1; AKwUvBwROzeulk0WRg1Vm3Dy1RwPq+Iy9p9fmRHYRWBer2dBCFgDd0gjNpbjzyY8tggD4DZ9rBc2bJgaB+0VU2E=@vger.kernel.org
X-Gm-Message-State: AFuF++mPincF2CkPndXzg1qrIWz0kJk90+h1S8skxJzBDnBULHm31x+u
	dWJruHv3chYPtXEhtedMhFEyccNYye2ib6MAPdi0+pbxObk3/I1ThkOnJEg9QyB0sBTnopFsPTs
	MImHOIhP5Vzu0GRtnV6+RMQPHcuxK8daeXx3nr43NBgTKF0nylq8JPIKaroyO210crqg=
X-Gm-Gg: AYBFou25w+Hj3hIlDDHIVIMGjspUAW5Hlv23NW+K+nyOfC9EiOuB0TRXHm38HZJ77jx
	ixMOLp0AwMdw/uTSWTtcW4JJguizZwEUPQV5FTWdMfR56eYXpsDCnywX/997buvV9Dc4Md+wa5n
	1t98zE26qdlzBK3xkRHACTn8UwKVRWjZPcmifHihmGk3NtHTpCB/5cRymVOiREieb7n2LbCEol0
	34j1fmcUFO1ZVtaPwzhBnjycz2gnkK834NC9N/ylnjS9uhyK7Ci3f2TbQzylvHLNZsKaTNroxjV
	Z265W4zrhScKl2sw0/3aryK6lA7VSIk8+ES7mTRL6+JrCpUJYk+sYNOA7vj9jz9luCDYOwjJFd4
	syt6hBgE1XeH2BPPmhV4STxj7UBIx
X-Received: by 2002:a05:6820:c445:10b0:6be:1c91:ca1c with SMTP id 006d021491bc7-6c0b9c50d76mr1464896eaf.11.1789117717094;
        Fri, 11 Sep 2026 02:08:37 -0700 (PDT)
X-Received: by 2002:a05:6820:c445:10b0:6be:1c91:ca1c with SMTP id 006d021491bc7-6c0b9c50d76mr1464873eaf.11.1789117716723;
        Fri, 11 Sep 2026 02:08:36 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f82c69sm5040447eec.27.2026.09.11.02.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:08:35 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 14:38:13 +0530
Subject: [PATCH v2 1/2] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4
 bytes for read request
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-rsc_read-v2-1-98675c248278@oss.qualcomm.com>
References: <20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com>
In-Reply-To: <20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789117708; l=1982;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=gQ30Irk1ERtkf94Q1qOp9fKsE6KR2cqylJXQusdrZGk=;
 b=lJ8ZU0AZ2JTFnLzSwGIUnC3nRzWPwlJNBf6X24QpE3c/a6Tk4kPra+2PKLlzzcM0NhGXTCIqC
 Ey0k4rQdLsLDnPL/kQepPBDVjrXtF0oNfvIcHKFwW8FF3Pf6fKq3ffO
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: IaDsT_JX3zH9KGMkmWNQ5I1uSSF618Ym
X-Proofpoint-ORIG-GUID: IaDsT_JX3zH9KGMkmWNQ5I1uSSF618Ym
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfX0RZPue4eLhf5
 AZS5qSS43iUJVbuHEQgxtXK/fC1wXzXvBWpjTlKDdqDH2Ly7CiFSshAF5i3MtL/pOK7NFR36FhI
 rHRle8P0dPXH3kcnL8wx94iieEq2mxs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfXxXJW+XtKPGqN
 mnJ+x9Zm6+URg5eCwmzJ/SJk/q2mtbuOEeZAFUljx0w3O6WW3sngVjjqZjjueJTfKWH6cySKEwO
 TjPhyKW132NC+HieyIK5xTpYUrSDpqORD/FrQ2EI7csPAu7LfA/sNmy3FLC3EMfpLf4i3rHq8zh
 n4fdzld3+NewMsU35riRSZ5LKveI6IIIdjx/AeNsQTnqH+z7UgXhD+bAgfJzx17iF91sfuiXArc
 55UpkZoQKv8jkUKEsCNWRZ+LNpJXzwmgPQQ1QkGJfGGTSZDe6qEPwwq23h4ReaW2YwKqf7U89i7
 jkiLoDMopxcH07g7XLTmDCvv5eqpOu7kr0el/f0y8e6Y028r9XwWr6MnAoyjGALHB7UEU81EWvp
 jpWEIizHMRpN0nxTTOSO4INIikVLZhOKn25uMNZYiTp+k6djPr6uCH+vxxGJdhIswc8vWepbLtJ
 8cyEUcWssNdrfhgzwrg==
X-Authority-Analysis: v=2.4 cv=db0VTnXe c=1 sm=1 tr=0 ts=6aa3c515 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OezgyNLIrsQTVL87vYIA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110127

Newer SoC like hawi with RSC version v4.5 support 4 byte message read
request instead of default 8 byte on older SoCs. The write request
continues to be 8 bytes.

The CMD_MSGID_LEN field is [3:0] bits. Describe the length bits as a
GENMASK() and use FIELD_PREP() when programming 4-byte or 8-byte message
length.

Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> #Hawi
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh-rsc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index c4542318eac4..c5ed9874bb67 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt) "%s " fmt, KBUILD_MODNAME
 
 #include <linux/atomic.h>
+#include <linux/bitfield.h>
 #include <linux/cpu_pm.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
@@ -86,7 +87,7 @@ enum {
 #define TCS_AMC_MODE_TRIGGER		BIT(24)
 
 /* TCS CMD register bit mask */
-#define CMD_MSGID_LEN			8
+#define CMD_MSGID_LEN			GENMASK(3, 0)
 #define CMD_MSGID_RESP_REQ		BIT(8)
 #define CMD_MSGID_WRITE			BIT(16)
 #define CMD_STATUS_ISSUED		BIT(8)
@@ -499,13 +500,20 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
 			       const struct tcs_request *msg)
 {
 	u32 msgid;
-	u32 cmd_msgid = CMD_MSGID_LEN;
+	u32 cmd_msgid;
 	u32 cmd_enable = 0;
 	struct tcs_cmd *cmd;
 	int i, j;
 
 	/* Convert all commands to RR when the request has wait_for_compl set */
-	cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
+	cmd_msgid = msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
+
+	if (msg->is_read && (drv->ver.major > 4 ||
+	     (drv->ver.major == 4 && drv->ver.minor >= 5)))
+		cmd_msgid |= FIELD_PREP(CMD_MSGID_LEN, 4);
+	else
+		cmd_msgid |= FIELD_PREP(CMD_MSGID_LEN, 8);
+
 	if (!msg->is_read)
 		cmd_msgid |= CMD_MSGID_WRITE;
 

-- 
2.43.0

