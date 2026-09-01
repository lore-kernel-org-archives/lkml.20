Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6C146EC7C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250123; cv=pass; b=iuZuFFkEGNg8ZviHFzhC0KVD87U3zNsSoZXLtcI8muXQZNxE1Jf/yCqxqWucdG84ZTK+yAsNLLS5GVh7QW0sfhSz6yOXY4hnK9fqoTaE2uLuBp5KgFsPDx55J5+faEGGvX+aDPgbjq6eGGCp60KVL7r8OogavVbVme7stSbANe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250123; c=relaxed/simple;
	bh=gTWI4BcWGvGEt450M4Ez2b9tan7P4TWcMjFJL2RZnHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KtSu5drvwcPLj9aaxMAEVGwBmPrXHnEpYnKtIzZyPB70zDJNvvtSk0CP2ip0vZhbOV9fzRAOB31AGGFpV5CNYk3Vws2YY/0Crn/eOJ49HoqrBlnBuQxYfhJgz5ctAuCy6Nd3Lz+UXUxTdhPr+WWOJOs2FQYuoR1toCv/zCjmPI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1XtT6Dc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y3/bgCg8; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1XtT6Dc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y3/bgCg8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68178r6U2974280
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 08:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ulHqb7cE1CIcN7Qr2Yem28jNDTGlPMQf8e+dXPDEHi8=; b=S1XtT6DcnRt2ncR5
	Ed1KGoJXkVE95bjqMOdjZ/m8mXLDxO1J2H01oc32wKzDM07kiKoIOBUtyGyUC5IZ
	RSRnmiVrcdK4NAknwdnT5NbZgUWwzSL8XW0F97ix3+YcpvRzR2ymELBlpc/06oAA
	5nZY077nEinIRvaj9mf7/b5hq+IPXvGlkL03YvpQqSFNQw3HDGivzW2xPwCVvJYm
	0F8hUQmDiVjHihE21dce7danVCDGerazQQ1KYDUtKHakjBQkkY+UqUiXRjlt2V/d
	qDi8xZSQQTuTWrFDaH8QIX+BqUtooKxOJXfpbUmQjorRDlKWCaLkN3Y9Czip6ePU
	2/339w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu0bug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:08:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e9bc1fb67so230046d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:08:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788250120; cv=none;
        d=google.com; s=arc-20260327;
        b=Y9Tl6TCM5AQUq5N1diMSO/qC/Yi1NypgJ8gf0FgO+tr2D/D35VX9Mft07lgAqG/Dc2
         JT2l+hBMUU6kchWdvn7RiLgAm05MaSFbxTQhdX5GgpnJ4MkgDmfjjMsCb+fPkVNhdztY
         HWST/6TN3s5M6pm1sbghHKt6lwuYjwSbc5+8SUSRoZouvdLR0i6s2AOQ45TAZyg5fBkx
         eF7mQ7szUGZqww/aAjit53STpx+NIfw2If6SohzK4HCHxhQTFIe/CW/6Mf3yMyRsjUok
         vdJnJlFN7f4lg3HRWY6NxBewo3Lyx4QfeHqBO0UjLp0WmJSIyWCFYcVl6L0gf9ufTGaL
         5qWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ulHqb7cE1CIcN7Qr2Yem28jNDTGlPMQf8e+dXPDEHi8=;
        fh=raS6rlSbdYdy6xZYk6hWsiaj7KixnwIxzg/eIp1Lfz0=;
        b=KvJSkgpC/1nnSo76w1X9NGYyFEKAG/CwJM03X7ltb1V5qfFrSE4IdHGO6PqrrVGyWo
         aIX1/QBRNP8o+m8IpQ8eq0qGnf92YMlC666TwzGs+s70aEyRFi6mQcd+338WPq5Dlr3w
         IbOdpinxiOok2AoyZPef5aVjosL17VjKzJBMqk1ifmyHWHDCa8SlpmArODB/A7kdZtRa
         4kF0ObHUazqIBaMOPEafuZ8SsrvUZ+HcpbyQJbKn8Eddtbt9EK5S9xaEkGGTSXjgmogl
         buH2GlsbPYZ+LhQOpx1LUhslzqLSUNzZ8TKhPUo77M/QNFV4dsP1MU3whVqQ0WGd5ZXz
         GgNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250120; x=1788854920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ulHqb7cE1CIcN7Qr2Yem28jNDTGlPMQf8e+dXPDEHi8=;
        b=Y3/bgCg8y7aBFLA76RqHRfditkYuXVfaPLiWdyG23d9jEwxkAWcPoqQLMLdZtLg6gA
         l5kz0WiJM49sIrmzQYmV4FyTNaknd4IehYUXpCqxKYINCusyApXh5k9T91Vfb4RRaeoX
         WgJpqPNPkoSn0MyOiDcZZg9H5CycCkE3JPXOfQwHrud2XcYlPYIHyi2Ykqf3wG3aziUP
         VBl9o5rWWUdkap6T1fN3mU1ua8dqyovXd6oAzUWAxNpnmmlCTctEQG1fHwL7ZjoL6FYB
         iiz+rR/hZxwwXhJ5vrsiqXlAQ5jLKrmkGqzkScG4pv3990brBkHxTZVYux1GwOtVShgx
         Cnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250120; x=1788854920;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ulHqb7cE1CIcN7Qr2Yem28jNDTGlPMQf8e+dXPDEHi8=;
        b=hx1et9PxZzPLW8TeVcdyhuDbYtk24eSdZnhxCcLpMeEJ1SC3RehaEl7RwqXWFg8N9f
         K4vSTc0ef1CdT89LIv5u0Ey0P+HZX5ekBJWlqlS4Hms6AnL7Y90rr9Cnbl5ny9/tzsn7
         +72+7jdk1xBQFmE+C19TrcmT0IDUk9NppsZWD2Lqwej2UOZIOnUsC/zrvEc04Px02Et+
         lXqaaXT/xDcK3H2QpHTYErr30i5bdNZYlll+o2QA89PBzEAjgV2my2kibdfVYY6oUOBk
         I9Vke47pZuas+Qibt2dpBa21iGG/Ay9diah8TZ5IUUMz9kJ8/l7yy3X1xwvuP2A8xkXR
         c1/A==
