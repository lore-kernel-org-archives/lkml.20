Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354680;
	b=rjxNpcT+Uo8rM0dMYdybfH//c/vzEa+U5m/DV+gWb8QbQ7TVu55pi//WhpGjtwR3CSXQ
	 vY/27LFYqUbEH4mg8cdgBKYVrg5UuXNFXTIWUt+AzFlDl02Vhr1Q6yKKZc9qKdVeiU/u+
	 ooSriex+1qyO7VHLbppqIOLSkzBKarpstG+hCJ6CslQ6LGYujEnJh33SRe/mAdF0X2PZt
	 xCIsk2ow9Xg6xxUysxYs5oog30IdM54qaP64IPNe8EK7T+t+yiugWcBV0QaasZT8vHl+N
	 cBLX0d5sOoCOyH8E7d/Qu3xDJ6C8Jnun9Ra2r5dCjGtRLVQdy2IX6Zf5JuRxmj0MZDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lWAxP1LyqQJmu3BW9GWxkfm+Y7zBUBY3W5GM09iWJNU=;
	b=AmdOYEdPH4m3oVTctqEAwAnrQT8Ug545JxmGZRioDyRqmwHbnInhVoBcmt3jNgqBacId
	 RjIEfxt7mwLOIjAZdygmivt3RIf2W4Ef+b3N/PLAxX6+9tdsf7P8Dg9SiC6NtDbjd+c9l
	 hft/luiNM4bR6SboOHzuzoNaOYn6LA+k1WfMqfz9KwmJBUkhdIuDMkuLeKIDIRXNIIXbv
	 A3txl+Io0SZRImIUnoNXiZMUrTrd8Hd/kILYWzVVycePkY+Pn7AxRiQAeJRk5ySUPiBRV
	 +TrfqdMSWm5VVaZqqq1fUa50voRICD+DR+FommpgXA37VdMl2KKoaxAvRQAK+1aDe8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pis+wDaD;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5B9606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA5B9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pis+wDaD
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8EgtL2376915;
	Fri, 30 Oct 2026 10:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lWAxP1
	LyqQJmu3BW9GWxkfm+Y7zBUBY3W5GM09iWJNU=; b=pis+wDaD02xdYImQGKBjTm
	2FHbwCjwIBiiEsmhlgn6z4U4ftjVUwwnAFWY/LQTOPQQO+iIWFLbdE21VR2T5VOn
	tIijAiTT6ckXSTJh7W4PYJaY5l2WtTuK/pFBrRSRQ5GKZPwGMuN7sLTxF+nNTQmy
	SlwNw5jx0XLN+F5+PVR/vzQBrOr74VHNDf/hfb4B0lToHFJvz3F02OhxKLEyNLn7
	JZLquZ0UXZtBFVlIGofKfZOXxxRNkGcAIimGeVbMkDZCMwOyLw5ZaVJZr0uYlRZM
	UCAeUQeCb9CmKxxj8vdM6I76EHYAGthuwjKTsELCuHB4cnn8gTeCB0JvwFGtnAIA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hmeay253d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 10:04:18 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8Z6ch263597;
	Fri, 30 Oct 2026 10:04:17 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hk55pjwfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 10:04:17 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69UA4HFh61931890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Oct 2026 10:04:17 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40A8558060;
	Fri, 30 Oct 2026 10:04:17 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 919E85805E;
	Fri, 30 Oct 2026 10:04:13 +0000 (GMT)
Received: from [9.61.35.48] (unknown [9.61.35.48])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 30 Oct 2026 10:04:13 +0000 (GMT)
Message-ID: <1408da28-a55e-448b-b493-d60fd5d20524@linux.ibm.com>
Date: Fri, 30 Oct 2026 15:34:12 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme-rdma: fix NULL queue->ctrl dereference on reconnect
To: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>,
        linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
        sgogte@purestorage.com, hare@kernel.org, wagi@kernel.org,
        linux-kernel@vger.kernel.org, Guixin Liu <kanie@linux.alibaba.com>
