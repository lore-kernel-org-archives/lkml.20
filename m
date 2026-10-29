Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.143.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288017;
	b=sEYKbKdIWtCqMsj1Wx1Pi6OZaQcb9apdHcxS6bRREWPivBSyE9m3YdXReuzOEUZR+o2c
	 C/VEi3xk4iHkM5LthiSGipvlDc7gaq2WZPy5lCQoApGQpzfl+mpG/f30kR/pFfLywHWxe
	 jS7MyC89SWPLjfvSqJR7b5LrzoP7Nvahzk6HOlrxG/AwL0F7r8rmZWk4C9lo1OPxNsqyK
	 bdD0+UVBNiPZFt0cbSwOdaAiyDk7TvdqPSd/CdHl3i2Wik9I//djvbTChxSdniNsRsaok
	 FzrOIQruETFFW26yzLwZIzB8YVmtVgD2E0WlVPMlbTTE5glb5rw5m1KWBQpJIdffoIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288017;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-HPE-SCL:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QWiFShUaITrVv9oDT+9Y+8iGtBpXUMOAQibXubV4k/Q=;
	b=ZFchy7l5see1vWDNkvxR41Wd9Eyw1aWqrOiN8uEvq3rLANGgprdqLexAuGXq4FlUYR+f
	 c/iXAFwdt1KucPCLYomgqySwofCKq7WaWoIOQEBmzSYe8XY9D/OEkl9WS4rSVNc1icZ3I
	 iOh9eGd/UWLMbti6/P+TkaDVdxlrT8DTCAQpd+l+vBfoda9ZaJhNd4gxrwc7OEa2k50pq
	 inrhaxZqNRUiMyaQSjVcIlRG92AI3EGpP8T2rSEwjHy+i8/noCp58US9F6+q2+/X+TQxL
	 soAIAQPa6yNyFSXgg3xz/88vTywIcfDGiGcBTSVRFuejHwactS76DThFrcMJ9ud0BgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=oa52nCn8;
	arc=none smtp.remote-ip=148.163.143.35
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2060606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2060606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=oa52nCn8
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TEiiS9737233;
	Thu, 29 Oct 2026 15:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=QWiFShUaITrVv9oDT+9Y+8iGtB
	pXUMOAQibXubV4k/Q=; b=oa52nCn8mPSOHh3+DHOWF2idTqmf63kEC1/K/3Kk80
	Nnk+ZBTj8rOnaxL2lVhNR7MByiAm3k4W+orEOoi1njzj8/I5zT1IIYKprRuF09bC
	jBuvo5LbMWUnK4WHML5enfh8tXTTQNoBapEiuzK9W/lwtqVCzB9+MR9Sfjbb4ou+
	qD/9ne5z0MJbFL12VTQCVg2BZ/x/mVIfm65TQHwKunGY8UnGHPN7DAHzZvFp8x35
	qqP44SHWAwqZNiTk9QYwlnoaFFRYJb6BcBV0SbCxN6r0gHl7SoFtQ4MDZ/a5xfqT
	+bDXh4ZXmCd6gvtGxuY34WFAi0tYDpnQO664tIxUSJsw==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hm3gbmynh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 15:33:03 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id BD5A3800EF0;
	Thu, 29 Oct 2026 15:33:02 +0000 (UTC)
