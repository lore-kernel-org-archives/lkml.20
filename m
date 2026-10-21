Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792567223;
	b=uaNuhpXKCX3LsU36C0MNDmfl2qrZCLvhPnYN+3F6tW1iMM75ZX6e/i+fxoYv+0YjfkkK
	 WMdzsMML+jQE4vKhfMchZ4DiAbHojAYJ6FeLqrGVTbsqStmU3/F0UriyAaQv56cVSG0kP
	 Tyrh/ozp6XOh4fmggNNN1rzyZoRL1vHb4wTJdSj4W5+iT6nw2GgC1bU7ofvCwnkhIgCNu
	 1jVLtbNeB/rb1/1t63WYoKxudGUqMuDCuPn1RJadqcp8OoAYLce6RbInkAyk2F4p2bqDc
	 iG1NjD4sjkdGpFlbuVxqs5tIgIaW7bVzZnhOggXGnPUCjGZC+CjqhpPq+DP2VryXhOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792567223;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Vyw8xlAE2+V3gWsuPQfIkm8MHQNj4BK+dYXwJch3hNE=;
	b=0FkM5kYYe7lIAGwlwITAvLeyIKYgFag2eU697SYU0UDbRt6c9T6Ugtgsoc6DFG0iVejK
	 MkgqW4yTq79vWzJafTyODXDpPsUoR1nntRYIFSVD2h0nueftGHzLwHiFEK3/V/qdVkWyo
	 YDpFyE22OQCCWE+rj9/QlFN7TkYsVYxB/2/qGrmrKekZ6c2e0res7xUSD8d5T755CNqJi
	 3XDhaGs/cq3rv5aj6YLDYJxZnSXfAQzpg7nUitoQs04UYDtnjLOUnhzZnAsICM7Fjvkzu
	 3RyuU847jd+dw928Gq9ZU0RdpcjPrym7p3+d6Pt4zkYEY8xUTJG6m7kiQ4YWiL/jE7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hGTqGpQT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eI6HWg1A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EF7606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1EF7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hGTqGpQT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eI6HWg1A
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jLpI2848640
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vyw8xlAE2+V3gWsuPQfIkm8MHQNj4BK+dYXwJch3hNE=; b=hGTqGpQTnyw3Y/zm
	HjoYc5lye/Mu900AVh1RHHDLmp1qkre8mvTF4kXSMbvJRu3/K+FO3PwEeamjsCqL
	hcHK9qyyCJPtnQo1ZHphKccJW+rpkYRztarOXRmsE1NH7v6wJszC+1WzC8QKmrkx
	0KUTGEMiYAWUFDk1QxYmNf8supa3K39VcUZAplUI0IGRgQcyW63/h2sjsjt5Q9ot
	zOZ+DeCrpqbpmnph33ykoRUC0TEKFgOw+CEx6JTpw9zWOwEO7Y2IWHu+K0mwZLWV
	+XtuY9LFnOM8A3qKEumUO76tSg0mPIH9DtSAVGXecsLznVLygzUJjYGRDfnvgIig
	PT9SQw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9aae1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:20:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ecdc701a2so53807485a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792567221; cv=none;
        d=google.com; s=arc-20260327;
        b=npWfl9MNHBw6qU/8pUvQ9iXzybHGNlNWRnOGxp0OMWF8yaT17UnBb1r7bE6i5sX9Dt
         4Bk3jDrcCXmabsIYggv4u8T54TeYURhZcajSKoEAAjiZTjz+e9eqKs8+tdcDtFqfemOK
         2HZqkSM+zNWj+ncFlsayyADwEUHCodEL/LObD6Qd1G82kw+lilgKBxh1ozn0Ga88Cj2N
         X5XtEECBDM2H9pSmGLsO/jhdXo26SyDzzHDKSpm3BA69eiGiGMCzoPRXCdf0cRC5Ynj9
         ztMcwdO/5JwVQoj0S0iXSZuPiGb+BCQZa4Y6E0AEvd4+oR1E40ruK32tdZz9twjBz9Ik
         wL4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vyw8xlAE2+V3gWsuPQfIkm8MHQNj4BK+dYXwJch3hNE=;
        fh=s2WKVaJToTbDzj4V8703BxSJvVJagG/Cq2bZ97mmXZg=;
        b=BMeUPok0rC3HLRGXywTxbUVVMLAwBs+iSSfrVmCO44asMhWQcU8GpxEYrd8oH8pWE4
         4YXVd7IUrJxoufKM1UZSicNroONK4rY4NhDT3qXaAWhB+JfZf0R4dRpuvfwx/UpftT0A
         s72rU4eLedpZCljVP+LiWKse+Nys5FYea7E6khuBh4GBAYVBjl8hbJcKGx7t/MPIZQv6
         Wo03TY7aUOHVd6Vey3/+VKKI968rnG/SsxMCnxLamTlsYz+jat7okmc/gsC7mPBOjDZo
         /rTXSXj/LWkVbDmSJv7DnH9Qsq9fP3nRX61RiL/d6taqKNv59BTZEef7TDPcrhGmP6XZ
         cIeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792567221; x=1793172021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vyw8xlAE2+V3gWsuPQfIkm8MHQNj4BK+dYXwJch3hNE=;
        b=eI6HWg1AmnRQa9/t7EIYa9FGcaUYXuj2QoMymB4mB0PpTRjbOo/PeY1viyijmkcGMQ
         BtADHNWFC8OZyHpubyUlRs0wg0hKv1y8XyDPfMhZ+p8KYg2bS/L5iciYST417kP7xX5f
         rGYcp2ZaVnXnBY0lcjqWEY04e8IVTcTVt/MllZ1LxkiLHwRsX2xuWnsXlMYIjcluJvF9
         LzYElWzOQWEPWB+Ry8CrY5wTMZtuHlUO7IBUcJbJLf2pFqGhUn0aQsV53VLIKQ6LoHnO
         Oqmfjz/i8NsWlUFVPDPpZlrzRvmwVc+s33lEl3V0mi5W2+JAQqz6oB/JLKQL1I0OXvEd
         FYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792567221; x=1793172021;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vyw8xlAE2+V3gWsuPQfIkm8MHQNj4BK+dYXwJch3hNE=;
        b=ahyUycLucr6dFvoIEqsrysYhOdCUbSKL8aDaTXkznvY8zj12LRo/h1pZwni8/RA/cr
         l4M5QP8HHyv20zc/njusPEJjt5Hw1g5+09Bu9e9wYeaEJ23/Tb/gsQUjhR1ffhdxMcXs
         0jPRNdAdTPHI4h9Ifh2rZGtgpSamKg7GnJyJ8mIPsL1NIGmZpoWpr0i+BkbRkDdbVlOe
         iauNfcPwun0rQfNHfwpbjFMZSi6n4d4b/o1llUZgYXOM31jO5ojYCbaglUCOv9IWZEZP
         1csQTKqK2VG/WpFtlqPFIBgktDxXK2hri7iEE2Lc4NgQtRFG9B9QxyrpZ216vXUK2Sv4
         Avww==
