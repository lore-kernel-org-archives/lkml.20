Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792938464;
	b=Qb9VrxnQKJlvJuVXz/FIB3Oz6k/+318qj9XO0DKMSY5pnK3US2tVCNZVzlXSWZ9Yy/GB
	 gdCYuFWAYAd39WkIo9P4CVUlmHXbvmxP8cKkS8qFL9sFIXIRrFKm7ffSisfe5GqZmSlXM
	 +Bi6uM1ZDaVHDTHduB3uaY796SONjMwjDPDuGlF1CxsnPG9PoEA/i+7HppGfzM3nZwbGq
	 k6mszvPJbQiyc1raez1SGPJYd5Z3nFnMywUrfiqfGEyoHYIL0w9WB7P0QwQHa/ydNAOa8
	 RWcxM2JVMoNvKpH+JmnigChAhMYTpdUwT3JhVJieLn/3vK88OWjPlN37ueF+bc9/7qA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938464;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bEF5MXIhUvYSAHor45X1sQNhsnVRy0XBC8W8XAYS9UI=;
	b=u+UAqeZPGDxkqIev+CrEJf34gfSR2Dt1axSP+3swMceaYpHWN6Wt9gjJ50CJSCPQQEbs
	 KQz2EHnpdyXebzz67rh5vAATxAJ98VTB2ASYOekHOpD1QIQFITtEAW0I8po+MvvLOfIuU
	 OR2q+JycVrFhwD7n0wL7ELr10GsU/4/JUvmnIPspYjCX4yOB5k5Je31y20MARAcutf52h
	 cE+gVb1i9vvasaB1zoSof3CDCep8mjQ7bTvM+Jm95K/6y3bst7jlrYm0jVnkqHU0V+CWQ
	 /mgefV3mUgtswLWYz2IzeoC7jyaxGwOoDAXO2DOg4enSLewQ27wsCCy808Nu10s3YwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IQNAagT1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XGpN1u6R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF2B606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EF2B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IQNAagT1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XGpN1u6R
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69PClMGJ4178796
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bEF5MXIhUvYSAHor45X1sQNhsnVRy0XBC8W8XAYS9UI=; b=IQNAagT1yxjkvLpM
	drGmJ2oOX/iwOuxs6V45rqTbM33+RkydHcs6hXxEOLr9m1I3uXZEgLSosxnogG1k
	7q8sbRiTVQ6Jog5D5UkAQvoYWZkKWCXy+b+Ya/KKIMb3TdOtBAeoXXGPf5dIm3PL
	4KRmoV2y3FA+6GVR1YJRi/LpniHcz607i/IcM3PHoC0Q9Xruch7EYsvAx+zc7YIR
	p/yjEmsHfXR8HOz5iId1jSXR8ojcHofyePaMiq1P1VuTxElwD2mwr8tvmTBrMzO3
	YgxF0CygxX/D0KEQ74id5z0dZIGJwbTwVnlMXk8nwsZdDDoSoRUROUojQzFPdREY
	hqVexA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gkb10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:27:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso312655385a.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792938462; cv=none;
        d=google.com; s=arc-20260327;
        b=O/Yefj7I1QVZGS0HXaG3pPUs3LfNR2Pjz3ccLd/CoVevm41Z+QPr3822dCe3eLKhgo
         Y50ZtR7kXSdntryuTTEfpjp/wHoHGFSINWCnbJbTIfOTYOJxB3Kll+UYrI1I+8GfVJBU
         QsXZtMaCsjPY97Lpm+d6TMkQCHxwsw6KdZg1hnZ5W+g6yudjMTL5RPvcNTN8cO2IxBuV
         y6wDd43iJh1/2kSms/vxHgRKmRziV1DVPPt5sz5lirr/P1jNThVwfYQLujDOyW7jXDXn
         M+1dgY35DqsmKwOsKEA79qDQhL0mq96y3eOxKA67C3LZwxmH2HBzILUWJEu42fIg48VK
         /00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bEF5MXIhUvYSAHor45X1sQNhsnVRy0XBC8W8XAYS9UI=;
        fh=J6x0gbrnG6lkUVlV58UipiWt4obJZlBfGBJeujoimaI=;
        b=mjmkw4ImIpr9uBv6nB035CZJf2Hyy62iWFUrKjHfjTqkw5EjW8FRDpheNpLY6DdI0N
         d//Y6glKqPNdvDaMsviQDUYmwq0gSAYFEvSSQaszmpw3Z5hHzMTag0EpZArcNjl4r656
         F4Rb3twZqlQjCa90qFZdybMKJwhwbcScrMZhBuI6ZUShES8tQRpcauzpJqqKTowlup1U
         LwpvTWFwBnYCBPXgfjfatUtWxawKuyaA1RzVwsaYA7sCA0r14jfSQMFXzx4GzIcnwKVR
         hfBqm6wrhSVXKKRZfablQQHeDlzw1Ofvj7xQhKoPUs6gOnzbUHDKCTDQs1bvE17YDA5E
         o77A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792938462; x=1793543262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bEF5MXIhUvYSAHor45X1sQNhsnVRy0XBC8W8XAYS9UI=;
        b=XGpN1u6RXt1z98048JeZ4ElJYgR7gg2tCnbFoCRG6ZF9Xc4YW4cCyYRdwTjVYs0+eE
         Ib9fN4UuDBFcwjxWjHA2H+aUSGljMWrIgSFrATgmjAYytSvf/NZaLQIvKfH/qOgg+kfk
         zSDOFIIsMJsr0CLdkyi1xQIUVErmjQCRQCu6TGSO6drQraUZWhCRjN2QSMQ5r0weJnjZ
         G4TncqCbbNU0VHRip/p9ZEr0atN4KQH1fXiQE4u2Pw1T2Sd2VQn+q/xBE6A6G6tIZaJM
         +7ke4pD70OGuaxQY4Jg77xwD7lItxikVnB5gLn5+hIungI2vcsPnoVkh5m5ycPoLhXC2
         foPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938462; x=1793543262;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bEF5MXIhUvYSAHor45X1sQNhsnVRy0XBC8W8XAYS9UI=;
        b=XbFbxtbHqX0XcciOzy7waHgYUr0bEOH+eCD/tUrfLTB055x826HMUf3OOFe4qibD6A
         iVFXE0vIBp65vlG+Ck4FDfjWfnyolIA5/tyYTnJrK2qVt78Y8jFIXIy5GlK7AgSVXKwN
         +jFl06k2H4hQt5bt4hgYDj1M/5Z65t/AWKJleXxznUhGLhzDkdEqC1M8S/RB5KVvHHsS
         pZgL2a4tnP+kNDq725Tavp0p6XcnSsQgjLw0XhYjwrl7rsSgEeq23M4zbF5qmehluonj
         q11JqVbQtxb1gqL8XrKnILgnQFPkK0w14MHEdR3gMocMmT7UPqMzAlK00F3A5Qk4SbEk
         JqDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxM5tLFPcALmQxazbrMHerpwjcbaEHM48Rn9D9E0K9/aDouFqqm0I6xfc0RlkUnQaSxcULg5FyQaaBQaNY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrfq+N/pg5puLCg7Vwnlpg/0HsHWW/mmlM/l4yt5lm9H8ZYfbA
	HJPjSAaCpjJchP3b3nnx7Ef3Afl69QFbSlKSGOa20iiDfYBX5+1+d6su8Q0AmwRh+jTgStlMl3Z
	2SMiX/oeCmfNUTehYuxVM1RIRevsUBH42BbbHAKvBmR+NXx6NsDf5Cefq9+B9XYl9HxykrT4rgm
	WgqVPrLRlucpHG9EQWrUlhVoHhvV/K8ISP1zJxox0uvw==
