Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793100121;
	b=I1VfvBbNlthx9NrIxmtt0/TpACJS3/5TJBg7C95h7pOWh26xpkLRotmLxPT5Ved/CoJQ
	 o2zxFR1pCpkcYfzM+IbHTP7LJ83Fh8EGPDisKD6zEVYt9DBoOEmW345mMFuNH48jBOxJE
	 Sw/fbHk10uOiITXS+fCtqVsUWwCyJe7IAX+RMVXIOI95e5eD9KsbQMiANGcR2u+TCOH+W
	 siJLuVnp0ibe8CRg+rAF1976luIyvJZqAnKXzVjszma7oYA26HcwHUMkZNdPUy26LPJuc
	 +/iqxc0JcVJaSNpRf6q9lTocaKlOOP4BRfv2XuaY1/T84idG7VPWXYfLgUFK5Lj0HDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100121;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FDWKmv9OnB4r2DAPnWAEF9SjLEImPSiYBnJWoztT80s=;
	b=loK+AJKg2U2hdVd/L6agmGA21AnObO1i51ehI/wiyGk/9x7RLTAzvnhqwR+tVKzAPIyI
	 iYa9pceng9z6uZEHs0AsTvEtKX/L78TY55StqvTLr1iqkxjlIXhqTP58/0K/5RnJy4LQT
	 pzJIoEMI9KipqZWn+O5rAl6nwlG5YchzdejYXxjgyj4NvxX+HFHnGagmagnZjAlHPgDcj
	 h3wJwRlv0rbYrd7jp+QgeJp1WhAOr12bMi/kmfrsTmEZqmK+zgRL6d9RyYvhYfQa+/GwF
	 6I5phkC2zqIlnTSMdMdmEBE3sOxl+5W9ffZUGD5Owy3SK8XzREdxR0eX1eq0Oa56Wbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPIyLcRl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kLfJsVWL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934FF606A328
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 934FF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPIyLcRl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kLfJsVWL
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeC0d3026388
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDWKmv9OnB4r2DAPnWAEF9SjLEImPSiYBnJWoztT80s=; b=ZPIyLcRlZqnVtwSi
	2UleO8gtdP9r8b11Z6Mb6Qcfxsp/BL8WnV4NI+it9UROgCI5fPc0bbXRjPF230ox
	x43W8G7vTe4PgTMMaNdu0oTb/e0gGVedNQglLNDGoRQi/C5+KEduDHs0qwf2qrEG
	UIHwKYnoxXw59zFRdTR9UoXieJc3tvpR2f8B/unJdFz2Psrd4jMMtmud5STj/qPj
	E8WnIMNesjfhzxpoyUSaPBqkR+9/uS1QZFvF0fXAHhRQfsBSWHVAibskfX8lLaxi
	g/wgbX+/hVfQTKhjsUYXbMGTPvlPG9gs6MsZrqVdv7gjKG/K516r5ORiy5YiSTGV
	gfBfpw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91a6kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:21:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb98809caso724831485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:21:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793100118; cv=none;
        d=google.com; s=arc-20260327;
        b=fZYGqFp0EGPSVsOXMPu0fxnEWY+87T92TgXV67CGF6KT/QK4maktUdxU/WJ4f73qsk
         2MvntW7+S0DuDPQpZL5vTzuLHZ12cJuNkNSn1eSKrCI9VMpVIp1dn1dB38bUNdzr/n0U
         KzVG/0Ay7uiYnCuLqFT+AgHvZ911EfX8NKdOwS6ytUEKwzDRXJGyuIqMsoxuLHM2IOou
         SpXrXMfbRZuX4RheRELD73ir6Cb6X8gNo7rz+F4a5TtyGWnARiXG03XMOGASywX7rd/m
         2xFkbOKjscnFtBzD+ptc9fHHRw0ZwqMIKO+UmAuh3t82QiNEd7XLcU/9mmFzNvgIPAiK
         GjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FDWKmv9OnB4r2DAPnWAEF9SjLEImPSiYBnJWoztT80s=;
        fh=ndP5m3GTywPDqevvHNwK7Zgh37ZSv/gL/wKjDES1dSY=;
        b=qMnHj3GdrhNlMMyA6nKMb1saXf3AhhzcoIp9lhxG7WQt/oH4I5FX0LZznhR2p7gga6
         QcaFzaGch+C8PAo94lsYN9d75XN36t05a/eK7R5eKacF22cfdl3jnjlGOF5fiEkCCitB
         Vx0W7Zd5KL4Zv88dMP4jXR9RxxN+gxbHAVG0eRAdsbdY/nsrkZzfHQgswBUesPiFI0O6
         HvjxM96/7/EzL9Yli5vBLVBpQvmU+O61+k7BAUXzxTVAwVFZCXctSZCBvcWyDtG5gOrX
         u9Jijq56jYrpb/OcW0lHyKNFVoAC4x8ryslQUCQJEsRiIkr1wypo2Pp/sfgUmC3vuyJb
         SvZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100118; x=1793704918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FDWKmv9OnB4r2DAPnWAEF9SjLEImPSiYBnJWoztT80s=;
        b=kLfJsVWLK3WJrLgTb+b+Dn2t3ZubfLrIu3DQuLkgcIkIBZMxbwoHlcC2Kro05grjni
         QAT1FvTpT479/kMkA2KtD/Z0/0dSi1lKoaoKSe9cPENJYBgr6Ybl7Y5I0rCkHywFrS8m
         7uMwEyk4N+qIt9o6gEMoo5Pt4CElszzGsknS73lSlG0wa+9pMR9yUumcEjDk7YQWlDAw
         O0LKN0sHjQzkKrS34JWrEUn7C8b4e1LuadJ1vlz4VKeVN+GGutjYEJL8wQhgjkhz4jKR
         fgajS8FoUbcN2OomfqjbVhExVK+M4kX2Qf+oofzUtu/AeDFMb9+qNqhJbomvJXyuJhIS
         qryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100118; x=1793704918;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDWKmv9OnB4r2DAPnWAEF9SjLEImPSiYBnJWoztT80s=;
        b=ZLEuxoZnoIdXpQuCmXsoR5Ex6Y8SWg1/1kvmWdBZOpP+0AC3yU8UvL+tQJcP7TNz8F
         oi/D5ObXJDIZPAo9SyKphJQmne5ZWzuZPkSKK7UdFe09e4qpLSUs6mDrZEwDxsLEOvge
         su3gYLJDUv3YrahBV2d1S3ttnYDS77yfwnKbKMuVXk3EjXt4R7RG9d20vRQ27SFpQ4rF
         IYMhjgshHIHraL3QOsZak0Eup5BiRlgzi1ddNxmwL7+1eLwj9PK1r+Emny3bYmb9Oosd
         YkBH2MPAER9g/Yki9WSOO5DoTCyGVUnOvDZ/+QmC6/87ly/XGl8pnVl22WqJ6xdeihYC
         JF+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxr7Vetm1D/RzD8U1PINuPZGF/NuLknraGOBH214e8o/es6HcmF7sppkFQrq/5nBSvfio6VxVpXQSYIJDg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJB2nNtceov7359gwtMzO6OQ+XW/Yz6lqRoikLe6wG5766rLwR2
	QK6FAiY1iqbooUNVnCG3CEJ/uBaLyoK3zggv7tafiVOMeFWo90rW1h0Z01v8Pe/w2Vhj3k9MoA9
	oFZgsD6aCTGjQ+nNQlHt3x3X18Z9zBPft0YqGDd70CIanFV7dspDX0/oZeepVUqva6HK5YCxD6W
	ul89tAoDUXv1c3dedLWP7aYSG2bI5P+Zc5+ZAGbGU3zw==
