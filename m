Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE555158A5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026449; cv=none; b=BM/XKV5u5xMw9c3uSRfH8p/mMaBu4/psW0e/EHKKjxqPo8b8XB2KaaaSai9rbBXRTpIbzNTvMrP7FczzSNHhnXIyJzYtKEglanZfmTwYPRjDvlAJpJMnICaz+m4tXCi7ixKh3iXyYvNx18XurzQD2nQrfqS/M8MGSixL/DTe3Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026449; c=relaxed/simple;
	bh=R1peGfGCRuDkyOnmHdifYGmM605I2Y0NPAuHhiZzP+w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pJbXP1QyKakQMRe5ZPTc0sMRFGO7c/RLid1hQXVbSVmWj9CxeWxj2VHECHK/Y1N+t7/HUfjAxsLV3LC3TXTP0K0J6nSKljl1T6cOIPKYK1HBxIsnwXxHLqXD6O3W/BQumXoENA9aqKwvyFqRO6LXTeQBn/S2qeNIis9SQbqyfX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIzBAr5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NiVASZsZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIzBAr5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NiVASZsZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKfv6Y2412159
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z80fGZcv6BPIL4REfzCrI6RcJShWmT49WjhJXMKxxOU=; b=bIzBAr5/YZDrBmax
	l1lrKwqt/AXF2k3S8USImZugoEgOGjaM7BeHLt/wgHvoz7eSgHPGcmF/GnQ7hKWw
	AVXxXIpaoMMm7xQex8VmfUTelZ8DLkpTOYg07K1uuNJziWJ5/B850e9jvzpkX9M2
	pwTdNHrRtkT9vJ2oGhKQdHlAxZe9b1cEb1kjnGj1JfQ5Yum1e018V7QG3SzMurdZ
	qYBpZL7EjftEzedXWYubyG0HHB/uHSMgmSZraBPpTFk28q2fzcvYi1lEM+EtWJJu
	jyBC0lCVWmE6/ZqI2+sGqlJRoDpTc9G/FJJoJO3kliDc8dcpTXxBoBtNX0fRuwuM
	x0giwg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csjhpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:34:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e3f521346so3976734a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790026446; x=1790631246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=z80fGZcv6BPIL4REfzCrI6RcJShWmT49WjhJXMKxxOU=;
        b=NiVASZsZqp5mxtmd62Co2IMNqC1MtQy0QCqhibiKhRSmKuTWVRkIh0yjYlifqDWUOB
         ik4u0Q2oSiNHEloNHVOD4S2v6KBJ3yghWaOGVpCmWkUj2gZGzmAqmFe6riTP1f56e8WD
         19veansBq8zQSbwJ/kJ+vPYZmdIUoxRfwWf7iBSGyqrIseqB6svEf/wJ9aiF5cGV5I8t
         mN9ArRbmAsKXpjTg7RLI79QXfVMArholYDIzssENBxY9f06j9uI1/E5f6e3s08ijoRkr
         rTpT2DaIKk1vMXVefAyE158B32x/jQ4Ge5QLLNCXcMqhefI90DpTqXp/e8aGGG87urRl
         h2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026446; x=1790631246;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z80fGZcv6BPIL4REfzCrI6RcJShWmT49WjhJXMKxxOU=;
        b=jSb4vf+mAyjWaqHI3EHn2Uz8avE/KPWavWIaVeFu5LIVO60dxjQRO+AI618UwxjRNW
         kEOwcM7TQht/fc9yVza8vKRlJSXvWNdxmyhRxMgynrxpDDk3KjyohybTKMWUowwkLx9P
         5yef818Dn7x8usXOK80Yxiy4742SA0k8LD7Q5v3SY4xxEtkcnc0JZk8bdW2CkrI0z0aw
         aJpU0ZbuPo3AmCEl0x0nS78kTcfsTEMnUE3Q5UyxcCp8wk9lUp3FPVDgVbe6jp9/6vI2
         dJG/44yaXOsV3elFHU4kKHraIHcQYEbR3aZdqamPJ13GERPxngwNnaKuaGvY4bF1hFG2
         OpJw==
