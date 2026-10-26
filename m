Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793006949;
	b=NIAAMgzVu/Ib6GuGEmoQYijOmFOnyscfnDYx47ReAP+AFQxTZtwYqXqAmo6AXvNIiIEK
	 rJ0PdEedbtR0g6r30J2UK6IKMUJs+kK+u+QdkVQh0577eLhBqhz/xyHTDUfbitjQjMBoW
	 Jyle0KZ857xWQcjVk5UQBG7ThMcfG2vFDuoyay6OLPL+hyOajUwOCe8j5pfD5YaosC4q9
	 1T3CuAuOfMmwqgIUH9xc6AJCwsFOEmMK42rlK1zlZq9Z9KQG8Mdi9Im23T/LTLvULTXao
	 V+RbzhKvKlx+3HRU3tEpjL3fdyFkZ7Jb+9O3v/FmYnP70IiAn3mu9rUInHO0ZhYsSqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7jTJ5mGKgF+XLWB7Pust3PZpn3wcVoEPv+yh/iFoGJA=;
	b=JYtfb5jitch8bGd9A0aKxUVXy1B5CNUaiPxzPeyxnfjVPpARZDa5Vxgo6VsdWyWtn2sO
	 l4+RkeOEaXLe5oKJQUKhyi4l1g3weSfg92iUuMfj0SlnaHd15lVhrlVrs3m6DzxQkn3dX
	 GNecxDLdn0iyUuQ89ScbudNvF5d+1qb8nHvUlGHdBNPZZ0BA0wVSloi48n7AXEmKRHeEn
	 IAr8yPzfZvOWv9Y78U2Bmnsm+I5BBS30Er1RHk6kSTIUdQaeWcfuXl0ei/UcuOG8QVjh3
	 WuesC24EcMl4cjD1tG4BfwbUP6LVhoaZGaqbb7yRl1NzEgrkOTxwRmez5+WqOtqeonw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pp3hQZtO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JIT5cQOh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A049D606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A049D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pp3hQZtO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JIT5cQOh
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4avou2727104
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7jTJ5mGKgF+XLWB7Pust3PZpn3wcVoEPv+yh/iFoGJA=; b=Pp3hQZtOo5ZhG4VD
	Eb3Xb8eJwMvxCRPtMHEJpyXTnakxTLarKD+/+Z2Cb+wXYQFrJtfP4KVql1/ywfKL
	jLcoEsfzDgfZhD1OV/fnd+cpXae9vcUEgLQgPyTNnxVMZ7cNVYGFwal0RGh24QWY
	0AnA2YKyLbQhybhWWhSJ3EyNcrLOXpKd8a4NFVte1MPipqH+YfY1143XFtq07ZdG
	aJh4SFdIfy5kB6gAaSMYpGREuLDqQbF6phfALiVerB3Fiyyhww1Ke1rMK+SkJkYE
	joAluke0XrY8kN5yk2QP42xJbVqBOgnvuBn4FQejM2fIn03rpooN65uaTX32Kqe6
	I9J/EQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6nu8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:29:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e49a1d3b1so345428985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793006947; cv=none;
        d=google.com; s=arc-20260327;
        b=lmWqJB1RZ2pR78R2CaYgz2AJow2sK3K+C5v7t/oiJHogTpQrFdp7MTOIOQemePqTCo
         1bEOqEJ62/i88AHSXBTeq3BCcB0O8QmYEK9sDhj/CadPu/3u0yywH2+8/SzkoBUtFxrv
         NMZ2/nHIdtEXEkzU3xXHoJj1QAdEa6wfBYTZ80rQgVc0PmPy8AnFomUUhqJulsKNrbdX
         8dn6hbVRG7B+1jT8sXlvhijpCrBcPbWhTG6Ilg+Nf54HgpHIEiKQjBz3pbMDXHMkGrM3
         3ZxgM/3cLHUcFZGKQa3f5+hG7oOvK/Q+KIt+IXaG+eciRYmVX1E5WC165oeRIRL+bxdc
         mrMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7jTJ5mGKgF+XLWB7Pust3PZpn3wcVoEPv+yh/iFoGJA=;
        fh=DrK4lSHGLqTF4pnVQSDnVaFVJDXj5Wa4dsr7PT0DVIc=;
        b=NpBDelml3uK4Tyga0dDTCezJdOax99jNn2AFX+HUUYIggnmWONGy6LX4Vvt2Fy7C0Z
         jwUFNqZ2Vv6pQiTJr/aXM/exwwivX3JAkNSBIQpwzViOvG/LW4kdec+cF1EFTZ26nrLg
         g8hYCgQ5ofVnbU5M6Oq4xLZVlGRF4wmmhzr/NLdfjen5vhgAfpM+OhDKn8i0xhwJhXYo
         59wybkWL6CoVbF83kOR8xJ+HfwbbRHTvB2KuGYNkHwssnRXMBJk/PAF0jSKt+gUdM30a
         KgWj9uJrP6Ve5NYBpjYRMJ/2t4TWPk8RZ95Trh1u9Ua9yKNLGZtG7RUG8B1K0f6PJ3zq
         Ksew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006947; x=1793611747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7jTJ5mGKgF+XLWB7Pust3PZpn3wcVoEPv+yh/iFoGJA=;
        b=JIT5cQOhNkfyAyNeXnhv1F3WhTXEzH8KlnKTM/1VQmPtb+e9L/ymd2ijEUD8soK/86
         03j1VfyVDqMybJpFc+UDgQTg0/yDRimIfp33hH/8t7nUtZoyBVnhMY0cEQtUUp22nyqK
         aM9EGGVZRCbRdebp5OULMswJtv6E7rNf0uyxiYeDCTil6bYN9T/0e30lV0PfkpVT8qjA
         y/DQNlG45uKKc+gjmJjZrRhqfjSb+X2IBKuYVMgAd3jm6h+70QyE23d6hUe7XTOuD/cq
         uGWlIX/vVVSN5JKssiqLAIlwaDAilOl/d2AUz5o7ir54FCsJnCcjS/APgrM5ezfQqMhU
         xUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006947; x=1793611747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jTJ5mGKgF+XLWB7Pust3PZpn3wcVoEPv+yh/iFoGJA=;
        b=U8xeWtowPY9X78zCeIi4CBl/xcXD9N3hsyhL9ETpwUV4YaNPQXGww/X+zd7sHqQSLY
         ffwHK8msWljjXgDB8fGGr3UpSlaMNPVxHyggGkE31mw20FtWdsbHg6ZJtMfbqMLVz1fZ
         vdUzYu0QsS4kOWvoWk3VAMZ9MDSqUwO44Sx0bqX1cTMX1c3hlnjA5AwwZelF0xa5wv1A
         YR0A1ylFbHuoVgpf/c5b4I7MQN0zAJWIw3k6Rv1/ikAEMIjhfS1h5ruZ8kA/DutKMBl7
         T/W/j8WQY3j5w7pNkygUKFVg61rDeJUdv6ZUmWWLtWod2Nd+RcBZ1/Iv/Jn6W6YyM0B0
         wEHA==
