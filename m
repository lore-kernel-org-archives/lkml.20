Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE2D37B014
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788203793; cv=none; b=AxcyWDAWHZfuLLN6vYslFzgjS/1L4Se6Qs8Ft3XYQwHwPgqzSd6ei7CnHM7oIGuw7FpOSJSLVcRE8rCfj7RG3hzIcGQ372LZdG+MSz39Vmc9nhjV7YnelyrKWmxJZGGLrsyxwcF3Gk/+cOmR2IfxZJa6/BOD/YHciI5ozLhqzpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788203793; c=relaxed/simple;
	bh=+2ZbtuUMWVCvFIdHYaupERfsGGjfhSJYa8vkKnBMUHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AW+JiJVRQWg1YdiwcfJXJ6VDT1se5xz55dw53ZVInL0dGOIuG6tsWdYOaCBSFG8+l7QmUHm6M4yad0ly28O45Ipz7O0MmxKG2Ct5nQSN1IwKWH2uvP6RL29tqlxeR5rvHqtzBjnvVMIrDBQ2HTK5t8LvhxJpZLDCT87zXxRdPi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fOEKFAqw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJkjYS7W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fOEKFAqw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJkjYS7W"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIYpln072370
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XtunflAjjfEhiEFSwZiGBkHk
	w6VEPgFUeulyvG2pbGc=; b=fOEKFAqwD0zJ0quBtLLuXWuQwEUw/M5OjWlpeg+g
	8u9UNdXWziBvjkW6eQpAXSdeUcoxIAqkI8vijJm1Ih2xBQQHSVKqfycrpc1IYYec
	a3uVyR3WdYwTiiSAWygYOAHHffGkUs4b4Q10MXV/xNTvReUzKH6ZybydFzvL/Hh7
	V3Nq7pJu+/l3bcUJ8CpPD9ycVGyb2hyA+VQ/kmXQqkkGCDbNzu8ZvYzPVi/aO8qN
	/exVobxIZRVVbD4k+3pFIfUBlUf8sbwiVO2hWCyeKxqI7rWu0rS5TBuSw+ZezZ70
	Iu2kp5FIPDcCjoF9bWCJxFwhIdl+zOGhLusAyobxlE6PvQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yatpny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:16:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so142491a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788203788; x=1788808588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XtunflAjjfEhiEFSwZiGBkHkw6VEPgFUeulyvG2pbGc=;
        b=JJkjYS7Wfs61iWlFZglN40TMp4TZFBtpPi4t2sURfqRVYyNxA6nifqEcSLZIRzFdVl
         CL1V+UVQX1NOHA0VkfBsVdocBauB3k4shPg1C1/PqN6hAJElcWJOBQdG8EFjw0iKNkhr
         A/UfI1Kkl5e/XKlGn37lIhMNkcmzhoHVs5NiC+gBvNPMkIeze/qy5E0v90bfHX2ZiPmJ
         VeQW6X7th9xejQIetO5k3rYsOpoxDDEcLHf9jgmuIx+hW6iBfb5rlUsFhU12c17Kr2oU
         PvZpIqzrykXKUCW4NORfdusOlc1TUE29UF4HmyLL6qiz3FogcVncnnO5C96iDwTWNltK
         uHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788203788; x=1788808588;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtunflAjjfEhiEFSwZiGBkHkw6VEPgFUeulyvG2pbGc=;
        b=kzYKCFeJUgpAnbBi+ZYCi8Zgzt8KOtXBQfLmnk+yAkRJWJj6cBaVB34pZWQ314iaeK
         8helu9sfS9zhJ6WhesCoTpnTc/TrhhD5/f6F9o2Hw2+o/iUaFDvnO2NuuwXH8CC2qN+j
         QkFnsv7KlDHiwo0Zhb0r24ugg5ipY8einBoyD60jA9S75aa6znUhARwtxd+9JJPjUUsb
         WxxAbb9UIUhhhyYOzwuzpg918WrK3D9Byq3tb61UvvafIJ4gFy5ENP0Sj9a1ZHxKuXfs
         xJi32vw9v+3tFlFVEB3cnyCBf5YVHF+NbuE+kVjakslXx2sBSFP/lerQrF7fg/MxPe63
         AmIw==
