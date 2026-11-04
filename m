Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793808705;
	b=kUZd/y95aXw2pNAhM7aXWvgypdU6SWBO1uMlnKJsucTJnFKce3ILGoghHk/EQiA6Bpj8
	 VKZlAo5rkI8M/h6+hE3yuZkPzWC7lzSiA+xW1wUBuPO8O+8tUiNRPyKGFPz+P7w8bntlp
	 h4Kd/MkARlrJKqb+JsHGqINUAeSINkPqyAjUBiGVTgjnXrMW6deoSKp7slUVYwTIwexZe
	 LbnliISGuIBeOcwkeuCobH7gNKwOyFnNErIK2nNWI+vJRphOSMbLzAGD77Srp7QxKcHQW
	 Ju/gm8W5yRsLFJ+8OyAzcerL6gluEFTcpVmY9Q0T+IS27G3a48Si98CyKYgh1NQdLPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808705;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=;
	b=YnRNzmho7HuLz3psrLJntsLmdoff1AUmUiflWluJlh/BrvpmGDoLZennTfjGPqinBQbN
	 FTPO2SaGaGLIfWgdQnt1Ofq9XWrZARWpfR8BJmFeHFxXxqkeMagfJ1gEy+PdYekwRpVUF
	 9KOAoGM/gvb+9qmhJ9unvSqkwUpfGxOR+gTffVdLtBgJwcwcgYL5uK0jLFiEgZVSKn8R/
	 Csk4iqSCdw0/TWAwObbLVBBffxEw8tsuRKWeb9XRuGPqAHPyBRq+YkdbZn/T+Fan4nysE
	 Ou5yWhMxT+e/Bn2TGn9Sv4qVftqDut/5tQQ1r5vS+X4H+a50iYi9PBrKllpLi9pgfxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HL3zDrgn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=El2IqZXW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6DE606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF6DE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HL3zDrgn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=El2IqZXW
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fj1hZ1148941
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 16:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=; b=HL3zDrgnV5oO631M
	Ro3PaT8ie6EQfwqRoHQijSgOKcFDtH4tbxZgzZrLgfk3JSj4kg6r56uj6bnDRrrt
	ScyF0vqH9OisHcxgvpJae0MgpBXydaQLio0ZJVG9j3/TlNXrGtskrkqlmSW+2ZWo
	xU0TdvyezwBVy7vz0pI70oZlvKNb9IC48femR6o7Dqp5cNKgJh905dqPo1w1jdCi
	WDmne/ATT7DGWZMvChAmzLZWil6FP/bqc4iMtzaeY7K30odHjDYn9qZ/etBbN9Ja
	jqK4oYFVlMganJK7VG/lFM6J4I9nVp++FG3byp+UjzBmz/u8Ss3gjnKEAxKIZrTJ
	Koozgw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3r8153e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:11:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so277184885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:11:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793808703; cv=none;
        d=google.com; s=arc-20260327;
        b=NJm+GyGh0ba91i1vB/VR25ctUCfy0Gmqt+0QIGHrV0h4vcx78xoUYxrx8e5yXrgZ09
         iHHf/KCiCZ1JdLregfAdIv182YjDiBsT/crMKGXWbs4s+421rjhicaGa6KJP9t1QGjy5
         ajDJFxUo7xg+clTSPuJnFntsgDTk0kuWX9Gf6wreOVa/uuPWd9QKLm2mgsavUrRzJNi6
         s1S8aEzAH7HRsnwytQvbheYYNt9GlW3C34+Ko86ne+TYbdwLIwfbDQFVpUqv6lW1QpWq
         P0/PAWdFJ5+qCLIc9ve8lQHpcRAjkN4dMUsvSnbai15G9xVN0atmDSgC4x0+mSNVHJ48
         gQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=;
        fh=OMpNzRSGgXNyuut6KULYZO8GKavRFifm1FHKKGxMr0E=;
        b=cJxPakH4IcyImyhIog3BvLksZW3VQkwHjN7V8NIAf7MyYpR9kzupqNBLn1lXu1wMpz
         EDsmWlAI0SHCmvJvwIZsa5yFv+ZfyhurA3YTJa7Wj/fWesEwcCBTky2rJhkLc1bO0n4C
         cTlP4mnIVwjL47DsjcrwfBeNXypdbPFRSnDe4bedycEc6UnRnWo0UO95L+E+pVg5yZbv
         jyTSLTPKSsB1kVPVwpXKAF3sEfjreHsmmlW0WSAOZJRH4yF5E9+SwdcTheUxefixPX73
         lA14Ljx4UkjHP4lixQ0dsajPM0YdSJkMxpBdw7U0ZHPt2kTl/cVNGq+R/JyWXoELExiK
         x5SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793808703; x=1794413503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=;
        b=El2IqZXWqkDNC57tidc/K9SGVrfNUsSastdQjvvHqzAaDZRkiyFrAuM/vMIVkTVg+L
         N+iMkAyBUdQ06Itekfz50jEiN2ymXWirP1+05uhuz2Noy5oMOlITxv6gF8NipJ7/010p
         x2uuO1FtQY09ULWm75TENf1JvyJ0Oy0BY8VMzLaHhSwFlY54SIAOMRBzwcNLaaRyoAY+
         T1K9YmEZgQGcaFw4GkFfyOLagtW4i2UvUoItKuXt9F6FUiquX/rzJIPWkSEDN9mRSUNz
         JAhMQSOgwiHhAkSIrVUIa6NkJGSK33AiFXMEyOZYHL+j0vdwo16VgtjOZN16c8sHHvoE
         AJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808703; x=1794413503;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=;
        b=FS7MzCH+iBuOLe6srKZ29f0bXLYQ12BmwdJpAqX8fz9m6u33GRUuUoU6rffT28EKId
         u6xroBpnJdbmXDXI7Etp98Ep64WIwQxgCPqFbHHO4Bx/zI4HZ7rUsEzcGMz38SYH9KdQ
         nXRgeh6/NS7By1f95rP0qXa4iDzcr0PMcfSHwE39w0luaCiU0Bzib+XAi4yF5z05pHot
         nRW6A6Kw0XoDng67GO4Yu0LKn6uSJ+bzu8AhFEi2lU+1ee97B+tsJR8JUxMMgSoibDKE
         cuKqftFDCVpp3qecMmmD3U6jfMafsLZcaUiivdmWj+ddSs+Ic6itfuNkhVM0JO3X1xCW
         xTqA==
