Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.147.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793217528;
	b=5nnaSZSj5xLFmqfzmxwJUb3kBMXEM6zn3usnfqTEiDRvUBUMWMS8YhfsoyM/7w3sEZXe
	 y3/OYoSOZAmYePeb3FI4bYARP7af8QU6Fh1hu0GkyvTWSA/BFUu92vN7XJ9CLjG5bQasj
	 b86uWX2TomNaRtz/M7gbFmbmGvA9cFWxt5dbYLBTDQFM+Ei9kS69X3WGo9scSIYSk554H
	 eptPuab8UNpScmcZX8HnC3FYrTkMK+STiUoza7BOer32s1MmeVdz/1GjCj6kJSMLGlU9O
	 ufi7gcu68hWSVQNLqmsodFis0v8EqbasuaRonqvgUIfWCqp85Pk24O893isDgonrdiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217528;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-HPE-SCL:X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mxn1gPj22FgO4CHzh182HhTBDqh1nVgenq0MpGHWIDw=;
	b=GCJnjyb/hfnNStV91mNUXKnQaqw8M/aD54FoB18qV1/OfraPKrxeyizjO4ZHN0ARPBKQ
	 oK6JKEObnaTaOQ2ZwqVjvGIEeEEIXVKyoasF1d8PvfgtF82Qw12le8SMlkWCqf2qvmxsx
	 y27ZmfvL1ZXf68XBBYA4S7v4aaJSUWLegSVsNXvsc0xjLAWe/PZxzy+tve021Z8UkpICM
	 EQLtatngHewyHLU9hz7Wa6rJW62xjD2ko/JM2jpMdzCLq9BAtmMCflW/3Qq+1l+NnnmHZ
	 lcHbbjgmsHS/2/TnU/gglNw7D5+TwUUiSLYC0uJarM0Fzo5ZlVJjKMqZs3YRBDfq3dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=a0BBNXVP;
	arc=none smtp.remote-ip=148.163.147.86
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69256606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69256606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=a0BBNXVP
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SJsbHu366361;
	Wed, 28 Oct 2026 19:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=mx
	n1gPj22FgO4CHzh182HhTBDqh1nVgenq0MpGHWIDw=; b=a0BBNXVP6H7afAK2Ft
	+riufGzoGCdC7786X2z3iMQdbaH5a+QAj8mlH7PPwiGeocDTGiKl0ifSgmY7mBLS
	msQtCHtF2loCGxBS9puCbeGBqm7wuqZ4KYNBBC7iJ2MoVQc2KZGP75VgmxdSg0jk
	LwovtXQOthmCJyF88iOm6xoZ8XRaV+YB0zjFHgIWSXRTM8ml2FNW+CeS/F0Eu2ll
	pH3oHeB7rToYBjExauJ3lvnegFKkKo33IzLDh5J3iJbu7t2reegleM/WndD6GNem
	wI1bWwTHwuQVGpYitpnjjF8mrhfqFwJ/rAPuNv95ydvYgZbTITgmTheUGmNRfvqm
	nodA==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hkqg9g57e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 19:58:17 +0000 (GMT)
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 0879C800EE5;
	Wed, 28 Oct 2026 19:58:17 +0000 (UTC)
