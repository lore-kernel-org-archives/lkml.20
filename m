Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632308;
	b=wSts6ZXgLu7LSXqyeXZ1E59Qvqv7GHCNvcO6tqEwvi+hoIO1g5mAPL+/lK0e7Ee69glQ
	 wFRUsAfDHt4iKFy7Z/xqIQauWyGRxAdHSvWpvGD2ZxLW1eaofKv6OVAJTSdTkcEEx8PHF
	 0JVEXS//39QE940q/6BPmy3OBlmG1edMKYCQunl27prN3AWSu/vIWViItixTQdjKP5KE/
	 W6FX0WwM/ioF1ZxjXW+lT6rJkHp30Mu3fHUB37YZNUEY0dcC0/QVmqg9Hr1Q2Vc+vA/Jn
	 +zVwFFhDp8cybBHbYBlR4sDmLLBJKZkWJGqQyq1OUWvEAW1ceq0NiQlw+IN3kFOOvPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9cL6n+zQdSC5QgGSMPNoZjthmbWPaQneBwBTcwN44VQ=;
	b=kEsxWtrZw71ylrilFQp+tzqRgNaA5KQKVGzUdmihSEtXbu0EGpq/puoTfoeURBym/kw8
	 2EaAfohHWr5arPk5qfKLkXi6uVjRBbXdm4ymcmVBSqcObR/tsC7iT5SWL9U523t2riBcM
	 9MEVFSkX1hC/pZb/5JXxv7ROtx86Qiczr/nM9Uff/AI6Ar+8koQqpDpIM0j6WGgpx6wrD
	 XOKGjPSLVollYbkFhooV+6nWdnGnyBHwzxJusrzzaSWE67cz4e6lB6X4/L6Hltk3NQWU5
	 jiMw+B/Wtewgsh5H9PE1Lr68zgdKThCzFiF2m2DakptzFIhdYdDtZyYdJh+zl3nYzug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6dwFuqd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f5tz2SZb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DB76091573
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54DB76091573
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6dwFuqd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f5tz2SZb
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpRQc477106
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9cL6n+zQdSC5QgGSMPNoZjthmbWPaQneBwBTcwN44VQ=; b=M6dwFuqd9d494bUi
	H9y0+N1KdAZwQ74tCIuEUwEMahov437QC9EqU7wTKU/QwdiQ+3Z7TkApbElZEHlG
	PqXN9H81hwsVeqW16djt8c0JxrUJu1RKW9ndMpwhPp+5yB1Ccr8kz9rlKRXG/tS3
	8N5Sc+10GuUx9D9AFBjJdlMqWwzQfCrSpYZn0iYKFUEIiBSV5NLKyCK0hxgGqjpz
	3axscshDeKjYnjTSZdPMUBbhBJqUn8i0k7t06HsdwJjYmFyXoPl43YXPAGeahRVN
	MzeE7I0PV9NVhgJWlOQN2waHEbvDJ7CqB4VcE3KDdoLGfJ/Ol3zFHC91cbg8H3ok
	3MfBFw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph19qwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:11:47 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-843c6807307so4037068a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:11:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632306; cv=none;
        d=google.com; s=arc-20260327;
        b=i6Cmpq6oDlsWtwSmyKM0D4b8usZI6GplEY4asuA2a/ms/G1PhQYAn3RA08RPK+EYYB
         ySsfngYGb2EoBnWkY3PqdwH0Zx/BAMZ8YLqy7S+55jtZi9Pvt7sOqmedG9FsoOChmHRI
         c1KyKr+eIm4Lxo2Z8jMxIzczwE6iSQmCddMLlnEiXZIVjIyRY+JO2SW3B07MYP5TvnsB
         QXzN4xfZOGQFflmf1bKTABLi6BD+PGH0lMhcABR/fFRDAFjdpOtBX2ZBRzxFZp37AmzQ
         3BR792dIGBAulhWaqs5/chh1asnY6G10H0WvBux9VVqZbm2XNxuPz1iWYF5V2GhuVTYu
         Sn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9cL6n+zQdSC5QgGSMPNoZjthmbWPaQneBwBTcwN44VQ=;
        fh=LWAVqYtaWUo01QoC2IC6aJcxgUcYSCMnrFE8xxxu0w4=;
        b=IhQQpIVQzt0sLgRaPqRhsJmhdrR6Osc+QyHLKIes/7GFF5EFalV8wv+/EPoOcEUsFm
         qvHuy1Nh/WJ5xFmqtx0xLCV8NYaZ4zBO1VGe+c8O/qG5HGZ9wKh5FKP1zzWJmZETtYv9
         2I5INp4AYCGAsx60OAc4FWeQbqYMXWT7SuxRpd0V6lZVbp5PDY3Az5MH8OYU3/buxpmk
         BLK53g7R7kuBtsmHl7vIQWYRACfsqTgcCzs4P3L39MCaVNS3zJelOWmw/+SXfwuF4WQC
         7mPDLhQj1lmqH2pily+WE9M0y1TwgJ1Kyp67wsQRazGV1c3HhStPQWFqjxUJvRauwh7R
         HRJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632306; x=1794237106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cL6n+zQdSC5QgGSMPNoZjthmbWPaQneBwBTcwN44VQ=;
        b=f5tz2SZbfZsf5aOnK+6T+MqtX0I589kIhL7nsLxs+QXxVf2bDnjcRCvbEw4KE16D7K
         A+27/6+3BmbnHflQAGyWxTuCqGRGBZl44MRge6rq/iWBF6jPHjN+BPAbGFw1qRbSeHYm
         1/39qwpAPAZp7XDfCMbRG+B9Yzp1IDS8jyJHSXhGLfTyAG+pDE1Tqv3WieceewluPwAq
         ODX54nE2vigoTtrwG5V6EYIj2Q92y2yp2rgmh7agR6GKZrlFHvEI0aQ47XcfoOmc010a
         4jgmlr1LB/nVQ3rEhR9snWtak7dk5xdN5Nu9HkQzvp718Pc5lJaGOTGg1/s+Cq0uBmoq
         Hblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632306; x=1794237106;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cL6n+zQdSC5QgGSMPNoZjthmbWPaQneBwBTcwN44VQ=;
        b=TRhNFKevqecR3xMZh+DIwUyl1ETLF9p+BhxSH+kIrKVvJvctVW2DL+hvqnqPSqzcqz
         j3Q1uReU3gwSnVJ3nud/5iiv6iCkRRxp06CWbeB/TQ6lUHvH0AmQDeuxOXp6rn9g9JZB
         +kbPnAw3J55RcHgwVTSbn2wPdw1naP5ve+KMacbzPIQOMkQijKvTlX3MHCJ6KvgxGPp+
         sPi2y0RGsKFXAFe4Ql3iBPvH/nSwH9f1EQKX4clodn20z2ic/do6HUJjv7porZXCy6FO
         8qbgvODAE9N23IvU/lVmOQE4KPlXdIE+WvLvNWrod544xyiG7dXWMQzoaZc1Z6fCM/KL
         sBEw==
