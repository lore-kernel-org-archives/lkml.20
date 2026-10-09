Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD7C399CE9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556810; cv=pass; b=bXihjyUFvxgDjsXNklZzZlPrNldD7jYA9YGIHmUoPRb2o6QzVIAu8wTxE2Jn7N6ytVhlqW91gZTuIjf/wL/ZMU00CVHhC/hQEoFf61+a1x9a0PK4V1Db311dwgB0k40K49eHaGCQbxt5z0P0KykdsCpAoyHE+4fuwFiDtqpeRK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556810; c=relaxed/simple;
	bh=JTPddtxrW73Lrd3byEH3IKo8/W3YU2i7GToZvzEj4qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k81BSNtQC/6xBfDSs1UULYr++JxcfZkH96+xonGug6lT7/MFo7XzOKD2vxIBfWva5WyDQyF+p4vxotaYBTvXDIImdF7c+AFYZ0TxSKOYqfm8MMH5tmguJpFGi18pOq9nvut8xJv0vAdd9l6i3uhKSFFSlyezmpdngtMnxfWCxnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEwBJpQF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LqLskn0u; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEwBJpQF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LqLskn0u"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699Dkqsl1374820
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 14:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oI3ezl+n4MiIBxKoGsxgWBJshhguw/mDEnDrtpu5wV4=; b=AEwBJpQF+HZELJif
	+dli8QDseOEB5D1YjoRFgSWX1/nD1zSmvyIr2DpOA53QcNWzjF42YPuXyjjGc7T3
	rAsYcE0oYm1AObdFuuq2NIxV0zWn/UP8e7t4sF2BMTQfmwFZle8LFngFDKEJHaxH
	/jCZbh5HsMG24gZVv7r41JUJMoynbAv85qULvl462KNUajhAeztKnyVI9TDphZHd
	sKIdMGy+AXD9WdFIsdERdt3s4obCzAUGz6hYwWs0eWYtuEXZ1pMIUD7lBRn2p09S
	4BE+ijUjvyIx4tPoNYuuaGiXTrwgsHLJVp+B20rSr+kFAJZ391t7RTC2yzI3yWBh
	g6OxdQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h71f287ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:40:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a3f673221so1767339685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:40:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791556807; cv=none;
        d=google.com; s=arc-20260327;
        b=MNTlfIcsBcqGe/BMFVeEh9LaCtOnNQ30twhaAMW9JHU74qk2rUacEBmQ/kIVLVmuAp
         aQss/l3Os8KzyD00aZHyiiQBf4084bHk6ZUMMWrB1OE7lwdReray327N3hl6qe2qT9QJ
         jVc/K9GiBaNF9pszXK2Ve0ehP8B/LARsV9hHJgrTfvE1SvTHs4IPeaik1HhaJN+TOxIX
         pQG2/apHNdf70rU+XrxoBZ6JNBITSZB7jrxqDTt57NerpQoWUJ2avjHdcHB6gmUTNZ50
         K0jEbf8B+J7m5Lqcngyv8nmvB6fdy/cMjhdu2Y6gHeJCL7eKC/bPYIkBH5yfhssgyRaP
         fChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oI3ezl+n4MiIBxKoGsxgWBJshhguw/mDEnDrtpu5wV4=;
        fh=/BDq2cvzZ1BRO37r7JazZHw/07RlG4cif96KQUhBL6Q=;
        b=Hah01xABTqtEDdjHdicW1H+0dflNUMYMSisV02xT3GjRwUrJNctxv18uptkzVfOlJg
         +912En5W9+rp9mzMy7dvbMZ2zsu5fee28huPFXTf402huRxTo4GY+WFniDa/VoxJbsWC
         NetGIps59AJn8lWzplg/ISHOIKKGguQwfs1a/RnINpzwsZ9RFGaUdtaslega0PCmoutk
         GZRdy3vhKHzbQfiDq+Ykxep+yo/H0yY/OOiEh4Do5ULjNDzMl+MMkCRMY/0X7RhaQiNt
         GWj3lvcUzvQdwGXT5yeYOtt+Fvj6rr0S3+JUNUDJ4XqVEiF7aJlfyGRkleBTOEJbYOxd
         mHsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791556807; x=1792161607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oI3ezl+n4MiIBxKoGsxgWBJshhguw/mDEnDrtpu5wV4=;
        b=LqLskn0ubw7IqJ3M3LxtGFZFZtPbyge7R9b3ibonuwTeXLG7ODLq0kofbJAeZYJ8+5
         AFcssqz1PSuGMc/p9GSxSyiv6wLwgRPMePhg1vx36BxEMufiT5d2irrnwGiKUnzz9/jG
         uRrTmvY2cKzw30CB8GqLUFUq0pkqRqNbSTPgjkG4xJtLzVEOGNuyStgSYtoWM2s+Ysip
         7cRud9Uduhz5GCOCjWwP3aa7cz/8jZ8UaDJq3ZGjAuexGcLYmv85eTM7A3h3JRJDSb5Z
         VjyOD0CrnJHou29+cX1ylh53IGvnti1hOfPAy2K+Zo2DvcnSr4YOJ6t46jjDyro+dXm8
         X5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556807; x=1792161607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oI3ezl+n4MiIBxKoGsxgWBJshhguw/mDEnDrtpu5wV4=;
        b=GwSn0x//G1jhRPpBOZcX1KXWp2oviYnYvu+YFYl+w02MWJs9Qua1SH0Il1mGRYUzV0
         2Ku7P/MVTEzjLWlXdtjB48QK3iLXjwlAg1p9tWj7nGuLjwRDqjRi6+qFvz6YixGggqUU
         RlHqZKAUP0PtkXNVfz3U/EkTxSzT5AOk0JtD+mKtfJ57Lgr0lr7vCu7+mxtmktMMs16S
         MOBQZNHfRkIVsRltsBGm5NU15uJ+YTzDGuHywy+Hfosmqj6qRMz1me345axb+V1QJLs9
         aufTzsLUsAONZdsWXcpyweqXtkeEvCJuswq8m9uQ0h4MaOA7O+CJ9a/hoI8g5xOGu6OA
         aESg==
