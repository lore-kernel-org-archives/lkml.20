Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793851277;
	b=f+LILJ2mVbG7er8UpSLqZzH+G7qbnvi16pMZ3+D5XZ7A9HLl1htnqguy5vHcb9irV9zl
	 X17cHYgyAHOsD6JNKVcth2PC3ytrlH4bHPc9iUHx2lrnb3ZBzJ4vv0pocXh4n2TQ+G2+M
	 2L0S4YTyiIZeKHlT2yp4cO3QRq+jVn1gLYZMKX9tuyUq9bU3/9SxS3VFW3ydyzk+1mzKG
	 HB5HY2UluPCSgPA0iw3l1SvQq1noDhZDKKNBnD5KyIEQOf62y3TgrChFZBmCoLfK+dCmb
	 mnTQIYu3u5bzLqUgnkJDpa6OM9ZUsU/PLGZF9Xdxi680uGsoXtURBKQnEwg7rvJiBPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851277;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kKSfGYR+tjvF1v+s8GT4+Cm2kzZ0C6NBq5JcuXlorDo=;
	b=Tupu99G+wPWA1Ga4r9nrColwNZCWSZ6uPa4oczS2Y2wglYT+6OO7kEMLz5BMuVW1wN7w
	 1N5J3eUltT/7eYjJAwQ2RqVytSxBakxnlp5N3K6aNCHSgtLZKI8Oix/a5vzfLsqHMHqmh
	 dHf4kuv75bXdA0EN2DSyZBJ2zYK7ilEIIwcuu9eYehDCIG+ngTh3x4HI0E9RRaVw4pgGa
	 jiLtEv1nZwOA1Bjde9WnbwKH/NmjRoKe7Gxe8v7bYiPa/jfpwUAVR8cKdtAZEp/qKT1YI
	 8gjLEC/MTa5mPLkwX5FproPSSRSalC5vSeUfxpZrhqZF6l05wwmQLrArxjKhafAXlAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pWrqy98D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zg02H3BE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120CC606A33B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 120CC606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pWrqy98D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zg02H3BE
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A53f9lb2855350
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 04:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kKSfGYR+tjvF1v+s8GT4+Cm2kzZ0C6NBq5JcuXlorDo=; b=pWrqy98DdE6XK6ZQ
	LDWbSh1PNLpblLFWb2e83Gnnjoixdz5a1N6U9NbjVvP70k6DPtZKq6n17bLwOn5X
	dlfsEvOHHzcgFaGDzLyvy8vPhk7o7+U2ru/Lc3C/fEx2kLQCiVv8UMvUXTfvgsjX
	r0bAvSuYYg0XafUjK/wdA8TPGfpSAPp8HshjdXWasrkCloWwfxwX7x6KLl2tWTAJ
	iGbSsFa91k8geKgGdEc2YIjknj8KaftWVvhzwGh3G/lPhv4UKTyksmeIG8TUteuu
	PpKWDIz1IhvW2RmR1ZuR/thyBjbINp0XIrJv1EckD7Sk2MIzzJi20nMs7PjadFwp
	ikM6vg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43g25a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:01:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3692c5b061bso3671121eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 20:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793851276; x=1794456076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kKSfGYR+tjvF1v+s8GT4+Cm2kzZ0C6NBq5JcuXlorDo=;
        b=Zg02H3BEbB/FBnb9GmKhMTn0dbvEjLNWEaR7iDZ7SmtpW50j5Ds7DrlnzTspp7+lRW
         xXfKVmn/1LqX3ayNvSLWJpDEO2dueXJ1Jqcn4uBHP7jTkx+GLh3fobpT1YqS6rHobw65
         XEYyOFnPzS97qBpLGl/Uc2CXPT+vpTBcom+Tk6wg4qsWPLw0VduTqYotQE3queE2e5Ij
         ze/H/200U4wScVxBShElfnos+S1gFdOs8/OkDlLNm1+K+c5t62x71XF3AevtcYOUwP+Q
         B0hNdKgkl/kmE0p+nkAOWdd/ywlEXdPvIS6tLD7Yd4wAAzMC7fg/KGwtS6o8ISb2GF9V
         TsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793851276; x=1794456076;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kKSfGYR+tjvF1v+s8GT4+Cm2kzZ0C6NBq5JcuXlorDo=;
        b=1o6tV/oCP8nS5IMRjOB3W0aBIVpvUk1Y8T6cBWbYdnM6MqCUcepAhb+kPrUXlU3DbT
         2K+QrJi3tSYTEWkg9o5oMTHwWNAxajFJcBQsZJfu2jJsTxDBOneOcO0KjPxb6G12wuDY
         JaotMjQAB2/oQXF3GyhI961hXbyrHPagMCmB5xoe5QyBzi4cg52jk6VFuCoeT1uQb9mF
         PdVQXc8+I5CFJAV8gkZ4xgr3hGIc+MWmObbBYgri8Cpe7JXLLWu8UUuxSEPc3OqgncQg
         qxMvwfeM3HP9UzhLgtcbWOXfs48Ndw7IsYoM99Get1eWO8pvAeevpyQNIgS+2yYRTrq3
         GeYg==
