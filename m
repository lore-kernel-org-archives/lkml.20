Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223168;
	b=zjvR9c+q9YLpGf1MhupMqgu2T+OID/niTxjvMPbt6zGXpPsiltcjK3Utm/do7dH7X2WC
	 0pPjfDANE405QDCr8uKaU3dWyz4o/Vnpoae1mLFCb6oVpvZ/gnqnQLNruPt0/uL04K+16
	 O9Jno86YwTKYs5mbAy91CdtIWar1nPB8hOm9QORTWmiaSVyLsbf8e0q9zOw9R/0VhwJ9H
	 DXmUq0neFp1PpSytlZfmt7ShaKFgt4Hi0ZWm2Dgpw7IzvSWsE5fmAvOUt+siAXxFovS+c
	 geVb2cgmRXYQzCDO1zTfS5SXDgN88glbiihXzqCocQJkg3MMqb0L1m/McZ30GMo5xTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223168;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=roGi78ys1k2Uv1LUZCj5d2Fe7dlBCtFSPtg4j7Hfqp0=;
	b=uRcsVyQZyQW70WUy0bmswFLjxOxWNrZyxXRRm/zGBQlZAPAwKiOYxgtElneJD+KTjSoj
	 UYk013+y8G79bqeOth0yxDHgAVznCdlsZ/+7fAmjfMzt6RDXwRNfU3ldY/PJVuB+koegc
	 2Y7dNNs4EYcNSC7pJLWkei8++YRAi4/jvpdGIaG66vRHinIQ92qhpx3qnhxU9TbVaSBw7
	 hjjQq53eV2oVhpuZiLXoxxE1YyVG9HkmVOUXV5SH6/ipt/fXgRAF3mzcKByxY30VBPg23
	 aa1zrX27NwU1DoF62P7KiJdDx7yEiyZO399VTL9nRZpSxB5grqgKnGyYJEUmLuIKrUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jsOGuWIt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdfdRNVS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECFD606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ECFD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jsOGuWIt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdfdRNVS
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPDxL2969699
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	roGi78ys1k2Uv1LUZCj5d2Fe7dlBCtFSPtg4j7Hfqp0=; b=jsOGuWIt+kH55A/v
	1NNo+qrfpvISreJ9xXX34fAdfvyQMy3IVE/nwrZ7zBouTaL4O6MNz7/rD0uImM1o
	oaEzYk3qdlqlBkSzqQVFyfQ9pWYG5HezU32fn7xhQec0sET/Z9LvMMaovzMojFuY
	vIcYnYPgP8oysRCgmf9RU4Cq0FFcZqo9zdhNJK+cAK8Y29YhPVAMsQCCFZcenmF5
	bB2I5T/qQXNWWLuiqLgmrb8JHK3wXyWdZPb1rf/GdKO38s4chNd614BQjxWjspUU
	HarJ2nio9JkZiASdTpczxzfEOGLWPmC/AmHlXrev9a2zGTCRk01eB+IHy9zNou3c
	nQakHg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehsjst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:32:46 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2282256eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793223166; x=1793827966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=roGi78ys1k2Uv1LUZCj5d2Fe7dlBCtFSPtg4j7Hfqp0=;
        b=gdfdRNVSlShQ2MNBU6B+9RZUnmbr27n88zetW1rurPykhvevKNQTZw9u9xsg38ko4h
         64UkWtObpfuPesUjfTHwuxiE1vyxPrTVK7HO2e5H4DHi7czNhk6cc892r4cCEgDPQhOM
         1SLB7UgVPeLoWo0mhR93fb+tQA3CFGiIG30K9k/yiTl+eVECZ5azb1xhSHAMiyDRwbNT
         wX/ybVwIfhF0H7lc5/giK0CSFDQhsks/narFBIX/jhY/p/baYNawzAh9iU1iSQNkSK4P
         JsGCn2fA6i0ALBDtRYsx9L0epLQpuRVOwZiXEWZtA0GSwsuOBLSQ3mJrWgkQ2PR+fFYL
         XE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793223166; x=1793827966;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=roGi78ys1k2Uv1LUZCj5d2Fe7dlBCtFSPtg4j7Hfqp0=;
        b=X0UZXmJFbkKwUwXp1kiw1tusOGivVbEwB/BLmoF86HoqQ2QuOOlPuHik7gPR/xZ8Ed
         TnT0RDwwbomHJWbegPAyg/vHaA69P2/ZNtVXvWtN0b/tzeh+1HTeXpff7xhR2cQlr5YU
         WbtoLdRCT4d+vHxjStubwKdH7DoayxTgetdtTILe9wbxrrWaCDkl0abeVP5wY/YZmdkF
         4wATTnmuJXJVbkSEKiT/n664xdb2Ijx1J0azfl3Sf5gN2AOTDkWFVeOqSJiH/LI3d2DG
         3S4OUO3iC8+BrSmZAe9x+80zx6DdmtLo+AfuaJ0onMGeg8leqNQ3L6BkH0agohIpuEG8
         u9jg==
