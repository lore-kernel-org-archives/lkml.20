Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468023;
	b=DgignNzJTWf2F8qGdu1ZnsLyDtNsVwaNwdqS37FXZcSyqcSn3C8YtEBXwG/PtEPELnQL
	 iDNAqKXr5qn1xCDW+BFSNuR2+1GtIo8J+z56PQt0TQmwDRoqo0hPedCJyE6UtLdnkyogS
	 6lFWRzayhfbIhnqcLlMjSEKERfV9XpD6sw/+N/czJMLaDvSotGeF6j/ELcNpAEUbW6bHa
	 IRKssx/DujpQxLJJTipTvbBCQGa1Uo/3odtu/3K4TitxR0WsDySXXvnt4FpqvhVdSLPIh
	 awyHnW4DdNYqRN1Ovvna8Q5uqklWYrioTlKVT3xxP78gO313i2cyMaGtYhXza/E1sFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i9jbtsLDZsS4FE9dYCV+4UGl52plCiZyJEyDlwed5Yw=;
	b=coICcg3Tu5qNK695BnUsXFTsJHklE/sJ91o47JLJ8eMFinqlAf1Vac0vTMcCNBk+pPAZ
	 /ApnJfJhaFvxbOt6h4XHFrJ/b4hV5fVZ9MSb/SZs1WBj2QX4vhmRCjGBDJ57dZY46UJxa
	 CdCarNKaFLu6g9h4HZ4tt2Taxrhjb+n2k11HsjJi4Z3hV/rB8eGwTv5TYroo8wqeN2tvE
	 cUSpd3Q80eydMdyaCmU8oc8rt7h9Rfl9FeM9ZiFbFnjTM6irZf8L1FgUy062/eRJsmXaM
	 LnGXAVbZQ41wS0O88CrljnQkUWGPmz7j9FYnN6LfgCQq8QngxjPGvH0D0vnNAww6KqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pKCBwgYw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZwykinUd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F78606A338
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0F78606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pKCBwgYw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZwykinUd
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZWHY2514179
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i9jbtsLDZsS
	4FE9dYCV+4UGl52plCiZyJEyDlwed5Yw=; b=pKCBwgYwBrnc/LxUl1E/mt5JksF
	tdlEVy+2HRxQhIjIY79Z7zmU6XbZp79c1JqTYYCF7IFim/q40yJ3b2+64HrLpS+T
	UQKlNTUsnCx44Kz6rK6zeTM0hVAgT2Jx8kCO1GE6VPbTpnsT/jZuAqZU4PmWc/Ir
	2ql8Voi9P5wr9oXDF/HmNREpFBDzm+yWm/HhS5fpoxaAFTxZcBiPjZlDjXMJ547u
	3XRMh1JK3Z1TbhiQA6zwonZIenU3qIQ1HbgAbbirDaTXcaF6eCiqYhY4sVWe3LSa
	jfCVWHKJojLfdZPlj221wCCfLQuAwdUbXeuGf4JC0AxbStE26VC4TfpQbuQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1te5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:20:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed121d5161so4031795ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794468021; x=1795072821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i9jbtsLDZsS4FE9dYCV+4UGl52plCiZyJEyDlwed5Yw=;
        b=ZwykinUdbLtRi2qdcSWDBINHpcS6tBsTqcvPJe1gYyoO5ndV2/Rs+vCo5N2is6A4/g
         jWZkr1nzaJj/x/6v52qVAL2ZM7Hgr6llhiOqT72vHbNpnzpIXFMZVGxNxzNahTetNS7N
         8wJZx4qm6bSqoL+U7mxrHgl7F9WO+dOMobv+pl5JhAElydLDBp3N/xjQwi07MRvkFX9I
         LRgMlacLt2SPCofncLeWcdzTBEOQs2wSUHHiorSa0KKM2vK6iIGX6uLZkUsUYm/gZH4e
         0zj3UZgLS8AFDidSh1YaD0u8BH7pcyGbDDrJ9J7XZ935uortET3JZ4Jj6xEfR78pel82
         uaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468021; x=1795072821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i9jbtsLDZsS4FE9dYCV+4UGl52plCiZyJEyDlwed5Yw=;
        b=GmRX7SvnRVsIs0d4FKF3dLAOqP0DlgfJ7+6LawQxyR37D07Lp2cs4ZcWHmdgeQKYD8
         WVXPSUEbykal7kU9ytdWer4/+N42xb1+m8s3uPBRtfzQViOW99TggZgOkEdulzyxDVCp
         jY6J1WWz7q4J3r8Mdr74xs3KNplvS4/+Y93k8kwjANhjypte/56o35LfGf8g020MNxcv
         OrQ0W68YOYXODRk1YI9gXysQftEDGOe7wyFAE56Nb4Bw5dXoSAheqsovmBuBGpOFgiUL
         bUq8lDqY1CQggH+76O/ZjPrNB/GW35tACO4/rlpl6TW0GnxsoHk+e/YIQbTD6+hX9pZO
         Ea0w==
X-Forwarded-Encrypted: i=1; AL+hErFmpyrKr+mX5mXvEu5ZbZBSc+BfmQKeoe4NrQg5BhxZqIDjmBLPX7/YRw/RhnwSinI222Yg0DPKG27V5Ag=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MdYRbMCkiJ6QXmt2qbPcRT+10NUodvQCr8NNAfYneYMahbJQg
	uX+zPhuMCz1Q0/PNjw9BKkKNY1uCGCUYaPAFr/IWwLsgc7B1XfRAClypm3YSI2y7dXovy5RT85F
	ztHyv2fGM+UmDxzbZMaiur7VrqHZDBiCAZ2+3ZcoYgqg+s0Q8zIkCW8tT9/HSXyZurXs=
