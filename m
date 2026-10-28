Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793184219;
	b=vLwbNIToFFrdLHleJ1UJiyEmhLpe2CYA2KEsbWTh+uUfJeN4OKNoc8vV24mn+eFQYItv
	 7bUSJqX4MSUQfxqK1BWuMnmEZ11OBLaCK7JO3ok737dFretGwAsu7PB63U8tL0kfadFn2
	 W+DKYt4+SxcP64WlyGftknKLiFO2fywX5n+VA6sMfz1IABI161e0Ewe4M4wBxQIcXi0Jb
	 P4KJcEUR2ttI23nFt+4IIVAqAN1zoSO+Am3qIvjNXKggolypV+pJNH0RIDZjdzLKRrOer
	 2alFYhbl3VQW+1Ltc7o85SpvsZH4QyuifLlCKPPn2S06ow6G942zEJxdrp/ujru16sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=O1Rv4j/6uvOd08Dpf/Xz0pIpfr0jYSc+eyXt5pHDHM0=;
	b=UAHmN5SohixazKHP5oEiTNUV+rwe4LXAgwJLluSttw8tCKuj5WPD/qiF6pPkCEjHDWYQ
	 bn9YSO+p5g6if3f2BCSD+Yq0FY4+Ps//LhH2vt2FXtAByCkEnKWA3D4Z3nDc6MWMDbOYn
	 H+PtTHkL4nUJwKTN+BV3Ahqm1cVPV1nZFO4dXISNxipxzg3b58ubZbrWiMv11eQ5tMJTj
	 +1biUVYrtT2D4u1mbR6wNoYCScch5MTUiTnBQRUIpu/kYLY809XYERsBZPVywkBIXa2mS
	 cPh2VBxtYwaW33jpksdsgr3tJ+xDkf/IdnVzCg6U58NlNKeSa63/tY/fGAn34gSjQYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gnfmcqMk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I4QmHULz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2B8606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F2B8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gnfmcqMk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I4QmHULz
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KAgg1642951
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1Rv4j/6uvOd08Dpf/Xz0pIpfr0jYSc+eyXt5pHDHM0=; b=gnfmcqMkq6lA9KVl
	rPfmN6ahaWIQwN/5qy2ETROlTIP0r4NviPMFeUt6hs74cbawpaFJdcn7m4peLkrQ
	MBrH4iRtdLvmVhIUE8t71rQl0bwPbJ780swqbIOk1x7eQxUKkUkxRCAz5kvXPu3q
	TwynsCQH5luOfquuGSok0h9dqTH4Voafvj/Lm0jYSCZra0UbdM5i/vHKDndaJlpZ
	QkkyuLgBldDR5zwmId7ULX1n1fw1DxKjf8cfZpvfuhyb6aVGH6t5GtV4+BlnPYcq
	M7LZUAwphRTe863dJLNBi3QXLbjqI9DqSaCa5fqR4lorSe6PfH2L+hlaxQHh1GxR
	Ia2Lwg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpukjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:43:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7e92f36f9so715091a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:43:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793184217; cv=none;
        d=google.com; s=arc-20260327;
        b=W3SPziEhBS9YoAjhf9OskU7cnLX4NB4dh8Ae1T1+LnneDadLjCSv27ag+1g8i6Ty9b
         8QFNNoV3rAWh7tY8lVAzQcRCC7qE3HXM8Fpjxd5FM41GvFWGP6MGp+oQtRkJsFC59BZS
         D7JH907BBbOFDNQcf8XJCMKsi6Nio2jbOdd2y6GsDvnogIrJkyd4cUfpo6vDdga0ZZaN
         0QxPcyGXI2h6wnZwwQ44f5n94DIfBuL3WfdObsA7VdeV2kXugLxuh3QwEgflKmCdR3AP
         RtsXiHN8Iy2F74hQ8Ki+36Bwhn5+u6gDiv3bK5N8HnQHfhMM6nrNYBehQResrnsStWvn
         iKNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O1Rv4j/6uvOd08Dpf/Xz0pIpfr0jYSc+eyXt5pHDHM0=;
        fh=rs8CqHIrUI+WIbT9UMvm5sLbOhD2/n4D3uHHp6N+vWs=;
        b=XzVIYXTsc2iZ5UbsX25izd0z7HzrLGhSs6qxJ+8++lRU5w3Y4nylaeOP2VXaLI/gFS
         EJqYAnEuieoxnQOiCVtx226KqwUIbakVL4CaWIFvBp+ueUnSCdxJu4LzMOmyErwwye3i
         EDhu9cEMZkR8aQM1UXxgjT7KgXeuz9IhURi5Al4bATwPyRdom6U7ykDx7+ghrGt2/te/
         7Uk7xDyCtGfasDBQl4f06vqSh6QzLQMrby8S3d6mc0r8mE8meryNstnVcxvukBOeWPuC
         n10FfWAdfMFQuj9sixZHPaAUX7GO5bD/GEnYvOirdIc3YdlcBbVd2LKzuLYQACB3KtOg
         Tx2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793184217; x=1793789017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O1Rv4j/6uvOd08Dpf/Xz0pIpfr0jYSc+eyXt5pHDHM0=;
        b=I4QmHULzaBThIlQ+ZScCIJ6gnflPVZV41qNw1KAoo/CSjj7NneMt6WAE2bCu9IfMNg
         UD5uj7ijcAmu0ye//rjLbieifmAR887EoP2ujUln1Vd91AWEU9qeNtmooR8zP21BlkDt
         +0Zf/C2vkMC1qFj4QpLsfQzERgS/0y2niLYT3wT1dNFbYe/Ah20aQYy2k8VeXHU1MwTE
         M29LaZ9YMkFlYPX+h/gcVyn3Zp2F9+y1bc76QfpIakrjI2fBlTDEDmR4DzSkSxLAgem7
         UI/q2e+5hnnYAopG+OjtvmD6rIXg/i3/5xxFtTUV7KpsANLnhd0+ZeXRajFKfPcOp56A
         kN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184217; x=1793789017;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O1Rv4j/6uvOd08Dpf/Xz0pIpfr0jYSc+eyXt5pHDHM0=;
        b=HEuL6wodNqGA140UuUNeth4SG5/p+zmo0TRRkELwpgAbh88/1WjBRRbAkVx681cDeR
         npn7beoLR/uP+v3SPXHVDcE59/GPmI0UoJwj49yaPl2+40dJWKg4x1V042WRKPalJp9Q
         FOkjbV3Cu2IRhuuk3JVlJFisV5g4iQr6vMYxYghvyc/pTaw4bHFSbEckQWIya1O9Rr1A
         BoLCqcb9UL+xAZJkLNeWRN/N26XTPW7+HoJbIYljB0wz0vcCWYVUczOWl6GNYPVCFLrW
         9hLKdI1hMedn7weWdU7UoNHb/iWisKmt9xfqu2nK3i7PzLFm+EJbuB/ijin6X55Lr4KZ
         3rfA==
