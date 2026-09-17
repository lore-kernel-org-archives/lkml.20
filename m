Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7203FD132
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633118; cv=none; b=m9XEeoMmtHV+GOfepAOuUUhk++EEikasaaMU2sZnCv/G4vAO0d9/05UrkOJtDkMuYtVjNy97uryTpW1wOGp4C1US7XxZCCHIpopmvygNrj7hISJC9dZPGK1an64hv4hOAwxLXFIWGJfCu9YirRX6KE1Ns8xf/fG9B8+JUFvZyQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633118; c=relaxed/simple;
	bh=4ocjy1dGZ1toaaX1PycCPmtpVd7zUt3f2BDTmhY3hxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMwWIKyaTbs/c+8OS2/g6byiEttGWVszVn/FtHFG8NxXMlj3nFDCGl9HeLTldYrFjMcQq3D72z3X45vxp1dPuWriL1JlFFBRx6kgrteuvXFTbgZlnYwCbH27KmnXhxjKtM4LOAelTEiwhMZtttA5Mi2Yt9Lu8qKF1RkJnoDAGO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=HYL0SNhi; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="HYL0SNhi"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H62r3s543883;
	Thu, 17 Sep 2026 08:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=bNc9Sx
	eMPkWE2pu814W9u/sSRhnubnpaFwSHoFKsqnI=; b=HYL0SNhi5itJS/QwpCdxbC
	eJ1n62g8/ksh6nhgRayjhaq3ZSStBges96lgkaYg91H4HIe6m651l954Btt92qbn
	PybBuNz2xqNWcy0prIj7HIMe+DoxEMic6F/PgAKH82/zjWTUK1q8XtHsSJ2yyufB
	751Te/D6yCcASJNnel5ck4KXe5wiHt8QoQnWfi1XGnAUaQEaukkQR12EDANbUozs
	/4CvSpjr8lACTnfTBW4X94DD0RfKbLJP4GlQ4vZYvPQQoDnBxmexjwgrvCnCLP8j
	N5X1nlJPw0oaV4FARnzrPtEFlAUiJvrZwYP3tCTAqhL11k+U+2kWb6atzMnX/Mtg
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmw5e8uy1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 08:18:20 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68H654tT3619009;
	Thu, 17 Sep 2026 08:18:19 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gr7geh36a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 08:18:19 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68H8IIgt66453768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Sep 2026 08:18:18 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 788D05805D;
	Thu, 17 Sep 2026 08:18:18 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BEFB258061;
	Thu, 17 Sep 2026 08:18:13 +0000 (GMT)
Received: from [9.123.7.57] (unknown [9.123.7.57])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 17 Sep 2026 08:18:13 +0000 (GMT)
Message-ID: <59ea761a-9063-4080-a653-006b10bf4d6c@linux.ibm.com>
Date: Thu, 17 Sep 2026 13:48:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme: work around -Wformat-security warning
To: Arnd Bergmann <arnd@kernel.org>, Keith Busch <kbusch@kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Maurizio Lombardi <mlombard@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Hannes Reinecke <hare@kernel.org>,
        John Garry <john.g.garry@oracle.com>,
        "Martin K. Petersen" <mkp@kernel.org>, linux-nvme@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260916114533.237863-1-arnd@kernel.org>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20260916114533.237863-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEwOCBTYWx0ZWRfX5OsBoHNZE+mE
 PIvlWZTx31Qc8Gsw0z7/66EN1P2GPoA89tV06MbyFq4ueKUKX71e0B7uom/5t6wcaDBAnKkh6p4
 Z9WOGk1QTm+jjiuSU3TydYyi85mzVZ71EmV9lG8G+ztsUzQNMzLwcnGi2D3uJ1In9gtXrIJTsMQ
 w4w+aX+3l/fV5exdzWF7LQj16i+2n7FcAyoPiKJfM0gKQks2Gleksw11O61wE5Pzski7IlhMfj0
 wgv/G/QAxOkjUKETC7M9VSH58ne/HBGsAKf7Snh+aV7qsVT4wTxoEYSn5G/y8H7yY+tcn0Zk7mu
 rr5MOKVVxiZkBqz5YxXlaGr5YabKU/OUcVzEXGvQA1FRliCh0exScSlLQcek+AR4avbxEAX0+++
 AoC54YCkq6cBGlguA7caaSBAfw6oK6kaAPpxGKpuxC82ei4QlQbeyhuNukHnr+53P+VAhyHkMEz
 Gy3krRHUZPAQSTz3oGA==
X-Authority-Analysis: v=2.4 cv=E/NYNqdl c=1 sm=1 tr=0 ts=6aaba24c cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8
 a=TVXpOtnEInQrzbVAg1AA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
X-Proofpoint-ORIG-GUID: m49TgpsSjZ2XnFhABsmD8AIUXfMKA3q8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEwOCBTYWx0ZWRfX14rt3zofN7cX
 9rg3ocJ4v5NoqzAlIPDT0dkVyTs1iY0fY7RTDL5IaAeKX3C0kt+/+P0dJtLLCdw3ZbWZlRhiBNY
 cqVP2Ji6/MX/MkPca1NMwDZuCciXgAA=
X-Proofpoint-GUID: m49TgpsSjZ2XnFhABsmD8AIUXfMKA3q8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170108

On 9/16/26 5:14 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann<arnd@arndb.de>
> 
> Passing a string variable into dev_set_name() causes a warning
> when building with -Wformat-security enabled:
> 
> drivers/nvme/host/core.c: In function 'nvme_cdev_add':
> drivers/nvme/host/core.c:3911:9: error: format not a string literal and no format arguments [-Werror=format-security]
>   3911 |         ret = dev_set_name(cdev_device, name);
> 
> Remove the temporary strings and let dev_set_name() do the
> same thing internally.
> 
> Fixes: 26acdaa357cd ("nvme: fix crash and memory leak during invalid cdev teardown")
> Signed-off-by: Arnd Bergmann<arnd@arndb.de>

Looks good to me.
Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
