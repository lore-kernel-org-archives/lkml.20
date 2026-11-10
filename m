Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274254;
	b=ezfEY5aRdbhdQMEXFWmZS7+R+3ytH2QW5qWOFXjC7TEqCG9ec73kVFThCTrVCXYVfZrB
	 YtXHoxL5qRDgp5Qw5UitvGnX3dMQCYuxB6rTO8s4QPZ0PhP3VsiKACenpIgTdGefVNJio
	 G+wkT4ArsO0ZhKKmD2GzfuW3gL1hhnhPrrPm43FEfhVF9atuwgQX6AR86G5fjb4xWRD/r
	 H8Gcb8Ha8V+QJV0HjuJyFLbFnXH1aNsAfFMl8zviKkWUMIxXcrkkqqL6WlD+SywuAv9+9
	 q1eZKNUWGLikyP01bRCorq63/qkM1Ldhk+J95jQ5+J4PQojsK4k35cZo06MjUAzwWtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274254;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZPcy8FDzorh0LfNIG6y+H5abHSeDBQ4QbkpgoHWq4dI=;
	b=pnHfnUaOxj2SUrxp/8r5UpHUD0BtgX9A8Sk9mTvOrWJF+LeMucvW2yXPpcLRCfW6dQv5
	 KOnKsd/WrcwCWhNDBGUyzCCk9hunrPw2OICmOyWgh4gWL8dGX/Y6+e7ZMjlvfAr+6vwAA
	 jn47hJ4ZWZUY0x1fgSFYVEXZd87oc+snbC2ddylbUTPpB96lzoo267fMmZHW0w4zJj0TS
	 IxurczKwDcb/M8re11MDIyRjXZZ1DszrpZ8gNiJcXldiPg0U5g5VYQa1cv3yqMyWvuLsN
	 sVpTikG2OhDtG+EEKT2nVwVskp/43Hx9MgQrYztxKUYQauN2WlLMIBOMKGQqgbMyhfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gMX1aW9X;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A5A606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12A5A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gMX1aW9X
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0iHNB3480549;
	Tue, 10 Nov 2026 01:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=ZPcy8FDzorh0LfNIG6y+H
	5abHSeDBQ4QbkpgoHWq4dI=; b=gMX1aW9X6ohnVkE8SU08XjX/O28CrERTRUPM6
	o03pSnLpIO2kg1bXI+tOZjjRilWicLakNJlYG3BDZ1YScO9WilS3oWcMpBxnewDK
	xDjyHBHu6VMayfKyauRmHvszfP8m4EIAkmZcSvt3D9zrM0a9IWUtcJ8lAm8i8dj+
	cC7uQq8DDaJXFbfdsrddZZiaf4+8zO+K3jjnDIb7R5KGdE0dCaOClVKQZBGkGunZ
	YZn2I10nUwI2QCj50XSUGlXLhpArdNwrZZjAlTkQ3V8n3iTV8PBCQ+joktk66llh
	YiC+VdbbBZD3fo9NO2ovZ9kCu+avPEGKw3utdbO2MsjnrHrbQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hsunt2m8x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 01:30:23 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0ofu61091587;
	Tue, 10 Nov 2026 01:30:22 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4htfthmgp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 01:30:22 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AA1UKsb30933264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Nov 2026 01:30:20 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D2BC2009F;
	Tue, 10 Nov 2026 01:30:20 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DF3820099;
	Tue, 10 Nov 2026 01:30:18 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue, 10 Nov 2026 01:30:17 +0000 (GMT)
Date: Tue, 10 Nov 2026 07:00:17 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Juri Lelli <juri.lelli@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>, Mel Gorman <mgorman@suse.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH] sched/fair: Skip sched-domain traversal when wake affine
 is disabled
