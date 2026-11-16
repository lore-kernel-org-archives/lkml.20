Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853897;
	b=chdKCV8csrtfoQWzhmGQPtppDTvuBjASD/dAxObM3OvQpble2cAUIaVXq6Ij7ZeyBvEC
	 ukk0B8qp+TOIRXKEon9EUeE6RMZojD34Bi3CfuvEa8MKeCG4DTAFkZZkf/iyjpMBKBzwB
	 JYm+aN6o8Kv+vPYbp3oP3T5xa0TpYsq9VVMibE+Yj74Yerr6eYAoTLDOCg4HlkJ75F7+7
	 fhtTM4wzKQEpB77j5zqSEThjcBMf7S4Uphz97Uc3BDecEmJADbOOUTCgui2Bhq8Mc1wfu
	 bA2XCk53QLabzg1xlS5vkAIdrTxtOisoOFgrYsFE6sSvAYLxztDSVin4uNxhkjgwCvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853897;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pqbhyzTPwwLXTG6MM5gIEyz9kRSPoNjiNdRjVrtFI2g=;
	b=sMhxUxCND8VCV9t3WtgpzcTouE/4RtF0LlKdf6yz2u/3LHjs7vqqvXmbK57I2mZ4L4yT
	 GofGUkBGrVyn4AWPCFiClrfYrhUMBOUxE+YbdkPe4320hTqtz+f0ZxfEAP2iqAbnAi+mo
	 zcHQ2rXXi9GujFzwNBizMDV+4iF37z908pLSey+vLas2FYT7hAKPdGdUtFnb+FXkBx2q4
	 CaneExyNwDEKmAZtxHJpZtljC+lPkFlqhlTcMHODVopH0kGRtDBr1TVodWhtCpcbkVwYY
	 GTUfSGYK3IZ1U47Xo8uMXlKu2wo29CHR+kIXy3P2UrD4B4PPO1cn6yfw5rc6Di3BnrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OoouNWRV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L5lo4e7N;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E349606A337
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E349606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OoouNWRV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L5lo4e7N
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIIZs1579991
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pqbhyzTPwwLXTG6MM5gIEyz9kRSPoNjiNdRjVrtFI2g=; b=OoouNWRVwYvFJHY8
	xKkLpkaRFnZGOv3pDB++UbxKh26RO7LHJs4QS8RnUwSKKj1U5sDDs+oaSOXphQJE
	J8Ti8eszqxtdJei967qryzvHOS7jCh2wFzTIK/OSsOWUslUcCyBicMe0kmQKddf6
	meW3n2h3Pjppy7izH2hcfkchz0X3OcqWmVdTkESpZiKq07+RlQtqgj37odw4oRWQ
	D07PZ/BWzFiWzr0F8GPTL4linMlDkqj1xfV/vQY5CoOZNCeSaLYpuSnaG+N5FA+A
	a2gNr5/hp7IN1bgTd3erWsP8vOm/L7ThdX0j6+2mTQve5V0rF1h4DOapCeJlzfCp
	DS9Fdg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j000g1x1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:31:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f26e6abe9so4466236eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794853896; x=1795458696; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pqbhyzTPwwLXTG6MM5gIEyz9kRSPoNjiNdRjVrtFI2g=;
        b=L5lo4e7Nveyco12PKv7Otwcl/5POHk7SrGdplnZrMpoOEvVxhsAjuAIQLIMgJHIG1c
         /Q6V/V0XM6BPRcGzuFDbKHrfdoK159unVFNqdIusz8ye4SdFEpEouFsCaJwnePSNwtxP
         gOhbFii+uMEzTLz6Uw+Tam8gQvJRw+2HoSI1px1XG3qm+MnFHOTXbG7UpRQcgthP3b+f
         AoxpjuQoHKN7o1btnx5Z042uLzLFRvozV6+GLtwAdyCZmEyEKQzKx1B208oJHc2Erzji
         nFyWfGjBCTnfhnfbivaKe7ZOb5U6wctciiv6ExZaHxXEQtJHE41o/Ql/F2OcKWvUzDy9
         XNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853896; x=1795458696;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pqbhyzTPwwLXTG6MM5gIEyz9kRSPoNjiNdRjVrtFI2g=;
        b=g6Ii4WmOKf0ZNeUwyciuBensXGv7N/Anuqeh0rdvz6LysyfQOaCwCg4drlPNKEwPAJ
         6ikevuxBri308Argx1tUC9RKZruQUmLR+qfnDP+z+jaygrVH+zQ8vtJ6s8IELZ69Ejjh
         cWu8XkKgY8sgFkFCmjV7m7ZiBy3Z6VaQW/ijMWrt589ibEnJxuLWZ9+vom1+o9lDt0qs
         PjbDIuHKXmG/rRf+4+lWaCJwA19aUpV7WUfLrkYPCX9+3DxwvFfzcf9HysArcjXA6Fpy
         irrk08Jp3mj8gFJatdEX2To2BdLmeDaE4vDInHs6MlAvXlzXS6Vdqkf0YbmUROdXAHdd
         O05Q==