X-Forwarded-Encrypted: i=1; AHgh+RoFutF/e/rT9cCbNjEgp7wwYmP1GgWYabs8wz/4fdpaLtjFZlR3gemcimdSwNteBtbZl86pIHGCkMJ0Re4=@vger.kernel.org
X-Gm-Message-State: AFuF++npyUl+RlaLR01dfCdrHx2GJfiIHIrRripmAJrpERMEKcvao/Nc
	ajmFcYH9SuYziDYHf4FdN/iWsXdxxucpdjR2UIspHgqoGte2nOGllx0qIGU+ulG8QI5uXDkfW6I
	0ED75w8nHVTFdQbE7dCOjvjZC3TXS1prwkzTXaa9KfRovIfEJbjszntI0frIEQFWDcZfC0srqWs
	tiIuxCMiH3hXb/GQoEq50lLDdtwVsbtvRTll7P7d76XA==
X-Gm-Gg: AR+sD11c2lWEoJT2qZBGNWgsSLmGGZr31/rhPDQwN9YP5KxZOMbz+XrJbrgmXl/8Yjk
	sF/hdDN3eZLxBhbOgRfjpT8SGw4mrsjli74Sk0ny6xWFjtK0GsVdNSYv2NOS/MLO/zrFphBq+1d
	OmCnkDr7VC1P9kid9J0DvVSIboYd23a+FRstbIKpmhMRXBLCK0+7+0MuWAN97HAS9lfsZsTie7i
	CumlzqnNUq6vAy8nRxoeIgTuO1MEplbd8tV0Z2FCWHAR8f+cirsEBlqhnslbWQiNNAz18dtvAM=
X-Received: by 2002:a05:620a:700d:b0:938:fdde:b578 with SMTP id af79cd13be357-93947f3bd5fmr771931985a.6.1788250120085;
        Tue, 01 Sep 2026 01:08:40 -0700 (PDT)
X-Received: by 2002:a05:620a:700d:b0:938:fdde:b578 with SMTP id
 af79cd13be357-93947f3bd5fmr771926685a.6.1788250119639; Tue, 01 Sep 2026
 01:08:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831181006.1382372-1-sinyavin@gmail.com>
In-Reply-To: <20260831181006.1382372-1-sinyavin@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 10:08:27 +0200
X-Gm-Features: AcwNN1Xi38vf5viBcQ5z7AYY8-XgrmmkXTpAo5QbZdv9r8lQS_qPsi3OqhYuNxY
Message-ID: <CAFEp6-1Ne2SmyGGLBMMtiXtXXmzEySX0ZgzijNn4-QtN+KFhmw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: wwan: qcom_bam_dmux: account network packets
To: Dmitry Sinyavin <sinyavin@gmail.com>
Cc: Stephan Gerhold <stephan@gerhold.net>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXwOhOuVzlSs1K
 BWZk5aQxsq+viB8ekibPap+tgBvqNEbg/GqD7Cxia7kE8Q5/h7E/TztVfaaOpwIf4L9U7DgQgR2
 iXBRJUUQhJmDgUols28PiH8ZNgLnpNuugUKCHwtSQoSMO3w/ekH9sv4SBZf1ri9gCc6JqHXADeT
 +1E5fXCOFYFPGvnCwLQmTHeh2Et0t+JqXQJlqqt+gI8GK5d7QJHu3ikaS0gQX4Yfn5Ag+ODS7qv
 /+y+G7ERUsSorSA9HcjkEj9l2FDiqdNCQ14XhqCpsi4EQuuD30dxtCzuarW2iZDEiABCT3BsgxK
 UlrUfZYH4e5kRNTHUz5B1fwPStvIvyUk5qrS9b3iHlGHG3f/iJfcjtM+6+SnS+qJ6Zs3p90Iq2o
 NkwJ5zScJ8QuhQXZ5h7cS+vcfYxl0xUNV5zJbFFc7mjxhETVvr8f9H7yhR89GU8aFW9lXxE57y/
 LgcFtVscMbj1CMy4PZQ==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a968809 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=FNx5MMyy-2ZDTin-KYsA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX+6bmQiS2Buxc
 UQzzR0GqZvdAdy0rM8TMk/viHAuSpmGpGPL/FYETgKFDJDhoHLP7dCyBWit/n9Q1G+D3UbsLZED
 qdeVgAavD5S+c669v2Q31PaLNLS+JW0=
