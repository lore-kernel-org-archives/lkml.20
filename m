Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118840;
	b=QEA5K6a/tjiL5hTkxLy7EGJGFg6gAHbx5cL3IY31W5vcuVeosM3urmKtGx8sQv/UIMoF
	 BOxkduVqxZ38CzN5vCXJ1H21ggFNpUH3lsmYKBHBSsA46fhuqwMSNY7h7KspQZ01uEXOi
	 wkP6PTk1uZWO/YHyww76NAU9UrAtkclN+Nm5Vh6jUVeXge3viS/XkQ0cUEDEqa7ezGXpA
	 ir9NxrsQ1sn9cto6pRXdssZxCzwXpiNjjaAGbJuMxtv0DCGNKFWZn4I4fzCvlYbed/Xcn
	 28jIe0d9yUWO+ApAQIlIKmz9qUAtPJsBtOzGCXSe4TETv0mKuWT0x4ZsWg8WkQKYlvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=;
	b=V3sAnrPMF1k3gqZuUwGp//rx4Ies0aF6MrDFM8LTqJsIJnHNyfyujCsPsL5MFLanY7na
	 cIi0paaP+6qOGm/Adzko9/wCnXs5JhEoTrPC9/Odgi0KN5XEq5asJGFRnAzdrANYG+X09
	 uVWQc67KLvjGWSmSHFazy7ixrJtDSaETBTJtnXmZh7LYyPlInhnYVtKMK7kD2p8ReeG4D
	 r01dA4rxm3YlucPBeD2o6dzvDRpcEJJDIv2wLGxuY2Dzk6NCdPcK8QIeqWobrOghfiByH
	 SQgUFRtG4EJ5iRXhZmdSz29z1o8+cZEm8gvNH76jmEbGjRUipnfcnW7p9Ey0G4oYcOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U6pJPW1a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDsh1nvR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43087606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43087606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U6pJPW1a;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDsh1nvR
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RGWXYi3802199
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=; b=U6pJPW1a9PcPo0tq
	HaV0IZjrwONB2IQ8bzDs7E6/FnePQJ2g1yuYzIeylDAxd2zPmi3gAfb5mVOJCC/S
	kH9fipkT6AiMxzac2Ft6xTvMY1VPJ/q8ugfBq3A9HctgWvpfrCPORejVHcEz2zil
	JkcFK+z6ylbkuRUlYc+o0moz4R9bwUwXc79smGrvPRDWzDGq5iNA7aaq7OgaquxW
	AcxV1b4PI3I2W++lPG3MTM9RDPCRXZU6hE+utM4Wh3FDwgxnl3kjg3QAVHif3q1J
	ctmKvMbbDQ3mxBTxd++p+SnsoFdaQ3gC1q6Xl2J9QXVfnh6RhaqjHQfURMNC1LGy
	o9eRKQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpr07s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:33:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so765502585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:33:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118838; cv=none;
        d=google.com; s=arc-20260327;
        b=j0IVbVZ4+fxhMMV4LXWgOtm0rhcHhTktfEAXgRTe4pp7aQdJomWpIz0C7RIFV7NTzt
         AdVy47UfnlUnrykH537ro1dpqbdZ+mwbBxSJrSz1SljZo8aVtqFJ1xza5WiwmsrkeF1g
         m25Ur5tjm11oOajQEOFUaDUezfApxtaZzZnByH3QlZTVDaxRbGD7KvYhlWPfiBJaeTdX
         dQppx7gGXIHcvhYgOvIfhILFn1oToCHpJLXAdOEemBUM/NbNGh6v+1PbUfdDkkHjkBBX
         kEQ+NSD9oY1JElvae0G7x3wCaXD+jKOdkz10h7M+BK5g1GrkPrznxyDbIlKmzr4wCW5R
         nfAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=;
        fh=0BJep8nLmMc91WUFyqBYIqpBMLDVcnn1OhowMhNP6C0=;
        b=A1mOYwE+qXa8WOpvSiu1OkWv8xOWJYtSpvrE4grvRSukjIsfeA/CvHoeEIVi4KbVjc
         LHJQmuSrxrm/RW41dHYb0RaNUL6IXXH7smXhekbJqm71RFIueWg3D7GucSLNgAMrgwIZ
         FdsuGQAs6JYS5IlkmKGwIn3ryXMv6TmECncX7E65wwVlc1ONLOZFmIvZZyAZkHBPNw0l
         fPTAnLxKIZtcZF2ZjL1PN0mVyEdBfUhOeIFM6LqEyGsPG9X21WYu7163tmnIhKxJ4scl
         +Vd+5EMq2YUXZjPV9jP9+PFOVacM9Mdvbhn4BKhNvaLRWSwsfwmcbDk7NepRr2XLpDEV
         5LYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793118838; x=1793723638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=;
        b=GDsh1nvRWiinXQtkuSsj6zMKdAtT8BbL3opnTlAjy1Lt8T859k2r149YTyFNxV/2Jt
         hiV6guMQFK7hJNT+5Q+TQOIiAEi5xQv8CoIxo2w5HHOo4Xtr/zzsqCLJwMz144Ig71x9
         +uBiROCMUFjaCbYdluCj8MhkZgIGjs9meZAlc4kW8KH4XzWZpQxCKHt75v+0H0lIb9a9
         nAyRftrZ5rCmivB3YnIhBpKfy/vQM/9YU69vJ6vvXn8r6/AXI2r9ndaG1onbdhBtNAsY
         peF1VVYA8Uc/F3b7WhPKakgbtFSgy3lHm14OIoQpK76f518DKBmXuxl7Z66n+n3006/Q
         FvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118838; x=1793723638;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=;
        b=GrJoBsuK2DlDrp6fCJ0HsXB636xF4gwdNsXZHrfdxRVBw/H0DQxE+1MOmo5yyappBj
         mLIDeLorlOEqSIphetBUkK/7m1u1VwNK6sgEGQ/ob4xsDSCjelGz9MCHbsAhT7Nie3+U
         PTWDTXxoZtQ3Fk2H7zTu3Rc7GuDTND1ZQf94rZg7bUcYteqMDiupq9hqbdvwrXQwjIYy
         r9PvIW5inUnLjnYr2KimLfWEffzSIY6PffztwhC9n9+w5VXTbOyCCGzs3jY8NZrDnSVC
         avgZt6gKMM9KkCxSRvaZ/smg8FghOLFxjQjfGobTvHKEMNDAxDo5VJgpoX+KpXe81Wo7
         tNSA==
