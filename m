Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793652286;
	b=eMUbZJEDICyC1/uichAV+fzqIwtk2uBVBKER3B+T09S0n9HO+TCDVgPRCYGzWBRhGKrF
	 Kj8R5IgimGBdZi0VhrRN+NN4spbASGiyGvW5pFhTMy4eMkBRTk4Epk3djgVkxHLAP+0tj
	 NqLUc5PFXHX28M9D4MTGBkNeEDbynGuOan8uew8AuF+8WSQMrcF+EWIUNlDb8S/Y1+fWL
	 UYhN4KDchoslnxBnvnKU9WKbZrM5bpEXXfomQG7ZlsPRjYTXESlD4KC4MKlLQImGkv7/a
	 7m6E82itHXQBLy9BSCJX8N6h3keu24/+JP1cyYNF8b/nzA19D8nBWf+0CScDRxl5KLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652286;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/iC7HNXDJ6lBSX5huz5H2PlCJddX7rIa1Dt4IIRe1TE=;
	b=QNGv0W4aOF21U9r7M8HC8YcUqFKa+bjcv7HqKXiTjbTfNZIedL22NjWKD3xEV7/wX2OH
	 h07EaL3x3nO/egoVTegipik+trHwA5ALRXJk6BK2/jYbehDN8WIaEZ/4qFBktHTC/uPVS
	 GxquZoExdw7g+8+iMZlpBR4Nopu0VOorfPR5qILzZOdz7TgAbXFUaF7SQ1apa5NP8b2u+
	 ldW8dcxXbVl4EDmksSuMenEH2566LU1vDPU7yXeBpuQ5sB/O2d3QRWla68gl6W1lo/q7b
	 o0grmMtg/nv+fCpY7dTlmm6yipFvi2nM3tAYeLOUFwx6ZE4J8WUL+4tNPcbQKX7SLiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C9Sb+gxV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f2T1uuLj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE881606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE881606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C9Sb+gxV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f2T1uuLj
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6Eub726358
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 20:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iC7HNXDJ6lBSX5huz5H2PlCJddX7rIa1Dt4IIRe1TE=; b=C9Sb+gxVY/iVMo8D
	ZF50x6C/8yMC+bcuPpOZ18Fymp7G0CKhYYTNTfZ2E9pV40tXstymOuKENSfrSLWO
	ApbCTJ+LTFJWJ6mnPXz9W9qhE5ugNH9xaRnhajnTYQlGYR7qAVZUOJvP4rwxhnv0
	mHuno9ve3Jee8REFu+mAbU21Amq3zObCB8usq0CB3dxKas8KfUrXk8ES6cD4Uq3A
	QLL6qlXkPRsOd6Lv6yr8V9PJC1LVHf0DldhQk6eUokBoBmHitL534E9TqIudwq5X
	q0K61PujbUbzGvQknZf/IDJk/KJkp7SkSFLsl37pxmGbwX2UYh+TlxMo/BxtzC+b
	+WItDw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5jaet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:44:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so14783888eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793652278; x=1794257078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/iC7HNXDJ6lBSX5huz5H2PlCJddX7rIa1Dt4IIRe1TE=;
        b=f2T1uuLj+xC0oXX0KxjUjOVzPMEzgpw1BRLI67Fg5yBBrjNDwpgaH9u7BUieWeCXsL
         rJQpHpijqsaLkPh8SeVheA6tElGaBWUG+5BGJBLAFqTIxU5Ohuj1KZrgyEtvf9STdh02
         voQ3u9pMObPm8JkqcVyy9d2ALMam63gzpN7OjD/oaAnQ9EmjnaWoqRbX8Jo9fci13hfG
         /+ESQLFnWRpDBMWluFad1JF77mSVooP0J2waPVMz9oGRqdHfo4jS0t9QdAaxnom+ZnYc
         fVtqy+uGUMFS0STOHrphW9SRngwiaAb5nQwsvMiYUtBo0Q55ogddjhgVBmibIyFzIsfB
         x0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652278; x=1794257078;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/iC7HNXDJ6lBSX5huz5H2PlCJddX7rIa1Dt4IIRe1TE=;
        b=fzJnEUWD0TII0dhkDoc9nPNGdICBN1MNED48FXX5Y5R4bf9pknh3NCHDHuLdKeQAMe
         nuHWCpFAn8+RINODuRzoEtsF4Yr+yKk9CUjSlDCXOfhNMRZ3Dpn/gSe7C8vECBOOMD1f
         FgtRZummDCBm4Yyh+oGIZEJwVlVty7mDc1ezPdog360pb/fw+x+0PbNtowIC/c2GEjlL
         E5EUsN3Fb6ZnQKnHYbUI4K5ngU9jf8j3sgaiwxqQJZKXFz3eETwrN47r3yRT24UJx2um
         +NR2jFmTbkmyRVuqKpmUn6bQU8r6yJpIxpEOKFRuLYwZ+WQvart02OVCnuJLqybgQk6a
         ylzw==
