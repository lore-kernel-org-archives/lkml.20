Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794398657;
	b=BsXwkZinIvtVNh7Jo9o7Q7k6q9oW4mMXvj2iPI7o7izAJPFc8RggRkhRlMEXQkKBfFvY
	 2UJpugirIeZfuGsuGKA9HaXkbHpei5DGGXim/T2Es4aNtUkm4aLi1lCKEajnTAX4sZj/7
	 tVzZMA6HNMP+TpGR3xpgJMrzrI+WNSXOqqIhQqxxmzrcenyRZXfsBSjzSOjip/xEa9QgA
	 1NflKd22FJiGvN2WcTgGCaZume3jw0Mv+hhX6nGmZ7yEPRVs1tSXyioE5/fGX0/y4yjjo
	 kxlwEae6d4QlC6byjj0qs7a9ReU7T2hFrGO8XMmtjUkV+S7Ns1mf+LoJ7E8NohxVAiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398657;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=X1OC0sm6myreOr6GJJBSVSvkHjaBBncy/JIQDF7f5Ok=;
	b=0WJu9uRhHlD6pCH7WYb8x7iK4vOKcTyDWJ0YmioTpVVpUqtCNDKO9UWqFtBkd5haHD7z
	 siO7pBx8jN82GMM6t2zUsWThAy7CxczBf7DIppgskNW4tfsaiQUEbSPhbIK9pZWnO6ndp
	 vLxh4hjgSmegbExwvmONRZ1UAUlBiANldfpwbjwNCF9K4ec10L1ljkjnkYTHMk85a6sLp
	 qN3O3TbwOJNla/ADIzWykxQaimlVogqj6pIB4dpStK9RxnOjb5iqiujb+vCpTgQpzUjXH
	 U4WQS/IATVO34u9Nor6KHtwZiv1Hc3RWAFav39eV0G94V6yg/DbIm9+3wQu+IwFmM/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hlF7V0pk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJIYfsna;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF7C606A332
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF7C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hlF7V0pk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJIYfsna
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABBV2de2350801
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1OC0sm6myreOr6GJJBSVSvkHjaBBncy/JIQDF7f5Ok=; b=hlF7V0pkEwNptY6I
	k2qXpgfx4SV+EbsQQ9Lp2+M448er1GPThyxTMxu1Hvn9wzwZwxUAz9uID0YSAYKi
	H0IHQtNgUjB67AGWSXNT8UoqMGcvYo3HtLThXMVI1l+KiRPR/8dMg2p8p8mdotxY
	Ud60S9JdjuJLfb8xesADWi1W0HC+4qYKzZD4iVN+gTn1dIYI7nOxy/gL949s24cI
	HrCdSEk4aificEBQDtmBc8rJBEG9wO151qOTo4clJzhbEp+Yiwmg0B6QyiA+GKo2
	7rfKmcDvaBdg3c1tMGbVB3HrTyIs9Bu1Ap6B2UOs2vAX15bv0xiI1WNelN1aSa2K
	K6cjrA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp2cut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:04:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so2857999a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:04:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794398655; cv=none;
        d=google.com; s=arc-20260327;
        b=m5KqeOrcPMv1P20t29Kd9EEZJV2CdL8ayFiQ/rEgjqW3JPciFqoPQutQBpt0UftQCe
         2VyxVplLFrm5Q29M8hYjNX30FuPddtfKCoNEIX4TVfU9VsrtiGgUXehysDvEoLdVm1lK
         IWo/YbYHvXeo7UXTLbS4JfuvYQaL7PPQXWVZoEe5dHZ2nfgeqbWJ0sMu6ls4g9E+uAXi
         dALaj5GF1g3YbTC5moXuBh0OllwabzJki0aQFBFxZ9Imdr4dB/at1u6w65iH8+ekRBCN
         ba6pu9RSMDBJ+cMXanWlG81AAZKlQhVG7Da4Lpvc/be7MuAAI9V2OhgNIatym+xatpuz
         8MXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X1OC0sm6myreOr6GJJBSVSvkHjaBBncy/JIQDF7f5Ok=;
        fh=Fomaunxx5k3lzIKr2D+8CAkCFuexpCg8OUWTicagEL0=;
        b=BaylySnnLZsv05k1bAXxSVT9XO/v5R35WGf8YRPwrtrP5RRyrsfl7Ct0H81yzljvR0
         jXK5oU0Mc2V628KXvI0zqt3vYKjGgYoF2FVbIEkjBOySMRP+vkPtMWSJDzwmzcwdpCv3
         BrPOuDovtuoYaN/IGWNHY6mBEgMHBImDsvw10PxoMQcdb7oKnA715X6fNUXIaq2CyAte
         EaxlEXSruU/uX3m/g413a2FrdhTYNTOHdXyjgOMUGdaQ12JpKxfj1x4KUOiNa6L0j9mC
         cc4xs9h0c68zICvGEodS2kMGVueukWXfEYztOkFnv59vAvRW1OdTLXJEnFPoym8ySxE5
         WLQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794398655; x=1795003455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X1OC0sm6myreOr6GJJBSVSvkHjaBBncy/JIQDF7f5Ok=;
        b=fJIYfsnaMJ7W2uS5zL5++SusZCyP5EncgY8brkQ72VQjS3/i1Z0vYn3YkK3WzV4vMd
         jvzTqgR5n0uQJ7C/vCM94/7V8pMfr70gdBdbsHSEAjUZX9ZxiB04ICAiWV5rX18nCgAn
         NOH4xDTUWUNUKpGWnl8BMO0MoEvFZTY66u3s5Im2YdDnVRbhdYOffeJtdWLCN+EG63Nr
         nWxTRcin1vT4P1eiBH5gwndbvoFt2p9FuI2QQePyItV+u0Y0MmwT/pyLLR8b6zkKKmfN
         5tF9PpZVPfglKRWpVhlhhfDIiLsF6H0XyUPRN16cXEsPjBHm1v1NAS42lZ45EVND7+XK
         eMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398655; x=1795003455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X1OC0sm6myreOr6GJJBSVSvkHjaBBncy/JIQDF7f5Ok=;
        b=Hwh273buEFrVb9JHrDgCferVY8ZE9ALq65Whdubv4fcoBy8xMf92n+WTzu/0BUxJJS
         RZI/7xMp2b21/2x9pjUH40ZD9uSh9WkY0iFWg1pyRrhX5tLFI2Eiqu9F0DVrM7JiW0GR
         pU8CDoFonVWHxPhiWLDEMd4wYMMrg+IG1zWgN7l0h8gbDySroprk4a6IJiR+el5pZeFz
         +DlehXIhtYkDAhWoFKPC2ork1ApFbiDUX8mfHbhL7DHuy/QZRMHUpLFYziPiHFUHsM4D
         ++UGWjWWQQ6AfPO56cW33TspjpFlFcl7MTD5KUBWj4Oe1uiOvbYmeZFdWvrpf+WafIPj
         Hv+Q==
