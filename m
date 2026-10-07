Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72D842F6FA
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367576; cv=none; b=qNJOVyYBrTKw+13ajkzZsGxhP0FPcoiDeOVEajDc0Uxirdv4ZjxoZGzQbhxAWua4GrbVWZ+m3YCwvDe7NJH1VF8MOlxmn5N8NutRm9Y24Ho4H15ktbvQmQfm1UcA3TB3FNc0YrYVnLdSpy0Ug8FhcTsOIMFYvI5bByC4qeo7+eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367576; c=relaxed/simple;
	bh=XHkWESBvE5buNkYoAdNo09em3lSL5bD9bzQB+7doBzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A8o+pBe5OEVZFVtNPbGo4t7bcQk3aQbrHA25hn2vmwAs8Oqw9LDbS1h5VR1SMTyKGwS9gIEXf4t/U+XjYbZsOII0NUAt7hK00pSsKgAaoqNf1lW7UkIdItFG5Q9qjb+wWkx84H8oC7BMwXpTahTwAk6BkAEFBD6paKGYY9Yb+P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wj6M9+kN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWUxxnf3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wj6M9+kN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SWUxxnf3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jupj2312995
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 10:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dw3jO6hvjrfiHN4JAYp4GK
	rNY8qehhlww5dmgLaq0Pw=; b=Wj6M9+kNRsgDFijYlbVqJsxlss4qs7ssiF2AcO
	cnliwqUJZkvN/vadAji8IoO7jWWyJGShuhVd/H2DKpLRVVpXEzDjupQ2z6CItvkX
	rvTd4w450WYd2PNQ3GFVgNkh01PebtGGVvQW9gKQe+3lCI1OnqJZ8MutZZsK716m
	dN593kjfTbIYKW7s+TLw773XtgWxUsM78sI6sMbh1iMtdBhm/Vs05wal5lv2eNrq
	7EiVpYmwhXlS8WbLboo0TX//gDLykykV4FWworM1IT6G6IRi1ZVzcxedf6Sy6Ya+
	KC4F13FvNcyuI4Jo26z70TGVLmRw26MeOeStVv0NHtzESicw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53askvj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:06:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a8ae5154e7so468330a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791367557; x=1791972357; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dw3jO6hvjrfiHN4JAYp4GKrNY8qehhlww5dmgLaq0Pw=;
        b=SWUxxnf373Y5CP7ezfXYDWdeU4bOW9hB4jYAEE5nr/6e3Z/+6MgzgNdgynYFUpSjFj
         NWwgCk3ekzLBBE0XYExOrdQvryrnEZ99jObFwyG7cpnGkJ2v+us5EfcSNUQ+cpRNKCQ8
         pKHPAmq2HaNjqgY3FbjYWGuwh814ahar+2V2s3eZvd9xr1HER60ZVOhnqrHfofHJAi+s
         3XgdUpJPFPup7b1zXXmHQSbYI4DpbEbXZqvmydJovRBdH1tvDMxlpRRlbHDErrLiAi1X
         dwh0vv3cngHCGTnBmHqXy+58HlVejIHGTkFcyOZF02hDvo3UKMQDvogGQnGx2ZbOkis/
         zJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791367557; x=1791972357;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dw3jO6hvjrfiHN4JAYp4GKrNY8qehhlww5dmgLaq0Pw=;
        b=NXOai8dj4PUABeBcyPSHHWVzmsh6Ow3WZe7sMGo5v7wGDjLiKG82ecf9/rJkF5k5GC
         beLiwNEBWHR3Q6dhcfpszLUhRom2mPp90iBpMddnu2BhJ1Dhl3NjMK2FwX34WkHvAFZS
         nriwyG8aiUoTQOHURjfXWmbSEZCXbc8ypkzdPTxVbAqjoY/Tpcs4MmjdgSrliwb7IsbQ
         +LcfnAUPlfxKv2l7WPQgs9D79Axd+2uJFoF61NePr5lOfSREhISQ4BqQgfhOsszT3Quj
         RkKPF0pxCMo5DS1NjEpZq5gP25pPMtPD7D88eSbILXkaKNGJiO2znYali2tJsoz7nB2u
         48mg==
X-Forwarded-Encrypted: i=1; AKwUvByRgO6pcyZYvAzsOOst0+wU0hFq1lMHuuSS50wbyS97wJMXb5SJWO9PXbpJiaPAhTwdncYtljaYVxHYZ/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgAjVKM2m6vKKJXf0wMl5C66rcRmgJWz17jXCAnaysqDOxbn9f
	AHe4rSd2jEqat6VDL9Rkgozd3it3mUKd1S9z9zXs2p9rYFky5CeIzftq3+Koq1XA8LLRt3HF8xa
	XWVMDxvbMdSIN+BAz/Vuo3+lcLB2RFMRyq1/mo37ghtEpfX8j3TbU9sC3HQhjtsqqoGo=
