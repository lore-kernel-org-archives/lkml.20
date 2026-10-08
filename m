Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7945B4908C8
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453571; cv=none; b=hNOOK7gkVEtK2JYRxT4kZ7bivWqhpJu72ZDDJymSvqBX5Z+ceosX9qrm8VD+rsv3k9hwjPoxmiK31Y7Vm/+Nj7pL2ZTkKd1CEq1JAvA+JC9srxbF9r/5pXjh7GpDHSADaGk5lALNYS267zLbLpGglw6U6gFjWKPexB+FqurPuI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453571; c=relaxed/simple;
	bh=yE4EeleX2gtk4DCmIWbng7HcUapv/PDsfks5qnClLYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W+/BI2uZxronmcMD6RedAgYl6Wac1Z6BG+qeZMImi/hgjSznEi++//gLslSniZ+QZSNz94UmEpKR/qwEUkpe5kjQJejI68oRxQMKxkR9tyRop85++EKc4eXtK/XO5tBSQhxEwZiQGntSxLOe1nTQmHUWdsc3l7SOWLYipEBd8g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Y4KidBO8; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Y4KidBO8"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987ZUDY731193;
	Thu, 8 Oct 2026 09:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lbmy/r
	U+QZ+TLu4YR7LaKloP5QAv5Le0xQuN4Wu7W0I=; b=Y4KidBO8ajT/DI7ZlSLQAq
	QnQsGYlpTRErv3JnvS9ofb0OZK+cEGw7RfyNTCrE2kFlTs4Xd4t7KwS+qKgJwsYi
	8AO0OfF35OnPYqm0tejDedOmo2BFTXdX+gy2OpRgTU9L1bAD9+BDU3aMEju4D+3j
	5QysCXe2UoiqbjLkOmMcb7netzKwjIK+pAUueXX5te+b5+JWVPVI95C9KifspcaV
	L6Bh9DVul6pZlW1IYnbzQ8PtDDq2xWpvuJjVQWbRQaJzcR3tGT2KeIp0Fl4zdBS7
	vhvTDEmBIH3olihtooxF7jbxh2C2Tpk6nspN8TXuYsIRHAXpF/5a3g2wrbu9k9EQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h5xjvjkgc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Oct 2026 09:59:07 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6987IZnP3107270;
	Thu, 8 Oct 2026 09:59:06 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h58ek6usw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Oct 2026 09:59:06 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6989x5qN33030910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 Oct 2026 09:59:06 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B995A58056;
	Thu,  8 Oct 2026 09:59:05 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A1A5458052;
	Thu,  8 Oct 2026 09:59:01 +0000 (GMT)
Received: from [9.123.7.57] (unknown [9.123.7.57])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  8 Oct 2026 09:59:01 +0000 (GMT)
Message-ID: <24700bd8-c627-40a6-abe2-433399072a6c@linux.ibm.com>
Date: Thu, 8 Oct 2026 15:29:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] nvme: add per-queue sysfs directories
To: Saravanan D <saravanand@crusoe.ai>, linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org, hch@lst.de, sagi@grimberg.me, axboe@kernel.dk,
        dwagner@suse.de, linux-kernel@vger.kernel.org, iyamahata@crusoe.ai,
        kiyer@crusoe.ai, ganbalagane@crusoe.ai, sj@kernel.org
References: <20260927070925.47209-1-saravanand@crusoe.ai>
 <20260927070925.47209-2-saravanand@crusoe.ai>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20260927070925.47209-2-saravanand@crusoe.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Az-9c5A6brIsjwiRXqLeAMQv6NKIIyeT
X-Proofpoint-ORIG-GUID: Az-9c5A6brIsjwiRXqLeAMQv6NKIIyeT
X-Authority-Analysis: v=2.4 cv=FoOQbGrq c=1 sm=1 tr=0 ts=6ac7696b cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=bZvm_KZs-9OTagBdk5QA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzOCBTYWx0ZWRfX6hCUbUCk0EvD
 B030sC2dzFavUWbQSe6R1+ZP1c+jtJXJs7Th6OmPjZvr7ttXN/L3Fy+OTXjrgHRsQcT0LU0Mhrk
 TNx/b2hKEQXsjxKqKec16K8j6v6vV2M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzOCBTYWx0ZWRfXx2UMBjwjMypb
 JWNvG8GtwNanaYSyzyuvy6AqeXg4zN89e9khLQpVNy2+8FGp/7U+HK3BgnsILqNJnj2mdMX6duK
 oIV+QrVY9r6DwkCuoE0aCpYd6BvibAjcwPtWsf98KhbbQ0xo1RRDgZd2ZlkI6BD90T6itEiKnLD
 PeFyIZTdnnV/Uek8yI+AL/CRJAxjjxZ4N+kqWxq8NQzpT+TW4Z6lW9VsuU6lBKZEx5dJZRP9TtN
 Nzo8C6LMsdcmJVOtsOjcaVdNhi6C9ZIru3dQ735sjIbwZTNC+tNwO9bI1WV2bhbbAfd+K/fpZRS
 jGVLb5FFU9kdp+QPgjULg99G6Ko4eQ+L96s+WUGgRK8i6jTSYO2jpCS97X2kLaGLUf79A9KC+e3
 EYRauasXABrT0saNKM+UVwlM7Xaj6vcCBTyxy1345z41TdFKQ+TUho0R/wjs1RCa4Hn/jJCkJtC
 QcVkdAo7LGMbUsCMQ8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080038


> diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
> index bac25b287d25..20410f0d6118 100644
> --- a/drivers/nvme/host/nvme.h
> +++ b/drivers/nvme/host/nvme.h
> @@ -339,6 +339,28 @@ enum nvme_ctrl_flags {
>   	NVME_CTRL_FROZEN		= 6,
>   };
>   
> +enum nvme_queue_info_flags {
> +	NVME_QUEUE_INFO_REGISTERED	= 0,
> +	NVME_QUEUE_INFO_IO_CPU_USER	= 1,
> +};

NVME_QUEUE_INFO_IO_CPU_USER appears to be a transport-specific flag,
so I don't think it belongs in the common NVMe core code. It would
be better to keep this state in the transport-specific queue structure.

[...]

> +/*
> + * Per-queue sysfs directories under /sys/class/nvme/nvmeX/queues/. The
> + * transport backing the controller registers a directory for each of its
> + * queues and provides the attributes through the ktype. Registration is
> + * expected once per controller lifetime, so the directories persist while
> + * the transport's queues cycle across reconnects. The queues directory
> + * itself is released with the controller device.
> + */
> +int nvme_register_queue_info(struct nvme_ctrl *ctrl,
> +			     struct nvme_queue_info *qinfo, unsigned int qid,
> +			     const struct kobj_type *ktype)
> +{
> +	int ret;
> +
> +	if (!ctrl->queues_kobj) {
> +		ctrl->queues_kobj = kobject_create_and_add("queues",
> +							   &ctrl->device->kobj);
> +		if (!ctrl->queues_kobj)
> +			return -ENOMEM;
> +	}
> +
If this function can be invoked concurrently, how is ctrl->queues_kobj creation
serialized? For example, if two callers concurrently pass the !ctrl->queues_kobj
check, both could call kobject_create_and_add(), which is not what we want.

I understand that the current user of this API in patch 2/2 invokes it serially.
If serialization is an API requirement, could we document that in the function
comment? Alternatively, if this API is expected to be safe for concurrent callers,
the creation of queues_kobj should be serialized within this function.

In particular, I'd prefer the API contract to make the expected serialization
explicit rather than relying on the current caller to invoke it serially.

Thanks,
--Nilay
