Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED20A37E5D6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412332; cv=pass; b=gB3BEA9hDmr6SKehlpycSxazVg3awM+ky5VClgIx7J36RUy4OEerPgEX74ywehKoaOqNeAE1ze/fz8CalJTJ13qrOG9tMN3oZvbfA9uu+/9zObld4j5RnKh0QtErI0h737Ue8mLlEW0EmZ205tGnulLWOqY3pochg7kbRYugSAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412332; c=relaxed/simple;
	bh=QOVXsbt6Y6xEtFsoDTi00B2mYOQj1gJHTB3VphGJEWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g4OLpuKkI7MpJX3AieN9tpddroWY01jmqDEJ4JS3ACuVGM3RKZQYmkWKUdm3r2eC4a8P86AlL6HL+NC2h1JyyE4pu3aNz9zxw+1ws5Cgpmv5ejykZb6tD4XoLIHBC23RexKemPH48CixjvhHFOITvn6BUi5OvhcvlDqTkjziF5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WOtT8K3I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJUEC9rr; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WOtT8K3I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJUEC9rr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68344fHo4050494
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 05:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=LR9IzqRjALwvtfG5DGG1mPrwlxTakHLUnlY5jwSMpfg=; b=WO
	tT8K3Itnc0Ak+8I0BFgOGn9/g2FVvuu0T+dr8ALhNdfJKJGANHAOovCKLSe61eaK
	RmFMYR+ziIiCDeXJdVcvMBTm/ywhPktYEH6gD4YE7nX3E4+nsMW1o3vMuQdSw/XP
	6vzifS4X+ujg/lN1qiwnthspDZu6QOY0sQLXbu+2ljOE5B0HkgBcUBQLqUnkBLll
	/sO3HvdZVWZKRmYoY43EPr7slNLQCLodnkT1wTrV8NEQyaOfuhG3hAAv9eUzaagZ
	QLWPrtRZBQr6BAFsmHCu2y0bGmYE34PtPJT3gv/6BnvQ6DzfUnNR2u5099agYCY4
	KzKeWlN0FpCTuFTMNN8Q==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4g6jy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:12:09 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66e509682ccso2587131d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:12:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788412329; cv=none;
        d=google.com; s=arc-20260327;
        b=sjua8Ub8BclAY+zYEUhqg9BT/wsil4rGOqEZyhKz7dwo7Vewu6+Hc2uxAh76MOMm/f
         2U11nzjcziHRPvT3oambqDFHOCZcPrCwXfXU8dEX8tAvhR3JMsiXvtpD/DmYK/MGtd30
         W/CUgRvTw8hUFC8ny0WHQfCDStUUn1eMEsQ8zN6ExcPdA5rQkINdzXlNPR4Ax4L4dpAZ
         Dadb1sgyTHnPQxBy+DbjEUAKp6RxwgLYjadmDK+/t2hEgLIm1W1FbgO8pFL5Q5LCdK8h
         eu6UaE0RyzTJrd1UqCnddW8Gk47jAqbdQWQeUnmBKpIJMabe9ZEnylv5T8niCzAfuWVq
         r3XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=LR9IzqRjALwvtfG5DGG1mPrwlxTakHLUnlY5jwSMpfg=;
        fh=qHiGB3rsOZ5EvAsBHqqcJ7g3Y0RZlsUnbX3vscSHp78=;
        b=rqPC0D80/NopL0FlZ/jLiIhPoX+4/kp3QHzOgwrZhnBuyra/fdMB7yf4fkqHECroBB
         8BYeAxhCsoQZ99Gux8WPntkaZ3D8Y2y+IOfya9uUb3WxFyxv3j8nYHbdeDXLergJnx7y
         7/1i+5477o35Umtsrnx/PJN5Nb5F5bf2KWb7jYaHDEOmb2Mc9ITd4VAHJTK//EiYuo60
         pJeVdUXCTPeKl3em4of4L0WcfgUPhq509JiXDzOGe/4RHVG3BJ03jfpOCffWD/c8BZ6Z
         yjBbmryXnVBdv8AT7GsuKyAAPLkup7hJLef76eoMIPtzd9pYEO1TjfL17TSPzSXscftd
         L6tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788412329; x=1789017129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LR9IzqRjALwvtfG5DGG1mPrwlxTakHLUnlY5jwSMpfg=;
        b=cJUEC9rrNQitvCU7+kHsnzSsEZJ68xa5uuxwJFTU4oVWO/6azfyvqxsgIALge1YOMv
         Kp8apzCofRygwBRSAJ9Ofo2HN9mG36xA+F7HDravrLP2Xg4vQ78R7yL4P1+63ZBzXIi3
         vqNa1ARAtFNSjY4D1ThIV0XT7oL/Errr12NGH9GKOF3PMHvYuAlJTRVfUudgwyErq4JO
         lTtLNSSIkS3jyBBQgi9TdSlCTlup4HTl8jLfQlE9cPkF1Z2ygDFb5j8UYqFkSj845Ogz
         81CultiQJSVrH+IJIoUhQ5DQgZ5ftYbsbRfemNedvvLy60Z8om3+EPD+Q+sqNbpyqDKe
         JsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412329; x=1789017129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LR9IzqRjALwvtfG5DGG1mPrwlxTakHLUnlY5jwSMpfg=;
        b=TNO7sG2fqAe/Jp/9m5yNOavMkeZuqlpp69h3ifjnm7VDNS6IVF23jrzCqXjLCYMWBl
         5wbKHMXnT+pDzfo4ytC8Eg6p20oZ8oeeRnDghJjTXKlaVM/N6Y2MwA4zwP/A+l/qYUVH
         fSjcYo1UdZgFp2jdokekhRZvZNqIJvepU4JKZiGirNgu1SK8yIA6jlNfXHTlLFqUX/86
         EjQcwr1WUNyn5RbyuMZ/UzDBJH/0K+HE/8qCsRZR4HoCqX7xG2D86GoEsZ6vrZjLsabx
         43TozixvI0gmHiZ2aixcVYAMZxehM4y5TmyAqNQQz0onyZE1IrVVSxZkfPKIRJWLihsG
         /Vhw==
