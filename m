Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2626544E67A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 12:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462131; cv=pass; b=c/TyIx7m5kSsrl2z6xFaT85dADUE9XxAmPuKfcuZseBhwGJh3g+APi+p9bhfAISpFrwyEwmBcGxMqrqd/gxDLX9A3Cxu36x5s5Q9boSkhNFtNuFCeiqt2YIqXX2hOdQS5/1jCphg0uB9z++KsYtESf8SeXrBDBw2uS5Oo/BXINA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462131; c=relaxed/simple;
	bh=+4j9FfZKR8IGCg47cVnrN1yTG8l/L0oUKeTDJQOU6mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JcG+6B9HwB0GX/a3SFcXRt52n3GqVGQycqY+D8bPmbCfDSq1INx9Vzz7GelFJ56CpMzY+exOn89kr/aWAIc2WVgJ3nANwa0ma02QvFka419+LiD1IgQweQeW2cQ1KEkwo048OU124TTGAh1bsaLYbdMwfLaRWRSVNDlrivPwEhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSlQoHnb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fUnCAw7v; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSlQoHnb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUnCAw7v"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKEMb1708170
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 12:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+4j9FfZKR8IGCg47cVnrN1yTG8l/L0oUKeTDJQOU6mc=; b=PSlQoHnbsoQqCE1q
	KWv2ipXNFwyawIB51ym7mtbKSWaIJ5GKoB+2wyBvbFOvEJCzuQMHCpzQZ6BQ+Tv5
	foRGsm7S/gM3eabLuAkAm+s77Cnb+Jrv/IEIRhFf+ee7PdA0fzSuzgkMLdVrII4o
	EX2pu9BeJWjEz46dxcMRmBKCgVOIsKt4DRxGHKAz7pO3WgHaXJyuU3eWHVT6xLKM
	NRHUE4bp+FXrDEaYr9LN0TNdA34spBo/xomgdbz4ZkYNu3nstT+5ir6qaY06sCFN
	pjz5MIKEBGfEycmCJMWq2xd1cW0knOJigkR2i/QD7dx4rvVdwUKP8vyQ0QmRwmN0
	pu0VLw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3ata2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:22:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e827b3a6b4so3090375ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 05:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791462123; cv=none;
        d=google.com; s=arc-20260327;
        b=FvwoPegXtwPL45q93u4lPl+28pBWpE9HMxdMtgn9M2Gs1vF0NLdnjaBvGTnZo/9Vsc
         P3yhfxHM6Vep9PH7yiHjRvVLEjX2bgv7TeZsf7TG551VztiUzgG0p7k2M8p/UIL/lbn3
         n835gGnls/e40+JfWzxmvjKNW4cgrkMnVRS4aM7URqmoU34AArlAwAj2jvUbKqoJZUS3
         O8heUZctUwT17lTvhNlUj+ZmbvM+kG0kBCUnVb0+nCwxxj5ezqOXeI2OpTe6vBA6kwks
         Jv2PSgRZKn97A5lY9N/HdbMCGFeBpcIKFlnCnDETahEK5CIZpnR/KD6VdefHuxj40DQ5
         /9Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+4j9FfZKR8IGCg47cVnrN1yTG8l/L0oUKeTDJQOU6mc=;
        fh=Yke1JKO41/KEAzHHuUiI/cRFlWj1cOKIimVATlYtO70=;
        b=Xhrl1p14I7g0LtV8T8zzpGu4kuRV62ZS6W30+9v25dyz3dbJuQruVLbQaT4Miz/hNq
         bQO2ds2DMsgeLyVI0OTg0iM/CbbzmnwmRZMn9nL0njKtRwDzMsa2ttKvrPCfposFPVIP
         SIty0Q7mT4GVJevN/ixxX72mfO4zSqxPdtRWjiVXvR58Wf19fRDqU7VlDQGVku4gcTd/
         pJ0sKf68TJaKH7Dwojz5jU2QxHQJUY0hA+K+sFeDEJ/4dKUrmOP0OuQHLivstgkf60vt
         S9p6nOOst43gjPmyxRj3x3+Tuszovt0LaonyL1zUuOMEMNP9NIgvsRI93SgHWboSBdAA
         8DTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791462123; x=1792066923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4j9FfZKR8IGCg47cVnrN1yTG8l/L0oUKeTDJQOU6mc=;
        b=fUnCAw7v+6Y+SMXFHRJkZoWQ1iacf+BgAjuo1pB2HzuS6qDBXYjUdRapTmNVAYtsvX
         sOwkYwVYM1wAD4endgtxjUazgbsqOvhIwcdnpROUgOqSGmjv5SXmhl890tcfGWj8S+bs
         YGnoU6R1cp47fpG2TWCp/UCxJL0xweVQT6FX/Z2s6op9g15mLld4KxReRYF+p+xz4ttz
         YukBNQnyaV2p3Ppi3DyXBjcYOFcStwwbv7fRC5gfoCFF9LQRufUjhKVKFr4yc9lOlFOB
         7li63nc59LRTyF9j8sc87Zcf1/qnQ0oiPGjafe9sF5ohSs5kBXYKhCe3CpQ/3VDkcy8R
         24LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791462123; x=1792066923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4j9FfZKR8IGCg47cVnrN1yTG8l/L0oUKeTDJQOU6mc=;
        b=R8FgfeIABDpA6VBFbuLzcYIh1W9gw725Pk1fZJXZlGDx2uw1CU7fVK8fTLTj8h8szN
         oLvb4CXWbrJ+iWo7JzyMQOBXtn8F8/3rx47OOInEZQDEN8mMPtThw5ps9aVD6SaG74Uz
         IXXmY9l1WA4IQFlesdmKziR6da4ydtFnN40wkRJ4204wpDm3MRCWK0bBq3zYl9ZNkCC1
         +DtwVaO+uFvjH37HTlnvW1bTi6cFIfDaefBFDW/KJ08Vxyx+YwdB7pxHEKyknYt7EB2q
         arJBlOiWOUmFGz0ER2WNxHiqyZOu4UQfMSYzJlGIR/A7X6T5MAr5JKOEfPMtbP0r84jS
         GNsA==
