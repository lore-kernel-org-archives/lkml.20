Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565887;
	b=T/qx69EY3RU4dWde47rUXL7ensdtxT6Mwo7jjs83zqqT0xmu3xHf8VUHkWfA+fQbhB7q
	 vnbaqi7FuHI4hmQHDCmmD+5hDuJDzBfaRT7oWl4f7EZmjH9rvjiHMhJEiZ9orgg7CPtxP
	 ofyYgTGFgjexPFdD2pV76JhVWYy9xnvk5/CcI60iQ1U+jbefArC2JczQrANq5dGef1GI1
	 aDdulPTdHJGgYyn50Sf5ijUO0m2oau0YasHZiFXw7918UpPFpaz0LTrmRpM0MeBBEQSfp
	 nIMFunjmEQHqz5SYDhBN1z1d1EBFGUxtrnBOnyA4Gnoei/DZmu3mFKbZTKQ40murf0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565887;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Tx4E2ww8dsW+6LTyMUOjX+lhfVjHpUsJPXL9LPfsiiQ=;
	b=N+QQOm0k8YQG+qhX/18U5Asa7vStu3M2OAow/CFNcbJrVynY3vp0RMm/W7DwhQO4Nkvd
	 MwOLvUQFgKiSWtTH+yXdxK2/u7nUFcg+t9HCjyeUJtxArnvz9olce5UIEG42AzYSJZ2ub
	 EJoIZVx5JCyv1ugmKL55VqNUbT00DkustkEo9RI4FUp6Rz0VIKTojmwlDsLPJzPOVynPN
	 fpWykZlP0t8bp5ul/U+gbJ9aPZoODqi/LetGUPLbmTPW/Bk1X6boDfpVwEXLUekSp1jh0
	 j8hRVYw0LnQYR1y08Z9MoSntEdnsfADPe09IjLTSYKKQZxwCmI5qp58zkuK/840OeJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LTE/ZDYW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bli+kDLs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935BC606A8A9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 935BC606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LTE/ZDYW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bli+kDLs
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VAO3074791
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Tx4E2ww8dsW
	+6LTyMUOjX+lhfVjHpUsJPXL9LPfsiiQ=; b=LTE/ZDYW9ed7rGU6xUSntu6hvb9
	tZ+JlLhUYg+yOcumRvBrhLXbamvUcMteM1Ipsr4euRc9qWWW5Iaca0KVxkaULwJv
	T+VneMVeYvjZq3+Yhac8xpp20UhEPHkX/niX7zpI9BJrDwxtlXTyTTY3l/BqDOyF
	g9kWcoczcV6CG44gju1qSH5bmc4rF4KjBAdDRZ6nzRQ3IqhxoZi4dhs7dqZDpuMp
	jd6tYwTv9lNhieBpJBxR+rdD0b1RTMclqYTE5gVD2vVNZYrKAKzmcYhGU9kRtWbE
	e+uES5lvCJxsaNhhi/EV0GYn6AMZ0YMeQBk3+aBnIxQjNMyHM4bhi0cAP+g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufhw6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:31:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed2c307e62so14393115ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565885; x=1795170685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tx4E2ww8dsW+6LTyMUOjX+lhfVjHpUsJPXL9LPfsiiQ=;
        b=Bli+kDLsRaclkuznDGGF3/w87xu0HlDyD+nP1TyZ5XDg8ebe2+iLYeS6fMHSMAt9Sz
         SxrM7XrlLG3s6oQGkcxoPAkJ2ktIAs+CqEFYIpgdOBbVPzReWr2jhTg0FmxylBZ9i6Wf
         ffXwdpjSaA7mD3mSJWAf+BEe3T9Kv8eUmBvOTteCkQjOGCmyo8d2ZWUZ87mbSqC8S8T9
         +r6VEKutR3OgDlg36/Gc5ZDDNzEiRo7Srkol3pmPFYZ90BL743f1WBkDeVjLkgYUD5Z6
         MpaUjXRzU8Y7IvEMq10N6aqWL/o3APJHQRL+5+iTUmuGpQ95TK2HYeYrdV6piMCB16cX
         zx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565885; x=1795170685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tx4E2ww8dsW+6LTyMUOjX+lhfVjHpUsJPXL9LPfsiiQ=;
        b=U1WVcy1iuY4XiIasfstTaLXnmB/wU8W9iaTqFcxMFhydv3NeK53VAE4sLHg6E9IHbQ
         jLWdpIOsW6IA66sokPitRmriG6sLNOpU1v2dH0GeyJg13gE8sdx8BAEOdiejHJ8/yJdY
         YA9iAz56YyUKTYoVL6v/Wcph2ZXAguY+lD5qQgopFTZH8t2vZPNepJ0s0ajbK538XVcg
         Iyq/SrMy1PC5gffnBOIACO85pby5sjIcER8rqRkzoid+TKq6JlziMnVrawOPfz0pyFNh
         wyl2S1Bm6h4lEPzqZRBXKh+gHTqRCA8h1p74CVCi1zC8WaVVSGaaSdyXPvHruLW+rLh3
         mloQ==
X-Forwarded-Encrypted: i=1; AL+hErGEoRTfLe1NpY0KH6r84JT1ROkTVG/RayklAFyE5ky2A6SMAF/J4KWUSe2qXOmWfLV8RBHUxIeSvR9aWWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EaKDuGJU353a4zsA07yPp/9FddfXM2llo9SQd+8wjRjkfA49b
	lXm7Yob00pprkcZBEaAc5yPshBZjcWuVwuNrPPyLGyHAjNlMUZRv9CxLQ260SHwEuzPzaOL7pV5
	JOm85r+aDusvb6PJxEdW/S1kHIuEPi0uMvqFAHDpHjJ3WsqCgM/rLs9aDOaTLjdonIRI=
