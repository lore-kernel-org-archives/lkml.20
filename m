Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502072;
	b=lB81gvdNpQCDKx2Sc/TYNTGDygM42dbKZkZRYU0+5Qc8GsTZDsYiSS51AG6BkzjyrT+0
	 cwaNy3A4TU9gx/EYuReiVISaN7n004ZR0Kqv7mm0IPrMxZ55pjGNh5Bf4NgSOG8uESd4D
	 suJOL79qzxk1VsTSuhbf9//RNXqNHaQCI7Fc2p10t7VozpAMl5it9/kOsL1eaX1RQ3pKI
	 RtQ16Hgj0C7P0h8wW1ipxsJmv0FqEkg9RZJBVrDXwM/7SNbqGwwTkTel23aNKJ/J5DzXs
	 TAViA6+Si4XTrE89SgLjzy21WYRYII78vJiV+eKgnXLbZJsins2YyX17B0uVwyrT/vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502072;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aHLBow8ll7eUj2sIsH39XczXkWkcXAPRGA5fSNz3K9M=;
	b=cwgqYos5b4W5vVg7dR7DH8JIvFoidN1K3izUdpOxV2PEyYNT+l4IwOODIuB7g8qHBFfd
	 g038JGfm9+OCL5xgW7+1A4YK3TugBydJ0aOq5N39f+sprUBEVKf0ffG7qLzlAePPRYIWf
	 Wj8hhEQZVa1o4N8+y3AGKIMmQnq63z65vraM4We/ZBNqH+Nv+rRhKtyvSI01hOgTMq9RW
	 BHqheMpLzMIAza5opl9OFGfIcFmLPPjxaPlnPwgkbD/CE4XLn1VlzpQY+nWqRy3428aDo
	 R+uvlhJHwf/HBnSJBI6haWgRlLuXLvYCNzS+yDAIDZoB+166jgtebl2EhukpBa/lchA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MwIDoCeY;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31E4606A885
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B31E4606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MwIDoCeY
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFiMSn441811;
	Thu, 12 Nov 2026 16:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=aHLBow
	8ll7eUj2sIsH39XczXkWkcXAPRGA5fSNz3K9M=; b=MwIDoCeYjrQhuCmTSnvljR
	Jg9lmxka799RWLfxGC4MwsE5myPm0RzPw9xLW0O29eupePayi7Jp0SLUZ2bEXfyk
	OwkEgDG9rBPZPgRIDLcX7oJ0fq+Z0jMbdoCa1scUoS/hgR9SQate+WFkt2YdHF/I
	B3hC2/zgusZcn+G66qv1qPcDT/T3bPR1A38QQBugyofY1+3tBSbNf6uLEz9/uu/s
	U4/6wQKlJERXcHlS0Mqji2GMynJ852kiPxE+6Kb6nYiMlM14Ou5f7UWsAcc3CPmR
	VTYwD63g28Nyst3cxLstesjCfv2KDrnQ/wVEnW8l1GQBuUxhhFxmd319j5sHRM0g
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hsug6gjpu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 16:47:32 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFc5bM898457;
	Thu, 12 Nov 2026 16:47:31 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hwd858wae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 16:47:31 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ACGlU5Z57540930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Nov 2026 16:47:30 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 84C3758059;
	Thu, 12 Nov 2026 16:47:30 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40A0758057;
	Thu, 12 Nov 2026 16:47:28 +0000 (GMT)
Received: from [9.61.136.41] (unknown [9.61.136.41])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Nov 2026 16:47:27 +0000 (GMT)
Message-ID: <ed0a7940-4c8a-4767-8ef4-2c52514a25d7@linux.ibm.com>
Date: Thu, 12 Nov 2026 22:17:26 +0530
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
Subject: Re: [PATCH v2 2/2] nvme-multipath: don't wait for a grace period in
 nvme_mpath_set_live()
To: Qiliang Yuan <qiliang.yuan@linux.dev>, Keith Busch <kbusch@kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261111-bug-nvme-mpath-set-live-srcu-v2-0-fc772914d293@linux.dev>
 <20261111-bug-nvme-mpath-set-live-srcu-v2-2-fc772914d293@linux.dev>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20261111-bug-nvme-mpath-set-live-srcu-v2-2-fc772914d293@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XJJVuKkmzNoGmjsf-5zzmKYszzAEZnsq
X-Authority-Analysis: v=2.4 cv=PeVqFShd c=1 sm=1 tr=0 ts=6af5eda4 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=SyHPSGQle83xrfl2-lcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: XJJVuKkmzNoGmjsf-5zzmKYszzAEZnsq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NiBTYWx0ZWRfX4bsFNpezATSe
 SU33Mif5jekZC5LfOyym04bJ98C24UoaOz4yiWNV/Lsy8WkHonuSwj+dUXqQqp9cb54zYMC+TR9
 Qlf2ypOp+YJcNJBP/UxmGtkhPXQBvy3q8fEuOlXNKA9SpbSHu0kQTZFCRxp1tKhf6ofdBKodide
 OaH9bm8o5rCKwM6ojXZCz5nQgSVFOA+LWUZ8Xt+pDg0ZqJH1jaaramd0q+/ApGTGskwlWm/LUda
 kolZHbjqI6gm16CNl9vkUbSYkhXdjhqB56JwSsW+BvR0e5Epxe6MISAOeT0KxnZ13e48SwdOrcH
 10vZ0yJ2hBb3YPt+EMH6vLm7FJKJrBbLzqRCHf6J2HqfY7HqoxakpuBqZ16RUzjKXGe2WHFb99L
 CUWLXD2CDIaIbg1sQOk2DsaCaKkawH87c6Bn5PIhVRXqv/2jsb6chLg59iNG3Apm9eNl6ztrCn2
 iPW8zCnxtt5/fCGXTTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NiBTYWx0ZWRfX6BVqibdTQRCc
 iAOGy+5ebP8zYiLrh9iM2BNGzVQCACMkiBJbBScCyKHuKbKxC56q78RnfvDDtIe6kydMIPjhy6A
 5MO5+NRkYxNkATFTKAY58bnIcz0h4+w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120066

On 11/11/26 6:40 PM, Qiliang Yuan wrote:
> When a path goes live, nvme_mpath_set_live() waits for an SRCU grace
> period of the namespace head before kicking the requeue work, so that
> bios which found no usable path are on the requeue list by the time it
> runs.
> 
> The ANA work calls nvme_mpath_set_live() for every namespace that
> becomes optimized or non-optimized, one after another, so an ANA change
> waits for one grace period per namespace.
> 
> Start the grace period with start_poll_synchronize_srcu() instead and
> have nvme_requeue_work() wait for it only if it has not completed yet.
> Take the cookie under head->lock, so that concurrent callers store
> their cookies in order and the requeue work never sees an older one.
> The grace periods of all namespaces then run in parallel, and requeue
> work kicked for other reasons finds the cookie completed and does not
> wait.
> 
> Flipping an ANA group from inaccessible to optimized ten times over
> nvme-tcp loopback, nvme_read_ana_log() takes (median, min-max in
> parentheses):
> 
>    namespaces  before (ms)          after (ms)        change
>           256  51.9 (42.5-85.4)     8.9 (2.6-12.0)      -83%
>          1024  157.5 (133.5-179.6)  49.5 (32.8-67.1)    -69%
> 
> Signed-off-by: Qiliang Yuan<qiliang.yuan@linux.dev>

Looks good to me:

Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
