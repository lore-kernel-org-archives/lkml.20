Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846096;
	b=4VuAoKjhPiL/gV5qI8MpqS8+JwDrIk6wBvsEmRCjtI6T24nLBGN2O5un4HTlSz/XSUZx
	 m27gvAzbvhnLsIW39fSpn1GUnuSOHmOPOYEqtoAISK/pMdb6nGdjCsSiFuOvG8zuo7iCi
	 74ybI89rqRPRoNwcivLSMkLWAfRYAUKPPYWCXW/DIXOGjThglsCW4din6+tZPgLKexnpm
	 fAMjLh7vGngZ39myKgmxiANyycU8zTOjmio1/eTERJ6BVIlSOQM4iDLqq6myj8o4NCUCA
	 2pyDf/q1Ix/4MPNnhYO5rse1aXiSdMpWDG5OjLWkxmClaFbEPKjVVQIGKsTyq8+rGzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846096;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=nvFyqL3Y0/F0u1N6y6kg8ykuU4M2/XUEp7+RfXlmBzs=;
	b=Pm2cQA2F1KbGr4kYbzoNAdI7as8eJgovjemhe+7iv8loN3ogPeOxfR+RIkRTw49aYdbe
	 3Tvdz+KuOrgOKFJYmFb2Os30abBUPloz8+CZRHMiIXhzN69xBW9Y1mu9DhFzn/M7BmksF
	 SbN5pP1N4U7+5CQ/JKwJ67OXA8y2K2DeXMancUABOi/RxTqG0aNmRVateDyi/fyFefScz
	 w04kVfcLsMIQGGY9REagCCJ/XiWLPT0OvDFzn4r3kr+esSBS75AM2ksbl2dLs+ea18TOR
	 3H5YcX/XHIfcpKaFbVH0VUOaGOdivomrTeLoAgeAgHF2BxdSjzttGLXD/HD62jeumNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3731606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3731606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528009.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIfAv2660633
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:21:35 -0800
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hya99p6gj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:21:35 -0800 (PST)
Received: from twshared77744.15.frc2.facebook.com (2620:10d:c085:108::150d) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 16 Nov 2026 16:21:21 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id A7B112F08A7BA;
	Mon, 16 Nov 2026 08:18:29 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: <axboe@kernel.dk>, <hch@lst.de>, <sagi@grimberg.me>,
        <linux-nvme@lists.infradead.org>, <shao.mingyin@zte.com.cn>
CC: <justin.tee@broadcom.com>, <nareshgottumukkala83@gmail.com>,
        <paul.ely@broadcom.com>, <kch@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
In-Reply-To: <20261114020245882Mvd6t10TkCZuRWpYFR3m5@zte.com.cn>
References: <20261114020245882Mvd6t10TkCZuRWpYFR3m5@zte.com.cn>
Subject: Re: [PATCH v2 0/6] nvme: fix transport request and queue error
 handling
Message-ID: <179484590968.648177.5424785032446332753.b4-ty@kernel.org>
Date: Mon, 16 Nov 2026 08:18:29 -0800
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX/1ZJp2zeeYv9
 tw9ofh48RkPaD7b8GWz7dlulFcvqMNHPyTE4G4iBA+Fnzc03REXp4CaEhHG8xopTA+dHZt8Pj7a
 gdDc4FXQWk3t+AZKfmp+abs0T5uyCNE=
X-Proofpoint-ORIG-GUID: S6Rev8UqnXxm-pi73EcX5_xX31eD6cUC
X-Authority-Analysis: v=2.4 cv=ZuN4uN7G c=1 sm=1 tr=0 ts=6afb2d8f cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=U_y8lYiYyhHBU5rMqhb2:22
 a=1RTuLK3dAAAA:8 a=VwQbUJbxAAAA:8 a=0v5wFFy9qJCc6wKa7McA:9 a=QEXdDO2ut3YA:10
 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-GUID: S6Rev8UqnXxm-pi73EcX5_xX31eD6cUC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXx4z1RUJVHsjO
 Ypr7h52w5lNGo7XqxLiVFdrBOoENet8mdEhSz5/9Ez7zBj5sNmPlfeEm0xDWb5Y9kgVd/EHwb+F
 0GwocFjf2ymTHMzTJetMRdFd1R/ZF7sv8BdVxLEYyYTTnc9MqpI7OTC3JgddqOZylUBx001nqaL
 IaoiUSsRzz/bUtPMbf2Y2WA8q6+HIqwv2LuGhnpKvp5CUrHnJM2xcvTuZwdwZ0f72vVulAiLqSe
 aXzDhejMD29blcN7AozINz/3xvlpGWf/711qUA69C3wmQKTxr7nu5mq7boqMwjfPLiaqRX6FLcL
 /2vySanL2Z10WVysK+/xDRHgYnhYiNdK9X/6qvxCxMXJSBq5ZSXxD72SbQfgVryUnnwI7YJB7Hi
 9yMZHuWzHHs0ik5s9DcKPhxqOjGuvIlVssiUVzIG0pQU69OijfA84OdZvRzUFmu2VbvOoTAzUhr
 NKwdfTEoGbHCjxIJOyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01

On Sat, 14 Nov 2026 02:02:45 +0800 (CST), shao.mingyin@zte.com.cn wrote:
> The six patches fix independent error paths in the NVMe transports.
> 
> Patch 1 releases the target request in nvme-loop when SG setup fails.
> nvmet_req_init() has already taken the queue, namespace and reservation
> references, and blk-mq retries the same request, so each failure leaked a
> set of references.
> 
> [...]

Thanks, applied to nvme-7.4.

[1/6] nvme-loop: release the target request when SG setup fails
      commit: f2937481c28033e10e8a29b8742a767e73c696df
[2/6] nvmet-tcp: only wait for in-capsule data for inline SGLs
      commit: 9dac3b1aa2a99e126a5504b7f5bc781c8b2771e0
[3/6] nvme-tcp: require the R2T offset to match the data sent
      commit: 347d50d92e25d4b9c50c5f5c1d8b727b9c88d12c
[4/6] nvmet-fcloop: free the LS request when delivery fails
      commit: 8c1f99419b6cc51892e259497c8e10a5d079621a
[5/6] nvmet-fc: reject duplicate queue IDs on Create Connection
      commit: 153eac284ebf68be74993643e9b2fe2f9b2b1d88
[6/6] nvmet: roll back queue bindings on connection failure
      commit: 3f82752e089283eb8204b9d2ebd8246077031173
--
Keith Busch <kbusch@kernel.org>