X-Forwarded-Encrypted: i=1; AKwUvBzLR3SYt6ZT/cn6w9yWxWEqjNc2674UNgqyZiaARD1EB8j+2zV/1tgq7Mx/s/34OYEru9HY/1sIwduO+pM=@vger.kernel.org
X-Gm-Message-State: AFuF++nIlf84M1nuiGopKlw/cVQtUEfxlb2+oZ6z2hqQQYHHxSxSCL4m
	DVmmXXRf3Y/GCTUPIQxEVYlNnyawUjb02onxMs/LImzmOlgrKXuGY8iRWYvpbHzdJ2xLQBR2oNn
	Wn8lRK62FJVZXwUD+apXxtZjx6F0ZwtcSQShAx2+2Hr+BUDD2y5RkwoZKhr1rXe/n/Y0DthlO2U
	9XB9jIRBotkUSfMrWNPxWRFgA13KjlGTXzee3a/uaauQ==
X-Gm-Gg: AYBFou1tF2Epe9Kma+/Vu99rD55fPBhV9m+TDkPaK0oshHVNQdHQcHXEAABOLslTmWD
	Px4wDPWyDEDjrKY1RIe6eCixQrmaAUzoqA0n8LTfLUn45MOKWBWj2EP4A96biTcNljlLaju4nCR
	hjbr4/WbrU986Me8pgZkwWsu4KXOZ/BJXdkr4tGi4WafmoYx45hSQ3l1slm+gtViqbq97fsYYcf
	gisHklgZAUg0zalTiiy7ASZwdnJ6/JBj1Hb+xo8guBxE5DztOZaE5rRvDm+O6DJuO55Z2T0nsnl
	rLTWLl7jSG7bQ9qF5g==
X-Received: by 2002:a05:620a:1d01:b0:93e:8542:4f4d with SMTP id af79cd13be357-93ebd2923c0mr307218785a.57.1791556807009;
        Fri, 09 Oct 2026 07:40:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1d01:b0:93e:8542:4f4d with SMTP id
 af79cd13be357-93ebd2923c0mr307211585a.57.1791556806436; Fri, 09 Oct 2026
 07:40:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008230725.3228-1-okerixx@gmail.com>