X-Forwarded-Encrypted: i=1; AKwUvBzDLG9PR+4BmdNc1nF7T0FQq3PEcaTvM45G5MDXVkI0zIRvDs6okY1BNigA4OCkznSk1KPlrUd+iICY1XU=@vger.kernel.org
X-Gm-Message-State: AFuF++nsSmboP+iL0BFxN0liuLgmX07Q8cQI44fEbEz4PA7oibcRgeIz
	u9rOqhCKhqni6F7MO4Ohg28mv4eWOXhM0rNTKy/2HVdmah7SchEaL3je3K74pn5ZMOQTXNh2AKI
	bFnbC1QtcbMsuYBiNe6P7ABCPzAumTu13QZlA/S3T/lIyS6WiWzYovsOXHLC5GMAkLjjlfT5BAK
	RkVJA1nUsxr1C4cfJF6UcInwc9lIOrnOYxfxbysCyYVA==
X-Gm-Gg: AYBFou1fTMujsEEhr8CTndi8rwl7DbEqNF9OybWWE3QMcVAub6qqkasTjKIvThyaZE2
	uQMJ/xyxkimZS7aitheHQxU3s6KT8hQUYHXN8oshs9ysVm9/m+OZ6IfVFKmPGd/CYUPbfrI03mD
	qJH+Ty9pANBelvpnz5Wj7RJeUq4qfFbGLxY29w6jRVO5ZV4b3Vw8UJ+zfw8Q==
X-Received: by 2002:a05:690e:438d:b0:668:9d0f:ab70 with SMTP id 956f58d0204a3-66f9b93b27bmr2799458d50.18.1788412328976;
        Wed, 02 Sep 2026 22:12:08 -0700 (PDT)