X-Forwarded-Encrypted: i=1; AKwUvBwnmPr0g4H2FW4Iy1lRuZ0QaEHoI5CB/6bZkh5f+wgcDS5km3Y6SzMSo7y+2IJBZc8xs9NLz8TQaJv63DY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6Y2lGWBoblq7ack1rZk832kRWo6v6AxSqzZ8bUfcrN54WFz7L
	afBzfqOt7+UCY+V+Mh4w56eWdR6YE7x7HRP8BwniJn+cMvpO4hg6RMemz38cVrwJJq8knC3OGH+
	FGSozzyqDFKIxcAaHhJA3fqFpfdG/M4MRR4lEJjKQJzDwimZpBd0DsxxESY+1mKXsdgJaEczqAe
	9jfWhOhlmeQn1maqC6nsP4x+YMgdx/bFy+d6dc1h+EXw==
X-Gm-Gg: AYBFou23JBl1cz84XNdPs/tuIVRTwZQeAcrV9GQFBeFuLS3ssAfo3ib98myzpYKYpLi
	UBHxNDH+dS8aP92rCxhklbj9c7MJBFkNHM4I+qwwLNpLWWuDf3F51Y7g0FUSz47MNFMRynI5ATA
	MpHRwx2fHjFixSfqydJJi5gcjUKZjVp3qGkIJs0+AlH3/+7g62dclcEOBENaKZQ8io8HI8cKKUz
	ixCE4+rLNbthwoV5g==
X-Received: by 2002:a17:902:b905:b0:2e4:a338:3658 with SMTP id d9443c01a7336-2e60051d4a0mr35952285ad.42.1791462122976;
        Thu, 08 Oct 2026 05:22:02 -0700 (PDT)