X-Forwarded-Encrypted: i=1; AL+hErH2B7lu9Ii3kaB8Mp0xZB4YnnABCxtYqkeewb5JSsUkCJ3IgK4C9+Ol4wCYpq8lkyGtUK+WDwYWYCBoKCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wlHT8Kcb+BL9gAROcQXCLo+vhpHMMarZbQxeDKM0ZVHJrBgbQ
	/0NrmajcZFC4SgfDehT3ZbwBk62XhwkHTDvjRa4Z6f5Dj8jSXun2CWNxEv0hsBuh7zjislo4dzN
	126DMmmR+kkDLwtWUpjARsgn2CVELCmxpDkZkw3t8qTNVKR2XNyT8dbTGnq1Ru7BS77LWssBMQC
	aU8adT1xL5ifM1mHUZe7KNQUEALbJuLRx/rLb/SVwh7g==
X-Gm-Gg: AYBFou3RaRFqhCAl+GxxDMuQwE61BjvEgtmZipNN4bjM9xsJ1lEMuVf0o52kT2oI3cC
	ok9Giq9uHafmd3pWxcSPQiyIcaNY72y0NXHEySIu87SVVMdEmtHgopFteCZNihQZI2VNMEIr79L
	rBQrF6jqD6oS+AIqPd58A7appIZDjQfjRKsrG8VUdlK/jqg+vrG1deQm0oKA==
X-Received: by 2002:a17:90b:1b01:b0:3b0:92b2:2e73 with SMTP id 98e67ed59e1d1-3b167b067a7mr4571669a91.28.1794398655139;
        Wed, 11 Nov 2026 04:04:15 -0800 (PST)
X-Received: by 2002:a17:90b:1b01:b0:3b0:92b2:2e73 with SMTP id
 98e67ed59e1d1-3b167b067a7mr4571647a91.28.1794398654542; Wed, 11 Nov 2026
 04:04:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avNHazNbGtMQJ5pV@sirena.org.uk> <60f76f85-8a5f-4b3e-afec-ab4e69315ff5@sirena.org.uk>
