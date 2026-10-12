Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F272255F52
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791779761; cv=none; b=Nob/OjK/fEs5ZQ3TYBvq/93TPXv2FaQQzJRPEUTHeAewG9DxX6U+KD9AWmdx3rU00l7ozb9fd4eBNwePNgc4KPMXc1reKbyKyBnv9qpCnw+AnTkwbUPbq3OoFqAc5K2Q+G9UYG2UxkRTEst6XjnENMhKGV7vbNGonZE0P827KfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791779761; c=relaxed/simple;
	bh=rbYdn9GSSo7LCLaVhy9r6E/05l3J2/bCyjtdv9JRI7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I7hHcCCaVfg/0UC/J4bs3QnKSZJrTGwPqPvG8PMy3Hk2tsX6tl/ga171HcSKyLk2OwzHOEloW9nixD+JolpBCvh5mO1/vKEEccikl/gXuksA2ZZCmClc8lLRVt5FyNVRXhmeysk+DEOu/fK/iRuGUiI8ad/dmTTSQFCaAWpPUW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=i6JYfh92; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="i6JYfh92"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C2EcCh2912982;
	Mon, 12 Oct 2026 04:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9eYTkG
	l5oo0Kdw3qwx5Z794rZLTMiDY6xjAz4qWiuoM=; b=i6JYfh92WQMOwy73PsLb2/
	DuLBqQuGmFqpWq3vFBLMBp/Zs5y4SXiz6GL/N3xZ97WhUuXbJ3hiMX5DwU66UNxU
	CHrRu46q8ZGC30Bd/9Slbpjq1NRfCg9p3YdOue8GSLukkrqpgM/39Eus8NxSei/P
	R3rVVuGF0nSIl6bhNvzvrYYgVsCj3cAoS0d01gX81+yGSJmMXPv9QQu6sNat7FpZ
	ptboZUO1rn6Xa/DLcTNC6VAtqmSGhWsc3q1goKwZ7NupVVr6wDFTGQFN/tNEgF+s
	6vz3B2E/QDc58BBs5sbikQCAyDec0NZxLAIMgfSGrdGwqDFKBxVWbACpNAMg5yTg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7dwhpvq4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 04:35:35 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69C24o3K563434;
	Mon, 12 Oct 2026 04:35:35 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4h802vkthv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 04:35:34 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69C4ZYIL33620638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Oct 2026 04:35:34 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E072858156;
	Mon, 12 Oct 2026 04:35:33 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C6F6758155;
	Mon, 12 Oct 2026 04:35:29 +0000 (GMT)
Received: from [9.61.185.118] (unknown [9.61.185.118])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Oct 2026 04:35:29 +0000 (GMT)
Message-ID: <840fbc39-dbab-45c3-9743-8f21a8259c29@linux.ibm.com>
Date: Mon, 12 Oct 2026 10:05:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] nvme-multipath: add fail_on_ctrl_loss sysfs
 attribute
To: Krishna Iyer <kiyer@crusoe.ai>, kbusch@kernel.org, axboe@kernel.dk,
        hch@lst.de, sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, hare@suse.de,
        saravanand@crusoe.ai, sjpark@crusoe.ai
References: <20261008141407.22992-1-kiyer@crusoe.ai>
 <20261008141407.22992-3-kiyer@crusoe.ai>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20261008141407.22992-3-kiyer@crusoe.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAxNiBTYWx0ZWRfXzJvBb0I+2nqg
 ar29cHj4bK3YITyLWcDS0MfhXT9gnfUMcXZT6gEHRHUIMNkXmy8KL9QUmR5K/uAo5qesuiCuerF
 WnaJgdGB1am1kaPjpSygnNuMf7n54e+Wh5AKRVDPrJqtJY3OKEKiOj0kv0pqNn0TBwW3hNApGUz
 61cLPkKaf5RhtzZwKgDzhjVcpiep+EDvZN2Hbzm6ISplDCEf/1ArXVKryTwSEJE1ujZMNcHg1Wh
 OWYj0n3gLPit4htMfTlMRJ708ZLZCDTL8J8W6LF3SEJZQd7ctfRPBeNTDopVg8BLtTX1+8Wqt+6
 Z60H2FHGvhf5EevChhmQnp+YZx7+3nvKvT5eWGfQ7ZBChRZ/HjPAZ3gk5qDGU6ePe2NkfTvj40P
 4ewxKRb4YcFrLMjTHFEOBJBWZOxBxYjP6PhVMbzWfwi9v7tf24mgEPG36ycGISauLn9ZGqI/IXI
 VnDL4/PBHN+V5mMZO/g==
X-Proofpoint-GUID: -biNSCGHsiHKTpV0i3But0QLYWUXFc1r
X-Proofpoint-ORIG-GUID: -biNSCGHsiHKTpV0i3But0QLYWUXFc1r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAxNiBTYWx0ZWRfX0LVwG8BhXBlQ
 VQEx5KN+HuGt7A7f0VuGv28Gf0zSZdnv01okgmPNwveTVgOXHbuFicD6z4x0RmtdRFU+B6/M/Md
 RphgcX8Nim3IYg5lKke+GI2fOVYTa1Q=
X-Authority-Analysis: v=2.4 cv=btHZl0ai c=1 sm=1 tr=0 ts=6acc6397 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=FMbtR3q6Wjg1j8aBuHgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120016

On 10/8/26 7:44 PM, Krishna Iyer wrote:
> When no usable path exists, I/O on a multipath namespace is queued
> until a path returns. With ctrl_loss_tmo=-1 that can be forever:
> during a long fabric outage any process waiting on the I/O is stuck in
> D state. We hit this on virtualization hosts, where a SIGKILLed VM
> process cannot exit while draining I/O to an unreachable NVMe/TCP
> target.
> 
> Nothing can fail this I/O without tearing something down: controller
> deletion takes every namespace on the controller with it.
> 
> Add a fail_on_ctrl_loss attribute on the ns-head disk: a persistent
> per-namespace policy to fail parked and newly arriving I/O instead of
> queueing it when no usable path exists. It is the namespace-scoped
> counterpart to the controller-scoped fast_io_fail_tmo: the trigger is
> an event userspace observes (a consumer known to be gone, for us a
> SIGKILLed VM the host must reap), not a duration picked up front, and
> sibling namespaces behind the same controllers keep queueing and ride
> out the outage.
> 
> A CONNECTING controller stops counting as an available path, and with
> no controllers left the policy overrides the delayed_removal_secs
> queue-if-no-path window; the two are opposites, so fail_on_ctrl_loss
> takes precedence when both are set. ANA change and controller resetting
> still queue, since both are transient. Controller state is untouched and
> reconnects continue. Like dm-multipath, the policy is transport
> agnostic.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Krishna Iyer<kiyer@crusoe.ai>

Looks good to me:

Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
