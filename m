Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4CC55C1D4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959458; cv=pass; b=AegvK+V24tMstcSv7V5oRucUhpL5v21fFkdko48JT7rzjKLPil2nBjargpjeqifrOqehTLTmYw992gGH8gFzAp8Q09K7/1bHmWwHcP6/4GkO4GUyNupefJh2k3yT7mbpHcHTDYv0CjDnSiOrhcEWs3PWqMi0zdeZV2Tnbald9cY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959458; c=relaxed/simple;
	bh=USoy+/1sjsE8gM7fL1ZzAANxBJA3GIi2oiUUyXweKmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6i9yrrVIzDhP2jAnVmpMZmdTEfyi7V76ZSScwTwhFo3PxQ1xH5MGc3sm2nbiSRxozGLB3dARiDVAf17RbHREc8FCwCoh9+Qc5lLJkmfBHeCLQl41wMxbfbropQvPvPYCB6E+FP2yq2JOdQkrd4vQU1tMWslphYhISP0mPzoVgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W+6uoT1W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IvLfIs+T; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W+6uoT1W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IvLfIs+T"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CCxd53053161
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 13:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e18YgiYDcY3A71+s9t6tnvZG6iOI2p470IJGpWf+I9Q=; b=W+6uoT1WlKKJVmm6
	jBFUof9ktWt86eS+f0SztMAYfbEm1jpajPKOOEG47A1dnbqWamS8WJ1bGOrBVd9l
	2sLqg+iirSIIFwzCjnOeEMp6o9ZUmg4oZHbsquZhFbPw9HAkWu7v5gUtfIZAcHJ3
	CZTaKI9AtVZ2+4iDIY+8p+Q/JVBnuHnnGTaSBI1ynpvynT53D5IfdATiX6QYNjF+
	wujvbVBDOr0SVnoOmi0QiJL0JeU1k+nbnYR2WUhLwbUKd35I/P2vvITs9bVbs8ks
	guuL2/Pc8lAXQzLTPu1IyfAUUgCitjzdxddOusL2++iUQGOftvJ04tLjs+aJt/0P
	PNtjCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk79206nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:10:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939a00c45easo546928785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:10:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788959456; cv=none;
        d=google.com; s=arc-20260327;
        b=T/jV239T1j0iituso7n/8cK4D3wrIZCKDSA/0KUlOE7Qsn03Ljshiktl8j2DZS9NmN
         9YeEZH6NeGKH9erjktLAlORiPFWj1Gx6u6fCYnaujDzJGdDjxow97gMyO9i1PK5RxAai
         rZdq7zE1Hp/4cX+1Fggl0wg3ouFUGEkz3wIB99og6jXPTX2rbwHQsPtFaMXi9L7ZeJAS
         CfCo21STBc7MxvPScNtlQf1TQ5Irso+NIjmr6NUVNOzvpXokWo4Qrc+1ucV9ONqK4dGL
         7ktaOYVKKbTYYZ3rbgDzQ/Eeur+bMuyZfvmC88tnagCMLVtbsAB5vWVNlOtR7Q8Qksmf
         YzfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e18YgiYDcY3A71+s9t6tnvZG6iOI2p470IJGpWf+I9Q=;
        fh=dHCmokvp5ablFqnS656O1vVcsrSWKOecDSdnqCoM/j0=;
        b=CjGGfsmtaEUZxcFPax9ja4np5SmxtOMyr+qE7wEnz3q/xhxjbTerVAntk7zyqlw8H1
         XsMqREmmkEPtYUQSNadm//LxXRE+Qmlo0mWslfl3DJBS3T2Oq3sH1Yivlf1IF9hnwi7X
         bwqcJ4jx2OPe1JSuv7e8Fih+oN3YobTsWhHDCG1E0Xto+VEc2yIbb98+tPOGvRvDQato
         zr3C//nxjbain/E3/oyKv6gi2uJgX4yyk/SsSHkmTrgpQXB1hNdOh/YqilLy7XRYodqW
         DzgRUbs/KcqFzWXvkZzdy5ilOpF3IMlRZbPNd0WWuBHEVU85D2HHNyfzksLB5jh2CQfT
         Lk7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788959456; x=1789564256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e18YgiYDcY3A71+s9t6tnvZG6iOI2p470IJGpWf+I9Q=;
        b=IvLfIs+TNExH37c3v4xV5/ut4ULte2kdBwKyka4RwKKFWhpVBlggO53hJQOLuhdoCn
         DBsdcg6bvZaT1UxJZmy7L1YwSNFc+j+0BaQMoPhr+2R8AfD/Qi5RbVyHJo/ngQ/7JNQu
         2et0tqTdGxbcMQ5Mi0AZsHw5cDqJnjDjEy+ZtnSsBRy3rda6AOiEODqcjngbeHVwkCF7
         zNhv6HStRGoPvwpvWIm3VsqKNJyFH4+76aUL0GWtgNr6XEGfwyP/0qegiqb7mJ82q1Aa
         eD6kFAnXuIz/2huD5OzPAyYyLY2PgjxHwTbXFkqiH0poYczt9lIH3jQr5hjqYQaH/26a
         Hzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959456; x=1789564256;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e18YgiYDcY3A71+s9t6tnvZG6iOI2p470IJGpWf+I9Q=;
        b=AjAUWmWzNEEmG7WNODg4X6M3XQBgJYj8pYtP9Lwqg/Af2Hb/D2Ahb2+uiOkN213kA/
         hy6lInHnxK79J79lzZ9ST7ECJd7+MXS/yI9kiLsPGN7wgMlIDzINpJdt7IGw8RCriw75
         eb72cFd9dF+puaBTQdr3OuTYEYIw09t0NW7a2PIxo63j7BgLbejjOVfyhUePaUAkteqH
         Ca0ZGPK89DJsUzV8tRJz+HOlEaoDX8qTOU+uEW04hj9Ozvf5MOgAa3atIFVqYlNEHg/0
         q5+pCvU/zlEV78pyWSitaVHuQL7UX+3J1sqBbhrkxadDo/l40odzM4RrxICZ99B4coZ5
         GE2w==
