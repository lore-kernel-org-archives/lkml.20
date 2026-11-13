Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575354;
	b=oAGgIdYuoxLZvkcAPh9Bo3/VsRCaAIIP9VE2tCgGTvHJklYZEnBq0t6fFGCz5+SsD5oD
	 Ma96Pxu1rFyM6cfb1sWfU3SD+tUiy6pRPNz6zdJ/KjidMlZx4Bz5vCC3bC2tW0w6zzoCV
	 dcN04F2JbyrDYJvly3eMsq9ECQJbBjKGrRsjNB7zZol/8V4PXzkvd0d8VxBZZi+bLC92O
	 aCLgn/a4QPceKjAr9JNZq5szTWTBKy8upmMsJTNplSJf+ryydtLl9AIxiVxE6d6MA4tk8
	 ImA4EyaAsBZ9477aJYu8XURNJRcp7WK3WNFEe3p4Px4RgOqQfPbRQMyxXEqowIg8ytQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575354;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=tSkb2PWbNxaCrUril715HAPYdAX5Cw4kojWt6qrT5aM=;
	b=3CCNkq8TgqP68dGm4drKDWNmUmct/Wq+FI2PSo5wIHLoTw6a7C/UA1nP23ajf3BzT+gk
	 Nm0FZKF2roVXJEGoFjTtWfBxVyyxaTD6XUXQjFUTxJqUgImciyAB3K9VUWo64eZJVEZ5o
	 B5xi73F6n4zsU9ZI6EH7+0tQZtThXtMkIcsrt+YepIM19FJjXOPaQPRLda2hkULlVqpmC
	 gFPvdf8Ouck6mzk4PTrZtVicRwvZ8RlqaZBsVshZaJILcxI3MgiYniYI5vzAHf0K8aBJk
	 fvNFzxu5UZvrFz0Ek3IGvuxnxaoQy3t5rdcGQ26JQAe7J8HKJUpVRvia67HInHQsKDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=w6rz.net;
	spf=pass smtp.mailfrom=w6rz.net;
	dkim=pass header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=YIxnZC8p;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90357606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90357606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=YIxnZC8p
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id RdnSxhwn2AR1iRr1lxEzKd; Fri, 13 Nov 2026 13:09:13 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id Rr1kxD9zquJrPRr1kx2RPX; Fri, 13 Nov 2026 13:09:12 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6af70bf8
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=JfrnYn6hAAAA:8 a=SRrdq9N9AAAA:8 a=20KFwNOVAAAA:8 a=HaFmDPmJAAAA:8
 a=FU8A8_eJsoxy1Wi2mmAA:9 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tSkb2PWbNxaCrUril715HAPYdAX5Cw4kojWt6qrT5aM=; b=YIxnZC8pDNq20OVPYmgUw2Tqy2
	lLZy3k0/ooflpBT2nuJUS4ibYuAJ9r0Krpn2uKSstJbkXuoWOZE1WyPS2be/ba6icdWQV7bN4UeZp
	xjI7nI42PX/0sh/UrzKpntVwCIanrHVc17r3zlCP0nWn9VY4IjFn0iVQxhnStqtcQPgBqq4FwOMOL
	3WvHzCPSsrQSw4EKW4nuUeX2VUgDE4t5vOehJ5K0xTxLZb1EPOawhy5UUdod8tr47idXKirn6EtjF
	0WeXjDyv2+iU92eGsVEZpehhIpWuIiOr3FHlp35PnmRK3i5taHJ8Di5xMPk0p9y8LXRpXPnx90x/X
	ipjJ1zjA==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:46158 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xRr1i-00000004CiO-2UVW;
	Fri, 13 Nov 2026 06:09:10 -0700
Message-ID: <972e8d28-62cf-4f47-9524-5641a9ebfff3@w6rz.net>
Date: Fri, 13 Nov 2026 05:09:09 -0800
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
Subject: Re: [PATCH v2] sched: move stack_canary to the start of the
 randomizable region
To: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <vschneid@redhat.com>,
 Ruidong Tian <tianruidong@linux.alibaba.com>, mingo@redhat.com,
 juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 kprateek.nayak@amd.com, linux-kernel@vger.kernel.org,
 oliver.yang@linux.alibaba.com, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org
References: <20260509035014.2220372-1-tianruidong@linux.alibaba.com>
 <20261106160730.GJ1779021@noisy.programming.kicks-ass.net>
 <xhsmhy0b2ntmh.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <34f2ff11-8156-4c32-91dc-e4576807cf3b@w6rz.net>
 <20261112153427.GV1779021@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20261112153427.GV1779021@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.206.103
X-Source-L: No
X-Exim-ID: 1xRr1i-00000004CiO-2UVW
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:46158
X-Source-Auth: re@w6rz.net
X-Email-Count: 6
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGp9iqkZfUG5Swt4sQVFlSM80GhR37W/SptqWm9SJoNwd7WAOl1u3bHhaA9oVYC3B6VbmmQrSjcgrIlD1myeJ3BM6ZSFBrsK4ZvGHX6ets/Qra3lH+rS
 hsASLQg0xpalU7TyR+5eR5iwjKWvoS1NLAmyIfd5LqmpnKYF+rGOOjuJGcPfv78366nvoto2/DBUthuLQUzLp2L79JWv+E/MHKA=

On 11/12/26 07:34, Peter Zijlstra wrote:
> On Thu, Nov 12, 2026 at 05:33:16AM -0800, Ron Economos wrote:
>
>>> ---
>>> From: Peter Zijlstra <peterz@infradead.org>
>>> Date: Fri, 6 Nov 2026 17:07:30 +0100
>>> Subject: [PATCH] riscv, sched: move stack_canary to thread_info
>>>
>>> task_struct keeps growing over time. On architectures that compute the
>>> per-task stack canary offset from asm-offsets.h and pass it to the
>>> compiler via -mstack-protector-guard-offset=, this growth eventually
>>> pushes stack_canary beyond what the target ISA can encode.
>>>
>>> On RISC-V, canary loads are emitted as
>>>
>>>       ld	t0, TSK_STACK_CANARY(tp)
>>>
>>> where TSK_STACK_CANARY must fit into a 12-bit signed immediate, i.e.
>>> [-2048, 2047].  Once stack_canary sits past byte 2047 of task_struct,
>>> the build fails with
>>>
>>>       cc1: error: '<N>' is not a valid offset in
>>> 	'-mstack-protector-guard-offset='
>>>
>>> On RISC-V, CONFIG_STACKPROTECTOR_PER_TASK depends on !RANDSTRUCT, thus
>>> stack_canary does not benefit from being in the task_struct randomized
>>> region.
>>>
>>> Move the RISC-V stack_canary to thread_info, and introduce an access macro
>>> to point to the right stack_canary location. Other archs are unaffected.
>>>
>>> Not-signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
> Signed-off-by: Peter Zijlstra <peterz@infradead.org>
>
>>> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
>>> ---
>> I'm seeing this build failure on RISC-V with gcc 16 and
>> CONFIG_SCHED_CLASS_EXT=y. The build does not fail with gcc 14. I've tested
>> the proposed patch with gcc 16 and it builds and boots (on real hardware)
>> just fine. So for what it's worth:
>>
>> Tested-by: Ron Economos <re@w6rz.net>
>>
>> Also re-adding the RISC-V folks.
> Hmm, they went walk-about? Do they need a re-sent? I'm thinking this out
> to perhaps go through their tree, given they're actually seeing the
> problem.

Yes, a re-send with the new subject line would be good. That way, the patch at least gets queued in the RISC-V patchwork.

https://patchwork.kernel.org/project/linux-riscv/list/

