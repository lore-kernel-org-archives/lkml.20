Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50064A1DE7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437427; cv=pass; b=quZm5Dd3tfGbbipZuRFXzDFJjGXWfvK5fs0PpzwknYUUn7P6MisbagcKd7/URDlhsX+z5iClw8VtRsAOxUtisMi6Qguq98A1f8yLNxUj/vOuW5YxtbAVDlN7hi3AV3C6mdF80RdlunsuCv753NYxmiE1KSFUdeWNHgVxHLUwDmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437427; c=relaxed/simple;
	bh=6j7t0PuYSLHO5ttUmiv0eJYJmVPLsVoYh7/R/hbBR4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B3fxgV7hC+CYaWsDvMTKBax40aydC/y107cbwVGTlKpcK3Sxn+mQQ1z3H8cYCblRIU8CzK2cmJbagRldAaD7UREbesGl/YYXBH9pjfDnGK/Yoq7ipdN0+KV0qq0bJ7W1VPsjTTp4y6ySMwPDTRBk6D0yQ41Q0b+n8BU3oyxEOo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/u5A7qE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T8e2+6j1; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/u5A7qE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T8e2+6j1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHBhf162783
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 12:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DSbHTsqtVhnjQL48exVAucFN4ABmL2gOFoCQ684rxK4=; b=F/u5A7qEMzrjO8Pm
	yqHSeta7duGyz4XIev213chNKedcWNup8cLcDEkMPrc/rCF2poXhpjkjGkRde8YF
	H92Jefhd7xm5YDzxQxLf6oQPFuc0GUZPmVa9QurfqpyODGVMhaJh4yfnOM17EUAa
	kfKmRaf51eI2qsaO7kaNQ6giMyfhU45PZTu8R8OyS6oKBpqSTx6oWKH9j8KXr97B
	puz26z3poI9mk6nCH/cIBuN8Dkcf0vqgBG5Zj+dKW4+S3zQhWG801vUXQRjfqnm4
	G256uMqfHuGUVnxGpucCOfJimFHfr4HZmlOIl8ml+x+aPXBFuJS6+qRuvZEezql/
	21vrwA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx0ed2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:10:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d959904658so43397035ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:10:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788437424; cv=none;
        d=google.com; s=arc-20260327;
        b=dMiXBlMDupfxhmbDIlXJSBf+YVf0t/9mpCPO1Zg3QRs1Dg01vff7H2QjffCCEPz7hd
         hIjGeejvcyJcXHmAR9zXQ5emBZCGiUkclm2DjRcNBnNeD/pgXipwrAYaSduNKgeWOMJq
         wGhuYapmoVZSBkaSr2zvck2MF2kjlokEshO8ibm6rIa0RHOQhdiUubfglLrDq8PhHE6J
         5QsmFdWghaWs0BSkBaAec3jJn6NbbR1o/U1NPgkehtE2WBkOdamKB4mBPAWyqKtkwfYZ
         n/ZDyBdsdH/X+oFZQ9UU+whvuhClsxhBcxWwyUduSAR9gnE7SIJ3yaeUfr5HSJG+Klzq
         2xbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DSbHTsqtVhnjQL48exVAucFN4ABmL2gOFoCQ684rxK4=;
        fh=+aGkBeXSMQakrfvuIluJxJRJM/+sINs6mfSLK754P68=;
        b=Ks2ufkC5fAEzat1PzdsSRWKgftzcSdPf0tGhuRnYu0uwVDtexJKR1QtTbpyG4oArQi
         i+cJLxdYPATvF5uap/3k4C9tFV/fB6ePYIMbBxUKtndN+GjgtMHRD7AMsgwklmgY83WO
         lliHHiwpl+AdFD4Ewvj3x/lW0RgnKIC0w0wASxB4aha+oyr6XWkaHuybQkF3DB0Ub1fp
         HiltTR+k5rqH8b716QUDuGT/6eIPvj2+DQD4FrXjOD0Rz976qhzE2sJCFlRLhbWA5NQ0
         fsupEcCw8COCilG9o+3YNQVrl0c5s8S1Pl0WQYHlJFZz6oR1bRWAEoo09WoUhmVHnhr5
         yJVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788437424; x=1789042224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DSbHTsqtVhnjQL48exVAucFN4ABmL2gOFoCQ684rxK4=;
        b=T8e2+6j1gG80luLl6NRSU+WRUoKghHRk9BxllGkA0ajnh2bP+Qs4SJH2XSD7Nq/bI+
         cQQtr2EFqWUEJ2b7DqOhF/1vusfU2HOT1/Nke7/SrLpw384lqpcV/DN5JhlXlTWfI5BP
         8P718vzOXlc9r8MbJYWLEzc/8EMsI8VOB1H+/Fjijs3Ki4KqOIAY9BwBUpvM1jJwhcG7
         CJquraOCPqqokIWzOhoARDVih6UEWOKPG1qpR2mbQir5ARHjnwqzFcBpTZ4PziaO82S8
         1CiO+cTJOXvlyoezSRG+puSmtYZq6q+zs9eCiC5qZIvinbLMyVt9GSbZkvbC3eyGeiIx
         qD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437424; x=1789042224;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DSbHTsqtVhnjQL48exVAucFN4ABmL2gOFoCQ684rxK4=;
        b=NIwRpbUpPFlslyOxvZGrywkmcYquzfi/LSaBn0/lzvvLeVIEFIdjkvkdWrnuMBIOpI
         nClOBPMjN+i6jNpMa1KaBymqnDkB8vXbVSd/PTmWMmuw38EQMMGV8PXyi/XIbi7D+UCk
         NeHfUaENLiDF+S2cQkMOeFAXku89l2avPwYl4jQllMoOl9Ma1fCsQXn9fo+QF79QrK0y
         uFMQMQDc2KjANR+DF/sp3xUixYxFarNZ6GXuGCHTTCq3IELvO/AliW2GrW5mk/eG1+OV
         8xKnWSsoDw1qZwy+bgY8dIg9JpzAnTCKHEUWrlnnANwVPzilYJg+Mqa6b/3FIhYWKVzs
         IXMw==