Received: from swahl-home.5wahls.com (unknown [16.231.227.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTPS id 82ACC809A25;
	Thu, 29 Oct 2026 15:33:00 +0000 (UTC)
Date: Thu, 29 Oct 2026 10:32:58 -0500
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
Message-ID: <auNnKmfx_2Dp0IxH@swahl-home.5wahls.com>
References: <20261028122124.GJ2668804@noisy.programming.kicks-ass.net>
 <28F95BAB-6D5B-4C70-A9F2-14B752EBF022@zytor.com>
 <20261028142625.GU2668564@noisy.programming.kicks-ass.net>
 <27a7b4b6-23da-4469-9161-2ce44e8ac2a9@intel.com>
 <auJT1Ld3urbqaeA0@swahl-home.5wahls.com>
 <20261029105121.39a4c74f@pumpkin>
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
In-Reply-To: <20261029105121.39a4c74f@pumpkin>
X-Proofpoint-GUID: -kxp_TnIQcg-AJFgCoVkKEaxK3nWWpS4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2MCBTYWx0ZWRfX17muld4T9+S5
 aU8KQGtvBKEsaApbMubEV78xON4iUgKAKkrhgHIq60ucVnmhqTE0Vkytlo2/Es4KxEx7k4sljqy
 NItwqvZgaHced5Qgsl4iGjz7OweoX1iyVGa9EQvcx4xReSnHQ4smI8dSi4Axy+EvxUmSXIeN0PJ
 meGiFrd4sPFU2BhP/E1G8wUOniPpojHNvpQNJ39uuMB6MbCv/DSwSjB+NWq4U5KDfxn4PvGhoor
 Z6L5k8QtOv6lbm9Ebh/261yhf0ryThapP4WqwCTk69cdcXiuoGXvivGztO7G8Tg69JJQPmle3dI
 FsNyRqkRURyM7YAoueaSxSuG4lzI32nDQgWxmblPZSowYibqTxtuq9T5Fda2sBNOf2eAa082Nnc
 LdlSR8g0LJuvII/Wly4bHsnYie6ZskBps5iH4Puiqyd/YsCOqz11QqlXR/jUdmXmdr7AVHJRQ/p
 zRhFpEBAJcYzrHAHSKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2MCBTYWx0ZWRfX29U7OILapaA4
 QVwk1s5yri12kOs1hGK7jEpPD7e+iR7+ax5v+QQeCGJuADOoI/Pw5vSUdyYqDH4Vpa7IsE3wUne
 5aU3GDUWjb8wSwhpHnRhYCdm3o99ywA=
X-Authority-Analysis: v=2.4 cv=eoFKXYpX c=1 sm=1 tr=0 ts=6ae3672f cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gQcMVamqm3wCPoSYhaRC:22 a=k7r4yCLl9DVLXMiQTbtC:22 a=MvuuwTCpAAAA:8
 a=h_Aviy9kDwNqLz8LQP0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: -kxp_TnIQcg-AJFgCoVkKEaxK3nWWpS4
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290060

On Thu, Oct 29, 2026 at 10:51:21AM +0000, David Laight wrote:
> On Wed, 28 Oct 2026 14:58:12 -0500
> Steve Wahl <steve.wahl@hpe.com> wrote:
> 
> > On Wed, Oct 28, 2026 at 08:10:54AM -0700, Dave Hansen wrote:
> ...
> > 
> > For an example, I recently used this method to discover that at
> > least one version of Intel's MPI library likes to read up
> > /proc/kallsyms from each of the processes it starts, and somewhere
> > north of 1000's of processors the atomic increment on opening
> > kallsyms, implemented with a compare-exchange, becomes a hot lock
> > and initialization that takes little time on a smaller number of
> > processors, suddenly balloons to half an hour.
> 
> I'm guessing that was pre-ARMv8.1 ??

x86, not arm.  And it was on a distro kernel, I didn't check the
current community kernel because it was a situation where it was
enough to understand what's going on in the distro kernel, and avoid
the behavior in the application. 

> The LL/SC retry loops for atomics are completely broken for contended
> operations.
> The kernel needs to patch them to use the LSE (single instruction
> atomics) for ARMv8.1 which guarantee that some progress is made.
> A CAS loop can still get starved on a single CPU, but some CPU
> do proceed.
> You really don't want to use LL/LC on a system with hraair CPU.
> 
> One CPU (not arm) that implements LL/SC locks the cache line for a
> few clocks after LL to give a reasonable chance of the associated SC
> actually succeeding before the cache line is 'stolen' by another CPU
> doing an LL.

Thanks,

--> Steve

-- 
Steve Wahl, Hewlett Packard Enterprise