X-Forwarded-Encrypted: i=1; AKwUvBxIwzHp2O/6GS4s4+6gj7v8iF3i3552ub+Lio5gDTxc+dpv9CgY6lnPqpWPZqD0euR+dFyioRAk85apKIo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuFCfB4p/bIEEs87r4Lk3yQMYczHDOXp4K+1xsEZEKgHDBkBH3
	AgLWC4tuUK2vF0bkMeaydybJPMfc0JXJUyadpY3hVEGkBTii4hwv+kFEhgUXLY6LqmsGVNIXXmf
	Fe4EAiuEBb5jIxSQJb0jPf9fiYUFblCsUAbHhmECKjj7J70O8VVlfyu9nVBIvVD/zmz9SGW5IbA
	jf50c/g1qrMl76wnEoPeDBtgnrkXyh+giGdDnYuZnrxQ==
X-Gm-Gg: AYBFou3gq1Slc/B+1RxC+vY2DbC6noNHN+GWdWkuol4JHmRdvVBGfCg7cVnFj6a9Lv7
	iBW8/F11k2VzgdmNPQH2zO5pi+D9PVY+gMNi67e+3LiaeIKAdZdpfsRs32T7TsuagZKNilJI8np
	Yc2p2a3DAJe6bu9xaiid4MB03/GUyPxtH8C8avcHgwMA9Z9MLjKvZur4XQ3NkD8ycDxZHmnSj8G
	uhGO2jy24+gKXxWaA==
X-Received: by 2002:a17:902:f545:b0:2e8:8637:5e3 with SMTP id d9443c01a7336-2eb0052b99bmr17120025ad.34.1793184217044;
        Wed, 28 Oct 2026 03:43:37 -0700 (PDT)
X-Received: by 2002:a17:902:f545:b0:2e8:8637:5e3 with SMTP id
 d9443c01a7336-2eb0052b99bmr17119865ad.34.1793184216581; Wed, 28 Oct 2026
 03:43:36 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
 <20261027144051.249211-2-ulf.hansson@oss.qualcomm.com> <583dc515-855c-48d6-aefb-abaef26b2564@linux.dev>
 <CAPx+jO_+P-ksGzbYp9Aky7etMyKtTUvtAZJZJpauw03Y8zP0Lg@mail.gmail.com> <5ebe0445-a111-49a5-b9cf-0185d3c3f67b@linux.dev>
In-Reply-To: <5ebe0445-a111-49a5-b9cf-0185d3c3f67b@linux.dev>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:43:25 +0100
X-Gm-Features: AclHuK-qGveGNHeghifsFMqPAZAO8a978GlTSHJA7r_OAEvgCwAoy8i3r1F71po
Message-ID: <CAPx+jO98iHx=VRwyWgg+aQmduquLVZe9Q8FNNK4VwkizXB2A9A@mail.gmail.com>
Subject: Re: [PATCH v10 1/6] dt-bindings: mmc: Extend keep-power-in-suspend
 beyond SDIO