X-Forwarded-Encrypted: i=1; AKwUvBxUw9MVBWkM/t3Vu4SZga+IU+LFs5fKoLOcSRJIuOiHSuN63a/L8OCjtDE2nSsqjcpKaXOHwcAmMiBswSI=@vger.kernel.org
X-Gm-Message-State: AFuF++mTufjAcN9eOjQdheb/Vf4DA8DUhHC8dHUoNPM8eRUXVk3B0qT+
	bELWqSxXMV2TXtdgYNOiKs40LIkXI2w/Ex9XpRq8Hmk0rDxm5Chqe5UJTKfq1izEPy2/TPEgYXa
	zPo1Gx7CGci6PPmBuljmm82kgLFCCX3UGwiJdrXZ3zRMICk0hjpOIKMFAaNySqSQBJTnlYZwnv7
	1YuYKIiQwtguEKcAY71Q12PJZfSWDu1IKlvQEXnkylaw==
X-Gm-Gg: AYBFou0AKHMf1T1gi/g10TII86kicTGLTR244d1n2I/5zI/eqYmgOEubJlA8B94uCtd
	naQNcGuKPM5TUuXfp/hRkc80z/Xs5AyRi/GfeFr9Wg33csFZf/2wUX09YvhKmIS/ZpvjLSmNVpa
	cShEqzOa7NHE97rjjOcdJMrXyXxJGWXwLZBauz76LQTJ83e87KV9OZTLnVOYLA/b53abv4ft80E
	J8UQGEisdwthKsjhAUmR0sCk+IgqsdCkO0IjvxpWe0sU5I5ChaIBVaum4oMqdNCvRRWMvb0cK0=
X-Received: by 2002:a05:620a:3186:b0:939:c9e9:81a3 with SMTP id af79cd13be357-939c9e9e6d3mr648185285a.30.1788959450568;
        Wed, 09 Sep 2026 06:10:50 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:c9e9:81a3 with SMTP id
 af79cd13be357-939c9e9e6d3mr648177885a.30.1788959450098; Wed, 09 Sep 2026
 06:10:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909054401.718959-1-zhugl3@xiaopeng.com>
In-Reply-To: <20260909054401.718959-1-zhugl3@xiaopeng.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 15:10:38 +0200
X-Gm-Features: AcwNN1XRBsJQUp_8Vo3_MALJlQYTHzC-PLbfBluaOY_sDn4qJVdQudxsA1DY1GQ
Message-ID: <CAFEp6-2xNNJ_uNV+fuY8hxcURW0+zoiKgCV92+10PR7oZn_UEQ@mail.gmail.com>
Subject: Re: [PATCH] net: wwan: t7xx: validate the HS2 message data length
To: Guanglei Zhu <zhugl3@xiaopeng.com>
Cc: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Liu Haijun <haijun.liu@mediatek.com>,
        Ricardo Martinez <ricardo.martinez@linux.intel.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=bd1bluPB c=1 sm=1 tr=0 ts=6aa15ae0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EgahoUkMAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jOW7-oFJvRO1IEPcfKUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=D2SkTF70-_n5gOfERQdM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NyBTYWx0ZWRfXzIPabeyclBtR
 siGPTxgAGDyXGXDHhqBSrqBYwZ6zpi1muGo76PTyqea1Kqt04mA8JQdmODLuF0O7UdNSR6oR5km
 wDaTDfSYEkyoDIN4Jq96GSCxo1GOnlyzuapTqrk9mnnI8f9YvK1rgHt5reHyrsRxRIS1ExVGsop
 dQMLJ4tIdPBfbPLPkgAa1IeedMVnq49QCY03QP4rI8pvD89nT+HBWC3NJOJOrJosAWb2+8usKqJ
 dzMgdPUl/JVsFFnZ7HoYbMJ6uJFIxSstMwoeJ0+XMi2Bg0DMv/+sJg5pPRxMLSQYEC5dCzGHDik
 cijsCk6kL7MPm6cQ/ChdgD8tkuFulrN11P8kdPdYubEP7/Y0331XG2ZmS7XnUBA7HEnr2RZUuF4
 PZKrU1YKsMy3SrID/zAVEGpQnmswvwgC7fQ4kohgw6GDOm6OPkjGYPIMLJ9MK4dxYEsHA/sn7sM
 csc9S0JSeAHjC0W7ScA==
