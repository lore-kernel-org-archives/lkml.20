Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792496584;
	b=qFUV0Ry/BJl4DmaKDK28BYSNUGyY3xUlWFMU9f2YWgYNliVQHI42xiKdFi+vI9arucMK
	 hUDX9T/OQBdBRtO9Daq7Tg/Pp6n1381wXBV+x9q6TEkRJtr21SfFLETa8m3NdD1+wcEfV
	 wLFkA2D8O/wW0wDfvFMNfyo1CeuVeZ5uHKiwAxI0N+TODkHdIuxZUdF2SO/MAxpfTMgHm
	 u1OexP2B2l08sJvxSfNXifybDe2EktDxua1MVoaoStrl67m8H+mljmRGO/bi3B5mmaT35
	 NGMm9dGn6dxMblfSVaizzQjkgpH8y60fCkMYTCONjX0C/2Zvo2bQy72Le9mhePisGJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496584;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=R0z0X7rWSX7hGljFOOUTHJ3FuqKHQLBWO6RR8SAZGBQ=;
	b=FePz1obcCJMiIHVMM3ETlToWBVF2c260AegUnJfbnjYCkv1bwYR5/TJT9UOJp18eXC8T
	 LwsxVOOIAg2RF/9Fk26YwuOGJwOV/kzsHSfzbZ/nyjRAaq6T6OQICkvRwGcLTTBBZUosI
	 SamorB9yJ8Ejd9MF+tFZvWzM5JI4CILEs8Xyhz2sna0jwD/6NH1XRSswF3vunboX7rUaE
	 7sGcrB4XHOc25lF27b4ZBpfq2mfiGYbIJA7uZCL4vGw7PSNnqdcbInSvi/xKR6bT8nrB/
	 hX9QPLx/rn2wk8C8F+y7Nohx/DfZWCiHwmL5FzZ1xqD9tzgbn1SNJVWgbPOjEcNwnRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9PKX0RI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WKcKA9hU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18948606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18948606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9PKX0RI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WKcKA9hU
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBWWYI1571795
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R0z0X7rWSX7hGljFOOUTHJ3FuqKHQLBWO6RR8SAZGBQ=; b=k9PKX0RIS1XqcBpu
	qa8Yj1xfUwMHMkwx6UGmrUKVIFrpZSBmCsgxlyls2gW4q3j2+fgLzQAV6R5OoAFr
	/1vddzq+CbUHecPgU85Zmz2XN0LC3O2x/n8wmK89eqIDqGCG7w38HUfLj3Gwjzjt
	5hqGTf7DDpK+eI8MwCRzId0GXyAZD7+HuA5hyMe6OJm0O1r3n2fsZ52/9cSBk+27
	27qdk5xYbXmkFrWHm7BlZYmezMLBPGB3AFyj6xZTmdjAKRbdEICJXyScr4h6HGFD
	XJFphIhQ29tiIreRYTyLqv4GYVaGBnbQdumMQfz9Za27zVZDZiR86g8AxZydws0v
	LbUePA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h28153-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:43:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so558895185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792496582; cv=none;
        d=google.com; s=arc-20260327;
        b=GPNfuv7C1A+mtuGVyHayXQI2J4GuE3W3Z8+6nGD6rBf/LBr69TnT2GozwBbZd6w+VV
         uLVvLky+zDYJxySmNyMTQUijcyZ23JnGvQ668pAIXtU+Y0Z+/mp2hTEtCykyMRSZg8T1
         0BBCtKyMC1WocXfj/tVwtU/bOa/iVYKNZCTekayTw+PXa8sF9yb59jgqicyrVicuIV83
         HhWvaiuvqOrW7QZQmUMzfnLl2/uvJpOl43JErnplL8gB2oIdcpKVDkSWI1CbeZNnGLGG
         uk+Dh3OUUI4fL+JjNlr14QZncSQmaZsoA3IyrE1Y9fIJMgnFQ9dzaUVYUVm9y1ntqCrq
         b6tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R0z0X7rWSX7hGljFOOUTHJ3FuqKHQLBWO6RR8SAZGBQ=;
        fh=C7PrsMnNSoKDiXh9JGxf4lKZAg7UYq3a1sJtOnotLDM=;
        b=mLE5y8AMvc6Yf+ahY8fq3PYR8uskvJbb45KnFMbLDew48WPWmpH+iiVROgQlGTSi2t
         azoNRPRCKnoYtweLez8E4vZi8ulOGdDLDzGvw6LnGL3DO8/A5chH3hdZRlqf1OH6QE7y
         IqMSiv8ReAged2RM7sjB2VwzDi0HFVyt4xM0wdkDkvYPx2+9257zSJah3/nKQdG6tgtz
         rfNQ0bFV0Z3/nae5OGqUBJlcJnnLnr58/HXzQ+bGK/L8WegIos0fOkyB3s4qZCdOxQAF
         7ugetUWUGgySqATU62iGq3RfcT6pSAEwxjzOx0gKFDGvyXNk47ArRkGKd40oD3rYWmhZ
         7n9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792496582; x=1793101382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R0z0X7rWSX7hGljFOOUTHJ3FuqKHQLBWO6RR8SAZGBQ=;
        b=WKcKA9hU9oHBpj/2Mj9p5SA4pn8JQ3H148t8bOHq7J1mc+TdPOItWTSnvvdgT1u2/3
         gxSEI5JxUvfVKEvR5RauLPGBbFyS4GjY2S4WlHsuHWnZSaXH88g32/saBqtHHeyz6iX5
         LH/j18YaYvuFOo36OqxS+50LDI+5mR1aUVstxrsVZL5ue7hycCj8fbBoepxi8UQbcCKM
         L3dZRXlUe6LP98vibo8cUEnh2hivgMkD16V3BAdf5w90oE1+53gznCZSAPjwW2oe+smq
         h3rAriOfYnVvMk58rZR3EZbKgixLJBIM1q+dBJNIxQbsINiLsPlN4Nu+DQzSSeNbsL3j
         0Szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496582; x=1793101382;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0z0X7rWSX7hGljFOOUTHJ3FuqKHQLBWO6RR8SAZGBQ=;
        b=tLhrn6Jw9e4/DGpUlDeYc5UxSaFpTqy6QFmKliF4T0eUwHFEeStns1Qb68gB+6pjU5
         2Elh6RaWWAgZ6dhG1/vRN+Bkwho/SbrWTAM+1inHZrb6yp2vKSRbj1tbYzHBJq8P1jhO
         /s3W4ISeefqyyjq/fVAc3qjA6+pYGDOGnrGGsIjsontA0bCbduXc8eGYYhn4f/cL3UCU
         CVrXdEiV2HGs7Ds13kId4SPGzH8VCZBpXBpIOFpe0ibjfXGxyv2c+EXlSF++ntM8svIN
         9DYpRaigjFn4Kby7erNO0Fabr8MOZeFRXYvyNhc8HG8Md77ispF5BChSmhmKyPuQRon5
         gJVA==