X-Forwarded-Encrypted: i=1; AKwUvBxK+1jmjLZt0FTs9J05m50kOnfQp2353WvAbotca5Wb7SySai09IAUnGK/OzBRdwzMdkX2G1bjVMctFkw0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDkGh8dI8S4BnwNqKFkW3VhAmDZHSMchBRLIOuNVA0PnboFIrP
	JzmJ+QbgHDDy7HCIIWqTQS6xbTQEYQ9l6KAUkopNLBMK3PPQ2ft5ogwwpmRtXN+EImqscBEWyxh
	sso7vSPSQDMh5gdwMdwHv0NnSHqlHS7Tlw2M/U169PLoQ8/qeZdQWvmVEOPNJ3raSFogbnA3GaC
	XYh22EaMWhPJ4CU0uUm2xqA3ai9x7e0ASP49tcBVTeVg==
X-Gm-Gg: AYBFou2BPxYGiTV1SFZc49Ue8DQgTqy52PLUisEJCfmd4ZzptmopOCtf4GgQO17FTYg
	FJfyVaNhI6+hQXWgnQnVwqxnVnq1PviD4Xpac6h4RKlb4UzBH2w6VYCbMopAPcP8w1NtigsRhIe
	nM0/IHEpPh1VrD/WzYEeMGFFZJsS1MUpvW8rYyJuG7d4//Z/3wX5cEKZIuGhDT2e4rnVw0RM4LD
	gECWjZT5nEFcExy1N3Q/Og3Bz/lp5VCuy6piNv9j4fP9laYLfVdV5G2Q0wigykparjbIs2oQkrS
X-Received: by 2002:a05:620a:271d:b0:939:31b5:4e08 with SMTP id af79cd13be357-940ef6833d1mr1472842585a.0.1793118838206;
        Tue, 27 Oct 2026 09:33:58 -0700 (PDT)
X-Received: by 2002:a05:620a:271d:b0:939:31b5:4e08 with SMTP id
 af79cd13be357-940ef6833d1mr1472839285a.0.1793118837619; Tue, 27 Oct 2026
 09:33:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-csiphy-sdm845-limits-v3-1-c58917e14107@ixit.cz>
In-Reply-To: <20261027-csiphy-sdm845-limits-v3-1-c58917e14107@ixit.cz>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:33:46 +0100
X-Gm-Features: AclHuK8j4mStUHhryvskQijmxQMRr1T1BTPG7p5KRrujFPF0uIKAlxEAa6i54Sg
Message-ID: <CAFEp6-1N_bUQouuLqLJdLWXx4e4o_8qoKdwa7CD-D9Jxd6MhnQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: qcom: camss: Don't reject sensor links faster
 than 4x the CSIPHY timer