X-Proofpoint-ORIG-GUID: Nca-3J2uZmOMsxtm1fYxi7oKGknP_-2T
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NyBTYWx0ZWRfX7eGNAc7lP2VV
 gM2w646sL2v09j+fSSDbJBUAt/SQLEKLWR3uEuOoP1HLUwoeIraPHhdtNDZO2h/PhqhkY/rZ8BD
 hgHTFIYNDPdZabMuHhxoZu92A7aiDi4=
X-Proofpoint-GUID: Nca-3J2uZmOMsxtm1fYxi7oKGknP_-2T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090147

On Wed, Sep 9, 2026 at 7:44=E2=80=AFAM Guanglei Zhu <zhugl3@xiaopeng.com> w=
rote:
>
> control_msg_handler() passes the modem-supplied data_length field of a
> CTL_ID_HS2_MSG message straight to t7xx_fsm_append_event(), which
> memcpy()s that many bytes out of the skb.  Nothing compares the field
> with the actual length of the message, so a modem reporting a larger
> data_length makes the driver read past the end of the skb and store
> kernel heap memory in the FSM event.
>
> 0e7c074cfcd9 ("net: wwan: t7xx: validate port_count against message
> length in t7xx_port_enum_msg_handler") added this kind of check for
> the port enumeration path but missed the handshake path.
>
> Reject the message when data_length does not fit into the skb.
>
> Fixes: da45d2566a1d ("net: wwan: t7xx: Add control port")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guanglei Zhu <zhugl3@xiaopeng.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>
> Verified in a QEMU guest with a fault injector feeding the driver's
> control port thread a handshake message whose data_length exceeds the
> skb: the unpatched driver trips KASAN on a read of 8192 bytes past a
> 500-byte payload, and the extra bytes land in the FSM event.  With
> this check the message is rejected, and well-formed handshakes are
> unaffected.
>  drivers/net/wwan/t7xx/t7xx_port_ctrl_msg.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/wwan/t7xx/t7xx_port_ctrl_msg.c b/drivers/net/wwa=
n/t7xx/t7xx_port_ctrl_msg.c
> index f869e4ed9..0f2ead8a7 100644
> --- a/drivers/net/wwan/t7xx/t7xx_port_ctrl_msg.c
> +++ b/drivers/net/wwan/t7xx/t7xx_port_ctrl_msg.c
> @@ -178,22 +178,32 @@ static int control_msg_handler(struct t7xx_port *po=
rt, struct sk_buff *skb)
>
>         ctrl_msg_h =3D (struct ctrl_msg_header *)skb->data;
>         switch (le32_to_cpu(ctrl_msg_h->ctrl_msg_id)) {
> -       case CTL_ID_HS2_MSG:
> +       case CTL_ID_HS2_MSG: {
> +               u32 data_length;
> +
>                 skb_pull(skb, sizeof(*ctrl_msg_h));
> +               data_length =3D le32_to_cpu(ctrl_msg_h->data_length);
>
>                 if (port_conf->rx_ch =3D=3D PORT_CH_CONTROL_RX ||
>                     port_conf->rx_ch =3D=3D PORT_CH_AP_CONTROL_RX) {
>                         int event =3D port_conf->rx_ch =3D=3D PORT_CH_CON=
TROL_RX ?
>                                     FSM_EVENT_MD_HS2 : FSM_EVENT_AP_HS2;
>
> -                       ret =3D t7xx_fsm_append_event(ctl, event, skb->da=
ta,
> -                                                   le32_to_cpu(ctrl_msg_=
h->data_length));
> -                       if (ret)
> -                               dev_err(port->dev, "Failed to append Hand=
shake 2 event");
> +                       if (data_length > skb->len) {
> +                               dev_err(port->dev, "Invalid HS2 message l=
ength %u\n",
> +                                       data_length);
> +                               ret =3D -EINVAL;
> +                       } else {
> +                               ret =3D t7xx_fsm_append_event(ctl, event,=
 skb->data,
> +                                                           data_length);
> +                               if (ret)
> +                                       dev_err(port->dev, "Failed to app=
end Handshake 2 event");
> +                       }
>                 }
>
>                 dev_kfree_skb_any(skb);
>                 break;
> +       }
>
>         case CTL_ID_MD_EX:
>         case CTL_ID_MD_EX_ACK:
> --
> 2.43.0
>
