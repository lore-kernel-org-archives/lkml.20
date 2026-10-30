Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371619;
	b=l+UZ4XNpaYSviJLO+bkWaY3eTgUW/QNaDYBI0aquvBT9a7BEpIBEGhLfdxRU6ZA8tey5
	 kBQpOhlBr80luTVnGUmebEEuSy4EXQYm8gxz47257m551gtlhPiygcqjMioAxt0+Mw8cB
	 i6lP2lJJI0v5Vtewmx0XEXJQga99wNWzLq0TBLeILEElTBTszUXvH6qt4Ni/SYas3jdX3
	 X/ey1wRTuWX/dZcE1OP9i+hh4BCZ6n2EIZ7C7VlF8KDNxia1Y/fvokj5ItlMa0t+bKDwl
	 Gkde7fTnwR3y5myBVzrpLbtC1oP+ne7EGOOinVcFztkxfBay1huomPusAqfDCbQubNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371619;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BSgKJUlBsFb/sKWty5Os0xe1OujHm3bsPRGVj6LAwp0=;
	b=pEnzAV0aQzITNWshkqkX1RG3p1IVYl3wRGcBFmDxX8SiwJuC170YX4NGpoFTiizQzNME
	 nCPD2Ff8BFZVbfcrMp3CqPUpLGHMeMmoIaVmmUdZaGsDK9omv+CS2CTSIQSuA+3Vlo+QG
	 U3g51V1Bczn1B06T7sa557Q0AEZnFPJS2Nh/XYDBY/ABDuYIW/aC59ff/STnbTSjR2P9e
	 MyoJAGD7tza5SsSXldfw0W84kCKTH4D/wgIDEUw/MeojR6sExJLRy6ykB9Jbzn6NB2KaG
	 fSoFPvDqHODv1Nx8c6tzs5Kxp3akh87YeLan9NCO2HFUxOjnu25Z66rtdht944zSSmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iBnFjnr1;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EE2606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0EE2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iBnFjnr1
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEiPJD3192001;
	Fri, 30 Oct 2026 14:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=BSgKJU
	lBsFb/sKWty5Os0xe1OujHm3bsPRGVj6LAwp0=; b=iBnFjnr1Aop7RIrCTXZGp1
	pZ5aS+gZpSdEJ2GymG8nL9AvKIBhHyo8uPVEied18sOAhY8jJdhwE7eyEk2W1yHG
	uuHvETQufZYF5MSa2unbzXM9Gp3QfhnVTWrXjIDjIExlDDwy9GGvzpp94nhiFAaP
	chTvi5tZkXODtYsMEQ8/PWtHC5VaKh6X+i0iZ3npMHL2fkP+4ZEFm34vHTTBOFOT
	yGBdWPh8uR2L/TR+QhsmPBNDBQ25uN5Qw6U0JA85SjPo8sX5gSCAU6yxBzY/To5W
	ie+H4M9DH6jviPWann7moP4sMcz6cWcOaFKBqkE79mHr9SsbHqRuqQtZwZUgE0rw
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hmeb037tm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 14:46:30 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEZ6Jo649977;
	Fri, 30 Oct 2026 14:46:29 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hm69e50gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 14:46:29 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69UEkTiO28508690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Oct 2026 14:46:29 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DA855805E;
	Fri, 30 Oct 2026 14:46:29 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C16075805D;
	Fri, 30 Oct 2026 14:46:23 +0000 (GMT)
Received: from [9.61.35.48] (unknown [9.61.35.48])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 30 Oct 2026 14:46:23 +0000 (GMT)
Message-ID: <10c9db86-4313-4a1e-bec1-e4eb9ae32ef0@linux.ibm.com>
Date: Fri, 30 Oct 2026 20:16:21 +0530
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
Subject: Re: [PATCH v6 1/2] nvme: add per-queue sysfs directories
To: Saravanan D <saravanand@crusoe.ai>, linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org, hch@lst.de, sagi@grimberg.me, axboe@kernel.dk,
        dwagner@suse.de, sgogte@purestorage.com, hare@kernel.org, hare@suse.de,
        linux-kernel@vger.kernel.org, iyamahata@crusoe.ai, kiyer@crusoe.ai,
        ganbalagane@crusoe.ai, sjpark@crusoe.ai, bchen@crusoe.ai