Message-ID: <avJzqQEpKdU-GPrQ@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20261109120522.1704752-2-srikar@linux.ibm.com>
 <avHZrLRHmIgRu-a7@scheduler.schedules>
 <avH1WCeG9_O83U7N@linux.ibm.com>
 <avH3rQ4W6d4jfny2@scheduler.schedules>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <avH3rQ4W6d4jfny2@scheduler.schedules>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNCBTYWx0ZWRfX63Op1gJWxEPi
 W06XgyvDvTsnYUQ/q4QvEfDVP7blyVoQlk5ru1T1q/d4OeZGWMkCt49jBdRb3qw9Z9dHI8E12OF
 TUyly+f+Lunf3f7eG2l89GXTZ36Bm6qPxmlCbqkHZ/1MunsjzsD8jKAPjHWCaeZdkgjU2yfX1GJ
 y9JO+sJ+/9A2FxjZZeAC+HcdKQ3H/Mw/y8w3mA0emfZz1d9fvaaMkDiT1xTn+4Tj8SzvkepDHJ+
 2Ouwf4tQBSSS9vNToVLZuGMKkK09Bhel/my5AwwcbHy7JHs2XiCzE9BBWWyA5M+UnPHQEJjhUE3
 1H5WoG6NnG0HKN40OlfIvo65YB397g4K8rC4rc2CkTguURM3t9z8QaCGPlZgsRC/KrVJgoCxD6x
 DHK52Qq32bSYxY6IhMGMCJS2gM5mFcd27MJYxQBSOGXfKaI2LlNQpdd43QmSWeXowMGLjRsCUGy
 YR/IBls45ePWHwc1XDg==
X-Proofpoint-ORIG-GUID: 79w8Nf_6MnBSd3MIHVneLM6c83kh1_vF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNCBTYWx0ZWRfX3m+pmbTRrjgh
 WYxhr6/Zh2eH7BrgpWcyJeCPifRJaGyQ1ZWGU3wgS4FuxQtYap8iKmF+5QaemgcLeGqceCvbUje
 TJ1MAjwjtoWpcD+h/+fs+sAXZ85dtDw=
X-Authority-Analysis: v=2.4 cv=euZKXYpX c=1 sm=1 tr=0 ts=6af273b0 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=pGLkceISAAAA:8
 a=oQ-zSjBuwacdp7I7bZgA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: LDOWQu0jNQxlrNLfs5NTXYMWIJySiy6l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100004

* Kayra Cizmeci <kayracizmeci@gmail.com> [2026-11-09 21:10:46]:

> On Mon, Nov 09, 2026 at 10:01:20PM +0530, Srikar Dronamraju wrote:
> > * Kayra Cizmeci <kayracizmeci@gmail.com> [2026-11-09 18:09:56]:
> > 
> > Hi Kayra,
> > 
> > > 
> > > On Mon, Nov 09, 2026 at 05:35:22PM +0530, Srikar Dronamraju wrote:
> > > > In select_task_rq_fair(), TTWU wakeups for which wake_wide() returns
> > > > true, or where the waking CPU is not in the task's allowed CPU mask,
> > > > want_affine is set to false.
> > > > 
> > > 
> > > 
> > > This just changes the behavior.
> > > 
> > > Old Code WF_FORK 1, WF_TTWU 0:
> > > 
> > > want_affine = 0, so we skip the first if block in the loop then leave
> > > once we find a domain without our flag. And go with slow path.
> > > 
> > > 
> > > New Code:
> > > 
> > > want_affine is moved away and early exit is removed. So we enter the if
> > > block and try to find a domain with prev_cpu. Because WF_TTWU 
> > > is 0, we just return new_cpu. Or if we can't fimd the domain with
> > > prev_cpu, slow path.
> > > 
> > 
> > When WF_TTWU is set, we are always suppose take the fast path.
> > slowpath is for WF_FORK and WF_EXEC.
> 
> I know. And that is the exact problem with the above diff :-).
> 
> Like let's say prev_cpu is in the first domain we are looking, the
> domain has SD_WAKE_AFFINE and SD_BALANCE_FORK set and next domain has
> only SD_WAKE_AFFINE set:
> 
> Old Code:
> 
> sd = first domain and we enter the slow path with the first domain.
> 
> With your patch:
> 
> sd = NULL and we return new_cpu
> 

Oh thats a fair point, thanks for the reviewing it.

> 
> Or am I missing something?
> 
> Cheers,
> 
> Kayra

-- 
Thanks and Regards
Srikar Dronamraju