X-Gm-Gg: AYBFou3SS49uJfsIqfNUrQgY42ydWkUGYU9zeOA54otgeTQ+V91IergNK710VFiZ2y4
	kZLm3TKbyDo7OjoU3YLgkooMbkdz44kymbHRHcbVtjA91XJr1PvRLNgk8ZPR8BVACP+01+wQzmC
	iwlQhdXyAC97G2ePyGf58ka1SOVKx2J3i59s2qWd9j1J8jjBASLVdT8z7m2sXtInhlFsVOClFhV
	DDzh6FgIsE8izJG7oXIyyb5sWjNbxs3KDuLl9NWOSuT7+MRBdcsKgmYWt6Yu77zsHmg8wA0qd0p
X-Received: by 2002:a05:620a:2987:b0:93e:5247:f61e with SMTP id af79cd13be357-940ef8bbf03mr1381982385a.25.1793100118318;
        Tue, 27 Oct 2026 04:21:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2987:b0:93e:5247:f61e with SMTP id
 af79cd13be357-940ef8bbf03mr1381981485a.25.1793100117860; Tue, 27 Oct 2026
 04:21:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023174113.2388353-1-peter.hunt@opengear.com>
 <CAFEp6-1brLBvgkaNK7bnXfGwHJkF_sqK4mdc2zaVuLw3_4+djA@mail.gmail.com> <20261026154056.4037990-1-peter.hunt@opengear.com>
In-Reply-To: <20261026154056.4037990-1-peter.hunt@opengear.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:21:45 +0100
X-Gm-Features: AclHuK-XCRpxCXE4QFA1aB3sdX4dMBT48mjuVvVkCJDDEuaqdwo7ZIEIFXDhQB8
Message-ID: <CAFEp6-17DD-4mOaD+r060WYfpvkF_fERnUiSE-fA+kSPXntazw@mail.gmail.com>
Subject: Re: [PATCH net] net: wwan: mhi_wwan_ctrl: keep DTR drops and resend
 state when IP_CTRL binds