X-Received: by 2002:a05:690e:438d:b0:668:9d0f:ab70 with SMTP id
 956f58d0204a3-66f9b93b27bmr2799438d50.18.1788412328517; Wed, 02 Sep 2026
 22:12:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902083450.2348-1-douyufan@picoheart.com>
In-Reply-To: <20260902083450.2348-1-douyufan@picoheart.com>
Reply-To: sunilvl@oss.qualcomm.com
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:41:57 +0530
X-Gm-Features: AcwNN1XjAPbxTpUY682euCheD5pZce4ONELDwflXG2pmom4yd0wIGrjfYXZSpf4
Message-ID: <CAB19ukHyZN6kFJ5W9dYLNANmuU=vnSC51D+2q+FhuspAbPg8RA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: RISC-V: CPPC: Implement cpc_read_ffh_fb_ctrs()
To: Yufan Dou <douyufan@picoheart.com>
Cc: Sunil V L <sunilvl@ventanamicro.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, yuchao.46@picoheart.com,
        zhanjie9@hisilicon.com, yang.yicong@picoheart.com,
        geshijian@picoheart.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a9901a9 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=TxhyHGSeAAAA:8 a=EUspDBNiAAAA:8
 a=R2scDWojlFBtPnKtwUAA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
 a=VRTRSrWG77IPp_BSX07q:22
X-Proofpoint-GUID: di7YY_omPiQ67dG0kNfgUGQ6_PQT9N-W
X-Proofpoint-ORIG-GUID: di7YY_omPiQ67dG0kNfgUGQ6_PQT9N-W
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA0NCBTYWx0ZWRfXw1s54arJDMQm
 pqvZHOJQQtxQp2c9tf3sWoG790u5iHj+ik7l/3TdQH8owp5OAnmzFSPhYcJp6HPs+uq7j2J1Pv2
 eB2EcR9P74A0vqIWyo03LlBFs6v4Tx4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA0NCBTYWx0ZWRfX1/H1zvbUPtRc
 3+0qWSeNRSqgumLWcv/3IGOT4oBm1TaYy4XBVp1x7vbDum4FO/5KTW2rlRNOXT5o8PdZNWEtRjb
 SPPqHlLO+JvF1FX9uPMyyftAZwHhXMSFL8zEjkDey6ObqxmC77Y0+M/eXX0ndNdFinbU/+h/0ay
 KwyKvmQfDP2YDxqiAQhQD+NSx2f48F7dmNqDIC4vWRzfULOVdXC9PmAzbieEfOkNy0WGI0tCsVf
 hVznL/MNYIK4CmuGTtrffeyuI4jaBiCSx2Y99kZYlylIzxEDi0SNLpV8aH0YY3A+fDsTboW3R17
 u5wjh6sIalrkxqVW2gx54iTZvF4DKpWLeGKUE4WjieuemZPhli9KN+gRu/21jGVFVVgjnGlJGpj
 +sE0Fkl6tj5dQvBszcRLJcjU3Lpe4JX5nMK5PsfNUqMYu0GzfsJh8v1d5fef2TrNTEQgpGiG1EO
 wsCM374dobkHUUnh4wQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030044