X-Forwarded-Encrypted: i=1; AKwUvBxMdKkpFduxTfDGMSQqierH8t5gH8xxqg8hmaUv2brfznmOMI27jYrMwX5CmCpW1/hv4O8yUXeYC5z4yjE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwtUiCKOg0Cu1f2w7AB4BFG6Jf3OsFQbf5J20GFLLmHEC0NixV
	1nYNM2YJQl+J6WxAnOCqFS/tC75bNzkqiBuMHhH5c6gr/Ky0YrLBN3B7wFiKeUvRBzYmcV8pcOk
	TojMTbXUh8u1trBque7a31wkVB+qnmRXnM9XuwoitCjNS9iusN6LbnxM4JQvd2XWKXaF3AJiTYm
	fNjG84tOYKtxErvMkkiXvvtqz1dBUOV1493FM34LAzTw==
X-Gm-Gg: AYBFou0bUSh0LHYrFjSmi/4MWqHL+06li71jY2pHkUDfIYh+5tHSlHawNArK8rX1t/o
	tS+FX0QVrs+lqL7oSxDi0RRNQuvlSL7NHQg2sKYzIc+b5vsQZUWvU51qhwQIQXu87VlVQWUjaKu
	evkkio1oVV4qY/tZEAj3yOId3ulgx8uBOUoTDsC4ATXJsrO0weDkzteNcXkHhhE/bqmPtkPSRmH
	RbP0AnH1hXZDLzBZzSDKXFaRGSzQtLpSXLgByaWGUvTJzV3iNQQZK7WNWCrTj1z4+DwIltGT2JD
