Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDA6552930
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879390; cv=none; b=eb0wsjeUEjPzig3xPPZ0iFer80NhBMjuSEuBcm+Rc8eKuSEU29dTaOeVGbGGYwuf1euNeyBQJpaHxQUEcI71HIowbs+FoYSbS85x2cbFQGQ30XevPUEtSUDdKY1hILnuUmfWh4sV0lI5lSFrb6pWEroEDJk8IwED1cris9NWY+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879390; c=relaxed/simple;
	bh=yqH5y7Vc7hLa+bWj6rLfrNwqiigy+JhhlRiK4bZpdaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gNIk6BvAOQScLRjjbUszj/Md4ZAR//2WV7oLBGlNbp8FRKl2RVn/IAoxTfc65gLVnrg8Kj4VQaVxM6hnr1qnFIvLVIHDj4CgSAjCzgWSrAVc0g88DW+Iv82m0Z3GpgVCNDcEYsCoYZxyGxT9YiM3AID71SyOqNLB2a1ClIaQFss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FezWc5Yk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MC/EN0eU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FezWc5Yk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MC/EN0eU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EjBjV3835560
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 14:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yqH5y7Vc7hL
	a+bWj6rLfrNwqiigy+JhhlRiK4bZpdaM=; b=FezWc5Ykvar7+O1Qhm+951qyPWV
	92IWKoINDKODMZwmUE/niUo3UiNWyN6c4W7gLOSj04c9SHwNV7PKYJv7klUltPbe
	ZtLknwpzvdM9KW29dShDyA0iaMrSvxKRT+viluOiGR6w8WZ/EDt6Rmn2GCk4vAY0
	RWShQpCAvOuXDcZVrD6sGHlNwdwnWECdmqCwoBR4BfoRPoebQCS+R9DIvItREdwA
	Sc7FgKclWrTs0cYxs657ViE3dNZ84jl9RwN0DEihz1ptALx/5LkY1XeFdD6aLra9
	r86foZT5WNizKCsHzSv3UOkOBPZORZ4Y5Clc2IRvX6dZ6Evm99p9BQ7bjMA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjfp49c0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:56:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so5845795a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879371; x=1789484171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqH5y7Vc7hLa+bWj6rLfrNwqiigy+JhhlRiK4bZpdaM=;
        b=MC/EN0eUv4UFUj2u5pdV5OYA+WohfEgPGcBAtFMA6nlMnXaqklIb28OeDd9jwbFDwi
         0DOY3cHRfFLDCUco0F91EwdscuDQUzYvhC45+E4B0M0nlSLhoYiZZzQrcDPtaWV4bsjY
         bXnedgFV749bM7NlkFaONmfz0Ir9V3L6IAvxHeg44VB1WFIL1AdmMalVduYs1ZmZGDJL
         2gtSGL+xuY1WxE/DkyKov7nXtqXHU2ywUxAN3M8/Z0JYP3wyMX8V04sJwSowa16Znvox
         I9ISj8ugUiwk74Xp9Bea1ADvbqTo2Tgj6Ezcw7IYOla1VLqavhlZkGpLMYBILcI48iIw
         Rptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879371; x=1789484171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqH5y7Vc7hLa+bWj6rLfrNwqiigy+JhhlRiK4bZpdaM=;
        b=BggS4X3nExMAQ9YLiE4wrqLVPArCJXG+QjBguJNYqXpM4G1YhYQIVjIlDiz3Ei2ZB4
         5sp/7kjRJrtoQR/Ctoq9J8mv0pm+i0432LcVvlJNJeSdnZuBA/mnvz7LRD6y5+gaZz2u
         56kK51JksksBcChIcw4YkJcuId06N3hudMnn2f593YBSYp1x4An8N78cciJTePGgFa1a
         ppMDwoDL3/S2+XfVEfN5m6MyFOgWy02jx3OF4Y+4Rbgn/YejxTvU+hQqTOmY6lpy9UOY
         nYJjjSaVD3yDfp7Qck3WIDdZ9FwTKRCfCsWSGG1DcudDJ4yG3VEBT7ZcFB5aEIrvHbwh
         mKMw==