To: Shawn Lin <shawn.lin@linux.dev>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>, linux-mmc@vger.kernel.org,
        Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX6mg+ZMRX25EI
 k1L5CrP5DJdus0ENojCh7fAIr0tgL46AIELIJ6irJcHqqK8H2umzZfKWMKL7wZSc7YE1O5+ZjU0
 9mVoMXPRgpJ4kuw5UxJYUAbJAXD+5/XAlq1hi45ayhUaPlygjFGs1omtYfwiKTN3axdAPh+i7Fa
 1O96ONfA/OH/qYJ6kOV4JeGZpyAaJHMKJPTn6V7pnxP3HMSLXt2tO4pRJIf0O3XJp3FkhODD5kk
 QayJA54XT78wSIfrqluE3Iitwy9+PyFwJx+Ks4JBky2q0WzSDty0nP+lviplgIc6DfR2FVJ9//f
 S/HXniPFLqUoTFeO969pE6cH6CELIXStBBFIKkvPYVxe+N4nT9aVJCHyvNSJnbHe7U56vTgKOy5
 50ViojbUPr+Vjx9RfhrS9a/2kj9w/yq09U9vAWXzlXg8eXt5HuwxfbEjmWsCdKMVYqKHbd/E9E0
 BgBA0LkD4f2B7g417eA==
X-Proofpoint-ORIG-GUID: ga382Z1Ljt3rhgIdCxEW2almN0SgHZmE
X-Proofpoint-GUID: ga382Z1Ljt3rhgIdCxEW2almN0SgHZmE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX3EoSB4O62uDe
 alWP+hmQgI2qBR2h+qCjeh/a665xr5tsIELZWxvKvkXJha1tJ7M4A3cqyoJ2bUg4tG995wPU7XC
 gBgPb3oa4jMGvvDiBrfx/R/NzNsbZt4=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1d1da cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=Q-fNiiVtAAAA:8 a=XdD-yPI1Do4n0GidWpkA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

On Wed, Oct 28, 2026 at 1:37=E2=80=AFAM Shawn Lin <shawn.lin@linux.dev> wro=
te:
>
> =E5=9C=A8 2026/10/28 =E6=98=9F=E6=9C=9F=E4=B8=89 3:46, Ulf Hansson =E5=86=
=99=E9=81=93:
> > On Tue, Oct 27, 2026 at 4:02=E2=80=AFPM Shawn Lin <shawn.lin@linux.dev>=
 wrote:
> >>
> >> Hi
> >>
> >> =E5=9C=A8 2026/10/27 =E6=98=9F=E6=9C=9F=E4=BA=8C 22:40, Ulf Hansson =
=E5=86=99=E9=81=93:
> >>> From: Kamal Dasu <kamal.dasu@broadcom.com>
> >>>
> >>> keep-power-in-suspend is currently documented as SDIO-only, but the
> >>> requirement it describes -- preserving card power across a
> >>> suspend/resume cycle -- applies just as well to any card type. Drop
> >>> the SDIO-only restriction so eMMC and SD platforms can use it too.
> >>>
> >>
> >> I don't see how SD could use it from the following patches. Perhaps we
> >> should still be more strict here to say SDIO and eMMC only, unless
> >> SD part is implemented later.
> >
> > I didn't have the bandwidth to implement this for SD at this very
> > moment, but the idea is to add it for SD too.
> >
>
> SDIO devices have a clear wake-on-host requirement, so keeping power on
> is reasonable. eMMC and SD are passively accessed devices, making this a
> pseudo-requirement under system freeze conditions until Broadcom chips
> changed the situation for eMMC.
>
> However, for the SD part, I doubt such a need exists. It would require
> dedicated ROM code support, and unlike eMMC, SD is not used as primary
> storage. Worse still, unlike eMMC and SDIO devices which are soldered
> down, vendors typically have an AVL to certify board-mounted components,
> while SD cards can be freely swapped. The compatibility of off-the-shelf
> SD cards is relatively poor, so I question whether there is a real-world
> scenario for SD cards here. If there is no such scenario, this is dead
> code.
>
> > That said, I was also thinking that maybe it would make sense to add a
> > sysfs node to allow the behavior to be controlled by userspace.
> > Thoughts?
> >
>
> Sure, regarding the sysfs node you mentioned, we already have
> mmc_caps2_set() exposed to userspace, and we can add
> MMC_CAP2_RESET_AT_RESUME support there

The reason for the proposed user space node is not to control
MMC_CAP2_RESET_AT_RESUME. That is a different story, specific to
Broadcom platforms at this point.

Instead it was solely about allowing user space to keep the eMMC and
SD card powered on during system suspend. Which may be useful for
other reasons. Like, internal garbage collect and suspend/resume
latency.

[...]

Kind regards
Uffe
