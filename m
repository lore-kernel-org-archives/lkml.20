Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F714399DD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385352; cv=pass; b=KoTsNtZ9UYWEJ6H7eCsonUbKzVNVjvwQP1aayG7STTXQVPOKO/f6zj7OLbxoC2GmmtIbHzDKdHFHmLNva3N1bIeRqmzPQluzrMw7c3Ym9ocEtJc6fTQWRZGqz3z11H7J4Tx5W73Y3k2MqBHUCXEKFgkCDZd9Wp4/BGzrF4jjW4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385352; c=relaxed/simple;
	bh=sESUPPWq/CMboQ5PQmmk2MKfkkFYJhL7/gKSrRe1IkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X1S34Se6AC2h7y0CiOugPpyhQfNTorK7igYfhcUBZKu0P7U8pISZbUoFc80u9q9XoQMRKpOXQIk2Iy8jM9fZEVuWk7LvKKz6YaDmAb7vp003yoocynsaeDoosP6oKwvmZ1leB2yMKltprAcJpnIdgez9ADfNk0ANqLMKlHO+Ifg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=caRqaS2A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YD6oI3Qi; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="caRqaS2A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YD6oI3Qi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm7T63793323
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vu8FzaKqwvVKte6/8Xq/EhQXyU+EIfm/StcQWbop8JU=; b=caRqaS2AxVs7aeG1
	acaSpuQ2wtaqMV2Jcb1gFqnQboOUQA7+5b2IPrpYgQnnX9Zr4dkQkPJI0QaKMFnp
	DVhFHKvbuIhTAG3fC0NtC1mHIvH9NredhDP+UHMr63HmwvySYOdpXrRn7GQgwWPx
	4u14ckoPSnF26FkPNgKnP6qJB6JwIkRjd32bfjr97v6JL1W2LAVnasrkrtZzkVx4
	0sbWMGZhSmUVBgXPS4f6iAEXOc2A+pahveMCJo6mfcphbmhkrReAyjcSJNKPzWBm
	8dQ4pH6RbkAwsHkAjh0Jey6w80HXZJTpkdTydOXKsUNG/F7uYu7oOxQZm3vlaNqW
	gJhHog==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg0wec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:29:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso4272152a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789385345; cv=none;
        d=google.com; s=arc-20260327;
        b=PQhg54MO5Ciw02VuooEgoMN4NJLmCAC/iAhl0dppYyoMvIFksPF8MBAbbbtmt63YFq
         JdFxLPWQtff+30hCn5gjktw45kUZ6CsDexzWPYlosGqlnhXhZyQHilv8rxAPx1SwT4tV
         /S5B5KSA/c5rjen1Ys7a6gD55QExziC6fuqYTX4WCEKPJhL17GCbWD+KPKngsQshqPi8
         hC4nZvC48U4o0vq6xw8z0Eaibufr/LGoMkUMAmxOixxiNTQyieZMBDPy6NcdORS6ujyz
         aRYXFFzcD8vb3YyZBE1b+BC1LWer5dh/k9CfXCavYlvejsaI9BLnPF2v5Glsl/zOxCnH
         CZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vu8FzaKqwvVKte6/8Xq/EhQXyU+EIfm/StcQWbop8JU=;
        fh=Z0TBdtrjcblIA9ZdB5Za8c0NJ5QK9kP10V9xQ4nsDfA=;
        b=VoIUobjljO9gIAoE9CdwwyKsWc3Odu672hIWzWFMQpMf8g48V54F8GVS4UjVvzYTiM
         kpb/1LnmlrqPCH3kVDL4JMMT7LC3+YmNbbacmqvqmDBjWSvCzvaQ4jDamZwURq9S3+rI
         XFJgfTqTKOcH4k0Kl5JoItsr94oOFfBFv6HiL4tpDoDemkFA20pN5GiXfxia+HiWptEA
         hssfJOoPVqcksC2lNiWLjOrDo+nGsfJnRzmU7xjAAUwvPFraq/EQ3M4r1TWXfQlyyX/T
         hQosIbKeq7lS0war0PGhKyYxFRI1zdDH1kkoMtekZhjSAZD8FF6Q1B7EYdof5+EKlyk0
         nLOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789385345; x=1789990145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vu8FzaKqwvVKte6/8Xq/EhQXyU+EIfm/StcQWbop8JU=;
        b=YD6oI3Qi3gGlDyV8OJnyOo6COs2tfUMcwjjTCdlHdirYdWJzVpTLLjhVHNXKtyHfvO
         ItHmNw3R/nWMaqgQubJwa4uqJiYJvgv11yz7uzqU6QCU/uGeLpWREUtS/dXSKFK2OP4l
         RhrphuojRzL48T/oYvNqdIWmOODpE7k41ujfxprHdcP9Ud3BhRdq3yTQ0GKqoKc6Np3E
         +fCAcYVBPyNb0iUKr22Wrk5YjCX63ecJsrtCteogKp91m+soHao4cuyLq6OqGFWzGFOE
         HQ4uRl/ZudnP8xui3ISSevp2NLo4jCSztd2D9GyyG+DNEGR4YVjMnpR5FglG3Xcbc9FR
         xoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385345; x=1789990145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vu8FzaKqwvVKte6/8Xq/EhQXyU+EIfm/StcQWbop8JU=;
        b=BldrElb4kU5L1ApAngHnMRza1x7eLj25kYX86CYb5uUxrdQ+mRY/BSn6mvUPZk3Ip3
         nbzlW9L8p9QZTwu0yJQLVndpaZ35RjU752fFmBx7dW6Qr6fX5Khz1JCpzmkTJoyh7jDL
         TD7B/KxNizCzo+42sui+LSAxryTjmfDplU76Npye+sxg+BO0Lv0Lxuhn1y/ojB16eLy1
         PmUYg00npnTaInpKF0AiYv+kjH8CnTK9q3x4XM8TDFlh/eZbZm37j7pSB7EU2I5NOSle
         yt2MW2VrjfhbluezNPVxNTetCYXURq1nhEZteZSd5eatjyaXwcWzjbzKXqKF8dqSHQes
         1DEg==