X-Forwarded-Encrypted: i=1; AKwUvBxsgTTnmPh9tFXC0YRQ0yHZIj9T2tm++WRufoshRUDZOVB/dJyfwEFSvKpMGazCuTa5PG63EsNz2zOLtsQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mR1sCLvw89boB2B4snVu+zjRATPlxnj29U0I9o9iKEfXcX78Ch
	EXwOh+1P2tZPBa4YM28BofP5S3YNlHt+dDisiVHUdVL29HYtGlX9BGBiOlA7L6GZ7uy8WffQv7s
	+R6V4sJiOur9YIBsOJ90ASGw+QVs2qeqgHjp2X9thV8nq9Yn3p6frk2oJKVRm2bHzAWHcEkwY9s
	HclgjixN3kNsjAbvmHeNY1ARGR3Ga8B+8nKDQC9aCR2KCipa2qX7+b
X-Gm-Gg: AYBFou3sAmJKp52i/NUH8O2tQ8ATQ7g97moHJhTviN/KtBI3htQnusCX9hdUWGIP3j0
	AS5HUXLeHGPhmMy6RmzBmi5yYyfklV9rh5V/9EXKtG+XwuiQXGVqykV3F92TZmoSifKCbSzOYv2
	+IpHe7WAB2E8xUa2d3qbYo5asv398lVQuzjd/UD6ZpPznNq+c0FrRuTdiVfQ==
X-Received: by 2002:a17:902:e545:b0:2d9:6db:9fc2 with SMTP id d9443c01a7336-2daec6240c7mr148878735ad.9.1788437423310;
        Thu, 03 Sep 2026 05:10:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:301e:b0:857:72ba:ff10 with SMTP id
 d2e1a72fcca58-85ed4c1b522mr17373446b3a.24.1788437006071; Thu, 03 Sep 2026
 05:03:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-topic-lpm-psci-domain-callbacks-v1-1-4a47d95c9c79@baylibre.com>
 <CAPx+jO85NBZq=YCxhs5Fbo5rDZ7pGHHKiG2HRJUNVKj_1SOscg@mail.gmail.com> <7hh5k87qtp.fsf@baylibre.com>
