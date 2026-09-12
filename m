Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97513478E27
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 11:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789213203; cv=none; b=FHRiegbM4UiYYIiLLo9Srj6kRhBJa3AS+LEU1Q7/+XpFUI/yYjqn7WmIaNGJCnuiW+54Phlopr0z6AgerTWDP79jgA95NDZWrWvQKUGWJxzo/Os8ckUDBC4VVYZjx99/GIeAHPCD1Vw4XbFVXnTSx+21YvX3YWktp8LUGEybICE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789213203; c=relaxed/simple;
	bh=XMiPRdlCChX1RimzF0lUB57HNu2g5ExHvMX+wMOdEu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSt1MdIemXqQSV8p5fdDOj65QWDPgvGqy7+VqXOByyWLk4qX35u2tujqcugHVd8mScl9Vll594XMwqGoo9wGlkVlKfnejulchmClnJcWdPJn2JQicHP3+Jj5LuXOJkj5VJW6SP/x2HfUFhrtL2w7//mb0tGhaqRwfafQHNuZnCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=X/dYzMur; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="X/dYzMur"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C8Wd6O3091357;
	Sat, 12 Sep 2026 11:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=WK00rz
	48d/vqN1Hgx5krPBnwACCZUEoZi0jw8+KGMKE=; b=X/dYzMurc1i5i9UQKQpCvd
	YTkhxemy05QArXAyb91RXXQH8Q03amIisvdyaS5kcgVIvsRYAzWdDe6fII3DDLMt
	YB8cIKtH0SAWFnSMIzmGKYW/nrxhLmEFHvnaIvMXGJ6QA7MCXhOAOJkaJ5evLRFb
	zpl6KOexmRe1EOrjgf70oYTUSkIqaItAr23pZDqtG6Qbx/395o+2YPgwsMTy6s+o
	4izYBmaOFdK8FQxTM8ZNgA9lDgELtRpzaeAJJoYygiKCaZ3UEDLUil33Uchp8N6h
	WGnN+MMWY12WRwJKnY54bV/pxmhTutDxeX1e2oH71mvom3Be8FpCjpmIDoLw16ag
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmw5dhan7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 12 Sep 2026 11:39:33 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBbDfv3260368;
	Sat, 12 Sep 2026 11:39:33 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gn3w2gax1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 12 Sep 2026 11:39:33 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68CBdWvC22741588
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Sep 2026 11:39:32 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93C9F58043;
	Sat, 12 Sep 2026 11:39:32 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3952458055;
	Sat, 12 Sep 2026 11:39:29 +0000 (GMT)
Received: from [9.61.162.129] (unknown [9.61.162.129])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 12 Sep 2026 11:39:28 +0000 (GMT)
Message-ID: <1c62cb9b-8c8a-4272-8366-4c10e85ea01d@linux.ibm.com>
Date: Sat, 12 Sep 2026 17:09:27 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] nvme-tcp: allow setting per-queue io_cpu through sysfs
To: Sagi Grimberg <sagi@grimberg.me>, Saravanan D <saravanand@crusoe.ai>,
        linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org, hch@lst.de, axboe@kernel.dk, dwagner@suse.de,
        linux-kernel@vger.kernel.org, iyamahata@crusoe.ai, kiyer@crusoe.ai,
        ganbalagane@crusoe.ai, sj@kernel.org
References: <20260909211432.6741-1-saravanand@crusoe.ai>
 <13c160d0-0657-47ce-9a16-58d348267ab0@grimberg.me>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <13c160d0-0657-47ce-9a16-58d348267ab0@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE2NiBTYWx0ZWRfX/HhnsQ6rnNoh
 XZrzxA9Oxb/oq5S4jsho27BbMSFx153yA1/YrI5naMjI0jxwEPn3PndSw8nq7TVkN659WuEWsAs
 fPZA7qUm7v4pMz8La1uMhwsHRaQ2BhaOyn4gEYYCJvin03XwT4DN3M/IwITi6EWEbviFGQIBrNi
 EayIj11fQANOkfAnGOzaG+tE/zNPRyPj0cssLkcIc+mWPHCebNGPwi8BOutcWOIaWoFXXcRNKje
 KLrlC1Nt0A0iD4DbxPwPz2lJt3lzN8H0IF/L7f4sHbNufDa/BPZHeUIuM2fK7JAhQcs3r5r/X2m
 U4wYbO2GZDUV+aeVo7q2/mAovjW9ig35gah0NOHj3GfazcImHZ+fMwYAx9pwVm1InAXqLj0mTKu
 bb+XqRrj4pgw/nJ1hs4uiSC5+dpPawjRR0vGyoTJdtGqnEf7MclujBvlDyZhGZuUUsCW2JG0wfa
 HZzs2QufdmdUDfkzWJQ==