X-Forwarded-Encrypted: i=1; AKwUvBxtah9iHF0FmdEZ9wA3Gqj3Deyxv8WthXV6NHU7NMHp+pH97kvSXra4mCEagiFbmAU+t/GMFIPYxLotiC4=@vger.kernel.org
X-Gm-Message-State: AFuF++k6GZQJHK2752Cbjhh/VT/EiA148u8kkHuY5sAvVXCoBNjaeZ6T
	vRCw5IoQmw+EDPpHrqxgG0xPBdP7i7q+34LTSwyOYegJliaS6rm9PvJjrLIiizhnsywOeDLVfLS
	bcw3OafCIeiFv8Kde2GYwTkn9hDi92N55wcJ5R14+QKJVYmBJKt36ssfbGhInHNb4Ts8=
X-Gm-Gg: AYBFou1pyWyhH85IiHOnIchDh5FELdIsd4W722VGEZvqNFIoSXo+50qEAnQWUEkCt83
	VMmkXiYXGUs1uFXaLBnE/WZ5HjfEWLCBl3OtciER/oZjdtY+iIqvZfSVUJ6X1AquX5z6gwJ63t/
	Y1CWIyathiIXveuWil7vVdQ7eKohWYIBaiI6X2NrJVJyd1Adha2rn2vEDYw1VZbAuZGXplCqqq9
	zsK3GTTRDOlWGgPykw5kYFUyhBfgKowMcbp4R4/mdyCjJK2HoW0ffkx/lrwLqm8ginhefDnpQT0
	D3bNEUFSyGE5bmmzR1YMKvjT+ZDDk4QUbN5WKRomXb2UROHNv+/0ulx79AtBagWdSi77c327T7R
	PwiVOM/XgFL+FkSZzAMLY7ChtPS4=
X-Received: by 2002:a17:90a:e7cd:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-396d0e71ad7mr40950155a91.7.1788203788052;
        Mon, 31 Aug 2026 12:16:28 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cd:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-396d0e71ad7mr40950081a91.7.1788203787364;
        Mon, 31 Aug 2026 12:16:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d40ac7sm29063703c88.7.2026.08.31.12.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:16:26 -0700 (PDT)
Date: Tue, 1 Sep 2026 00:46:21 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: qcom_q6v5_pas: Add per-PD proxy
 performance states for Hawi CDSP
Message-ID: <20260831191621.ogqnsmvzv3o5mlbq@hu-mojha-hyd.qualcomm.com>
References: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
 <20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com>
 <apWhseqV8vdufajf@baldur>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apWhseqV8vdufajf@baldur>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE2NyBTYWx0ZWRfX5dd/R3edsvqV
 nWi3/1q/JSw16eoQk3Q6zBcmsSppSVzYHRcZbhOrulxtObIvLkWs1RJm95SWdYDKyvePFi12/sd
 96JaiNKY8nX8l7mcU3gQELdjsvCZSjo=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a95d30d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HtCTlhq_qHtLlGlR9k0A:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE2NyBTYWx0ZWRfX5NNK5U67xkhZ
 Wmh7n4p/IlWycxW0LxihTQpZKNRQ/us64ohNZQigBZFKz/e9Tonu6Nh29s4+yiXMn+6uiWb3tNG
 UneFfQX68go2qu854Fb4v4umB+40F+m01UnSUcSw869+sGcdb/7X9wP0DNJPg5kD/hspCTpmCXv
 PUQ7pJJsMI3tPnJkg9KrChYGhuUh8BGaxbRKDhjTMIM+VZa//C0XHrRu2XgfJKd/nuUyEDG+L3/
 iRw6Cxbp52ZfslW31Aakz2AunwpoTC4Gd8H8oL61c375LMrBqub5x/HMNtuEaR9MX58cED0n3Ah
 BWvAk1ZCUBPvAITpNxCP2cbJ6nDKddmz+imZY0Ha7JZOvYZtGBu+DgY1BKPCHYGlhwyz8uYrT75
 eEx6DWesdQuxkewFxVC4/QYQ+Ym2jWUdJnRTMgATVmJBlxPQ96aGVKdYsMFHwUNwqYsuL65E/Df
 FzvL8P01hiK0i8ICFcA==
