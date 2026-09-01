Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74456441623
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277591; cv=pass; b=q0F+PSXXj1IAopVqbb6Iu+7YWTyeVdhulAW5yPewCsf+Xy3q4emEmy3+Gwuq5iAwoMvsSRt5CAKAaM3ooU5eI+bdfSrv3c85JUmfiQOZqmpCNKOaqGEzvY24waH49opZOcU3fYvTAW8eRUo1kXLeaKp8XS6/gjaQI75KXpaM+xE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277591; c=relaxed/simple;
	bh=2hiFglIyELsVUiYPyeBzEQYmuk8ezgG0ZJ820CL46r8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eyr0d6sy3vKPV5OO35JYVMa1umsLXAzLuqgF7hcLje2Wtn/WcUgCOLaE9A7GL8i0q1zSl65R9jbhGKFDGt/kmfjS5/LaFg6rvSuWzAWPzOYKuFG3QbHBa3A0142pnO6GRc0chqytTfwkSMo3dtORvXcQZYNJIVF2oyIAXRDwzgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bt5M0ggt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mc8G43FP; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bt5M0ggt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mc8G43FP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8hhh3002674
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 15:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FeaQdHnyQUVUR9qe3Nys8gzsKwJQV3ZOdTi7d9wCiuI=; b=Bt5M0ggtxbG89sc+
	BirZoRkIMnGGCvu9cLn8DtXIJcsb4LpkHvHlb8fzIUERmgLg/QNZAbGchT/zBlta
	PrSTgamXN8kbQDu0MY00sHlSx9ejf1v1y7jUjEW4ks5UEZ2CVPglweqDJ6Ep8bta
	HZjX/gZA7COIc28EA/LeazfE0kAWNDftfjmc5qy8Hah/K2VHHg3Z/yporOq1cPa4
	8+WeM2u6qBRbjQvFUspS7xo+wQ6k+Sl5AeuVKwKAyC8Eclm6W1yzoepIgnUxYJon
	LLMaEhbhKh3SNPn7K/D/Hs+OnBBqZsp7TqsUvK3Zy5a/Th6ctxBxN0kUcZqIfhLU
	fCD67w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh2yuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:46:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so8432933a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788277587; cv=none;
        d=google.com; s=arc-20260327;
        b=BU1FNJLsVS8FY8t+YcdI6HtEwPZOM/I5W426xwJyLgnFZS5xwE+Q/FQCVhX5TtcxhF
         N6fX8XZFTnaa9/+NDJ2foqObaOuh5ZC13rv0MhtD3oF5LeLaf288NJ3nqVGWyUCLpjzZ
         fmHqfn8FA/GGAwQzfELSBNTWV21wiw2aeqy8nBMVAy0Iv7szLJFnU2IaM2DY/+2IRJa/
         6xdVG7U7leqJWDKw5EyC8ldF4iFumZiymWf4qsQdWqUeD1Slk5MTK6z6M+S9gLSLGVkB
         yR7t+Dfm4b4ZucFsTFWneUDed/weKVYvwyLPbYr2j+uncP8H9JHP0ye/w8l7mKajRo28
         LBow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FeaQdHnyQUVUR9qe3Nys8gzsKwJQV3ZOdTi7d9wCiuI=;
        fh=Nr5h8J4OnRuA1HXPmZC4B4hj/vpTDNQg7oKDSN2AbZ4=;
        b=aG3mdjE7VTfPvmBEOxA+nvKRAEHKKcAy108Ymzplm9ODcV5M9smMJEZpkaT7V2eP08
         218qVJAX4a+VVbX53a/11g4HZocivCznWvBra5U7+MvknCnX5sLxxoXhRgoFlrqZYgpj
         Msb7F8V8b6at8zatjAT8zDDxs9F31VTZ4AestNsZ/NBUzleZCl+wLly1kfWa4iY6L9uX
         zpAFRvIfiNbLzXmBaGkuVsfr9XROXDX78BxSYGeLnvik5jtUvDikS3itYSYJ1qxC+Mrx
         cN1mkoJJX3BwyIGUl+ldKHFNuDysr5sCj6oKnyYpQEAbYBXAqB9UMXXRIu67I4Bzq3Zd
         cgKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277587; x=1788882387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FeaQdHnyQUVUR9qe3Nys8gzsKwJQV3ZOdTi7d9wCiuI=;
        b=Mc8G43FP4LGrtYT3+YtNrSlh4wylYrOYZGb4BZcrKVa/vt2zZPhysJW9zgr2lVmCBI
         Hu/XLkB0dJjFSMsEKWpc00o+1H2lKEhvegd3QIOMn1aHFe3rYyw6Ngu94YLOYOeRTIKU
         mSyzINRcfHZiHksJov9d4VBU55yO7itgqeWThcO/JlP+kQZHMqT1Q+/xpopyWxVfboLY
         iBhKTnylozXCCvbaYUTD9QXLSlDSSwiTU5YVnJnqYeeeD1aPxlQa+tv1KbYaQbuerbpe
         fCYJ+x+4ty1LhZtH4qCXn2MmJAQUvnjUdflXbwEyoUq7o9uQcSWEqnRqa3Ia/oOPOSkH
         By+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277587; x=1788882387;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FeaQdHnyQUVUR9qe3Nys8gzsKwJQV3ZOdTi7d9wCiuI=;
        b=Fh1IZHFDZF9m38BKJ57ZDLHwMo1r3DdfJl7sWAmPnkdqNmo/LTlnFN+eSMUEbvwRqc
         GIAcotLeE/3zxyg7NxYb0ngHDFXIScB2MuQi+3Qdscuaq5j/ziqfpRRWhFY1nN/wq8k3
         2t2aSn8U+vkK6KUSnaFcv3qFUL+L++I+18+fJzn+TjZouz+eeZl7n78qRUMTHlshDxl7
         p3CsK/gBMnSXffSEmU32tZeaLEQLsQBYIZE97vtcRcv12uoWxEbb1dBW+Zns5BdnX8+V
         D8/y/2WqWv0S3Ok44Acjgbwb9li5I2TuPpo4ByC5VKxmUo0OZLBEfmr+9yGDAxBndImn
         bhag==
