Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793198539;
	b=QMvESOjMQJ7H+drijx4wyg/XyRLwZyaspm0SzbZGhdDLdbt5UsaPE6ntMblR5yJbe2oA
	 fYls0GaG68vvYKOUpjgsyOrxLZNCk1HWLHlxMcUYEb2KcaPJzCh6JMWQ/PBW8nS8n0XOp
	 Tt7uJyI89HRiIiyTraPJ6tJLYkbLq6gWV1ykpd9OVhfiOikVrFiWdWlnfBbpOKR6IQzit
	 Uxpvjs820H+JngbO508RWh6GFtu2k/UHe/slcf4/ST/6BjqAe7vMukFRodjaOBW84oDdZ
	 dXzbMB5Fs0kSjAAniIFdMaI1DzNfYmDLZ1N9ZTbH9U6YH/3PVzvlfsYNVTIuYYW6Uqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198539;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oy8t8dL+tbzHFQVjWnPDle/FUH/VrtTjk8J+VaYpPWI=;
	b=bB77XYcivyQyhMHprJBOoSOOfQkFecEsaBtot2/KZw54XdOKx3lm3JYaROt8YFU0Oa/I
	 64U+zZWU2mzSjrePVdROPw3wg93Jj+dx1378PaHwvFQQ1Z46BHe+nxHbQP4TGuF6pC3np
	 loWIXGgZKCu/hmcVVYjoiwRX5iSJ3+Wrdq4jzFod4nacKoF/b4xcq+xKw+ngUphkZVlli
	 j7tlIILhcc5Pv7jNtMzXkTi0XR2TRxBJkwPyq5gxggGwDmQfG9s6uCC2SnW9Dlq9XtDx3
	 EZ+VvcWngB3WMFplc+koZ+/nI6sKP5U3dIukoaFX/AATeuiq96yw1JcVdTYWHazdWlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YeBiKAa9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kSmXJE+A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAEF606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBAEF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YeBiKAa9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kSmXJE+A
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdvsv1011834
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oy8t8dL+tbzHFQVjWnPDle/FUH/VrtTjk8J+VaYpPWI=; b=YeBiKAa9b6ibGVMP
	zD5FaH6RyPG7SX1r4bhwx1061cWgWl6ClVcoFdSTTs7KWxpVr3VaCnpwT4UsIqCu
	/lJ5NOcTyIUqyUwesIv3AP4VMSBVSCxJdK6sqz6EVLogqhvDtla+Z/110Lq42lMC
	Hts76iCn44k0Z/Fm+YzrlDP2j83NvD8JXgCmfquVPiURd7BTnYhnCllIE5Zw4VbR
	FQFK6LKpek3bHMbSF6fDHCtg0kcT4LcnE1x4BrCkJ0eEiqj2CPLddnpE+veM6QgW
	d/HbSgzhO7DqMT9ncs/BfXzCD2594ZCuRSyD7ybqyfkSTyW9COHdAL3GTqcznY/A
	/6h4yw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehgxj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:42:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ecdc701a2so122002585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793198537; cv=none;
        d=google.com; s=arc-20260327;
        b=qNLe3WpaCTHkzxzvGjvBkyByL4HVIcudoHsu30ScR/qjvZyedN9Gb6HLBDeqR0d8BB
         /bDxkjlzdGj6zIfCviuLmmXHgxynmBXzfKgyKgiZAvXiKvLZTvhGiRrWt+NP8AVi2x95
         g/1BqfWmg034lkoTP8ucSFnY2jDOr7XEPXMPBCcb+AeCC9aFhDoajfRMddAI5wW5AuVG
         synrX2FdblKuK+tg3naZGLbciuN0L3+nrEz+9grJjYxVw9Ee4ZKoRCJ1SMcHClUfS9Zm
         Iu/vBheJgdYD1dJ5Q8r1vrYKQAlO/W/PjAGZPwIyI811dcpRx+6FU6tihZUQHAv4QLRv
         RMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oy8t8dL+tbzHFQVjWnPDle/FUH/VrtTjk8J+VaYpPWI=;
        fh=Pd3f5+443/j0gOYNzUmhwtWEnAn0e5sPHHyu+FD5r18=;
        b=Q9+tlzmR4lvOm6CBSQ3D2dtmvJIQKwc8h3U46p3dOEOLOf9oOCux3j0ZpN+wczgACN
         Lrn13yfYfTEq8w8ZLbWLj3sFrAVW7v40QmC0D/fUEIrVxMehF1dBoSn2VsC03sh7kk2q
         1VYweb1rYajl0y6T0fUorZidRjfy0TkYCe9wlS6A0Rmjpm7HVO3MOqBa2e7r4HzppoE8
         skUdYcKP+Y2QjD6nUco91C/ShGo6fmsTrszcXPdomOlBlu1eMDh8D8uUxomLjIC9KW2Y
         IIIaK19h4hkDJnR4FABO6HR7Mw3ijpi8evgGTtP6+/seZDQJyBV90x0ZJF2Jkw3+OSVK
         aC4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198537; x=1793803337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oy8t8dL+tbzHFQVjWnPDle/FUH/VrtTjk8J+VaYpPWI=;
        b=kSmXJE+ARjY25lCSDEnngGr23+BUgERkgr5I837H/7eIkW1CAF12nqlVVEnLT6kBCa
         08bejCS/tdGpjezeDQPzrEeiCkf5ulimWqlmxZ08bjl887W1p7X6nrwLzKaBUqF7soou
         yMDvzlL1yX8IjCHntXcFQsIzD6rlNr7/AOKca3TxuQsn1bITJ9xr8/b23mwaC9PFGwBv
         KebP0aEPB96O+f2GIPxuyQw0olNuSkmAZV/CYwW7YBVdKEl35q6hwqfUN7V2oa/4m6S9
         F6kijy8PxzKNoTds6wjFg+usPUNYktUxJ7/X8KJNxImUs1+F4etNLw8YsuRID1ZDaJND
         vBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198537; x=1793803337;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oy8t8dL+tbzHFQVjWnPDle/FUH/VrtTjk8J+VaYpPWI=;
        b=ZktjTVx2nh7rRMGZihSnL3skSxSwughMMYLtiVH9MtBfedi6f6IYoViw6d1MoVeGrY
         qlnCqvXEZbhwb7Xj87Q5dZsujoJ/STZMbm8PBHbgbGkSvbLjteuNntvD1pJCtU1qeyGB
         IEbRDFeBfc9WuOpUM7k05+A1gMEyjEQR+0n8684Zh5cv70mOnWOWoAGmPF3Pz9V687GK
         y6J6UXMvs6PU50rajtDlRazKBTMOiTczs0cMPVBUNnqX6jIFDsvDuwjBZZWs1ec+cS48
         MzvqjaY17ljK9kVE5CFyG6EJjMHHzeCHpQRo7SQvr6+v3jdkqsHAV46S/LVvhdH7xiJV
         7EUg==
