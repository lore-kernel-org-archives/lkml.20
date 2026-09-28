Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E86C19CCF5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573457; cv=none; b=eGSpPmCELFMZ0MuF5R4VCzOvbaW8A6qq4rnCq5HuRBCsGxsFD0jnrZZza2fiwnG6y1gnZKl3GIb20F/3hxAfBhfbtjWA3BJk+UVCHkrvN8kUPLyzJ1ajTx2Pmt0NmzFAceQhKwdvvH+EIfBnorce9gXtBWVut3goqjgFIuarsiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573457; c=relaxed/simple;
	bh=p0fYfQMfdXM0IZk0GowaFSfR5z4ai1NkyA2e29FK9Yo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Aa6WU1AgzqpHJnMAoBKkJoI0B3m7KMYHsz1ITWe6DiYYACxgTTWJamaFmHjKpKC0xQHB3iX40jH50wNw3koaRVD2mDQsXE4yvtKPg96ksISPN+qadUcbGW7cWAPmcVVJa1v4uQ0CDTPODxl6PUZPfMEyFL19PAYvIYwuYxiXvDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwUhPPf+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FNsXLHvK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwUhPPf+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FNsXLHvK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RMXUSZ4034318
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sRSEQE64W/kToXwpAauJnOXoNPyow7V10Ht
	INF3dHpc=; b=OwUhPPf+JcrIvOc3QieuhXP/5blx+qi4MD2K9wqQkE83k2ovCSK
	NWi663iRaXxRCgCi2wn6e3lMmTA2mXVEfY0yQrzgXZICCd3LVaZVpVIQ5YDfTDpj
	RNn77wILQSVtwFmRYS26cnyyc5wBUTjRnmWiISCFH0Y3rfekAhOiwMkpaP4fVcj4
	Yf0dX/1RheMuyx6E0W3e8q1oozg4VXG9qaCkBXoqHLjad0YuZK/DWyJDKkLnARWV
	BLvK/RdK/02rQKHUtDWUUm98wg4mQgsYeyUo3NLKczNSO0iDvbOQCupn+jy/CqUZ
	Hx//3SNXx1wUq581OjZusNYLf46hmJUja4g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx64uvssq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:30:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86a2639398cso3883119b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790573454; x=1791178254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sRSEQE64W/kToXwpAauJnOXoNPyow7V10HtINF3dHpc=;
        b=FNsXLHvKg4+Lf/KoqSdi+jIBAX66LMCnS9xrsOz3PD+tDBHoTm7k5ZKgvMRjEkgwNK
         yONPchxze5O+ejJ30I9svxxRMbPT4h7FF0pKJlP1KuUF44XesIiGhzzfj4X2iVmgI/TO
         YXzsTRhYL6meOhNhkQEqU0C9Un9l+fq3BTfXJntNolm8MGuKbS26RjYbX7psn4Y61Ibs
         Q0tpHz+fPN7abPvF6yrzv55ON/Wg4KcFmBwsbpStPI98ha+pM3YDdTXAg9EeJHTn24JD
         fx1gzblGcGVre331ZuCEMBITqgXDcU2aMaBV88p4D2J9ZUl4YT4VoNtu0wwj61rH5Im6
         co0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790573454; x=1791178254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sRSEQE64W/kToXwpAauJnOXoNPyow7V10HtINF3dHpc=;
        b=p4mYRoD/nN8aaP921+QswmKVj7Emheg28d4qKvklJjQOdpXKgUOv8ldWbllCBzCyf1
         8DycmjFbDt6aFbxg+WrR76XcA7dZkajS2sz4CdqDFizqlfYc/kQ7JXUKDV6degrNaahx
         kUc47i4R53YUgAddseXzkrV+a0Dlz/IQuylDQiDddkl/v/p0+l+kteLoiPSVPA2EWBXa
         E/RQnzXRqnX/0E7/IuHJRonENC7YsHW7VXOSyNct60oJBLucf3sZ+r8rmdfn5gFIl3S+
         7kwJpvChPmv8oUJ4mz1T1Q5nqRIlFlQc+rORQ4TBjNUgnstsX5XthkvZ6x+as3PqHjIv
         /6DA==
X-Forwarded-Encrypted: i=1; AKwUvBw2sv00Ket28Z7hf/EHDFx4adpitLC9WcUC0KdZ6b8WrmmoeErNy2Xtp2Y4kHPy/ls9HSs2t4LEhEq2Yas=@vger.kernel.org
X-Gm-Message-State: AFuF++mn//sgXM+5btOCj4jOL93jzfjQ8S/Sq/9l1Z7GtNdhUs0TRnBB
	iM6QYxJoIL+oUIqCNoaWtPkVJ2jJd3IfZsH3vX5si0cx7l36nlYJAjXJWN1jxFBP3FttZqh/Ee/
	fObtl0keyhToNrqbSBY6QmFeudM2L2ZtaETIglg+/HOAvu/OpuXtez17QJFikhFYiTHk=
