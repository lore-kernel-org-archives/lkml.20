Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ECF43713E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276966; cv=pass; b=ORw0XYNbrGRhNYwW+GtwJiFyRePO7J9v1C4ytvOJ7Mkz0YSFM9PdtfO1nyKLnwS6khomAD2Ix7i25rMDHQQkEqGPfY41vugLzdS+TIkyVrwe/2Ylht/tThKvmfxIxkK7m5OBvjHN3sU72mZIwz5EXZoeeV03uq56En3A+JbX0BA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276966; c=relaxed/simple;
	bh=c2tUgg4wBDmD4/wcjlpaTarOSXX4ze+3IyNN+IvUeMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QT75V0yqB2I9o9tDWWWBxhObUadhkC/OcbuGpXYjFxL1rxrIdyvL1dAfTY3WYq7BCqH4t61bZflfzVq1EOaTujdkemzODRe+wQrGp4eTRl6AEsVUqS36sFfZevL87ok9Z+XeHZbvjwK0ZtE4A7WnMEiy8fsyqARaI34siFq6fsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o1Z/ZsVc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zy0Gpp+r; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o1Z/ZsVc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zy0Gpp+r"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8YSW3495532
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 15:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=; b=o1Z/ZsVc8EwHXYoL
	N/X3jHclM9iGocpfX0fLEQm7rWjghERgVeEDRL2JdObPCQonTMvGo2VJNqRfmXz1
	zVmx0uD54G8lm6Kpbmlp26Ddp8whLa2aOM4/zdOUtSTw5GgDhdIMkXXCGajKUYe3
	YLp1WWYJOjx2XHEireOVzIBvS89PF/VIVXg3i7Ek3edaqx/BrGTxSnfuAABglWbn
	T9HxxiOv661pkDs9rfa55PMvrk4kljk258zvuHsylr8MDLwCw1JR+XT+L7oNQG7O
	JLNCR/EanM3qciuNT928O1/MN1b9RQZKyOegz59DaqtBhZhVUtVMdUCC7nEO836d
	x/2NmA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdy9ngr97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:36:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1c057f480so8114a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788276963; cv=none;
        d=google.com; s=arc-20260327;
        b=sl6A6YmZGX8JHBQi3UcNLhwWR2l5yQL3vjwwbZgPrjIdg7iTMMK8T3KH6S2clflzTD
         94906+XZe4t4RsJitDyNSi3evHc9oohEJMlDaX038YAOdaF/Fm4Rn4DuoIXwEnJIcmfT
         m56XciFjyivW5Bg8fnx7WBqobZLjX4AaNv06RBt79ZzKK/mw3ptvtXbvGUp3ZiApVrfb
         /BUyg4q7mBiZvdEVctQxTzuYFRdeL+avBhUZNjfdnTIK9x8Zx8cR2lgvYtvg2dAscxU8
         ZeQrpTOvChZ0X1efRT0EFoBmM7N16SO+eeOO7djU2YRv0xIRLAo6/cHWySYG/lUAVhfD
         K9ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=;
        fh=tvmnmSpMZL9zNU/1sZu2usRACdSztBtQsXUM/CpoERg=;
        b=qZi5+BRYF3M3NcdkjAvgdEzRg6SUlPsK11UT4iMowFJUo+pLQGb/n4gCOONc3+ytYB
         4CcF45hyjoXbPU+fkV8jsgfpkdkfaYPpauRm8UmPS61Un5yNOpnIq3J/fKq1FCcwPD7P
         6sfk+rofG2pS2HpASHOKKucMZRNGm30i4e3gYbWeb1+FeshOkyUk9oP/wMTgCNhABUAW
         FEsgFPNYaElNUQEyRdztFZseDbkPqj1cfQPFhMYzRmsg2KHXWClzELqRRV3y25qB8i7I
         jSSiMiV7Ex7en1rygzwZly2DPyTSsws6CVUWil7Y2hxgrXHHsGW8wczozSR8z8i1eIba
         bEyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788276963; x=1788881763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=;
        b=Zy0Gpp+r4x7Ao+n22LT2+fxV2ToWveFfT//WUr6up15GO7qyDc1a/sRXMhSpZBnHrq
         sBEVhSHYPs7Pn/SQG1XCwMugL7cKD6m0BufJj/r0BlmgqLrOLuQsCI1EkUp6xx8jr+y8
         2Dj/yCA+52M/G4fr97LA8h9enyNPtKhGXQTHki6SosD5tOQytoIOTu5P0eoapavBJyjd
         2HH/aIWOiO9CrTw6+AGMWG70z1WodxtC0/bX6k1TpcH+GTg93HJrM1EheGUEROr76BAO
         ttcHwqxFVs9dkEq6ZKU54DgkWU4LTKE4Nbh53OHvrYGYiMMW7fp2kUXUxfh4ywojbqO2
         6Uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276963; x=1788881763;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=;
        b=g0Qb4YjESxCJKQSC3vUxLliHJTUOkbHp+/w0jAPR/l25EgvnZ6D5kX2a01j9kOOH32
         /8WXjb8yukBvgrel7XXxlK7OKUe/9oP3NTGdiV9uo7IINYeyLL9DjaQ19jz2fqzaQKgY
         q7A9zBi9Hp1VL8wkB8i4XSLWvhk17/pKmoFBC9Hmi2wOei48rRJmVIYhBWcfdSX25FPn
         HemqjoIvG0q7N5Rbaxe4W2lVhP6d8EP5zFDpd2TFq2Kw7t3OBvbXHPj3AsxMvKICJdvQ
         efJgWvT98hy9IoHlfg8AZTrzx/3p31Jf76RUj/14I1rzewl8L6OjI7nM+TySnfb1kfTm
         9LoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDxdS2IU20ASSgsVkIcp0k8ZbA7X8wSk5IT60Xa9blLhl2WNmJeeiYGAa4EZwLn8TEW5ZJaYP9bI63f/k=@vger.kernel.org
