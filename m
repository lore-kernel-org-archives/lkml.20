Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455C84FFA51
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419341; cv=pass; b=mc2t7S38wdR99V6yiQZ6znwsfVw5Rjsty6Rz3v3vh6wIaG0jNNZjYi66zYXEEclfPUu3H1cO1ek9QCVWJHu8ZLcMfl/4utjirHOQzLFb4HuP6fhsaBnf4Isn+7rAtHt1dPlgfwmwMpzAYupYkKJZ4jVYiK2Nn5/00vErArW2AwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419341; c=relaxed/simple;
	bh=OZk21wfXZRb7SIDR9x4MPB+G+WpmzJI04w5Z9bPa0Qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/t3/k3hljzJ+f/IPWC0K2aK+xn+KiNLzqKuVJ68McMy3s5r0hV5imE4dWMty+0wG+s7zLgZzeO2Ia5gQL5zd87+EzcgAWFfJERKG4ZxaF/BC8VAFEnaFcfQ2VIo9WG6TPQNVruOk8zuk3bsOhT86KaY/QLYtJYcJfBOgSawl00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcEJ/oB5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mdjzv1Vf; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcEJ/oB5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mdjzv1Vf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0CDw2971018
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aGxGGeQlAinO2GjMk2zylyAL4fsr1v9Qeko4QAXo3VI=; b=kcEJ/oB5oTstvwiv
	SlGT7Go330EToKGIy7e2UHwpCIVOpN55wwnmY9TFSWLa09HS/erB0KhN6hCPCVj1
	cURKKeX/9+hsAt82MZ7pY3CmmYl5RDUyrSOevuugQB6JbiiJMxECZHYMrR8TDIij
	un6x6dGUDV7jvYqD/o5u4s3jobV/shLnGP1KH5vJSRa9/lYhzwxPbrExgbdIqpQO
	INERChVCaSzDCI3aT7LFVyd3gUzAxPuSflofBkSn3hDD1S3Ux+U+Avc1hq/8SK0s
	UGXESGCbdryJM22teE40GCtLLDVnaahHpQkt0rSJNbnP7Rsnw/WOwFKISs1ceMog
	4vqXOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x9khb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:15:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so388918585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792419338; cv=none;
        d=google.com; s=arc-20260327;
        b=L32DPU4beFQd3ELfcM2I5Rp+7Q3xRIUlcjdylclN7waYDp8X+HnKzt9EyAWa0Sq+uD
         Jyvsnz1jUpHQ9x7OC6eeCmQ7iE/z6HBr7c5JKHJvx6otaLag30b91cdQ9v6I0YNKv+jT
         mxEaO+twYbi1vBWWQgQdlO4BccOAj/BdX719QtQBYHuZ2BDH2xqu5pRr6+UZa5V0U7SC
         /NG4LF6D7EkS4ieRwXjrzDFeATYq4QpA5QjWJ9XCcgkxpuKbVCwnm4sUjpi458K+iA43
         LpJBt9GuOSZpAuU35ael6en/C1XTQAoIboOgEsChlXlSFinmiAzQharOAfCjRR2ZNkWR
         VCeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aGxGGeQlAinO2GjMk2zylyAL4fsr1v9Qeko4QAXo3VI=;
        fh=bAh+MU17ZIY+td9kPZseLIlwazDVHULp76mvb2sPtjQ=;
        b=dSLkBvJntG3lScELoypbcwhYSpdKKuh5UqqNOvxqcDdQKO9RPNeqEAVc514HaWLq0G
         AuMnn9HWp7EH1lwbtQWgGyGTiQ5IJdqbukSfgjyRQuWYZSgTv8faXjgtEIWoouNrh4TQ
         o+kynokFerkTtXsbfLx/hckXAxced1UWkMhHZvR5F/qUsuHnda8D41zTEkaJCHA1IPiy
         r6L5A3oet+gk2VUSSl8CAOs3kJ9VgjGP1bK8c/cQNgkrstj0Z1cMZ7qNxG1Iis/pGRpl
         WLCd7uh1n4X+GKf5ugXCIHwQiF7Iy4ab0MV26Es9UJQ4rVHaGEW7dRp7zJy5qIZRdMI9
         xRlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792419338; x=1793024138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aGxGGeQlAinO2GjMk2zylyAL4fsr1v9Qeko4QAXo3VI=;
        b=Mdjzv1Vf86b4pYnhquP3pmvlNrIEqGTNTUl61TC/XVNP6ik0b5SmfOHpEW43g5Ztdc
         5udkdu9G4bQaG8ew870VYUR+dMwMZiQCyyEMn0vLjS+1qIN0NL++V8OvDhXtuGpSKY8n
         NGrlYjdamm2GJ3ZhbrLgMjXmhqVC+DpIs49FqTn2Twtwxz9JIVST4mu68LkYpt4buIiF
         ndoJXMIJWZ42J2FQP8GY+1dZxIv/HbnJlTUOpi/YuswFqkftAUZYtzZFwBJY1GZvFZ+6
         5JyjPdHRSR2yI+tq/+th8Ctm4g8refgSatUT717uimxq9PwGkhqWH5LCvUr+f/rVfM5g
         9W4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419338; x=1793024138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGxGGeQlAinO2GjMk2zylyAL4fsr1v9Qeko4QAXo3VI=;
        b=JHK6GpF7GmJJUshR9/FCekL63j00b5IpoOEmEACLlu74i3J2v7CGg31U8lg/jTDF4I
         DSprw+rg3GwFwYD8GEAnPrNeIpGJTWhFtmbzGqELuuSQXVOrAx8U4UgNcvRK/D3pf/aG
         VcL3TnlCamPG6NLCkCrZvyRck9k+5PRujDpILXTdV1jrmvZSDhs5PMXyYhgSmG8qCaGB
         Hsv295PsHi+sbKKFW3GVcyFC2bOc2GX6SoVM+VlkVFnjeV57bliqkj+eGUGM878VW0JV
         7PVXE89Jlzm4AaIkB1PSEmi9jYzGJrcL1hmgs+416J1xNtnpJZ1yQ+GmmbUrsWlu7P9m
         xw9g==