On Wed, Sep 2, 2026 at 2:18=E2=80=AFPM Yufan Dou <douyufan@picoheart.com> w=
rote:
>
> On RISC-V, each cpc_read_ffh() for a CSR-type FFH register sends a
> separate IPI to the target hart via smp_call_function_single().
> cppc_get_perf_ctrs() therefore samples the delivered and reference
> counters in two separate IPIs, at two different instants. The skew
> between the two sampling points distorts the delivered/reference
> ratio and thus the frequency reported by cpufreq.
>
> Implement the cpc_read_ffh_fb_ctrs() hook to read both CSR counters
> back-to-back in a single IPI, which narrows the sampling window to a
> few instructions and halves the number of cross-CPU calls. This
> improves the accuracy of the reported frequency in the same way as
> the arm64 implementation of the hook, which reads both AMU counters
> in a single counters_read_on_cpu() call.
>
> SBI-type FFH registers still fall back to individual reads, since
> pairing them would not reduce the number of SBI calls on the target
> hart.
>
> Testing was performed while CPU1 was kept busy with:
>
>   # stress-ng --cpu 1 --taskset 1
>
> On a CPU with cpuinfo_max_freq of 3000000 kHz:
>
> Before:
>
>   Maximum observed cpuinfo_cur_freq: 3201369 kHz
>   Maximum observed error:            +201369 kHz (+6.71%)
>
> After:
>
>   Maximum observed cpuinfo_cur_freq: 3009646 kHz
>   Maximum observed error:              +9646 kHz (+0.32%)
>
> The maximum observed error is reduced by 95.2%.
>
> Signed-off-by: Yufan Dou <douyufan@picoheart.com>
> ---
>  drivers/acpi/riscv/cppc.c | 47 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/drivers/acpi/riscv/cppc.c b/drivers/acpi/riscv/cppc.c
> index 42c1a9052470..2ca98fa69e9a 100644
> --- a/drivers/acpi/riscv/cppc.c
> +++ b/drivers/acpi/riscv/cppc.c
> @@ -85,6 +85,20 @@ static void cppc_ffh_csr_write(void *write_data)
>         data->ret.error =3D -EINVAL;
>  }
>
> +struct sbi_cppc_fb_ctrs_data {
> +       struct sbi_cppc_data first;
> +       struct sbi_cppc_data second;
> +};
> +
> +static void cppc_ffh_csr_read_fb_ctrs(void *read_data)
> +{
> +       struct sbi_cppc_fb_ctrs_data *data =3D read_data;
> +
> +       cppc_ffh_csr_read(&data->first);
> +       if (!data->first.ret.error)
> +               cppc_ffh_csr_read(&data->second);
> +}
> +
>  /*
>   * Refer to drivers/acpi/cppc_acpi.c for the description of the function=
s
>   * below.
> @@ -125,6 +139,39 @@ int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *=
val)
>         return -EINVAL;
>  }
>
> +int cpc_read_ffh_fb_ctrs(int cpu, struct cpc_reg *reg1, u64 *val1,
> +                        struct cpc_reg *reg2, u64 *val2)
> +{
> +       struct sbi_cppc_fb_ctrs_data data;
> +       int ret;
> +
> +       if (WARN_ON_ONCE(irqs_disabled()))
> +               return -EPERM;
> +
> +       /* Only CSR counters can be paired within a single IPI. */
> +       if (FFH_CPPC_TYPE(reg1->address) !=3D FFH_CPPC_CSR ||
> +           FFH_CPPC_TYPE(reg2->address) !=3D FFH_CPPC_CSR)
> +               return -EOPNOTSUPP;
> +
>
 While I agree we can not reduce the SBI calls, can we reduce the IPI at le=
ast?

> +       data.first.reg =3D FFH_CPPC_CSR_NUM(reg1->address);
> +       data.second.reg =3D FFH_CPPC_CSR_NUM(reg2->address);
> +
> +       ret =3D smp_call_function_single(cpu, cppc_ffh_csr_read_fb_ctrs,
> +                                      &data, 1);
> +       if (ret)
> +               return ret;
> +
> +       if (data.first.ret.error)
> +               return data.first.ret.error;
> +       if (data.second.ret.error)
> +               return data.second.ret.error;
> +
> +       *val1 =3D data.first.ret.value;
> +       *val2 =3D data.second.ret.value;
> +
> +       return 0;
> +}
> +
>  int cpc_write_ffh(int cpu, struct cpc_reg *reg, u64 val)
>  {
>         struct sbi_cppc_data data;
>
> base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
> --
> 2.34.1
>

Otherwise, LGTM. Thanks!

Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
