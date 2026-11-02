Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620148;
	b=SAnsA5VIBx9sbOYQSTTyxSG2EMSTEiDRVZ1qhf9xl76IiQQy9yn9k7fqy/hE8TpcGjsI
	 X8Dje5CfElxF828A1qoQmyzPZVIpReHsK+j7smtYclmti6d7W6/Fte6ceTat4JzpaN6Xm
	 EpF85weCc6818PWbOy1xGfdU8J9bXd7XbyawDyq61vay7UqEibAaGQyv4hqiaT1KZQLE8
	 BLUvRuSMJsQap/IHQEnJ/ZuQEFAKJ/2gssab/GNQOpELHjF4vqmIMH6dhYnlNwk8t+6RO
	 rYBdHhFgvN1EePwy5bUCc1CL68eDDvu1EzUwB18CJA+uIxj8Z0rIS/CmcO4rWlpIq5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620148;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MIhl96XrVO6h3egsH716wpa0+bzeQt1syKhoX13a6Ew=;
	b=y3v+AfKg/OQvZCxLGy55TlRYe1SMU0+/I85FHnf+DjBfL9VQbzhJr/7TziYwlAdRI4Gs
	 zuA2VgJoIucQOXZ0WzKXL0CLrQNTlAo4QKhD9GlTUD3b6lcYJUKrdKAY5hnW/dtYcLUVw
	 /l4Aj3V/nEfXEDRnMgf/Qz6AUmt8E0XZGFLFs6ZrVs8tKcEsirOwLndofhiB9s7lSmJlB
	 ottwrjMtJxKBi148TNjhJNmTX+mw6n15Jp5aKQNk69YaaXVrBuPNzkWT7IM0rrA61erfp
	 0iMSOcSSCK4eaMFr4O3eO6aSzeHYuH5Q+FnxG4Fm+IfhbujHjxWLp0l4YGgevqKl8eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3ow2HUe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MSvlHdZJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ACF606A338
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7ACF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3ow2HUe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MSvlHdZJ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AOCU3086554
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MIhl96XrVO6h3egsH716wpa0+bzeQt1syKhoX13a6Ew=; b=N3ow2HUeRab9Viro
	5nysgmFgkDbs5ypqJJilqqtXkzVhOwlmho7t34QDW11POrylfI8KQ7kW66kEsNSw
	wcxCXBdxjlZsLXe3G+T8oLu1+JdMvShcWkJI+rqeMdcjoPftFEIzrAfCH1fLjP75
	0REt7Kb5VcY5O+bt4Rzkt8gyh6Ss9c5Twhkdb18/RCV2yHnBguxrQVv6UW+qiZJm
	1WkDDoyg4J109pjMIiNVE/XYpR1mB+2155izGnGMBEH+oK3umgFPPExrbXsmj3qU
	CSz8FrRG05nrWA8chnJ+I49xNnIK2LhTleI39hYUEF/9wLkDdRke+DiEi6785RnO
	xKFb3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61mga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:49:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so563616685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620146; x=1794224946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MIhl96XrVO6h3egsH716wpa0+bzeQt1syKhoX13a6Ew=;
        b=MSvlHdZJc1ZCwrczSJjZmHy7SME89cB4KeHbHglMcV3TIgyvnKqSRwmXcOrrRbvK5y
         VasnMwIv+CgAuFisnlFssiyMtd+IOwKVfx78ON+0IxCc/kLZ1v5AKBqRIBjXszzzDTZt
         dVmGX/47WB0eSGwc+EX61VMacD+FdI5TRdO+y0Zh39IM+u1LHEgmK6BkcDn7IFPRbRl6
         htnYGP+1veKYvdO68bR7jWkMYEAPjso9r/+X3EGkd1M8aEit2fguZxMESGLC4/D+ZYPs
         2K7WZOE7mzMTkxfLfxhFqVd7XX3Vjg2FZL4kNrgXc003d/Ie1nK1H90+ntcvjl+yGtQe
         5wMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620146; x=1794224946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MIhl96XrVO6h3egsH716wpa0+bzeQt1syKhoX13a6Ew=;
        b=o5L/r67zafw/tJ4kG8Uycn76I7iM8PO1z7osB0u2D5w45MrBSSfvJvxXUXAirptezX
         TRZ4gvHM3p3E+kdmKYw+tVAjYoj2azWl5TnWwN8MtBlzHsZydqCaelKPUA42Vd49Kw+z
         Fbd76LVWDuy94bq7f/3H6ajCwn6IrT7sSEmXEcToGeZw5jxBTO8Rh//O2HjWlrAAMvhM
         7WO9BcCIQc0IuADQbNola79eC3S0OiJaRuIxTThi9e6PG6FMhCsaP1IjY4xCCKBk5p7e
         zYgPLEpg5JKQu5finptmkDEqC3Ymu5O/amuttnuVnGs3EfnmxktA94PH3VBIxBxTnCN+
         4epg==