X-Forwarded-Encrypted: i=1; AKwUvBwwrvVxTlEn0WXfidoG4htwb9X7NV+5F3kNM9CAU/60jx7aDPdu8IHoSL3M6coAaUffDGyKl55X+t9LvDg=@vger.kernel.org
X-Gm-Message-State: AFuF++lyYLPq+ou0vjg57bOZKqS4+ZJQUuAnIQNoAPCIWrQCkCyrrRnl
	dQSDADHk4OR8ufvoSOfGVWaqK8vKHXUzEXFLl6W6GZuA8FQR5lwR1HEKDATwthu6KbSpPi03Smn
	DLN84dq7koPxnD292Q4dnjOTxpfxnwymJx+DLzpP5uaLUBv2WlnD0Yz/GKdiZLccD1KBZwp+zTe
	3FralK7NdUODZlrlrKhoG7FDdZ1fUTTxHLptbtfptH5BVM8+h4bA==
X-Gm-Gg: AYBFou3o/b/+IYr+q6PaSFzOQglFu0cNYVkcTtsSaJAlj1kcFUmvptDPOo6UWKQMH/q
	2aTCyjsUln882GVZp5dKH4xgOFDFRbHTaamVGvL5382ktFJz1KBO05y869KjNUPFnpATErv+EVL
	jN6OYzS5slvCgdEfbWvCxGezsDtvyTz1Iuw9ohf0lhDM1F8tnGNDZasnM23Q==
X-Received: by 2002:a17:90a:dfd0:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-396d0fccf78mr56207780a91.13.1788277587288;
        Tue, 01 Sep 2026 08:46:27 -0700 (PDT)
X-Received: by 2002:a17:90a:dfd0:b0:38e:b400:a860 with SMTP id
 98e67ed59e1d1-396d0fccf78mr56207640a91.13.1788277586732; Tue, 01 Sep 2026
 08:46:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:46:15 +0200
X-Gm-Features: AcwNN1WvPfOmS-pECGpZIzaJnQAiHHylSoHG1ZWEkcxRplBgBJFHgfUmrIeCkM8
Message-ID: <CAPx+jO8XfaAJzjrO1uL5=0hadRLGtZsvVz7c-9P-+NBFwa-2Kg@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        radu@rendec.net, abel.vesa@oss.qualcomm.com,
        taniya.das@oss.qualcomm.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfXylDB5Krpd7sv
 22DkcZONyQkTNfLL17crsd5+6Zs82Uz5ygly1y39aKDpYk+aQfzp9wxIZnZzvenVADcZVbKzJ5m
 Mg3HCAW5COXVrcxmiWapIy0AvzHKDgg=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96f354 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=Z-QAWnQ1IDuNMEsj6QcA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: JF2IS2As28Ola25rMI52bYZB9DjTTNVW
X-Proofpoint-ORIG-GUID: JF2IS2As28Ola25rMI52bYZB9DjTTNVW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX53MoZui/kqIl
 eAllhjr9DLDRBLo2TgYYFnNB56kFms8vLwwyKVFqiqV8xZZdb/FOt2p7pUpYxQWSmfYurvY0X8j
 O7wrlSO/8UafOUxWSy97gtmEAi5fsWdDw05l5pdIz9PThUqpRlkSvLXrYxSLrc02xZn31GNqgSt
 WrZQESxg7fEmPV09QrXZGpL8BHRJ/8PAzsfRzGX253EqpAqlLP81iwNScdtfl4YfC3D8ACVJW+k
 AQYR15Y5tgTHRaUUwjuJTbQHG/h3cIlMxz+rnUiZa4Vb18iB/rnRDQCynZ5Yd7WKR3Tb3Elk9Yb
 4irou1XHOiywx9iFjxlBJMkcOaJ+vQpiX9WLUjSnflQau1Jxv7RC17U4splHDPIoN+s6W1PdzKa
 bxo6NqNCBWVKY/nBNBgwux0eyxNqfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 spamscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010140

On Tue, Sep 1, 2026 at 11:25=E2=80=AFAM Sreeshankar K <sreeshankar0910@gmai=
l.com> wrote:
>
> This patchset introduces foundational upstream support for the Qualcomm S=
M7250
> SoC (internally codenamed Lito).
>
> SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring =
an
> octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex=
-A76,
> and 6x Silver Cortex-A55) and Adreno 620 GPU.
>
> This patchset is organized as follows:
> > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC=
,
> RPMh clocks/power domains, GCC and cpufreq hardware).
> > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> interrupt controllers, clock providers, power domains, and reserved memor=
y.
>
> Dependencies:
> This patchset depends on the following patch:
> > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
>   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzy=
sztof.kozlowski@oss.qualcomm.com/T/#t
>
> Changelog [v9]:
> > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver f=
or SM7250
>   Make all clk_init_data instances const across the driver.
>

[...]

Patch 7 and 8 applied for next, thanks!

Kind regards
Uffe