In-Reply-To: <7hh5k87qtp.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 14:03:13 +0200
X-Gm-Features: AcwNN1Uq2Tdx3qawT7JRaungyUzupVuVJdcdX7A1icKcnMlw43ki1_-ZoYUerHM
Message-ID: <CAPx+jO8k6MNSdhmj5v4ceYr8XhgHk133LweJvRpN=kF0rHF7PQ@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: psci: Assign domain callbacks to all CPU idle states
To: Kevin Hilman <khilman@baylibre.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Scaria Kochidanadu <s-kochidanadu@ti.com>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Henct0rm9Qgq6uPgGqDYwDDXJF81EXG2
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a9963b0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8
 a=13slLdO5Tp32gFNFT6wA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: Henct0rm9Qgq6uPgGqDYwDDXJF81EXG2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfX/wRj+5e5tD9E
 hcuN58411fOe7pEyXdwpJ0Ecdmh8PpS/woOWB957E4o65GZJNk3lKVgYXDcDrmXIMlzG5DyMmOo
 WEiUfIcWJ4T5tTDSDB+QZdUEt+2Lhs914GEpqcGUtvw1x3EeTDEL55G7je8KtdJiioZ19OZOiDO
 eMXl2N5hVJE3hYh1pqybXCt2rfuQ5IZ9xDD1ZxCPJVz93/kXu9c5hzPgpwKbUmkq4KhjQY1Vo4g
 lQv81mFkVf+YYAaVvvauURX4N/BSp43qLkkEb0C9f6r8FG92XES2O3YUOzEzH7uRX36xJgsEpRH
 7PNyP2TSfnaUZ6fOb6f+xMy+nksMODmSrOHncIcfL/+ZIdcURGOznVjbaZftDHEGgHlPnP/18hT
 4AgyuLG19biYOg3C01CMN/gr4WFL2g3jjp911xZ+JdFtWLhS7LSedbm0X7eQxjGpcKgSb6kXbJg
 nfQK2oL1AqC3imVZWSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfX5v5EjP87Lzfp
 MdRKtDtMo3lD32e2xv48MY9zxBg3DqE/TVVRJkMicDs1dwrrdcdmTdktSZQVqEsv7oTSwm48CoE
 /p7BDnqv7yk+DPoblTzrwz5oIWdvrk8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030105