X-Forwarded-Encrypted: i=1; AKwUvBw8Znrgf9o6nxX3w2jUXovhyT4hzf9RzG42XLIwCNkZVNYlN2ouZOS4jkoAY+fMqIwmrAqOq+TTiLfj4Bo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KSv9lc37goKlMo0kNJJ/4QqE3UVUnbE4LbHnmdrx4M2pmEVGT
	ws4c8E42w8C+RSIHwcqchu30uzFPo1BETiIUfYzrvuuyfYF62WAifCVZNJhALjpzRCcne8CYGVx
	PCr3gdeAydw9cjEmgmgd/VuFZ85GAFyt+GVeJkkbC/jwr2/c1QS30KpclbhLBP7GH/pwxrxzmdd
	XAS1WXGbgabmeS2sJcXxh9HvAGbf2aaqG0Ld+wNCQlUQ==
X-Gm-Gg: AYBFou2NdGU2F5blp8NXnOSdp91tcmnwBaUT0muTHE97T0ecie9JbJLFrzdaV0v1iyv
	BwZs5C2Ei9dEMLM3Chn/dkxl8ynYES3TZJkP6Yur7i7zhGVsZL16JCr6X2KD5CSpY1m3+I0H77z
	5u8AEw0frmDWspSd6i783xxEZoyha3eEimDMCysFZoOk70yyxhDGvCVMmgQbZWNbpWXMPQ78xBL
	CB3CzrZx43N05HCiEGaRUuXddAGNOKSrJcVjT3A+dUIzeW7KwlIFR8ZD/nKyNVkHM4dSlmvLEON
	ZlOSSqoJ80kzNaKOmQhnUHiTGEDs
X-Received: by 2002:a05:620a:8809:b0:93f:34c9:924d with SMTP id af79cd13be357-94421695deamr2551185485a.35.1793808702880;
        Wed, 04 Nov 2026 08:11:42 -0800 (PST)
X-Received: by 2002:a05:620a:8809:b0:93f:34c9:924d with SMTP id
 af79cd13be357-94421695deamr2551182085a.35.1793808702357; Wed, 04 Nov 2026
 08:11:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org> <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
 <fac8cd6d-c3f7-4ed3-b0d4-7cb8a7a6f451@linaro.org> <d92a8aaa-5cef-4416-b1c9-46ecfc6b2745@oss.qualcomm.com>
