Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792770372;
	b=l0BeJxyRC8ZcGASe0ll6/ZMh1Y7XZzHh4G6fzEEHG2icQKu9krBfgeTbTJQwi0oyJPUX
	 dwb+xtsSF+BqeF2wd3VKJSjkalLCQPemVSfaaWPsboEvmsyZOtOM8UPaTxwMFA2MQISr2
	 2ZVD6AV436AlGQOdwTJ4n0CHuVu+417nyouYcQ+PVdEb/a4lyxgLDvuaM4GxWGm2jW8WU
	 0NMkAhmy33DflNS5VoSJfdsN5cNQxh5FNj4GIfx6ca0CNNZeNmF+Dkd6TekZQfFjG+6Mo
	 Y0S66qHerY5aJ8NwRvLjhr/8esglCVN5gdeWk5A5EowCOsvkw5F/8CS/ueteV1d20eQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770372;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k/oZy3r8kmHxYtAFoxOlyC7doeahiTYoTHRRZtl3TiY=;
	b=2TqFhgaw669LODVHAhZE1+iJuA5clv44Ja5g5BVXXf4sjhhJEC5MeH2D7tICLptWzMzL
	 5Aytk7Ve8vcyMmg6aW5K4LSiihkuA+o4ML0Wp+ayIPy2SRx3wPPLPdxAqAq+VocEHehTJ
	 9QAFYT+qrMqOQP8m3pizb/+Lro52NEssBbKgLyRZitDUhhdLO2FiTLdV63lQ1UOh+gHTq
	 t1QTjME1D0k4PX0BwncHDWtCfCqhX3zGDb6+eIf7by01FiesgyCKExSZ+AwH8vPedBX9B
	 TIT2kpSbyYZolh4JJ8m2Sh1XkTd+NxZ5M7Hn63l3f3UhEVzVIx5thwAQ4CsH85tKKIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evwdBAOC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WsNwSiDJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1403B606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1403B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evwdBAOC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WsNwSiDJ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6DWD2462572
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/oZy3r8kmHxYtAFoxOlyC7doeahiTYoTHRRZtl3TiY=; b=evwdBAOCvpQwwxFN
	ew1VktCEyBUdmDwDJZmymL2RN2I31pn9KEwh5rPGPzMTrmnvAVHP6kNrUPuZNmzp
	qQYuIA6atgpPESI7tVlDfS/m40nRPIlvta26gviZtTK4Aj8O8VIMqJUIAeRgNuAN
	HmU2YU3kdc9j0tZApI53HTOtUgVu5qudG3feTRst1IMb5N7yEymIXZ1BtKyRwC4d
	Kx1iAY/w6lg+y8D5Vguv6DYpFmTiN5CuVeqmSLjhqI4rSiU91hSAX6nS+A8aLKQ3
	qj5mLb6yDE4Lcj3cwoFiu0AbKSOgOWT5fpAqb0VnZace0f0SKCYzP7QzGb75ao1R
	UhX68g==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtvdmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:46:11 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c7f887ac6bso1650474b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792770370; cv=none;
        d=google.com; s=arc-20260327;
        b=kqe/3SLAqiVkfvaVJcPGehfpz1nqLTPsrneE/Qj58AmEO/GUm1tVYAyLfIyiPOuGmD
         CIXaTPcalMu4abl5gre8mD2YqtuJEYL8/yH/8klylLPt6nn3RnamcqP8yQsEA+F2A7Sy
         V6Xyv9yCpOm16ZUM8FSn+vobni1NwhAbOhQJTo2ntGJRvCx4YV3chBnaErRKjVbLi3jd
         sb8mXizhaqNXlbY/wcJFlx1Q8cew1l8+zvho3y8fWNrl7QdTyWwkGWth8WG8Zqv2LH3G
         EzVRY30vtOIthOM28fawNRuphkPtx2t/EGmvqkmr1wW4n94Ftt7KflVL618NbTa3sltU
         bv4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k/oZy3r8kmHxYtAFoxOlyC7doeahiTYoTHRRZtl3TiY=;
        fh=siDRIrQ180YWD4G/OT9+ZWYpzfoOI0a5fWQHL8fn/qU=;
        b=TIn2MGQ32V5Tq/UBFf4hWRLzUm81Vwwu8jj/q2CIadb2v5rNffog92SxmO+vUYxJGG
         jEjRReqj92tBtG2pEGLc9uz+RCiZPu2aq8+hxW/ftxmco0AUZ3YvMHMduqY7SSRsq0Ld
         dzAKfXaRRB1LZdkHCRfes9KLU+XPn5YP6g2wOUQM160OYYk4OZRdCA4Ft/3DB0ZvVAXu
         2uhL10jDB/614IIxncNeLPx3vLJ0rqrZYtigY70mwno7QheUmRvvkKebjx7PpzeyyzVA
         fR1+HXFmIC5OlIqcp+8AWrm/Q7o4eGlOjKu9wQ6GoV8VSzaLzR5XN2TQ4ItMG+qbZ7xA
         OiyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792770370; x=1793375170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k/oZy3r8kmHxYtAFoxOlyC7doeahiTYoTHRRZtl3TiY=;
        b=WsNwSiDJcSyHxHSjDy1D4vD09OiWpnMB3do/sPIqTr/PmBvqCEu3+E3q3Lf2uHXIC7
         XI3mfeks4v3orUS7lyDzJDjGqmNJSrv6pGa6WhcMl15IPHdSiKHFKx27cbIo0zn7PTGW
         iB5vcv0z+oCgNciDocn3V/1adwWlsA4ZN9bdc/w8F7SwNY55WJGxAdsH5ElVi6RPO/cG
         IhOPc0dgg/hQQhX3r3Lz8QeSlnttg2tTHTmLZ0en9bIXADc1brV47PklyLMBSYXMaihc
         CT524JhAUGrGfW1TAwi74Mr3SFGeEXX3H1cfmV1bLEvwftoraXv2wtO67yuKLFNhZgWE
         E8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792770370; x=1793375170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/oZy3r8kmHxYtAFoxOlyC7doeahiTYoTHRRZtl3TiY=;
        b=PDGBgrvPFhPSqAqPLWMIyRpCwOgGlK6Kb2t3xGbUobzJI0rc14JJnVZMFt1gyD6LaT
         7g1sqpXkvuw9Ypbvn0CngszyyVFfFkIc4W6IvZmIpycPY3V4HyvdsLiST4V/1Iia/kyh
         ITY2is0UkEiJDlPviNBEz1UxGY3tvE7/PxaA5wIsMUJ6hWSoZGoIV8EbtDduX3TU5Me5
         qJTpWpPZ7jxeiq7GSU0rzYCzlIRqVSmttH4Xjbl0VP1lQNwk7rA4r8G0stJNUuzd4Cc4
         w1p12ODdhq4EwaGHeycHTM2ZFb69vkfMpsK5hqdLjKhuoUu0H/VmegAUQp3xna+hfyT4
         tWpg==
