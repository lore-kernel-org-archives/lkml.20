Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794575677;
	b=CumZrUzZY8PDCWaIV4GWukmJLdD+kv4UDJie+3Y2ZlpvVFhLkDmRz0ScyccZc1memLnR
	 L38uL1BszVOxCFl0bD5eRtQ/xv1CgPU/ZPZHkdhZYfL5sI8SNzQKSh3EYPIzqI+1ht1Si
	 iWa6N2modu7DVLBM2ytTc205+8YTrdZ6wn6Y3IG62w+y7ka5d9l/udcmAB5OX9iYq4HE9
	 ZrImJfpcyRlM8bNFazMtsCZsnaU+sZxAn6qMY0SGbOK4WuJ9Gm1GsZ7mxIZy0QthTiUbY
	 2IngDBHfuYmUda7WoKETdZgYjPAsf3MWHB0mN7Y/72Jhc7A8GMB9NLK7XvW6IWzUBSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575677;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=;
	b=TjBL7rRpszvDUy8dDFRSB/+GhbPdELk+S/5qiRGTLLXs84do/572UWogsrH/wWl7GmXP
	 k6QNJUETsAqT3os4VxAHq93qTpOYy/DRP/AZNkl7GAy/v0dE1nWh9PK/lCJdP319PaDgC
	 PNR2EHaEi7QMl1gPUXHFyRkbLjz01Pg5eLPEjBoQlASul39FXozAkJNxLjlUv5K3UlxYF
	 R4Th35Dd2S0ViczvBFXgqDaKbxHojbtwMQqHQ+GOFkcFoI6fEH5Zuahsc1SfHgpNMOcx9
	 Th1Lx2WHiY0BFKJpSXObZJPiyx2zF8S5YDX/cFn5U3iyLQ1paEs1Js7GTXIa5R9D8EQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hXUGRL4y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OUfdZhpZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC0C606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDC0C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hXUGRL4y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OUfdZhpZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJSFi2796623
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=; b=hXUGRL4yHi00dJim
	M25dk6Dz2Sx28JEYAIfIC89lLjEMl09eKnBGb3dStt55GUkm6DY/ppMLhXV61X7g
	IbPQoDpwCNdD0Xwq+UPXPFLgt+NQXSg4zeLjPPyhon93RLbLSwGsTDQ5oDUwwwBf
	acYRDQ1x3Ss6ukHMzrWf3csw9HeFECM3u4e8BxcdynnTmCVnpmqbUg5PLK8l1fud
	fkNdr10V/zYZnLIEPQysW+ApCS9J+Ua4/NjMJe73UuGJa4rK4pEXt8ZFX0jShDYk
	J0YrM9zaEEuORdgU9FKOQ8NbfzZHkM4nZx4NQuqs6j2DkhuD++kXM3BwyAzCYX0f
	d+Klxw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6sf0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:14:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so1262053a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:14:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794575674; cv=none;
        d=google.com; s=arc-20260327;
        b=Seu2n66n2a4uPo49aAOv+mw+YbBUJuuGtJnmta+WnGr8jD3iiWipEY1cUX+NXTNjVl
         UdYLMopAQHQXUAVvjflA11uK8yaxoryMTh25oL3ZgyOjeIKVmOprZL4GPShjQhe2uCvW
         JuYkMpbZiqJMkoP/6QdK7nK4mXOhjPF3ZDsvpf1te3dfi5azqTeGmKD05eEoE0adnjGX
         3qNvM0WQ7iXEpU3W5Gzq2BaHneYjK0wnqd6Wx5q1v2yJjfHbI28UcXeAFZueudD5TS4o
         YNomrZ/UzXDpTKbT8fHwNuLGyJohLc3IbhYdCkXwDCAgxqI4thjAbkbASs5dYMN5s6Ms
         H5Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=;
        fh=zqssHgQ5bRxFnJS0FgjkIPFEZpFuUPKD8RMFEPZq0ac=;
        b=GDfHgkd/rymEipBW3APhzy92W5DxFGgLLnJef91zztmfaf+HALJvXRazit6lGKeiQ6
         joqkug0iUMuH3oDyqhtOM6fIcH1sA1qnRifFrFD598YTGSXe9XzmSSLhvklrwlR/kPk/
         zNbk3hE5cn57dM7g923EyfgGn3fwqI0ltQvx3Q5WKoxhnGkZowe1rvsPFS688frdULu9
         qd4HsxaNZyulXiUv8tIaHs17AFT2kpkOaW+V/Vp8sAVT+VjltFGr8QJNcJaWQIce8h+2
         Vf8+UW3RKoUJT+7lukKDeAF1tkin43HKIisO11iJ/UMgSaSRUCqQjdfxglBwu9rtqTU+
         veIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794575674; x=1795180474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=;
        b=OUfdZhpZwliFBfR5ez5O5FvpneaurAsXoS0SkZMWHteOMDJ50kdEpX//EJ/hVgPdgY
         9bIbIC6UMCzPjrA7nKDC0kQ2//OKDomwYfVGOdtdaHzP/Pum3u5F8lbx2o8ZfHMN9v4a
         /LG0fizSbxJRCZHLv8a0ZtnCpryVT3gQqge1Ozu0qWhplcg26OvjKjzSSgpkNraOXBgc
         WWXNCJB1QL3M5g/Wra+5XS6Gjf37XIaLxSTpETll+yVay5PoQ+HlZQqFSnR+EDAGIOQE
         VVMI82mgZSkda/XYYcgBanvOJsPL3ZgGFVtvi+ia5rc/i1kXjLLa79c2RinQKE6Y7n5f
         cenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575674; x=1795180474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=;
        b=vtr9Pw+4BbzEJYHpKlOp6SYPDobKtMzYK8SG/dyM8ZrPzZvbsN3tDcQtlUvNCsgKzT
         xGAd6ZWqk7M3zicCESHZsSTWNoIfBhVjXFUMiUxvn0Z/G8b6i4ULoO2xNopHj43YYyKJ
         fFF4PWWO4v7XH3Yn+yEXvDQYT0DuUn67dIvBneR4UE/LsNWas4By+DTjS7J1nOJPyyye
         S+QR3C6D4K4C4rqCWX/tgD1a/9GybchzpJTMRsU4tLBj+fpGa1u0f7UnsFVpw9zkk+bo
         YcDMGnuVIKEW9MeI8phGUg/TWCl7TJ8s0cOXJgAQZAx2/hZLjHubha62/ZdKC+grnqHU
         IWow==
