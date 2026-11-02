Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.143.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657719;
	b=z0/tkd1JnDqs2/NpWU7cznzlOfbpBcxVo9j5HvAJWEBH9Cyv3s5S329GJRyePNcttZQX
	 UZfPchDKToqIOlpdxQM2KpsVyxByDfhje7eT/P7RU8WbSVMHy3DQIZyM15m7n3WsRFTGF
	 pAKy3BZC4MO2IuD4oqFzj0FwRlOQovAQVTEZJrNfZCK2/8zeqfALnLfNoh/v+gh6WQlqU
	 /kBXbxN9fozZsARCNT7TJefTWM1A1Q9ZD+SO95fo0JJ5OlJwL2wNVHI8FdaorKk4RXSzc
	 VSNJJCRGZPsmZZA8AIug7FiUkudBbkWtPZgPulNro0rLQm9yAEqD+rIHgSf45I2uiHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-HPE-SCL:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E/ynh4EodQA+X86STXJXehCMjJo0iq64YJ+PfIXXxfk=;
	b=v8TfORae0FDR1D9/407ib7LJeVDctqL937lVIubHImIa0JnF+BPBo2+xEeUhSLjhlXCn
	 cUFvI/SscMtFYTE7NBxN/Vvp/Fmd4hadPCSatokHF99YQ/48hviKfNrOrbsXH98YzzYB2
	 GNxQbG+Lmk9VSOsYXp+6j/k9tMzmfh9IkBxkJk2KXZrLpgkhdtdqNH7b2hqnOMCtGEGw3
	 LhsTBXcy9Ew5FR/dubuhXdB57EwnHhWdHpqqgQvB7oBcLNBllsGb0Bz9LSxE0B8Afap5d
	 Hz8ZLm7idzUWthFjjEn4am17ofQ6Llb9thtE416pCTuDnyhgtBhMARobL4pzpJYe3gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=Jet6+nXf;
	arc=none smtp.remote-ip=148.163.143.35
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBDA606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EBDA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=Jet6+nXf
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K7hQK1609565;
	Mon, 2 Nov 2026 22:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=E/ynh4EodQA+X86STXJXehCMjJ
	o0iq64YJ+PfIXXxfk=; b=Jet6+nXfGDO7lmovFc5JjghnQUijSOtTZjR4o3N10R
	IpU70jdiVn9GV96lx5/nkgeNHI0gXODzvdDtgGf1YWDXwAkL7SnXA+iP2Ti7Tvkw
	mK1eaoQAcYmLqf90yyzYvQqBu31dlkEPXcr4RUUZeKm4+NNmxoYtwZdaabrf3eD7
	Ns37eg5x9ezN9qBHXk604/B0Dtl5F6bjCuRgrQ3wyA+0B2qy+efFA5qj1zJJRXjL
	YgVwp9G6qRbv6nYbuKsTCQ/etpkJf7MVO9eO2belXLeFLmuW9k9mqLgK1dBSXDyh
	7vcLW2bX8JGylg/LxVqUEKmCTJ49zROnxcYDkBZwC0HQ==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hq072t6vp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 22:14:51 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id AE20CD2A1;
	Mon,  2 Nov 2026 22:14:50 +0000 (UTC)
