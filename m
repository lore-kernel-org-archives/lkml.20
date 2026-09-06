Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7734A126C02
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 19:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788722923; cv=none; b=sOVdVOh77kCIqPfd4GTq0nRXr0VDjo5GTUjs8Zr8avQdKLXVNY5CpTuLa+0NsQQaHcLdPZPpqrJyTj7MdXvApAJOJNbxnkoHBOewQp2l0FKrCunILZLNRySfO9sAZNse7PgXDOolNQJsUkvRwU4aHLSk+wjpHRaWOtp9k+MtFTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788722923; c=relaxed/simple;
	bh=zLxniDw8WZZddK1JTbNLn8SqeVMkjztGsau6u84UeIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ro1Umar6tuM3VlzQdkDRbapdmg5hjvKLqKHuvHS8+fIGAprYOTOHsm9tm3AqKKUw2wfwzDwYSy0baXtrc3TdIhnqD+L1gZJNjgLP8RzMWsjQgL9atFwH3NOFi3hVgT/c7ZoVmt05k3dTtmGWCNBydMaxXwuHNRyyh+sySyU0mdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Fxke51h3; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Fxke51h3"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686I1S0q3769311;
	Sun, 6 Sep 2026 19:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=KjdkTI
	NiXX8wT4cx3Ked97C19pwQrTb4XL91r+AfNUs=; b=Fxke51h3CfvfatwYTswk5K
	CduAzzjDD+5UpiHIYFdinUQ/8qlzlKX/aMb/NQO0QfT9CMCHxzVXXre4rXmQizln
	1An5/altgXgomtYR/XL/hWsRuptG8+Y+pWMm80AfA2NaUIQDpPEYiwAPtKcmyadh
	RU8EfCdnQKJLvRDGyToQcMwTWlWStNxumBoTKv7qbQ0PniyhVR+qFKYQNxeIe7kY
	8pzSAbfw+FHKLzVxO8jPuytveFmYh0LmxciFq97tkYFAS9O3wP0vBIOZ2IIusILd
	uML/74WynmR67jZ58iZ/an12HwvDxvsp/dTOqlDaTUV9nXUo29iZRnD82aFcjg9Q
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ggbf3n3ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Sep 2026 19:28:28 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 686JQYeu021382;
	Sun, 6 Sep 2026 19:28:27 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gh03y24xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Sep 2026 19:28:27 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 686JSP3C50397656
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 6 Sep 2026 19:28:25 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52F5A20049;
	Sun,  6 Sep 2026 19:28:25 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DDF920040;
	Sun,  6 Sep 2026 19:28:25 +0000 (GMT)
Received: from [9.111.65.132] (unknown [9.111.65.132])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  6 Sep 2026 19:28:24 +0000 (GMT)
Message-ID: <2eaa56ab-7013-4fc1-99f0-db9c7e4b5c5f@linux.ibm.com>
Date: Sun, 6 Sep 2026 21:28:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: dynamic: Fix preemption model strings
To: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>
Cc: ruanjinjie@huawei.com, sshegde@linux.ibm.com
References: <20260902101637.232129-1-mark.rutland@arm.com>
Content-Language: en-US
From: Mete Durlu <meted@linux.ibm.com>
In-Reply-To: <20260902101637.232129-1-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -AomI9pWDuMHFao9XcY2pR2XxF2aU9MQ
X-Proofpoint-GUID: -AomI9pWDuMHFao9XcY2pR2XxF2aU9MQ
X-Authority-Analysis: v=2.4 cv=DbEnbPtW c=1 sm=1 tr=0 ts=6a9dbedc cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=i0EeH86SAAAA:8
 a=7CQSdrXTAAAA:8 a=VnNF1IyMAAAA:8 a=uK1rU7i6nPk0lVewyPQA:9 a=QEXdDO2ut3YA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDIxMiBTYWx0ZWRfXxaFcQHyO4xpI
 +qO83EJySwGkBBhu2d4wdrVAoZdK9YrNDGZRY7uAmO3pyYZa4g7jW53IZ8oKb81GI9aytzCmaaz
 w1Byn6t/DVIF6mAil3LqMA2tNzeU9yGw4Z1pWkO2IOVndKSi2XnYCLz8OBx1sjij88S5El5AdiF
 ke5Dk0MTBOpRb0+b8QIAAYHfRBVG62IyI6thJBQaJJPPoxh348ky1b2kHovRPc2yNigLN5iTSnx
 gyvHJIMvswFH5sLrWrqGg/xIjGoy5qTaqzUBGbvQPFVCvApPYiYjbu018kkhVtenKAqxe76BuMy
 GHdYXPmDRG2YYaDTjEtXcJezxWtA+TgUX/Vm+GCM0lVnaO8WlQ4Q0My9zgK/LzIcA+5c43gVA+l
 fju4uEEIS7f8WCKYUWr6uBVe9I8EO3H30+CCaLMLS9VU08mPHrQX+kzCW5W4LWlEYbEG3maa0C9
 PUgnZL819VkRwsDTG+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDIxMiBTYWx0ZWRfX2ejBJlP5m+lH
 +OPQCeHgEhfJAteCOn5FGZtJSMgRSZqaMmFDdUiIKTN/ncgbGKjcPEFQGtvz/IndLNFGm5O5liL
 BntxZKaS5dkOfk/dC3nLc0RhDwOQx+A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060212

On 02/09/2026 12:16, Mark Rutland wrote:
> We recently removed the enum values 'preempt_dynamic_none' and
> 'preempt_dynamic_voluntary', but forgot to update preempt_modes[]
> accordingly. Due to this, preempt_model_str() and sched_dynamic_show()
> produce incorrect output, with the wrong preemption model string in
> backtraces, and empty output for /sys/kernel/debug/sched/preempt.
> 
> Update preempt_modes[] to account for the removed enum values. Given
> that CONFIG_PREEMPT_DYNAMIC now depends on CONFIG_ARCH_HAS_PREEMPT_LAZY,
> and given that only 'preempt_dynamic_full' and 'preempt_dynamic_lazy'
> remain, sched_dynamic_show() no longer needs to skip any model strings.
> 
> Reported-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Fixes: 9650ce11f2e3 ("sched: dynamic: Simplify preempt model accessors")
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Hi,

I did a quick test on s390.

$ echo full > preempt
$ cat preempt
(full) lazy

$ echo lazy > preempt
$ cat preempt
full (lazy)

The sched_dynamic_show() output looks correct now, and the
code looks much nicer without those conditional indices.
Feel free to put my tested by.

Tested-by: Mete Durlu <meted@linux.ibm.com>

