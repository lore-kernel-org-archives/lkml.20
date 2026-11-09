Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231635;
	b=iH9Rfomh43fKeSL8h2DJOO5TImV96oT3Iq9G+6cYBsbn0aRxEWnBW9bJiLYyrX2o9I2S
	 1Q0aHV2IzsXasR680oJE6HkvvX7IRVfGKpGKn7F4OWlATdg+/oeIbd0+lff7CNPcHAtLR
	 NeQiQkk04d8DTfuc5JAco1nySXfdZxK/idTIqdQA3Q5DYD5jYCXJqBwp3eR7fGBOxcLYG
	 S0EFfkm9BlcwRS+WY/GU05WHjBqQP8OrPjOQ9XbqjrIAhwDda/PFBE9H1NIN07a37ACNu
	 4tCe27XPPxUeLZACjGjCuzHb6M0SSFE2/gsFnUSj8l4R2kBPqr/QCtsRp54VZ213pSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231635;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:Cc:To:From:References:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=stL1JKpLENIa1vUmHvq30/7t5g3i5/ptiQmFu/xq4lY=;
	b=WvtYJhDWvFANzkP2TqpmSIl9k2IbgY7fPDkIxLI1K9g6PaqDh+iIURm3kGqWW4z79XTZ
	 0pqvdMTQq7fjcgup2u7m4VcUYbl5LpJRKEvcdwwXgsr3EAb5U37LdvbbRZ/DFHJRIv97h
	 bDzMEqQ2J2kF9pTA9J5l2JMPXn6U82ISXQwbZFrjIj+vZVCSye2nMQKWHMsEfAj8N+zOP
	 3KuM1F4wxRBzU2XE7PuqUth3hp9jrYqL2qB+bvBaA6TMcuKyhpJgdkTMGFEg15hIg4GTT
	 d3FI8GuMb+NKDsRA7ZOC947h9tl2MZ1aHYSTVDTC3aTOC59Jkq00PbKcGxCcvYvP+XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hdrCX9YA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jquja108;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2685606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2685606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hdrCX9YA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jquja108
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF6D8359175
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 13:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	stL1JKpLENIa1vUmHvq30/7t5g3i5/ptiQmFu/xq4lY=; b=hdrCX9YA6cZwmDEV
	8pCCwfb3TOFQOmMDaBAJ14wtdNnPy82Ng0SrJ94iNW4l6ihxDz3eEvLvT3wjwUdO
	8q3bXYEUrMxDouNKs5s6B866vYVquxMuq6f+qZsZByg4W9WtKSRAN4wmDjc2S7qv
	e4hgOliiJL6I+8lBSCQeoVWBROTyA5vMdu8HA7W77m4LKqmJ3sf6SkNNuqFsgktS
	p1hcfeQBmVIT9uga0DvzcZJYmTRP9AyB8neJWCzGZcBY274rDpXaCKO7wUjdDteJ
	W9atcgrfuPQ3RPRhjOCwq5I34fvSwjcI3GpjBJjKnFswnlU9mGmROBXZL8eJt3eX
	0/CviA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2hv83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:40:33 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2ec691518so703975137.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794231633; x=1794836433; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=stL1JKpLENIa1vUmHvq30/7t5g3i5/ptiQmFu/xq4lY=;
        b=Jquja108VmHPbWb0XIM+fPx0B/YAaNwwNbTJ1zJmeBHQlN480FPThZp4nzg6QimD+K
         7xs2yaejHDPNAYw/JrVFS3N+gRwBWqp4A3dMuKIU3noIYiAG7HMHpkFG0I9w61NMACmC
         hT5PdYypFYsW4GZEJG/ReiKiqtLe3a0kDzdeMlWMNNXdrXUg/+pWV8LNYDG2bOHNwE0J
         j9mq2UkwRisfvE9yBao/m4vJyvU/aiGbPA1xO2YUpAUeiR2NwKvdj461A2t7T0hJKGcE
         eH7e7ZLN7LREWgCdCRIodn1Blj6RgfyKFiAzJHsiICfXlr5SEWljaBM/4dFF74zdjC8x
         eccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231633; x=1794836433;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stL1JKpLENIa1vUmHvq30/7t5g3i5/ptiQmFu/xq4lY=;
        b=j/Jt3imXqqNpRmI1oZOqC5aWX/OrtEg9qFQDafV/lhAzeLPtmS8Dqczg4cebMniDnj
         Hif1qRMiJz8SP1mW+yWeWnInM0ikaCLAj8ediPRNUMAayhxJgmizWCjfsba3K9iq9Bif
         MhKyseS+I854c4XFMnEcs2+VUnCYHu9YP/SCHbh89iiw6uT7bIFs3ONPKvHdBvZzWc3z
         NIiaOH4rpE7I3Wn26OyETwu9rQoD/36FkSLQR/rsBs5J+/iOg4bXom4yYcuJDuxVZ+3q
         9s6GGYLig/fYTldXLZ354wmFndA5hqWMroHklfopot/f+arHKKSt0n7N1hoUyczHx+cR
         sjeA==