X-Forwarded-Encrypted: i=1; AKwUvBxUardcVp/9ziwtBdxdlKi4DaTZW10f4B/TZdki04NIHXpXsAmniDYGMJnUA8sLbw4lQ1Q9E60gHYw+Umo=@vger.kernel.org
X-Gm-Message-State: AFuF++mFyuLSsM7mt8Qcb39poLXbbfSzDqZUVZL6U3IrE9jUhpZe+TpP
	Tt7HT51a2MZdMIX8XVs9ipgJnLZBFE2r0MGtk/MA0fqqfYnIzSNd2RHGN6vGCyFLf+xDBKYUwSA
	AeqtNpoiCGcwWvI2a2ov8LuS9Adc6OuGhcSAHJ0eUkHKeBS60i/aQh4WZ76cdlS5lQOOcXU6Wyz
	E=
X-Gm-Gg: AYBFou0H+tIU2pfFELHrnxsHskjbvRdZbrD3ha3J0/0d3OWCrrs8NbKOQ6pOJrVGn/q
	5dspRJQeRlpheYeUF4HvuNnb1L7AS4PLl7BLZC5UYwW7vz3WADYe1arr7ExzhY2+6y+lvHUsn3M
	pwvX/9o5tPNcdUfWKVpbiLZP7D3Mwxa0G0uSHHyes/JHzoi9pDsVvdXK7wfs1b/x3e2UMC3aQpk
	Ps7z85IsvNbib7UuBu6ofhLWUv6HwQyweReKW/lhwSoST/wHUcPWyRg5DiPZVWwjX/LX/RKX8KK
	xmks49Pa5w6yBCiLteSJGAbZhedlIyBuFGcL1WZ7Cdu9qv2OcdNl3kfmRXtsIWo7r4JVn3d5ZfI
	HWQY4hhe1AfiDEhPuu0xMgc+G5w==
X-Received: by 2002:a17:90b:5187:b0:39e:6c6a:2095 with SMTP id 98e67ed59e1d1-39e6c6a22ecmr10542571a91.54.1790026445921;
        Mon, 21 Sep 2026 14:34:05 -0700 (PDT)
X-Received: by 2002:a17:90b:5187:b0:39e:6c6a:2095 with SMTP id 98e67ed59e1d1-39e6c6a22ecmr10542536a91.54.1790026445395;
        Mon, 21 Sep 2026 14:34:05 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a02625615dsm5648638a91.2.2026.09.21.14.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:34:04 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:33:52 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18 1/7] firmware: arm_rmm: Add SMC definitions for
 calling the RMM
Message-ID: <20260921143352.0000014a@oss.qualcomm.com>
In-Reply-To: <d7ccaf22-5bde-4344-8bf0-a5a17dcac0f3@arm.com>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
	<20260912083611.2513845-2-suzuki.poulose@arm.com>
	<178978126540.2352296.16845657485139032765.b4-review@b4>
	<d7ccaf22-5bde-4344-8bf0-a5a17dcac0f3@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMxNSBTYWx0ZWRfXxGgQcQIuVX4F
 n5Bz1yZS4kFWu7V5Sa6pCLqwjGMYYij9XxYseN7BEdEc8KSASu6/OF7hu3nFYFsqEn5Zx7Qv+Lw
 78Df7Ifk75JCpKuJq/ZE1Pkc+P2n0lQ=
