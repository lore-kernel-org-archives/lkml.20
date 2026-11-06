Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988963;
	b=pun7sig64HPTwZeDIai/9ggTalNMpVprrBQwmXhsI5XNiM/gA8qOnsQOtY47esmOEpB7
	 L2koRskNVzPiSP2kk8PySV4Bhapn8p6IkzueW4Ghz+muaMx0leniqSKNrqSsYIRjNeWNg
	 BKI+RHUZePJdMu35+iB+CYHglcuMJn3YLVZtZOMZnF9Cf9vI469osJnEe9DPUh9OoJHrs
	 SHXze+le+nCLrbeOpLfsMzEdG4FMUM/b1qiisv4ysHxjPv0AuiNISpyZAQd1PtZbutUm+
	 ptYWOpxqX+DyI5sdkKrT5Viv36Q7Pt7wV5HuShDG+Z5+65SyWIr5PiwhPNE8BrLxDBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988963;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=iqr0gA3k4fBcp88VJvhjHLGHZBvjD2Ba/yhfLHVe4y8=;
	b=Xael81/cDEvzt6VkRBKRoKi6+zscWsnAcLptSOvdWQJ93YxbuLV1V0j37hPyR0KnpOaC
	 EXiphT+wmU5LHXf95qiEy9lv9Ev22OrmtXt3L8yQVffm5p4A8NZ+69hUwesmcWg+hmuhz
	 jpj4jZ5HIM+Ciab9e1q5DV/ifuAn34jO+AuIfDhiGjQUX/6LjMfu7ecAlQA+55uPeX+j1
	 fIwJ8p8PSWph3IYZGvVodFoDIedsaoNbONo2hF5QiKo1LrUul1yHzbNW4u2o0K0j4sIFp
	 WVIwOwaV5ibNOuOnBxTrdadayHIRlXk3WqdgRIv9JmiHCY67ONrY6IOfT+EiLN4t92w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D133606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D133606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Hs0R83550305
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 10:16:02 -0800
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hs3r1631h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:16:02 -0800 (PST)
Received: from twshared98006.17.frc2.facebook.com (2620:10d:c0a8:1b::30) by
 mail.thefacebook.com (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 6 Nov 2026 18:16:00 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id 6925C2E8E27CF;
	Fri,  6 Nov 2026 10:15:49 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Sagi
 Grimberg <sagi@grimberg.me>, Yuho Choi <oss.patchbox@gmail.com>
CC: <linux-nvme@lists.infradead.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20261022045828.1392332-2-oss.patchbox@gmail.com>
References: <20261022045828.1392332-2-oss.patchbox@gmail.com>
Subject: Re: [PATCH v1] nvme-pci: shut down the controller if disabling the
 HMB fails on suspend
Message-ID: <179398894941.310047.16175275917546934864.b4-ty@kernel.org>
Date: Fri, 6 Nov 2026 10:15:49 -0800
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
X-Mailer: b4 0.13.0
X-FB-Internal: Safe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MiBTYWx0ZWRfX4f6rYC4rCwVh
 j3rjZB6VlxXf0dfh8Uti8087ayy/EXNca/uElt/zyg+hld6pEssTEsnHAK2crkvaH/djmw0Xnc5
 ImazH3U3YPZi5rX/iCjsYb7oc7I41K4=
X-Proofpoint-GUID: q0DRvsGSpTzmINg83lVbKo5eYh3keBSk
X-Proofpoint-ORIG-GUID: q0DRvsGSpTzmINg83lVbKo5eYh3keBSk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MiBTYWx0ZWRfXzrFzljmNyeKr
 imrFEewExT5z60hZOBuMvYnbPHaQNgAkd04XZc4RLDp4J3T0JZh2wnvUqCNpFvu64D963jHdTot
 9ktEiztufxtd6o5rds3UNLcMRVdjLvx0gUVDJvlqF7U+iQhA7tyk8Q9GxF9y9YYpCQf823fZ12j
 GXXshk0vg4jdjd43pJZWDvoKfPNDy7SJHylUgP6iUdMcA1HesGKk/vjQHmBggay6Ke8xgZdb602
 Oe512DA0Jgb7ME7+6dev41gSLok+O9tGGf6NHLQavHDxvWPN2CMMNh2fH3rWzARE8ySoEA+Qv0X
 dVh002jAQ76agYXfsLUiDsTFMjXHJMa2kAdcbbBsqittBCERMn94ezpYKWjLnMnpSlJh2kVny6i
 vYRthMfy5SjWv3ITeLdmWZbmcx9HAL/saXsduIF9y677feH79TbT9EiqL94dHdlkgtKxGt9GIGu
 ebzW3xTlniGAPEakgBA==
X-Authority-Analysis: v=2.4 cv=FOqOVOos c=1 sm=1 tr=0 ts=6aee1962 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=crHB47gyY4rKiduisYu9:22
 a=VwQbUJbxAAAA:8 a=tS8-BpN5wWsUIuTujoIA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01

On Thu, 22 Oct 2026 00:58:18 -0400, Yuho Choi wrote:
> nvme_suspend() disables the host memory buffer before it moves the
> controller to a non-operational power state, as host memory access may
> not work in a system suspend state. It only treats a negative return
> from nvme_set_host_mem() as a failure, though. If the controller fails
> the Set Features command with an NVMe status, the HMB stays enabled and
> the controller is suspended with it in use.
> 
> [...]

Thanks, applied to nvme-7.4.

[1/1] nvme-pci: shut down the controller if disabling the HMB fails on suspend
      commit: 82dd68297483afdc3be48e9d77f2dc4adb7a6941
--
Keith Busch <kbusch@kernel.org>