X-Forwarded-Encrypted: i=1; AKwUvBzWAhQpc2geHBfUFrpOqy4YpOeS/udrZIt+1vFcCRm5niQFNTgcAEh1cE3/aJy4hJ2k0qSOw0LHiuipYKk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpwFJeFuaOi8WCvzK6e1HT8TTOauo+e7w9tE5/ae4aKAt39pQv
	7gKGOI2XZF9dHFN1MY9KlHS083BLtxKbjkYcjWosa0vWSxMdxoFr8cj36qlUte6BGfwN/pe+YIj
	/Ekyjc76cfVEHewdt1gCvHTa4Ix5+VGkT9sFcbOcEWs18rOAl0OWLW7JER1zsR9w7zJE=
X-Gm-Gg: AYBFou3/wWP8/ttUKO6zdJlV8E56c1MNbW1IteuNqjTceFtKGId4wu30pfQdQBSxg7l
	D4AXktq0I/AhL/UfRu3U7LN7p77Cdw3U7YWvmgbUZhOdo7lJp/omMbuiye46eiH33KLoxCHc9n/
	lHA92UQXlnRzOl0YQ1sGgC1G6NwXVcSj811sH49Ilctu791wOGzmrZoSeOykETQ+kMVtTPlD14r
	Tj4XiMMnDBQwxvgXnu9QOf8NyefWyJApHd90C/eSHsWRN0PQd0puEXKR1WWPYqBGDUC3Fee1pdm
	JIpkxglS4Zg1NLsX6LaDGRiLUCsICGs+mZVFUzcO+fknaFTOAjN7nCUwc1YqPkDNKjg92roY3N1
	vBvbuK15sqOxSBXkPn6BbqvMPBK+ae8JGK0Iydw/jzkfPjuLToLXHveafKQ==
X-Received: by 2002:a05:620a:2794:b0:93f:61a6:b7a with SMTP id af79cd13be357-944217b8e35mr1507868585a.62.1793620145757;
        Mon, 02 Nov 2026 03:49:05 -0800 (PST)
X-Received: by 2002:a05:620a:2794:b0:93f:61a6:b7a with SMTP id af79cd13be357-944217b8e35mr1507864885a.62.1793620145048;
        Mon, 02 Nov 2026 03:49:05 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm19766031f8f.20.2026.11.02.03.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:49:04 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:48:50 +0200
