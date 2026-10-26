Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793029434;
	b=YbJNBfL/TW/qHUXLKtmJJwuz+6esFb1uVmDYUO7mQnzBUxvhSMD+qBxb3Kh3EmSaMeQJ
	 6mYKAS2IU0iUgSWutIpBrfPHuHlgHfz/+l4JJvCUfVjOL4jXyp+IuvNeUgVGLzpKXC13P
	 w7bSoQPxfgx7IwRA+5Wch4g1LGzk1kBHNLKA7FD7onM+4xfyLagXp/3u8xZmF9s4Yr6nQ
	 DGrMC0XvDkM8BxT2UhGy3J8+cfkIcabkhz+4eFE0j+gQIO5q8qjGKAAk6Kp5QIKureVRA
	 trI6ewl8gLusQC6CxRs7fS0Vcd8RllE2PMJQz++rCPMZCxgMTZEedWvN4iVxQXyR/SA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029434;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VAayBo4wWky6fLPwDPFk8Yl4i591bmPBQpuVqEWBml8=;
	b=wWf0OP4cVWVgmTybPRbnDJIW2xooZAs/G4d9Mdtvy3gMA9r+VzaCaPsdzgmCeFRLAH6s
	 MYYWH1E1cf/3sRy3ffxOruJjiaKNKf+MqQylmiZKjGU6NqGRCAgY0R1Ii2NnquuGhv1ue
	 6i48AHuEFnHnUeoDW+ACPi3NUl0lAmUZJr8hLFxKumgiCDtT+ttpxbRJbhudPyl8Hbhfn
	 Tmbvz5aNfriqq76ZwivkYSomuZB9UniRZiJ4ZLFlxqpGhGmtwVrOpiJMJsmalnQw13sVy
	 l9QUKkt7P+WPJX6Vvl0KVLjMSgtdFzEKzcbB36KpmiyFMZHA0peBGc7PG1c5DCOO9rA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IkEjWRiy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xg1TXosB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E683606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E683606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IkEjWRiy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xg1TXosB
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvmWr4168179
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VAayBo4wWky6fLPwDPFk8Yl4i591bmPBQpuVqEWBml8=; b=IkEjWRiyOlxCruq0
	JSnKKu+BpfsO2rKdWcRskAEPFbSQG3Q4Mp5lY6t9F9TEes45H0uJuGoPlYwO3buv
	09SFvIlRflSdiV8tut4gJSuRe8B/scZ+nZH6o2KrOAdn09mEoWvFkLx7Spod6Gms
	UVlnZjwZ2XwtiQgTazE1DWWnWOl3jcEM7jTwdcD3ukhHC7pVkBGk6Pf7uQCwSiw0
	1Et66oHUd4Qj+wCwFVGpyYjn+2hGcvXDAZxqB6pMuqI+iRuYOhp4oNp6OX5RpuTd
	IVI4EiLkFswG/1xOHPpzl1l6tCfGXP7ZsuHrrlitGe4Zc3uEGPXRKMoWwfaVplL4
	3uJjeA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf19jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:43:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3969a2a7so565494785a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793029432; cv=none;
        d=google.com; s=arc-20260327;
        b=owZlOAOXjlGL02DUeAT/6LCSbTLp/ZGLb43D5/GXa/IT+hSclTYBknxms6QpAcAJ/r
         dL7rGEeIayvdLMvhaOEyJiBwK/vc5AhLHlVXtR/ricSf/GpcC7bSI3CVNMF5ap5cj4o5
         8yOBCmTmfKWExua34FOSpC147VOr2YpU1yBdqfcHRY0I5K3hxBTdZ8Ri9MbmTFIULAYW
         20uxmB6ejst8Vikvyk4pEMpwerk43BBtUFnjcklNOreTAoyk8n22wgtE8UefvDGvU410
         +goa1pC7mCBgYB7opldGYWEns6Y78ZcAYiy89SjXbh3xMO56C2BFzp7LqZG5AaZlasy1
         m4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VAayBo4wWky6fLPwDPFk8Yl4i591bmPBQpuVqEWBml8=;
        fh=QEtpgW9eePiNojrLhNJzyESJl1pWj8CUTzRUvzaSaHY=;
        b=p83R6ZAIJr4gEFP0N710ge/JaOWVmc9JOlahz/f/uhYs/Yi1DqsEOaA+KS0XEsa18+
         yc5Zob5hEvZ0WW6uDFD3oAMcYwH43YFvjNm37udxKgJsslYRoVTu9//gX/KB2mc82b8z
         fOkfWb14jpslm8ARRgYRPk8f/ZH5ntB7ThzkDKPMKBqAQC1dUJD1G16opOa/oN3Zx0Ro
         6QGbvsPvsMeafsqf0yL6ZAafHg3x5GHQM3uE6h4iiC01XrI6PULsl63HT1cs6WGcnpIG
         u5+YP+DbYTU7USQbDPn/14GWdEGqLrdyRkRzHy/V7h+Y7kOzNiegPYV2TRyogCZ7+NJn
         nPRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793029432; x=1793634232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VAayBo4wWky6fLPwDPFk8Yl4i591bmPBQpuVqEWBml8=;
        b=Xg1TXosBjRW85fX0l4iKrvf4WQTSKQNoTq7GSWklKx3Q8Ihe/dvXc+JkT5RzY/CQBA
         F/gCiMtZ6LgtYWezTHAdlUsX7KmaD7KgyGJho1uNkb2W5AUDQrZRImlHzRzZXxwNsVlg
         fUShX4fGWYMiVZu1cZuBcIOPsQLJbfap8oD6WX2O46xrr8bfeYCaNcWfEuS4k+z6DSLf
         0dHIsFqkBd7fH5Ik+RDDLxJYalzZYtSjjyuavCULOb2sJ7whJHbdHBii/0r9Dhe32h/h
         3TTVcV8L8gmLQRk+lJNmMARWTk8AzR8Ay60V0g8MJNWjKravwsslJ35Ha3qK4aYRzsg5
         M+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793029432; x=1793634232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VAayBo4wWky6fLPwDPFk8Yl4i591bmPBQpuVqEWBml8=;
        b=kRC+C9lhHSx3RNojU2cU/hMGZLyAaAV+zfxhDDXHaEr31H0XYoIP6Yo3J5k3csLuZ2
         2Z1Q4sdHVUUgUgw8r3gDec5sa08SoGQZFqEldKC1EoORqQd5BPukNZm88jMj0TVkwFBO
         D9zdfa6Yee8wunILh+o3sbMSuSYY/VstruISyXVkyoilplrJ/TLs8Yi0+d7AeXYef5rr
         5cqI+HNB0ACQeaEH4qkBvLwKnLzforUX7vmkdYFGSBRlIHIdv481jtdcqrs6Lg1CKTNS
         IO3YHQ9QgdK0UzPohwcU9pDJs+4Zcafufq2YThIjkf2wtWF+claxUF8yRKpykMYN/dry
         qrjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDn7epdRgC4eFKuyFWYKVxgjaI5wszKravUi3i3HnW0MTZ4qCCSFaqn2vmPkILKDoGhyS1wMiXJEgsQqQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaLrlY6aQuvRPHE7eBhXTRVUFVdBq9R6K0qRvLSM67ZrjShNkw
	1e1k/90Nny9h2vsMmd2mEQlnP4kQzP+omvYbInj3Wn4UtQLLMEkcOvhZm8vQNF/mLm20RZcwRIY
	+dBnADTg0yKQTTnmi2FV6GRauUCsVhJtaF4rxfrEetlYFezK0xOQBEIcLKzlVoqRaaa40sbIBEV
	XikYOR67kX0nUYYd1xIMsQcLQdbQ9uGFAJ2Fo5e5v8gQ==