X-Received: by 2002:a05:620a:6314:10b0:940:f2d9:5f43 with SMTP id af79cd13be357-940f2d96196mr581359185a.6.1793006946720;
        Mon, 26 Oct 2026 02:29:06 -0700 (PDT)
X-Received: by 2002:a05:620a:6314:10b0:940:f2d9:5f43 with SMTP id
 af79cd13be357-940f2d96196mr581357485a.6.1793006946328; Mon, 26 Oct 2026
 02:29:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com> <20261024094027.3095475-3-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261024094027.3095475-3-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:28:55 +0100
X-Gm-Features: AclHuK-H3z-Kwbr7ajvKaP987banPeBc1O1PjrjsKicOkU5pIukO3QkXQMIr7Fo
Message-ID: <CAFEp6-0tby5B7hUTEyvkWVnNsOLXnEomTDt4d6xgGtF_3X2hsQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] media: qcom: camss: clamp VFE clock rates to the
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
X-Proofpoint-ORIG-GUID: HyTPLrjZMOnutwcTnBl7L1mI7qNOJnXn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfXxE+LqSNdI4V/
 F+fDgDLiElCOkvg4bEC5h8oAGmLXyFekqox8YVZI7e6StJ9mGE3B8TZVdKYsWctyYcVhSccZg+v
 HFdteh5PoYLRoJ0o0ZuoG91jy57DaLw=
X-Proofpoint-GUID: HyTPLrjZMOnutwcTnBl7L1mI7qNOJnXn
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adf1d63 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=vVGVp6KvjHsgx-TnZO8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfXxBlvzqbpBbsR
 2U+HU/mdK5Cd0v6PbglBLC/xHJjGpQzb7mE3MWVbxcpbuDsVebPWsWLJGofnqxIaNjsmN6SojlA
 wR003IWePVAUfl6+OKqpQdxik2Id/lEUivoPMGSKwTdAr0NMYwMhp9KqLGJ/vFMiPFqUnnr9e5u
 4lMzYkZIq1XKAtFE0jlNorURmGmEw5tZJSWLnTn05JsHgN7fdmk4TsP0szvH0VtRTdA0DZrTwWF
 cS9LwTfsMX5RS2PeIGZILEaHcihzg4dpU97bvk0esQ/62RuEyOJPhalSFYZw/Jb7C15PcaySob+
 VCnmFgBn+DLEM5vV49fbZ1EAiH9XpFqwgLTcenbVi6T//lmYn4e3SCpvfRl986qxBgp6RL9kDTI
 kOZQvTX2mG5tP+peovckk7JXNUKKWArU2dMdPchnPTfGwHwy+vKUy4QATpSHTDm4MFBdEghf4Zr
 rVI7d+bPhEiNXqdPEsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260037

On Sat, Oct 24, 2026 at 11:40=E2=80=AFAM Atanas Filipov
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
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 59be37f83df3..359b5942df89 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -996,15 +996,13 @@ static int vfe_set_clock_rates(struct vfe_device *v=
fe)
>                 if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
>                         long rate;
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

But are we still comparing the pixel rate against potentially
non-pixel clocks here, such as AXI?

>
>                         /* if sensor pixel clock is not available */
>                         /* set highest possible VFE clock rate */
> @@ -1046,9 +1044,15 @@ static int vfe_check_clock_rates(struct vfe_device=
 *vfe)
>
>                 if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
>                         unsigned long rate;
> +                       long max_rate;
> +
> +                       /* A clock already at its highest rate cannot go =
higher */
> +                       max_rate =3D clk_round_rate(clock->clk, clock->fr=
eq[clock->nfreqs - 1]);
> +                       if (max_rate < 0)
> +                               return max_rate;
>
>                         rate =3D clk_get_rate(clock->clk);
> -                       if (rate < min_rate)
> +                       if (rate < min_t(u64, min_rate, max_rate))
>                                 return -EBUSY;
>                 }
>         }
> --
> 2.34.1
>
