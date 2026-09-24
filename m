Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549D9478E3E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246479; cv=none; b=MAgUeN7kNaaaC2n0qCmoGxuawBUcKdc+EhdRrtxhbRRwO54QN3xF05VpH+hTViqsBk2WhoruBuCkUneDLsNWLkue322uCJY2rcqPFrJncxS+MeruDYApgjzfaqVjl4JnnHZab7l1wS6xl2/v8WBQWQhO0JPtGeNCX1yEEROzpGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246479; c=relaxed/simple;
	bh=cN+HDeANXO2WMlU60A41XyfjL+9PDn2q1Gybx6k4qRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TYync/xnvmUFor8DG/2SkrkfNdZcURGWr3tqD4u2R2tsNSgR3wE+vK9zVcE6cD8ZzJgFK4bfoZQcTVXFdh97wMvg2JXsJvTsJDabAwj7lL6FF/3CFbeS+AYd2rkk+6xGARLdhBR4uFrutWo57R71/fKYXU5bdWHM7TswPdSmnXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kyRfroev; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JN0iw6nm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kyRfroev";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JN0iw6nm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9QAdD1774013
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JgGhTlb+jOQvs3aXlU2sxM2hnoUQkPlVacNowvYv6vM=; b=kyRfroevuffqI4M8
	JU8qnhtyKW2ae6PQ/eD37krOHEoQ1kL1wUeSM6UCDCGjd/iyMfZeov6u9E03oyv7
	UqsesDVg5XHvIPwZdFT2fJwqjckEVSMOJ+YXI8u46vMhdP3JSUmIq9R6wfNzMi/K
	365jWVKhV9x3RIeR75coeJ31pU2jpkUdj/Lq4+7rtzeY4AY8qlu3ng2MRru7XS+n
	hxn+As61DVPlfiS9qehlnnSjrfw0xNcyFJl9Sv6iD+YKb73q3kI4bq9I5ldTDHaS
	Hqjixu0W0sXZqe+jhbUXQhjZul/HTBJGS3vKEi/AYRa88LOwRv5bh3yDl9qUXYCg
	BjQATg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb41bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390a2c895bso450220685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246474; x=1790851274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JgGhTlb+jOQvs3aXlU2sxM2hnoUQkPlVacNowvYv6vM=;
        b=JN0iw6nmd3uyr+lkVuUDIGb3nj1Pqnnh5o3vnSN13wx4tBRTADhSaEuE+K4kIgvAyj
         ZyMeWqQ09jDIiOG1BVVWnEs4hl03mz2+K7lkvVrPqw0lLiWrPN0fJ6OsmmA/NHoISHBA
         Cr9DOXjHTpktYtOwZgfejxBJz6M2AG4+JgAH8u27HLXcy4te/UK58QU8o7Fzr7q8QICJ
         K4QXErLbtaKOHNcGfx/7W/n+t/icuEkWpvLU0jrEr3t6HAgG8lU5Lz6Bfs+UB4JOhHjm
         FXl/BSeywJlUBnLGk9GzXW6tmq95vio0uzEbySdzlVVuFWCGUxDBkhzn3aWSxcqaArTh
         Uf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246474; x=1790851274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgGhTlb+jOQvs3aXlU2sxM2hnoUQkPlVacNowvYv6vM=;
        b=Ajc98paxYYaJN9EsGI9e5qZzvwZAvri9jmpz8v1jbFP6tAnB3Qc4IiOGclI/DTfJcs
         rR6uDhCr/BHpAhaC6k4ayptA/0qwV436Ie/tzahPDQZeW2Q17ZOje5QgEhz5xuts24fn
         jGoBsfinxXwcJmU/7c9ehUGOsdfIZ8VfzbrwlkNne63hQUrr6JU24mrodLkubkXHVXDX
         3JVdE/V7wir/2NQD/aAtZDZbjcs8oiUUrUUzf90TllZgX082Ar/Bk6MnsQJ0mjWDfstf
         vMgglU3xAm3AfuOB6kq7MpKGtxA+iNcQagfIZzgVOg0dTxPKrZr5BOlIWuJd7lkxYVul
         BKWg==
X-Forwarded-Encrypted: i=1; AKwUvBzXZpXRH/ET7o3bULjeO7PZPAZx7Dv3HjQDHBaTvJabe2C8O9Wj9KhasBeu0+8oCwcbMTlmK/UMC/0MBZk=@vger.kernel.org
X-Gm-Message-State: AFuF++mmj8XcJDzBm75S+UE5ARorlkaOdxqhwSoywfdxIrkrrUkpxVmS
	GYB3pN1LGjQS9pWbt3vlSaRw7ysh5TBTR48KPPq4X324dZkoZ33W9o43BG6Xe9wr04OFRXi82uc
	mONBTE1NeYVv8dsEMR/WaMLjsokJpoyDBIrSggC90M4l+1LUhwF68hK7sk9fIJ6Nb8p0=