Received: from swahl-home.5wahls.com (unknown [16.231.227.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTPS id D2B9E801FD0;
	Wed, 28 Oct 2026 19:58:14 +0000 (UTC)
Date: Wed, 28 Oct 2026 14:58:12 -0500
From: Steve Wahl <steve.wahl@hpe.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Dave Hansen <dave.hansen@intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
        x86@kernel.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, steve.wahl@hpe.com, justin.ernst@hpe.com,
        kyle.meyer@hpe.com, dimitri.sivanich@hpe.com, russ.anderson@hpe.com,
        linux-kernel@vger.kernel.org, mhiramat@kernel.org,
        Matt Mullins <mmullins@fb.com>
Subject: Re: [PATCH] x86: Drop KGDB support
Message-ID: <auJT1Ld3urbqaeA0@swahl-home.5wahls.com>
References: <20261028122124.GJ2668804@noisy.programming.kicks-ass.net>
 <28F95BAB-6D5B-4C70-A9F2-14B752EBF022@zytor.com>
 <20261028142625.GU2668564@noisy.programming.kicks-ass.net>
 <27a7b4b6-23da-4469-9161-2ce44e8ac2a9@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27a7b4b6-23da-4469-9161-2ce44e8ac2a9@intel.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3OSBTYWx0ZWRfX8+gXezlWbCQ8
 dx39el5Lb2LTwAPlZZzRaXOES96OC/yweZQsY4I1+xPtqmrCNykxHgcZiLp6oRZFnS+hYw2Fps3
 m+sQSVJz+1dDzRmGhgQ1iw4053DCiD4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3OSBTYWx0ZWRfX27WTJ9768x1x
 haaxZbk8T/AAPF3P0dNyPG4a6K6FVqJt6akwClekFBRmRba46JJwzLxo/Jl/xJF4JcKTjdv7W2/
 BTFMlZ2TravZgFTLiM4ka245tkyVgt8K0msXM+27VJOEpJI9yPC7GWx71Syzr5VGitdSkvlzl3V
 a32X3QXQ+WdifodCGo7wEA8MFkoccz7OwyzB9dzGbZ3Qep6zdPjSPo7ycG9iBu8CHIAQhMES4wq
 fdrnNse+vpgfTk8mLhRkQRoNf3afx9gX2yyFL9Cu+Fa/qNJv71tsV2ZNVKPsUbJpDga1TCWvVUg
 nec6oSp+BWVxq9BIN54BhUmDiYC5eEC3moJq2YHAoKfOrmDW4mXPB0ABCb1C+p98eT4EQcHnkIM
 PZET9+YmpexDmj8JOKZZZel5GlXqrb4VmAeCnjj+K4iO1yxShULuTttY/OcgNLvQ9y2ECi1cPHx
 R+PWFtwKqW8PjtYZ7lw==
X-Authority-Analysis: v=2.4 cv=D+rSufRj c=1 sm=1 tr=0 ts=6ae253d9 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gQcMVamqm3wCPoSYhaRC:22 a=RtSn8ETxjE2H05FtM2s8:22 a=FOH2dFAWAAAA:8
 a=UFJLJSR3RhnZXnddWiwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: qi1u9XgnMma0c6vVmjJ5H3o1CSRxFjyY
X-Proofpoint-ORIG-GUID: qi1u9XgnMma0c6vVmjJ5H3o1CSRxFjyY
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280079

On Wed, Oct 28, 2026 at 08:10:54AM -0700, Dave Hansen wrote:
> On 10/28/26 07:26, Peter Zijlstra wrote:
> ...
> > Also, when was the last time you used KGDB? I think I've tried it once,
> > some 20 years ago, and haven't bothered since -- it was *that* good 🙂
> 
> I can't remember the last time I used it. I also grepped through all of
> my stashed-away kernel configs I've been using for the past 15 or so
> years. The only place I even see it configured in is in distro-derived
> configs. None of my trimmed down debug configs.
> 
> There seems to be approximately one clear commit that shows anyone using
> the x86 kgdb.c in the last decade:
> 
> 	commit 71ab8323cc357c68985a2d6fc6cfc22b1dbbc1c3
> 	Author: Matt Mullins <mmullins@fb.com>
> 	Date:   Fri May 31 12:47:54 2019 -0700
> 
> 	    x86/kgdb: Return 0 from kgdb_arch_set_breakpoint()
> 
> The only question for me at this point would be whether we should just
> config it out for a couple of releases rather than removing it outright.

I have never used kgdb, but kdb is a different story.  I originally
reacted quite poorly to this patch, assuming from what was changed
in uv_nmi.c that both kgdb and kdb were being removed.

I would like to see the kdb action remain in uv_nmi.c, even when
removing kgdb.  Is there a good reason why both were removed?

There have been a number of times over the past few years, on large
cpu count systems that aren't easy to configure for VM usage, where
I have a problem that wedges the system or leaves it unresponsive,
and I enable kdb, reproduce the problem, enter kdb via uv_nmi, just
to dump the stack of all processors and find out what they are
doing, and check other things that I can get to with kdb.

It's a much lighter weight tool than taking a kdump and bringing it
up under crash, and the additional information you can gather from a
live debugger is sometimes useful.

For an example, I recently used this method to discover that at
least one version of Intel's MPI library likes to read up
/proc/kallsyms from each of the processes it starts, and somewhere
north of 1000's of processors the atomic increment on opening
kallsyms, implemented with a compare-exchange, becomes a hot lock
and initialization that takes little time on a smaller number of
processors, suddenly balloons to half an hour.

There may be other tools I could use to get the same information,
but certainly the existence of the uv_nmi kdb is quite useful and
expedient.  I don't want to see the kdb action removed from
uv_nmi.c.

Thanks for consideration,

--> Steve Wahl
-- 
Steve Wahl, Hewlett Packard Enterprise