X-Forwarded-Encrypted: i=1; AL+hErFz4Owl7edx6xGD6F5v2yz5tOnDsnRKcPDVuMLZP3c6rOE7jXv9tAh/QJ83E22yWC6GHvKvdErIoNtwjRU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EeiYyPbDVxK9oTr57WRjU2NDln9g5ERCeG7y26FCpAiJ7Si3c
	jWNBQZS3F4phNEHk9hTzYMg15JzsUSED6+tPEkzZ3dxRT0hFtK2pi/vbmDnVWFEm9hDd6OobVFC
	y/J14yRg5vV3xohTibRjd7qGAV6CLxh16OOHW6r+Wa8yMa0rfznGYg1n/pPoScZzz5c0=
X-Gm-Gg: AYBFou0jbWmhJl3sXYfRZEYYHRgMHz8GrBLF3vm7xyDrlWMPOtweWSf0ARRvPL9ngKR
	K5qwm5evKAqnfeD6wrEtUJGrG9PMeXTAfqu7f3ehme3BIH5Tz5JD2W4uWgoNXLLTDArA68Un+uo
	gAu5AFcGruHu7DMxS9vjlAHWia3ZVACPTX9puVoXGu4rLMXmWpEHL7jzkoKq4VZ8Q+dWh0LDA4H
	GU0uQI6CZipgMm4SZAfcn0sPjFDjuNF19sE2s7qf0+l+1Gsjy3XEuAGHXQarKP7UKa3fW6DuvVY
	gQ1acL0tkIyQ27llps1qXEgFoES+PXfuclT17KYG6KvEdGD1/iblTGzpYnG2DhppncNrroRNNHf
	D/tGAcBVqlRC/iBWdBCPXEsnBuPFmuSAqlDxHoTaEl3O3whOvV0BoqAdMU8ZsDd39gba24YBcqW
	OHPwG4FABGYqMCSQouxp0r5A==
X-Received: by 2002:a05:693c:6383:20b0:37a:c882:994f with SMTP id 5a478bee46e88-37ac891df02mr8296522eec.9.1794853894757;
        Mon, 16 Nov 2026 10:31:34 -0800 (PST)
X-Received: by 2002:a05:693c:6383:20b0:37a:c882:994f with SMTP id 5a478bee46e88-37ac891df02mr8296469eec.9.1794853893782;
        Mon, 16 Nov 2026 10:31:33 -0800 (PST)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm65747695eec.21.2026.11.16.10.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:31:33 -0800 (PST)
Date: Mon, 16 Nov 2026 10:31:31 -0800
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Liaochang <liaochang1@huawei.com>,
        Marc Zyngier <maz@kernel.org>, Radu Rendec <radu@rendec.net>,
        Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
        Sathvika Vasireddy <sathvika.vasireddy@oss.qualcomm.com>,
        Ashok Raj <ashok.raj@oss.qualcomm.com>,
        Ashok Raj <ashoraj@qti.qualcomm.com>
