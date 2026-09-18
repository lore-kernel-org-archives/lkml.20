Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12F337E300;
	Fri, 18 Sep 2026 13:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739783; cv=none; b=MTpqqNHEVOm6dh4a5O4N+u+gajhxK91GcjrZDrEB6IWKkSTuE0iAw6zL4pN6LJpq678pZkv6AsqflvvoYdAPR91jr/Da/JopD46RFxq3BaeohrhnJHxiiXuEwlMBjdBkKn8qr38Df4LZP1UTeSJE6Y6w4aK33tvcNP8Ysox6KAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739783; c=relaxed/simple;
	bh=cUSLIxcX1bk3qYNVJ5l9prXJ06yW8o5yz0p0t49QLH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PI43WM6iZ5ZSaeBym8ihasxDTEMopgQZbws83qQnQUp/AekFB3IDPZKwiGK/PMfhU0qF/L1OR/NtyIms6gC6xWqwIScR46HwFX1TAnRh6Td+2AY9MA/JH0qlmRtuBY1cYTy/ORZ+bS7pwsUg5gXmngL51Q52n3aLm5my+JPE3i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=rOMt3O3c; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="rOMt3O3c"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDVW9j3708576;
	Fri, 18 Sep 2026 13:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6G+4dE
	4cMS6MV+wifqFoZWtP9LfKTFKwf+NdL9fiYVg=; b=rOMt3O3c70Oe+gZKmylKe+
	aYsGbULQGEmPRJ7TfZAr5YPElbyHh93+KLunbOXrO31bBAEOBQnTp6jtbJnNXoMS
	r6TWaR+kJ1tV8MC2lusNce/kh5VN6vW4+zRjB9wTuvwmUVhsJEdN+wYJlZdpJhd+
	0+AEvFTvCy4+QottyRQ+fv/zdkzgltM0Q7e33uT0tkIPIXfJH0N3nD5qIw0qaYZx
	MKZ0b+zht/26x03EAVGvIE4gBBG4w8APfF1VwnZjG3WCd59kqsCwn8BHus674Gft
	+WjyA8cz9bDsY1nWoMzcpnWH/s0pLNKBQAmU1imvac4jxKPCWVu9ipCzThzBp4Kw
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmxdqre9h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 13:55:44 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOCVZ695835;
	Fri, 18 Sep 2026 13:55:43 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gra3fepdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 13:55:43 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68IDtfQn44040468
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Sep 2026 13:55:41 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7245B20043;
	Fri, 18 Sep 2026 13:55:41 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B3DC20040;
	Fri, 18 Sep 2026 13:55:37 +0000 (GMT)
Received: from [9.39.18.35] (unknown [9.39.18.35])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Sep 2026 13:55:37 +0000 (GMT)
Message-ID: <1a0997c8-844c-48b8-8a66-47bfae752a09@linux.ibm.com>
Date: Fri, 18 Sep 2026 19:25:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/2] sched: Document WF_SYNC wakeup placement
 semantics
To: Peter Zijlstra <peterz@infradead.org>,
        "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Shubhang Kaushik <shubhang@os.amperecomputing.com>,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
        Christopher Lameter <clameter@amperecomputing.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-sched-wf-sync-doc-v2-0-6d1f107c0596@gentwo.org>
 <20260917-sched-wf-sync-doc-v2-1-6d1f107c0596@gentwo.org>
 <20260918113349.GM776954@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260918113349.GM776954@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5MiBTYWx0ZWRfXyPni4C+ozXnM
 qmUxgnFPlWH8E3bK+/DvZLSPNAyXE9xXG5myetatKrIYVdYTnCnnVQbWLOWNzrBN2MCsBz+srVv
 eV3zOT3ORGAIP1z1siuPJTXEAmaVlGa+hLgM324ImVNLIK4ZlFhHBgWY0m+KBZGnG19Vj//6WTK
 IEEaBP6aRSnJpJ3yfPZgnsjA/AglnpWdyODlclobJkd7Q/Ou8Jqm7CZUvmE06DdW4XRB7galgN2
 2Yq5Ps8uzCO/TEmUtHCVf8f2G975cf2epmcOfkhJqlTfoP62BobwkGflJ00WLbn7kc9QzxAsCA0
 zxbZzAshjs3XEdzXnAXOBXpfepBflJRXe5G5vNqlnUFG6NwVquqyl331R1SsV8/gOI9MgaLKtNS
 /xYaIqUhLJpRWgkiWyeqJ8ORpdXv7YSzlTlyfkTNyV5glko2nEoFTlEGeeBSyoEekBRmwys+SVl
 K69KWgJLz/NE1L42+0A==
X-Proofpoint-GUID: gZ4syxm7viqt3LIhchWmRh8BIL-DXoeL
X-Authority-Analysis: v=2.4 cv=DobDa2/+ c=1 sm=1 tr=0 ts=6aad42e1 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=PuvxfXWCAAAA:8 a=Stw8hEXxhGw3wwcJXJoA:9 a=QEXdDO2ut3YA:10
 a=uAr15Ul7AJ1q7o2wzYQp:22
X-Proofpoint-ORIG-GUID: -74rJNWyHWjJNgydmV5sIPhzJBQJD17v
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5MiBTYWx0ZWRfX3l4EUixD2VJI
 BrYys871kPwDcI8xGCPQVvmZHjql/5jJ1ed+4DkeyV6ekMN6DQlC4PVpR1jNYKVM23dRPts4PL+
 YW9W4NwmV+QrvTZsMw3vSoWQAOsf05U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 clxscore=1011 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180192

Hi Peter,

On 9/18/26 5:03 PM, Peter Zijlstra wrote:
> On Thu, Sep 17, 2026 at 01:43:24PM -0700, Shubhang Kaushik (Ampere) wrote:
>> WF_SYNC is supplied by callers that expect the waker to schedule away
>> soon. The fair scheduler can use it as a placement and preemption hint,
>> but its semantics are not documented.
>>
>> Document the stable fair-class WF_SYNC semantics. WF_SYNC is advisory:
>> it can influence placement and preemption, but does not guarantee CPU
>> locality, avoidance of migration, or immediate wakee preemption.
>>
>> This documents existing behavior only. It does not establish a new
>> WF_SYNC placement policy.
>>
>> Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
> 
> *groan*, why not just a comment that goes with WF_SYNC? All this
> documentation stuff is a dumping ground for bitrot.

I suggested to document this since there were atleast 4 proposals around
modifications of WF_SYNC and it was very confusing.

Did you get a chance to look at below abuse of the sync api?
https://lore.kernel.org/all/20260714013940.4068189-4-srikar@linux.ibm.com/

For that reason, I think either document/comment around what's the expectation
will help. Either scheduler need to account of all usecases of even when users of
SYNC misbehave or such callsites must be fixed and SYNC behavior can be kept minimum.