X-Forwarded-Encrypted: i=1; AKwUvByKC7jgL4ypOfpyjfl/U2B2+Y7FeBew7jZHYNNZ/VUl+9E79e/x7QoIGkgZ2jBgiI7SZRTduQTK3TpRzN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T/hgh6ZWKgAkfm88eQbKzowGgNDofGiwuzDHEfwWLZGXXyGKY
	91apUeN3MjhxcHaahkm3RGN4hq9LTbpBEgHBaE3thyJQkmcy2UJ9OzyxEnNf4T2yipNcDTeSnuy
	7RfXIba9UwiGmm9hVjB2/jlCcpp1TPYF5w/ASMsz5COHH1TgwJLAGs57ZKw4MUk1WUDE=
X-Gm-Gg: AYBFou0TsQfgnzVkirWX8zE2QQ3zM3/N88eJ64e0mRd1pJC+Itbz1BKQAyw5vl0/rki
	AEWK4DJ6MJWkK6HhuUZFE2FCQALThMkVeGcU5XBi4LAdURhD7TUWGt+MB5wTwcdYjewXpB3lZFW
	74NJhpFLjApNSgi3HtOOsiDcw7jCxBJiYWayEvxhikNgMduIuW3+DIJ5EMTAFJ2if6fTX7Kl1TW
	TdC91iu2rWg4iMriD5xYMIjUECLj/qJVdkwXPI6K28NLAM2Fu0b9SYemXhJHSWQ9dUj3ToXDVqi
	eM6WeDVT6V5+WMlW/VP1CAD73CXxHP44SAanRWLyuH2QnuVgNxGgygLvxsqbNjgF+j/do3aS5ZK
	E7duFm2pRczbJ90b28sSim439kFXgZCBIWoiRJ1YXK8i5rQGW0gIzH+RSuHmqs+9RSpIvout/uy
	XIzvd1SEv/zAt5Qhc2gkZEFwEc24U=
X-Received: by 2002:a05:7300:e9d6:20b0:369:d779:bcb8 with SMTP id 5a478bee46e88-36a42059aa6mr17926268eec.0.1793652278026;
        Mon, 02 Nov 2026 12:44:38 -0800 (PST)
X-Received: by 2002:a05:7300:e9d6:20b0:369:d779:bcb8 with SMTP id 5a478bee46e88-36a42059aa6mr17926227eec.0.1793652277204;
        Mon, 02 Nov 2026 12:44:37 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm46230218eec.15.2026.11.02.12.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:44:36 -0800 (PST)
Date: Mon, 2 Nov 2026 12:44:34 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "santino.wang" <santino.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
        <arnab.layek@mediatek.com>, Tony Luck <tony.luck@intel.com>,
        Borislav
 Petkov <bp@alien8.de>, linux-edac@vger.kernel.org,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: Re: [RFC PATCH 00/11] soc: mediatek: add a DRAM ECC error handling
 driver
Message-ID: <20261102124434.00007741@oss.qualcomm.com>
In-Reply-To: <20261102123642.000044cf@oss.qualcomm.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
	<20261102123642.000044cf@oss.qualcomm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae8f637 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=mpaa-ttXAAAA:8 a=7wfBugC_ttQFeL10uWsA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 9yAlc6WiLmhhldUuPRcnHLLThal-OoHw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4MiBTYWx0ZWRfX6SDiulhkvV3j
 U1nxKyHEi79io6UNu2PP07c38ICXyZ/p8LjDxRLCgsdTEhN9rPO2qwo5cTFWKQ9t28TwrPVipy8
 VA68GxmZwkzqQxPj48solHjVo7RZhIwAz+gwCpN+uL8/qChTsIWHJ6j/QN/iwFo6K1v3A9qVaj0
 ZX8Hitsw4n30ObMKZh6tA/UxZKoxecxUJ0Z9I6wPENUJR+AY+Vtg2qJnQzPdN0YKV9KWF2pCiL2
 NW8HBLhIqdPPG+vUfONB0SLORd3MMCIzLKJN9bLhD01d+Si3m2MaMTb0Xa8t1SvNutAlRiqJxLs
 P+bE2SYT7pWPxKq/MkyhyKICMkJ+BJm8MRA4EO29Qz1bXheubJuFC4h/jwWh6bS+jBUoUXDgsuz
 +QBHx8SdV1a2CDQW2RxnqKtaBWK09Iubxl/mGqqHRBdogIYQzZn1u5UNxd2SQxE8l1UZVQdfezE
 sZCCzw1yUqQxN+Hs8jQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4MiBTYWx0ZWRfX5FsbSfLi/pVA
 jjSgxG1EZYezYbMqyJtx553QNR+XHxLbCJEO+LyV8EINhnC05gbRyM7sLu+BMvm128iCXNuSGq9
 yXAGNa08gaaAc+ScshsQKNEbZ0eKP4Y=
