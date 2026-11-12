Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794490144;
	b=Lxdp8Pry6jvKUOwgiqCK1jy8tjKFGudo+h9pi2vaGVCw+ye5p6S6qkAk+F3PImim0I/b
	 MVbCX6mvDG9i0kkEcFfRnykaN7Wq3ZjNVWUMkLwvR1gnD603tjkfL2hU9SKaScW2uTchj
	 izQ3nsm1w3ZvD1C/q92E7JJgJW8eyeAheV5BfnC9IWB3PkeZIibyuPvAb1nRlLg0lJqTi
	 OJaodlFR9afbEdn95bCSp4JzdmlEwRmUy9p0xOpqWOJ8mxj3D/Xqat+HHm2xwSew41Sxz
	 8R3YCXlNa1dZXOhSrWvGLc8xmrr84wFG/dNZ0gUMPoh47MglP/BO6BXBMcUoWhukhug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G3Q7qE6C41WE2EwR7PBZ31iNaUmwvqxyBhTAIBDkPGg=;
	b=mBAbQDYa2Hc4Za/9iYyofcIAWo4VXGiQrHae83zISWagz0980KdKOfPZH/fUmY8te2rK
	 7Ajyj6zuDAMyJDlgfE61kv2fTqM4gH7Kvwm+gmp4/OAjV5B455sqxL2OO9nezeQkS6l4G
	 1M+IdKzzv5DlSuVZjh9Ds8eTa8jUbSHA7N0gLvhxSJrKfxIJfqL5CoE1An8qnUpvfrU8A
	 XlJIuqKEHy4SFn4qyDEdX9Zw30DabjySNoDBjoiHNSuK0luHZnrA5hlU4wH+pNiCkeRgC
	 Urky7jgqHxqGe7RF/Zcbch6DSmk4AMtptNKlTQabpl06QeNyJVG8yyuI5CEKGOIW04Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHKb5eDi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C0bQsvZc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F88606A334
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37F88606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHKb5eDi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C0bQsvZc
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAuOk43476750
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G3Q7qE6C41WE2EwR7PBZ31iNaUmwvqxyBhTAIBDkPGg=; b=aHKb5eDiJpJBZRFN
	dRbClG27Ae9U79uxSNr929uJvTBsePeZmwMFP3+eDEXVhbw4wfjnyg1JPybA8N3G
	+qmEq+oY953GmpmWM8i/ru2g6aexJeAFwthKXyWr1FNvfS8mD2cM+QSA4YByU9yC
	fAgJHz3YO/43bTF7pM74x9pKJSJGocSqZ+6Grq6M+tO45wV9GAaP6kALoHFrKjGc
	RQRkQAv5mtOJYmxjtaiTu68Jg+5S7rfBPCbK2iPM9I/QzFFkLMqTldmoAfr577yP
	gWO3W/JiqEAGig25TIPQaU9lp6XMR0r0BRmJAd5bh2vlj52oUhR/X/JY1Vw9Dj+5
	0pxj2Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yuhq3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:29:03 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ecd7e10ca7so1047367e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:29:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794490142; cv=none;
        d=google.com; s=arc-20260327;
        b=kt+OI0ucPc1MgA64/1mmcVgiM5uSvFnvkFXIXPQ/y6Y8POUEvPfrikXvEY4GdOwkUd
         w+nULJ12el0V/CsILzclqJZm+/YTljWs3XrDvKxP0n69CwSxxynDpe8PZicBzQ9GyA35
         L/qNVx+oO068rbKZIXdos3LjlKIegpAaSqCSDZjKRFfoUzrQWIp+9ToRxH+pG46YoyON
         2vkfYoMKe0vzTAGlJKWhOUBgWJzeY4ERHfMjaREy0WaYSoYh0wxqJr2Ugjjr7aHnhM8v
         PB2t0U4RpIPt/RnUOA5bNoyhm1zszqcT3Ff54Gbx+gscqoZIlj1yHkzdHpam+BRTWH2i
         qvoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G3Q7qE6C41WE2EwR7PBZ31iNaUmwvqxyBhTAIBDkPGg=;
        fh=MKRvaq2tw0wsPYqt6G/JH2LHOq7rMeB4cy/LIEQ7mBA=;
        b=HRbCp3pdMNjRQO5WdSqwqVEZ1izs9HPwZKF2icJi/5wgTLKy8zTeicNF7+Bv+8so1j
         mJDl/LsohpOGbCfdT9ToItOtja3XCEUTZjYd0Tnnmscul3zVEw3EOIJnHjRKkllC23dB
         lWZMJBiaKGF2+IPajU5ThJ6Hdhcx6yhdnOVDq4C3hS2T3w/u7LMBElu+t7Jh0pOuWo3/
         tbN9tXzKwmlhmQNkcY4aLAxKGnd/ROTjbsDuXDfZsGjimsvyOtF3nQQoIOA+r9j89qyT
         bMRy/A9frf1UXG0lN9OctcPtRHckXMFUUNklc1vz4l7QKNL01kFugLGIg/Etu/LL+4WB
         yKig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794490142; x=1795094942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G3Q7qE6C41WE2EwR7PBZ31iNaUmwvqxyBhTAIBDkPGg=;
        b=C0bQsvZcLSG3G+FUDQMbBHnANZDfLe6x7EFQosPHhfJoEwGw+dCy0doUj76ujJCuN7
         qFP2YT0rIqESS7uHX4EIvDrKpM38V5KYPalkz3KRxuQ5rpmREUoLO/KxNFyQl4qs5nFp
         FT5XTwxct1D/AyoyVX0Z9Oi8liXbFA7wMQ4CikjphnsJPKgMpwuZ3Zg0Ro+Dw3SiCT0Q
         YHhBZv5mJhu+jmNd/ygNKwNoYmnMm0HiySlbWd4OCeTnzPANdeHhEe9pDqBLfOWAvzCo
         v4R4fyAJAC6ZF2CmL1twKgXoZFgabVtsVRLt3GLd4LFFd2H+78oK8ZXW5jXr1Cst4brA
         ViPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490142; x=1795094942;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G3Q7qE6C41WE2EwR7PBZ31iNaUmwvqxyBhTAIBDkPGg=;
        b=1NHLZz4dqDZ6zUUVkV862+2p/1LB0ky/F1rM91r1zcZuSziQQIMj66cSOEq0q6HqIX
         rNhAFs4/Ius//qz4/ZzA9/UaWeHwsZpIRWhykRgR1bnUr3kNOr/TrNN4/MYxE4aftcb5
         rEVKllB31pFzfZ/AjEs2Ba924gfVD7k3tRJy8BrwRM/Bi1/IY4ioeLO8FRM0r4nXWWnl
         Iljym+HwDRQIUtgR+dMzNXnntdiMG+8UIz75S7rMIvY35P89aI3EQpRCFIp/ah/fTglJ
         QRtaFwNXnmN2VrCApaonAei2S9LQId7awHouVpFqd94BJ3vd30OUjyX/AqtcflFQWw3I
         V9iQ==