X-Forwarded-Encrypted: i=1; AKwUvBwgeLN2H9jAFpf0Uawjo/UXmRfpMqxNuRAH+wyQSkbQ0xNtcYs9ZUs2BFphVL2skvjXE11ufN3+WtE7IHA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cuMWJH/EmR0Wsk0/SM9y9xrmk5znjKNNqZNuRd0FCOT8Z8tkk
	pzkQWlCV384XZav3vNbYfEhT0df8dztaReN/l5GTEn5SApfQWhcMdTWxufexzuBv4xfCKSjllYp
	TrC8sa4UjhAb6A2yyRvEu94XxmKUyBgWhMgXv//CrYYPj2tnkiJuW65oLUUGu0/+0438=
X-Gm-Gg: AYBFou1h8jdcwsPYSa0O3y6TQ5Usn7NCXSSArJ9kvsvOCrXtmlP6rYpp9OvzddwU33M
	xP9mvLuvTYx3C2QbyCuRcWXtrQfon6Xg5O3ATgABLV1vYUxOQ0BxlmlOYVy4sz8hmSd2n3Qp3Dh
	iRpVH6hC7hWasdkXW/VDTQXZ1UJtzNobIq/aYeoq2IxpU4W+U53luwXUtZqtsY8to6ri4L/fhDO
	0OS25vVFz9shYidvGA6TiyfVPOBr2NIOKOd5jCCZASfeW/s+3sGJ99O5jzjwHbVVnpYqOW3Xuzx
	A5z2S/u9rOkD43O3C8EZs0rSQd8KNLW7Fo+feMOQMRLuAWet/g4JkL0p8W1vDDqrRvdiaW/PVau
	sgvAHulYd9j9Y81f9iYBy2fUMXoajBlp5Grki4PBhoNAMiQTGZaEPY4kbGN8/fSH9NiledG1Rkr
	+9l6Yx5FsaApGsAC/oCg2xQIBb8IY=
X-Received: by 2002:a05:693c:88c9:20b0:36a:18e2:64c with SMTP id 5a478bee46e88-36a4232bf0fmr27185676eec.11.1793851275301;
        Wed, 04 Nov 2026 20:01:15 -0800 (PST)
X-Received: by 2002:a05:693c:88c9:20b0:36a:18e2:64c with SMTP id 5a478bee46e88-36a4232bf0fmr27185644eec.11.1793851274719;
        Wed, 04 Nov 2026 20:01:14 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d3754sm16263984eec.14.2026.11.04.20.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:01:14 -0800 (PST)
Date: Wed, 4 Nov 2026 20:01:09 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "Santino Wang (=?utf-8?Q?=E7=8E=8B=E4=BF=8A=E5=82=91?=)"
 <Santino.Wang@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Fred-WY Chen (=?utf-8?Q?=E9=99=B3=E5=A8=81=E5=AE=87?=)"
 <Fred-WY.Chen@mediatek.com>,
        "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,
        "Light Chen (=?utf-8?Q?=E9=99=B3=E6=98=B1?=
 =?utf-8?Q?=E5=85=89?=)" <Light.Chen@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        Arnab Layek
 <Arnab.Layek@mediatek.com>