X-Gm-Gg: AYBFou3GpF697hu2FwsvgUssqNdNg86ETYGA44iqL9uPwg1Z07htW/az6SDFM46VA+q
	ad9GLQ0z35DY1vKVPzzvuXz+Z+3Clgkuu01HnI3VscNPiN7CUX1CvQTsdXsG96Uuq0vSrl3NDsX
	VS0vgJPUjdBHa5OqERZobsCgNPOJplC1oOO9oEQheOXAmlLDmhCdswOCWjIwSqGd2dJgjTf/X9u
	SryXEt8M+M9w90AqagM4oxvErs+JzNnyJqKQDUTCTw2srRdQBhnX0qnc+xl+NgWQbeQjTea8j3Y
	gmGOzUFIuXxpOdPMFeXWeB5bH148desVxYs+iORtt+xLAtO7r86lt2r2Otj1O4LiX/pZP3B03MS
	Df93MXxQ8dwzyS4tfNQ+quZIGZ/BpW/oy28Q4hz0jNdxIm5fbIQAEJmGTBBZXPPLD0uoZkXHxbk
	lI3W9uO8Rur5pdOSz+HiGYdw==
X-Received: by 2002:a05:6a00:340b:b0:857:7337:5db7 with SMTP id d2e1a72fcca58-8802a2b91d9mr5964990b3a.21.1790573453842;
        Sun, 27 Sep 2026 22:30:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:340b:b0:857:7337:5db7 with SMTP id d2e1a72fcca58-8802a2b91d9mr5964974b3a.21.1790573453347;
        Sun, 27 Sep 2026 22:30:53 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feaf8516esm3472936b3a.43.2026.09.27.22.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:30:53 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Subject: [PATCH v3] mailbox: qcom-cpucp: read mbox hardware register using readq()
Date: Mon, 28 Sep 2026 10:59:39 +0530
Message-ID: <20260928052940.688105-1-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyMSBTYWx0ZWRfX5e64prPMUZcc
 nCw2S0abBT7Xi4Ie/w7xROC39EfYDFSChzdRz4YoENMhb3hv0X4W/hnwNroxLcv44htEZSSGgI/
 5YoGvE1bcAREtK8QwNPwseKHbaTu35A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyMSBTYWx0ZWRfX3RZFvJiGnGID
 OmQm3Q3wFnWIbVr27bCXPDtITftP6zoM1nm1ZPtfcHcz2N2B0a+Pbw5M2zs/wDZNjq8ZreIpcGW
 5r70laNCMkkEc3dysZfzQ4sodLK8sqOJqbyrvmIjC2ne9jed81St+oMHUfqft1k5tox69m982M8
 VWnhT8YjzFlhq3coF3Tq9z2Fi8JJxcA88xhIM1frkz4ncA5wtWh/NzvRtERiSm5pbhvpnDLnaQi
 Lmzw5FppAHDXp+MlBdtZWcOFjKtMgMx/lIqkCYvo0gvUPkHy301Fx2smnZ/s8DU6QKv4rbLYUZL
 RUwyiu/FL3tJHBmIqR3rPU4EBU0KBop8VmA4qNrTwsN/ESM3YSe3xUmMC0uSFveZj4mg2gZ5LuY
 0kPpwYsa9fyo708N7J7makV49BTRyJ5ZrBraSMpnOjUzEU1FHYbFuT4cZi5u+JixEV/wl0YVjoi
 4D6O7dLdOfsEY3zPkSw==
X-Proofpoint-ORIG-GUID: tMY8OUZKtBxMCj5AHfBciUiDY4lrpnkY
X-Authority-Analysis: v=2.4 cv=E6xYNqdl c=1 sm=1 tr=0 ts=6ab9fb8e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zVvgFSUyQItoBg7ASCAA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: tMY8OUZKtBxMCj5AHfBciUiDY4lrpnkY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280021

Mailbox hardware registers are 64 bit wide, but the interrupt handler
currently reads only 32 bits with readl() at offset 0x4 (upper 32
bits). This returns an incorrect value, while reading using readq()
returns the expected value.

Use readq() to access the 64 bit register and pass the expected value
to the mailbox client.

Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
---
v3:
- Removed references to an out of tree driver to focus on the incorrect
  value returned by readl()
  https://lore.kernel.org/all/93ce8588-7500-45da-9b9a-424c202590cf@oss.qualcomm.com/#t

v2:
- Expanded the commit message to explain why this change is required.

 drivers/mailbox/qcom-cpucp-mbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
index 862e45e8fbd5..0b584d9aad6c 100644
--- a/drivers/mailbox/qcom-cpucp-mbox.c
+++ b/drivers/mailbox/qcom-cpucp-mbox.c
@@ -61,7 +61,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
 	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
 
 	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
-		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
+		u64 val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i));
 		struct mbox_chan *chan = &cpucp->chans[i];
 		unsigned long flags;
 
-- 
2.43.0

