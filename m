Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87775448BA8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514901; cv=pass; b=DuBLifuwj8LsXRXNKFCq4CXNIMI8Oz92240KvkpKKffkr3IuKe9tqiSQ14hZ7pRihlx6x0M7168HMkYAoIGiYoovyOQV278yaL+Rg+6c6WwtZQZYOqW3IYXp9wWFwzS5Z5KtU4So31aYKdDTuLEEnDJujZCWEmvBn/9OlBnsgpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514901; c=relaxed/simple;
	bh=cmWCjbwsq2ET01BaCE28jZNCemmzGOUg3FeSLqfMmVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Weg/DC4frc/wrWnYU1o4WsYFRGFnsV9+29Qs9B8AW0T0t78VKjeOPHxDWY1zG1PXDE4+Wog8hx6RuDiBuOFsuQgRyT8qQCsbbnnm7Vbr4vsL6feHwA1u+ecx6/TI52GLxsfupLH4PoD2wyTnI97GpSHQJxetaFmTZ8cl9yxiLFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AgQR2y+M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUBUOb8h; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AgQR2y+M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUBUOb8h"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847msds2351612
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 09:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EAlCtZvrO7quQeT5Neq3cVBP1CBq7rFsygu26TBie0c=; b=AgQR2y+MYMI3ZRvQ
	ibjeYKSuQF4IH60L37co+MfDsZcUBqyi8P58KUzp+pqS2NJN8H4hkMn7OaB/ecve
	wXdNlkqvGqsFNaG2f5LQn2+0qUeyR0z/4C3swTQ1PvIWyI9qkN3VdRSXNBakg+Cr
	xKBupDQErkojbJlY9Z0AkYc2wb6IuQ7l3XvVIdOA3afAstGMU6ey37j3sNSPBZjd
	WPjpEREuCzWWO6C7GkUMqKLkJczBKE16O3+5g2lCxux902Ac8pBlH0KACL0ko/vr
	NNYMdFJ+WdynuJ542qI1lltrJ3b9LCVm7U9f8o/barMD/EnZmtf1ye1k9nh2MDxd
	2r4eRA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fh4ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:41:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc2229450b4so1003500a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788514897; cv=none;
        d=google.com; s=arc-20260327;
        b=N6Hn74QTEart0eEEhqf6uBgJFVe7Q7ioSImJpUVGSXR0kAL4CTGI3M2k4a2DH0mUHI
         CuVNg5XZUe3Vudv+NLEoUDfwHjJHxYzoOGJXMUwXiz7+cp8HdYMHhxPnD1/Y+b6KbPAT
         1WzH90Iro+gYHinWtRo3SiKL7NTezaNWU6dAuptTVGUYgkXgT2ferBxQ3VImRxMd1xox
         n3IPIe47eyxhXGB/wE4AOAq/z0YxlHok9aQ4YI39XWSRAsHp214N6wqYM+vb595HVJLI
         3UbMvd1w1p8IDjeQNPKHjjlwcfz+G74sb9HR26fxHkqhJZRzd+xdXUFdp/QdE0ZHH8/2
         npCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EAlCtZvrO7quQeT5Neq3cVBP1CBq7rFsygu26TBie0c=;
        fh=3JCDiXfUsHmiSBPtBBvPsD+1DNS7ZSZHaK1fwYE21lU=;
        b=SLvShusssQGH7AuAEopyb967GRl8AeNLCWWxgENKZVpQSQBI0LFYLEAMRImwK4juDC
         aZEitquY7hgb2SthGjFZc+uPCLCnei+rwCvD7+VIzdH+bIkk3iCuqFFxZVIi0qjc2Plq
         VOhnqElqEAHxFzdkasTGoXR9jKoKJlaS3WDnKae7ChXWYEzjsdQcpyk1YGX3k/vuPu4s
         I7b0iitqkyP0So+4FNyt7QCwxHVPKp9syqReSP/AuLH26NTV0SeIrstlN6r8ZfL76dad
         BI12RHYHqYUMmxDVaHSzf0w6ukdZ3ydauPctp0dpQE4sBfscajtFBIp4fXlhg7T8yl1x
         t4Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788514897; x=1789119697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EAlCtZvrO7quQeT5Neq3cVBP1CBq7rFsygu26TBie0c=;
        b=BUBUOb8hw/s8jdDzhID/zV7kzY5m+cc/7Ln0Up04m8hWkUB4Li/M4T4QsmyWlovKWI
         jU3BGVXJmjsiTc2vp4JRCLvDHSplFQC2SV1kDMXn9dAzhwCdcggiIhh7/zKvs/j8QGKa
         UB7hch+cLfOr9bSkENOn/EKAW7E3jzZrtjgMp7+gPdk7yo3pBEkEKlSvZESUTKEn4N7E
         FH0zcnLUcm8hFhLOfRebd1zsEeGC+hFMOKkz24mki/1kDY9N0aHEDaDjKV0vFYFW2UZR
         MpOMOLXRgAlHKi/SdAI3W6pmDGXrd/1a/ZVslsieo2okcoxq03q/dn3teKLuy9LXbfnJ
         SJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788514897; x=1789119697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAlCtZvrO7quQeT5Neq3cVBP1CBq7rFsygu26TBie0c=;
        b=V5gna3hiYMtkjefhtNJYeiNqktusSIPKltxIWyfF/dp31gnIqs3xAOz36NyO+7hHpn
         LUm+Uk4ik9Ik4JGviHEfjrnl5PUZQji2fb+hEeQ96UvdnxGx04CRb/vAnzzyPXnc9Co4
         GisBJmSmEb6GXMpnhL9H7/XXWueSSPWRfuQC/yDBQGDRVZXdOXBBoNH5EjF0FfbZvUZi
         sJnNN1PtLFOQrZ/ru5S4j8NosEYlxPdmexwnCevTZ0EIrnr1UkyewORxjiNv8nJpWUy7
         meY9DGMwLN+JJnhSxVxMXW+od/TGyIALld/i2JeygdXFk4ni3+IRBxJdCDEMcl/w7GbR
         fysw==