X-Forwarded-Encrypted: i=1; AKwUvBzprxbM9Py3J7vEFEylNqRSo5weh1t36QB3KEF9NKCaBki2JMs0l3jCSEIi2H1Jt5dNraIum7ZQMXtlw7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAxo7o36+2I0gRPIgZ06apyLJ9Y5Rn4Q6OxvuNwBX/lRwPv+8S
	tMyADhOrxMU0cykzFHuU7aIBQdV27MW8Uh0JqS4I21j+aRlqSuHBhKN37p8Ie4923pyFAr+swCk
	64VYuV2O7fV7Wgx2hhwRmrvY0RYOomxKkVI86BeEwRHPXOm9jXfnwXNvNIHB/cOz0WxG62QlZx+
	/9gze5vFE+cQMJEK3vvLNYW5WYA/QsoKMK1ftWg01q5g==
X-Gm-Gg: AYBFou379ndi2LL7BRZZ2peAhnynqRv9nA17a+rTWfqvQmy78D5z7BqEbCmaPnXPkRo
	ZVHS3FzDr8losjH7kW2nlhpgpVghoITJJ5QkPzJomgPRtg9o9fR/Zm1kPsf2cJEd1ZDV1HIO47j
	ml96LDYxj4DwS++90VZ2FvZTAHdqXlNNcUV7C4jLMGUOvcVJl1ppfbIIyt+MMe4IFUOA7IrWNHf
	gzPLpZfnMf4MW2MrJfW+qd6Sc32V5wFTk7fRHNZdxaB0gXUxRgr0uB8IABkD6piW60ZiHRwS5w=