X-Forwarded-Encrypted: i=1; AL+hErFtTNiMzMICLdDmi1qH9GXQZAb0p+v4Wd11Hmu4o0b0yEoy+wtXEjgWMj/ArlpQRe3TVeq6J5OsK391mjQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XaevZVRoAER8EvkVroV5gL8wCSqgYYKYlScGGXXqW8/RVb/aw
	5JO1g//WBCYboa7jktQeAx6e4YmgfGDEb9K5HFEePuhRgWM+7VQXrkLTP2WcEwNITQaetROct6M
	yOlRbpxX9vPi0JJsn3Y8w0hIQ6peEWCOgE1Vxggh9dvfHGsUPm7GRfwoGg+eIZv+uCXZqXaa0wU
	rTtyP3jkwhvaHX4J8Ft1E/UG6S5Nthfu2tDrQx+qTrJer6uSKnIbdl
X-Gm-Gg: AYBFou2URzfuzXzOdOFz5vDBqZNCM1E9EV3jwG/1IIwkonFdM1DrkKxN9sOgITsQ/af
	JffouOxlUS2o//dXn5WQbcNy53eFYNAEEe3uDaY6YCXBz3tCXuTavqh5jgl1ifYgXoWtNvwjy/i
	ZFN3krDhsNldHOaUZWNqr7gNVJhXj+ltj1kNEDQgzEqVdNqjuLSJemUhc0Yg==