X-Forwarded-Encrypted: i=1; AKwUvBwaBAgz9zXUjLJZhAe91FZNy5bHO6rLJjQ6m+MSF27fAxzlCM3KHLyerFIV1DlzJs3xHBgfpNY5VmJ6u1g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHdcI+jlJLEz3+dN0r7/xDgVAu6C+4tlFUc/fR+I525ybn4xxq
	kgo8zhEb6fD6ZMUFBU345Cw+4SlYU0GlF7qjsrfOAv0MPz86dsD6ca7DDTgsWLbKh+2bl4mSMwq
	jA8Pcrcp7m6QUkcqInHrzJoYcq3B3IptPSqc0FdZRx405cqUQGx4J78ps/pIHmOr0D4VXcwgQ9R
	7bFXf6xE2zSiM7ZCz0dD+6Zqnn9wTKtDowGwTSYfvqzVH8EUwsXhw8eSo=
X-Gm-Gg: AYBFou26+vdzDs/idSnk6iBsiGcGUpqHwog8nMifeNby05vHw5vIN4NTkbIhWvbfBxQ
	hFR3LEtRuiiFvwcRRl9Qwcq/AeoBt1gWMUt44c6kLrxibyd+FmzPBAPQXqZY6bHOojI2fdBiScP
	MS8tKMRL8d7InLzONQ9rL+1WOW/Mi0uMiAtuVfMVm43xa/JBDKWgn/2rxHdOWVNEPz6X694k7VO
	VRX+Li1wBZE7jKHnoGoTLo1Q7oCTy2Yo1ZALPeTK7AZTDqzB9gkNodxA7pQ2Zgf5kte7XUCO2s=