X-Received: by 2002:a05:620a:288e:b0:93f:167e:d98d with SMTP id af79cd13be357-94408ca8f87mr354367685a.43.1793198536863;
        Wed, 28 Oct 2026 07:42:16 -0700 (PDT)
X-Received: by 2002:a05:620a:288e:b0:93f:167e:d98d with SMTP id
 af79cd13be357-94408ca8f87mr354362185a.43.1793198536298; Wed, 28 Oct 2026
 07:42:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com> <20261028132403.3505037-5-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261028132403.3505037-5-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:42:05 +0100
X-Gm-Features: AclHuK_gLvTlNwq23MTxsJpLq4bAZNAxAi8aAxw_j7mRJtSmK53xdtsDAZuh6no
Message-ID: <CAFEp6-2SJOS6tdr3cD09gCzDLqnEzX-RUSeDMxrk0_DgRi45ow@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] media: qcom: camss: share VFE clock sources by the
 highest rate
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX/KApjMt08wFq
 V4XdIhN2DBWEjMo28xTH0jBYiZPhixDB37wWfELlEtCK4LQjnBR4LED4/lghgf6gf9WPiFK4t0R
 7NtoYK8bfCnrIp1erM6lrx8qZJky+r/AgPDA2QreDqK7wDNI+pLPaScoTqaQ4e6Dvpzh5aF2Fvr
 2OWXa+WROuOZ4P3x0Cuiz1/8+HWXxAHxNLRwKehVvc8rMXzpG2qX3YNQKlIrr3qeS5G3KnkaCeM
 13Vo9xauIvLy51Zb1YpLkhCqy1kFMFEAJhokA3oItQi1K6ghvDKiudSDF4VIOnJQcyKBgcE8mRc
 LeQ+wAXg+cHneEbJ7QndQpdVSUBxWFMrBY826WX1d3KxdfZ8G89dTSiwvTyZ5rlWF5hM9UskebR
 IH7mOIaYVIbhXAVHrox3ACxDDwEZ63twp6tN7UOUtWqC6skzObOyR7rodMO1tp5wS84cBJTpfQ1
 STYJmO6THqznAFUwIcA==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae209c9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=9_-UM4KCnb9qNoQB4c8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: QIntlcdHY68UD0blG3-OSuyZfydRCrju
X-Proofpoint-GUID: QIntlcdHY68UD0blG3-OSuyZfydRCrju
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX3qo9v10/b+P3
 TxTvTeWOnsIuW4opr+yJAkEIG3g9aGHvtBDl+pXynlZoNiLdvcFSX2qEsh4oSGTo64Tm9xWB/3h
 S1kKz+B1pVgyk4zb/WcCIum1Ju/RR0Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