X-Proofpoint-ORIG-GUID: HBmgc7vSWLVKRUrlQqLnr2a2YS_vlIQV
X-Proofpoint-GUID: HBmgc7vSWLVKRUrlQqLnr2a2YS_vlIQV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

On Mon, Aug 31, 2026 at 8:10=E2=80=AFPM Dmitry Sinyavin <sinyavin@gmail.com=
> wrote:
>
> The BAM-DMUX data path does not update the network device packet and byte
> counters. As a result, userspace sees zero traffic even while packets are
> being transferred.
>
> Use the standard per-CPU software statistics helpers. Account transmitted
> packets after their DMA completion and received packets after removing th=
e
> BAM-DMUX header and padding.
>
> Fixes: 21a0ffd9b38c ("net: wwan: Add Qualcomm BAM-DMUX WWAN network drive=
r")
> Signed-off-by: Dmitry Sinyavin <sinyavin@gmail.com>

Looks good to me. Since you're touching the statistics accounting, it
would also make sense to update the drop statistics, for example by
incrementing the TX drop counter in the xmit drop path.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
> v2:
> - Read the TX payload length after unmapping the DMA buffer and combine t=
he
>   network-device checks.
>
> v1: https://lore.kernel.org/netdev/20260830085400.2542956-1-sinyavin@gmai=
l.com/
>
> Build-tested for ARM with Clang and W=3D1 using allmodconfig and allyesco=
nfig.
> Hardware-tested on Qualcomm MDM9607: three 32-byte IPv4 probes completed
> without loss and added three packets and 180 bytes in each direction.
>
>  drivers/net/wwan/qcom_bam_dmux.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam=
_dmux.c
> index cc6ace8d6437..5bcac2ccaabd 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -177,8 +177,12 @@ static void bam_dmux_tx_callback(void *data)
>  {
>         struct bam_dmux_skb_dma *skb_dma =3D data;
>         struct sk_buff *skb =3D skb_dma->skb;
> +       struct net_device *netdev =3D skb->dev;
>
>         bam_dmux_tx_done(skb_dma);
> +       if (netdev)
> +               dev_sw_netstats_tx_add(netdev, 1,
> +                                      ((struct bam_dmux_hdr *)skb->data)=
->len);
>         dev_consume_skb_any(skb);
>  }
>
> @@ -402,6 +406,7 @@ static const struct net_device_ops bam_dmux_ops =3D {
>         .ndo_open       =3D bam_dmux_netdev_open,
>         .ndo_stop       =3D bam_dmux_netdev_stop,
>         .ndo_start_xmit =3D bam_dmux_netdev_start_xmit,
> +       .ndo_get_stats64        =3D dev_get_tstats64,
>  };
>
>  static const struct device_type wwan_type =3D {
> @@ -421,6 +426,7 @@ static void bam_dmux_netdev_setup(struct net_device *=
dev)
>         dev->needed_headroom =3D sizeof(struct bam_dmux_hdr);
>         dev->needed_tailroom =3D sizeof(u32); /* word-aligned */
>         dev->tx_queue_len =3D DEFAULT_TX_QUEUE_LEN;
> +       dev->pcpu_stat_type =3D NETDEV_PCPU_STAT_TSTATS;
>
>         /* This perm addr will be used as interface identifier by IPv6 */
>         dev->addr_assign_type =3D NET_ADDR_RANDOM;
> @@ -533,6 +539,7 @@ static void bam_dmux_cmd_data(struct bam_dmux_skb_dma=
 *skb_dma)
>                 break;
>         }
>
> +       dev_sw_netstats_rx_add(netdev, skb->len);
>         netif_receive_skb(skb);
>  }
>
>
> base-commit: 2188569e7e1b0bc3f3b557dc97ab7a02befc11c8
> --
> 2.53.0
