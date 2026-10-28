Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793185213;
	b=lJbh9jk/rPxvKi25a95hpYOhUPIDL+Slfx05EOYD7pSdVfXuBTvnzkZwFGbtjMLRi920
	 82z9gYMjSAq5gAijdyQNp80F8oQ10iT4YnWT/qrNgwDi40ltpnNEW54eOe4Ld6NtEUhVt
	 lg7WHuKLR4z941IfKrpz+RVf2nUOeggoEVx76IrhOc0oilHUQ2zdVs5XPZ1p2nk7UnEiX
	 OAejCxOV9uOFOzBMVOz0mfX7iQ8QAQFF8RkFmRwWQmUz2X9MtVXpY2OeSvDsFG3o4z7NH
	 jqlk43RzDxvKlvlcpBMqmZeF0Vy8+SettFyJk2ImlWKNgzwmJXEiTho2gbajVzFnPpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1wa+/owR94gXnrAcOckNHscnr8fLSqcbseBqLJMCJV8=;
	b=ZugPStxlPJy99M72HhWM8w0FvKD8QnJI2xJJY/5p9tZiFPijTnFW2gONPtCW6eIn+hZa
	 VHCPMGRfEHYPOzbFNw/g8wD3TBfQAlefHdm1erW5Yy00eQ7SoRAj6f68mFF5Fc95POUOF
	 8PIYPmyZ3rqNvEJ0ccupaynjobCwocA2nx1N0ORQK3jUeKVnV2rl5geWxAtvP61bhJPY2
	 w3Qw9SxaYOd7JYprBvJ0MyuhU/0wcIfYnV3Tp1dQHQsKOR4I7WUa8R3ebEMt9dcoIbbbY
	 BCnnND7sQpecRmW3V8c05+1UOdsvFgY8UiTrz3B4QGuhGeIjoSzJBYlRGqVBA+adWjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLZUaHMv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TwwPPUDa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82340606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82340606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLZUaHMv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TwwPPUDa
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8hJ893768373
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1wa+/owR94gXnrAcOckNHscnr8fLSqcbseBqLJMCJV8=; b=YLZUaHMvORb5+JOm
	pG6DIHFWDZCgl6lavcglKsmKSBHvYojRNB2UznE7BHNJKjVtjehpaXBSngpbtnCk
	OCsMb6xLFLL3Jh43HIREbPjEargv4QqJED5H3FeXVbxaZZq4l2oKrdsKuJYSw+L3
	hQ78YRw5ihdKxJhXhM6aPpnwoZa3jIod3pDbSwgb03x7caVeMeOfyClpTss+NY4R
	5W5yXsZZSkpoN829u+IQ13XhSJr3O/Z1iSKu8weAgT/rYrQsz2dArQgUcPf/35hf
	PpGI1UXTWE3PDnkkbsMwa2L6nA31G8p6B3vQreWi9edsjsOrUuoq4Ge+uwnY//sI
	XZbljw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0fpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:00:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e8dd9b9743so8718235ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793185210; cv=none;
        d=google.com; s=arc-20260327;
        b=kTDkCqumsXsUFCegKCNpYKmIB7aIogLxzosC+oybsMCAfLZmWJ0th3J2ehmhRU8rRb
         83KPDY3Di6zM6CNKqaGmQxJC+G/XMOSYKpAX+oa+drL3M+/IntwKwBRyl92nonpTPnA6
         xxf2mrOy9MaNia191GZn1jE1gegwxm7x2OTg2KJhci3tnimzipGDJwVaKpj44xXFP3d2
         ocM/CPjQy37uCRp/dDDSdzActGsnRIncXwPjm1OMUdUyvVLDmw+ylG85e/L9JXSPzegj
         EK7pQows60ytk2l+nW9OyE9/y+XVjS/4wBfGDJ7gly6pl0i1TvTEaUtnFoIa3GZleq9U
         dDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1wa+/owR94gXnrAcOckNHscnr8fLSqcbseBqLJMCJV8=;
        fh=7YCoQmKYpu8O4T3Jnzv0gc35/mI4xU2LsWH8exG1jpo=;
        b=lS+F981YllpZFsgtZ+sz828kzdmt6SNxuRUnMT/o3npkf+dfBfD66ufpSug2K9Xnzo
         n7TjwJ6mR1lM5cYo3ijjgVJB6y+iHTZ9NIdZpHaO5zteEcIPKMKgRk+oDIy161ojEajg
         29eg6oiGgQf+20X7shRs/bkWBxKY3rKsKF0A1s1FUV9/CVI6b+fyqQCgYMx2+KCB+af9
         VCcnpHwyV7iXVHqTAzc3kw6iFLR+NyVO1pkMRyGo+mekXXGXf5wgyEJXxMweL8+/FaSK
         ljGLviul/ZBqbQV2dI12akVHJIV7Qrq/kkAoTuf20oPMdUiQ+H28KMJA+Vbi3JKJ2W2f
         PkkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793185210; x=1793790010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1wa+/owR94gXnrAcOckNHscnr8fLSqcbseBqLJMCJV8=;
        b=TwwPPUDa0jtCCNmldKxmcrc9NtQgN0xgFHn7Z65f01ViRnrPtkmqFpIKItmIqyk3Sv
         B5L6lhtFgmcE/LDKLBvSaB+shejfHhYyr0TZYe0J/CQqWLk/GX1xQ+lF8YbGiBy3J2id
         9QfnFej/IrD53IvxcpVc4Em0c+JTLe6Ma5F++UJz2X0tsVboaadbm8yjbnmOXAQ9/zA8
         n/va1fQpbSC6DAoYdnUAas0RzlUFKnoPpwnwyzEUwq9/vYRxhywLTmGHYVlr1GxtVi5J
         zkLFeLqcg+Zpyv876RkTkm5tEcPB5tBp6Fl7hENjfj442AfOsan7ZSCrnnUvj7tPn2dN
         xBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185210; x=1793790010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1wa+/owR94gXnrAcOckNHscnr8fLSqcbseBqLJMCJV8=;
        b=I3/3UyRNR+4p6uN0lmnaHz6TsCjJYERVIJEqzof9WHmVJjaRUqfUVfNNXHpmXb9+wS
         3oqFFfxr3obckZEeQExN/PgmI4KssffFLv30mWELhx947dimkXESNFrm5O0kEOAFq5Yb
         tzMBkexhoMUU05e2JgjnNGz16VJmVF0KSMIP+6VgDB8exo059HY0gDQKpUjkqFE+Dxuy
         Ndjb4Ijt5sMkxNPPfcTen/HnxZUKn0ql9XbwR9Vci2zksrbN5CIgrYO/AZ475+9zAH+2
         UtHY8DKodz/dqitmW1yHKRVmqR5E06L73dM19mXL2GbgtDHt1eG38EXxxnFx0qpKdk92
         sWoQ==