X-Received: by 2002:a05:6808:2218:b0:52b:7641:33a6 with SMTP id 5614622812f47-5640deea502mr6752284b6e.14.1793632306548;
        Mon, 02 Nov 2026 07:11:46 -0800 (PST)
X-Received: by 2002:a05:6808:2218:b0:52b:7641:33a6 with SMTP id
 5614622812f47-5640deea502mr6752253b6e.14.1793632306115; Mon, 02 Nov 2026
 07:11:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org> <20261102-v4l2-frame-sync-v2-5-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-5-25cbed7a772f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:11:33 +0100
X-Gm-Features: AclHuK9h2JSkbUMAvyoRdkyclLVmAHb1v_zmAVf8DqDK0h8jHaRxmYbby2gpM9c
Message-ID: <CAFEp6-1ojA_ceOvaJtvc6Ze5DKPJtbX0mYxMcEj6W9JNb33gXA@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] media: qcom: camss: csid-680: Enable RDI SOF tracking
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: jKE41AhPzaGZS1pJpd01epOmfBpzSNWn
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae8a833 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Lk1wFp84Q21arWboEzQA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jKE41AhPzaGZS1pJpd01epOmfBpzSNWn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX0FcF1IKo951G
 JyRTSoi9bBSwlSTQ4t+FkFoMiVhN3x9asimoFSUCMpBnInnvzFzRk9mraYdx5+pi9qCirhiS6RT
 vRajgRTcUKP0JwKX6qE2Ndukt71q1IS0OG3qjpOybT84UovIbmcBW2tftNm6GzVvi+CZI9vWq2y
 8bmSi1ZGZodWcS3ofKr9Gn6N/iEUQvewYD7jAkEg4tcS22ve/AeBP9At547r66ZY5h/4YctYzy/
 +5I3UhB27Ideh3R370CiDwngZSwjuWTF/oKS+o+WUHuLlew+2U48Hhvyg1baOKFd5pDOiREg/rK
 2zDVeaYqiDGFxJEyGhXfScS4hcXsXaFGJq0VcvefBpMLWtcnpuLUlyG5Y3XmBWfYSDFulVgyY4M
 AIByA4K9Jdr2BJvdRXH4qO5vqcBrab1C/6F+Gya+33H64lewBLl9eL9y/chPcTnwfm/UlJe4vbk
 fn2BXlL4Um9h4+nskaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX741LDEKOMyVA
 6rwJxVpwyJmYaiCjsjjoirNFM+OcMAWsN5iRR1svRhBfBA4Sl9/FYY4/fteWf3TgjN+7NFVyJk5
 B/X0nj6su3RRTSUCoSGB8flkCLuAp2s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020060

On Mon, Nov 2, 2026 at 2:57=E2=80=AFPM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Similarly to the sm8650 we can quite easily switch on V4L2_EVENT_FRAME_SY=
NC
> for x1e/x2e which uses csid-680.
>
> Do so now.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csid-680.c | 18 ++++++++++++++++=
++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers=
/media/platform/qcom/camss/camss-csid-680.c
> index 345a67c8fb947..452640e72f6d5 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -296,6 +296,20 @@ static void __csid_configure_rdi_stream(struct csid_=
device *csid, u8 enable, u8
>         writel(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
> +static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable=
, u8 rdi)
> +{
> +       u32 val;
> +
> +       val =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
> +
> +       if (enable)
> +               val |=3D CSID_CSI2_RDIN_INFO_INPUT_SOF;
> +       else
> +               val &=3D ~CSID_CSI2_RDIN_INFO_INPUT_SOF;
> +
> +       writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
> +}
> +
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
>  {
>         int i;
> @@ -307,6 +321,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>                 if (csid->phy.en_vc & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
> +                       __csid_configure_rdi_irq(csid, enable, i);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>         }
> @@ -395,6 +410,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
>                 if (val)
>                         writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR=
(i));
>
> +               if (val & CSID_CSI2_RDIN_INFO_INPUT_SOF)
> +                       csid_sof_event(csid, i);
> +
>                 if (val & CSID_CSI2_RDIN_RUP_DONE)
>                         csid_rup_complete(csid, i);
>
>
> --
> 2.56.0
>