X-Received: by 2002:a05:6122:e153:b0:5ea:d649:d1bc with SMTP id 71dfb90a1353d-5ee1c4862bemr2162812e0c.18.1794490142302;
        Thu, 12 Nov 2026 05:29:02 -0800 (PST)
X-Received: by 2002:a05:6122:e153:b0:5ea:d649:d1bc with SMTP id
 71dfb90a1353d-5ee1c4862bemr2162804e0c.18.1794490141804; Thu, 12 Nov 2026
 05:29:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013-genpd-boot-performance-floor-v1-0-a765dc83e6d7@oss.qualcomm.com>
 <20261013-genpd-boot-performance-floor-v1-2-a765dc83e6d7@oss.qualcomm.com>
In-Reply-To: <20261013-genpd-boot-performance-floor-v1-2-a765dc83e6d7@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:28:49 +0100
X-Gm-Features: AclHuK_Jzud3kBQ84L6hP3FUx4DNmy2hVYEuv1wt_UfgwdBavzJj52wOLQfTyB0
Message-ID: <CAPx+jO8krEjuMvgCP5Hy1V=oV+13dRj0WQkGCjUpN1cQn5XwNw@mail.gmail.com>
Subject: Re: [PATCH 2/4] pmdomain: core: Prepare boot performance floors
 before system suspend
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: b3vPXlbCIss6uWRUj_Y4aJgDtelM1G6o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX+nKgj8ETMEVX
 bssApuKgkJYFdufxc8FC98sA0GPrw33QFKEz8aGo6/om6JhM9LoFV4lNU0HmKBGeJopWFv+nmPf
 DJ7BdH8u7q5BF3QwZXM40XFHulUDdIg=
X-Proofpoint-ORIG-GUID: b3vPXlbCIss6uWRUj_Y4aJgDtelM1G6o
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af5bf1f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=CEUtmdPz_awSc1UMDkkA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX0q77hdZ5LCTl
 IcVIQKGRqILi4c+9ePNOCK6VCTxAOKLIyFyGNsxT7Ybk+eumvtluwkvOGrEaOU2HbRMr35gkLG2
 lT+qqRJerVC+FRhclDfDYGIIxdcs7KH1yruxwABzdft63iDw0JwPxZfCEinB9Q1mOu/JyD9CA2j
 5Xrl5qs6Ob/ht8/89JDp6mcPaP9+53SravH4dTPfZNqu261DCebrxLDKOtqMlPHNpuqjS4B9nZx
 bxWbXnrWDxs9hc9JyHyMDZyCbs64n7jwnBXNsKajHpOCK33bV0xdNELLqV8hlNrJZTDYmIYFH33
 kjKZDPXcgeATAClgMvd1cnte91rHMXzL9oHyCrme4mDjZoU4lXjrrKPrEi78YZNiknP/kmlVcxY
 EMrZ5mUS2Df0fECFWObpv/ChqxPEyirViWvWqNc3B6kixQXEJGrHJmiRgE8VP1w6KUoTcZ8I2og
 R83Uu8p/86IaLnwQrIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120053

On Tue, Oct 13, 2026 at 2:49=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> A system suspend can occur before a provider has received sync_state().
> If a domain has not been used through runtime PM, its boot performance
> floor may not have been applied when genpd_sync_power_on() enables it
> during resume-noirq.