X-Proofpoint-GUID: xo_nyhMG5Q7ml-fb4i6PJmBejbPv3DqM
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab1a2ce cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=PlCZfVOHbWhc7nwO5CYA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMxNSBTYWx0ZWRfX9Bxbs4L9790Y
 Pr6+TFFPf6AZGX96gGI60P/n6zHz6pBArcJcRBiUBphoYY1XgEhrZ/xSL7OGGMFtRoD1gzgl3PY
 0h0ieECiw+DY5zg+jI1kwZqUBUjAjUTRsI7IB6pgsuWsT7ykzitNBUhdp90XcAGrwrWFTupHWwF
 +speeXa9L6vC3UgtpYrOqQ0VpCpCEelQR7Y51jdDPEFs2zbxmmiFfklm2KcMWgl3iQqcUezEZ+F
 4e9xudYR7jB1nQsqu+wwEQ4QwQoZ4U+F48+dnfgz2q/LXFOsAMjyBeCaIsRmU7WphVrLubU9CmW
 NKHkV3Kw2t/fEMS1tmeO6XoTuRAT4Az/jmvcdQjT8aUP1iAp69Cc2Gg4So11FZJ7KyUoho2EGx9
 xpH3hZNBeYcZaQc3qEdfLvG2qWEjqT6IYyGsWoMf7AnGQ97zip+00IrLSnuO+qvKPKePl+OqQIL
 QEX+8HLRQvITn9vYbkQ==
X-Proofpoint-ORIG-GUID: xo_nyhMG5Q7ml-fb4i6PJmBejbPv3DqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210315

On Mon, 21 Sep 2026 10:27:46 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> On 19/09/2026 02:27, Jonathan Cameron wrote:
> >> The RMM (Realm Management Monitor) provides functionality that can be
> >> accessed by SMC calls from the host.
> >>
> >> The SMC definitions are based on DEN0137[1] version 2.0-bet3
> >>
> >> [1] https://developer.arm.com/documentation/den0137/2-0bet3/
> >>
> >> Signed-off-by: Steven Price <steven.price@arm.com>
> >> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>  
> > 
> > With Gavin's nitpicks and the GENMASK_ULL() from sashiko, just a few
> > comments inline.  Mostly on subtle inconsistencies that really don't
> > matter that much.
> >   
> >>   include/linux/arm-smccc-rmi.h | 497 ++++++++++++++++++++++++++++++++++
> >>   1 file changed, 497 insertions(+)
> >>   create mode 100644 include/linux/arm-smccc-rmi.h
> >>
> >> diff --git a/include/linux/arm-smccc-rmi.h b/include/linux/arm-smccc-rmi.h
> >> new file mode 100644
> >> index 000000000000..214d6228dfc2
> >> --- /dev/null
> >> +++ b/include/linux/arm-smccc-rmi.h
> >> @@ -0,0 +1,497 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 */
> >> +/*
> >> + * Copyright (C) 2023-2026 ARM Ltd.
> >> + *
> >> + * The values and structures in this file are from the Realm Management Monitor
> >> + * specification (DEN0137) version 2.0-bet3:
> >> + * https://developer.arm.com/documentation/den0137/2-0bet3/
> >> + */
> >> +
> >> +#ifndef __LINUX_ARM_SMCCC_RMI_H_
> >> +#define __LINUX_ARM_SMCCC_RMI_H_
> >> +
> >> +#include <linux/arm-smccc.h>
> >> +#include <linux/bitfield.h>
> >> +#include <linux/bits.h>
> >> +#include <linux/build_bug.h>
> >> +#include <linux/sizes.h>
> >> +
> >> +#include <asm/page.h>
> >> +
> >> +#define SMC_RMI_CALL(func)				\
> >> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,		\
> >> +			   ARM_SMCCC_SMC_64,		\
> >> +			   ARM_SMCCC_OWNER_STANDARD,	\
> >> +			   (func))  
> > 
> > Obviously it is v18 so probably a future thing but nothing about this
> > is RMI specific.  Could be used for ARM_SMCCC_TRNG_RND64 for instance.
> > I'm not entirely sure what we'd call such a macro
> > 
> > ARM_SMCCC_CALL_VAL64_STD() maybe?  
> 
> ARM_SMCCC_STD_CALL64_VAL() ?
> 
> But, I would leave it as a wider cleanup in the tree as a separate
> series.