X-Forwarded-Encrypted: i=1; AKwUvByQd4z0OVjsRbDliDzAOSQzjK745/KUSOEJffif/CbbP/6aUgbxUJEMCWUxQwgIOPZO1/apbHxKjjZngdA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHxJ6Zg3j34YOPqWL+IVIDKICYhNd4KQ9K1bZ+L/6GBIHSEudE
	ckismFcLEI/9fsZeBiZKa3vltbKUA66HKyWP2qI2CmnnWnDGqd/F6G/KP8VW09kFQIh8RouxRVZ
	fTLsp4GBXSfMS1I6sLVexkjQuEx4dxxWg9HbLYy6OBueD45+wckwNY02Eu1KQjKGCEOHHPVtrDM
	NIMEsZxXkcpxgfTD95PABYlTTI0nCbi0whX+Ce8DBWcg==
X-Gm-Gg: AYBFou2MDqKr3OQmMNtJkiul1UekyekBDSlDznsSZyo6unTdtELvAxZAVD3le2zj/f8
	bzU50I5z8feS/2XiPYsEu4pAak+sda9iIXvw8rXa78cg6bdLOqaAHWiqCWpaZ1uR7qt3AmVplp0
	ngKwhd9YllMQU1hxf2ovDnoMTdFomg3lkmSSSZpakWEzakjjw3xYo9HoscViTKQmnOc9deIrptc
	nZMjGpCbZXWyySpQA==