X-Forwarded-Encrypted: i=1; AKwUvBy5BWuAh/WW2pJr948Ou0jdkyWwlX02hGo2TPXcs3QNqtD1LaDFVB6PLm1hWYgD114GMT9DJAgWNlXjpoo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZR9seEUQP+KbFFcHNIRoq5sh8QPTsDpZl25DOuDGeV4O/OhBy
	R9Gk35KAfiKZtBQseOQ+2zDjMDMAYz+FqRMxdlADY5zl1pRHpFlK167XGpRB8UnRFw3H5V/bCaL
	faATdwHkAg4r2yY15zc7uEz+O4Mu5t8cm7i1DY0wjwp5R/F2AVvppRwNSVz5AfimNeyM45I0bLi
	Di/HB2MKC4SIHQVeplu8yEWRXmo+hJ811RJk3vWH3ngA==
X-Gm-Gg: AYBFou3Th6/6m5PhzIxZbLqpMqoM3jJ65xeMaTIkw5Rj/CcMuMPQlr2KDVuYkZUgSOW
	fyp+3JMgmHgrpDalu3NDLPKuAae8O2F0tNsT3iXlpkwpYybkU7lBbw/DyIOA1wdgtfy4jPGBCpX
	y3qgons5o8bAJmMHebv98vrwk0YfDNIF4u29tnK9XY1SF02QnXWnEagKDMLbqJDGp0aDAjwmHwe
	Xre4Av/9sQcnLzx1ztRQ//21++Z8SZ4X6xy9eDI1tog1rc76yp+Wd2YIaFjiG1V5x9owZD2vys=