X-Gm-Gg: AYBFou2mpwGdoIke18dAPM7T3VMIEBINlGaCLbyj+uKIpXJZSH1bMH3zHjfAVlRIcU3
	dmzVRX8wOImZ6AI3Uvd7UrWrwOTV7vxmrD8GJuaZy2vvG3xuAihox+aapv+3ouExIVN3J82r4B5
	N2TjMHGU6puLNM15UF9R2tlBIV+EERQRUyMJHf4iqPzQs6S0Ab6DznsiXuExPscQm4pg+q/Vt4l
	c+xQd0rXMcwvWpnSi2SZ0CsR77G9rumF3CEgTbUEyVG1i7S2oQw7uO15dCA1L2XMv80KepFOCvf
X-Received: by 2002:a05:620a:4441:b0:93f:4f87:4f5e with SMTP id af79cd13be357-940ef9c8864mr606548185a.72.1792938461505;
        Sun, 25 Oct 2026 07:27:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4441:b0:93f:4f87:4f5e with SMTP id
 af79cd13be357-940ef9c8864mr606545585a.72.1792938460985; Sun, 25 Oct 2026
 07:27:40 -0700 (PDT)
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
In-Reply-To: <20261023174113.2388353-1-peter.hunt@opengear.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 25 Oct 2026 15:27:29 +0100
X-Gm-Features: AclHuK8i58JnRX5_ZzS5RBRiQZVDGKBfzDnGP6TGiq2ajg7fDRVCYx9EKSJfZq4
Message-ID: <CAFEp6-1brLBvgkaNK7bnXfGwHJkF_sqK4mdc2zaVuLw3_4+djA@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: iYbaZmtjBqPD2MXWL4LaiHDenSvlhSOd
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6ade11de cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=t2vznHeBAAAA:8
 a=_Ch_f1g9qXJYNguC4ZkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=V_BghkRpYkFyHJIZkSH6:22
