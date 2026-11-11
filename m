Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422370;
	b=5KF61f8W6FAE1iYvH6zNPH7ljSzUyBj2p43w9KryYxEIzgLedmqw1FD5xFYaSnML1rUI
	 kSk2Aj6C0zmSi1aK6CxBNoAz8G9ZDi6Ba7EX/g8dDXrVb26XQsEpPcQbA9+BQs+c1Z65T
	 Nypqvskiq2NCU7jrztOUVT+opvMPF5Pv4IrqljRNsd3lajFdgDqCcpSjMVAHzAeFPCFwC
	 M1+0WW4O60Zf5iKuOQhBXmIculJFmBuziAPllnvwXtvbLdOiiPWsN8YMdBJj2XrP1dpL9
	 62vPpmg5pwYsLh68pV4tK3zVL0U1SN3vwqnPBBISH756LKBDLTA8mWxilHb4cQyqN+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YRLMEN7xwMYs3ZpUgHAtG1UwTe/c78BkMK0uijF6N4M=;
	b=CrTcE4wWUQkfeBqXUJ7epAqjObs0pGaXCo+xY7tiSHV/j4SY+vW81g5ehXSTANyhXeK4
	 INe1V0+RKVfbr88chBn1hqAeEe9Xlnpuj7VVJYTAX+iBhZEbxCduubXyfdMhEwialb9Dp
	 bCy5EFW/vZ4BrJi4HUTo4E/YS71MogWJC3Hg8WoWXoB624yNJhhqRmmSTedJoAygHrzuK
	 9XMvRKRomtWrFg6FZNrMnsW4jxtOTE2reBAJCeT8B8HIrFQ3WK8k4aHaWBQ42k38dv3rL
	 5N7EFvctriRK4+TVeg6DxSvuY43cGrW9qcDW+LLMOB/+AiIsa4O4yPq7IkJxKF6+jiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BhHsZnpy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tg+A7O3E;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0D5606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:39:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD0D5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BhHsZnpy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tg+A7O3E
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABIZ4Ux3131548
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YRLMEN7xwMYs3ZpUgHAtG1UwTe/c78BkMK0uijF6N4M=; b=BhHsZnpyTizIvQNY
	Bpf9ADagu3a4kkxcvWRuGy/1uacyZjlq1SPZDqr1f981IisEhxXc+Km2rw6SWJa/
	B/Lyxbak5Jcqu6v3omddg6Ibx9i2+7+EcrCRWLoenZiDOWHGHYrPlBGlsZ1W3Fis
	lXGpOJ1MDRSXy8v/Sdt7mUPhCD/zW/bMJNX0fqEinAdk0kLFx/qhHIRmlYR0s9/z
	9qdsZOVu1QHii5KPlPptE+ZCJvOMsEPH1X+XrfEEEhA1RYR1S0Dd1CFDi9ORqT9Q
	36jtCPbZhj7jGoxgMcn5fll2goWlMsZIDKfeK7XmIhaEiKk1DIz9x4LI+Oe+7Hp7
	iQPUXg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmc7kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:39:28 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so4081028c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794422368; x=1795027168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YRLMEN7xwMYs3ZpUgHAtG1UwTe/c78BkMK0uijF6N4M=;
        b=Tg+A7O3E6Sj6L5e6OTbangZV2ksIHwTIenp+qdlgcdYhavU7xfJ3td50Ck+KnIUMuW
         bxZk5zIyrGiasC0UYY8pac6naeXqQdRjzGsqXhyqAHdHlvS1/KBqDi4KcdLv1pmdjNnb
         1zaeZmo7vRnnrybQjzyGg4ADze3WWmM7U1FnvEzVyx5CL/4Yp7PBvHYC5oCNTWIckh63
         5rXzsQEDc6HObsembe6YJgaw/mVoI1YzIu3fmNQJF9Dqhd/M+3KHT6hE1Mr6DaGLxLFi
         VcM4xxhjFbRPBMpjVJeRd1ZOmAwx9GFbNYQtEYewJvSXActaIXOd1obRW4wxwIZzSga4
         xVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422368; x=1795027168;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRLMEN7xwMYs3ZpUgHAtG1UwTe/c78BkMK0uijF6N4M=;
        b=LOzFKrnK0hM0sr+r0QFKi/JSh6cSRX+iGdk6Q4kCFJAt4wiVTIoYLYZIMnMDjtlAN7
         3UOb5uY43XDUWtGXeYaRE1sdc9/eWVkLs+GbgkvjLo5lg3jn1JaJE6ry5j3zOoyG1uR+
         ryecH5hY2PckWupm2J+Fah011rnyMYrbViydCeXDG/Vxv0+0cwac/4XnBBVVeP7Vcdny
         UQoc/nWgQbd+MXFvyR4qEBiXNY7jzI5AqlbVGOv3iPCa6inJBPl6Qpw4iWMUkJeDLNpK
         hJEcKUH4gJk2Nbh+gvSgjbRjoc0kmuGaDwR3p8vPSMaboiRMCB3Pftwt9BrL3mj8TS04
         LBeg==