X-Forwarded-Encrypted: i=1; AKwUvBzqLIOVOgFpHnHuu9aSVoN5EWw664UQCDJ9q27/0ns1cZuDM9cDaW91kbXri5udzHuQKwfol1PP2Vpfs1E=@vger.kernel.org
X-Gm-Message-State: AFuF++nyyKSDb4f+Mg1H8ehF9T6u/Df+8WDHUWcIDPo+XqSZMYM1I2XC
	mA7iRth9EcsQT8Hczda7+OWdYVCUwvIqmXcvn8AFXOBxjF6r633zS+RrYJgooXSWMCpVVk47uNd
	6IHNiIyFuXrg1goyXeueqrKcXf1ZuCXjpTxpbYc1NVGlG8Xrj4EFofxvovhIxP8jdINv3UtjQJC
	PxJfvYP5GEUMlVXN5htDTcMZ/z9SI9mrHNbprDrWdWdw==
X-Gm-Gg: AYBFou2aF0f7ARsfY8sByqSOk54x27c51s68soiDlpQ+ikmVX9rw846wvuyBLgE8l2d
	p6QFkuebfyi92QveRTXgfPUqBWvJAD4Gxy2uapyqAPl5Mxm0wYTeMnWxzetltBF27FWL93BQMwZ
	6qIDcxvyo9ltI4dUdPhz1s/J3voeJMkm0pQL4hdS3y1jNI5KtIzyi+AiSimA==