X-Proofpoint-GUID: iYbaZmtjBqPD2MXWL4LaiHDenSvlhSOd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDA1NyBTYWx0ZWRfXx7mo/K/gkZeM
 YFrMAr+OAY0D9lwCT0mXIM1ZI+qM2mGL2dpkm85Xusk1Ch6L6UKFuOop3H2PunQ3m+gXhMJN44w
 pl6NVE+44AHoNP1JbWaUMJLp/QxWSUGpKV84SQjKa4gLQiwQ539gw5x3eD/VNWKd98sF2OYPr0v
 bmmN+SjfmibYdzMJER72l6DAoebnqhdjvvL+PRG2icFNR3Ok3vJpPgNqrORECIpG5xo77aU7+f4
 9fxvd7MkBkolNVoBuowY5hGXKIq5Wx11+FlOzvXkrRH1K0nDiP3df+a3PoOVO/OZ6Y5vTnkevRv
 8Hv6/ovpcW95MySxhQcABrHzTiAeQHvU/lzwOxdRS9pIdwA3xds9zkzpr8uTGSO92ziBCDD+FVJ
 6zqbeblZ84nS4/FLa6izXJrcmGxXAzQvJxBzJqxRJB8Dlf/tEsQx3968wvNcO06uvOEJ8Hd4905
 GNM6HGCQLWS0HS+iIPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDA1NyBTYWx0ZWRfX8uoiwJxaOaMQ
 ekX5y2yLQeV+M3JX0TuKLLY2hsoCcUQBjILynpW7ZCLs+ho//cp9RE+qiz1ZbdYFZsuDT58/psc
 80YOJHhax7Mcw+PmIZ3KpqbXLOcn1jM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250057

Hi Peter,