Subject: Re: [RFC PATCH v1 0/2] genirq: add migratable NMI registration and
 show NMI counts
Message-ID: <avtMA9bb9vwezquP@hu-ashoraj-lv.qualcomm.com>
References: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
 <452bf82e-52ea-47c1-9074-eeb614a33747@arm.com>
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
In-Reply-To: <452bf82e-52ea-47c1-9074-eeb614a33747@arm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA3MyBTYWx0ZWRfX3WBrsdM4LX/1
 sPzsI+bGX3rjYOMdu+98L8+W02jS4MZ7BKk+/70fc4DkfKZX0+6uWTdc/koWjyDqNVRhm3dDB/Q
 nO2ndtvxRSevL+zgCnczG6W5J0izOrOQi1NAtAuq+h2g+5y9jaqy/9G5r9LDnA7mN2N82pJBO1p
 mHluSkcKyEFlKZNf+/XORHcMzUBRol2BgxYj9eQ5KQfpLMD1MQb13hxo+XydAn0M5y6OGQbGfPZ
 nxm+j//6A7A82lsVEOef1eXMYXurbFD4BQ1+fj5jZfIUD2WBhvP4DVjSulT1Yb/kk2P/0UKBET4
 XTJQz5dMqgKd/v8fsGdFVZ5PE0CflZB2z3EuNJJIrP4g3/UWKu0dHUVhtjQiDQvta5MmwbTgry6
 RXvHTw+xsllvfkT61dhosJ78cxEpHPpAP+YAueOszr678OKrb8pONZExenBumsNso2pV43b0Smw
 YNHOrYgktR85/3OPUkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA3MyBTYWx0ZWRfX0Gz8w0TMgQWO
 HXGs5idGKi5H7FkGDd+6HG2r4ZG7kR3BOAsc9o47SlXJPXHFIlKVz0n7KcDg4bwf3dg109mW0Xa
 8Y5RJtzuoiONLcFUWME/HApdhm1EmAg=
X-Proofpoint-GUID: l29S-nN3xHpG5FSl8PnR6GmTYZauGyNC
X-Proofpoint-ORIG-GUID: l29S-nN3xHpG5FSl8PnR6GmTYZauGyNC
X-Authority-Analysis: v=2.4 cv=Vdtir1p9 c=1 sm=1 tr=0 ts=6afb4c08 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=3lHpaRzwHYXERcAFG5gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160073

Hi Vladimir

On Mon, Nov 16, 2026 at 10:38:00AM +0000, Vladimir Murzin wrote:

> Hi Ashok,
> 
> On 11/14/26 23:49, Ashok Raj wrote:
> > request_nmi() currently models NMIs as per-CPU sources. This does not
> > represent a globally routed NMI source with an affinity-capable irqchip,
> > which needs to be rerouted when its target CPU is offlined.
> > 
> > This RFC adds IRQF_NMI_MIGRATABLE as a request_nmi() registration mode
> > for such a source. It remains excluded from normal IRQ balancing, but the
> > generic startup and CPU-hotplug paths may select an online target. The
> > second patch fixes the related /proc/interrupts display: NMI-safe flow
> > handling updates the per-CPU counters rather than irq_desc::tot_count.
> > 
> > Patch 1: Add the migratable-NMI registration mode, validate that it is
> > used only through request_nmi() with an affinity-capable non-per-CPU
> > irqchip, and add IRQ KUnit coverage for registration and CPU-offline
> > migration.
> > 
> > Patch 2: Emit the per-CPU counters for all NMI descriptors, matching
> > kstat_irqs_desc().
> > 
> > Testing:
> >   - ARM64 changed-object builds with WERROR=1
> >   - ARM64 !SMP changed-object build
> >   - ARM64 IRQ KUnit run under QEMU with two CPUs, including registration
> >     validation and CPU-offline migration
> >   - local downstream GHES delivery and migration validation for the intended
> >     consumer topology (not part of this series)
> > 
> > Base and dependencies:
> > 
> > This RFC was developed and tested on v7.4-rc2 plus the FEAT_NMI v2 series
> > [1]. It depends on that series' GIC NMI support and is therefore not directly
> > applicable to mainline or linux-next as posted. This RFC is for design
> > feedback; it will need rebasing onto the upstream form of those prerequisites
> > before submission.
> > 
> > [1] https://lore.kernel.org/linux-arm-kernel/20261112132042.129062-1-vladimir.murzin@arm.com/
> > 
> 
> I'm not an expert in this area, but based on what I've learned so far,
> NMI being per-CPU like makes life much easier ;)

