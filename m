Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793168427;
	b=Jw1xQDtAebjJDce2wrGUXz4mcHobdtd6YOx++OzyfQXPsh80/g0w7tBrynUBKupp0v1I
	 v7woi6tOHDoV6ijnbYPaCxMDq4enNgtxBAymv+07to1u1VJhuXRh50vjROgsJeYcqjMMj
	 NapYZwuFhUY1lmU6+9C+sH200s42c4jdyL1Ko+wFOaJp5XIEFYZ8m8Zu8rnvJyiuTWYAG
	 Arr4Gp9EXBHgoLFTEmAds1WjKOBN0Ov0z5sSOr2ZMNPtyoQD6846wNknyVP9kIy3hUG0y
	 v1elxt2GRlWNoGBQlclCwZ7/hqdx/vYe4/Y9YRR37MweTIOGWsIObzrIvGhnGGmHmmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793168427;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=d+qbwO8JLYBHznrwAFBQ6dgwqbKLakANhCihu2QkFtY=;
	b=HB+7q1IQhQd0AXY87jK9Eb4+wGA4OiSsACEpV2+cNUGehCQh9AbAQ1Lpq4eW2vJMhTcK
	 uNARp02ckZWXkZIZHwaom/liM5X27I+MHl0YkralDHXcQcDjmtWdU4UaZZ5Ysj6NT2UfS
	 t6Yo7xIY6fhIPpejRyQRLK4t/Hrer4AFTgfE4sHZRe3pbKAj5Hg3HuJLu9ArSj81+NU8l
	 /YfYX6OpiL0nk78lga5ud0kRz6p+7nLv/G3tEYTHKI6TI4DO/Mg5VkW6n2m0wcavBTmVn
	 HPrcS71ijLa4OY5heXRayq5P18o025A6/gcVKqUEmah/r/mdCnFwLjfUpx06MAheIIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vd8vU0ky;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D33606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2D33606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vd8vU0ky
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4iQ5E227503;
	Wed, 28 Oct 2026 06:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=d+qbwO
	8JLYBHznrwAFBQ6dgwqbKLakANhCihu2QkFtY=; b=Vd8vU0kyCEvzkWDfTyrJMq
	9Hx8hLbW2A1e9XbfGK6nwBr5+j+a0nLe4zJ4UHekM5gi9zfjS8SgevHgWoG0g+nY
	fod8iolC0DpyiGkVLwgiwaGeDivYfPMhjGdmzpiWHxhSQos4TWWMfUtpBQsifV9m
	ZwW+v8Mb2ll1Fe+9q+mkwbyPO567XeqxS4rROEdewbIkJhnXWw8cfVx0E9s34Tdr
	iCq4MEyTFiU0sBVJ8q4eqgRYbe9hZNCCiH94/5IwWK8oWkO5ndQY4unFK796pw6i
	rmSvWI7TJa41nq50APOyFxI/60/Tq4YReB0qnylB79tr3ERGpIuI2LHAZxbkJ/6w
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hgj3mbd91-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 06:20:09 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4YxuX1030494;
	Wed, 28 Oct 2026 06:20:08 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hjsu7v1rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 06:20:08 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69S6JJvv38273412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Oct 2026 06:19:19 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F75158061;
	Wed, 28 Oct 2026 06:20:07 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D3EF58043;
	Wed, 28 Oct 2026 06:20:04 +0000 (GMT)
Received: from [9.61.174.203] (unknown [9.61.174.203])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Oct 2026 06:20:03 +0000 (GMT)
Message-ID: <4bc48dd5-7de8-474b-8989-d4c62f4a212d@linux.ibm.com>
Date: Wed, 28 Oct 2026 11:50:02 +0530
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
Subject: Re: [PATCH v2] nvme-tcp: fix NULL queue->ctrl dereference on
 reconnect
To: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>,
        linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
        hare@kernel.org, sgogte@purestorage.com, wagi@kernel.org,
        kanie@linux.alibaba.com, linux-kernel@vger.kernel.org
References: <20261028024309.1398623-1-christian.aurichzm@gmail.com>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20261028024309.1398623-1-christian.aurichzm@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNCBTYWx0ZWRfXxZlAubVGBIOO
 U+t/dCoPSbB68IWq+DXRZ3Q/BkfteG+PMWpKuvk36kNWG6tfexfrNItLTOIIhHErU6wc6H+VkRT
 fWKusE6AWhhjtcExnHWYDF55KuD0NSc=
X-Proofpoint-ORIG-GUID: 70oOXcB3iPk79eBg4xEl6-53-Di7B6By
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNCBTYWx0ZWRfXxZcdCgzununq
 Lc1EcBlDYVvlegXs0lHB/vYK74tYfOd7xiSvy/bJ12uC3KZ4+sqmmio4EY9MztXhb01XoXBsybi
 9xZZRcuOwjmeSqVHjqB9wVmunmznGmLprBy7g5/YIWnPVX6mgpi2EydN0tw1YFISL2kxNb5iqZQ
 kxVHy3JlWyNYTmnYkqOfbPTGMW/yCvLs8PjJ8YizCCxuXLEwh0DyQXSqx2EDN0Cj3Terhh+F11d
 GLtv1oc7gFKDTa/vX5uhDOMYaMUHQrOVQODFqfJeFnIeGRES2ZIWlqBF7Rqxh2b0Kr7HoR6tUj9
 MmpnwnCdq2GvHL+uaZo+XuHlJInjWM5gdJOlABA4kJft92l+bKCaYq6gFM6uP9Oe46Wc1dNPyTo
 VekXtwNTXIGbpDhfVAc+LTA5FF0a0r3DLTf7unNXJaETLw7dRtdDWjho6SOl8wvKY8gloHFjgD7
 yujL9f8lOa78Xq/e6iw==
X-Authority-Analysis: v=2.4 cv=G7uJgNk5 c=1 sm=1 tr=0 ts=6ae19419 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=sM3CkMq7cFP6RC6SvF8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ik8cs6YatEOKDCRi0KdHcbBtW19cdf4f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1011
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280024

On 10/28/26 8:13 AM, Christian Aurich Zanettini Martins wrote:
> Since commit 61b0ed3be81b ("nvme-tcp: parallelize I/O queue allocation
> and startup"), a reconnect that gets more I/O queues than before grows
> the tag set before the new queues are allocated. queue->ctrl is only
> set by nvme_tcp_alloc_queue(), so I/O submitted in between reaches
> nvme_tcp_queue_rq() on a queue that was never allocated and
> dereferences a NULL queue->ctrl:
> 
>    BUG: kernel NULL pointer dereference, address: 00000000000002ac
>    RIP: 0010:nvme_tcp_queue_rq+0x33/0x3b0
> 
> Add nvme_tcp_init_queue() for the queue fields that do not depend on
> the connection and call it for every queue when allocating the
> controller. Such requests are then requeued like on any other queue
> that is not live. send_mutex and io_work move there as well, and the
> helper's mutexes are all destroyed when the controller is freed, like
> queue_lock already is.
> 
> Fixes: 61b0ed3be81b ("nvme-tcp: parallelize I/O queue allocation and startup")
> Suggested-by: Keith Busch<kbusch@kernel.org>
> Signed-off-by: Christian Aurich Zanettini Martins<christian.aurichzm@gmail.com>

Looks good to me.
Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