X-Received: by 2002:a17:903:244c:b0:2e9:7dda:bfd1 with SMTP id d9443c01a7336-2eb003cdd36mr19355725ad.30.1793185209838;
        Wed, 28 Oct 2026 04:00:09 -0700 (PDT)
X-Received: by 2002:a17:903:244c:b0:2e9:7dda:bfd1 with SMTP id
 d9443c01a7336-2eb003cdd36mr19355325ad.30.1793185209362; Wed, 28 Oct 2026
 04:00:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-2-3c402c66f388@oss.qualcomm.com>
 <20261006-romantic-stalwart-seriema-90e71d@sudeepholla> <CAPx+jO-T_0KT3GytYu8w6QvrhXFQNZQzR496RL=McU6rnMtnPA@mail.gmail.com>
 <20261009-frisky-rottweiler-from-avalon-6c409e@sudeepholla>
 <CAPx+jO-_aY5pMnWyy1hAs1WRmfW33vc317jdtBsEXYBoHsPfxA@mail.gmail.com>
 <20261009-skilled-mature-bittern-2206fc@sudeepholla> <CAPx+jO87gkTumF=Tg=UPWpJO6O-CRF4njT2KxQ3f=4nF5m7GiQ@mail.gmail.com>
 <20261014-prudent-mini-duck-377cb6@sudeepholla>
In-Reply-To: <20261014-prudent-mini-duck-377cb6@sudeepholla>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:59:58 +0100
X-Gm-Features: AclHuK-LQgnIpxOBv6YIR41I8lr76Fns1lvAAUTxZNI-80rsX3bNmiwX8o5xW2c
Message-ID: <CAPx+jO_BOwbKeRytBezm+piLhb8Z5N2eQO=LRwBQoSZ3kXOpwQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: Add support for system-suspend-only states
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: IX1-QzcUnoEjqgfO6IV9WbMRLbcyGSC_
X-Proofpoint-ORIG-GUID: IX1-QzcUnoEjqgfO6IV9WbMRLbcyGSC_
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1d5ba cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=Fkqsunai0WhB3pQShDEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MyBTYWx0ZWRfX9ArPWYf1H3jF
 yBs2hjsJE2FTtEQ4ADoHRTysGZLU6DYrhAx75jPVkpBpnYuH+SKT2sjkNsI5I1vBnabwfCNFG1F
 tlE5A6ht+17zlB7wARGiSEPH9ZQChYe2WnqutnDUTWYqKjss+15hf+Hwu9l7x0A/TeEgsjIwlq1
 MWonWOpdxR1T/w24drI3NejIaIGcIGefdMB35Of7CryzNC3sqyyqnWMj0HnKk6f8E+Z3ihNKABo
 mtaqRcwD8godnL0tskKUYn+k5FZwjunnRc6EOiy5Z/mqa4Ks4KpJrsT/ByiT76mvkjDoUbBVTib
 MTdsr5dsdoxZrQD+jY5B4g7FcMCiy2HSDw5Xha1yHMB/TiKmy9nGz/aCaDfz0XtOWgZwszfk/m0
 sulVMFMREPVtE9oUQFBRMyT05hxqWyKH/HRn0RA2Z58m+aunIAZow8QDivpxRBV9RdjsYWZnr8K
 /RW0r9q0LVL8WgzzdiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MyBTYWx0ZWRfX4WSpttbwf+2f
 1IDhXb0ZlHg0s+2hq+7w03DbPq41iKfGQXvJ8rSJZ3jt/lXayM7tlLcPKxNwaUt1bpWmhWQjhjq
 EQ92VpVtYfaBynMxB6kY6zRP1rYyHRQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280043