Would you mind elaborating a bit more why this is a problem for the
platforms in question?

>
> Prepare boot performance floors from genpd_prepare(), where performance
> callbacks may sleep. Walk the parent hierarchy even when the device's
> own domain has no boot floor: a parent without direct consumers would
> otherwise miss preparation entirely. Take parent locks in the existing
> child-to-parent order and propagate preparation failures to the PM core.

Question, if doing this in genpd_prepare() how would that protect us
from changes happening later on during system suspend, when a consumer
driver decides to update the performance state vote for its device?

In regards to system suspend, even if the sync state has not happened
yet, we are doing a power off of the genpd. I assume this is okay,
while still keeping the current genpd->performance_state or maybe it
isn't?

If there is no problem with that above, maybe it's easier to continue
to let the genpd provider (through its ->power_on() callback) manage
the restoring of the genpd->performance_state itself? In that case, we
don't need to care about the genpd->boot_performance_state, as it
should be indirectly applied anyway, right?

>
> Also retain boot power protection in genpd_sync_power_off() for domains
> with a boot performance floor. This prevents the system-sleep path from
> withdrawing their power vote while boot protection remains active.

I don't get this, sorry. What is "boot power protection"?

>
> Keep performance programming out of resume-noirq. Domains with their
> floor already satisfied do not need another performance update, and
> no floor is imposed after sync_state() releases boot protection.

Please rephrase this. I don't understand what "releases boot protection" me=
ans.

>
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Kind regards
Uffe

> ---
>  drivers/pmdomain/core.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 6f2b406ce049..4ff55175d899 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -1538,7 +1538,9 @@ static void genpd_sync_power_off(struct generic_pm_=
domain *genpd, bool use_lock,
>  {
>         struct gpd_link *link;
>
> -       if (!genpd_status_on_unlocked(genpd) || genpd_is_always_on(genpd)=
)
> +       if (!genpd_status_on_unlocked(genpd) || genpd_is_always_on(genpd)=
 ||
> +           (genpd_is_power_unknown(genpd) && genpd->stay_on &&
> +            genpd->boot_performance_state))
>                 return;
>
>         if (genpd->suspended_count !=3D genpd->device_count
> @@ -1623,6 +1625,31 @@ static void genpd_sync_power_on(struct generic_pm_=
domain *genpd, bool use_lock,
>         genpd->status =3D GENPD_STATE_ON;
>  }
>
> +/* Called with the domain lock held, before entering noirq. */
> +static int genpd_prepare_boot_performance(struct generic_pm_domain *genp=
d,
> +                                        unsigned int depth)
> +{
> +       struct gpd_link *link;
> +       int ret;
> +
> +       /* Parents may need a boot floor even when this domain does not. =
*/
> +       list_for_each_entry(link, &genpd->child_links, child_node) {
> +               struct generic_pm_domain *parent =3D link->parent;
> +
> +               genpd_lock_nested(parent, depth + 1);
> +               ret =3D genpd_prepare_boot_performance(parent, depth + 1)=
;
> +               genpd_unlock(parent);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       if (genpd_needs_boot_performance_state(genpd))
> +               return _genpd_set_performance_state(genpd,
> +                                                  genpd->performance_sta=
te, depth);
> +
> +       return 0;
> +}
> +
>  /**
>   * genpd_prepare - Start power transition of a device in a PM domain.
>   * @dev: Device to start the transition of.
> @@ -1644,6 +1671,12 @@ static int genpd_prepare(struct device *dev)
>                 return -EINVAL;
>
>         genpd_lock(genpd);
> +       /* Performance callbacks may sleep; prepare the hierarchy before =
noirq. */
> +       ret =3D genpd_prepare_boot_performance(genpd, 0);
> +       if (ret) {
> +               genpd_unlock(genpd);
> +               return ret;
> +       }
>         genpd->prepared_count++;
>         genpd_unlock(genpd);
>
>
> --
> 2.54.0
>
