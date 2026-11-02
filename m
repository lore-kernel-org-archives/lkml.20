Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632744;
	b=3GmCnboUhT3abzQJT9AvNHFOoZZiaVBggxMOuNjpIOz1I80GwhzacDnUv/8AktubfNfp
	 zmSqNnQTX9MbQSVAlcMQ6vJC3Plz6HAlgWROAnC4JnotHoH2TwfxCgNn89y2ehowJ4S95
	 pnJfKjPMc8caoYc7hwNcbFEroHBRO2CBjZSjyAh2vy3fSpRL2nkVdthAAqi6h7R1T4hD6
	 Lcd2RYcGL1UiruqoGa8Bf3xX8QnyXK9/Ec3xrBe6JynIUQMX5ChMaDz7sWDHM4YSiIOH4
	 p50GuL+mIODb99yNTnXpzt2xcU4DoP88qrOYvdbfBGonBoXtwULATeWat2S2DSQL2zQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632744;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6TPCp/ZfUGDwZY7AAgzK/IQX0AhOazCyOsqyipH+VYI=;
	b=2Pt7+kiyIUg80XhCYWdlGPonyhCOy27g/dyEemw5bzvLnzVOpHA6N8Jkcb5kvPL990JE
	 gnMFf8EyTeXhepJt89t5bjfVXO2yzrBE2nem5rIOsLkKozxiH6Mc4yLxKHsYJpyEKBBUC
	 6g6v4wZH45Ypwk9X+RhnIb/9KFRmxuDCSHLvQQBCWcmXWM+xB4iWTPbyq9st/LzbnOI4D
	 uQagq/pUgXSxcEY3cqG+N22Adbqkr378PnBkordvTAWdT7KSadyquNyp0vAYI8ZDZvbjW
	 089uP+Lq3dWZr0IVmJJEyu2iGgRpG1mMN4BlHkPUZAfH4HvEV5trBskMhqLhp0kpAMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AsoYHNM1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O7+lWPAV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1935606C3EC
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1935606C3EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AsoYHNM1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O7+lWPAV
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpIVV4034013
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6TPCp/ZfUGDwZY7AAgzK/IQX0AhOazCyOsqyipH+VYI=; b=AsoYHNM1PRbrLXhs
	n0PfZm4CpkF4ME8cWSfYFh00O2Weh6QquG5y88C+fIFkVb2EFSY6hZXzbhxVQX8p
	lX3ei5ZV7Zj2GZblijdF32XPg/AL+IwWDev02eXJbhhAMlg7Z3w83YoGca6aqQR9
	jXBFFCgjoN+i4zDAjibV3acXztEBhXPEGyqA/8jTZCE7eIm85E72NI/ybIxa4BK5
	ra5JxX09emNPSXzfZ4To0dLcF78b65dS0qsjKKAhxduynYUQd2qB47ds+qzswYsM
	0qGJKlXqP/TOmvVKNMRdCuzbFdRQc2ntJ7oRGb4ibH0rvouMPCShwPpSQF3uS01V
	NiljXA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe9skn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:19:02 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5641cd2cc13so3255538b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:19:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632742; cv=none;
        d=google.com; s=arc-20260327;
        b=MANvtkKqeyODSxCYH+tisxCZ4Glj2F0Sy9sjJP3pY7UmzWFjchQIV7J6FkqC6mH8Ux
         qLu1TXUJM2kwST8aHnpgEBCPBKlcR+R7e2+QURStiCgmC54m3H1SyUqNTy8GjZpi+fS1
         74Mc4HdsFCBWqJ0sKBxT7EMz2P/oilDURUaOc/eujkyALd1KRmxmJB5CbVP8pmYKfvXF
         7lqTUBfzsYAwAMDsoj4nzOuNLE6BTsrjM5LtMzGX7kc1Md5ACrYyoxBTyrUwupmMtGNm
         cIvw2BKY+Ifvmbw6sNyy4pggALn6+cMgKLahO/kPiHtK1HkMB3MDrmVT9SNQ8re0W5GF
         8Mlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6TPCp/ZfUGDwZY7AAgzK/IQX0AhOazCyOsqyipH+VYI=;
        fh=T4HeGKcLKtTl9kLwBJ5U2zYxhNh2IvviTXmdEpb7/uc=;
        b=eofzFWGcaIwaoyO/t2l39dtkq0IITY+nuFXx51aqJoxamKnd8Gkkvc9ZXHmQ2yL0EO
         NnOXNvwqVvexI8HCobAG6yQqyGKYNvNaYZNdA5h6zTfVPmSsLlelvzHWcaO3kT53/hib
         X6FTRMMLjtch92zqfyTsE0D0GCDjxDqxJZGiuDV/V5LcCpYnXgvzAX05tkqlgnojLlBN
         BIgRCRUKJhxEM892wKq0iuVZ/ZxOx8Acy3rr1sWdl8CWGCC6w8EW7PrNNeHdvsu9a0im
         Sz2s6oWtElyVtjb0f94lbFB0RWnuAE10gclwUGZh1dblRn2kcsD6rwRvTUm/+b1PjiX6
         9Keg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632742; x=1794237542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6TPCp/ZfUGDwZY7AAgzK/IQX0AhOazCyOsqyipH+VYI=;
        b=O7+lWPAVgxPy0p1RRDaAzo3lJUkNUkUe7E6v6d5BkRFXh9EThj4a+Ns013QUJzE1is
         tjQOIPg1ClqPZfXV4qQSVylbuQv6o+vAq2exby/HJD+gRZ9732vHIEooEnStrfSlpNhp
         jHhAzMTdDWus7BYEhda4irR0uDK5nFCyOlnt9Whxn4jl4h2BT3yTH90k0x0KqLO+L4NA
         8E96el5a97paftOUHrgvdwrna3MSGERCYYeBTmko7CSzE9b6Fc9z2VJGvUrKP3CP62Rn
         xPgipmRgjw4CbJTHaXZCDUuA3p04jE3lfwYHs+xPB1L66I1jN3VMRvaxdEBlJABNU2Kb
         x3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632742; x=1794237542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6TPCp/ZfUGDwZY7AAgzK/IQX0AhOazCyOsqyipH+VYI=;
        b=xgBOUCKZBZbaKNlYFW1ns4RUNaN/LpsPiWQAQJBXndKD7zDQ5+ul4e2epgB1l3kJXY
         PkUsTQGKKiddrZRr6/Yu2pFFX8SQj31UHO0zSSxQw/4APrcOMsY5Zu8xrJEdxJsSpo7E
         NsWuvi5RbuQPxGAXucojnvgdl2sUcnGf6mi7F52VSvQsLSuvi8RO62/Kz5UWIIS0g5SH
         DO/8rPMQWQTy46+UST5MyX4RTmUfSZkiR8w+fdVyJ5Sjvv0iv2y9DLeUhGYRTO9DvPI3
         5ZYYDcBYv+ia/IG1RuOvrJOtS1gCQ7qlgL//qXLdWvM8olOslVlmwe6tMcLUQC2U++Zx
         qZig==