X-Proofpoint-ORIG-GUID: RXYm84Gim7nItO5OiAClFHH3hv8vWmFG
X-Proofpoint-GUID: RXYm84Gim7nItO5OiAClFHH3hv8vWmFG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310167

On Mon, Aug 31, 2026 at 10:56:55AM -0500, Bjorn Andersson wrote:
> On Fri, Aug 28, 2026 at 11:43:11PM +0530, Mukesh Ojha wrote:
> > The proxy power domain enable path currently requests INT_MAX performance
> > state for every proxy PD.  While this serves as a "take highest available"
> > hint, some SoCs require specific per-domain RPMH levels for correct
> > operation during firmware load rather than a blanket maximum.
> > 
> > Introduce a proxy_pd_performance_states array in qcom_pas_data to allow
> > each proxy PD to declare its required RPMH performance level explicitly.
> > Platforms that do not populate this field retain the existing INT_MAX
> > behaviour.
> > 
> 
> Is it possible to encode this using an optional opp-table instead of
> filling the driver with such details? (This is a question, not a direct
> suggestion)

Technically yes, via required-opps, each proxy PD would need its own
opp-table and the remoteproc node would reference specific OPP entries via
phandles. That is heavyweight machinery for three scalar values used only
during the transient firmware-load window. But let me know if you see the
benefit.

> 
> > Also propagate the return value of dev_pm_genpd_set_performance_state()
> > and emit a warning on failure rather than silently ignoring it.
> 
> Also remember that whenever you start a paragraph in a commit message
> with the word "also"; it's probably a good sign that it would be better
> to have a separate commit.

Agreed. The dev_pm_genpd_set_performance_state() error propagation fix should
be a separate commit.
> 
> > 
> > Add Hawi CDSP remoteproc support using this infrastructure with the
> > following proxy PD performance states:
> 
> That is quite weird, because you already stated that we added Hawi CDSP
> support in
> https://lore.kernel.org/r/20260427190614.3679937-2-mukesh.ojha@oss.qualcomm.com
> 
> 
> Note that the line:
> 
>   compatible = "qcom,hawi-cdsp-pas", "qcom,sm8550-cdsp-pas";
> 
> is supposed to tell an OS that "if you have an implementation for
> qcom,hawi-cdsp-pas use that, if not you can use the implementation for
> qcom,sm8550-cdsp-pas".

Yes, the April series added qcom,hawi-cdsp-pas in DT as a fallback to
qcom,sm8550-cdsp-pas. The NSP proxy PD requirement was discovered recently
and I realize you are right. I initially thought nothing was changing
between the HW description but the performance states, but I see from the
point of view of someone who has the latest firmware or DT and is still
running an older OS, it can result in a crash, which is broken.

> 
> This patch tells me that you need to also fix the binding to not say
> that - because hawi-cdsp is no longer compatible with sm8550-cdsp.
> 
> I'm guessing that this issue might have been a late discovery, state
> that in your commit message changing the binding.

I will add a binding patch to v2 that removes qcom,hawi-cdsp-pas from the
sm8550-cdsp-pas fallback list and makes it a standalone compatible, with a
commit message that explains this was a late discovery. The DTS will be
updated to drop the qcom,sm8550-cdsp-pas fallback string.

> 
> > 
> >   CX:  RPMH_REGULATOR_LEVEL_TURBO
> >   MXC: RPMH_REGULATOR_LEVEL_TURBO
> >   NSP: RPMH_REGULATOR_LEVEL_NOM
> 
> I'm guessing that what you describe above about INT_MAX being a problem
> is only for NSP? Would be nice to not having to guess though.

Yes, for NSP only. Will be explicit here.

-Mukesh