Ok.  A follow up would be fine I guess.


> >> +
> >> +#define RMI_RETURN_STATUS_MASK		GENMASK(7, 0)
> >> +#define RMI_RETURN_INDEX_MASK		GENMASK(15, 8)
> >> +#define RMI_RETURN_MEMREQ_MASK		GENMASK(9, 8)
> >> +#define RMI_RETURN_CAN_CANCEL_MASK	BIT(10)
> >> +
> >> +#define RMI_RETURN_STATUS(ret)		FIELD_GET(RMI_RETURN_STATUS_MASK, ret)
> >> +#define RMI_RETURN_INDEX(ret)		FIELD_GET(RMI_RETURN_INDEX_MASK, ret)  
> > 
> > What's this one?  I can't find anything in the spec that matches it
> > and as far as I can tell you don't use it in this series.  
> 
> This is coming from RmiResultDataLevel. See RmiResult type.
> This was renamed after we introduce the RmiResultDataIncomplete.
> It is used in the KVM code to find the "level" where a command
> failed/walked.
> 
> I could rename it to RMI_RESULT_DATA_LEVEL() ?
> Similarly RMI_RESULT_STATUS instead of RMI_RETURN_*

Yes, that would make tracking it down easier. Thanks.

> 
> >   
> >> +#define RMI_RETURN_MEMREQ(ret)		FIELD_GET(RMI_RETURN_MEMREQ_MASK, ret)
> >> +#define RMI_RETURN_CAN_CANCEL(ret)	FIELD_GET(RMI_RETURN_CAN_CANCEL_MASK, ret)  
> 
> > These are obscure enough to find in the spec I'd give a comment just
> > to save the sanity of anyone looking for them.  
> 
> As above, they are really RMI_RESULT_DATA_INCOMPLETE_*
> 
> >   
> >> +/*
> >> + * Note many of these fields are smaller than u64 but all fields have u64
> >> + * alignment, so use u64 to ensure correct alignment.  
> > 
> > Obviously this is only going to run on arm64 so it's not critical, but
> > more generally u64s aren't always 64 bit aligned.  So if you 'really'
> > care aligned_u64 is there to ensure it.  Meh, arm64 so fine.  
> 
> Agreed, I am worried about the churn in the consumer code. Also, like
> you said, this is only for ARM64. So, I would pass it.

Ok. A tiny bit ugly but x86_32 adoption of RMM 2.0 is likely to be minimal :)


> >> +
> >> +struct rec_params {
> >> +	union { /* 0x0 */
> >> +		u64 flags;
> >> +		u8 padding0[0x100];
> >> +	};
> >> +	union { /* 0x100 */
> >> +		u64 mpidr;
> >> +		u8 padding1[0x100];
> >> +	};
> >> +	union { /* 0x200 */
> >> +		u64 pc;
> >> +		u8 padding2[0x100];
> >> +	};
> >> +	union { /* 0x300 */
> >> +		u64 gprs[REC_CREATE_NR_GPRS];
> >> +		u8 padding3[0xd00];
> >> +	};
> >> +};
> >> +
> >> +static_assert(sizeof(struct rec_params) == SZ_4K);  
> > Whilst the assert works and is need to prevent oversized the
> > dos never seem to provide any indication of the final trailing
> > padding other than indirectly and I don't like maths on Fridays ;).  
> 
> Agree it is a bit obscure, but ...
> 
> > Maybe union the inner union set with a u8 [SZ_4K]?
> >   
> 
> That doesn't help if the other one runs past SZ_4K ?

You still need the assert so I guess that is already providing
the documentation indirectly so indeed little purpose in the
extra union beyond removing need to have magic padding in the
last element.  Mind you not obvious what that last pad should be
if it wasn't just 'the rest'. So, I think this is fine as is.


Thanks,

Jonathan

