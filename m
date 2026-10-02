Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4F53E49D2
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942045; cv=none; b=K4lfmHQ8yikRajSLVFTLjYCJaqqcGXjibxD2mfY38U1zFIWoAwUrCMX1YHLEomkqBGFgkcy0ylTJECYaFKFl2u2f3PUuZL5sIMNhupQ8SQrqlQsfqK0D7c8MNXxqNunQUxtrLUfGcmBqQpnQHGzypzPdEMpRrKFaru3ZEKFju8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942045; c=relaxed/simple;
	bh=3ycMHgCDVi6p5ninE/u3Xm99xHyIS+oQlgNqGvMfmdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJk79+saK34HOpVoSGz+QS+RLXRVIKa0u3Iqfzfyimx/+jPJ47k638Sw1kYY2OHLtZIe+1G55hs2077el6iR7Z+VZ2YoeU7pNd0bRPeWnJy0OPVaSnwzuP1VF9ERKKX6oOeucsDgOByAzNN+zfpRFvUNnkAdYFdTkuKbIXEf8Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=nRW6R9AE; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="nRW6R9AE"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692A5Qi2243051;
	Fri, 2 Oct 2026 11:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Bwzpr1
	2RKk/GbrswY/ryv5tsrOzM33lDA5NKBleuwxY=; b=nRW6R9AET3p0ZlA14OCTP/
	ocIdZ8oL5tr//dAcPoZCMDniCjn7v0txZ68iVQT05Ptw7vDnHq8uFUy6M+Vj8aVl
	CI0rppTewmND9CWLo+NsVKND5YDo7dg44/1ciG4WyJdgGBmtO/GTFgrO7M95BcgC
	HWXGrRBbc5AhLo9k30BmcSYDWpfQVLjWdA0lF0wt19ThZ8OV6u/F2uohDbHphQa1
	Jdg1X/0urXPffLx4aM6+1omo2j1B97zUF37VHdXIY0ZwijJzNttfTJfGzY6qCjKp
	fElfjo9T/VfbQbnKDe/M4HxG3buKUKRynSs2U1s2iXGZevWUwdhu+v9A0swgT8aA
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx5j5s62c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 11:53:38 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6929lf4G2312746;
	Fri, 2 Oct 2026 11:53:38 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4h1y2djjq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 11:53:38 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 692BrbDH32113380
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Oct 2026 11:53:37 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B4CC58061;
	Fri,  2 Oct 2026 11:53:37 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5DB3958057;
	Fri,  2 Oct 2026 11:53:34 +0000 (GMT)
Received: from [9.61.28.159] (unknown [9.61.28.159])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 Oct 2026 11:53:34 +0000 (GMT)
Message-ID: <40e34059-8bbe-4a1c-8eea-f372ef5f0c72@linux.ibm.com>
Date: Fri, 2 Oct 2026 17:23:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] nvme-multipath: fix path state evaluation for
 failfast and ANA
To: Krishna Iyer <kiyer@crusoe.ai>, kbusch@kernel.org, axboe@kernel.dk,
        hch@lst.de, sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, hare@suse.de,
        saravanand@crusoe.ai, sjpark@crusoe.ai
References: <20261001094857.74567-1-kiyer@crusoe.ai>
 <20261001094857.74567-2-kiyer@crusoe.ai>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20261001094857.74567-2-kiyer@crusoe.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0NiBTYWx0ZWRfX5Px/23bbsdyY
 aCZ5LOQy1Z6qkFeMh4fhrPGR13lj6a52ZAwmjDqpTTT4L+07olDXS+geU8PaTbYotBwiDwPczrB
 Xqc7aD6Dxl/941iq1Ne+/HMNr908DMc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0NiBTYWx0ZWRfX8CL0OQwcsD3l
 cFjhSPAGk9Gc2mtGq+BvTeC4o+3U3aedKA4XGZIkS7BPOi0edElRJjaL90lORrgrFkjn+mm9bRv
 vkL0EAsJ0lr3nwiBhnbNGHx5nNfjEs7D1rUPxxyHjf9P26aWgZrF4mzlvYGmUlQWXF4HFztP+93
 pqpx2qTjGFUQ8GufJTKLpwMUJOUcfS8WBUhTMxJAJFN2i5rDbQUpqJPOGXwEasrSqKXiMqkA+25
 Ugjlk22NDNP/r5RcYWRaIDMGfkbI8Nz1HOq2w8/x5q5JfO82VMJQLLZlgRZE8evyEU2VNoQaLrb
 1g1jheWJ3VOi46VMH74/2GFdr4Y34l7AIqTlCVXCsQdMfxfdAVE0PtUSsIRGmvRhQ+srtvS5/Um
 J7pis4PjTLTL+DDSvb4uuLZIYO7qngIvyrSKXjqL4SYuD7Zq3a1VV2LiWFXuexwwrrfSle8bF8T
 H6Sq9X/BgygZfe2Rc5w==
X-Proofpoint-GUID: 3IGsCNBnamzEP_QhftlB2BB9F6rRuWCY
X-Authority-Analysis: v=2.4 cv=RKcmjIi+ c=1 sm=1 tr=0 ts=6abf9b42 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=qQ62r2TzJenuYHxblocA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 3IGsCNBnamzEP_QhftlB2BB9F6rRuWCY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020046

On 10/1/26 3:18 PM, Krishna Iyer wrote:
> nvme_available_path() has two problems that keep I/O queued when it
> should be failed:
> 
> 1. When fast_io_fail_tmo expires, NVME_CTRL_FAILFAST_EXPIRED is set and
>     the path is skipped, but the function still falls through to
>     nvme_mpath_queue_if_no_path(). If delayed_removal_secs is configured
>     the I/O is requeued indefinitely, defeating fast_io_fail_tmo. Only
>     fall through to queue_if_no_path when there really are no paths;
>     if a path exists but its failfast timer has expired, fail instead.
> 
> 2. A LIVE controller counts as a usable path regardless of the namespace
>     ANA state. A path whose ANA state is inaccessible or persistent-loss
>     cannot serve I/O, so it should not count as available. ANA change is
>     transient and bounded by ANATT, so keep queueing while it resolves.
> 
> Also kick the requeue work from nvme_update_ns_ana_state() when a path
> does not transition to live, so parked I/O is re-evaluated when an ANA
> transition leaves the namespace inaccessible.
> 
> Move nvme_state_is_live() above nvme_available_path() so it can be used
> there.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Krishna Iyer<kiyer@crusoe.ai>

Looks good to me.
Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