X-Forwarded-Encrypted: i=1; AKwUvBwAjm8Bnfq3oR5twCS6+PMsR/ZiHhHFeawEEiercrMbvK4RsrAcYOJPbSgWkctTM3zJhQAMtlsD0PYrI+U=@vger.kernel.org
X-Gm-Message-State: AFuF++l/8Y65NgxqnTPusAhnWaJX1cRMq6eDjl8uXJdLjCHe9ZfDRwUs
	VSXxdcuqcHb1hxXfn4ErbPCgeZ1KKWqf5+AVuimwL5/qFZFwqa6FXtCAyfd6zp94yztQmAowebR
	KO55qkhGOlBbHdfqKwQj8D4PStEZvSqX6N8BWxN0tAOQx6+njiiU4WJjMU4Qm8lJNRDuAvjux/D
	M=
X-Gm-Gg: AYBFou0NlNOPAsX8AwIrPGzPG4v9IxQgR17R2GwvzFHKpjHUM+gSdOgINzFLySgi7tu
	D/XO+dakK8r3U8xv0hx63C5joW9Pb9zg612GlTuVaSnuDcId3nMP8yPfLU9m1PVSFPesgRNcOjH
	WUMN9Wm4dS2NP3vAmyuzwRg1ojfxc8eFnTt5LYdKzQKWpj+7sL4YLfXr5lCESxnQMpRDBH4Ng0m
	oKhRdb3VgJhvLT6Wc5jPCKwU1e1Y4KRECbJJE4QrMQrnWU1b1ZCkdZWvAOrD4yFrmZ1u112zkDZ
	sIx6KewjGmvGxu9aRGAPHs6ldldDfbRerdygR5kH2K6Fh7fyQoPv7/Gb0b750o0gjHCw8KDtpCp
	zIY+9J4AWexm40OGDaAsLKfRzw5rCKcuaSKV1ZtCe1fm1JYVl7b9ZjJctsxLzR6iJR8zL27BNsU
	7+IvTzP2vrNUa2EOdGqe6sJA==
X-Received: by 2002:a17:90a:d003:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39b26273a40mr45822437a91.21.1788879371160;
        Tue, 08 Sep 2026 07:56:11 -0700 (PDT)
X-Received: by 2002:a17:90a:d003:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39b26273a40mr45822380a91.21.1788879370578;
        Tue, 08 Sep 2026 07:56:10 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm48697022c88.2.2026.09.08.07.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:56:10 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: andersson@kernel.org
Cc: pankaj.patil@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        sivansh.gupta@oss.qualcomm.com
Subject: Re: [PATCH] clk: qcom: Fix CLK_GLYMUR_GPUCC default
Date: Tue,  8 Sep 2026 20:26:05 +0530
Message-ID: <20260908145605.1134841-1-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5778ae29-9c86-418e-85f4-1bf48d674a31@oss.qualcomm.com>
References: <5778ae29-9c86-418e-85f4-1bf48d674a31@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Qu9uG1yd c=1 sm=1 tr=0 ts=6aa02211 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=WzJbLqzC-FkCw_Mzoz8A:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 4TQOJnTnCYq-AzC43GlnMRuyaXFO6mmQ
X-Proofpoint-GUID: 4TQOJnTnCYq-AzC43GlnMRuyaXFO6mmQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MCBTYWx0ZWRfX/mnoAGL5mtYN
 nT/LEMD8n1Z/EYxGLtABxjZr0kYnvJboq/b8YIDL2F6DAbXikqiAmKe1uA4PL+A68n52aZS9Rml
 Pr+CKNiH6PFuesZ2CogX8Wy8vXtXjq+10mFQeoxYODai7zI+SG0NomY5IMOoklQBFCDIQt3a3Th
 H/Zzx/NXHrx0VN25X+ZDif76jM79SKR8h9/NDyq65MUL19wrUFSqzHAMOm+043ZQcNso5yGMiMG
 CKo3+yaJl2nYDwjauWW+HJ82GFg6UMBTAOzAW0ZUqq/Jq+Kky8+YwLrcUFHNAXUqP1LZXsjxy9/
 ZpboUhtP4vUNUQkM2y4d0tvNcoOq/klv3RyNsuUy4k8Na2FWrQfi6OU8qjs3f/pXyq7yZAC+EoZ
 G+uIrxYfVG/ssLC7mJ6MLSiLx9SSGhdyjHUcrN1+s0wKo+3x5Y/kw0hNevM51q4+o4F1XU9Byi9
 DL59zZkQNZvzAf9CO4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MCBTYWx0ZWRfX+DOF5+J3GXK3
 FsOinSbID5boFWgLUGxcQQxBLW+YbYXIwB8VColSKTkFBGg0So0Kym66OwJjyaYkj7jGu/465Tj
 iYMctgKV/e0grVsYIR6+03P98nAvGNY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080160

Hey, this patch has not received an ack, please let me know if
anything is needed from my side.
