Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304701;
	b=QjRUYuxBRQzKIwhWbDnEhXimvMTo5yZQqZu8TB1K1MQ+Lx6Yak7g6SNu8JW2vuusuENJ
	 6HI1IfUI9ubpaxR1IYEZU9zuKzhkVuBWCvgcFhj8H6FfOhbA7JQeYSVi6RWl1Hl0zQiVB
	 c8SSZNDYItMYCRvEU+zEgs/pc+DZSrfKhP8n4jjImIH0Nb5MzOL3zlRehMzLjLn1VglPw
	 v8goK8/XSUTxSfm1Tfp1vYq0q7GidZkfXOeKoiU2ie217iXqv6cra9okn8A2KVWQ3EKFT
	 ihWUyl0OfQVYOdfKe7BY5fFWSC9NUtDi0qbq4NNdn0gl/rxl26u0TWD5saD+YrHgJpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304701;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=;
	b=beMDn33Vy5lZnzmZzTnVwytt8nlbQPtakgNqEUZnzBPSNA4+8o+hfSv+EDpku43UXg/r
	 h0UObqAT+9fZdV6I79bLdqxctDl08oAKrzIO+McXp4XQAi7877kvg9bZWAj6kg8E6k6h1
	 Ct2aRzrnt0ggHu5fVSTHoEBsna6q3FbTzhK2rXSX7GJhjwkuyoSy6f0alGw0QfNapAhsM
	 8H+SPaJAVZwWiyrwpGe1CiK+OowHDIbtWWaa7pW66qYg12gH+1cc1hYOgYYk3hM3qF2y7
	 c1qYL50oUs5Y2fpgwAC25B3YxOIYdnZ7dZWOqPxmGXqMPN+ze2xt7dEGjMwE6Fq/hjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJ+9Xxz8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KnUfnFC7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7BD60A2623
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C7BD60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJ+9Xxz8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KnUfnFC7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lBC13392504
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=; b=BJ+9Xxz8F01ulYxz
	Q82Rgc1TLeuaSLBIHQQNL/D4L4QXiskoc2JiS3ZpiI7i4/VN16CqbRxEkZpkcgm8
	Vl1q34xADLUNWgC0zXE/5Qn+Fa8WM073mrE7ACJumvVjiH/MQ3x42jMjC7m9oCJ1
	24VyP9xr4D4AfFk7yb3jUQSzh9PaVfYsoJbrgTDJuhgsMhnBveHyqqpN1D8POIBc
	JGhsOll/gl/GqHW8L7DZUOxrsy0YfrhClZIu03g5H3wX6cM52siIhQSBOmsr7CMd
	jMKYWLLFTj/5Ucm6PyqMqXodNu2smj/yHoCAR/XUFUGln3PbFAgGeaUDT+WifZDp
	kPRs8Q==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg2wk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:58:19 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso2577628c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794304699; x=1794909499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=;
        b=KnUfnFC74KNQ+wedcS1wV9av7KBnjR006xkYv7PfmG7v69mUsdekqgJE0tuywt1PMA
         jVPWHUD7RClDzZtBAxRJ2xFZqdp6GmoYP6BiHq5/YrNvjyFEMLJsvRAEPqca4p1Iq0Kd
         rhwGJCDrEdF/lnbEFwRY7QF5mpZ85SPrYlYE65/9lA5/pDgttodiMa2tnu5KdqSFe6u2
         dTJKGvff46rFW+DhO5FD9B8skwSVDx3DpQxV0/r2PUWllha3ub93ilTXnXhPRWOf+iFe
         pNChOlnfslfMvbOyr6qeSgx5yL4QykP28O00k8gDFQMeEXpbGDqp7ekJp4GqoVMsvPM8
         suxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304699; x=1794909499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=;
        b=tqH0rD8VypvruEe9lHaWudaB+ocihBNo6iRBAOWS4BbRZjb3U0TYi/AhHYHYTBhovc
         XVbdrlSOObkWTDDF3UauRrkJHqWzhhApsvYieG1jGiRqqY7fIaxvmjCIlF6yqTkVkMZE
         tVQ+m1tR41VkWMa60l8itvUWnYgt61sueY/0qVeNPyVE9h9233Kd5Mc2AlwhuvucdIoH
         kUiLTrTSaS2oE+wH5JkpXWz8MByWlriwDxqSyGa5P9GD0gLOaZRSGbz3fsQhzORNJg/a
         OX38Qz4QkhggS3tCFH0gbjhj8kjTDzTwJoNxD+jP7EwbTHFDkgFvfVNVQL1BYyx5r7Q+
         o/Tg==
X-Forwarded-Encrypted: i=1; AL+hErGHV6YgiwYz2wNl7zsl+T9hsXHp5KWatqlWBFGEUtYm/4q70p+K/76xEPmL5Mn8WdhCPU0hd5JVVjtdfHc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l8/nYecEYF3qze5K2QHgVvlwqqoxuVmuNaZEQSk6Vlnmz0axe
	H8ilneua1TmIsBAmqtcph8n1UFkeaOKc03ubRX1HARzjdpASPh7NYaMuRYucF4PBjy8d7sx5gG6
	DZEe96IPhPyRKqxKs53yVDo61Cdrh4AKHjbGhuHHC0Yho0jqelUTFqNNwdH5kK9Vv1sg=
