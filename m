Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A7D221FD4
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789307893; cv=none; b=j5+eQVMYcGoHVMFDxwBje7b+fy6ZReREG1nrl/7WuZnac3WfozYf7XIEhXhb4s0E5rMnK1ChgMIqAiLKU+VWJpNrsPyt8GPBTrfetcyIPvw4E+0uMZcH5i3plKrvWA0kKG7XDnlYnLw52KIVNDhrk1yOuQZp3enCfH7TZ966vHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789307893; c=relaxed/simple;
	bh=7k2fALXjMemKot5PgvTbznxJdfG1OmIejIaotKrymGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CM0OMiLN3omVDdCcOMHtCPiYiYNnkUXo5BIWSZhOeRyqrWDv0D8bl0pkKaDxecrOHuxbPyVaYa4ywCM7y1bOdA8zB/kkKjyEBXfsnHWHjALMKQwyb2AUYWI6Mk6isUIEEV1ijc7zJ+SV10E9rilMWZBTM6MqNG4lj6DtC6Aec3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=XXxB//rs; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="XXxB//rs"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAVbDs3137470;
	Sun, 13 Sep 2026 13:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jo8qFX
	GcbZ1NuorbWCYPNtuTHAkOa40yxZYqR2h+A40=; b=XXxB//rsaCUcsPtJ1thW3W
	vQa3/nJURplneZMahHE9wZ2c2prN8dDJqW11vLx3foLSV/cLi+ZQsFixwfzOgrEd
	pagnh2ua1CMNWy2mOfHNVtAVRbfjyDy2xYT8XvjJDF37vpqngsYuVmp9ohNuMBij
	GQqfQSzYaDGFTgCWCrP9TUdYonafzGRa1m8JyhaAror+AR1NoOynqSninJyJnIUX
	FID234JsjUwwHnReHKHwsWbCtblMODUoVGpa+QYsTyf3XlbEGSS0bI5VHTAvVjHV
	J3NLE5Y2SqzNrb1PMx8sYqpcEqkccIXoPngYPZMrGSr/CjDEBFh/JE3/hEGTUpVw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmx83csuv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 13 Sep 2026 13:57:57 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAZIHW520489;
	Sun, 13 Sep 2026 13:57:57 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gnjjghhke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Sep 2026 13:57:57 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68DDvukT29032982
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 13 Sep 2026 13:57:56 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6234158055;
	Sun, 13 Sep 2026 13:57:56 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C69B58043;
	Sun, 13 Sep 2026 13:57:53 +0000 (GMT)
Received: from [9.61.162.129] (unknown [9.61.162.129])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 13 Sep 2026 13:57:53 +0000 (GMT)
Message-ID: <bb85c786-9dee-48b7-9ace-b387092fe528@linux.ibm.com>
Date: Sun, 13 Sep 2026 19:27:51 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lockdep: Fix subclass resource leak in
 lockdep_unregister_key()
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Waiman Long <longman@redhat.com>
Cc: "Shin'ichiro Kawasaki" <shinichiro.kawasaki@wdc.com>,
        Geliang Tang <geliang@kernel.org>,
        Bart Van Assche <bvanassche@acm.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20260727182312.3750145-1-nilay@linux.ibm.com>
 <4ad8d6eb-aa40-44cc-b72d-60cccf590809@acm.org>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <4ad8d6eb-aa40-44cc-b72d-60cccf590809@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE5NCBTYWx0ZWRfX7U0QCpkhStL1
 co4hYlPqVkZNxFLsjK/Z2wJJDmsnm/mVXuOZnMKYLfGV3TuUt5mB2mlg+kpePMq3dFJn27hzfjR
 lNCX6CvM8KVTCjuhEtLlNf+2ZQPpz/r4oGZCXKx+vv537fslRRnc/sRsIlI2KxlcC1yFMtdWc7+
 hDVRqKUv4DCA5ErqyeZg3PsBhX3qkI6qzmTr+ChedRaDeMIc0Wo5WPoAEFTsVKsWlRVOAEL9h1W
 SUHMJ4GkfjiuHqETRW8a+5bHWzaw7pDgY6c7dBaVQW97VpKYSUYEdxUEE3stYDzXkMiZL3H+WL2
 QTIF3Y/VbULgCFf72EZGHGRZ275mDiCNNhRAKYFIKwT4Q66Q4DxYtvsnP/YAtEBs44neae6SrNi
 8ggHdUUou0cXk9BE/hurd24Tch0iaQKLRXiwZJfjhn0sctvwnEfKkoOgY5+cHiaHKQpoRczNK0D
 fSi5frcpLJ+taWlEV2Q==
X-Proofpoint-ORIG-GUID: NPPC4_0dHr3QEZBYsa645aVyjHSxtuuh
X-Proofpoint-GUID: NPPC4_0dHr3QEZBYsa645aVyjHSxtuuh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE5NCBTYWx0ZWRfXxV9YZMN5552w
 dEgOhwb191z8h6jDmgAF9SI7fL/N3nV7IIo0VEgciP4i5x/i+LUv68qVOwulQP4Gz06MW2Csxot
 c3G0T6+FQSMS24B3dkDyumd0c59NWig=
X-Authority-Analysis: v=2.4 cv=cY9HPXDM c=1 sm=1 tr=0 ts=6aa6abe6 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=N54-gffFAAAA:8
 a=OqdOqdKVwiPZYjrvUYEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130194

Hi,

A gentle ping on this one...It's been pending since quite some time now.
Does this look okay?

Thanks,
--Nilay

On 7/28/26 1:21 AM, Bart Van Assche wrote:
> On 7/27/26 11:23 AM, Nilay Shroff wrote:
>> Fix this by instructing lockdep_unregister_key() to look ahead across
>> the entire valid subclass allocation block range
>> (MAX_LOCKDEP_SUBCLASSES), ensuring that all related subclass matrix
>> definitions are completely zapped alongside the primary key.
> 
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> 