X-Forwarded-Encrypted: i=1; AKwUvBzLtfjynzWS3zlnEwMUL+n1az/J6JorACRkq9VILV5RehEF2HywbqvZnB1imVnurHubPIwN8Nwotp7Ndvw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsGqv2SPHFYDYsWB+gT2ts1o+q2R5wkAOCbYLxmfuokLPONyO8
	1OGQ+6V2iweK63wiBximpskIAitD79kYFIuCspqEDO7iYdt5x9LYtzUHUY+KC+Wty0dLtYf7zAu
	aifcUh2fbnR6osLqMaVNxVN3Rr2XmRYwfDg3YoThZA2eRCE1AxRQwLpDePEnlgE/r70C0O+Xw7q
	4VDRiLCT4X4EcsJ9gJPPFDH24KpcM6/5WulSaFu7nAcA==
X-Gm-Gg: AYBFou0pJPKPkmFPQ4I64mFFloBCSMCW7dmxRPVymeRUrAw0RZvT3mIUfIGfW2jd8Kv
	sT8OnrprTy/nY5KIGYL/mrdiDgRYmJK7meehXlyEqJp1iZU/jDnrWbyyAb6WTsAUHrhSkbdk2Oj
	cRYfgHtAG0I0pl+R3RP/HRagPdKLRN0EbtPdLWxAvxmMLvyCiJvNqdEDmI8g9QYqZbok/3A5ASr
	yWjOoDMY04RHuzChrVHtcETeBBLlKe4FntWbQqCNvzHSGZKFHqIElyFyUjqkLX0P/BzoeNaO/U=
X-Received: by 2002:a05:6808:c1a6:b0:4ec:77df:f4b1 with SMTP id 5614622812f47-55be836805dmr1796783b6e.25.1792770370295;
        Fri, 23 Oct 2026 08:46:10 -0700 (PDT)
X-Received: by 2002:a05:6808:c1a6:b0:4ec:77df:f4b1 with SMTP id
 5614622812f47-55be836805dmr1796757b6e.25.1792770369786; Fri, 23 Oct 2026
 08:46:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com> <20261023152857.2859767-2-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261023152857.2859767-2-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:45:56 +0200