In-Reply-To: <60f76f85-8a5f-4b3e-afec-ab4e69315ff5@sirena.org.uk>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:04:02 +0100
X-Gm-Features: AclHuK92GSy_gMaTKyxzETTYIzUWMCxU52fK90bi8tHK7knblyXvPBzpxSsGGMY
Message-ID: <CAPx+jO8CsTTXY3G_EKgrHR4N0td7QUinM4gA8=_odckjb0p4WQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pmdomain-fixes tree
To: Mark Brown <broonie@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0NyBTYWx0ZWRfX1HzPlEyUNGXG
 hJTaydYme80IOSpeqfiIYkAzJ0fa7UJ39AvoQwP0RB+IkRpq5OZzuytdsmqKsKsLIl3aysi/MoR
 SOIDSMaWW+slNJ+Io+S0mOqa/IE8KHitdWK0xYKV+KtF+zyC1XHUedBGxWe4ioEUAh9oZ63jsuw
 wAi3vWb/mpxhol8fsCuP1GA33yqnKq1AMyJwa6yuSeg1EfrMjyTR08W6iHplFqV10DAwpf/AQfF
 ++K/XfIRF9xpWvkWjEiTM9Aw07Z2sm/AY8S+sSlEb/E1MNoOj2MPTJvUeC1n7hr8B16NK+o3bkU
 7E3wM7iSpZBMoiZsdfOAfKj3CK0qvR1aQXq+EwA2wgDEwBM1lYbhEnGJZXKfEqk8S1zz6ISbGRv
 cUdqFJDtpEXugylhnlYg/pEZ6vzv+Z8RbNWwGgG7bYPwvisNVIuF7c+aFYn+6ifwJr6+1oQMk/Q
 WWBoh0sEWVI7oK0CdSw==
X-Proofpoint-GUID: swgPGTK9JnzU0RzSJerSsKbYMK8zE5Ox
X-Proofpoint-ORIG-GUID: swgPGTK9JnzU0RzSJerSsKbYMK8zE5Ox
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af459bf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=ToB9MXPV58jh7MJZ1wAA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0NyBTYWx0ZWRfX31z7OsnSKw2j
 C0r6tsnk7T8zE+Om6xyBWl0b6hF2CUxFSxwuGVJSlJPenG9FVi6xuvATAV9+NhRS6jx20e3Qyv0
 yKpcjdPK5iP3EeRocd9yRCOWQPB51Hw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110047

On Tue, Nov 10, 2026 at 7:56=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Nov 10, 2026 at 04:33:51PM +0000, Mark Brown wrote:
> > Hi all,
> >
> > After merging the pmdomain-fixes tree, today's linux-next build
> > (arm multi_v7_defconfig) failed like this:
>
> This also affects the pmdomain tree.  Also, I still had your Linaro
> address as a contact for all your trees - I've updated this to your
> kernel.org one since the Linaro one started bouncing.

Thanks!

The next and fixes branch should be updated now.

Kind regards
Uffe


>
> > In file included from /tmp/next/build/include/linux/device.h:32,
> >                  from /tmp/next/build/include/linux/platform_device.h:1=
3,
> >                  from /tmp/next/build/drivers/pmdomain/imx/gpc.c:11:
> > /tmp/next/build/drivers/pmdomain/imx/gpc.c: In function 'imx_gpc_remove=
':
> > /tmp/next/build/drivers/pmdomain/imx/gpc.c:554:25: error: invalid stora=
ge class for function 'imx_gpc_driver_init'
> >   554 | builtin_platform_driver(imx_gpc_driver)
> >       |                         ^~~~~~~~~~~~~~
> > /tmp/next/build/include/linux/device/driver.h:294:19: note: in definiti=
on of macro 'builtin_driver'
> >   294 | static int __init __driver##_init(void) \
> >       |                   ^~~~~~~~
> > /tmp/next/build/drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of=
 macro 'builtin_platform_driver'