Subject: Re: [RFC PATCH 03/11] soc: mediatek: dram-ecc: add tracepoints
Message-ID: <20261104200109.00002de4@oss.qualcomm.com>
In-Reply-To: <3cc31b2f5cc226561c7c6642bcaeb85d3e22e9ff.camel@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
	<20261102092334.138759-4-santino.wang@mediatek.com>
	<20261102115758.00005a16@oss.qualcomm.com>
	<3cc31b2f5cc226561c7c6642bcaeb85d3e22e9ff.camel@mediatek.com>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: uLOKOiV-KRsff3NNnMAChWUHuceKVJkw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAxNSBTYWx0ZWRfX0joo6hsfeDRj
 HjOp4Y0TCxPDFLvw1DpNztGcnq1/Hl1J91gEX7baD+iwNtaHNYb0ZIt4jyvbUCozA6O52v8qtJK
 3+jCuFi7B5FIiC/RS+zmA3xxAb4+9o9ybZ5EjkZnkMrZ/rrdSC/FCggVWLKgz4ytjtITzsiUv9L
 hqAKCMMZRNNZNdwOzENcp4WOdnfi3HyMsKLW8J3uQ/8loh3GZoTVnCFd+MBXgJVbRvZvdAKfn+3
 gHZv6Bdo+VHC/9pVumBpb9Vr6rDkzaklYKdPwwckAbOZo4nomBCdPp9uG5QYXt2xOWZqvYuaRX5
 Uk+a5TJRzo6JR33LvMZtxEwrUSJeu7UyrqCji00VuY3n/zROSpYKW/YKl1wYXhDZ5Zhz9kOVidD
 EOZsgebGahAiQkL9ruPdgTsrLfLRqI4kLQEslmx76Ww0lKQ/XWbSWYO9nCc2khYSSzvTDBOILAI
 VBF03c4WNKfHPVeO2CQ==
X-Proofpoint-GUID: uLOKOiV-KRsff3NNnMAChWUHuceKVJkw
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aebff8c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=mpaa-ttXAAAA:8 a=016yWS8getB5-smde8QA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAxNSBTYWx0ZWRfX/tDva0Vw1dfa
 j59Oc178S7/CLqj9CdtItDZz5rkzZmsgDto7lA1bxpg5lZqYH6+IK4w9nTFoVQY3/0FgeZ1fNoW
 spB6O0P4kfvHN5Jgn8GiR22QuqQovf8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050015

On Wed, 4 Nov 2026 02:44:05 +0000
Santino Wang (=E7=8E=8B=E4=BF=8A=E5=82=91) <Santino.Wang@mediatek.com> wrot=
e:

> Hi Jonathan,
>=20
>   I checked UEFI 2.11 Appendix N.2.5 and N.2.6. Both sections
>   define Node, Card, Module and Device fields, but I could not
>   find an explicit channel or subchannel field in Memory Error
>   Section 2.
>=20
>   On MT8992, these identify the DRAM channel and the subchannel
>   within that channel. Could you clarify which standard fields
>   or encoding should represent these two indices, particularly
>   the subchannel?


Ah. You are indeed correct.  My mistake!  I confused things with the CXL
spec equivalent which is fairly tightly bound to these entrees but
apparently gained a channel and sub channel over them.

It would be a straight forward addition.  These days UEFI has a code
first proposal path that would rapidly solve this gap.

The process would start with a public discussion (this one fits
that requirement) then a ticket filed on
https://github.com/tianocore/edk2/issues?q=3Dis%3Aissue+state%3Aopen+label%=
3Atype%3Acode-first

Any example of a related one is:
https://github.com/tianocore/edk2/issues/13430

Alternatively you could encode it in the Device which would be
a slight abuse of the current spec, so not sure I'd recommend
doing that. Binding channel to this would be fine as a given
device is only on one channel, but that is more of a stretch
given subchannels in ddr5 and later.

I'd strong favor not inventing a new error record unless you
absolutely have to as that adds burden for all the userspace
tooling etc.

Jonathan



