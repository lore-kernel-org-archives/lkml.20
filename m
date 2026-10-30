Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.147.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793393847;
	b=a4cV0kjdojuChLqjZm7H8j+OFv3kCTUpdxZhLwOmrshduCTdxVD71P5fZ7NP/27gKl+G
	 nmwth7Y0ZB76GECGFZpN51WLMG0lkEs41q57CkvRLE6eeA5y0FWrYBboUjR6XulEjup2M
	 ohVUq9c6BiZDBgVmsJ95CdFxQ86Fhw2mG7mAttP4EDj+5G7VJDDwx6R3GLL6TFSoVYFZ7
	 ATlzIZp4R+bg+HfSou+YKRipzIKfWNZW2usBP0VwCJhbfJ9cEGVY2nRGPOuHGTIj17K82
	 LDetW5w+WTiFBx4wP57p/m+2kSw0sq9sGVBKJDoDax2aDBmGZO91xJ6+aEPhUoTvOvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793393847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-HPE-SCL:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0OHcIPG2kuM+J2Hbnisrn+NH+jCy4ALAGsSHj7ypllo=;
	b=0OMrS+tETeUW8PBEBJ9ksoQDbmTiJVQ53Ra7xY1X24QcZUio9i1uVfNLOSe1QJv8L1gZ
	 fboL2gh2XDdRIdHbMZKgydyjNV3T6KGZeaunxPlukSdoYGt5VsQ46UQUl+LghIFIk80C0
	 raxgGBslDyGYzm0WfTfifdKQ6hYHpWc9xTOW+F9cokqGxmLFh26ZnB9bhYxwa0aX+xxkr
	 ChY1VMvsFTXv1HTfkE8biyZ72ty+RozHlUFrXGzacZRluxC5VkMGgGMjHW4tw8F7fe7G2
	 nVtobzDWAgTfxAPPI/5r4XwikkTGW+JxjnnyGfBIjIAC5Iw94WW3tuFBQ1mDeyZSNug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b="QSmp/ciE";
	arc=none smtp.remote-ip=148.163.147.86
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5CB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C5CB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=QSmp/ciE
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UJ20qh1690111;
	Fri, 30 Oct 2026 20:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=0OHcIPG2kuM+J2Hbnisrn+NH+j
	Cy4ALAGsSHj7ypllo=; b=QSmp/ciEfQFGbXqSqloxY3m0am7MYEi6k2Y3L7kOFA
	qXW+HaxtuSriHi0YX5BTsb1bP9JFJDX+P0NFJC6rhj1pSZrClQCyUD+StHHQA9JC
	jhquyylTzkNuZn6rxhKrFduB4H3yER/gRBrBYZDS7bDkenLfafzCXcMv2O2xTwbF
	c7rfoagDIyzYGSbDD/pr6EHpyDQ6N4KBUVE6C+f4cV8ySPAyDnj05B44lVw5Q0BQ
	0RvlWATCGycfw5FW9rpZP8TIB8lO47LkwhtaUqOX3gAOaCc1Q4p2Q3QqsxSQt0EF
	96LEe6BnNqSmQQiTLQreVIJeBW/mxjstmb98kG8+Ie4A==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hmwj9v3yc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 20:56:54 +0000 (GMT)
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 47E8C80479A;
	Fri, 30 Oct 2026 20:56:53 +0000 (UTC)