X-Forwarded-Encrypted: i=1; AKwUvBxmX5GH9Ig+bsaTRrJt2PTkIEoJlUIZUcSe7SO9TuTRLgjtzmRgBr6Pk1Yx6sPMYV4vMSP2M1YcSCzg7vc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ9zsKyLOxEPe0kEH8L0TpyPO+dvy10l22cswwfXpzMiCLaO51
	ONCURAIf0CSxwFVij5w8p/TdVy/BOaQyUXgqY4Ou6Xv9BHNx8tVbuz17mnBjPtLyvJOIyFNvETa
	iciFDWYzRBUG705ylSeOP/VhfDxJiYqCqEiQd5lUR7x6+nW6KW2Y7fdHrrAr7S02obcUQFxPr2O
	bSa/LvoTpjfLV5omgLs3CPPff84Rm4RQdZZYkQRzDyhA==
X-Gm-Gg: AYBFou0jsn35ecxviBNPDnZdm6M7h/gXWMPFcX/4RvvyRDDTL6wb3a/EL4GkOlAaLtl
	cBjfiOdtHOXw2JkoJVtsOvw01Jt7Wf0qsBbTciCQEub3qfM1HuBz7euKG/lWfPe0LNQO1W/VuJy
	fvXMgdR43q0H+2whlxJwj7+NpvQZAAdJEiWut6YItd8NWKOJDQxjL87NMwbe/DVNmf3G86RVc7c
	keRrbSEa0xQUU4qqnrudvGkRb8UhNbwoO5FxPAV/T4yVDFrACBcIJGB/Xrn+SbL+i87lFwXFuY=
X-Received: by 2002:a05:620a:4010:b0:93f:3576:d428 with SMTP id af79cd13be357-93f57f65fedmr280273385a.22.1792567220731;
        Wed, 21 Oct 2026 00:20:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4010:b0:93f:3576:d428 with SMTP id
 af79cd13be357-93f57f65fedmr280271585a.22.1792567220118; Wed, 21 Oct 2026
 00:20:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020193946.51478-1-birk.skyum@pm.me> <20261020193946.51478-2-birk.skyum@pm.me>