X-Gm-Gg: AYBFou3YAybdp70CT+3qQ2DHJa+DHcrVrX6uCdP7/7iqAlxUXxXfwvYz7gDA1QBLYjw
	BgT2ShoZo2/RxBwBvRBrcijWo2L8YmZeQ+tFQH5yYXmDAW/iPP239InXvqp38yMn+KBPIK+g5J/
	kt1mzShDBlgqaepdGOpb5CJvfKcmx/FdklbY4H8o8cyhUzgPr1KDvYyedVr4RB+9ssToBlHMhaD
	eXOiPqkmF1imaoIZKRAVL4llNCPGMp5YhwN8m018tF0zrET8nUylG5qcIwBVL0ooGrXrVsLWxaj
X-Received: by 2002:a05:620a:2849:b0:93b:d79a:c45f with SMTP id af79cd13be357-940ef980fcdmr1135318585a.55.1793029432375;
        Mon, 26 Oct 2026 08:43:52 -0700 (PDT)
X-Received: by 2002:a05:620a:2849:b0:93b:d79a:c45f with SMTP id
 af79cd13be357-940ef980fcdmr1135312885a.55.1793029431821; Mon, 26 Oct 2026
 08:43:51 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
 <20261026133726.3249235-3-atanas.filipov@oss.qualcomm.com>
 <CAFEp6-3WQyjjFDjUMeVD7QDAK0VNhfD98XFw2YYJ8FZi54yypw@mail.gmail.com> <c9d017f7-f072-4533-8b2c-a87ed67a8712@linaro.org>
In-Reply-To: <c9d017f7-f072-4533-8b2c-a87ed67a8712@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:43:40 +0100
X-Gm-Features: AclHuK-WG-4gcISyaPUABijXSKs-Maj7Gjbye3YNiujrTyxXvxIZ6qWwMAmUkV4
Message-ID: <CAFEp6-2NoJEfH7cT1jwtHaeQW-__A7OeCJ2rY_j4f_65wHQM5A@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MiBTYWx0ZWRfXydYNGeeVG1jE
 CU2/EHb9hUEk9TrdjLAUsHzzwc46sZ9Uu1j4S5AxYDsmF+5r4eF8cVPGlCoqbvTAfyZGwRxM+WJ
 jitiDhRhWqbalIZPxCayHGzDdR+oohE=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf7539 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XjOppi-FBbEB9_Q7RKoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pG1q_1PDKRIiVN5JelvxPDIoAYtBOJ5t