X-Forwarded-Encrypted: i=1; AKwUvBwUq5rb/QnvXCZmOnK/O5qFKZ67g0NZ/bKqzIy+58KiiLPZ2ORYrHMlgB4YNoBLH2UCIzSi5Q+3BWgtpMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8M2mEMhv3+Mimf4vk+W0jvOrTLRL1Nsvh3XfYbRiY1WyU26YX
	NuSGsChqwPwJC1WZ27mzefLIi1k1JIvX8vfJOVVcrFMrXo5PR/R0JtZ8emHllaG+Zhanfa5McRT
	YcYmeH+ALC7sXYmGBmtMxgrEAnlvMbHUnNDMddQ1aWthCon0AeNYLzTNzvaPqitOj9qs=
X-Gm-Gg: AYBFou32pky/qoCI1TmW9p5D+cryzX0HvgBBqy5Axn8tPvEeriCmJrZOi478KwyIcWk
	uCdXcPnsXBem+wKpsU2wekXmLWVtcv+mvEt+nZ8U6cINl1x+y/KVyfhxQsrDFxZ+OpHuvjOo5Gf
	QYM3sIrlmp3j3KUpNwlRs/lhHHGLcreHMYM5N2b9FFG9DJJZP7HcL5bXzdNwQIaNEzgXMjsFRx8
	S8E/pFZU0iRLMBU6Vm6/KYxvLyNXdldNnM+PvLBGSih6G9XbHxIAb+Yr3+vSMYDyC+c6r7/uPQx
	4vMYjuSEcXHm27ME4cv1SbfNSByeMqnNlz67SYwc2+r4i1eh8hj9wE5X3vLi2ImdkbOxU8XEewF
	kabZ1UpiPDM+vOlu/zimuO4dbmw/9ZzEQtTeFnEMN7S3TYVPf2GPpu3bf0q37CBB3dersQutnwl
	R+TfGYuqwmK7304NVsiRUCYAg=
X-Received: by 2002:a05:7300:6028:b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a2014b7d9mr4548081eec.15.1793223165882;
        Wed, 28 Oct 2026 14:32:45 -0700 (PDT)
X-Received: by 2002:a05:7300:6028:b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a2014b7d9mr4548041eec.15.1793223165251;
        Wed, 28 Oct 2026 14:32:45 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a26d59f0fsm7520287eec.6.2026.10.28.14.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:32:44 -0700 (PDT)
Message-ID: <a34090f0-1843-4e04-a3f0-a53a62b1c1fd@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:32:43 -0600
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
Subject: Re: [PATCH v3] bus: mhi: host: pci_generic: Update the default
 autosuspend_delay_ms as 5000ms
To: Slark Xiao <slark_xiao@163.com>, mani@kernel.org,
        krishna.chundru@oss.qualcomm.com
Cc: loic.poulain@oss.qualcomm.com, val@packett.cool, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261021105434.29897-1-slark_xiao@163.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261021105434.29897-1-slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jxRNBIq-QFVx9x_WUrCq-cgRpivHvlXU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NSBTYWx0ZWRfX4Z6P2gREvvZ+
 FzgTDJsISEUbvEUqm8P48mfKpEp8Bo8ZYdL8RPfH2iDjeTMJIoMuyHbQIDiMal6ZcVSxT91masp
 dESeHsLCsWaTj02q7O2re5Jwx3Qe8NxL1svNhDfxKhHUqM69UNIHIFbwBviSRvrVg7uk6aw/S/2
 CVEsyRSzO17AQhsrxyXAlq9k88m+fU0mSngnkaPB4lgM5sBltkGpf6fFj4PpAsYZK1f4rbi3zaB
 JlrwTk4L36F/B1m6k7BiLNuKjq2wKbC9wZV/yBhdVFkuSrzxV0f6A4p6gvYc0GtBT8+L6aa/PxO
 rV+/b22tSut5PnbbfCI9Q0nChcvPz57TCGAfxsTHfwT2UCi71NTcGjOMsazW2gSwPwV9+pEgVn3
 OvpdLavnUq/kINL73YMZau/ilzxD93DPOcqTQZWzpE7QUcMFWhegEosbr6w/J2QZOftYoYQ0zPB
 W3/9TeE5ITQdct5/aJA==
X-Proofpoint-GUID: jxRNBIq-QFVx9x_WUrCq-cgRpivHvlXU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NSBTYWx0ZWRfX6ntdr4PnG4R0
 /hnvZ/w0xh1M0OaOuKSEqwHVdfiipao5D8gJyjYO9c+YN4z9zPHYqhRIa2vGccNJkL8MKH5sc8r
 BzlDEf0A5fIbWTOeZtw0jmbm5OmmMtw=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae269fe cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=hbk5_eJ7lmwJhVnmj34A:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280085

On 10/21/2026 4:54 AM, Slark Xiao wrote:
> For some MHI devices in some specific scenarios, the default value
> of autosuspend_delay_ms may not be enough to handle the last wake
> event, potentially leading to device timeout or link drop issues.
> This can lead to a runtime resume failure and a subsequent system
> error:
> 
>    [ 8749.089545] mhi mhi0: Resuming from non M3 state (SYS ERROR)
>    [ 8749.089573] mhi-pci-generic 0000:73:00.0: failed to resume device: -22
>    [ 8749.090218] mhi-pci-generic 0000:73:00.0: device recovery started
>    ...
>    [ 8752.940324] mhi-pci-generic 0000:73:00.0: reset failed
> 
> Following Qualcomm's recommended settings from Windows and their
> suggestion during case discussions, update the default autosuspend
> delay to 5000ms for MHI devices.
> 
> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> Cc: stable@vger.kernel.org
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