In-Reply-To: <20261020193946.51478-2-birk.skyum@pm.me>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:20:08 +0200
X-Gm-Features: AclHuK9V7aVQiTOHc0vqWeOOfVJ0Ma-H2IE8l1YY-5LJtcIK6v0ZsdlpKcyDMMM
Message-ID: <CAFEp6-3s9ER_V_B89W5f5PVkRnLrgSwnUwE+tmftbUGB-1_BdA@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: qcom-cci: Reset the controller when it resumes
To: Birk Skyum <birk.skyum@pm.me>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyOSBTYWx0ZWRfXzsf7JLlMQ+TH
 5ey9LwxRcTx2nqur6yDztQQPhv/1H39oSrpMw8nZaHXsxzGPkG98nEbaG61dJG+VCE7PH+6bgIU
 J5VLQycz3LCTYGCB+GayXxy3IhuNDDM=
X-Proofpoint-GUID: bAo7e_Q0itcyhzcOshdfRTJ9-Wb2jCmo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyOSBTYWx0ZWRfXz11eJsqEQJ1V
 jYzY3Po9in742zjmoFuNrT+JyBodnwMgNUN7hnOiXF8Jb5C+kXp6WD+RhUDMZw6MueZNuRSzXcf
 4mIGi25qEKd2rIW/kPk4Koi8+rGpyDxQRloxF6vBuW21s0ffyzREiB9vQo4xw11aMX1uSBz8dCf
 c6aDPCu4F7UoGIvoyZ5duyQ6nRx3qJYUOOIKabfmQSK0SlE0JD78NtbeBn5MCjLWSdXWYCRqmYA
 iXuFvILkOdgZtOEpOihvGnf58NMhJBEyJSQBXaKkZfZ8aKv1PNjOLNFxbPJPxf9Uzi/gW0Usn92
 OAI5YRSA5KzpvmPoXjVaSEWJDvytavLXYrHtRv/zFYHiHzEHTDDZDA85sN50gis2yBw4mWJzPh/
 QUFFWP39xJjN3YtcB+ETgD5uTkXI2D3AllfhMvUMCUYiqzG3L96wsL+aJe9OlDLbUAxfDA45sqV
 c+X85nW+cDuYjB51EyA==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad867b5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=o4kKvnnIlv_pODaOlxoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: bAo7e_Q0itcyhzcOshdfRTJ9-Wb2jCmo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210029

On Tue, Oct 20, 2026 at 9:40=E2=80=AFPM Birk Skyum <birk.skyum@pm.me> wrote=
:
>
> A CCI master can stop starting transfers after a target on its bus was
> powered down and up again while the controller kept its clocks running.
> The next transfer's queue then stays on its first command, neither
> CCI_IRQ_STATUS_0 nor the queue's report status changes, and
> cci_run_queue() times out after 100 ms ("master 1 queue 0 timeout").
> Only the controller reset in that error path, or the controller's power
> domain collapsing while it is runtime suspended, brings it back.
>
> On the Lenovo Yoga Slim 7x (X1E80100) the OV02C10 front camera is
> powered down whenever it stops streaming, and the unpowered sensor
> holds SCL and SDA low: both read low at the TLMM pins with the internal
> pull-ups enabled. The queue registers at the timeout show the stuck
> first command (CUR_CMD 0x08010339, a write of 03 01 08) with the bus
> timing registers intact and no error or halt interrupt before it.
>
> cci_resume_runtime() only programs the interrupt mask and the bus timing
> again, so a controller that was runtime suspended without its power
> domain collapsing keeps the stuck state. With the camera's TITAN_TOP
> GDSC held on and the controller suspended between camera starts, 3 of
> 40 starts failed this way; with a reset on resume, 0 of 40.
>
> Reset the controller on every runtime resume, as the timeout path does.
>
> Signed-off-by: Birk Skyum <birk.skyum@pm.me>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> index 76a5ded..51ce174 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -651,7 +651,20 @@ static int __maybe_unused cci_resume_runtime(struct =
device *dev)
>         if (ret)
>                 return ret;
>
> -       return cci_init(cci);
> +       /*
> +        * A master can stop starting transfers after a target was powere=
d
> +        * down and up again while the controller ran, and keeps that sta=
te
> +        * over a runtime suspend unless the power domain collapsed. Rese=
t
> +        * the controller, with the interrupt mask set first so that the
> +        * reset-done interrupt also arrives after a power collapse.
> +        */
> +       ret =3D cci_init(cci);
> +       if (!ret)
> +               ret =3D cci_reset(cci);

If we don't know the state, it's probably better to just
unconditionally cci_reset().

> +       if (ret)
> +               cci_disable_clocks(cci);
> +
> +       return ret;
>  }
>
>  static const struct dev_pm_ops qcom_cci_pm =3D {
> --
> 2.53.0
>
>