X-Proofpoint-ORIG-GUID: pG1q_1PDKRIiVN5JelvxPDIoAYtBOJ5t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MiBTYWx0ZWRfXxIvw4EpdXycS
 5M3q2pDDf/5qvycK0LeYIIPlZN2fJivsfiD+WiLiPqKk8BcBvvz8Un3bEvAFbORoADRNjZvs0Ti
 tAI4ITWX0wYk/1OS+v+dNySq3sDLZ8BhvNAY7fBtCa2TNQo5EQT9WUPDX/Ah33Q9nXlxIY4opwm
 NBAwwU5H+THyFs6UDiE4FgF/4p7IfxoZLA8ljC537vvmf3RkthWDVgOgrtzQNSvobTrDoZYngsw
 ugvVk3Ml3JXWy0qNZBudES5H6fxnfEJ2pzbchsemWfxzxH57rK7TqtTkRIJqBl3BBmvzt5Omz2n
 GuDzoMIZIkZlQclb7uSwUS+Y2Ak7StHj5K6wWs5L8Tsm5a1chIlw1jSTNtzlLx0xsw/igxTm6GA
 EBROLw034AI9la4WTMfJ020SCLOEBx/kKereP9NSpxIzNLVAEmYeI0h16hqhsOST1VFEZONYNJV
 /FpEhn6xo+3fl/01oWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260062

On Mon, Oct 26, 2026 at 4:24=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 26/10/2026 15:03, Loic Poulain wrote:
> > On Mon, Oct 26, 2026 at 2:37=E2=80=AFPM Atanas Filipov
> > <atanas.filipov@oss.qualcomm.com> wrote:
> >>
> >> The VFE fails to power on when the pixel rate exceeds the highest rate
> >> listed for any of its clocks. The rate tables of the VFE clocks are
> >> independent and need not have the same number of levels, so a clock
> >> with a lower top rate than the VFE core clock, such as the SC7280
> >> camnoc_axi clock, makes the VFE reject pixel rates the core clock
> >> still supports.
> >>
> >> Clamp each clock to its highest listed rate instead, and warn that the
> >> pixel rate exceeds it when the clock lists more than one rate. Take th=
e
> >> clamp into account when another line powers on an already running VFE,
> >> so that a clock running at its highest rate does not reject the
> >> request.
> >
> > Again, we retrieve the pixel clock to derive the required VFE **core**
> > clock rate. If the VFE cannot sustain that rate, failing here seems
> > like the correct and sane behavior.
> >
> > What I don't agree with is applying the same logic to other clock
> > domains, such as AXI/CAMNOC clocks. Their frequency is not directly
> > tied to the pixel clock, but rather to the aggregated bandwidth
> > requirements of all active clients and data paths. As such, deriving
> > their rate from the pixel clock requirement feels inaccurate and, in
> > my opinion, is an abuse of the existing logic.
>
> camnoc_axi and camnoc_rt_axi are matched by vfe_match_clock_names()
> today and have been for a long time so excluding them would be a
> behaviour change.

Yes, and we're adding one more in this series (AREG), so I saw this
patch as a good opportunity to raise the issue and complain ;-)

>
> Perhaps warranted but that would be a different patch for different reaso=
ns.
>
> Upstream:
> return (!strcmp(clock->name, vfe_name) ||
>                 !strcmp(clock->name, vfe_lite_name) ||
>                 !strcmp(clock->name, "vfe_lite") ||
>                 !strcmp(clock->name, "camnoc_axi") ||
>                 !strcmp(clock->name, "camnoc_rt_axi"));
>
> Also - RDI path computes
> pixel_clock * bpp / 64, which is a bandwidth estimate, not a pixel rate.

Yes, although the PIX path clock requirement will likely always win here.

>
> > So I think the implementation should either handle or delegate to
> > separate functions depending on the clock type:
> > - Set the VFE core clock based on the pixel clock requirements
> > (typically vfe_clk_rate >=3D pixel_rate).
> > - For all other clocks (like camnoc_axi), and until we have proper
> > aggregation or voting support, a simpler and safer approach would be
> > to select the highest available frequency.
>
> That's a bigger change - this patch only changes the top of the table.
> Setting to the max clock by default would burn power for no reason IMO.

Fair enough, it's already an improvement.

>
> On the core clock though I think you're right; if the sensor exceeds
> what vfeX can do then failing is the correct thing to do.
>
> @Atanas could you keep -EINVAL for the VFE core clock and clamp only for
> the rest.
>
> cheers.
>
> ---
> bod