X-Forwarded-Encrypted: i=1; AKwUvBwRr8Ar4ADAFRm69L7dcudP+IJPC4KJdNj1u0g6VSYS87aAo3rX3VsCuhONakpmdgesFlAAKXGiHW+U9A0=@vger.kernel.org
X-Gm-Message-State: AFuF++kDES/eku0utVzPMnbfH666+ucY1/V/pfAOLDY3RaAbmThCs1df
	QANL1Qlykp3uegV9iCel8vdJ2gssuqE1L0irznlyn5bcWIgTB2kCDj/qDHoVNaZQLKjhyLpHono
	J3ZAH80AoquwllCHt4LW6ovTjGkZqRruGstjpbhoYQ+bHYH4WbMyTElGhodghhSoTn934YXBlZ6
	+V8t9a8X3ipXJdp2oLwPHtcd3DFGQ/RH4Sh46aiSLCQg==
X-Gm-Gg: AYBFou30jjrB3IlWlslEAckxCeMkqhtXmdEB30TV7pAezp8FoCrWbrRh1IekadWNQjb
	pvEoTRxmQKWA+ikaIq6iEuxUEa+hSGpN3bTuv3OIjdWee4AR/B3HRj0NTaMcMQAq/HFRPIEvSIq
	VWzjHbqCMh8fV0xf3tJ8H+8hJWKE9sUc7G3PhXRYtpD2o6xwo8erUsjjy+Tw==
X-Received: by 2002:a05:6a20:4311:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3da39d147ebmr6525012637.9.1788514897297;
        Fri, 04 Sep 2026 02:41:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:4311:b0:3be:b0b3:3962 with SMTP id
 adf61e73a8af0-3da39d147ebmr6524946637.9.1788514896803; Fri, 04 Sep 2026
 02:41:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804213458.3408662-1-gyf161023@gmail.com>