Received: from swahl-home.5wahls.com (unknown [16.231.227.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTPS id 0293F80022B;
	Fri, 30 Oct 2026 20:56:51 +0000 (UTC)
Date: Fri, 30 Oct 2026 15:56:48 -0500
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
Message-ID: <auUEkBg5P4AZdjLe@swahl-home.5wahls.com>
References: <20261028122124.GJ2668804@noisy.programming.kicks-ass.net>
 <28F95BAB-6D5B-4C70-A9F2-14B752EBF022@zytor.com>
 <20261028142625.GU2668564@noisy.programming.kicks-ass.net>
 <27a7b4b6-23da-4469-9161-2ce44e8ac2a9@intel.com>
 <auJT1Ld3urbqaeA0@swahl-home.5wahls.com>
 <20261029105121.39a4c74f@pumpkin>
 <auNnKmfx_2Dp0IxH@swahl-home.5wahls.com>
 <20261030162841.23ffeb6b@pumpkin>
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
In-Reply-To: <20261030162841.23ffeb6b@pumpkin>
X-Proofpoint-ORIG-GUID: CvkRBkBlGcD7_7eSefQ0XCD9ThDOdNuL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX4GDw1WQ/Hk+U
 fcM4iI56hAdmqEhdJu+jsPbUq8RxKZYSAr0BLX9KuzFR/TsG5D8hm/K5PWdqmhQ6uz5Vzjx3WJ2
 TzCPGJRR8+xIwSbzht2pq6vX1GbCPTk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfXxjw2Hoo9gBBd
 zFg5m+WH6QjDutHUYOLqpahRF1H8dgbNpvO0E3nhVS/Qy54JF0yuxbVnXjIPOigRR1zILffiGnX
 58ct2StHj0Fbcv5pAklzhzzglJWwST0xSYpVp0kdJuhKsakrfeEKofnp8c7Ut4/3b477/QT8xzc
 67cEquynNuaq/l0tnKuJlWU5BXfaKGsW0HBkfa+ZCVWHj9XH5yD4K2dQWDcS9NIKniNXj3duyl0
 hE95aVMGuqkxdI+1vwcY1US7757YzqOUpLPhLGHlkU71QcaMEQ+zWNmcP/zzwVbBGGgkPFNdIih
 vuUx417U68tA8mu3sU3vwEILuErTmt32d0nVQVo6bLgqdGGWvHoB3e7YhvWCbhGCJOTuIjxpTdX
 VP3j08um+zbvomK9uFmRuhhg+sSL5xecgJMrMhE8F8lkSgVdsvc4Pj/MrdJqs2b5bkg5mXRNAX9
 foErjanGAceGNCDq01Q==
X-Authority-Analysis: v=2.4 cv=bKGDs/+Z c=1 sm=1 tr=0 ts=6ae50496 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gQcMVamqm3wCPoSYhaRC:22 a=ay80y3fxfMS_JZZz1qJy:22 a=MvuuwTCpAAAA:8
 a=eK9CK5VdZ3NtOR8l070A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: CvkRBkBlGcD7_7eSefQ0XCD9ThDOdNuL
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

On Fri, Oct 30, 2026 at 04:28:41PM +0000, David Laight wrote:
> On Thu, 29 Oct 2026 10:32:58 -0500
> Steve Wahl <steve.wahl@hpe.com> wrote:
> 
> > On Thu, Oct 29, 2026 at 10:51:21AM +0000, David Laight wrote:
> > > On Wed, 28 Oct 2026 14:58:12 -0500
> > > Steve Wahl <steve.wahl@hpe.com> wrote:
> > >   
> > > > On Wed, Oct 28, 2026 at 08:10:54AM -0700, Dave Hansen wrote:  
> > > ...  
> > > > 
> > > > For an example, I recently used this method to discover that at
> > > > least one version of Intel's MPI library likes to read up
> > > > /proc/kallsyms from each of the processes it starts, and somewhere
> > > > north of 1000's of processors the atomic increment on opening
> > > > kallsyms, implemented with a compare-exchange, becomes a hot lock
> > > > and initialization that takes little time on a smaller number of
> > > > processors, suddenly balloons to half an hour.  
> > > 
> > > I'm guessing that was pre-ARMv8.1 ??  
> > 
> > x86, not arm.  And it was on a distro kernel, I didn't check the
> > current community kernel because it was a situation where it was
> > enough to understand what's going on in the distro kernel, and avoid
> > the behavior in the application. 
> 
> x86 shouldn't have an exponential issue with cas.
> Something else must have been going on.

Well, the large majority of some 2000+ cpus were all stuck in
use_pde() in inode.c, which is

	return likely(atomic_inc_unless_negative(&pde->in_use));

atomic_inc_unless_negative() has alternates, but I think there's no
arch version for x86, so comes down to this:

static __always_inline bool
raw_atomic_inc_unless_negative(atomic_t *v)
{
	int c = raw_atomic_read(v);

	do {
		if (unlikely(c < 0))
			return false;
	} while (!raw_atomic_try_cmpxchg(v, &c, c + 1));

	return true;
}

If you manage to synchronize thousands of processors among many NUMA
nodes all trying to do that same thing, how can that not create a
horrible cache coherency protocol traffic jam?

Thanks for your thoughts on this; if our hardware is supposed to be
doing something to alleviate this and it's not, I / we want to know!

--> Steve

> David
> 
> > 
> > > The LL/SC retry loops for atomics are completely broken for contended
> > > operations.
> > > The kernel needs to patch them to use the LSE (single instruction
> > > atomics) for ARMv8.1 which guarantee that some progress is made.
> > > A CAS loop can still get starved on a single CPU, but some CPU
> > > do proceed.
> > > You really don't want to use LL/LC on a system with hraair CPU.
> > > 
> > > One CPU (not arm) that implements LL/SC locks the cache line for a
> > > few clocks after LL to give a reasonable chance of the associated SC
> > > actually succeeding before the cache line is 'stolen' by another CPU
> > > doing an LL.  
> > 
> > Thanks,
> > 
> > --> Steve  
> > 
> 

-- 
Steve Wahl, Hewlett Packard Enterprise