X-Received: by 2002:a17:902:b905:b0:2e4:a338:3658 with SMTP id
 d9443c01a7336-2e60051d4a0mr35952055ad.42.1791462122438; Thu, 08 Oct 2026
 05:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-2-3c402c66f388@oss.qualcomm.com> <20261006-romantic-stalwart-seriema-90e71d@sudeepholla>
In-Reply-To: <20261006-romantic-stalwart-seriema-90e71d@sudeepholla>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:21:49 +0200
X-Gm-Features: AclHuK8ZT7r3xmegX1XclNDyrJeEDtHELpRcrHYyZXH39CoY5X64BysHsJ4sp3g
Message-ID: <CAPx+jO-T_0KT3GytYu8w6QvrhXFQNZQzR496RL=McU6rnMtnPA@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: Add support for system-suspend-only states
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: maqG9k1q0QoDIE2MLcoCsH0zUIEPG54-
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac78af0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=3wAzXcUKBgoAJ-C3A44A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0OSBTYWx0ZWRfXx++Hi1kBmTJA
 oVlCUeuidrBvT+faojUZk5wkMW1FDwq2SZiovjxbErZHxMgUL9PfXlr7sSkULXO94kiP4Ip12nK
 w6Rou46Wsdx65T6VztRmK6YZE6W+0ks=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0OSBTYWx0ZWRfX2w9Q8N0X99MU
 v/GAqlzGqHyxLn8YnemQqor1/r6ZxYvIV0noiVynn9lZ7rJVfuZ+lhuFDKDuW+J437Cp+YqFUG0
 vRy/+zzCXmMEaCuZE8SRAAIyV5gvH7ckg4YbuT5o4hRderAop+1YVBLbORPIswvFHT2BLK1WP4s
 ss6kHSOT2BYucY3IXPp57Krd2hntdTvK7YRlcHafpUbRS6NglBjwWfEH027auBPMiVMH9LLrEl2
 0Wk7iL/SjQ7+HpN1FNJjgoKI8Kl3LzXp/k+p6MHp0/hTk5Ddk/9GYCYVnyepcPngO3GvTIlXm6U
 VKPka6hO30q5otJoC4O40a0DUEwC6SdHp7mpNOxM0mzWycvHXAG81KAVgrl38KDymI9ld/+HnHw
 8LQyCLzRC214qpDwrMPguihWh0T3GfK3698ypnPwGeZxfqS4vDWnpQYXLPySMhQy7hWnSD3lmO7
 4C+8PJoFSmAyCzkZYCg==
X-Proofpoint-ORIG-GUID: maqG9k1q0QoDIE2MLcoCsH0zUIEPG54-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080049

On Tue, Oct 6, 2026 at 11:15=E2=80=AFAM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:
>
> On Mon, Oct 05, 2026 at 08:59:43PM +0530, Maulik Shah wrote:
> > Some domain idle states require system-wide coordination and should not=
 be
> > selected during regular CPU idle. However those states remain valid for
> > system-wide suspend like s2idle.
> >
> > Add a per-state system_state boolean and populate it from the system-st=
ate
> > property. Make the genpd governor skip these states during CPU idle. Le=
ave
> > the system wide suspend path unchanged so s2idle can select them.
> >
>
> Instead of this I am thinking if we can QoS cpu latency setting and block
> system level states normally. Since s2idle is user driven, it should be
> controllable via user-space and we don't have to define bindings again
> if systems that use platform-coordinated needs this too. They may not
> use domain-idle-states.

Even if we likely could make that work, it's seems not correct to rely
on userspace to make the kernel to pick the correct idle state, while
the decision should be based on the characteristics of the HW.

In regards to PSCI PC mode, I believe we should consider adding the
similar DT property for the arm,idle-state binding and make a
corresponding change for the regular CPUIdle path/governors. Although,
it doesn't necessarily need to be part of the $subject series. I would
 be fine if that is handled later on too.

Kind regards
Uffe