X-Forwarded-Encrypted: i=1; AL+hErE6smiy7oSKDck/cmjs12G5Re4hj5Gc/q0a857ocrhMJOItlphuzMV8+D1c67balgdQSjwdpsA3SpvSB50=@vger.kernel.org
X-Gm-Message-State: APuU4Z9blpbg7Zz3elnt2AJ3jPKDZhGpvjY/ZheDCZL0/2ImDL1xSzI6
	qAjm4VNnQnAqh3Dnt32g46u/03gWwOwQ23ShFW9KAff4MGAFLjehZxCKaLIvowd497c1mwC7UI3
	IfFiE8Hsjkuy6ettpx4nzFmzu0aR54qXCPnbGnlGWWVziyb9ZjSoRO/2U+4wcD32bH224yOuHBr
	2UKoWg7jtT+vlM4gGHlneVVDUubslzaUdQj8RYd9j6Cg==
X-Gm-Gg: AYBFou2TWqLf7tJmG1Tr5LytIkYfyJzfCLANZoyCuutjyMbcETW6gYPMNI9Tr11UubZ
	nCnd9tKO74Of6XbuyzwHSTX7umReDE5W/Nbt1MO58qeBmGpjuYZDqP9akAA1sWAEcTOqEW0fLuA
	oCWbS03+z0VwzHhbBx94PeNiLee4fWFkowmbM+3yxN0+c=
X-Received: by 2002:a17:90b:4c8e:b0:3b0:d808:a991 with SMTP id 98e67ed59e1d1-3b1b0d3420fmr2545463a91.55.1794575673634;
        Fri, 13 Nov 2026 05:14:33 -0800 (PST)
X-Received: by 2002:a17:90b:4c8e:b0:3b0:d808:a991 with SMTP id
 98e67ed59e1d1-3b1b0d3420fmr2545420a91.55.1794575673121; Fri, 13 Nov 2026
 05:14:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com> <20261022-psci-fix-v3-2-9ce2133c5659@gmail.com>