X-Forwarded-Encrypted: i=1; AKwUvBxIcwVN4TNBgqQs88s1epVv2h2ofYmHGT9YMb6beBLowaT9LumaUy0MxAjL/gE5dnuX9UI+an/IqE5vRsU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUkeYnrf2bRXlgPrkZbe8NwzUKiEBkeMKQ36ngyDCfH18fF/ds
	zlBjuk154UV3Ggfs878RaSdd8fso3Vz/FYFqKFy22cjz/CV/UzYgBMHPguT1tG+PA9UROPabJfr
	SF5rGnz3N4pe4TUnKAYoz1t23YqHSEPkHbCNA0jKi2DSilnAIDSFcAkOR9MjhEbkCe3s2ty1KtT
	wVPksdrP02zhnbJqGcWbwgkM7Hpwv+40UV3ZBaqu3YQw==
X-Gm-Gg: AYBFou27ob8k8YWsv/QPjg7kBy75SsWFFjOwe4RVq2JlO77sSRKKAy8uLmGUrO/Eckd
	b+iKAzMsZCpkxfEI3ZaTVyeF7iJ3hXr5ulWEOOnlYdnNMmBZut7ikMF9Lj0mJFi191T/MvB82PC
	OzwkZorFfYz2G5MWJsTbHyZtyEbBaHnLBS2aN/dNyWsfrVCzNZAKtYMyG0uMjJZ1tlSqgXfdfu8
	txVAD1N5RNDWdoysUq2RPexyYZWGdayjB8jsgzyj63M77sfYfRHHym5D0yMrzJKsr25+jOu+IQ=
X-Received: by 2002:a05:620a:44d5:b0:93b:d79f:d941 with SMTP id af79cd13be357-93f29d8c957mr1279600285a.54.1792419338415;
        Mon, 19 Oct 2026 07:15:38 -0700 (PDT)
X-Received: by 2002:a05:620a:44d5:b0:93b:d79f:d941 with SMTP id
 af79cd13be357-93f29d8c957mr1279592985a.54.1792419337892; Mon, 19 Oct 2026
 07:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com> <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
 <xGBkVr2J5eTHzEO_i4LTjdWGRO1MXGiIijMf1PGUbQ2gEYqffgMDMtx4uiNyBldbbiW13zmcxMWZYYjJ1s--Vw==@protonmail.internalid>
 <c6d963f5-a57e-4086-972a-4f04af2c5b42@linaro.org> <324dcc61-6085-446c-8bf7-564486f319bd@kernel.org>