X-Authority-Analysis: v=2.4 cv=E/NYNqdl c=1 sm=1 tr=0 ts=6aa539f5 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=VabnemYjAAAA:8 a=y8Dyc2pq3nG06-D6kVsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: APYjIlrG2b7sBY2v390uQyvSaQb8tva3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE2NiBTYWx0ZWRfX8Z/tw1l0vhVz
 spNKwQ19NVjF3V2eFwyBMDkanMXMbax5FWE1c9Y7N3IdTpBMvvtWF31Nz8lVd83UfQPf7Q4FX8D
 a8djZkHJowFqdxVjNS6TwtyeAEFO8vY=
X-Proofpoint-GUID: APYjIlrG2b7sBY2v390uQyvSaQb8tva3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_03,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120166

On 9/12/26 2:41 AM, Sagi Grimberg wrote:
> 
> 
> On 10/09/2026 0:14, Saravanan D wrote:
>> nvme_tcp_set_queue_io_cpu() picks each queue's io_cpu at connect time
>> as the least loaded CPU in the queue's blk-mq map group, and all socket
>> work runs there for the connection's lifetime. This decision falls
>> short when the host partitions its CPUs after connect time. On a 384
>> cpu multi tenant host with 128 queue controllers, blk-mq folds three
>> CPUs into every map group, some groups straddle two tenants' cpusets,
>> and 9% of nvme_tcp_io_work executions ran outside the submitting VM's
>> cpuset, seen by the neighbor as steal time.
>>
>> Expose each I/O queue's io_cpu as a writable sysfs attribute
>>
>>    /sys/class/nvme/nvmeX/tcp_queues/<qid>/io_cpu
>>
>> so a control plane that owns CPU placement can set it directly instead
>> of relying on the driver's heuristic. A written value persists across
>> reconnects, marked by NVME_TCP_Q_IO_CPU_USER. Writing -1 clears the
>> mark and re-runs the connect time selection. Reading returns the CPU,
>> or -1 when the queue is unbound.
> 
> No need for NVME_TCP_Q_IO_CPU_USER flag and restoring to the original connect time selection. -1 would mean WORK_CPU_UNBOUND. In fact lets allow this file to access "unbound" string (same as -1). I don't think we need to restore the connect time selection, the user who touches these settings is obviously interested to be in control.
>>
>> The store, the connect time selection and queue stop serialize their
>> accounting of nvme_tcp_cpu_queues under the queue lock.
> 
> I think that the queue accounting is something we'd do anyways, regardless of how the
> queue is set. It just represents the io_cpu spread across cpu cores.
> 
>>
>> Suggested-by: Sagi Grimberg <sagi@grimberg.me>
>> Link: https://lore.kernel.org/linux-nvme/220e9da3-f756-4a16-8de1-d4b171f15009@grimberg.me/
>> Assisted-by: Claude:claude-opus-4-8 [Claude Code]
>> Signed-off-by: Saravanan D <saravanand@crusoe.ai>
>> ---
>> Changes since v2 [1]:
>> - Replaced the io_cpu_adopt connect option and the submitter adoption
>>    heuristic with a per queue writable sysfs attribute, following Sagi's
>>    suggestion [2]. The control plane now sets each queue's io_cpu
>>    directly, the assignment is kept across reconnects and writing -1
>>    reverts to the connect time selection.
>> - Retitled from "nvme-tcp: pin io_cpu to submitter cpu".
>>
>> The per queue directories follow the blk-mq mq/<hctx> sysfs pattern.
>>
>> Tested on a 2 socket 384 cpu host with 128 queue controllers. Writing
>> a cpu number changed the queue's io_cpu to it. Writing an invalid
>> value was rejected. Writing -1 re-ran the connect time selection.
>> Pinned queues kept their io_cpu across a controller reset while
>> unpinned queues received a fresh pick.
>>
>> The multiple queues per hctx RFC [3] found the same need to steer the
>> socket work cpu, so this attribute may gain a second user.
>>
>> [1] https://lore.kernel.org/linux-nvme/20260820083634.71689-1-saravanand@crusoe.ai/
>> [2] https://lore.kernel.org/linux-nvme/1d56144d-6987-40c1-ac02-b15333db121e@grimberg.me/
>> [3] https://lore.kernel.org/linux-nvme/20260903152623.614951-1-kbusch@meta.com/
>>
>>   Documentation/ABI/stable/sysfs-nvme |  12 +++
>>   drivers/nvme/host/tcp.c             | 153 +++++++++++++++++++++++++++-
>>   2 files changed, 162 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/ABI/stable/sysfs-nvme b/Documentation/ABI/stable/sysfs-nvme
>> index a2f5d0710db4..2bbb5a0b7c2e 100644
>> --- a/Documentation/ABI/stable/sysfs-nvme
>> +++ b/Documentation/ABI/stable/sysfs-nvme
>> @@ -451,3 +451,15 @@ Contact:    Hannes Reinecke <hare@suse.de>
>>   Description:
>>           Shows the subsystem type. Possible values: "discovery",
>>           "nvm", "reserved".
>> +
>> +What:        /sys/class/nvme/nvmeX/tcp_queues/<qid>/io_cpu
>> +Date:        September 2026
>> +KernelVersion:    7.4
>> +Contact:    Saravanan D <saravanand@crusoe.ai>
>> +Description:
>> +        (RW) The CPU that runs the socket work for I/O queue <qid>
>> +        of an NVMe over TCP controller, selected by the driver at
>> +        connect time. Writing a CPU number overrides the selection
>> +        and persists across reconnects. Writing -1 reverts to the
>> +        driver's selection. Reads show the current CPU, or -1 when
>> +        the queue is unbound.
>> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
>> index 921934028e0b..22ad1fdf4a12 100644
>> --- a/drivers/nvme/host/tcp.c
>> +++ b/drivers/nvme/host/tcp.c
>> @@ -93,6 +93,7 @@ enum nvme_tcp_queue_flags {
>>       NVME_TCP_Q_LIVE        = 1,
>>       NVME_TCP_Q_POLLING    = 2,
>>       NVME_TCP_Q_IO_CPU_SET    = 3,
>> +    NVME_TCP_Q_IO_CPU_USER    = 4,
>>   };
>>   enum nvme_tcp_recv_state {
>> @@ -102,6 +103,17 @@ enum nvme_tcp_recv_state {
>>   };
>>   struct nvme_tcp_ctrl;
>> +struct nvme_tcp_queue;
>> +
>> +/*
>> + * Allocated per registration and freed by its kobject release, so a
>> + * reconnect never reuses a kobject whose release is still pending.
>> + */
>> +struct nvme_tcp_queue_kobj {
>> +    struct kobject        kobj;
>> +    struct nvme_tcp_queue    *queue;
>> +};
> 
> I am wandering if it is time to introduce the core nvme queue:
> struct nvme_queue {
>          struct kobject        kobj;
>          unsigned int          qid;
>          u64                          flags;
> };
> 
> And have the transport queue embed it:
> struct nvme_tcp_queue {
>          struct nvme_queue        nvmeq;
>          ....
> };
> 
> I suspect it will allow for better abstractions.
> 
> Thoughts? Keith, Christoph?

Yes, agreed. I think having a common queue structure would provide
a better abstraction here. However, struct nvme_queue is already
used by the PCI driver for its transport-specific queue representation.
Perhaps we could name common structure as struct nvme_queue_info.

Thanks,
--Nilay