In-Reply-To: <20261022-psci-fix-v3-2-9ce2133c5659@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:14:21 +0100
X-Gm-Features: AclHuK_DTsDuBkxo1YAzBq_C8oLcltIpHJD3FMGKMO-2WiG84I3huHHxGsWxuKE
Message-ID: <CAPx+jO-qPAuOGnGfCyGnSYym8PBOaqUJptZh8duYJKZN4HARaw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] cpuidle: psci: Allow skipping the suspend mode switch
To: Reza Kurniawan <imkyufie@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfXyb5tOruGBkM+
 lRljlTKVzvEZ7iV1xUv0KGD84sDdK4VSFnPVQvG0SSb+2cfU3x4Pb7SHN0IWJMx994e9tHsYAAS
 scP0xBBuXtVpHYtKzKTormhSrze20UIDgQdCttLvKfBu+sPTr0OODIcA3UPYgx7+YYD9WElv/Zg
 FzxjCrJZwU7zzpu8cqE4VL2MyWNqNmLwtHz+H5CBs1hViJ5OEnD87wfn4qDWl+MDfrmH6pBCM+y
 Xx568+LrddSVSl8Eq2U1baDxU97A4u0YJG5sjJl6wGTN2Hf1wjUazhmd+5KWdCmyn14g1mg7JfG
 N+SNm4QRS29FJe6ZMuicatcYpWYumvvGRazd1A/SQoqRb4kIe6kcrzKn6HU8Z9k14XBIxMIuuCp
 vMPceEvF/GxsfTGrzwOCoA9UIK025LSvACcZlt2silPpwafQvq8XZznlKAXuwj3PSoerhAprH5B
 8aKeuMBiBqhsDGGv58A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfX9unyA1ufKu6i
 aP4qgboqglEVRs55C8eOY4J35ZU52Z9aEbhAeRGmP9t2kLCQMQC+SJ9qCZHFDz5qOUHa75aAaYw
 7XV1b1XOZI148mdw6zn41ukETyfMeLg=
X-Proofpoint-GUID: BT_SdWpse_u1MWonJ27SGV3-LvzYjwa8
X-Proofpoint-ORIG-GUID: BT_SdWpse_u1MWonJ27SGV3-LvzYjwa8
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af70d3a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8 a=UY4Qpe7uAAAA:8
 a=Bs3vFoulODVTn7UWAnkA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=Dz9CbhmWzz49oM4s8yQO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130052

On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.com=
> wrote:
>
> From: Alejandro Tafalla <atafalla@dnyon.com>
>
> On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI reports that OSI
> mode is supported but rejects any PSCI_SET_SUSPEND_MODE call with
> NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and the
> probe is aborted:
>
>   psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
>   with error -95
>
> Add support for the "skip-suspend-mode-switch" property. When present,
> do not call psci_set_osi_mode() and continue with the topology that was
> already built.
>
> Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> [Reza Kurniawan: split out the patch, added log message for skip case, re=
named
>  the property, added property check at PSCI initialization]
> Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 16 ++++++++++------
>  drivers/firmware/psci/psci.c          |  6 ++++--
>  2 files changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpui=
dle-psci-domain.c
> index 5722365b94..cc9f14769b 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -159,13 +159,17 @@ static int psci_cpuidle_domain_probe(struct platfor=
m_device *pdev)
>         if (ret)
>                 goto remove_pd;
>
> -       /* let's try to enable OSI. */
> -       ret =3D psci_set_osi_mode(use_osi);
> -       if (ret)
> -               goto remove_pd;
> +       if (of_property_read_bool(np, "skip-suspend-mode-switch")) {

Rather than reading this property here and in the psci fw driver, I
suggest we just do this in the fw driver.

In other words, let's make psci_set_osi_mode() to succeed when
"skip-suspend-mode-switch" is set.

> +               pr_info("Initialized CPU PM domain topology, keeping firm=
ware-set mode\n");
> +       } else {
> +               ret =3D psci_set_osi_mode(use_osi);
> +               if (ret)
> +                       goto remove_pd;
> +
> +               pr_info("Initialized CPU PM domain topology using %s mode=
\n",
> +                       use_osi ? "OSI" : "PC");
> +       }
>
> -       pr_info("Initialized CPU PM domain topology using %s mode\n",
> -               use_osi ? "OSI" : "PC");
>         return 0;
>
>  remove_pd:
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index e73bae6cb2..3226af6d89 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -791,8 +791,10 @@ static int __init psci_1_0_init(const struct device_=
node *np)
>         if (psci_has_osi_support()) {
>                 pr_info("OSI mode supported.\n");
>
> -               /* Default to PC mode. */
> -               psci_set_osi_mode(false);
> +               if (!of_property_read_bool(np, "skip-suspend-mode-switch"=
)) {
> +                       /* Default to PC mode. */
> +                       psci_set_osi_mode(false);
> +               }
>         }
>
>         return 0;
>
> --
> 2.56.0
>

Kind regards
Uffe