X-Forwarded-Encrypted: i=1; AKwUvByYpWqXGCIwa+jhWac0YUSDCNSvoaj7Gpa22F+G5GM6AeNqs/fWBVZ8eKHl0XLTTfd/NRd3vh7/9verWtU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTlnToIljuC2uGtNLhgP6XInpST9r5d9zkbFkDrf9TCGLaet6t
	EZg7Mowa+zjON0JEuRSsVfNhO1EXX7ZpFUBnRcPyR9a4mVngsDfWGFs6p35XP+YbaaVDSZp7Gp8
	ZcGOgRlceOsPWZoJOxvqu23Op9G8ZMcZii0OE0wYpW5l1rJyYLJvDi6fixuq7AFWQXuxCNHwX4D
	3q9OreM5gNjAIHwbZFmC2gF4WCAap3drkKQEdhU4PJ2gQKgfnBTTiY
X-Gm-Gg: AYBFou3nZ6cUVaO4SJZYz/wH7DfIYbFZeC8nrKI6X84I4LFWXRvjYUVT6wyW3FuxPkQ
	CqsbOKTEVZu4leedt46biWbyKVuK0oD6eGu/BatYuTU4sFlLQeCkit6dhKhvUoK5TOw9Qskh1kC
	Eo12S4nwMwQLFfegqwBwa15OBS/C4KkpRZgF1djlZcHBG2vNixsFs4XG2j5fH2uwBngJSW9RBzR
	yqGe+1c1hvvSnw7khrjqaAl0T5x5+fDg4TOeREAEcDkHVbn9p6kjBNL+A2eKx3Bb4qpPYdzOhG4
	yx8ctSesPgBbOX7uI/oG8lTdNapJ
X-Received: by 2002:a05:6809:8f:10b0:564:22ae:a6b6 with SMTP id 5614622812f47-56422aeacc9mr3332395b6e.41.1793632741884;
        Mon, 02 Nov 2026 07:19:01 -0800 (PST)
X-Received: by 2002:a05:6809:8f:10b0:564:22ae:a6b6 with SMTP id
 5614622812f47-56422aeacc9mr3332381b6e.41.1793632741440; Mon, 02 Nov 2026
 07:19:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org> <20261102-v4l2-frame-sync-v2-6-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-6-25cbed7a772f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:18:48 +0100