On Tue, Sep 1, 2026 at 8:46=E2=80=AFPM Kevin Hilman <khilman@baylibre.com> =
wrote:
>
> Ulf Hansson <ulf.hansson@oss.qualcomm.com> writes:
>
> > On Mon, Aug 31, 2026 at 8:52=E2=80=AFPM Kevin Hilman (TI) <khilman@bayl=
ibre.com> wrote:
> >>
> >> Previously, only the deepest CPU idle state had its enter and
> >> enter_s2idle callbacks set to the domain-aware implementations. This
> >> meant that if a QoS latency constraint excluded the deepest state duri=
ng
> >> s2idle, find_deepest_state() would find no state with enter_s2idle set
> >> and skip the domain idle path entirely. Similarly, during normal runti=
me
> >> idle, shallower CPU idle states could not trigger cluster-level domain
> >> idle states.
> >>
> >> Assign both enter_s2idle and enter (non-PREEMPT_RT) to all non-WFI CPU
> >> idle states so that the domain-idle-state logic is triggered regardles=
s
> >> of which CPU idle state is selected. The genpd governor remains
> >> responsible for honouring domain-level latency constraints independent=
ly.
> >>
> >> The enter_s2idle path uses dev_pm_genpd_suspend() which is safe on
> >> PREEMPT_RT. The enter path uses pm_runtime_put_sync_suspend() which ma=
y
> >> sleep and is therefore still excluded on PREEMPT_RT.
> >>
> >> Suggested-by: Scaria Kochidanadu <s-kochidanadu@ti.com>
> >> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
> >> ---
> >>  drivers/cpuidle/cpuidle-psci.c | 24 +++++++++++++++++-------
> >>  1 file changed, 17 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-=
psci.c
> >> index dcf20ea5ef5e..db9aa57c51f5 100644
> >> --- a/drivers/cpuidle/cpuidle-psci.c
> >> +++ b/drivers/cpuidle/cpuidle-psci.c
> >> @@ -250,6 +250,8 @@ static int psci_dt_cpu_init_topology(struct cpuidl=
e_driver *drv,
> >>                                      struct psci_cpuidle_data *data,
> >>                                      unsigned int state_count, int cpu=
)
> >>  {
> >> +       int i;
> >> +
> >>         /* Currently limit the hierarchical topology to be used in OSI=
 mode. */
> >>         if (!psci_has_osi_support())
> >>                 return 0;
> >> @@ -261,14 +263,22 @@ static int psci_dt_cpu_init_topology(struct cpui=
dle_driver *drv,
> >>         psci_cpuidle_use_syscore =3D true;
> >>
> >>         /*
> >> -        * Using the deepest state for the CPU to trigger a potential =
selection
> >> -        * of a shared state for the domain, assumes the domain states=
 are all
> >> -        * deeper states. On PREEMPT_RT the hierarchical topology is l=
imited to
> >> -        * s2ram and s2idle.
> >> +        * Assign the domain-aware callbacks to all CPU idle states so=
 that the
> >> +        * domain-idle-state logic is triggered regardless of which CP=
U idle
> >> +        * state is selected.
> >> +        *
> >> +        * For s2idle, enter_s2idle uses dev_pm_genpd_suspend() which =
is safe
> >> +        * on PREEMPT_RT. find_deepest_state() will pick the deepest s=
tate
> >> +        * whose exit latency fits within the active QoS constraint.
> >> +        *
> >> +        * For the normal idle path, enter uses pm_runtime_put_sync_su=
spend()
> >> +        * which may sleep and is therefore not used on PREEMPT_RT.
> >>          */
> >> -       drv->states[state_count - 1].enter_s2idle =3D psci_enter_s2idl=
e_domain_idle_state;
> >> -       if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> >> -               drv->states[state_count - 1].enter =3D psci_enter_doma=
in_idle_state;
> >> +       for (i =3D 1; i < state_count; i++) {
> >> +               drv->states[i].enter_s2idle =3D psci_enter_s2idle_doma=
in_idle_state;
> >> +               if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> >> +                       drv->states[i].enter =3D psci_enter_domain_idl=
e_state;
> >> +       }
> >
> > This breaks the current contract for genpd when it tries to select a
> > domain idle state for a group of CPUs that shares the same PM domain.
>
> Could you elaborate on what that "current contract" is or point me to
> where it's described in more detail.  I understand there was a reason
> for this design choice when first implemented, but now that we have
> added support for using QoS to constrain the state selection used for
> system-wide suspend (including s2idle) this "contract" is really
> restrictive, and doesn't allow the domain idle logic to be used at all
> for shallower states.

Right, that's a limitation we decided to start with, simply because we
had no use cases back then.

So, if we would do the runtime PM reference counting when entering a
shallower state for the CPU, it would allow the genpd governor to pick
any of the domain idle states for the shared cluster PM domain. This
doesn't work as is.

The CPU PM domains are structured hierarchically and the child CPU PM
domains that contains only a single CPU, don't have any idle states
that are managed by the genpd governor. Instead those states are
presented to the regular cpuidle governor as per CPU idle states.

>
> > In principle, if the CPU has a clock gating state (shallow) and a
> > power collapse state (deep), it would be sufficient for the CPU to be
> > in the clock gating state, while allowing the cluster PM domain
> > (through genpd) to enter a domain idle state that corresponds to a
> > power collapse state. Depending on the platform of course.
>
> Yes, that is possible in principle, but with an important clarification:
>
> Once all CPUs are in an idle state (either shallow or deep), the domain
> idle state logic is entered.  It's then up to the domain (or its
> governor) to select the appropriate state(s) for the domain.  If any of
> the CPUs are in a shallow state, the domain governor should not allow a
> deep state.
>
> In your example, you mention the CPUs in a shallow state but the cluster
> domain would pick a deep state.  I would say that's a bug in the
> PM domain (or its governor) if it would allow that.
>
> The job of the PM domain is to pick the deepest state that is possible
> based on the state of the devices (including CPUs) that are in that
> domain.

Right, I see your point. So in that case, we need genpd (and its
governor) to know about these per CPU idle states, as that piece of
information is not available today.

>
> The same is true today for domains that do not have CPUs.  If you have a
> device that runtime suspended, but in a shallow state (e.g. only clock
> gated), the PM domain it is in should not hit a deep (power-off) state,
> otherwise that device will lose context and not resume properly.

I totally agree that this problem isn't limited to CPUs. Generic
devices can certainly have support for multiple low power states.

At this point, through runtime PM, we support only runtime suspend
(not counting runtime idle), which means there is only one low power
state available per device. It's only PM domains through genpd that
currently supports multiple low power states.

For a CPU device, it's slightly different though, as we have decided
to model each CPU to have its own CPU PM domain.

>
> I'm trying to enable that same thing for PM domains with CPUs.
>
> > On the platform you are working, is there a clock gating state (or
> > similar) on the cluster PM domain, which is allowed to be entered when
> > the corresponding CPUs are in the similar state?
>
> Yes.  Not only the CPUs have shallow and deep states, but the domains
> can have shallow and deep states as well.
>
> Kevin

Sounds like we have a BoF material to discuss at LPC...

Kind regards
Uffe