X-Gm-Gg: AYBFou1ZayonE2NUnF3IsvcOCXktNvrsBTDXnuh7MbtG+ZqzQe8cTrLZGz3oaBGADXR
	VI0B2eWJZWGWUqtgo117ljJ+x67SvnERLOjVdQvJjdzyaj3M+XCPAV1KCQUGtr9+0JNZUzErJz6
	QTQ4qGO4rEAiC6RJ+wBhcuq5exwXbckc9bvp8hyr0HnzjvBSmDsRkn45dbdEvPKedWgoDyhgVrC
	DGPPaGj/z3TBsYOg3Uk3+zehCc5rIZDiGDcK/Qul6XDJ1FVkMgcOuLK5rETIDf4PcRP8oDuyceM
	1PgXDEWf7v0Iu+H1st6Q5/pTM36u8535yUGtU9SXsnlpVriQtlWbCOTAT9gMxGv0uC+MdeUjm7U
	G2xMr0Dtm
X-Received: by 2002:a05:620a:3197:b0:939:6de9:4cfb with SMTP id af79cd13be357-93c363f1ffbmr217301985a.46.1790246473659;
        Thu, 24 Sep 2026 03:41:13 -0700 (PDT)
X-Received: by 2002:a05:620a:3197:b0:939:6de9:4cfb with SMTP id af79cd13be357-93c363f1ffbmr217296585a.46.1790246473108;
        Thu, 24 Sep 2026 03:41:13 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:39 +0300
Subject: [PATCH v5 23/42] clk: qcom: gcc-sm8450: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-23-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=cN+HDeANXO2WMlU60A41XyfjL+9PDn2q1Gybx6k4qRg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3wt1xyqUBo2XBfdgM8ZCn/ydcNwR/CfFReq
 vWUiEPSp+SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT98AAKCRAbX0TJAJUV
 VpsxD/wJvaS5lYxddqVjRTQxsuOLEJxo72VVG9JcJ0mYkRyZgG9EtyyWRh27kbmYkXNwlgKGeez
 Wjh4lIkprw4IOUga4RtOAGnaI9s63+pzPPSOF10elrmZPd1ctd8HJr7Rht11AIhJeSPW+vxs1Tl
 cr+kVWayORHubPM67hM4BJStPb+KAjdHbIs/HVzSUsb88U/zYAJDfp8l1iQCDYJQ7zf2p+iZkHA
 j7MhFRopnpZrHdbKBEWO/tNPEOpjrdaFscsWwAdB/ASvChiN5GRntGcPZ92jpQvPlDHwMcD9IQ+
 +jlBngbiDVTz6v30S7xQzo5QZbtnkuiyAiW8VZFMDU4epTZQYwmIsMF4fWsS0uSxMZdSv21sxFU
 2Av2xR78Apz8syXTlQ/3R43zaND796H1g3XRRYZ+ys9qn07RuF2FqjXT4/mrfn+AFbSAIHky2QU
 aWY2NG8drgoaQ5EOPObKb7iVRbilnAkP3eXGPzUcJaczWGpyA3aQkmbyfVW/bfNRMQNnDYGoMCh
 iS5OxYNplOgrmSES+T+JlyWaO0csNvDgLwX9qsMa9vuUI2/mv9Raoi5o5vxex8ZsK2QpWpzOqbN
 XjYZeYCEpgnSpskY63fQT32AL58Ct17zR1jm9kr7zaR1mvyIR6QJuKOFw9bR601RjtrIya3AeFT
 EuiWgnwoXoCyt1Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: k3IL_Qg7j3kpB0g3hTRHZWOAhNVvAEyB
X-Proofpoint-ORIG-GUID: k3IL_Qg7j3kpB0g3hTRHZWOAhNVvAEyB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX6aANOj80RwQp
 POlICCHUnhE3/mrTK3+SUxe2M6ucvD75QC6RXxyq942TXCT632ublSHUhIy0e7pWmBUMjKUISSw
 EblF0nlwvyA1U/EtBcA8mQlrxJAJx7+/r5ge7UgiodkjaGqnKs8qmXyogSxiVcd9UxbJkL0K4cK
 U6SYWPtG+0NwvWtLD++g4ocPvU090O7LO8OVW+nTJ9dK+oRuyi7sTEnaTsGNRx0cmMj1w1uCRWP
 6bgOR3K2zK/p3fB6GUSfKMOTroA1S0Sfuj2a5CrR1+LDW8wDaishNotOqXlZ+6Wdlo3oFiU73z6
 4QUwUoAbHyvBXcscNvru8AXtjz/+8QSTud8KOAvF6V1PX3xlSIx86Aip8ULommnrC2tDbZQc+st
 baek+tCC73NuOtVil+EcJiys38NgfDJ+JjI+9Aradc8NJcH+qiIR0djzU29SR2Agn5gu8Oigk5s
 prTcH3ph2TNLlZJPHrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX0RC4s8q9nuh7
 urVero3ltK6ubPGFvCssJAkvlYf+riikwsVTZ3M7OjN6PbMAWzARvIvTx5t0y17U/EE2MTcMOab
 Y20RT5Jho9lDU0czSnuj18N6Bfm+RfU=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab4fe4a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index d473a95bef92..9f4672277932 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -3400,6 +3400,7 @@ static const struct qcom_cc_desc gcc_sm8450_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8450_resets),
 	.gdscs = gcc_sm8450_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8450_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8450_match_table[] = {

-- 
2.54.0

