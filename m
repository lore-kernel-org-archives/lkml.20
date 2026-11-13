Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565297;
	b=jDZCMV+RulV6wzjQZW8vG4Ae8FNXHLbUeCO3vTw9e188/90gDSPD9MPWbPA7AARt1/I2
	 vq4iLGVSxvitUhu6E3pv/pW201APTe3uWU8Xs0oaGN0GYC68Q2gX65FwWHb5P7uR10P70
	 sD7Y6AIzHLHnwNuJPVUd+JActN1bH/4BpzZGpMPZuntUBOPa9rXk1tuVeZ6V/I3K8sIMk
	 Er6XvsapNYPb/5ktepMVOJFmIGHI0OEzEOH4//7shoSat3bcghl2tFnxmD9rHoJ+kgme7
	 IGOVdJel09x3Uvgs/rVMgOYP7k+A9iaJlEe5+MKEa0eOlLP56s5ASH8f1DG5aV4UqVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565297;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jlDiw50da1bpygT1Ba82wOS+ut81qFxGdkrF9mZOhak=;
	b=jab8yuRqKjqGR/JQt7+pvpmoc9a5Q6+ijCglmVvMIFGeDNJln/ah6WztymMyHEQy2V7G
	 /EbjawzuSzYD7+Ih1aCC4C8YPmOZ8EcedKg5/F8aU5Pae2JFU6Pfet0tv+tT/JJ6j5fo7
	 j8jBgS35c4wDH5UMhE8o8B6zBTezaFXrAYxy3fDONdLDCWgz38XkSExlN9Fckk+kXWQyc
	 1DIw4x7Xv33WPZemxIPzgrPQFtKPgrNnV+owTcWy1yatH7ZkPzlWz+ePuRwr2twrqZ6vc
	 6gQf02Pqs/ZBDx37PNJBC085ZVQL+hCfCc94wKOaXCtK3QIkj76odDz2apP5sRDcO7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ODBh6LFd;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC50606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACC50606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ODBh6LFd
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD9XjGO2433727;
	Fri, 13 Nov 2026 10:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jlDiw5
	0da1bpygT1Ba82wOS+ut81qFxGdkrF9mZOhak=; b=ODBh6LFdawtSJwGa89ZoIT
	v3WUt+HSxcECnQK3ZupbpMWijCwcp+HA1JHti9lIHxw++wwPOprgP94D0qZXDuF+
	KABu7na3qAK20sLTIE6vWylQ+QzrBwDxglKzvKvO5MH45yCmZJcZOmCQP2EyFWSU
	jvo0nupQy1OYc4Xud0U8f7BhBMg/eCAFt/rmoDosZMhMaxHE9a2jwrI2eSMi/2eW
	32JCgum7OQwvj6sSnDZn+Z0JLxeVNyU5MRfDUwLqgt8Y08x3/7mLh1e9uygQiWwL
	uq8QP3siBfjKLY0BhILDvAzqbQ1+X/TxcMzSDd8bOBqfSDnwMA2Sl7faNEK49EaQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hssdm26p1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:19:51 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8YxVd2053888;
	Fri, 13 Nov 2026 10:19:51 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hwjcf2c9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:19:51 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ADAJol654591878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Nov 2026 10:19:50 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 132E758062;
	Fri, 13 Nov 2026 10:19:50 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D42958057;
	Fri, 13 Nov 2026 10:19:43 +0000 (GMT)
Received: from [9.123.7.57] (unknown [9.123.7.57])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Nov 2026 10:19:42 +0000 (GMT)
Message-ID: <469c4d3f-e181-4683-85e0-42046520c096@linux.ibm.com>
Date: Fri, 13 Nov 2026 15:49:41 +0530
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
Subject: Re: [PATCH] nvmet: clamp the last ANA group index against the real
 array size