X-Gm-Features: AclHuK90Cnt49M0E3n-GEq5a7HYsx7101LK5oGlS_JqmbiqgXrkQ5xEgnXx0FJc
Message-ID: <CAFEp6-2-v3=wEixsWfu32qnqbQxyRL+N7_WbLRKerjuMsKjZ0Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] media: qcom: camss: csid-gen2: Enable RDI SOF tracking
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8a9e6 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Wf5Y_Iq7YOo0zHmYxc8A:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX37PTaWj/3n1n
 vMUHiTUufLaNpoe5g9FysZQkoRKdG2Vn1ztDwXwy3vchkJcgcKUkxhe/GMI6EWrnQ1CJFGzXP3Z
 PmXUM9tjOCCpRnRaV6yGJ8Cken/Tk/VYb9/ysK0hTD3a9Dk+ccWq2BpOSqHvCj3GJZDFXi1eXQk
 +WLs7pELoUitgkVoAozWhKyjaTzXwVnPfcbvC/rLuvDBfFE0PsQDK9qBu9VQyCfki3bNMGetUjo
 h46JOw3au/RuHKPnEFyzwAm28MAQmU513b2lsl4WSadAvIYWSXXiuR4jsmmfpFlEYTSFs21bYu/
 fUuLc6j5R+0GM5BwMXhVx4lCNSKtArvtaz+mYIZRvRWJVSKa3zzD1Vb265ZBQN6aFup2DgrHxjG
 +riuvO1y5QLWawecFxbt1D/oEfJc5NJUuxcqeXoN1OgoSusYN+nWX3n1G1QQH+2axa/n0eGEo0B
 pTFXFfi+sinjukmph9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX6Gw/Ui6HusB6
 TxmsHCvvHLjgv7cjcqnF2eB/UszI83h8VPQxipXy700UT4OtFQprnaf4QRtrfzlRSl3gMeMmPNz
 AnxkpgFdm8G/YH74zq/TlEU5tMT1XO0=
X-Proofpoint-ORIG-GUID: tjR6NtjdLlpD0uPgMd1ZPbfmEDUxMtVv
X-Proofpoint-GUID: tjR6NtjdLlpD0uPgMd1ZPbfmEDUxMtVv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020060

On Mon, Nov 2, 2026 at 2:57=E2=80=AFPM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Add silicon specific changes to get SOF triggering V4L2_EVENT_FRAME_SYNC
> 'gen2' CSID. Covers SDM845, SDM670, SM6150, SM6350, SC7280, SC8280XP,
> SM8250.
>
> Tested thoroughly on sm8250 only for now. An additional patch is required
> in camss.c to enable this functionality on a per-SoC basis.
>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sm8250
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

I guess we don't perform a read-modify-write on the IRQ mask here
because SOF is the only interrupt we're interested in.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/media/platform/qcom/camss/camss-csid-gen2.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen2.c
> index eadcb2f7e3aaa..a351ac4b91728 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -38,6 +38,8 @@
>  #define CSID_CSI2_RDIN_IRQ_SET(rdi)            ((csid_is_lite(csid) ? 0x=
3C : 0x4C) \
>                                                  + 0x10 * (rdi))
>
> +#define                RDIN_IRQ_INFO_INPUT_SOF         BIT(12)
> +
>  #define CSID_TOP_IRQ_STATUS    0x70
>  #define                TOP_IRQ_STATUS_RESET_DONE 0
>  #define CSID_TOP_IRQ_MASK      0x74
> @@ -322,6 +324,16 @@ static void __csid_configure_rdi_stream(struct csid_=
device *csid, u8 enable, u8
>         writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
> +static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable=
, u8 rdi)
> +{
> +       u32 val =3D 0;
> +
> +       if (enable)
> +               val =3D RDIN_IRQ_INFO_INPUT_SOF;
> +
> +       writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
> +}
> +
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
>  {
>         struct csid_testgen_config *tg =3D &csid->testgen;
> @@ -335,6 +347,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
> +                       __csid_configure_rdi_irq(csid, enable, i);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>  }
> @@ -373,6 +386,8 @@ static irqreturn_t csid_isr(int irq, void *dev)
>                 if (csid->phy.en_vc & BIT(i)) {
>                         val =3D readl_relaxed(csid->base + CSID_CSI2_RDIN=
_IRQ_STATUS(i));
>                         writel_relaxed(val, csid->base + CSID_CSI2_RDIN_I=
RQ_CLEAR(i));
> +                       if (val & RDIN_IRQ_INFO_INPUT_SOF)
> +                               csid_sof_event(csid, i);
>                 }
>
>         val =3D 1 << IRQ_CMD_CLEAR;
>
> --
> 2.56.0
>