> >   554 | builtin_platform_driver(imx_gpc_driver)
> >       | ^~~~~~~~~~~~~~~~~~~~~~~
> > In file included from /tmp/next/build/include/linux/printk.h:6,
> >                  from /tmp/next/build/include/asm-generic/bug.h:31,
> >                  from /tmp/next/build/arch/arm/include/asm/bug.h:60,
> >                  from /tmp/next/build/include/linux/bug.h:5,
> >                  from /tmp/next/build/include/linux/instrumented.h:10,
> >                  from /tmp/next/build/include/linux/atomic/atomic-instr=
umented.h:17,
> >                  from /tmp/next/build/include/linux/atomic.h:82,
> >                  from /tmp/next/build/include/asm-generic/bitops/lock.h=
:5,
> >                  from /tmp/next/build/arch/arm/include/asm/bitops.h:245=
,
> >                  from /tmp/next/build/include/linux/bitops.h:67,
> >                  from /tmp/next/build/include/linux/kernel.h:23,
> >                  from /tmp/next/build/include/linux/clk.h:13,
> >                  from /tmp/next/build/drivers/pmdomain/imx/gpc.c:7:
> > /tmp/next/build/drivers/pmdomain/imx/gpc.c:554:25: error: initializer e=
lement is not constant
> >   554 | builtin_platform_driver(imx_gpc_driver)
> >       |                         ^~~~~~~~~~~~~~
> > /tmp/next/build/include/linux/init.h:265:55: note: in definition of mac=
ro '____define_initcall'
> >   265 |                 __attribute__((__section__(__sec))) =3D fn;
> >       |                                                       ^~
> > /tmp/next/build/include/linux/init.h:275:9: note: in expansion of macro=
 '__unique_initcall'
> >   275 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
> >       |         ^~~~~~~~~~~~~~~~~
> > /tmp/next/build/include/linux/init.h:277:35: note: in expansion of macr=
o '___define_initcall'
> >   277 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .i=
nitcall##id)
> >       |                                   ^~~~~~~~~~~~~~~~~~
> > /tmp/next/build/include/linux/init.h:306:41: note: in expansion of macr=
o '__define_initcall'
> >   306 | #define device_initcall(fn)             __define_initcall(fn, 6=
)
> >       |                                         ^~~~~~~~~~~~~~~~~
> > /tmp/next/build/include/linux/device/driver.h:298:1: note: in expansion=
 of macro 'device_initcall'
> >   298 | device_initcall(__driver##_init);
> >       | ^~~~~~~~~~~~~~~
> > /tmp/next/build/include/linux/platform_device.h:345:9: note: in expansi=
on of macro 'builtin_driver'
> >   345 |         builtin_driver(__platform_driver, platform_driver_regis=
ter)
> >       |         ^~~~~~~~~~~~~~
> > /tmp/next/build/drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of=
 macro 'builtin_platform_driver'
> >   554 | builtin_platform_driver(imx_gpc_driver)
> >       | ^~~~~~~~~~~~~~~~~~~~~~~
> > /tmp/next/build/include/linux/init.h:176:30: error: expected declaratio=
n or statement at end of input
> >   176 | #define THIS_MODULE ((struct module *)0)
> >       |                              ^~~~~~
> > /tmp/next/build/include/linux/platform_device.h:304:41: note: in expans=
ion of macro 'THIS_MODULE'
> >   304 |         __platform_driver_register(drv, THIS_MODULE, KBUILD_MOD=
NAME)
> >       |                                         ^~~~~~~~~~~
> > /tmp/next/build/include/linux/device/driver.h:296:16: note: in expansio=
n of macro 'platform_driver_register'
> >   296 |         return __register(&(__driver) , ##__VA_ARGS__); \
> >       |                ^~~~~~~~~~
> > /tmp/next/build/include/linux/platform_device.h:345:9: note: in expansi=
on of macro 'builtin_driver'
> >   345 |         builtin_driver(__platform_driver, platform_driver_regis=
ter)
> >       |         ^~~~~~~~~~~~~~
> > /tmp/next/build/drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of=
 macro 'builtin_platform_driver'
> >   554 | builtin_platform_driver(imx_gpc_driver)
> >       | ^~~~~~~~~~~~~~~~~~~~~~~
> > /tmp/next/build/drivers/pmdomain/imx/gpc.c: At top level:
> > /tmp/next/build/drivers/pmdomain/imx/gpc.c:503:13: warning: 'imx_gpc_re=
move' defined but not used [-Wunused-function]
> >   503 | static void imx_gpc_remove(struct platform_device *pdev)
> >       |             ^~~~~~~~~~~~~~
> >
> > AFAICT this is caused by commit
> >
> >    d7262971a2acc (pmdomain: imx: gpc: remove all initialized power doma=
ins)
> >
> > though I don't really see how.  I have used the tree from next-20261109
> > instead.
>
>