X-Gm-Message-State: AFuF++nRWLAyv+TeCuOAg4y2Fy/39GmY/GDQUVpG8SxE7joTMj55sDc2
	3JfYDD7isJewZKEQ9KWHpxajzSq6Io5lD21uKDxtzHYKYSGZeZJ1Av7AQ+BEH8tGt9yTAW2PN7o
	IuQETrJeLrlQ5LTUzclD32TEIeS5BsOPlAjXBWnu1/Hn3tZGBU9rb2vWfPeJYjycONFWIA5RFRr
	ASv5hU+PLUehE43hm/p/N9MbEEfBlg1+I1uRhOhegjjA==
X-Gm-Gg: AYBFou0WAxbZtC/2PAnuzzYPxUZ0+ah4wlsudk8YeNOL8HiKVlgK7q5/crBRF637IhK
	VK7WAAQNXAHVOUE4z/dZFZSvoY/L/WXL9w9sS36cPR+r9H7jcUH0RT/Ku/zAkrxwcG9Z2LfBBpl
	JO5aPcMcAvwfaIVMa0CLNWHgQBgitEl+wBHow2xLWQjps=
X-Received: by 2002:a17:90b:3c8c:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-396d0e7255bmr53079258a91.8.1788276963078;
        Tue, 01 Sep 2026 08:36:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8c:b0:38f:efed:5448 with SMTP id
 98e67ed59e1d1-396d0e7255bmr53079149a91.8.1788276962567; Tue, 01 Sep 2026
 08:36:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com> <178822856270.1835959.15842744749902984423.b4-ty@kernel.org>
In-Reply-To: <178822856270.1835959.15842744749902984423.b4-ty@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:35:50 +0200
X-Gm-Features: AcwNN1XR_ENRcLXIDuE31pwfkZ-t4Y_ZQM0rZSm5dxDSS2r51n9kmCfdHTv7uZI
Message-ID: <CAPx+jO9ijNO7R=oOXs+yd-LaNaVAPwF1Rhh-xVGr-s1K1Fuw6w@mail.gmail.com>
Subject: Re: (subset) [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzNyBTYWx0ZWRfX6DBZjnvlUrIl
 ocib6ERw2/cFLM+zhYgqb5TOYFLHVSpUT8m/UitO6ovC/mURDpwfviurstIeVR05gsHxhm3K+MU
 plsLA3QTrRnmV/2KijRcHFpwzO1PmEg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzNyBTYWx0ZWRfX4eIpGHRyLWq3
 A/j1ftXda/VesJJDonAhagglETS3JCfwTmzhwJJxHc2/LNsbzUR8m7ZbeJPcFdZUTpSjpYm983P
 VP0rPamtiiBF+h2Ni7cqEA3KuSD7r4uA/qEYQLJUiXU/81fIccRVTVeZ7Gj+p9G4zXHbWXY19f/
 YNipvTnGkh2Dk91JJE4uCpoxdPvQo7ZzOIHRHISc9mbN2XsO/USIHPTgnuMJmcmlsjxLVuZm3EH
 OyQrwGMXcYrkn4B50ILceRmiNbS2SxvZK2udvQlvl29kWM+K5tEetZjscoE9aqgzeto5Lc4tkSC
 sihaDjxORZzTkzrGbBqWe/KnQCfQqt5Lft25t5sIILR7LTMwlVgFml71oIS7X/CfDHVj9AZyZ8b
 hsO5tY3ADV7Zj/0kWEZ1LQzMB9KcFvYFuVGCj8lVYknWLvBOqN7WNpi6OlcCVWlPSQm2qOPHbwq
 WogSGLqlexnvBJyZ2UQ==
X-Authority-Analysis: v=2.4 cv=e/02j6p/ c=1 sm=1 tr=0 ts=6a96f0e3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=elWi3GNyyhLokhY1Yp8A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: t7phcolbXvUPY_rN8dFoGSta_dDlsF6C
X-Proofpoint-GUID: t7phcolbXvUPY_rN8dFoGSta_dDlsF6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010137

On Tue, Sep 1, 2026 at 4:09=E2=80=AFAM Bjorn Andersson <andersson@kernel.or=
g> wrote:
>
>
> On Thu, 27 Aug 2026 23:21:03 +0530, Hardeep Sharma wrote:
> > This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> > IDP reference board.
> >
> > Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings =
up
> > the essential SoC infrastructure required to boot to a serial console:
> >
> >   - Global Clock Controller (GCC) and RPMh clock controller
> >   - RPMh power domains
> >   - Interconnect (NoC) provider
> >   - TLMM pin controller
> >   - PDC interrupt controller and SCM firmware interface
> >   - Devicetree for the SoC and the Kuno IDP board
> >
> > [...]
>
> Applied, thanks!
>
> [04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock controller
>         commit: e304e8919043712191462224ce9d40bb5f5a6bc1
> [05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks
>         commit: 12918d595ac96b819b9c3ba0df4c6a4bf50c43a9
> [11/15] clk: qcom: Add Global Clock Controller driver for Kuno
>         commit: 7db06b5f624b583fa2206f98de8437819acada9b
>
> Best regards,
> --
> Bjorn Andersson <andersson@kernel.org>

Bjorn, looks like patch1 is ready for you to pick as well.

Kind regards
Uffe