X-Gm-Message-State: APuU4Z81fJrrwuc1E4TWXeK2E8qaJ4dIR1EVEOYeQj+6/4kABZcDdloJ
	xQKi5QPYuASEwP7nLvJSID04vJCp53xKnuLTIDEq1mv0jT37osYFyVyA41eh0zcOJQY1naARBAN
	YdPoQs5ivFO25BSxPTgu15nTt0eU0p2jd2K/7HTZK35CdKInIXgo1pSivkzikOkGc2ZI=
X-Gm-Gg: AYBFou15/hgz+CLJgNrKmfpgkVUVJZFVW0p4UGgprCjNhgp+ZvggMDs9YG798k4zB1f
	4v+/OSrfqQGmDklgcHJ0zAHjHEP9zEKGR+aUXK/GPLBXnM3I5QI9jRNAIrTbC3TmR2HYC0/CP6+
	Pasec2POWYsGFogfU33YB1pDFP7wYPCH1GO6ES62PUFR2x9ruiy2XJmeeOhFO7yxGJAoSmG2vwo
	OirehCkKMSu8hOiuij73M9bfXde1u8DJwGQ7OQOgiuepgT9JGzkd4j3zAmqlD/kM6OWRakmTNOX
	SNJoTcMq7Qa4s3idiHce/Eu2Z5ClDlJjg9VLRibBLTlblkEIdaseCxQBKWkOnXQuUxbK7B0Xnc8
	DcoxrNd+n54E8R6fnJsP9OVM2fow6GBStpM1fU09tPhYwggi09fma6X0WK1c05QanamMyezSa+F
	iJ0udf5ELSl8eGqlieeffxIBnWiXw=
X-Received: by 2002:a05:7022:f519:b0:1b3:a881:4d9f with SMTP id a92af1059eb24-1b3c0312e9bmr2813255c88.20.1794422367235;
        Wed, 11 Nov 2026 10:39:27 -0800 (PST)
X-Received: by 2002:a05:7022:f519:b0:1b3:a881:4d9f with SMTP id a92af1059eb24-1b3c0312e9bmr2813221c88.20.1794422366523;
        Wed, 11 Nov 2026 10:39:26 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b1003fsm16392776c88.6.2026.11.11.10.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:39:26 -0800 (PST)
Date: Wed, 11 Nov 2026 10:39:20 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261111103920.00004f75@oss.qualcomm.com>
In-Reply-To: <avRANKPwp-r-QSR4@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261110163809.000070d6@oss.qualcomm.com>
	<avRANKPwp-r-QSR4@pluto>
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
X-Proofpoint-ORIG-GUID: CKlbmPcmEPy9dhN_kU_45uAixfnRC5mq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3NCBTYWx0ZWRfXyzDoxQriTnVN
 sqFpkoZ1dq35w1bOE3eQVm/dIZfJmpX1O/H0rFi1QOcSEk1Ou9ueGoOI3NoZpbvhkWzawJGgm+p
 0qKmnXqHAht/I4UYmKJ6pxpraEr6584=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3NCBTYWx0ZWRfX4RWQxYleru8f
 93BHpX4bog6Hxfio7madY/dqMTyzRTQxNjOAiKEWTFLMGoT8N9Rm25wM7MnCK1OMw/u3Z5qSCKH
 ev7m0pYSX2f5pPl+YlJq4DkaX7GAoNyQj3GWThHo022UdVBBhrwPYqGbjZZHANRlyDX0KGzmZAA
 ZpvvrJd6TEkgi/9gC9TjUsPi1m8gpICMPgSKT42FM0N5x7z5Xv9RM1Ki45oQBj1TClFHxb98b9L
 TOvw9VMNo+wDR+ZSF0wAeUhI7yM0CvZVHTwteJOJ+cZyIihV2634+IJkNsvxdTFuESXpmDInh2t
 liVNwhScgt7figUTKULCufvoAuefuP5NFFZPUKriT6ULBialfF9XqbQxPyd1cyFCwlCWXK+Bohx
 Ll0Hz67mg9tnm8SGPHgo0tFL0b3BRPI7JBOHON+tPPGbIUM2Ci7OX1zbd3v9MsJNWurdF8nW83n
 bA179ikUuIlRq3mBPQA==