On Wed, Oct 28, 2026 at 2:24=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> Clocks of different VFEs can be fed by one clock source, and each VFE
> sets such a source to the rate it needs. A VFE started later at a lower
> rate then lowers the source under a VFE that is still running.
>
> For example, on SM8250 the two VFE Lite share one core clock source,
> which the VFE sets to 400 or 480 MHz from the pixel rate. With VFE Lite
> 0 streaming the CSID test pattern at 480 MHz, starting an imx577 stream
> on VFE Lite 1 sets the shared source to 400 MHz under the running VFE
> Lite 0.
>
> Request the VFE clock rates as minimums with clk_set_rate_range(), so
> that a shared clock runs at the highest minimum of its running VFEs.
> On power off the VFE drops its minimum and sets the clock to its lowest
> listed rate within the remaining minimums.
>
> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v4:
> - Use clk_set_rate_range() on all SoCs, drop the vfe_clock_ranges flag
>   (Loic Poulain, Bryan O'Donoghue)
> - Add Suggested-by (Bryan O'Donoghue)
>
>  drivers/media/platform/qcom/camss/camss-vfe.c | 39 +++++++++++++++++--
>  1 file changed, 35 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index bcc2c1929af1..46674bc30e6a 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1037,7 +1037,7 @@ static int vfe_set_clock_rates(struct vfe_device *v=
fe)
>                                 return -EINVAL;
>                         }
>
> -                       ret =3D clk_set_rate(clock->clk, rate);
> +                       ret =3D clk_set_rate_range(clock->clk, clock->fre=
q[j], ULONG_MAX);
>                         if (ret < 0) {
>                                 dev_err(dev, "clk set rate failed: %d\n",=
 ret);
>                                 return ret;
> @@ -1088,6 +1088,34 @@ static int vfe_check_clock_rates(struct vfe_device=
 *vfe)
>         return 0;
>  }
>
> +/*
> + * vfe_release_clock_rates - Release the minimum clock rates of VFE modu=
le
> + * @vfe: VFE device
> + *
> + * Drop the minimum rate requested by the VFE from each of its clocks an=
d set
> + * the clock to its lowest level, or to the highest minimum rate still
> + * requested by the other users of the clock.
> + */
> +static void vfe_release_clock_rates(struct vfe_device *vfe)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < vfe->nclocks; i++) {
> +               struct camss_clock *clock =3D &vfe->clock[i];
> +               long rate;
> +
> +               if (!vfe_match_clock_names(vfe, clock) || !vfe_check_cloc=
k_levels(clock))
> +                       continue;
> +
> +               clk_drop_range(clock->clk);
> +
> +               /* Round first, so that the rate respects the other users=
' ranges */
> +               rate =3D clk_round_rate(clock->clk, clock->freq[0]);
> +               if (rate > 0)
> +                       clk_set_rate(clock->clk, rate);
> +       }
> +}
> +
>  /*
>   * vfe_get - Power up and reset VFE module
>   * @vfe: VFE Device
> @@ -1111,12 +1139,12 @@ int vfe_get(struct vfe_device *vfe)
>
>                 ret =3D vfe_set_clock_rates(vfe);
>                 if (ret < 0)
> -                       goto error_pm_runtime_get;
> +                       goto error_release_rates;
>
>                 ret =3D camss_enable_clocks(vfe->nclocks, vfe->clock,
>                                           vfe->camss->dev);
>                 if (ret < 0)
> -                       goto error_pm_runtime_get;
> +                       goto error_release_rates;
>
>                 ret =3D vfe_reset(vfe);
>                 if (ret < 0)
> @@ -1141,7 +1169,9 @@ int vfe_get(struct vfe_device *vfe)
>  error_reset:
>         camss_disable_clocks(vfe->nclocks, vfe->clock);
>
> -error_pm_runtime_get:
> +error_release_rates:
> +       vfe_release_clock_rates(vfe);
> +
>         pm_runtime_put_sync(vfe->camss->dev);
>  error_domain_off:
>         vfe->res->hw_ops->pm_domain_off(vfe);
> @@ -1169,6 +1199,7 @@ void vfe_put(struct vfe_device *vfe)
>                         vfe->res->hw_ops->vfe_halt(vfe);
>                 }
>                 camss_disable_clocks(vfe->nclocks, vfe->clock);
> +               vfe_release_clock_rates(vfe);
>                 pm_runtime_put_sync(vfe->camss->dev);
>                 vfe->res->hw_ops->pm_domain_off(vfe);
>         }
> --
> 2.34.1
>