To: david@ixit.cz
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2NSBTYWx0ZWRfX7caWoZDlmM5C
 dSfUZ1OPfVliIV6iOI89ET817d4esUmI9fv0fpAUpwxkslJYZ115U2+NDOn8PngwXjqrSoh03xe
 oENfaMgQ5FZ3pZ4Bkn01ZqjD06pegSR+izaUBMKrmpMFgDVVl7uXVW3kQfQ57cmhlAjpP36a5qh
 KuZG59723G9sKPADVCzOC2JHjoHqAGNGYNm8h6C+P99yRmptJO9qq9YSIPmA9gVsfK5b84hF6nQ
 ZWH4DfSRmFniSlJbB/KHE+RjqSYagtRwQXWwzuxi9ULeLB07obGS4Ip+eGg8o/SqGY1u5zPrfiy
 QCBo1BZY7NG9C0ftelK+STOpXHCo9e3m/fbypM6BpIwTJ0lOMAmyz7EFLZJXt5lQdNeoI2NCc01
 6GRrQw9mVEuvXYKAS3I+cEjMd1UbQoKtTbeHFZ7jgTWZwau5IyW0CNZe4Ds4xb+NFMIam2K3jMm
 Pco0hz7v9CdiX4PM5DQ==
X-Proofpoint-ORIG-GUID: lpJHYtjxjIQ1THt71W0haJ0r8TAF3gYt
X-Proofpoint-GUID: lpJHYtjxjIQ1THt71W0haJ0r8TAF3gYt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2NSBTYWx0ZWRfX66YBM0Tvf+Gd
 0DHSvGZz+FLRfiesqWEGj5+xD45wHtdwOHullCi5lotGSyWBZqn1HGT1FL0L6LITNB+q7juAfM9
 C+/SdI/3zSQSR2SFlsH7oVX6rt/mUL8=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae0d277 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1LqAIe8ZLxqIxhs1lXgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270065

On Tue, Oct 27, 2026 at 5:15=E2=80=AFPM David Heidelberg via B4 Relay
<devnull+david.ixit.cz@kernel.org> wrote:
>
> From: David Heidelberg <david@ixit.cz>
>
> The timer clock has no such relationship to the link rate. Both the 2ph
> and 3ph code use it only as the reference for csiphy_settle_cnt_calc(),
> where a faster link makes the settle count smaller, not larger: at
> 269.33 MHz the count converges to 16 as the link rate grows. The vendor
> driver pins the timer to 269.33 MHz for every sensor (it is the highest
> rate in the SDM845 clock plan) and streams this exact link with it.
>
> Clamp to the highest listed rate instead of failing, the same way the
> unknown-link-rate case is already handled.
>
> Solves issue on sdm845 that caps the link at ~1.02 GHz,
> so the Samsung S5K2X7SP, ~2.3 Gbps/lane, link 1.15 GHz) fails with
> Pixel clock is too high for CSIPHY
>
> Fixes: bbde31047434 ("media: camss: Use optimal clock frequency rates")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Tested on SHIFT 6MQ with sdm845-next-20260820-9.
> ---
> Changes in v3:
> - Added R-b and Fixes: tag.
> - Link to v2: https://patch.msgid.link/20260914-csiphy-sdm845-limits-v2-1=
-622db5a6ebf0@ixit.cz
>
> Changes in v2:
> - Drop the camcc change entirely; the 269.33 MHz ceiling stands. (Konrad)
> - Fix the check in camss instead: clamp the timer clock to the highest
>   listed rate rather than failing, matching the vendor driver.
> - Link to v1: https://patch.msgid.link/20260822-csiphy-sdm845-limits-v1-1=
-d360bf7cd38f@ixit.cz
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index f99eea2ef2289..985171276ce47 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -159,25 +159,23 @@ static int csiphy_set_clock_rates_legacy(struct csi=
phy_device *csiphy)
>                         long round_rate;
>
>                         camss_add_clock_margin(&min_rate);
>
>                         for (j =3D 0; j < clock->nfreqs; j++)
>                                 if (min_rate < clock->freq[j])
>                                         break;
>
> -                       if (j =3D=3D clock->nfreqs) {
> -                               dev_err(dev,
> -                                       "Pixel clock is too high for CSIP=
HY\n");
> -                               return -EINVAL;
> -                       }
> -
> -                       /* if sensor pixel clock is not available */
> -                       /* set highest possible CSIPHY clock rate */
> -                       if (min_rate =3D=3D 0)
> +                       /*
> +                        * The timer clock is only the reference for the
> +                        * settle count and does not need to track the li=
nk
> +                        * rate. Use the highest listed rate when the lin=
k is
> +                        * faster than the table covers or unknown.`
> +                        */
> +                       if (j =3D=3D clock->nfreqs || min_rate =3D=3D 0)
>                                 j =3D clock->nfreqs - 1;
>
>                         round_rate =3D clk_round_rate(clock->clk, clock->=
freq[j]);
>                         if (round_rate < 0) {
>                                 dev_err(dev, "clk round rate failed: %ld\=
n",
>                                         round_rate);
>                                 return -EINVAL;
>                         }
>
> ---
> base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
> change-id: 20260822-csiphy-sdm845-limits-b1e3dbaf5d38
>
> Best regards,
> --
> David Heidelberg <david@ixit.cz>
>
>