X-Proofpoint-GUID: CKlbmPcmEPy9dhN_kU_45uAixfnRC5mq
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af4b660 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=XOA6F6MpoYfF4Vds9coA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110074

On Wed, 11 Nov 2026 10:15:16 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> On Tue, Nov 10, 2026 at 04:38:09PM -0800, Jonathan Cameron wrote:
> > > The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> > > dedicated to System Telemetry.
> > >   
> > 
> > Hi Cristian,  
> 
> Hi Jonathan,
> 
> thanks for your time...I sincerely hope you're travelling abroad on some
> remote timezone given the time these reviews came in :D

I'm based in Pacific time these days so was only 4pm ;)

> 
> > 
> > So, the main issue here is pretty much summarized by:
> > 
> >  28 files changed, 12801 insertions(+), 99 deletions(-)
> > (obviously there are tests etc, but it's still > 10k lines)
> >  
> 
> Usually I try to implement the complete set of features of a new protocol
> but indeed this new Telemetry thing is huge by itself so it became quickly
> overwhelming to review...imagine to code and test it.
> 
> > There are relatively few reviewers who would even consider taking that on.
> > I foolishly thought it wouldn't be too bad (and I review a lot of code).
> > By about 3/4 of the way though, probably much earlier, I know the quality
> > of review went down considerably. Honestly it was probably a waste of
> > time continuing but I'm stubborn like that.
> > 
> > So, unless you have a path to bribing or sweet talking various folk to
> > deal with reviewing this with each having to set aside multiple days
> > to do it, likely repeating for a couple of versions yet, I think you've
> > got to figure out out how to make the first patch set more manageable.
> > Probably don't split it up as much as the mpam or CCA folk have had to,
> > but you have a lot of colleagues who are experiencing the same problem
> > at the moment. They may be able to advise.
> > 
> > So it would be nice if what was in that first patch set was 'functional'
> > but I don't think it needs to function on every systems or support more
> > than an absolutely minimal feature set.  Just fail to probe when you see
> > something that isn't supported by that minimal set if that means
> > the thing won't be functional.
> > 
> > Once that's in place, over a couple of additional patch sets you can
> > get to everything you have here.
> > 
> > So what if you choose one data path (shmti perhaps), no notifications,
> > events, maybe even simplify to one of the readback paths.
> > Maybe even drop event groups initially.   
> 
> Based on our real world initial customer of this I can certainly drop a
> few features that are not supported anyway by the real FW and move it to
> a later patchset, stuff like groups, notifications and single sample
> reads, but all of the rest is hardly removable while keeping the system
> functional and usable.

For purposes of upstream. I'm not sure we care if a particular implementation
is useable with the feature set initially supported.  We just care if
there is a path to test the subset supported (hacks / emulation, whatever is fine).

> 
> > Possibly even drop timestamps.  Definitely drop things like boot-on
> > support and debugfs (unless you are using that as a cheeky 'functional'
> > test ahead of the main userspace interface.  
> 
> Not sure what you mean by drop timestamps, definitelly cannot drop
> boot-on (it is how systems are configured indeed) neither debugfs used
> for bring-up and FW debug.

Timestamp variety is complex. Fairly sure you are allowed to report no
timestamps at all as one option. If you pretend they all look like that
initially it might bring some simplifications. Anyhow, you know this
code better than I do, so maybe that is harder than I'm thinking.

I'd still push boot-on out for a follow on patch set.  Sure can
aim to land that one quickly! Sure customers will
get irritated by lack of support for what they have. Taking equivalent
of MPAM.  The initial support for that covered pretty much nothing on
real platforms. Customers were (and still are) irritated. But that
allowed progress in the right direction.

> 
> > 
> > How much would that slim things down?  It doesn't even have to be
> > useful, just testable.  Realistically I think the hope of getting
> > enough review doubles if you can halve the size of what you are asking
> > people to look at.  
> 
> I am not sure how many lines I can shed with the above features drops but
> I'll give it a go anyway at slimming down the series after I have gone
> through this round of Sashiko pains.

If we have to fallback to breaking it into steps that don't do much
more than print a message to say 'stuff found' then do that. It's ugly
but MPAM did that, RME is doing that. No one likes dead code, but it
does allow progress to be made.  Ideal is end to end with subset of
features then add features but not always achievable.

Normal rule of thumb for landing a feature is sub 2k lines of code
because that is about what a reviewer can digest in one go.

Very rare anything above 5k makes progress. As Sudeep mentioned, a
lot of folk will open the cover letter, see loc and close it again unread.

Jonathan