Received: from fedora (unknown [16.231.227.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTPS id 68FFB808E98;
	Mon,  2 Nov 2026 22:14:48 +0000 (UTC)
Date: Mon, 2 Nov 2026 16:14:46 -0600
From: Steve Wahl <steve.wahl@hpe.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Steve Wahl <steve.wahl@hpe.com>, Peter Zijlstra <peterz@infradead.org>,
        Dave Hansen <dave.hansen@intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
        x86@kernel.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, justin.ernst@hpe.com, kyle.meyer@hpe.com,
        dimitri.sivanich@hpe.com, russ.anderson@hpe.com,
        linux-kernel@vger.kernel.org, mhiramat@kernel.org,
        Matt Mullins <mmullins@fb.com>
Subject: Re: [PATCH] x86: Drop KGDB support
Message-ID: <aukLVl_22lVd9Auh@fedora>
References: <20261028122124.GJ2668804@noisy.programming.kicks-ass.net>
 <28F95BAB-6D5B-4C70-A9F2-14B752EBF022@zytor.com>
 <20261028142625.GU2668564@noisy.programming.kicks-ass.net>
 <27a7b4b6-23da-4469-9161-2ce44e8ac2a9@intel.com>
 <auJT1Ld3urbqaeA0@swahl-home.5wahls.com>
 <20261029105121.39a4c74f@pumpkin>
 <auNnKmfx_2Dp0IxH@swahl-home.5wahls.com>
 <20261030162841.23ffeb6b@pumpkin>
 <auUEkBg5P4AZdjLe@swahl-home.5wahls.com>
 <20261030223146.0fae9291@pumpkin>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030223146.0fae9291@pumpkin>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX4rI83r9Cifkh
 XRNnxCswJ9cvyPyTEs3Qrcp5LONNFLsQAjUqngeOWd1WuxBDiYnOLpolS8EZwoSxlaiaPjdd0UX
 WEj7yKLfMLZUVW7DfbT6zwJIiLnSAM+JAZBnQE7EEqJVTVivwNCOEJ/evee7L42/9OrrtOVISP/
 Txsc7Bbxexm75Di+fdY5E/psiqmayqBjKRs++6Hw5dJU2rZZkFpdBXZL0dhQDQpV5PXO/zL46kq
 7oHFcC910CPQzuvGc5BUUzaaso/h0S7pXgDZjTSNFlI6DnXU3GzIIrmZl6u96cXSb5FEQ/IF+AX
 NRvVWYsPkJyK18leO3SpqGUyWkqcOauyYoHMTnmf4rj3ROIwRHJtonhEcPF/qMgt127m27Ui17b
 iwkdZ1FiaGESPEJq6IbPXyP1rJU7nv0STfqTqa4qMGMBZ1V35T0t55c79zFF+ZOcWAyXNt0Q5n8
 HZR+IHagWGoEGogrqqw==
X-Proofpoint-ORIG-GUID: 0zca97v6IB0SPzJy3R3b49hY9UwOscKD
X-Proofpoint-GUID: 0zca97v6IB0SPzJy3R3b49hY9UwOscKD
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6ae90b5b cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gQcMVamqm3wCPoSYhaRC:22 a=g3u0LPWLDYfGfufhFw6-:22 a=MvuuwTCpAAAA:8
 a=FmTkwmyTustmW8AJi84A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX7UW7/Sb7NqPd
 Jm1aT5lb34YXyKQvuLLT52VgIpA+kb17YzCOLylXzrKdLpb1E6adXFAfiFS3JcDUx59v/sEVL6D
 1yjiPXwRCMdH76tpvID6OSrPa7hzSyU=
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

On Fri, Oct 30, 2026 at 10:31:46PM +0000, David Laight wrote:
> On Fri, 30 Oct 2026 15:56:48 -0500
> Steve Wahl <steve.wahl@hpe.com> wrote:
> 
> > On Fri, Oct 30, 2026 at 04:28:41PM +0000, David Laight wrote:
> > > On Thu, 29 Oct 2026 10:32:58 -0500
> > > Steve Wahl <steve.wahl@hpe.com> wrote:
> > >   
> > > > On Thu, Oct 29, 2026 at 10:51:21AM +0000, David Laight wrote:  
> > > > > On Wed, 28 Oct 2026 14:58:12 -0500
> > > > > Steve Wahl <steve.wahl@hpe.com> wrote:
> > > > >     
> > > > > > On Wed, Oct 28, 2026 at 08:10:54AM -0700, Dave Hansen wrote:    
> > > > > ...    
> > > > > > 
> > > > > > For an example, I recently used this method to discover that at
> > > > > > least one version of Intel's MPI library likes to read up
> > > > > > /proc/kallsyms from each of the processes it starts, and somewhere
> > > > > > north of 1000's of processors the atomic increment on opening
> > > > > > kallsyms, implemented with a compare-exchange, becomes a hot lock
> > > > > > and initialization that takes little time on a smaller number of
> > > > > > processors, suddenly balloons to half an hour.    
> > > > > 
> > > > > I'm guessing that was pre-ARMv8.1 ??    
> > > > 
> > > > x86, not arm.  And it was on a distro kernel, I didn't check the
> > > > current community kernel because it was a situation where it was
> > > > enough to understand what's going on in the distro kernel, and avoid
> > > > the behavior in the application.   
> > > 
> > > x86 shouldn't have an exponential issue with cas.
> > > Something else must have been going on.  
> > 
> > Well, the large majority of some 2000+ cpus were all stuck in
> > use_pde() in inode.c, which is
> > 
> > 	return likely(atomic_inc_unless_negative(&pde->in_use));
> 
> There will be one of those per read system call.
> If the code is using a sane buffer length that isn't really that many at all
> (unless you are running an 'allyesconfig' kernel).
> Provided the library isn't doing something really silly like 1 byte reads!

I don't have the backtraces saved.  For whatever reason, I'm left with
the impression that the processes I examined closely were all in the
open call, not the read call.  But you're correct, it looks like reads
would sit on this too.  That makes even more sense that it got stuck
as long as it did.

> It is possible that /proc/kallsyms could be marked PROC_ENTRY_PERMANENT
> and so avoid that atomic operation.

Maybe.  That seems like a specific solution to a general problem.
Even if /proc/kallsyms is fixed, there will be others that are not.

And the right place to fix this is much in question.  Is there a good
reason to read /proc/kallsyms 1000s of times?  I doubt it.  We
switched to a different MPI library that does not have this problem.

(I did not take this to the community for a number of reasons.  I
didn't have time to make sure I could reproduce with the latest
version of the library, with the community kernel instead of the
distro kernel. I don't have a good explanation of why the library
would want to do it in the first place.  We have a workaround for the
time being.)

My point was more that they're taking away the tool that I used to
figure this out.

> > 
> > atomic_inc_unless_negative() has alternates, but I think there's no
> > arch version for x86, so comes down to this:
> > 
> > static __always_inline bool
> > raw_atomic_inc_unless_negative(atomic_t *v)
> > {
> > 	int c = raw_atomic_read(v);
> > 
> > 	do {
> > 		if (unlikely(c < 0))
> > 			return false;
> > 	} while (!raw_atomic_try_cmpxchg(v, &c, c + 1));
> > 
> > 	return true;
> > }
> > 
> > If you manage to synchronize thousands of processors among many NUMA
> > nodes all trying to do that same thing, how can that not create a
> > horrible cache coherency protocol traffic jam?
> 
> On x86, in order for the cmpxchg to fail it must have succeeded for
> a different cpu (as far as I understand things...).
> So yes, you get a lot of cache coherency traffic but progress should
> be made - probably with a maximum total rate of increments that you
> hit well before 1000 cpu hit the code path.
> 
> It might just be that with the large NUMA memory system the required number
> of cache line bounces (one for each successful CAS) just takes that length
> of time - but that is linear in the number of applications/cpus. 

I think I disagree with the "one bounce for each successful CAS"
assertion; I think it's one bounce for each CAS, successful or not.

If there's any mechanism like a short term hold on the cache line
before it will relinquish ownership after a failure, perhaps in this
case the extra "unless negative" instructions are making the loop too
long?  I don't know.

Thanks for your insight,

--> Steve Wahl

> OTOH an LL/SC loop loses the cache when another cpu does the LL (aka read)
> bit. So when heavily contended no cpu manages to do a successful write
> and overall absolutely no progress is made.
> The more instructions between the LL and SC the worse it gets.
> 
> David
> 
> > 
> > Thanks for your thoughts on this; if our hardware is supposed to be
> > doing something to alleviate this and it's not, I / we want to know!
> > 
> > --> Steve  
> > 
> > > David
> > >   
> > > >   
> > > > > The LL/SC retry loops for atomics are completely broken for contended
> > > > > operations.
> > > > > The kernel needs to patch them to use the LSE (single instruction
> > > > > atomics) for ARMv8.1 which guarantee that some progress is made.
> > > > > A CAS loop can still get starved on a single CPU, but some CPU
> > > > > do proceed.
> > > > > You really don't want to use LL/LC on a system with hraair CPU.
> > > > > 
> > > > > One CPU (not arm) that implements LL/SC locks the cache line for a
> > > > > few clocks after LL to give a reasonable chance of the associated SC
> > > > > actually succeeding before the cache line is 'stolen' by another CPU
> > > > > doing an LL.    
> > > > 
> > > > Thanks,
> > > >   
> > > > --> Steve    
> > > >   
> > >   
> > 
> 

-- 
Steve Wahl, Hewlett Packard Enterprise