References: <20261023230426.6425-1-saravanand@crusoe.ai>
 <20261023230426.6425-2-saravanand@crusoe.ai>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20261023230426.6425-2-saravanand@crusoe.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: h8RD38LiryUoddB-gs6zSwlAf-qxHdK2
X-Proofpoint-GUID: h8RD38LiryUoddB-gs6zSwlAf-qxHdK2
X-Authority-Analysis: v=2.4 cv=JIyuIMKb c=1 sm=1 tr=0 ts=6ae4adc6 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=CAu4v4SmNPW74JkL9eIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1OCBTYWx0ZWRfXzvLx6rYyhv+P
 8xGQEA6CffMFhZ7y0rVJD70Y95l7OxXXSIpJaJ9i7XTUxOhxA/shMB/dR8XAFkcmSGJ5GzkGkcL
 9ZZ24MtWrNbnM7hoFlJm7f2psAY6CaUYAlnDddsFZoBgQsHEUCIj+XNtWCd5oGhRaXgxA3Bn64Y
 24gsoF3TtvM2Akugsfv7dEy16xq3lBvLBP/QHKuL6HB5lKsBs1gJA8x8TbQev/wm7K57Rs/Rg7e
 ei4o03rRTj1CScQG1X9LQbxvWmhyOVTyEVRjGX15bPOf61Ae3EavHAcH+9Cv7MfPyBziIYRiF8l
 7Qqu/XSBusZAiRKgPMwDYTe8dkcVx6jUFM4fFdstmw6eHdcHm1SUlJ70D+OtIUkSw0MBHUBBW0J
 ilhfkFG3aH4GSLRyZWfY1+MzJKSJiOJAS28SaFpfhiAobDyfFbLG6kb4VhB05IFjXUpIXmCPR2Y
 TbyoXzLOq+MxZdLruYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1OCBTYWx0ZWRfXwTtParaxdTNp
 kz4Cqx3G5J3SrQBlFSf/LhHlrXjCJdaUWYZ2y42VB0w7Lj6FhLL9JaTeiMTvr4y61GAwgND7OpW
 /Pl8MfJIMudrYLrFy7JA8Vsikfw7Hgk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300058

On 10/24/26 4:34 AM, Saravanan D wrote:
> Per I/O queue transport state, such as the nvme-tcp io_cpu, has
> nowhere to live in sysfs, since the core has no directory for
> individual queues.
> 
> Add helpers that create the controller's queues directory and add or
> remove one directory per queue
> 
>    /sys/class/nvme/nvmeX/queues/<qid>/
> 
> carrying attributes provided by the transport. The transport creates
> the queues directory from its controller setup path, adds a queue's
> directory when it sets the queue up and removes it when it frees the
> queue, so the directories follow the queues across reconnects and
> changes in the queue count. The core allocates each queue directory
> and its release frees only that allocation. Removal waits for running
> attribute callbacks, so the transport may tear the queue down once it
> returns.
> 
> The queues directory holds a reference on the controller device, so
> nvme_uninit_ctrl() deletes it after the transport has removed the
> queue directories.
> 
> Suggested-by: Sagi Grimberg <sagi@grimberg.me>
> Link: https://lore.kernel.org/linux-nvme/13c160d0-0657-47ce-9a16-58d348267ab0@grimberg.me/
> Assisted-by: Claude:claude-opus-5-5 [Claude Code]
> Signed-off-by: Saravanan D <saravanand@crusoe.ai>
> ---
>   drivers/nvme/host/core.c  |  6 +++
>   drivers/nvme/host/nvme.h  | 23 ++++++++++
>   drivers/nvme/host/sysfs.c | 88 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 117 insertions(+)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index 531f9bb14bab..41e1c9d0ee58 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -5153,6 +5153,12 @@ void nvme_uninit_ctrl(struct nvme_ctrl *ctrl)
>   {
>   	nvme_stop_keep_alive(ctrl);
>   	nvme_hwmon_exit(ctrl);
> +	/* transports remove their queue directories before this point */
> +	if (ctrl->queues_kobj) {
> +		kobject_del(ctrl->queues_kobj);
> +		kobject_put(ctrl->queues_kobj);
> +		ctrl->queues_kobj = NULL;
> +	}

Can we have a helper something like nvme_queue_dir_destroy()
and then call it here?

Thanks,
--Nilay