On Wed, Oct 14, 2026 at 9:12=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:
>
> On Tue, Oct 13, 2026 at 12:11:36PM +0200, Ulf Hansson wrote:
> > On Fri, Oct 9, 2026 at 5:27=E2=80=AFPM Sudeep Holla <sudeep.holla@kerne=
l.org> wrote:
> > >
> > > On Fri, Oct 09, 2026 at 04:26:38PM +0200, Ulf Hansson wrote:
>
> [...]
>
> > > > If that's the case, besides that the cluster PM domain topology mus=
t
> > > > be modelled accordingly, the display device should be hooked up to =
the
> > > > cluster PM domain it belongs to.
> > > >
> > >
> > > Ah, I thought that's the way the whole domain-idle was modelled as we
> > > started this OSI discussion a decade ago with an example of CPU clust=
ers
> > > sharing power domains with some other devices. I am surprised if that=
 is
> > > not the case already =F0=9F=99=81.
> >
> > It works fine today, I was just trying to explain how it works,
> > considering the use case that you brought up.
> >
>
> Ah OK, good to hear. For once, it sounded like that's not the case. My ba=
d.
>
> > >
> > > > Beyond that, it's the corresponding display driver that becomes
> > > > responsible for what should happen during system suspend. If the
> > > > screen needs to stay on it may need to call device_set_awake_path()
> > > > for the display device - unless it's a decision for user space that
> > > > can control the behaviour for the display device via its sysfs node=
.
> > > > If things are managed accordingly, genpd_finish_suspend() may decid=
e
> > > > to keep the corresponding PM domain powered on during system suspen=
d.
> > > >
> > >
> > > But the s2idle and s2ram anyways suspends all the devices, so they ne=
ed
> > > to vote in for the power domains to be turned off. If they are suppos=
ed
> > > to stay on, the system enters the state it can based on the other vot=
es.
> > >
> > > > The above said, $subject patch doesn't change any of this. It only
> > > > allows us to use more states (deeper), which are limited to system
> > > > suspend (s2idle).
> > > >
> > >
> > > Still not convinced, if all devices are plugged in to the power domai=
n
> > > hierarchy correctly and the domain-idle states represent or carries
> > > the entire system power domain topology, we shouldn't need this extra
> > > information. Having it make cause issues when it conflicts with the
> > > topology information IMO.
> >
> > No, it's still not sufficient to model the power domain hierarchy corre=
ctly.
> >
> > These "system states" are special since they require additional
> > coordination in FW/HW, to take into account votes not directly
> > controlled by Linux.
> >
>
> But if Linux doesn't control, some other entity would vote and until then
> the system shouldn't enter that state. Without knowing that it is system
> state, will the kernel be unable to choose that state as it hidden vote
> is invisible/not tracked ? I trying to understand why if Linux chooses
> that system level state as part of idle loop, the platform can't downgrad=
e
> if all the voting requirements are not met. I am struggling with that
> and want to make sure we are not working around a broken firmware.

For OSI, all the FW would be able to do is to return an error. But
that doesn't prevent Linux from trying the same idle state again and
again.

For PC mode, the FW should be able to downgrade the vote. Although,
from the cpuidle governor point of view that would be suboptimal as it
means that we will try to use an idle state that isn't really possible
to enter.

>
> Sorry for being pedantic, but some real example would help to understand
> it IMO.

I will coordinate with Maulik to try to share some examples.

>
> > I realize that the description in patch1 should be extended a bit to
> > explain this better. In principle, we can compare this with the PSCI
> > SYSTEM_SUSPEND support. The difference would be that PSCI
> > SYSTEM_SUSPEND is limited to support only one state, while the
> > $subject series would allow us to support multiple.
> >
>
> I understand that part. SYSTEM_SUSPEND is sort of platform co-ordinated
> once the requirement for entering is met.

Right! And I think that kind of explains the problem we are looking at
quite well.

These "system-states" are similar to how PSCI SYSTEM_SUSPEND works.
There is additional coordination needed in the FW to be able to enter
these states.

>
> > In regards to ACPI. I think this is as simple as comparing it with the
> > list of ACPI S-states.
> >
>
> I need to check if we use ACPI S-states via S2Idle which is the case with
> this patch set I assume.

Yes, this series enables the "system-states" to be used for S2Idle -
and prevents them from being used for the regular CPUIdle path.

Kind regards
Uffe