In-Reply-To: <20261008230725.3228-1-okerixx@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:39:55 +0200
X-Gm-Features: AclHuK-KEBHBU7JnA4O-_Ixe1AIJbaoKZCZKIAWioy0RNObR2nZvqEeX3Rl1-Q0
Message-ID: <CAFEp6-0vi0_xWGbXUxVQ3APvHMsWgX+_AUXvJDs0FZWky73LyQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: qcom-cci: skip core clock rates the clock cannot provide
To: Oleg Keri <okerixx@gmail.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfXyLMMtwVCBoFa
 /sFcw1biZj3bcRiUwFnChTV6JTXE7tcZQfB4exBWfOS4ddFNs0ssEZY63ehIfzYm6JznVQpPmTW
 HhurizsC4YRBrxr03AHj9G/PVeMvzjY=
X-Authority-Analysis: v=2.4 cv=NLBAaE6g c=1 sm=1 tr=0 ts=6ac8fcc8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=BuF8_mXB32IIVKhl71AA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: CremNabgDYs42YEB2UvCdkA6ydUg62nC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX6tyACaXfbzSN
 u6Z0kPY+ySgaaqhfh69wvtwCEhdQ87g9MbAHjnSGbOMsz7NkR9yG0djRwcecz+lBjy2Fsl2Z+jm
 Vxl3/x9huGjMtXxFzzI8SmweGtptoU1tGQ64DOHEqnk2biZRwS2HUCKt5H/QyAmKXKx4aYYsL/s
 WWvSS18Kr+6XXa1n0nDSArP5FfeWYm8/GOFEjpPKLJg0cDHQqb7RmbxYgc5omdVmTLqBmOvcuyr
 gwN1wKgo7ydwTfvhdJveppLKW8OnfnxVerqXtXVWZkScGw8qWC/0JFPogWtUZ/C/+SUIL3tM8D5
 DIANzlySL8JouNpWigHABQK6tUX4T+TQ8K9QCJTO1hJZXY1ixTZ5Dj2JVv0zuXf05cnS0i9tpQl
 CgVeQ8hXmDyi7/sd0IstM2OULIbRn7U9G6qdHoCC308EmiSe+ZqJyDhuvdl98HsZBhlUvooGsKm
 z5frGFZT3stMj54BBjA==
X-Proofpoint-GUID: CremNabgDYs42YEB2UvCdkA6ydUg62nC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090058

On Fri, Oct 9, 2026 at 1:07=E2=80=AFAM Oleg Keri <okerixx@gmail.com> wrote:
>
> cci_get_required_rate() picks the lowest rate that has timings for every
> active master, but never checks that the CCI clock can run at it. On
> glymur, sm8750 and kaanapali the CCI clock table has no 19.2 MHz entry,
> so the request rounds up to 30 MHz or 37.5 MHz, the timing lookup for
> the running rate fails and the controller does not probe:
>
>   i2c-qcom-cci ac16000.cci: CCI clock is not at expected 19200000 Hz
>   i2c-qcom-cci ac16000.cci: no timing for mode 1 at CCI clock 30000000 Hz
>   i2c-qcom-cci ac16000.cci: probe with driver i2c-qcom-cci failed with er=
ror -95

sm8750 and kaanapali have a single 37.5Mhz frequency point which
should not cause a probe failure.

>
> Only consider rates clk_round_rate() can deliver exactly. Glymur then
> runs its CCI at 37.5 MHz, which has timings for every mode.
>
> Fixes: fa1eb3af12fa ("i2c: qcom-cci: Enforce the required CCI clock rate"=
)

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> index 6d8be7b8b79d..289368c00fe4 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -586,6 +586,9 @@ static int cci_get_required_rate(struct cci *cci, uns=
igned long *rate)
>         for (int ri =3D 0; ri < NUM_CCI_CLK_RATES; ri++) {
>                 bool supported =3D true;
>
> +               if (clk_round_rate(cci->cci_clk, cci_clk_rates[ri]) !=3D =
cci_clk_rates[ri])
> +                       continue;
> +
>                 for (int i =3D 0; i < cci->data->num_masters; i++) {
>                         int mode =3D cci->master[i].mode;
>
> --
> 2.55.0
>