To: Yuehong Wu <wuyuehong@cmss.chinamobile.com>,
        linux-nvme@lists.infradead.org
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
        Chaitanya Kulkarni <kch@nvidia.com>, Keith Busch <kbusch@kernel.org>,
        Maurizio Lombardi <mlombard@redhat.com>,
        Mohamed Khalfella <mkhalfella@purestorage.com>,
        Nitesh Shetty <nj.shetty@samsung.com>, Hannes Reinecke <hare@suse.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Aurelien Aptel <aaptel@nvidia.com>, Jesse Taube <jtaubepe@redhat.com>,
        Rongzheng Wang <testwrzwrz@gmail.com>, Kees Cook <kees@kernel.org>,
        Rosen Penev <rosenp@gmail.com>, Guixin Liu <kanie@linux.alibaba.com>,
        Qing Zhang <diasyzhang@tencent.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Julian Sun <sunjunchao@bytedance.com>, Yu Zhang <yuz08559@gmail.com>,
        linux-kernel@vger.kernel.org
References: <20261106-nvmet-ana-grpid-1-yuehongwu@cmss.chinamobile.com>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20261106-nvmet-ana-grpid-1-yuehongwu@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=POqaavqC c=1 sm=1 tr=0 ts=6af6e448 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8
 a=R5C9hjxsAAAA:8 a=VnNF1IyMAAAA:8 a=8NlKVBlaoI20-McazTwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MCBTYWx0ZWRfXzw13hhiyG+wF
 rXEIcoV/5K8+0UCyjBuXbPWx4FGnIi/qjW2MnzXTv+p0fCP6vdhX93agcYUNvWIQwia2Tt6wtxw
 n/4mjdMY8OUGuNMTMYc6jMdax+TD6BwyT8YxZnzgPgNA2VVRndRUUQY73pJPRb7zqR3Pl9FUkz1
 8qvtotw3vi+6blxLs+oIrivZ4SakK95T/j0mEMtVaNfryQdf04qCSvFlj6tVVyhu/ElRk1Rzivb
 Q4yrXkWTlopjGcpauW6Fnzk5aYMrXDPt9xhUo6xG7Ty13nhPGEJ0I2QTvj88Ozt/lN8Zp9/f4PC
 re1IqvxTRI1uk82AmY3YHe//L2hmzvZN1s+ET8iPTWyqczWhLH5Ywp3wj3EjuIouNAMjZFXa4Z0
 RcFS0DAJ8cPZZWy70nFHwg9M5Ec7eGNEAum5Ptg1bi0Wh8giq0olr0ft3N2Vf8Ixn9gvVFpJ9Ie
 VI2uEfkSOwjSfJ0rvjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MCBTYWx0ZWRfX90dKP0kLBoiq
 zMWhdYAlAGC398LqSAPp0d1FcDjSmHv4amKjuMx9jaUj9mvOxBa9pzphQ0cL0o2H4RBXX+2dUBn
 i2/pbPOZ+vcITl7z0+5RkxjS+a9yEQg=
X-Proofpoint-ORIG-GUID: WGqD4QEluci3Qqt_HTrF8yLOAi9106CQ
X-Proofpoint-GUID: 4irKpK-_jkCRuBryP-AgixV6US0C8Wy8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130040

On 11/6/26 12:10 PM, Yuehong Wu wrote:
> NVMET_MAX_ANAGRPS is the highest valid ANA group id, not the size of
> nvmet_ana_group_enabled[]: the array has NVMET_MAX_ANAGRPS + 1 entries
> and the controller advertises anagrpmax == NVMET_MAX_ANAGRPS.  Both
> array_index_nospec() calls however pass NVMET_MAX_ANAGRPS as the size,
> so for the last group the mask is 0 and the index quietly becomes 0:
> 
>   - nvmet_ana_groups_make_group() increments enabled[0] while the group
>     keeps grpid == 128, so the later nvmet_ana_group_release() decrements
>     enabled[128], which underflows to 0xffffffff.  The ANA log page then
>     reports group 128 as inaccessible forever even though the configfs
>     group no longer exists, and the increment on enabled[0] is never
>     undone.
> 
>   - nvmet_ns_ana_grpid_store() accepts 128, stores 0 in ns->anagrpid and
>     returns success, so the namespace silently stays in the default ANA
>     group instead of the one the user asked for.
> 
> Both failures are silent, and they change what the target reports in its
> ANA log page, which is what a host uses to select paths.
> 
> Pass the real array size in both calls, so the masking is kept but the
> last group is no longer folded onto index 0.
> 
> Fixes: 20dc66f2d76b ("nvme: prevent potential spectre v1 gadget")
> Cc:stable@vger.kernel.org
> Signed-off-by: Yuehong Wu<wuyuehong@cmss.chinamobile.com>

Looks good to me:

Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