X-Forwarded-Encrypted: i=1; AL+hErF8TTGZbtY2It2p4CX6wzB+0XE7XzYOhUoGbM6aPQR8fvABcKlWZExDuXCmuOTK6Q/gubWwdHx9ow3o6IE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vm2CIZShHlBqaXldpk2tL+LM4KwLAoz4mFgEtTG84xVPg/vpL
	qFsB7Piwe9euFtdRvykmQtFKvcPgXYOZFT1oFyV3Y2aH968O3k28q7fiywZrpA0IHj0gOMnDq3W
	gcW0eOOSCXC5pK88Phs/rtD67N99uRYohFHHA2lY9fouek8mS33bzjUyb3oQuAH3r59Q=
X-Gm-Gg: AYBFou1ucdOOtnHmC3MvZ8ElbN9HGpGniNmh1va54fmdZXlrAF0HCF0gPxpw0sx6JsR
	LQr0aRNYyQt4p1z1OByLXBEeZ1haUGcH8kP1xEzJHK2OhmT/y8BcXts2YV+6wEwq6sAOzz82FeZ
	iYI12JrKxUTds1Matt1n3hkdwrpidpMToc8EkKJ4Fof87aSeFbfRTXy3BlhgyeOSoRZyq/7NvKS
	tsMedQFipNRyxkmLlAhsFUpmhQnSGvC2qwkAdfuhPN8Wm+w3Fc2Ox32NahCApzzVBgmrC0BghcE
	1zXRocrydqAETpXAeSTUWKiGbPM/n5qVTfHDxb9Wz17jM9OKZ8vWxUmcJMtuyLkmCNpq0ZdRYXF
	dt6xlWCwspoAWzbal6VZ/TB1v0FyexBhy76u6TP4GIAg2TMpb0k98lmifsTcoyCykIC//dzF489
	jz6ob5Oaf+9tQ=
X-Received: by 2002:a05:6102:54a4:b0:7d2:d570:4742 with SMTP id ada2fe7eead31-7d2d570570cmr1011060137.32.1794231632781;
        Mon, 09 Nov 2026 05:40:32 -0800 (PST)
X-Received: by 2002:a05:6102:54a4:b0:7d2:d570:4742 with SMTP id ada2fe7eead31-7d2d570570cmr1011045137.32.1794231632134;
        Mon, 09 Nov 2026 05:40:32 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbe9e31sm198493265e9.2.2026.11.09.05.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:40:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 14:40:30 +0100
Message-Id: <DMQQ13TNRXGA.3KQXWTOX8OMCI@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] riscv: hwprobe: Report FP extensions only when
 available
Cc: "Charlie Jenkins" <thecharlesjenkins@gmail.com>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Paul
 Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Alexandre Ghiti" <alex@ghiti.fr>,
        "Samuel Holland"
 <samuel.holland@sifive.com>,
        "Andy Chiu" <andybnac@gmail.com>, "Zong Li"
 <zong.li@sifive.com>,
        "Guodong Xu" <guodong.xu@linux.dev>
To: <guodong.xu@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-2-radim.krcmar@oss.qualcomm.com>
 <179133089395.137225.157195939155119911.b4-review@b4>
 <DLYFU3VAEP3D.OTOZB5Y3BADZ@oss.qualcomm.com>
 <qqvfduegawuoerrzwnj7drxkev63gxj4ddqaw4eqtrhsalugrd@sodih7ytwhos>