X-Gm-Gg: AYBFou1gCPE85Uf90G8VUdIU2Iu9QA1pk/JQJlBRRtY4TyHmMzI05fErKQWLiqhBy5N
	4OcDFIbtSWfy+xYmraq8kmqunqSNo9A/S9WXjoN3mibAeA5TXzwsr1JZfC1g1k2nDRb6fCjePLt
	QsDMICFcXx3jGmWbkqb/1iQc7fSCucw8fLdjQgsOpMRWYlzGT/t15+h71ZrJmBa1RWchftlI3dp
	2C7o0Qd+WgB6frX0aNOI+CMSL8pBp/weVfbJhSS71nQuUq+G11DIw4gWmpREAUUAmBzUku14UBQ
	Yar/APs0ujAbOngbLZZBSZ1b8HWurjmzIKTJbu3z2/TrvseSfJcnqKvSQFCJ0Py5PLQUQcBvJ2I
	/siixINp03eL8mEKYXQiFK9MdtlZNp+yqWjKekSjQNAZu8aPsaunyy5ghPWl5+6HiNBLtMoo2Oq
	T7mUeszQ==
X-Received: by 2002:a05:7022:b90c:b0:14a:8df8:56c5 with SMTP id a92af1059eb24-1b3b607b487mr2969490c88.26.1794304698387;
        Tue, 10 Nov 2026 01:58:18 -0800 (PST)
X-Received: by 2002:a05:7022:b90c:b0:14a:8df8:56c5 with SMTP id a92af1059eb24-1b3b607b487mr2969461c88.26.1794304697646;
        Tue, 10 Nov 2026 01:58:17 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm7333141c88.7.2026.11.10.01.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:58:17 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:27:13 +0530
Subject: [PATCH v2 1/3] media: iris: Skip redundant decoder input config
 params
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-fix_dec_seek-v2-1-210d8c4fc31b@oss.qualcomm.com>
References: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
In-Reply-To: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794304687; l=2308;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=J+3ZsNvdFp2OxHwNoqL05vud6cfNJiFhDK7G5hBgPFY=;
 b=lzO9FTQ3kd/3K/7lj8dJx/QiPKGwZwGTzVEkzT6ce9a77Yptt95uDUNwrV9TjLHmHQ2lk7HyF
 IYO9duH/L20AtQPaMOTJv1qn2rXYQhYcz0L1XVAs/hXh/jhNj31BeQZ
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX8fAsIw/bmF2X
 IVhXnX4Q5j3khxBUnYnIGsxA3kWwy5/CfdnDemSCqyXrD6oQh+nDirmJphp8CLQJbYsV/tbsrM8
 FacyCDvaCNOTscCFPZICcqIVrqzm1q41WO7oaLz9LNFVgdFGM3vVw2pJvr7hD2voDSpeMtE74RM
 XNVartkLcm8ZrU15/JgGRUekioIcb2lpHK2h4tSn7DsTEcCWb8TSHoFEjz+ps83x039jRrAYpDt
 g53vigq07Gl8Mtj0mw4wGwuOqi2KsbhsA7R9DxnZgAfAPt50gW0ZF6eHH0I7+AQB2U+WUrzhAHW
 tuZ1iy1YYDJVzOrKNwovHOpNxypzeMtdiqU9KLxYIALRZCUo9C9HEu4GJdh6ZNG3twX6Pi74k7R
 cks8TW7fdRULN6GwS+gX5FwZ97BiwynGaaxpzkD0FlEw9bZnpcsHlSOOuo092GskVeZIAXKPw8C
 nZG3POTKkcSojFEHYRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfXxu8d408NyBH+
 LO1YUe+6porJ5Fkbz0rm7Ts4ug+GU+iJ0EltSt7ADJRwjk0gw9pPglUVGJbvQ2TqVa6JuQeDQI6
 24YdSKffXgWt1m5TRIkeXMYeSAzI/BE=
X-Proofpoint-GUID: R2Sf63Zz5kAgybxUEyY7toAWswxvEQCa
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2eabb cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cPfzbt1C_6B9HWAkqhEA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: R2Sf63Zz5kAgybxUEyY7toAWswxvEQCa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100039

The decoder input configuration parameters are sent to the firmware every
time the output plane is streamed on. This includes streamon after a seek.
Resending these parameters generates a port settings change (PSC) event
even when the input configuration has not changed. The client then
receives a redundant resolution change notification on every seek. A seek
hang was observed when redundant PSC events were generated for the same
configuration.

Skip sending decoder input configuration parameters once the input port
properties have been programmed. Reuse the existing ipsc_properties_set
state which tracks whether the input port subscription and properties have
been configured. This prevents redundant PSC events during seek operations
and avoids unnecessary resolution change notifications to the client.

Fixes: 025398e9121c ("media: iris: subscribe parameters and properties to firmware for hfi_gen2")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 388a36ff2b07b..fac61ece177e9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -668,6 +668,7 @@ static int iris_hfi_gen2_set_super_block(struct iris_inst *inst, u32 plane)
 static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_firmware_data *fdata = inst->core->iris_firmware_data;
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 config_params_size = 0, i, j;
 	const u32 *config_params = NULL;
 	int ret;
@@ -693,6 +694,10 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
 	};
 
+	if (inst->domain == DECODER && V4L2_TYPE_IS_OUTPUT(plane) &&
+	    inst_hfi_gen2->ipsc_properties_set)
+		return 0;
+
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
 			if (inst->codec == V4L2_PIX_FMT_H264) {

-- 
2.34.1

