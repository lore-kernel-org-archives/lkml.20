Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842226;
	b=QtgJYL+RTpW5wAH1rRCik26csxh3n5H2RNoPNrMzA3Y3PRu+zq8lGqUaO5Vyukp2e4jO
	 x4drJ8dAVVS86SQRxd/rDGTxzdAtUtoJ1WZlXxavk1VPDpEKUAyl8zBSm18GrbqlDMJn9
	 OVc+Tyk0RmpvmFIzzuuyHh9CWmqwFykNQhn75azhjbm9YwKv2V+U0hf5+N900Po9fcZym
	 i+0yFbejK2tlDePNTnqLEEHznksBumGv20eZ+RTNs6dgpkTe4XjsI4kkdkksXQhSfgpYm
	 yuJzDuqt395Qsjg0Gmg76TwWpL3a+wQhxX+jPJBHVul/NSXj9e7grBlPNPTO+0LjtjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842226;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=HLzCj0RuJsDmSLXUShLgTXOXCsX+4EAi5ae/ZnypCZI=;
	b=Q50TEp4nBozPfc8fZbfbZgyWdOLcGOqd6oZZYxhn1SuK271dYrLgrc/83irfV29mGm/v
	 1yjZ7Ty6AuTWzP//fRTXrdj9wolbJLDggQokPW/+Uq+NbUSUahgn30tDNYH82nd8Qs4Ov
	 uk6bJCPAQs8IsneeWZcdxfFwS76WVl+HHvp15eH+nNsT5I6046cTJleJNp0u+GTRlMfRT
	 lPyz+HSg2IO1oD/7riCFTgY7/4ACBR6KAipprfLVBhc/LrwjRQYktlpEWdM9aLjBd87FV
	 kbhfYfv9iUm5Y9eh9cRc9uhm86o9QeJxEQDFC4fk3eqff1u9PYgThbMKPRTlU8UKNuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C421A606A338
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C421A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBxG041957743
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:17:03 -0800
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hya5jp0bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:17:03 -0800 (PST)
Received: from twshared26372.02.snb2.facebook.com (2620:10d:c085:208::7cb7) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 16 Nov 2026 15:17:02 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id 97C7D2F083074;
	Mon, 16 Nov 2026 07:16:49 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: <hare@kernel.org>, <hare@suse.de>, <hch@lst.de>, <kch@nvidia.com>,
        <sagi@grimberg.me>, Sreeraj S Kurup <sreekuttan2156239@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-nvme@lists.infradead.org>
In-Reply-To: <20261110081559.2730-1-sreekuttan2156239@gmail.com>
References: <20261110081559.2730-1-sreekuttan2156239@gmail.com>
Subject: Re: [PATCH v2] nvmet: synchronize DH-CHAP secret removal
Message-ID: <179484220961.249619.12113326051904353767.b4-ty@kernel.org>
Date: Mon, 16 Nov 2026 07:16:49 -0800
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
X-Proofpoint-GUID: zb0YaHTUxTu9bMQQjrC24kQVo02LzZoE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2MCBTYWx0ZWRfXzR+VGLXptxXO
 0zNBMutM4mVMX7uaKJSp2vUCQ2S1plQqmFCzs6Tgy1OjXjOpYkLlb24JeGo9zoEGaWxLP6v0Rbk
 brQark2+tGG6onNVQBOlbC8OWR5yYXHg7VbeEwNm7LDnTFejVADW6h0jrMWDLAmNmvn59SlkPnx
 ffHhxoLTqgzr6qZvrO5rjunNCtTty7ny5UglkaUGam9vYbCJa6oMONk8KAnm/5quG6lFOqPMeS1
 h4pXTghCw16hoe6rkF3l0IdLuBtCNj3BtDIM04jx7xbzEQH/1OD+uoncmjtQU22A8WzI0L6J/5C
 yRM9VMeU1Uy2Nl/+n9uZP81F4e6X9Gje9S1/P87Ny4wY5oRP9lCegr070nBL08yt4k8YN3iwuop
 W1JW5hTufymvAU0YKSUEp566bZNyno3W3gR6G2RmCV1oDYWRXudZqqp4c/1fUXskNrxa5eak/DO
 3CCoEZ7uobmSvRLPwzw==
X-Proofpoint-ORIG-GUID: zb0YaHTUxTu9bMQQjrC24kQVo02LzZoE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2MCBTYWx0ZWRfX9bYRRJRpP9yo
 sNVmdByKo/HS/GJLzc8p9DJSYmZZKjoW06I1Qezg/epTVFHaFEJYQcqAL2IOB+PckDio6tpPFva
 BGJvpJYvNWN8u9bqoBYS5NX/LVOt6BU=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6afb1e6f cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=GbPsI2Ihf5RTnMjR_gZv:22
 a=VwQbUJbxAAAA:8 a=ErKaWFu-b7fWwdv8pp0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01

On Tue, 10 Nov 2026 08:15:59 +0000, Sreeraj S Kurup wrote:
> The empty-secret path in nvmet_auth_set_key() modifies and frees
> host authentication secrets without holding nvmet_config_sem.
> 
> nvmet_setup_auth() accesses these fields under the read lock,
> allowing concurrent secret removal to cause a use-after-free.
> 
> Acquire nvmet_config_sem for writing while clearing the secrets
> to synchronize with authentication setup.
> 
> [...]

Thanks, applied to nvme-7.4.

[1/1] nvmet: synchronize DH-CHAP secret removal
      commit: 706076f51eb78ebb4cc7fb06751bf09042fb515c
--
Keith Busch <kbusch@kernel.org>