X-Received: by 2002:a05:620a:294e:b0:93f:24d4:ecf0 with SMTP id af79cd13be357-93f29d6f5fdmr1786550085a.47.1792496582331;
        Tue, 20 Oct 2026 04:43:02 -0700 (PDT)
X-Received: by 2002:a05:620a:294e:b0:93f:24d4:ecf0 with SMTP id
 af79cd13be357-93f29d6f5fdmr1786547285a.47.1792496581916; Tue, 20 Oct 2026
 04:43:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019055109.49922-1-slark_xiao@163.com> <CAFEp6-2XUE4AQPm5hinnRGyrrsHok2ftsFXragiHgDSKKtKWow@mail.gmail.com>
 <70714501.3175.1a157532149.Coremail.slark_xiao@163.com> <CAFEp6-3o6gCb61hCQTJydiH2aD6CBVRa947tpmLe4L9j85Jg5w@mail.gmail.com>
 <65d8a1b5.8e5b.1a158ddc4de.Coremail.slark_xiao@163.com>
In-Reply-To: <65d8a1b5.8e5b.1a158ddc4de.Coremail.slark_xiao@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:42:50 +0200
X-Gm-Features: AclHuK8BuO4jl__rRfhaUS7jXOaRUiW_m7JFZ3VPSObwRmR_MtAJEM7HTIQLf14
Message-ID: <CAFEp6-2LSJaKHwZdgdHUzJpPF0H+jGXpHgy3YEPzJR4oAFUTgQ@mail.gmail.com>
Subject: Re: Re: Re: [PATCH] bus: mhi: host: pci_generic: Update the default
 autosuspend_delay_ms as 5000ms
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, jeff.hugo@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: dar0LO5arHTOmNr1Fc7T7IoanMuoPb1e
X-Proofpoint-ORIG-GUID: dar0LO5arHTOmNr1Fc7T7IoanMuoPb1e
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad753c7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=aMfntx_4cxk6xlV4G7oA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfXzocFoni/Sny/
 iebIR4v0LW/DgfHEO+pe5Bn6sg4fbSihgu+m0mXUMVfI2g9tqn/qDHOjKgzN9jFIv0zafr47H/U
 90gNfV2D8ecXKAX0Ruk1YmUoWBvEovc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfX8cfpihCzjmNS
 Qahmvy0A4IZQkHuj2BAdJyIEgYVwkuVkHIfV1PfXMizNZD3iUBe0mhaRNf61cjYYocrmj9NeTPa
 egK+ZytVdjX4UTx4zotzR0GC6AfeYymP8MHSQQ8vev1bmxsu329QNknwJ5DFthzchC/fATzNIIt
 U+1FEr9ckZbBZfdb6uJWMdIvBK/Y+bou8DBzBnLthNYxqRt4OKS8Ze/Ef7K4E2/L6l6d6Rd+/Nf
 nS6JvFQFLdp1DQMGt10oRjvor1MS+YKnFlpHJUfAL+FHI3uoXipuhaUqoyVAI9csosA2+u82PJT
 IKo06ZVj1i0utXjgaWbgjfe7X8vAdIx0KZQvUyr0jkPgOP7/miMY6aFxqu1z6OdDiUQaugvcKwk
 04skKNl52L2Vm3tVdvQsvqP9RxcHT8RGHW0P909VHwGceEDyqTyH32pRL1cV4x0YQCzLG7EK42v
 iAF0+xxasoqvSdUjmzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200046