>=20
> Thanks
> Santino
>=20
> On Mon, 2026-11-02 at 11:57 -0800, Jonathan Cameron wrote:
> >=20
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >=20
> >  =20
> > > diff --git a/drivers/soc/mediatek/dram-ecc/core/trace.c
> > > b/drivers/soc/mediatek/dram-ecc/core/trace.c
> > > new file mode 100644
> > > index 000000000000..9a8b20e48069
> > > --- /dev/null
> > > +++ b/drivers/soc/mediatek/dram-ecc/core/trace.c
> > > @@ -0,0 +1,6 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (c) 2026 MediaTek Inc.
> > > + */
> > > +#define CREATE_TRACE_POINTS
> > > +#include "trace.h"
> > > diff --git a/drivers/soc/mediatek/dram-ecc/core/trace.h
> > > b/drivers/soc/mediatek/dram-ecc/core/trace.h
> > > new file mode 100644
> > > index 000000000000..d603fc38f0a7
> > > --- /dev/null
> > > +++ b/drivers/soc/mediatek/dram-ecc/core/trace.h
> > > @@ -0,0 +1,119 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Copyright (c) 2026 MediaTek Inc.
> > > + */
> > > +#undef TRACE_SYSTEM
> > > +#define TRACE_SYSTEM mtk_dram_ecc
> > > +
> > > +#if !defined(_TRACE_MTK_DRAM_ECC_H) ||
> > > defined(TRACE_HEADER_MULTI_READ)
> > > +#define _TRACE_MTK_DRAM_ECC_H
> > > +
> > > +#include <linux/tracepoint.h>
> > > +
> > > +/* driver lifecycle - state: 0=3Dinit, 1=3Dexit */
> > > +
> > > +TRACE_EVENT(mtk_dram_ecc_lifecycle,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int state),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(state),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(int, state)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 ),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->state =3D state;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 ),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_printk("%s", __entry->state ? "driver re=
moved" : "driver
> > > initialized")
> > > +);
> > > +
> > > +/*
> > > + * ECC events - spa/channel/subchannel/rank/bank/row/column
> > > decoded from the
> > > + * ECCERR_INFO0/1 entry that determined severity (see
> > > ghes_notifier.c),
> > > + * mirroring ATF dram_ecc/mt8992/fiq.c's decode. No agent/master
> > > ID: ATF's
> > > + * GHES vendor section doesn't compute them (see
> > > mtk_dram_ecc_event.h).
> > > + */
> > > +
> > > +TRACE_EVENT(mtk_dram_ecc_ce, =20
> >=20
> > Why push these through a custom tracepoint?=C2=A0 This look very similar
> > to what
> > is in the Memory Error Section 2 CPER.
> >  =20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(u64 spa, u8 channel, u8 subch, u16=
 rank, u16 bank,
> > > u32 row,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 u16 column),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(spa, channel, subch, rank, bank, ro=
w, column),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u64, spa)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u8, channel)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u8, subch)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u16, rank)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u16, bank)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u32, row)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u16, column)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 ),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->spa=C2=A0=C2=A0=C2=A0=C2=A0 =3D spa;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->channel =3D channel;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->subch=C2=A0=C2=A0 =3D subch;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->rank=C2=A0=C2=A0=C2=A0 =3D rank;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->bank=C2=A0=C2=A0=C2=A0 =3D bank;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->row=C2=A0=C2=A0=C2=A0=C2=A0 =3D row;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->column=C2=A0 =3D column;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 ),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_printk("spa=3D0x%016llx ch=3D%u subch=3D=
%u rank=3D%u bank=3D%u
> > > row=3D%u column=3D%u",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 __entry->spa, __entry->channel, __entry->subch,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 __entry->rank, __entry->bank, __entry->row,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 __entry->column)
> > > +);
> > > +
> > > +TRACE_EVENT(mtk_dram_ecc_uce,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(u64 spa, u8 channel, u8 subch, u16=
 rank, u16 bank,
> > > u32 row,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 u16 column),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(spa, channel, subch, rank, bank, ro=
w, column),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u64, spa)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u8, channel)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u8, subch)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u16, rank)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u16, bank)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u32, row)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u16, column)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 ),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->spa=C2=A0=C2=A0=C2=A0=C2=A0 =3D spa;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->channel =3D channel;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->subch=C2=A0=C2=A0 =3D subch;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->rank=C2=A0=C2=A0=C2=A0 =3D rank;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->bank=C2=A0=C2=A0=C2=A0 =3D bank;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->row=C2=A0=C2=A0=C2=A0=C2=A0 =3D row;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->column=C2=A0 =3D column;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 ),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_printk("spa=3D0x%016llx ch=3D%u subch=3D=
%u rank=3D%u bank=3D%u
> > > row=3D%u column=3D%u",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 __entry->spa, __entry->channel, __entry->subch,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 __entry->rank, __entry->bank, __entry->row,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 __entry->column)
> > > +); =20
> >  =20
>=20