X-Gm-Gg: AYBFou1cSzFkCpBivPFqZuy5yTTEJAvQZhd8FHM0PaTf2WN3eI3yDjPW7/SVRqE4/RQ
	ZuuoVtsBcySBKmGO1wJEpuNNIAKz5mkkZ3G53H7srYWAbUw+XYT3mSmn9ofiN5F45tBovz1sRUQ
	TItqYyUkPx1tNLiWSc/EpaY+dCfxM18ymjlN3feds15lYJOc8+MqZAzvAWf3DAtywWDnquJ0Rz/
	ktIHceRW4S6WG95m+ONa809z2sff0RAAWlWU+/ch9dbuTeDuLkhLVr0WIll7x5bXf3Kc19/eONP
	//OfehGZKdJIvNQ8knrjcl7Osk8rZqG5rFHr8dRjfKpq6eA3Hm7MQb2UG5kpGqag2f28MmG6fMo
	svwlPOBeaMzoP/WwPgQMAgYDRrGA=
X-Received: by 2002:a17:903:380b:b0:2dd:ad73:5b6b with SMTP id d9443c01a7336-2e6003b17b1mr15369965ad.27.1791367557217;
        Wed, 07 Oct 2026 03:05:57 -0700 (PDT)
X-Received: by 2002:a17:903:380b:b0:2dd:ad73:5b6b with SMTP id d9443c01a7336-2e6003b17b1mr15369755ad.27.1791367556733;
        Wed, 07 Oct 2026 03:05:56 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60443806bsm7480905ad.8.2026.10.07.03.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:05:56 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 15:35:49 +0530
Subject: [PATCH v3] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes
 for read request
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-rsc_read-v3-1-7501c014fb37@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHwZxmoC/22NUQ+CIBRG/4rjOZxgCvTU/2itIVyTllKgrOb87
 4G9+ODL3c52zndn5MEZ8OiUzchBMN7YIUJ5yJDq5HAHbHRkRAtaF4IU2Hl1cyA1pkzXXEDJVFO
 hqL8ctOazTl2uf/ZT8wA1pj4ZnfGjdd/1VyDJ25kNBBdYiYa1slRaAz1b7/P3JJ/K9n0eD0rrg
 W57sulp7AWvWaXokVPGd/plWX6bUgj2+QAAAA==
X-Change-ID: 20260910-rsc_read-27d689e37cb5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791367553; l=3091;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=XHkWESBvE5buNkYoAdNo09em3lSL5bD9bzQB+7doBzU=;
 b=FqmmGDoGpYyNOmwvcH4nocfc93tLb3ni0Mf3vlTMSFjVxb/c8X+HhAhzbX5nkLw4aUFM8pC4A
 dTZR6XaTzbVCIq3e/YuAgBsXfxMi+dkKZQCou4jnHaiNS6cWm865g+I
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: hXbdGc-bQqxV_tP8X--3IKFG6Wo9cOBI
X-Proofpoint-GUID: hXbdGc-bQqxV_tP8X--3IKFG6Wo9cOBI
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac6198c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=2a9cnvl3aIyXX4kkuusA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MCBTYWx0ZWRfX5CR9W+2I+5i5
 43aI6oGydcvaAyJSfI1UcE/wRq54Qnw35oT0lqnXgg7kmSjV4fa+gw6ZkGa/Wq10qY0j404cEbx
 JcTuYvwF6yyIx2emkEvj5M4PtefRWKg0ENbg2JN2XG0l3Fe7H32noPTx7cMETBK+pMz2IkzyN3N
 Tt2GfdmR5BB5Flc1vvTI9wlVt1rdZHfO23WAaGcKPpsNWZOR6uI8xEjPeaYrx695wPWXGofRdz9
 Wi6ZkJY7EdxF8iSZfwnUheM9eOmvONtHXEJjxXUHdlnnZW6mumDk/Ev7gsktpPGvHGQD4uccMQ5
 pvsKN3/m+hLGumg686ANpUrXN6Vqxzhys4LQ1GeTo2HMge4J1xaSPLMtCPT6iQlMh858/diHQ7a
 ZjOBeygoscxDYPXKxsI4c2FgoyUlLX6M3tbsir0HMmvP9k474mBKLXic0gkMOsdbe7VP65Iu/AR
 w1ji6Rcr9yF/jlTTKNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MCBTYWx0ZWRfXxQS6lvlvlozW
 nC7FfSM5ondh4m4PaP0c0cUBBVtT3QOblZcAW0gwGXj+9oM9IDv/xhd7Rhn3ygYLBkzodtakDxP
 yxzsg5dtenXjj0l5yip+sSt2MuVQ5Zs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070040

Newer SoC like hawi with RSC version v4.5 support 4 byte message read
request instead of default 8 byte on older SoCs. The write request
continues to be 8 bytes.

The CMD_MSGID_LEN field is [3:0] bits. Describe the length bits as a
GENMASK() and use FIELD_PREP() when programming 4-byte or 8-byte message
length.

Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> #Hawi
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Changes in v3:
- Drop patch-2 as it may wait for a while to get more comments.
- No changes to patch-1.
- Drop cover letter for single change
- Link to v2: https://patch.msgid.link/20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com

Changes in v2:
- Define CMD_MSGID_LEN as a field and use FIELD_PREP() for lengths.
- Keep the read length selection explicit for RSC v4.5 and newer.
- Keep Tested-by for patch-1.
- No changes to patch-2.
- Link to v1: https://patch.msgid.link/20260910-rsc_read-v1-0-c9b7fa3cdde2@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
 

---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260910-rsc_read-27d689e37cb5

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