On Tue, Oct 20, 2026 at 12:31=E2=80=AFPM Slark Xiao <slark_xiao@163.com> wr=
ote:
>
>
>
> At 2026-10-20 15:27:43, "Loic Poulain" <loic.poulain@oss.qualcomm.com> wr=
ote:
> >Hi Slark,
> >
> >On Tue, Oct 20, 2026 at 5:20=E2=80=AFAM Slark Xiao <slark_xiao@163.com> =
wrote:
> >>
> >>
> >> At 2026-10-19 15:41:27, "Loic Poulain" <loic.poulain@oss.qualcomm.com>=
 wrote:
> >> >On Mon, Oct 19, 2026 at 7:52=E2=80=AFAM Slark Xiao <slark_xiao@163.co=
m> wrote:
> >> >>
> >> >> For some MHI devices in some specific scenario, the default value
> >> >> of autosuspend_delay_ms may not enough to handle last wake event.
> >> >> This may lead to some unexpected problems.
> >> >>
> >> >> Refer to the Qualcomm's Windows settings and we checked this with
> >> >> Quaclomm over case, Qualcomm recommend us to set this as 5000ms.
> >> >
> >> >Qualcomm
> >> >
> >> >> Qualcomm also suggests us to update this for all MHI devices.
> >> >> Since this setting has affected some existed kernel versions, it's
> >> >> better to be applied to stable version.
> >> >
> >> >This looks more like a workaround than a proper fix. It would be
> >> >helpful to describe the underlying issue, including the timing and
> >> >sequence of events that make this necessary. In principle, either the
> >> >device can be suspended at that point or it cannot. Relying on a
> >> >delayed suspend feels fragile and may end up masking the real problem=
.
> >> >
> >> Hi Loic,
> >> Honestly, Qualcomm has been analyzing for over 2 months and still hasn=
't
> >> identified the root cause.
> >>
> >> Actually I have explained the reasons behind the events to Mani in ano=
ther
> >> thread, you can refer to https://lore.kernel.org/mhi/20260919095506.95=
70-1-slark_xiao@163.com/
> >>
> >> From Qualcomm's perspective, 2 seconds is not enough for their default=
 design.
> >> They recommended us to update this value to 5 seconds and Mani checked=
 this
> >> internally as well. So we decided to update this 5 seconds setting to =
all MHI devices.
> >
> >Thanks. I'm really surprised we still don't have a more precise
> >understanding or description of the underlying issue. That said, I
> >think it's reasonable to proceed with this as an initial workaround.
> >
> >Could you please send a v2 that introduces a define for the 5000 ms
> >timeout? It would also be helpful to add a comment explaining that
> >this value is required to accommodate the 'late wake-event issue'.
> >
> >Regards,
> >Loic
>
> Do you mean something like below?
>
> /* Add define of  initial autosuspend_delay_ms to accommodate a potential=
 'late wake-event' issue */
> #define MHI_AUTOSUSPEND_DELAY_MS 5000
> ......
>  -               pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
>  +               pm_runtime_set_autosuspend_delay(&pdev->dev, MHI_AUTOSUS=
PEND_DELAY_MS);

Yes.

>
> Thanks
>
> >>
> >> Thanks
> >> >>
> >> >> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtim=
e PM")
> >> >> Cc: stable@vger.kernel.org
> >> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> >> ---
> >> >>  drivers/bus/mhi/host/pci_generic.c | 2 +-
> >> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >>
> >> >> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/h=
ost/pci_generic.c
> >> >> index 7193a384cca4..40735beb46cb 100644
> >> >> --- a/drivers/bus/mhi/host/pci_generic.c
> >> >> +++ b/drivers/bus/mhi/host/pci_generic.c
> >> >> @@ -1483,7 +1483,7 @@ static int mhi_pci_probe(struct pci_dev *pdev=
, const struct pci_device_id *id)
> >> >>
> >> >>         /* Allow runtime suspend only if both PME from D3Hot and M3=
 are supported */
> >> >>         if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
> >> >> -               pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> >> >> +               pm_runtime_set_autosuspend_delay(&pdev->dev, 5000);
> >> >>                 pm_runtime_use_autosuspend(&pdev->dev);
> >> >>                 pm_runtime_mark_last_busy(&pdev->dev);
> >> >>                 pm_runtime_put_noidle(&pdev->dev);
> >> >> --
> >> >> 2.53.0
> >> >>