X-Gm-Gg: AYBFou39MA8QfoCwdBtLvGanodIpU6e0qpnsDX8zPV5lhCMvpTx7Hq5hnoUeVEVKoD4
	gyqIvQngSBIGVTffiaUxeNCTz00spFnXDMwXK6a6Ove1H1hiD4CmmoxcGU2qd7P46PMLnhgWaTk
	w5OPmv7H9P2ZLNXiUxw/D6RuWskWZnnta+4DR+eJL52VxJU7TE0p4L5ZNO+sJYTC2Q4EuQgAnMN
	IshLgK63v7zNU5tAfPK3jvWmz5/e+16Sd1QOs1AQ8m9vtX7i091rKdZJPwWzBytqhBK0qpBqThM
	wVysm4nXXFVVnux/zYakDIbdGPXl5ZtJweKV4fygDO0MoTZwypUaUFL/jQ/xm9PM4F7PRgS8TzX
	rE1CoVuewbGsTtf4cinpFkdslksUvxCnBXAGeDcmwxYgg3DeIziXPpVh8EubA+89DgzWBvmmsWa
	0EkQ==
X-Received: by 2002:a17:903:1c1:b0:2e9:6333:fbb7 with SMTP id d9443c01a7336-2ee0dcada65mr23699255ad.51.1794565885211;
        Fri, 13 Nov 2026 02:31:25 -0800 (PST)
X-Received: by 2002:a17:903:1c1:b0:2e9:6333:fbb7 with SMTP id d9443c01a7336-2ee0dcada65mr23699105ad.51.1794565884771;
        Fri, 13 Nov 2026 02:31:24 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8d4612sm8072585ad.57.2026.11.13.02.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:31:24 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v2 2/2] phy: qcom: qmp-combo: Add PM suspend/resume callbacks
Date: Fri, 13 Nov 2026 16:01:11 +0530
Message-Id: <20261113103111.156476-3-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113103111.156476-1-prashanth.k@oss.qualcomm.com>
References: <20261113103111.156476-1-prashanth.k@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IyLvedIsf6FMroYPCjpxuZ9SBU5hm7E2
X-Proofpoint-ORIG-GUID: IyLvedIsf6FMroYPCjpxuZ9SBU5hm7E2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX5SogIGpWJJSj
 OZhuyj251GwXCbG1hwyksttci6YRovIZKZ/LRaWe+zHCsXIh3cSPVM1hy4yZGIPW4FR4rynnf2a
 TB2B95BNhb3MUPYp/YOsIn8e3SYvGf/54fH72dBlvIfcva5QjoCLMMpgtTWyTTgSdMDNcPopk6Z
 00e/a90efSDO4Q9EH+zhHneQoHHCdhIMaupJaG2stEz/70ue2qb0bIDN44Ok05cSQAcGJpriXxn
 7NKAZSXck8VtcVrIdYDxgodCbx4ZTyV7zfcK6Kpal+1OgL5RzzD0/y8zxzZhLG0eZYICSh7PdJL
 DXsql+8uZOMfRCXnPqLs2ZVWNbggOxGDJrpIGJyV0x/o2fCB2jHW1jkxeo0pz1AZZ+ISoXNNX07
 2nlbAUlQwFFOmKSl8VdNXRBaiIYUjQDBJ/kcaHc+b4gusu/TVTUR1CMc7ReMwhFvTJ+lPeF1tDO
 psDaAbL66cjEXjOKu2A==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6e6fd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=OhzqtntE-aYjV8cgDogA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX+AXem3S7+fI8
 oB3RmCx53lcJhpEOngBOIA4eWKyqOVfnrWEWbSeK5JNiC0DYc4JS5ioFVwlQJOsJXKONeRHAwb6
 KLIZHmPN/zMc/wlNIsz7gK8y+NZQHNg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

Currently when we perform system suspend, the phy clocks aren't
turned off leading to power leakage. Prevent this by adding PM
suspend/resume callbacks for the qmp-combo-phy which toggles
clocks on/off correspondingly.

While at it, add mutex guard in runtime_suspend/resume in order
to prevent any race between RT operations and phy_init/exit(),
as it can lead to unclocked register access crash, underflowing
the clock enable counts.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 187f0cd11f6c..65d280f45db1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4717,6 +4717,8 @@ static int __maybe_unused qmp_combo_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->phy_mode);
 
+	guard(mutex)(&qmp->phy_mutex);
+
 	if (!qmp->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
@@ -4737,6 +4739,8 @@ static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->phy_mode);
 
+	guard(mutex)(&qmp->phy_mutex);
+
 	if (!qmp->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
@@ -4761,6 +4765,7 @@ static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
 static const struct dev_pm_ops qmp_combo_pm_ops = {
 	SET_RUNTIME_PM_OPS(qmp_combo_runtime_suspend,
 			   qmp_combo_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static int qmp_combo_reset_init(struct qmp_combo *qmp)
@@ -5749,7 +5754,7 @@ static struct platform_driver qmp_combo_driver = {
 	.probe		= qmp_combo_probe,
 	.driver = {
 		.name	= "qcom-qmp-combo-phy",
-		.pm	= &qmp_combo_pm_ops,
+		.pm	= pm_ptr(&qmp_combo_pm_ops),
 		.of_match_table = qmp_combo_of_match_table,
 	},
 };
-- 
2.34.1