I'm still learning the ARM side :-), so please correct me if I've got 
something wrong.

The events I'm working on are platform RAS events described via:

	HEST -> GHES entries. 

My prototype uses an extended Type-4 GHES entry (Type-4 is
just for the RFC discussion here; I also have an alternative based on Marc's
earlier suggestion).

These are SPIs, so they can be routed to any CPU. But request_nmi() as
structured picks one CPU and pins the interrupt to it, treating it as
per-CPU. If that CPU goes offline, the interrupt is orphaned.

I see two ways to handle this:

Option 1: Retarget on CPU offline. My POC registers a hotplug callback that
picks a new target CPU. If none is available (e.g. this is the last online
CPU), it vetoes the offline. This works, but it feels like a band-aid.

Option 2: Extend the API for SPIs. Add a flag that lets the caller opt out
of the per-CPU requirement. Affinity migration and retargeting on offline
then follow the normal SPI path, which seems more natural to me.

I prefer Option 2. If it fits your series, I'll post the POC as an RFC for
feedback.

> IIUC, one of the main problems with a shared NMI (as opposed to a
> per-CPU) is handling shared state. [...] the same NMI handler could
> execute concurrently on two CPUs.
> 
> IIUC, one of the main problems with a shared NMI (as opposed to a
> per-CPU) is handling shared state. Consider:
> 
> CPU0                       CPU1                       CPU2
> 
> ---------------------------------------------------------------------------
> 
> <NMI>
> handling started
>                            set NMI affinity to CPU2
>                                                       <NMI>
>                                                       handling started
> mutate shared state
>                                                       mutate shared state
> handling finished
>                                                       handling finished
> 
> IOW, the same NMI handler could execute concurrently on two CPUs,
> potentially corrupting shared state. Once again more than happy to
> be corrected if I missed something :)

There is no risk of the same normal, non-per-CPU IRQ action handler
executing concurrently on both the previous and newly selected CPUs during
an affinity change. Genirq sets IRQD_IRQ_INPROGRESS before dropping the
descriptor lock to invoke the driver's hard-IRQ handler. If another instance
arrives on the new target while the handler remains active on the previous
target, the new CPU observes that in-progress state and does not enter the
action handler.

The affinity update is not a synchronous “wait for the old CPU” operation:
the interrupt controller can route a subsequent interrupt to the new CPU
before the old handler returns. However, handler execution remains
serialized:

Previous CPU                         New target CPU
------------                         --------------
set IRQD_IRQ_INPROGRESS
drop desc->lock
run driver's hard-IRQ handler

                                     affinity target is reprogrammed
                                     a subsequent IRQ arrives
                                     observes IRQD_IRQ_INPROGRESS
                                     does not run the action handler

handler returns
reacquire desc->lock
clear IRQD_IRQ_INPROGRESS

                                     a later or replayed IRQ may run the
                                     action handler on the new CPU

Any required pending/replay behavior for an event arriving during this
interval is handled by the applicable IRQ flow handler and irqchip semantics;
it does not cause simultaneous invocations of the driver's hard-IRQ handler.

Does this make sense? 

Cheers,
Ashok