On Fri, Oct 23, 2026 at 7:41=E2=80=AFPM Peter Hunt <peter.hunt@opengear.com=
> wrote:
>
> Two corner cases in the DTR/RTS coalescing, found by the Sashiko review
> of the series that added it.
>
> If the IP_CTRL channel binds after an AT port has already signalled
> DTR/RTS, for example after a sysfs unbind and rebind of mhi_wwan_dtr or
> a failed IP_CTRL probe that is retried, the state requested while it was
> unbound never reaches the modem, and the wwan core does not send it
> again unless DTR or RTS changes. Keep a list of the driver's ports and,
> when IP_CTRL binds, resend the current state of every port on that
> controller that has signalled DTR/RTS.
>
> Coalescing could also let a DTR drop be overtaken by a later raise, for
> example on a quick close and reopen while a retry was pending, so the
> modem never saw DTR go low. A drop matters on its own, a modem set to
> AT&D2 hangs up on it, so remember a pending drop and send it before the
> latest state. Also run the work straight away on a new request instead
> of waiting for a pending retry.
>
> Fixes: d509edf90bc6 ("net: wwan: mhi_wwan_ctrl: drive DTR/RTS via the IP_=
CTRL channel")
> Signed-off-by: Peter Hunt <peter.hunt@opengear.com>
> ---
> Follow-up to the v10 review, as Jakub asked:
> https://lore.kernel.org/all/20261020114405.38a06826@kernel.org/
>
> Tested on a Sierra EM9291 (CM8100): IP_CTRL unbind/rebind with DTR
> cleared and set while unbound, back-to-back DTR drop+raise pairs, bursts
> of 10,000 DTR changes, plus the HUPCL, teardown and lock stress tests
> used for v10.

This looks a bit over-engineered for the reported Sashiko corner
cases, and adds quite a bit of complexity. You'll also need to handle
the lifetime of dtr_work and ensure it cannot run after/during device
removal.

I don't have a better solution to propose at the moment, but this
problem suggests that we should enforce some level of ordering between
the MHI devices (channels), or introduce an explicit dependency/link
between them.

Regards,
Loic

>
>  drivers/net/wwan/mhi_wwan_ctrl.c | 50 +++++++++++++++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan=
_ctrl.c
> index e3c207588956..52b6d3677558 100644
> --- a/drivers/net/wwan/mhi_wwan_ctrl.c
> +++ b/drivers/net/wwan/mhi_wwan_ctrl.c
> @@ -15,6 +15,8 @@ enum mhi_wwan_flags {
>         MHI_WWAN_DL_CAP,
>         MHI_WWAN_UL_CAP,
>         MHI_WWAN_RX_REFILL,
> +       MHI_WWAN_DTR_SET,       /* ->dtr_rts has been called for this por=
t */
> +       MHI_WWAN_DTR_DROP,      /* a DTR drop is still to be sent */
>  };
>
>  #define MHI_WWAN_MAX_MTU       0x8000
> @@ -43,6 +45,9 @@ struct mhi_wwan_dtr {
>  };
>
>  static LIST_HEAD(mhi_wwan_dtr_list);
> +/* All ports, so an IP_CTRL channel that binds late can resend their sta=
te */
> +static LIST_HEAD(mhi_wwan_port_list);
> +/* Protects mhi_wwan_dtr_list and mhi_wwan_port_list */
>  static DEFINE_MUTEX(mhi_wwan_dtr_lock);
>
>  struct mhi_wwan_dev {
> @@ -71,7 +76,10 @@ struct mhi_wwan_dev {
>          * changes is coalesced and only the final state has to get throu=
gh
>          */
>         unsigned int dtr_mdmbits;
> +       /* State to send for a DTR drop that a later raise would otherwis=
e hide */
> +       unsigned int dtr_drop_mdmbits;
>         struct delayed_work dtr_work;
> +       struct list_head port_node;
>  };
>
>  /* Increment RX budget and schedule RX refill if necessary */
> @@ -197,6 +205,21 @@ static void mhi_wwan_ctrl_dtr_work(struct work_struc=
t *work)
>                                                     struct mhi_wwan_dev, =
dtr_work);
>         int ret;
>
> +       /* A DTR drop matters on its own, e.g. to hang up a modem set to =
AT&D2,
> +        * so send it before the latest state if DTR has been raised agai=
n
> +        */
> +       if (test_and_clear_bit(MHI_WWAN_DTR_DROP, &mhiwwan->flags) &&
> +           READ_ONCE(mhiwwan->dtr_mdmbits) & TIOCM_DTR) {
> +               ret =3D mhi_wwan_ctrl_send_dtr(mhiwwan,
> +                                            READ_ONCE(mhiwwan->dtr_drop_=
mdmbits));
> +               if (ret =3D=3D -EAGAIN || ret =3D=3D -ENOMEM) {
> +                       set_bit(MHI_WWAN_DTR_DROP, &mhiwwan->flags);
> +                       schedule_delayed_work(&mhiwwan->dtr_work,
> +                                             msecs_to_jiffies(10));
> +                       return;
> +               }
> +       }
> +
>         ret =3D mhi_wwan_ctrl_send_dtr(mhiwwan, READ_ONCE(mhiwwan->dtr_md=
mbits));
>         if (ret =3D=3D -EAGAIN || ret =3D=3D -ENOMEM)
>                 schedule_delayed_work(&mhiwwan->dtr_work, msecs_to_jiffie=
s(10));
> @@ -209,9 +232,19 @@ static void mhi_wwan_ctrl_dtr_work(struct work_struc=
t *work)
>  static void mhi_wwan_ctrl_dtr_rts(struct wwan_port *port, unsigned int m=
dmbits)
>  {
>         struct mhi_wwan_dev *mhiwwan =3D wwan_port_get_drvdata(port);
> +       bool drop =3D (READ_ONCE(mhiwwan->dtr_mdmbits) & TIOCM_DTR) &&
> +                   !(mdmbits & TIOCM_DTR);
>
> +       if (drop)
> +               WRITE_ONCE(mhiwwan->dtr_drop_mdmbits, mdmbits);
>         WRITE_ONCE(mhiwwan->dtr_mdmbits, mdmbits);
> -       schedule_delayed_work(&mhiwwan->dtr_work, 0);
> +       /* Publish the state before the flags the work tests */
> +       smp_mb__before_atomic();
> +       if (drop)
> +               set_bit(MHI_WWAN_DTR_DROP, &mhiwwan->flags);
> +       set_bit(MHI_WWAN_DTR_SET, &mhiwwan->flags);
> +       /* Run now, even if a retry is already pending */
> +       mod_delayed_work(system_wq, &mhiwwan->dtr_work, 0);
>  }
>
>  static int mhi_wwan_ctrl_start(struct wwan_port *port)
> @@ -357,6 +390,10 @@ static int mhi_wwan_ctrl_probe(struct mhi_device *mh=
i_dev,
>
>         mhiwwan->wwan_port =3D port;
>
> +       mutex_lock(&mhi_wwan_dtr_lock);
> +       list_add(&mhiwwan->port_node, &mhi_wwan_port_list);
> +       mutex_unlock(&mhi_wwan_dtr_lock);
> +
>         return 0;
>  };
>
> @@ -365,6 +402,11 @@ static void mhi_wwan_ctrl_remove(struct mhi_device *=
mhi_dev)
>         struct mhi_wwan_dev *mhiwwan =3D dev_get_drvdata(&mhi_dev->dev);
>
>         wwan_remove_port(mhiwwan->wwan_port);
> +
> +       mutex_lock(&mhi_wwan_dtr_lock);
> +       list_del(&mhiwwan->port_node);
> +       mutex_unlock(&mhi_wwan_dtr_lock);
> +
>         /* Give the DTR/RTS drop from removal one attempt, then stop the =
work */
>         flush_delayed_work(&mhiwwan->dtr_work);
>         disable_delayed_work_sync(&mhiwwan->dtr_work);
> @@ -419,6 +461,7 @@ static void mhi_wwan_dtr_dl_xfer_cb(struct mhi_device=
 *mhi_dev,
>  static int mhi_wwan_dtr_probe(struct mhi_device *mhi_dev,
>                               const struct mhi_device_id *id)
>  {
> +       struct mhi_wwan_dev *mhiwwan;
>         struct mhi_wwan_dtr *dtr;
>         int ret;
>
> @@ -449,6 +492,11 @@ static int mhi_wwan_dtr_probe(struct mhi_device *mhi=
_dev,
>
>         mutex_lock(&mhi_wwan_dtr_lock);
>         list_add(&dtr->node, &mhi_wwan_dtr_list);
> +       /* Resend the state of ports that signalled DTR/RTS before IP_CTR=
L bound */
> +       list_for_each_entry(mhiwwan, &mhi_wwan_port_list, port_node)
> +               if (mhiwwan->mhi_dev->mhi_cntrl =3D=3D dtr->cntrl &&
> +                   test_bit(MHI_WWAN_DTR_SET, &mhiwwan->flags))
> +                       mod_delayed_work(system_wq, &mhiwwan->dtr_work, 0=
);
>         mutex_unlock(&mhi_wwan_dtr_lock);
>
>         return 0;
> --
> 2.43.0
>