In-Reply-To: <20260804213458.3408662-1-gyf161023@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:41:25 +0200
X-Gm-Features: AcwNN1UvWasE7E98pHGU25bWRYr3p6g2RUecF_Sa-ooQkstSMtiJVdUTxpR1BPw
Message-ID: <CAPx+jO_Ov6r3+9K1ks-WojourapQcDHnxTgDjW1sg-RMPRmnRA@mail.gmail.com>
Subject: Re: [PATCH] memstick: ms_block: destroy io_queue workqueue on removal
To: Yifei Gao <gyf161023@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
        Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9a9252 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=Plh-MFd_Tk850DHwDTYA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: I1hL_e5yMG-qMyF0hhZyi-jCbcoBhSSg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX6HV8SaEuLeGL
 L/vRgmqkbjGEDeyzNkDgX6a6tdWS2fB25acYkPbqa3LSYQNmZib+Z5iQegjrCN/L6yev+ZdOMg5
 uJqlahmpot4YkwiCcBYSlWgJeTnlWMk=
X-Proofpoint-GUID: I1hL_e5yMG-qMyF0hhZyi-jCbcoBhSSg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfXzIpWRtOjyYB0
 dNOVfQr5z/oUZmmqUgEmHsLQ3CU/NHVPQxxi06LkSWqA96kVIWgcYR8jKEi0bQArOHhcqqv1pL2
 KBq6rvQz0n+GKe7KyLzDzVbUxB6EvSzJre695nIuAz3Az9gStPX2GQfPGnkED5CQ+sYE5AVGm4/
 z9q/E9W5j5apkh4HlOx77wo1FYmqXwqcuIGHrugX3IpEnsnLwFSsk6X2a+cCDSPnAxElvdJ/rrU
 cAKlXoDMOE64/FKrPa0RJf/Z8G4bDOmIPAleT9Tl9xeENDllX9xDQbBHj+j3QU+FL8jt26SDrXB
 VJuMxtp1c+QthJabsFallkmQrRJtkXK63UnA+Cg4a0mVpgnrQHoDMa4IMAymBlQb04egu0LP+F0
 WsXAop3Wxo/1OY5uX27gk5wKTxoLl6yHryBQ0l5MSe61K+TyUj8/m4/kDdbeG0TiV2wxwc29o/y
 fHs7chLt8VJs62OtfSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040088

On Tue, Aug 4, 2026 at 11:35=E2=80=AFPM Yifei Gao <gyf161023@gmail.com> wro=
te:
>
> msb_init_disk() creates the per-card ordered workqueue msb->io_queue with
> alloc_ordered_workqueue(). It is torn down with destroy_workqueue() only
> on the init error path; msb_remove() never destroys it. msb_stop() merely
> flushes the queue, and neither msb_data_clear() nor put_disk() free it. A=
s
> a result every card insert/remove cycle leaks the workqueue and its
> kworker, exhausting kernel memory over repeated cycles.
>
> Destroy the workqueue in msb_remove() after the disk has been removed and
> the queue drained.
>
> Fixes: 0ab30494bc4f ("memstick: add support for legacy memorysticks")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Yifei Gao <gyf161023@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/memstick/core/ms_block.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_=
block.c
> index ce33907bfc24..65154e569a9e 100644
> --- a/drivers/memstick/core/ms_block.c
> +++ b/drivers/memstick/core/ms_block.c
> @@ -2204,6 +2204,8 @@ static void msb_remove(struct memstick_dev *card)
>         msb_data_clear(msb);
>         mutex_unlock(&msb_disk_lock);
>
> +       destroy_workqueue(msb->io_queue);
> +
>         put_disk(msb->disk);
>         memstick_set_drvdata(card, NULL);
>  }
> --
> 2.43.0
>