References: <20261029060521.1690223-1-christian.aurichzm@gmail.com>
 <20261029141843.2066616-1-christian.aurichzm@gmail.com>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20261029141843.2066616-1-christian.aurichzm@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: o1NqIKR21frSySSac3wrTwGDn3yLXNqr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX3uf2T5OvjaE1
 S66QT6++PLd6MWSJEteO+6letgWGnUWmpZLKKeBz0oA963ySgiQHIBX2I3F6gieK6K3Nf0+g+qe
 GMN/AKUD7ksVlSn4mqXJYp8XfX0VSrTC2HHQKuH81QzA7Ai7JfdhoIDgsHWVGZ4BZKOr9Kt0ZVw
 UcHcsp5gCAuSpk59BM9EUz4ijrTqlfoWpEQqkYlc1ewbbojNPRu8D5zqKz37nOwKhbf47eMCnep
 PcMNu637a6f9DKIfHKvkAaSfArDBFL5ekfKbBRxV18t332Y6GoqsIGyZFtHIngQL5JFis0GgH7k
 pqewyFeaZpVQO7hZ8Wy94nCgJakvLDWIbI8xifoiBqEQGQASILEUCPf13Vny03WLTLpOzB2dfT0
 7c52Pap2OEFxcLQyCPO9Yl/LcpZitwdJzo6RVEUIP+vxlsiBx5LMVL9z60JiJvAYi5vxK4EE7tq
 dcc55Evb8uJG2/b2c+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXwHc0vqa4GuUB
 +BngihuN7aNy49ZOxHbwwS0MpmUFspLviujrdtr+Ny0vi2gG0cUKGatg92p+ghx4E3mhQmorhSU
 xQWCyoPmI7/w5vPV/636sdXIJUgOzPQ=
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ae46ba3 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=_oZkWWPpCZdd6U5KUbcA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ULYizYjFtnEbYPrwJ48UVEuJDYX1tUUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300038

On 10/29/26 7:48 PM, Christian Aurich Zanettini Martins wrote:
> On Thu, Oct 29, 2026 at 03:05:21AM -0300, Christian Aurich Zanettini Martins wrote:
>>   static void nvme_rdma_free_ctrl(struct nvme_ctrl *nctrl)
>>   {
>>   	struct nvme_rdma_ctrl *ctrl = to_rdma_ctrl(nctrl);
>> +	int i, nr_queues = NVME_RDMA_OPT_NR_QUEUES(nctrl->opts);
> 
> Please drop this one, I'll send a v2. Thanks for the reviews, Nilay
> and Christoph.
> 
> When creating the controller fails, nvmf_create_ctrl() frees opts right
> after nvme_put_ctrl(), but that put is not always the last one. With
> CONFIG_DEBUG_KOBJECT_RELEASE, KASAN reports a use-after-free here on
> every failed connect.
> 
> v2 only moves queue->ctrl and leaves queue_lock where it is.

Ah, so in v2, we would only move the initialization of queue->ctrl while
leaving queue->queue_lock unchanged. This avoids tying the lifetime of
queue->queue_lock to the rdma controller and looks correct.

However, I think a similar issue could arise in the NVMe/TCP implementation
due to the recent changes in commit 2eeeaa9c1ff0 ("nvme-tcp: Validate the
queue state under the queue lock in the address attribute"). We should
probably address those changes as well.

Unlike NVMe/RDMA, NVMe/TCP needs to tie the lifetime of queue->queue_lock
to that of the tcp controller. Therefore, we may need to introduce a separate
ctrl->allocated_queue_count, initialized with the number of queues allocated
at connect time. We could then use ctrl->allocated_queue_count in
nvme_tcp_free_ctrl() to destroy the controller-owned queue objects, rather
than accessing nctrl->opts to determine nr_queues.

Thanks,
--Nilay