X-Gm-Features: AclHuK9Xw89HwOv4R7obEy-u5Yu2BoCinp6XB8olJrV-htK4CS6bpM5IbHuaQqk
Message-ID: <CAFEp6-2tC+uFJSG8xOhQdrhfCqoDuhm6q0rYc6cROoUG_r1vtQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb8143 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=vVGVp6KvjHsgx-TnZO8A:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: uLDf77L4wHd-WiiwdgGTp-7u7GkPcewP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MSBTYWx0ZWRfX4e+wPHTf49s6
 ILZBRl1E0e7TY7KfNYeeHCcB1E4liUEJJWh0Cq03Bcjd56PbHxhm3DIWSkjowmYhn97kpsGbGj0
 7uN5d3AKitT+hfRy1Gaf2zcP/3YsjMCSUJoIkn3MyJWN8cam+F4jZnBlV50ApxGw7mjGMgsJij3
 i7FRmlSppoFPt7mdI99Z1lsRHrshF+xHhbiiOQ5C7HWcV7kK0xYWXv6BMrk4qbQx1h0JTXf0s/p
 0tXkbbL+qmJeEOSJ3aFQXncU1Bzn7shLTfn46R1KXLY4B7Fr+gpOSCd2Cjf447LEGnJocMTB76Z
 aTUak0yh2n+QHXRMfSjy8x1Hq2t07dIZjXIkmkpwTRi5Y6KchO5mokv9Zx+fL1dM/4eAx/N/C/X
 bZy+NBDELnH9uz77tfKr6oeLiPBi9Oh1xWsN5G9ynOfshKYqBBlzwe5SAYA5fmjmJlZjs5FWRI6
 N4kxqy01kp6g4negnBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MSBTYWx0ZWRfX+fnoAQIo4i9x
 GpsyuHHzxgawscoraa88bBknb/yxFccInaw0XwnV2SjMUa2Zx6ns0UWWpRgQ2LVUu98cTgEbfzC
 z+THo+ckTaTRCRgnoYaosWMcpmqMtos=
X-Proofpoint-ORIG-GUID: uLDf77L4wHd-WiiwdgGTp-7u7GkPcewP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230061

On Fri, Oct 23, 2026 at 5:29=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> The VFE fails to power on when the pixel rate exceeds the highest rate
> listed for any of its clocks. The rate tables of the VFE clocks are
> independent and need not have the same number of levels, so a clock
> with a lower top rate than the VFE core clock, such as the SC7280
> camnoc_axi clock, makes the VFE reject pixel rates the core clock
> still supports.
>
> Clamp each clock to its highest listed rate instead, and warn that the
> pixel rate exceeds it when the clock lists more than one rate. Take the
> clamp into account when another line powers on an already running VFE,
> so that a clock running at its highest rate does not reject the
> request.

IMO, this function has become a bit messy. We should split the core
clock selection into a dedicated helper, as it is directly tied to the
pixel rate. The AXI clock scaling/selection should be handled
separately, potentially through the interconnect (ICC) framework (when
available).

Regards,
Loic

>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765..87096095b1eb 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -982,15 +982,13 @@ static int vfe_set_clock_rates(struct vfe_device *v=
fe)
>
>                         camss_add_clock_margin(&min_rate);
>
> -                       for (j =3D 0; j < clock->nfreqs; j++)
> +                       for (j =3D 0; j < clock->nfreqs - 1; j++)
>                                 if (min_rate < clock->freq[j])
>                                         break;
>
> -                       if (j =3D=3D clock->nfreqs) {
> -                               dev_err(dev,
> -                                       "Pixel clock is too high for VFE"=
);
> -                               return -EINVAL;
> -                       }
> +                       if (clock->nfreqs > 1 && min_rate >=3D clock->fre=
q[j])
> +                               dev_warn(dev, "Pixel clock is too high fo=
r VFE clock %s\n",
> +                                        clock->name);
>
>                         /* if sensor pixel clock is not available */
>                         /* set highest possible VFE clock rate */
> @@ -1041,6 +1039,7 @@ static int vfe_check_clock_rates(struct vfe_device =
*vfe)
>                 if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
>                         u64 min_rate =3D 0;
>                         unsigned long rate;
> +                       long max_rate;
>
>                         for (j =3D VFE_LINE_RDI0; j < vfe->res->line_num;=
 j++) {
>                                 u32 tmp;
> @@ -1063,6 +1062,13 @@ static int vfe_check_clock_rates(struct vfe_device=
 *vfe)
>
>                         camss_add_clock_margin(&min_rate);
>
> +                       /* A clock already at its highest rate cannot go =
higher */
> +                       max_rate =3D clk_round_rate(clock->clk, clock->fr=
eq[clock->nfreqs - 1]);
> +                       if (max_rate < 0)
> +                               return max_rate;
> +
> +                       min_rate =3D min_t(u64, min_rate, max_rate);
> +
>                         rate =3D clk_get_rate(clock->clk);
>                         if (rate < min_rate)
>                                 return -EBUSY;
> --
> 2.34.1
>