Subject: [PATCH 2/3] clk: imx: imx8qxp-lpcg: Fix stack overflow with too
 many clock indices
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
Message-Id: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-2-1c3fc3fe727c@oss.qualcomm.com>
References: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
In-Reply-To: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=dhlDpkiSrZhRzO/cBPcN3/Bco39G80HHAf8kGP7ODtU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6HipW6PTYPSJAlrKvb7+9EmcAI3l5HEoGI7/I
 2F4ZkNz09eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh4qQAKCRAbX0TJAJUV
 VkNrD/9rDjIkvAY9Zjhn8SYl9PRi56nuL9RalFeecAW+CPPz37wCegFcwBum1JuVTWOtlGmnHoT
 5LGTqDf/fcJEQhLpb0c6MwAxvbQ3VqpeBRGzfkfN3NYAquxuDXmpaNqRYCOQDJn5U/KAINI46Bi
 v+zKjnd+i1IgUPIa3URFlvM0O+AQfoPKwPJjI5k9HMJ4Abu7WphOR0JAOCPp1IpcvdhfVG0JeG+
 zyaWy6yUPaqOgQERPFEkBRzpadAyOllZ5Jz2k5HzfkDMCKLnD8CMK9KEymw1n7jFPYMl47Yfznb
 zL9aLn1gEif5ciH6hJ8H/oS07giqUhGnJ6z1V87got0QndfFdjm3XP/nYI2RX/GS99nbP1Bin3h
 OoFQY8sPu3syIbMjei9MKmDRFpY+kctJ4rQlXoh5IiEGbhhs07X9PzfOTxpe/a+DKi1++yxQCo/
 KoR+QXmPc4kG77mJKvsf25NsMzjKKGjisECaJk07bswkgNGZF4pR10HQd2qczgYbeI2Uf5uBVgl
 HFE+I1wywFJuSZ/pGHo71+kCx7ar8VgLejjGssWuTLWPkFel3DrDeBIi97VAy7mglug8gVdLAw/
 H6q6heBVtbSP4Avb4mrOc7uBGB4J3P/1ejQfyYSRKjXLtaZY8gIRIf8iBIEyQrAGlpJsFVa68H+
 9r2f/OcNO43eJRA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 2vGHFTkoEDHeCFC6D02C3blT-ywMY4qe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfXwFpWzTnY7lIn
 xQv63TWGK/wyQ5BpKRKYqIob0mPhOQyqzCCe2OTi19abYe7MvNy0In7zJmWO/bUiDO8bvGMbATV
 vra9TFR+JsmwHerZGjx87QpuzIr/Mzo=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae878b2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ci3yrrcZy3FTaSNcm8YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfXzcQLENMsB4wM
 CDSdcHU65x5ofgIx+PLBru3hRvMvQzBG6mvJCLwJWWVQrS2pd8hef3tldl7BxPdVLSX0gkW6qLK
 tsPKcoK33PedHyvz5YgPwW6nK/pqQvRZvVDjCkqWr6IUK601I02zhmt1zr6L3ZOj1u5K5en8A+O
 Sy0UFVz9r3l1ZGPudWDgazMpY9BV4UdLdQ0DjQqQ+32UpxaoRi9++T79qFBOluEIGNLVUpmcNsL
 XV1r4fQCgRKTL46p0dArF06OqZWjZtabe8rSsubXjDCjY5cLrm4J8I181KNv+oxAy7BioSHYMgg
 aPf1i8Q+SrMQMYdR0mYjRKthwgXbsVq8pEwEuKjs5+AtAdxcYu9FlStMj5iXimFbcXUHyMxn/eX
 F9wArhSFes6Qh86Xip6H3hq0cgR56bXs8pFpDWASwkCPogOXNzTxos0unUHvLxgCZcL6mYrugYf
 Awo0W6SLnQUmXqArkBg==
X-Proofpoint-GUID: 2vGHFTkoEDHeCFC6D02C3blT-ywMY4qe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020046

imx_lpcg_parse_clks_from_dt() reads the clock-indices, the parent names
and the clock-output-names into on-stack arrays of IMX_LPCG_MAX_CLKS
entries, but sizes the reads by the number of clock-indices entries,
which it never checks. A clock-indices property with more than
IMX_LPCG_MAX_CLKS entries thus makes all three reads write past the end
of their arrays.

An LPCG has at most IMX_LPCG_MAX_CLKS clock outputs, so reject a larger
count.

Fixes: d5f1e6a2bb61 ("clk: imx: imx8qxp-lpcg: add parsing clocks from device tree")
Cc: stable@vger.kernel.org
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index e57e7bc074a9..ae8cb5408246 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -200,6 +200,11 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
+	if (count > IMX_LPCG_MAX_CLKS) {
+		dev_err(&pdev->dev, "too many clocks: %d\n", count);
+		return -EINVAL;
+	}
+
 	/*
 	 * A trick here is that we set the num of clks to the MAX instead
 	 * of the count from clock-indices because one LPCG supports up to

-- 
2.54.0