In-Reply-To: <324dcc61-6085-446c-8bf7-564486f319bd@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:15:26 +0200
X-Gm-Features: AclHuK-VWW--gliXBfRDzVsTxK47hAbaeQbbFKbhiFsjaFEx70drXgk7IdDdHpM
Message-ID: <CAFEp6-2f7dzz2rrNuTE=4VXgkM55qvYY1SANcZE_8TutkJ+SAw@mail.gmail.com>
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        gjorgji.rosikopulos@oss.qualcomm.com, jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: iM-IOtasfFkZS-iimJ_7aV2JpGo5RUwN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfXzHby95nBo4MI
 vwomVi4JOMoh7xqboLnYI0al2KW5Q+OQFPJOiwRbvgiRu20ENayA1786hl2BF2zPHvPpFs5VrJ9
 qHERzr3c9b+0yTWopZq45XiNThUzlIc=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad6260b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=x0i7aQ4OanKIX9y7GswA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: iM-IOtasfFkZS-iimJ_7aV2JpGo5RUwN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX4aGL6EuKQXfG
 GpWI/Icy5YK2SmoVo/REy6Mjr0i32UIDX8BysIF8z0Bwo2ffW079aBULy2zz/PvbHfFCCTNm+ZQ
 t6AWxtIROy9fZP4jtfPtS73a7SxYsOTFGXOPzvzy2zkw+XtItYmFAJ2uMKtqL8zkv8g1p5rsE9J
 eKqUGyO1yjbUDnr+RQthfTiQOIX2QM3FgibVYBzWisS9ebdrZqCgvATiasPog+e5tOdL7B6lki0
 Hhc4vJE+xTqv8w1qqX2PQuXFFgvMFfEeVu8fiSRgk6gSbZF+Usj4HYWTFEhQcTgwWMMobY9jYF0
 Bnct5PreU+hHu67t/fFVwUB6BdV3+QvUBi5O0VWum48HzBggnKUZ0lBQGBA1aOl91gECfez/pIL
 CLzmzsOkiMXs4BMB0Um4vPwwjmVem7itH78U++ITEzuICy6oxPUw4ZrgHYSCyF6YXbILFnQ8TyR
 sJVuBs6jZNP5vwzI+Lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190056

On Mon, Oct 19, 2026 at 1:24=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 19/10/2026 11:24, Bryan O'Donoghue wrote:
> > On 18/10/2026 00:00, Bryan O'Donoghue wrote:
> >>> +    unsigned int        lanes;
> >>
> >> This statement and how you go about using the data aren't consistent.
> >
> > Re-reading this.
> >
> > unsigned int trios; would be fine too =3D> data_lanes and lane_polariti=
es
> > is a multiple of trios - always three - does it imply that the first
> > three entries in data-lanes =3D=3D the first trio ?
> >
> > Presumably.
> >
> > That would work too.
> >
> > data-lanes =3D <4 5 6 1 2 3>;
> >
> > =3D>
> >
> > trios =3D 2
> >
> > =3D>
> >
> > data_lanes[4, 5, 6, 1, 2, 3];
> >
> > trio[0]:lanes =3D=3D [4, 5, 6];
> > trio[1]:lanes =3D=3D [1, 2, 3];
> >
> > Probably "trios" instead of "lanes" makes more sense here and the drive=
r
> > just always validates that count(data_lanes) % 3 is always false.
> >
> > ---
> > bod
>
> I'm going to argue with myself.
>
> data-lanes =3D <1>
>
> =3D>
>
> lanes =3D 1; // not trios no need to introduce a new term

I earlier recommended using "trios" in the other C-PHY series to be
more accurate and emphasize the distinction from D-PHY's (two-wire
lanes), and because it is the terminology commonly used in the C-PHY
specification. That said, I'm fine with either term, but yes, we
should be consistent and avoid mixing "lanes" and "trios" within the
same structure.

>
> =3D>
>
> three pads on the Soc
>
> =3D>
>
> The question is - is data_lanes required for the CPHY opts struct ? For
> the qcom CAMSS case the answer ~ always no - we will be attaching a
> sensor and will read-back the positions from that endpoint.
>
> It is conceivable that other systems may want to pass data-lanes down to
> the driver because they won't have a media-graph but, I'd say we should
> arbitrate that then - leave it up to someone who needs the fields to add
> them.
>
> =3D>
>
> lanes // the CSID and PHY should agree
> symbol_rate // so both the CSID and phy agree on symbols per second
>
> Remove:
>
> - lane_positions
> - lane_polarities
>
> Since at least for this series, they won't be needed.
>
> The CSID still needs to know the number of lanes and how many symbols so
> that it can calculate bandwidth so .... lets just include the data we
> know we need.
>
> struct cphy_opts {lanes; rate/symbols}; dropping lane_positions and
> lane_polarities.
>
> I've no objection to the low-level timing variables myself but OTOH we
> don't require them at this point in time.
>
> Perhaps drop unless/until someone can show a need for them.
>
> Excellent bod, agree with you now.
>
> ---
> bod