To: Peter Hunt <peter.hunt@opengear.com>
Cc: netdev@vger.kernel.org, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Daniele Palmas <dnlplm@gmail.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: UisCr2qIMyNG-a9Nrc_vN92imgREz3kH
X-Proofpoint-GUID: UisCr2qIMyNG-a9Nrc_vN92imgREz3kH
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae08957 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=t2vznHeBAAAA:8 a=EUspDBNiAAAA:8
 a=EAWOXMPjoDnuF95MvPIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=V_BghkRpYkFyHJIZkSH6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX3sVuxjSNILMl
 vKfSOHUiNaJrjvXkrmwJx1J58kY843+dsBMv77i8JfcBLnFOC9y5em42Sp9XrwLONM3tVdVM55F
 3XPuO9/oxg2KHzBPiJim9kk5+aZ1lwHYr0yQbInyCQdKN2+IJKfvTNb5s0SCOT2n6FX7Oo/+gA/
 zk+K5IzaJBCqNVvfx8EZeFUHKSPv5TZWZf/u6Pb/oJYBL+yL1JEsSR7rsnSiWMMwU16Hv7RYQ1j
 QJbQh/Aq13oPbl6CBvW718Ne783e1Radwz9c8UdVnBKua4KQQyS2WTbfS7LzZRIfpn0HdoPC7VP
 AIOvG1mAg5R2Ij/HX5kpFkOr/koDiO8Qcn0FzELkRTm47rRTYN+8SVRvgKk5xX4nIkaO8KtD2BR
 WNHWxXkL1tqLRU2xxutJQMtZimULkE5hOg4SybM3LegwXyLBXYLcNv6b2+QfNV3FGKsrB1I3+z4
 Q1CEOh/Y6F/pdMMqcAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX7n1FY3ah2Tdx
 6ft55B7+eGO4oFkd7PyRpNDzSFDwL4vDj6pBAakqT4952hhhuR8N34FuFV/kU+X3s7y+GTikZCM
 jryvQgdbtzPmcnSzDfzw6VUcAqZuPSk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045

Hi Peter,

On Mon, Oct 26, 2026 at 4:43=E2=80=AFPM Peter Hunt <peter.hunt@opengear.com=
> wrote:
>
> Hi Loic,
>
> On Sun, Oct 25, 2026 at 3:27 PM Loic Poulain <loic.poulain@oss.qualcomm.c=
om> wrote:
> > This looks a bit over-engineered for the reported Sashiko corner
> > cases, and adds quite a bit of complexity. You'll also need to handle
> > the lifetime of dtr_work and ensure it cannot run after/during device
> > removal.
>
> Thanks for looking at it. On the lifetime, I think it's covered, but
> please tell me if I've missed a path. dtr_work can only be queued from:
>
> - ->dtr_rts(), which the wwan core stops calling once wwan_remove_port()
>   has cleared port->ops under ops_lock,
> - dtr_work itself, re-arming on -EAGAIN/-ENOMEM,
> - mhi_wwan_dtr_probe() (new in this patch), which only walks the port
>   list under mhi_wwan_dtr_lock, and remove() takes the port off that
>   list under the same lock first.

Right, it's handled correctly. I overlooked the disable_work cleanup
in the remove path.

>
> After that, remove() flushes the work once and calls
> disable_delayed_work_sync(), which cancels a pending retry and stops it
> re-arming, before the kfree(). On the IP_CTRL side, the work only finds
> the channel through mhi_wwan_dtr_list under mhi_wwan_dtr_lock, and
> mhi_wwan_dtr_remove() unlists it under that lock before unpreparing.
>
> > I don't have a better solution to propose at the moment, but this
> > problem suggests that we should enforce some level of ordering between
> > the MHI devices (channels), or introduce an explicit dependency/link
> > between them.
>
> On ordering, here's what I found. On the EM919x/EM929x IP_CTRL is
> channels 18/19 and DUN is 32/33, mhi_create_devices() adds the devices
> in channel order, and module init registers mhi_wwan_dtr before
> mhi_wwan_ctrl. So whether the controller powers up with the module
> loaded or the module loads afterwards, IP_CTRL already binds before the
> AT port. As far as I can tell the late bind case is only reachable by
> unbinding and rebinding mhi_wwan_dtr through sysfs. What I don't know is
> whether that's worth an explicit device link, or whether other modems
> would declare IP_CTRL after their AT channels.

Ok thanks for confirming, for now I think we can safely ignore this
corner-case then.

> The DTR drop case is different, it doesn't need any unusual setup. With
> v10, a back-to-back drop and raise from userspace (TIOCMBIC then
> TIOCMBIS, or a quick close and reopen) was mostly coalesced into just
> the raise in my tests, so the modem never saw DTR go low.

Ack.

>
> So I see three options:
>
> a) Drop this patch and leave both cases as known limitations.
> b) A much smaller v2 that only handles the drop: when DTR goes low,
>    ->dtr_rts() flushes dtr_work so the drop is sent before it returns
>    and a following raise can't overtake it. No new list, flag or
>    field, and the late bind case is left to the existing ordering.
> c) Keep this patch as it is.
>
> I'd lean towards b), but which would you prefer?

Yes b) looks good to me, I guess you can also flush dtr work
unconditionally in mhi_wwan_ctrl_stop as well.

Thanks,
Loic