In-Reply-To: <qqvfduegawuoerrzwnj7drxkev63gxj4ddqaw4eqtrhsalugrd@sodih7ytwhos>
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af1cd51 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=7zOU-n4moG5dCeRVheEA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NCBTYWx0ZWRfXy2zmHGloXo0n
 JkRxyjEdtSPLzv+TehM/Px+h/sE2jpM30bl44MQA05pIYyzOS1r83ShoOOJNEu3+WDPbuHADDhx
 6oOWrTabJV94w8nrrb9fBKfK5S0tES+6Pb5sMysbi452u08gw9rWcn66zVq7AsWmrkBmDWagP5k
 7gO1x7h2hiLfXWkshF8+AHv68818jD789TlQsaHoiWdzP1vv2T/nTrFEe18Z3v3t4K+1g4s5XPl
 vyXbmr/+yCwG425LhzkoXZRTd33qdnxOQ0GZ+XeIR2YPBuG3R/zTOkxfxu4olvhYfHlCxJxpk5A
 weRCuDwLqp6LvrgRZY6alPGXQ4fuwk1KYhDpuW5l/q4xQfPAGgOfAP+xLMOTvb1a0VqV2EaT06x
 p2WeOztIRgLbsrtcsaw+POfODZc+PwRcVLv2ZRsGKI8yKTfuyFwx58ZeoH8SYAPC8p7PPPC3Vco
 +QOa3DN6etenA+sq1mA==
X-Proofpoint-GUID: kNOfGfCDeaI4K8B0G5-U6xry85HY--FT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NCBTYWx0ZWRfXwwPg3Entii5H
 CB8CBcmnzjGpUJz5SylJIh6U6PNCTYvajS1ahOeGvNHhnPUNamZj7tgetLtbHYPhUsEdAJmhdAR
 dcWF71ZSg3ZYjp0Gx/cyDhS8uAYy2kQ=
X-Proofpoint-ORIG-GUID: kNOfGfCDeaI4K8B0G5-U6xry85HY--FT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090054

2026-11-07T23:16:20-05:00, <guodong.xu@oss.qualcomm.com>:
> Hi Radim,
>
> On 2026-10-07 09:46, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
>>2026-10-06T16:54:53-07:00, Charlie Jenkins <thecharlesjenkins@gmail.com>:
>>>
>>> The vector Kconfig is gated on FPU=3Dy so the vector instructions can't
>>> ever be enabled when FPU=3Dn.
>>
>>Right, I'll make the commit message clearer in v2.
>>(Zve32x and hence has_vector() can technically exist without CONFIG_FPU,
>> so future implementations might require use to remove the dependency.)
>>
>
> Do you mean dropping "depends on FPU" from RISCV_ISA_V? Today it reads
> arch/riscv/Kconfig:
>
>    config RISCV_ISA_V
>            bool "Vector extension support"
>            depends on TOOLCHAIN_HAS_V
>            depends on FPU
>
> Today that dependency also gates Zve32x, Zve64x, Zvbb, Zvbc and the Zvk*,
> none of these touches floating-point state, but they are all being gated
> by CONFIG_FPU, that seems not correct.
>
> I noticed that the _validate() callbacks in today's cpufeature.c for thes=
e
> non-F (non-D) related extensions are checked against V only, but that
> doesn't change the fact that CONFIG_RISCV_ISA_V depends on CONFIG_FPU
> (from a commit 3 years ago) in Kconfig.

V extension does require F (V is Zve64d and at least 128 bit vlen), but
Zve32x that we use for _validate() and has_vector() is a subset of V, so
we could have a config for RISCV_ISA_ZVE32X that RISCV_ISA_V depends on.

I think it would be cleaner to have the ifdefery use RISCV_ISA_ZVE32X,
instead of reinterpreting RISCV_ISA_V to mean the base vector extension.

At the moment, I don't know of a requirement to have Linux builds with
Vector yet without FPU, so we can postpone the code churn...
We do support those F-less vector machines even now, just with a minor
overhead of dead FPU code.
My patch is only for machines where not all harts have F.

Thanks.