In-Reply-To: <d92a8aaa-5cef-4416-b1c9-46ecfc6b2745@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 17:11:31 +0100
X-Gm-Features: AclHuK9u3BNMbXNzSA7AiOa-yyai5dEWKspQKV0NGjgXsr23U39BsLgUr6rq0Ow
Message-ID: <CAFEp6-3ka3ZKzCoLQ5BNv0YR+yhYXVRwV6G6rM8Lx_9hZ0RqVw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: CM0Nopefw5qOMUVF67ISM-tNYkg08wEQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NCBTYWx0ZWRfX2w2i3S6Hnv4g
 lLqKDOHWFzeRx8JPiA72rVIFdsWOaPPEHYDEeEB3lTI7Wl65BjC3zqwOPahR2zJTvV9EkKF+McT
 EDi3ddi9QIG5tbaU1JKdaOXvE+IWpz/AR8VzDxkoTSkk+4COIolnwvf2wuv1GiKsQvhmnglAhfE
 e8LF9EWC0AG9lyb+DMFjw3Xd3PeuJkO2FIP2w+7hgo94YwFuPZy5AV/d4XFo5HxlS/qQniqSVFQ
 vzywmYzEGRB/wIrRHp/C7GVS9RbpnCBkbgEJ9M2el7gdOelRghW5BlTNIGaX+dvOAkx8ExvQr1x
 fd2q11TGArW9EyOYVnaMcutdFNKVSWixZjoz7oNFWDO1cRwHWTfKK1/SZy28hH3ZyIJMwhclZ8S
 EwIasJPSw6RjIr5PFQ/Wrw0hfyPrgGq8/3D665Sy6P4S6WyE/FUFZKC4vgol3j3log+YQtyagx+
 0ItQv6zR3fyMe06ISSQ==
X-Proofpoint-GUID: CM0Nopefw5qOMUVF67ISM-tNYkg08wEQ
X-Authority-Analysis: v=2.4 cv=UuP2pOwB c=1 sm=1 tr=0 ts=6aeb593f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=rMQDtz2esI8IZeRrkTcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NCBTYWx0ZWRfX6P/R5Re/vj0c
 cF7WEy9yR+7MM68fra4OziXP0P0XC0FiUet02nvjbNmYZyp/+lPf2NTZvh9r79j+ZQed4CcDlXw
 gnvcN/1WevczHuIyaAIklXffclkuHAc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040064

Hi Bryan, Hangxiang,

On Tue, Nov 3, 2026 at 6:29=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> On 11/2/2026 8:58 PM, Bryan O'Donoghue wrote:
> > On 30/10/2026 15:25, Hangxiang Ma wrote:
> >>> On 30/10/2026 12:43, Nihal Kumar Gupta wrote:
> >>>> +static const struct camss_subdev_resources csid_res_hawi[] =3D {
> >>>> +    /* CSID0 */
> >>>> +    {
> >>>> +        .clock =3D { "csid", "csid_csiphy_rx" },
> >>>> +        .clock_rate =3D { { 480000000 },
> >>>> +                { 480000000 } },
> >>>> +        .reg =3D { "csid0" },
> >>>> +        .interrupt =3D { "csid0" },
> >>>> +        .csid =3D {
> >>>> +            .parent_dev_ops =3D &vfe_parent_dev_ops,
> >>>> +            .hw_ops =3D &csid_ops_1190,
> >>>> +            .formats =3D &csid_formats_gen2
> >>>> +        }
> >>>
> >>> This looks strange, why is there only one clock rate ?
> >>>
> >>> ---
> >>> bod
> >> Hi Bryan, the current CAMSS CSID code always selects the first
> >> frequency listed for each clock in the CAMSS resource table.
> >>
> >> In camss-csid.c:
> >>
> >> [...]
> >> } else if (clock->nfreqs) {
> >>          clk_set_rate(clock->clk, clock->freq[0]);
> >> }
> >> [...]
> >>
> >> For the CSID and CSID_CSIPHY_RX clocks, the hardware supports three
> >> clock rates: 200 MHz, 300 MHz, and 480 MHz. If I remember correctly,
> >> 200MHz and 300 MHz is not sufficient for the sensor's output pixel
> >> rate, so we need to use the highest rate, 480 MHz, to meet the
> >> bandwidth requirement. Thanks a lot.
> >>
> >> ---
> >> Best Regards,
> >> Hangxiang
> >
> > We have a series from Antans to address this though.
> >
> > We should list the clocks the SoC supports not constrain that list for
> > one specific sensor on a test-case.
> >
> > ---
> > bod
>
> Good to know that Antans has a series addressing this. I agree that we
> should list all the clock rates supported by the SoC rather than
> constraining them for a specific sensor.
>
> One additional concern: if the clock selection logic still always picks
> freq[0], listing a lower rate first could leave CAMSS unable to work
> properly with sensors that need higher bandwidth.
>
> Could you please share the link to the series? I'll rebase the next
> revision on top of it.

I don't think Atanas' series targets the CSID clocks, only the VFE
clocks. Ideally, we should make similar changes for the CSID clocks as
well, but for now they are not being considered here.

Perhaps add a few comments documenting the supported rates and use a
single rate for the time being. Once the CSID clock changes land, we
should be able to revisit and adapt this accordingly?

Regards,
Loic