X-Received: by 2002:a05:6a20:ce49:b0:3d0:cc29:ff64 with SMTP id adf61e73a8af0-3db40642804mr5427121637.15.1789385345393;
        Mon, 14 Sep 2026 04:29:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:ce49:b0:3d0:cc29:ff64 with SMTP id
 adf61e73a8af0-3db40642804mr5427033637.15.1789385344914; Mon, 14 Sep 2026
 04:29:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
 <20260907111659.263324-5-ulf.hansson@oss.qualcomm.com> <327e3afc-0803-4ca4-9c76-249077ab9b2e@gmail.com>
In-Reply-To: <327e3afc-0803-4ca4-9c76-249077ab9b2e@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:28:54 +0200
X-Gm-Features: AcwNN1WlCy19af4Kdfv9qzAUmpjAMUrSlWlur374POXIbZWJybPNGsXjpQRAkBg
Message-ID: <CAPx+jO9P=7i48OAjCZTRbdKgPSLvyKjXW+z3sRcNExSc3-Zd6Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] cpuidle: psci: Initialize the PM domains in
 powered off state for OSI
To: Dhruva G <goledhruva@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7da82 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=rXashWC7mhQ_VnoTN34A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Fv8956TboDw80K8JYRJncMxmmIcT1Q68
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2MyBTYWx0ZWRfX2qoODaFh0sC/
 Rw+07s3rWOQv5/5x+u84CXFBn6l7J3Vq/IEZYaKw/xkorOR1D8rbP3uN13SzOBrlXXtscqwjz7d
 eyUgUOTXc7HLTM49iWtllyD/omuA1aU=
X-Proofpoint-GUID: Fv8956TboDw80K8JYRJncMxmmIcT1Q68
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2MyBTYWx0ZWRfXwL/dhw8NnlAa
 yMsjBf++nxtIG3otgUK2S0riaRI8xFF1k2W9UqBcLt67ROKZb/FeRdfCx9AGcz0aknTJoI7wQMV
 YjqZmGsqf1Fb0N2Tzxw5rhr/Fyg9r226WT/OodFbeK1+C/fUVRRbjI7BcHcSsEu9umyRqquaUK5
 KLTB0KiZi/nr301qqbUaHBWvQHzOPBaG/VCDh5/xjWbS9/oqRSp+Vhmv6PazzwJwMY99GVkZMl8
 3iKcZDyrsXPscA12WoH0eBJ0khHt69hAwR9V3a6o96C4kv1ox4yXkjqLnslxhg5WJBb79uq4m1t
 cWQCK0oeaGTgwRW3luJUiLMjNAUPUCOZ46yNduS9DlDwl4H1j2QePFkrM5QASQLn90lizmsmth/
 F8a7f1hPDPVN2GLijTWrlfYUrwwL/UYv9pGiNjq0vs2hVuNV//GfBYiIAZ5X1Q1xeJYrquACOze
 MqB2rlodX3ly2kLh3pA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140163

On Fri, Sep 11, 2026 at 6:34=E2=80=AFPM Dhruva G <goledhruva@gmail.com> wro=
te:
>
> On 07-09-2026 16:46, Ulf Hansson wrote:
> > At the point when the PM domain and the topology are registered through=
 the