X-Proofpoint-GUID: 9yAlc6WiLmhhldUuPRcnHLLThal-OoHw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020082

On Mon, 2 Nov 2026 12:36:42 -0800
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com> wrote:

> On Mon, 2 Nov 2026 17:23:22 +0800
> santino.wang <santino.wang@mediatek.com> wrote:
> 

+CC Mauro as well as I realized I asked about userspace part and
he may have input on that as well as on the kernel side of things.

> > From: Santino Wang <santino.wang@mediatek.com>
> > 
> > On the MediaTek mt8992 SoC the DRAM controller (DRAMC) raises an interrupt for
> > every corrected (CE) and uncorrectable (UCE) ECC error. The interrupt is
> > owned by the secure firmware (Arm Trusted Firmware at EL3). It reads the
> > DRAMC error registers, applies the error containment policy and the CE
> > storm protection, and hands the error to the OS firmware-first as an ACPI
> > GHES record in a buffer that UEFI describes in the HEST. The OS is
> > notified with an edge interrupt that the DSDT delivers through a Generic
> > Event Device and a Hardware Error Device (GSIV notification).  
> 
> So far this all sounds standard for asynchronous error reporting.
> I'm assuming you have a something else for synchronous consumption.
> From a Linux side of things we just care that error record shows up
> and is signaled via GSIV (with normal Generic Event Device and Hardware
> Error Device in the DSDT I guess)
> 
> > 
> > The record carries a standard Platform Memory Error section and a
> > MediaTek vendor section with the raw DRAMC error registers.  
> 
> I'd like some details here on what those raw registers are bringing
> to the OS wrt to handling these errors. 
> 
> What extra info?  I see you have a subchannel in there, but Memory
> Error Section 2 brings that.  So why isn't this being reported
> as a standard CPER?
> 
> > This series
> > adds the driver that consumes the vendor section through the existing
> > ghes_register_vendor_record_notifier() interface. No change to the GHES
> > core or to arm64 code is needed.  
> 
> Given a lot here doesn't sound mediatek specific it feels like it
> shouldn't necessarily be in the vendor defined path.  More discussion
> of why you have gone that way would be help.
> 
> > 
> > The driver
> >  - decodes the most severe error of a record and keeps counters, also
> >    across boots in EFI variables,  
> 
> Interesting.  How does this compare with just making it a userspace problem?
> Perhaps you can't do that for some reason but it would take a lot to
> convince me that it makes sense to have an upstream solution that relies
> on custom EFI variable path.
> 
> >  - isolates pages with memory_failure(): immediately for a recoverable
> >    UCE on memory that Linux manages, and for a page whose corrected
> >    error count reaches a threshold (leaky bucket); memory owned by a
> >    device is only reported to its owner,  
> 
> This sounds standard, so I'm missing why you need a vendor driver for it.
> Please provides some more info.
> 
> >  - lets in-kernel clients and user space (generic netlink, tracepoints)
> >    follow the events,  
> 
> Why your own netlink for this?  These are memory errors so I'd expect
> existing paths to be sufficient, or perhaps there to be a need to
> extend those as Pierre is doing with the Memory Error Section 2 series.
> 
> >  - exposes the containment policy, the storm protection and per range
> >    severity overrides in sysfs and pushes them to the secure firmware
> >    through a vendor SMC call,  
> 
> The pushing of policy down to firmware is possibly something that needs
> a custom driver.  I need to think a bit more on that and check a few things.
> Input from Borislav or Tony might help here.
> 
> >  - after a fatal UCE (GHES panic and reset), finds the error in the BERT
> >    of the next boot and reports it through the mc_event tracepoint.  
> 
> If this were using the standard records that should just work. What
> is missing that you need?
> 
> > 
> > The driver depends on firmware that is not part of this series: the
> > secure firmware provides the SMC interface used by patch 2 and writes the
> > vendor section decoded by patch 4. The firmware side (the TF-A and
> > edk2-platforms changes for the mt8992 SoC, plus the preloader that keeps
> > the error across the reset) is being developed in the vendor's BSP trees
> > and is not published yet.
> > 
> > Open question for this RFC: is drivers/soc/mediatek the right place for a
> > driver that is built on GHES vendor records and a vendor SMC interface, or
> > would the maintainers prefer another location?  
> 
> You already got a reply on that. Almost nothing should ever go in drivers/soc
> and definitely not something RAS related. +CC linux-edac, Borislav and Tony.
> 
> Anyhow, always interesting to discuss expanding what we do for
> memory error handling, so I'll be interested to see what other feedback
> this series gets.
> 
> Thanks,
> 
> Jonathan
> 
> > 
> > Testing: each patch builds with the arm64 defconfig plus
> > CONFIG_MTK_DRAM_ECC=m on linux-next 20261030 (W=1, no warnings).
> > The series has been tested pre-silicon on a Palladium emulation platform.
> > 
> > Santino Wang (11):
> >   soc: mediatek: dram-ecc: add the DRAM ECC driver skeleton
> >   soc: mediatek: dram-ecc: add the SMC interface to the secure firmware
> >   soc: mediatek: dram-ecc: add tracepoints
> >   soc: mediatek: dram-ecc: handle GHES vendor records from the firmware
> >   soc: mediatek: dram-ecc: add error counters and the address lists
> >   soc: mediatek: dram-ecc: keep error counters across boots
> >   soc: mediatek: dram-ecc: add containment policy and storm protection
> >   soc: mediatek: dram-ecc: add the corrected error leaky bucket
> >   soc: mediatek: dram-ecc: add a generic netlink event interface
> >   soc: mediatek: dram-ecc: report an uncorrectable error of the previous
> >     boot
> >   Documentation: ABI: add the sysfs attributes of the MediaTek DRAM ECC
> >     driver
> > 
> >  .../ABI/testing/sysfs-class-mtk-dram-ecc      | 182 +++++++++
> >  MAINTAINERS                                   |  10 +
> >  drivers/soc/mediatek/Kconfig                  |   2 +
> >  drivers/soc/mediatek/Makefile                 |   1 +
> >  drivers/soc/mediatek/dram-ecc/Kconfig         |  19 +
> >  drivers/soc/mediatek/dram-ecc/Makefile        |   3 +
> >  drivers/soc/mediatek/dram-ecc/core/Makefile   |  20 +
> >  .../soc/mediatek/dram-ecc/core/addresses.c    |  88 ++++
> >  .../soc/mediatek/dram-ecc/core/addresses.h    |  13 +
> >  .../soc/mediatek/dram-ecc/core/bert_check.c   | 240 +++++++++++
> >  .../soc/mediatek/dram-ecc/core/bert_check.h   |  12 +
> >  drivers/soc/mediatek/dram-ecc/core/counters.c | 336 ++++++++++++++++
> >  drivers/soc/mediatek/dram-ecc/core/counters.h |  29 ++
> >  .../mediatek/dram-ecc/core/ghes_notifier.c    | 377 ++++++++++++++++++
> >  .../mediatek/dram-ecc/core/ghes_notifier.h    |  22 +
> >  drivers/soc/mediatek/dram-ecc/core/main.c     | 113 ++++++
> >  .../soc/mediatek/dram-ecc/core/mtk_dram_ecc.h |  27 ++
> >  .../dram-ecc/core/mtk_dram_ecc_event.h        |  47 +++
> >  drivers/soc/mediatek/dram-ecc/core/netlink.c  |  83 ++++
> >  drivers/soc/mediatek/dram-ecc/core/netlink.h  |  14 +
> >  .../dram-ecc/core/policy/address_range.c      | 120 ++++++
> >  .../dram-ecc/core/policy/containment.c        | 107 +++++
> >  .../dram-ecc/core/policy/leaky_bucket.c       | 277 +++++++++++++
> >  .../mediatek/dram-ecc/core/policy/policy.c    |  57 +++
> >  .../mediatek/dram-ecc/core/policy/policy.h    |  23 ++
> >  .../dram-ecc/core/policy/storm_protection.c   | 137 +++++++
> >  drivers/soc/mediatek/dram-ecc/core/smc.c      | 137 +++++++
> >  drivers/soc/mediatek/dram-ecc/core/smc.h      |  55 +++
> >  drivers/soc/mediatek/dram-ecc/core/trace.c    |   6 +
> >  drivers/soc/mediatek/dram-ecc/core/trace.h    | 119 ++++++
> >  include/uapi/linux/mtk_dram_ecc_netlink.h     |  44 ++
> >  31 files changed, 2720 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-class-mtk-dram-ecc
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/Kconfig
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/Makefile
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/Makefile
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/addresses.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/addresses.h
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/bert_check.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/bert_check.h
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/counters.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/counters.h
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/ghes_notifier.h
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/main.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc.h
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc_event.h
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/netlink.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/netlink.h
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/address_range.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/containment.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/leaky_bucket.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/policy.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/policy.h
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/storm_protection.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/smc.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/smc.h
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/trace.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/trace.h
> >  create mode 100644 include/uapi/linux/mtk_dram_ecc_netlink.h
> >   
> 