X-Gm-Gg: AYBFou2iFNAJNDCTPTi47+fgQvRpAAGB2l2e+F9GjgIJeHt6mEdmbW2BvWRV7M9eJez
	FSjwjQR+BH/I+BA80oawbw4ZSEnf+0pbLKLPxu8aIQf9t/x+NehQV3FXW+m8oYSRyXkTcUT5/PO
	GqRztq4GONrkEYKRlIqEwoZqOp1wYXvbMH1hABerY8l7OAOD4THdivGD6sqiCk1I6RxtkBWDycN
	CHebYmxtZ3WjlSgnNpnGHsPrzJ9w4rsyPbkeyL4wrJfsNOU+xvMMeiPKKOZ7wbJ9ktahqtt2MdQ
	CY/A21+n13VVTN/stLrLWEnC1ZZqiuvn/YFFSbZ5mLioW44Ud+SRt/QAEXLgB0fQjLlO5Am6KC6
	H8+3uxiO+GkocWnqAuSPB2x/ec7IGLMLABepaTjxcITkStLd84bRUzKdkI7UnG1S1nQqbXMzvy8
	iL1w==
X-Received: by 2002:a17:90b:4b0e:b0:3ab:be66:ddc5 with SMTP id 98e67ed59e1d1-3b182f3642cmr7324458a91.6.1794468021437;
        Wed, 11 Nov 2026 23:20:21 -0800 (PST)
X-Received: by 2002:a17:90b:4b0e:b0:3ab:be66:ddc5 with SMTP id 98e67ed59e1d1-3b182f3642cmr7324412a91.6.1794468020967;
        Wed, 11 Nov 2026 23:20:20 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c73e27sm3149185a91.9.2026.11.11.23.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:20:20 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v4 0/3] power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
Date: Thu, 12 Nov 2026 15:20:06 +0800
Message-ID: <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
References: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af568b6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=FZ15NAR4OWdYCF8lCvYA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: XQtQPkHsoIaEH7sji1KzBk-UA7WFG2Hu
X-Proofpoint-ORIG-GUID: XQtQPkHsoIaEH7sji1KzBk-UA7WFG2Hu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfXz5vUvCmgR28v
 VydoANBUUE+NxFNer72bls4zPD1FzzcTeyBSdNKiJuR/f74pAfeH3EkNudjxd/rENayWDzWEktx
 9L6rXjYOya9YmijJ9ZPURg+jmCps6BBftkf0FRVqJCAZA6capVCDMBEczIeUZIPojzAPSCOxzN2
 tSPgYsYRftoy7nfwScE/380phGw3jUqhjqm82Orfv2DffLDXfaQVLh7UK9fNdsw33wU/xFIvLeX
 by7DxDe+YMfFQv6Yeek7wDE0KOzgfhybq1uH2mW3lKjNNic6WIoMYjtI7PJa6uxFzhaiFFrLPsp
 j08stzgBRseGUJTC9SmnCZL7smepXmuWGWRVhG7DRX9r6BPank9OwpAgTs3I5mWk1p02qT5XVks
 BcZ5VTt4jIqOQ8ns//L+0HN1VuLWKrtfw7/8Y5jH9XgYzYsU1zWnOQSM2DRZYaC24XVQuuTahzh
 5e6SfPAVIxmy87kVQIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfX9R0lPyJNNUbG
 RIlQNzzdFGXnne+bdaiMnj5imJG9RfK2FvZ3Un5ZcRWInsogH+nIUJtNu9OSv45/PD/uGpJIYhl
 ElTUzARorqJ4uh+CMZxGewTCiCdl3oI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120029

Some WCN3990-family devices use the SW_CTRL GPIO to indicate that
resources need to remain available while the application processor is
suspended.

Teach the Qualcomm WCN power-sequencing driver to use the existing
SW_CTRL GPIO as a dedicated wake IRQ when the power sequencer is marked
as a wakeup source. The PM core keeps the IRQ disabled during normal
operation and arms it for system suspend.

The series documents wakeup-source for the WCN PMU binding and enables
it for the Shikra CQM, CQS and IQS EVKs.

The series has been validated on linux-next on Shikra hardware.

Changes in v4:
- Rebase onto linux-next next-20261111.
- Revalidate the complete series against linux-next.

Changes in v3:
- Use the "dt-bindings: regulator:" prefix for the binding patch.
- Drop the RFC marker.
- Replace the "must" wording in the wake behavior description.
- Report runtime validation on qcom-next and kernel 6.18.y.

Changes in v2:
- Derive the wake IRQ from the existing SW_CTRL GPIO with gpiod_to_irq().
- Drop the separate interrupt description from the binding and DTS.
- Focus the description on the functional behavior.
- Rebase onto next-20261014.

Linghui Wu (3):
  dt-bindings: regulator: qcom,wcn3990-pmu: document wakeup-source
  power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
  arm64: dts: qcom: shikra: enable WCN SW_CTRL wakeup

 .../bindings/regulator/qcom,wcn3990-pmu.yaml  |  6 ++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi  |  1 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi  |  1 +
 drivers/power/sequencing/pwrseq-qcom-wcn.c    | 36 +++++++++++++++++++
 4 files changed, 44 insertions(+)


base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
-- 
2.43.0