> > genpd subsystem, it's not really known whether corresponding CPUs are
> > online and thus if the PM domain should be initialized as powered on or
> > not. Instead this information becomes available when the CPU devices ge=
ts
> > attached to their respective PM domain through dt_idle_attach_cpu().
> >
> > This is a problem when using PSCI OS-initiated mode, as we may end up w=
ith
> > a PM domain that has the genpd's status indicating it to be powered on,
> > while it in fact may not be the case. In the less severe scenario, this
> > leads to selecting a shallower domain idle state for the PM domain than
> > necessary. A more critical problem is when a non-CPU device shares the =
PM
> > domain, leading to their corresponding drivers not being able to trust =
the
> > status of it.
> >
> > Let's fix these problems by initializing the state for the genpd's to b=
e
> > powered off and in the deepest possible domain idle state, when using
> > OS-initiated mode. The support for ->sync_state() is maintained by sett=
ing
> > the GENPD_FLAG_POWER_UNKNOWN for the genpds in question.
> >
> > Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> > Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc0=
23f5@oss.qualcomm.com/
> > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> > Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> > ---
> >
> > Changes in v3:
> >       - None.
> > Changes in v2:
> >       - Fix a bug in the call to pm_genpd_init().
> >
> > ---
> >  drivers/cpuidle/cpuidle-psci-domain.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cp=
uidle-psci-domain.c
> > index b9e4ad7d43a3..4d8c63d329c2 100644
> > --- a/drivers/cpuidle/cpuidle-psci-domain.c
> > +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> > @@ -68,7 +68,8 @@ static int psci_pd_init(struct device_node *np, bool =
use_osi)
> >        */
> >       if (use_osi) {
> >               pd->power_off =3D psci_pd_power_off;
> > -             pd->flags |=3D GENPD_FLAG_ACTIVE_WAKEUP;
> > +             pd->flags |=3D GENPD_FLAG_ACTIVE_WAKEUP | GENPD_FLAG_POWE=
R_UNKNOWN;
> > +             pd->state_idx =3D pd->state_count ? pd->state_count - 1 :=
 0;
> >               if (IS_ENABLED(CONFIG_PREEMPT_RT))
> >                       pd->flags |=3D GENPD_FLAG_RPM_ALWAYS_ON;
> >       } else {
> > @@ -78,7 +79,7 @@ static int psci_pd_init(struct device_node *np, bool =
use_osi)
> >       /* Use governor for CPU PM domains if it has some states to manag=
e. */
> >       pd_gov =3D pd->states ? &pm_domain_cpu_gov : NULL;
> >
> > -     ret =3D pm_genpd_init(pd, pd_gov, false);
> > +     ret =3D pm_genpd_init(pd, pd_gov, use_osi);
>
> If CONFIG_PREEMPT_RT=3Dy,
>
> psci_pd_init(use_osi=3Dtrue)
>   -> sets GENPD_FLAG_POWER_UNKNOWN
>   -> sets GENPD_FLAG_RPM_ALWAYS_ON
>   -> pm_genpd_init(..., is_off=3Dtrue)
>   -> genpd->status =3D GENPD_STATE_OFF
>   -> RPM_ALWAYS_ON + OFF is rejected (pmdomain/core.c: pm_genpd_init()
>                                       rejects an RPM_ALWAYS_ON domain who=
se initial state is OFF)
>   -> return -EINVAL
>
> Therefore, on a PREEMPT_RT platform using OSI and hierarchical PSCI domai=
ns, psci_cpuidle_domain_probe()
> should fail while initializing the first domain. The genpd providers are =
then unavailable, so
> dt_idle_attach_cpu() fails during PSCI cpuidle initialization and the dri=
ver rolls back its CPU
> registrations.
>
> I don't have a device on me to test this path, perhaps one of the QC devi=
ces + RT config
> can reproduce this?

No need to test this on HW, it's certainly a problem. I also noticed
that Sashiko pointed out this as well.

>
> Should PREEMPT_RT case instead initialize these domains as ON?

I don't think so. Instead, I think we can simply drop
GENPD_FLAG_RPM_ALWAYS_ON. The main reason to use it was mostly for
optimization reasons.

Since we don't assign psci_enter_domain_idle_state() to the
corresponding ->enter() callback for the idle states, when PREEMPT_RT
is set, this should still be fine without GENPD_FLAG_RPM_ALWAYS_ON.

I will give this a try and see how it plays out, cooking a v4.

>
> This might be safer here atleast:
>
> ret =3D pm_genpd_init(pd, pd_gov,
>                     use_osi && !IS_ENABLED(CONFIG_PREEMPT_RT));
>
> Regards,
> Dhruva

Again, thanks for reviewing!

Kind regards
Uffe
