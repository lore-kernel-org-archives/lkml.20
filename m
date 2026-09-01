Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD58037F8C0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262426; cv=pass; b=TDwFR7QDFjwUusaFwo5uH/DKD1b+4jBggvXT9tOxIN2tk08ApZK74nNqHzzVWDp1x62ySyckSFZi5ZZTXYOHbOuTnhPSZ7TDGlqlHqaF64mG4FSk64nD/PxgWg5rbYO9nRTGtN6uj+v4iIIezqSLhiLbviYgYbrGqfQDmfMQxKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262426; c=relaxed/simple;
	bh=wqW3HWAbcn6wnvgBF5x69NdHeVoAaMWxdEowLgFtGl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rtkfx6qblwxNL3xUHUd7mvCWxxdbVUMtN9gDk0U63CDLcYgc96j9MZMH7Efq1+DfGkkhGx5E5ZqvaSfZK12X5sWGGOhG7W1PzRIVkIVGtfxUQieJIrZLCFhSweY31XrLs0oJmo5miQwCROpxeIXdQk77QnbC9Aqcwv1x2+Fn6PE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CH7B/SyV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQy9ba8N; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CH7B/SyV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KQy9ba8N"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJC5l3406495
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 11:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6JiqLVIKwcrWqWIh9PGanD5SoJcpxSHH3ZfyxSSvuk=; b=CH7B/SyVwOMv/qdY
	AGJIJE05vndzFXl4sW0cx3haeqXZKbeYHjbF51huewfiqApyC1Uy//LuQt24yHzx
	FHs9InwipUZqpds17mkVmuer3WVsQw85cHUJd0QRq81ROTnSKYLsjuDs3gK3J0NL
	lnYtO2PsCX1BN70fgcWoonzYaJWzQw6IkJDPa6EkJGtFd4gNa5DO3x2xJ0SzIu/L
	3xe8faebpbZuImf89hhXBU93NppsJCNK115z3GUijqyb/fLWsv6L8sJqBAyX2Wci
	eR2b5+Xhr72QRxLq412tqGH9EPYHSXAKHf+JeW/xDwDq2h1T5T9ffkltopZk+FNN
	R5ZigA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu196w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:33:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dff6253so9914365ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788262423; cv=none;
        d=google.com; s=arc-20260327;
        b=F19QSFT3wvg7B5HQrxyyEys9c5NqhJcDsDOTqBghqTFh+SuYHnnTIatmb8Uh++LN0x
         fKkH2/ujTCsTv9C9eAKwKJLZI0o9vWKKlsykvK0LbgWcqevmUnjI3ns4X2gfz9GJqicu
         SpEjww8dK4h+sUNr8aZMWSCVk4k9p9WygbfGdvbWGtKMsf9QllUHsOWQLf5G0eSWU0Q0
         q2jSJaSVVrJVSY1TDhtKtt+0ZNG5BaZa6ByhZ+m/YGXK/GtvfPgB9OPbSAtOc8CHuy7N
         3x2EivUFw7MCEMYZk6J+6z9715QqOVrUHRg/P6QqiJ5s2c0HWZhQZ8y6BVF1su34b0/v
         U0vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V6JiqLVIKwcrWqWIh9PGanD5SoJcpxSHH3ZfyxSSvuk=;
        fh=J6goANBZQDoT3/1s3AKm7FRb+c4jwkiIWikinkpwM1I=;
        b=klVDveMfSzq+jvMsxdJznvTCRPCOOn1bsGn0rxomj3oY7JotfFSrOucIDj8No5lWXD
         dzSCq8Driaj8RDE4fvwnafLmp8g4fBbxkkQ42l8egO9nZrIj6v8nc2Rsm30D46SEwKwd
         nMVhw+nBjLj9upvQjxpVh1bCSProTBc4CJXcRnQIoUf/h0V9iU/Q8A6sGDmt+RX9D/Ui
         WBZnVMjz1HE8DxIuXNp9FSxzLnC+Pb8JKS4n+AbyPzIXfjezKA/LPKCgcH83MtX2T0T4
         uIeuMkfagKGvkSFGxrfNLK+76U4jquqdfy9ZBvedad2R7oyZlBn5Y3YIpNvqSScV4R0i
         O4Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788262423; x=1788867223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V6JiqLVIKwcrWqWIh9PGanD5SoJcpxSHH3ZfyxSSvuk=;
        b=KQy9ba8NQbu8Baa0RZGGKkEpbftfI74ZwoA2/H9EmW6UifGRaDyBl55L9wFZNpl3lY
         N33pLsbuXn3ww+SrTo19jxZlthgR7XBqowaqx6uNgcayjpIbaU102KLbLuIjfMmLdPpQ
         2ULqJ3HXmVikIU+6NV2GHVmuU17SZ58T5JZJGGc11Vet+4bqcRGqTDGgEt8s6Feji3r1
         BF7flDSu8Hmn5Z0morAgYB02hyXsW4wBPggFuD73mKrwNhWvN8D8Vlu9/HqN6ZQE9qRM
         5CuVRu6rSx+b4ge0E3916LwR+j3EqP0zynL9KuI72IyYDUUVOyUwc/zSnAVHqKxQjr5K
         OLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788262423; x=1788867223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6JiqLVIKwcrWqWIh9PGanD5SoJcpxSHH3ZfyxSSvuk=;
        b=dwmc2OSEeU/DGCHOgLZw9evF1dJg54RFNpcPs2ODzyRnzL8QUvIBLFJRl09d3uh81O
         axRe4fXMgcbNa7V6YjNym/QsYBlNUhKrs+wmx1yD3YiuRq0qQUngBRYE5XLql4cL6o21
         98Tc/nODd7yUyNTFY9hMIYqLcutrbWvqiZPGwkeFcgZWERy7dBPbOF399cHImLJILkgt
         /2lxou2pk03+uEciSLPb0pl9oJFGrhPFl6kj2gDYfbPqiGp2iM7zC5zuuvI27TUopOaF
         V2lzstAdK8efA3oaP1GkL+DAjmyL5PM16EzMaohPqnllMFoheuawt3Vo+uOBCZGgJO1+
         yfkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKXfMc+ChZUqD0MSCi279ihl3syc+OI8IjfDh2KLPVL4C9gHf/E7KSh/yMJAJJRfwQeqyoK2LBgi9Qr/M=@vger.kernel.org
X-Gm-Message-State: AFuF++lNExuhRWErCOaB4ilBl6xr+DPdPbc1StCNo5/HrrWCg/LgBFGC
	EkFpyIFawIpVUTtEdGrwxekfX9jERuGTqxsRbvJwV6S6ahL/nIOfkPnc0p9RPezP7ZkBOEBNT4b
	Ox4kLJQrxEBBhPtYnEhu2i1sL05F8F4gA53uuauR1eG1jpBuP519fk27+UG57pZo1Kdm2MZh3pk
	DkujetfO9Q4WeZEn8RArbUOf55jE/53m/1DIOdmkK14Q==
X-Gm-Gg: AYBFou0bYV58n1YNddhIiLDj0k4h7g/X3WMjHQ5hcPVtAx9BfnvuVZNHAV0/o1b4a4U
	l3jSPb+xo9plcxb7nZBGS0TDkaN6OCFYRiveNAa27jrBtdginI5484hngw/PZpDO0zmoNmnYPHD
	Z5g/vTssdabpTtgaaTmZe2m5etZMC7gzvHuo//eJwDerGgHYFKfWU7aKnxnQ==
X-Received: by 2002:a17:902:d2c4:b0:2d8:d4d2:d135 with SMTP id d9443c01a7336-2d952845317mr45504595ad.17.1788262423292;
        Tue, 01 Sep 2026 04:33:43 -0700 (PDT)
X-Received: by 2002:a17:902:d2c4:b0:2d8:d4d2:d135 with SMTP id
 d9443c01a7336-2d952845317mr45504165ad.17.1788262422831; Tue, 01 Sep 2026
 04:33:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-topic-lpm-psci-domain-callbacks-v1-1-4a47d95c9c79@baylibre.com>
In-Reply-To: <20260831-topic-lpm-psci-domain-callbacks-v1-1-4a47d95c9c79@baylibre.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 13:33:31 +0200
X-Gm-Features: AcwNN1VtZoA1_YSarl9l5fAeELnFtcgDxJxCO3oJ3BzWm6vuhhyYMYT4SOZL0-0
Message-ID: <CAPx+jO85NBZq=YCxhs5Fbo5rDZ7pGHHKiG2HRJUNVKj_1SOscg@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: psci: Assign domain callbacks to all CPU idle states
To: "Kevin Hilman (TI)" <khilman@baylibre.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Scaria Kochidanadu <s-kochidanadu@ti.com>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwMiBTYWx0ZWRfX5XCfD0WcxMvC
 OX9Xhv874X8Fcy1HY5NLJvcMYs1qMyXVdZyC6jjZ29qhdabDOjkcNc3IEPiKvDBoMteEcR5U+xF
 W4HD8URWcOexDUzOO/aLm3tlPyXq3wHX0XWMMPngakagcmINrrLR+n/XTgl+obkepGbz/ygCtiQ
 Iy/l+orjeQgEtKHQCNMecf0nfeuniAfLu+txTA4Jya3Sla30K7sS+ku0R79wT6DBGUZ00+U+z7b
 tf6OQMO6x2esnti4zCt00tp657dqyN4BeY3SXS93IlaZXCvsyrWtF336m7WAcpRwdRnru/1blRp
 vclF0MiykwnyodPFRtZE3qk7vy4/L2jjC5ZKCRwNLCyvk++kt+cTeyMyuK4ztsCHlYR3hM9ROEv
 ZMaqqn2RuxdHYgcBBXatr59OnJE8PclPJtaXUHEHibgpq67zYIYd9b8bvq1FoS/DOq3s5dwY4jl
 n9RVcq1g66mQTyOBtMQ==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96b818 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=IpJZQVW2AAAA:8 a=sozttTNsAAAA:8
 a=nffbhwOHn8sc9RhtvssA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwMiBTYWx0ZWRfX8ljiUrDfiRL+
 N76t+UCdnBBOxELwU0SpVhxPHx24XfYDYIpRWJpVuCPOPPUj5RPppAiyKlp5x1k3rC/zxJZVEYg
 J+R+faJqWjslVFeWuoyxAb7/oY9+WOc=
X-Proofpoint-ORIG-GUID: CjtqZRVK-YySNzPhiLU8QMgdS-7gvhsf
X-Proofpoint-GUID: CjtqZRVK-YySNzPhiLU8QMgdS-7gvhsf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010102

On Mon, Aug 31, 2026 at 8:52=E2=80=AFPM Kevin Hilman (TI) <khilman@baylibre=
.com> wrote:
>
> Previously, only the deepest CPU idle state had its enter and
> enter_s2idle callbacks set to the domain-aware implementations. This
> meant that if a QoS latency constraint excluded the deepest state during
> s2idle, find_deepest_state() would find no state with enter_s2idle set
> and skip the domain idle path entirely. Similarly, during normal runtime
> idle, shallower CPU idle states could not trigger cluster-level domain
> idle states.
>
> Assign both enter_s2idle and enter (non-PREEMPT_RT) to all non-WFI CPU
> idle states so that the domain-idle-state logic is triggered regardless
> of which CPU idle state is selected. The genpd governor remains
> responsible for honouring domain-level latency constraints independently.
>
> The enter_s2idle path uses dev_pm_genpd_suspend() which is safe on
> PREEMPT_RT. The enter path uses pm_runtime_put_sync_suspend() which may
> sleep and is therefore still excluded on PREEMPT_RT.
>
> Suggested-by: Scaria Kochidanadu <s-kochidanadu@ti.com>
> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
> ---
>  drivers/cpuidle/cpuidle-psci.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psc=
i.c
> index dcf20ea5ef5e..db9aa57c51f5 100644
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -250,6 +250,8 @@ static int psci_dt_cpu_init_topology(struct cpuidle_d=
river *drv,
>                                      struct psci_cpuidle_data *data,
>                                      unsigned int state_count, int cpu)
>  {
> +       int i;
> +
>         /* Currently limit the hierarchical topology to be used in OSI mo=
de. */
>         if (!psci_has_osi_support())
>                 return 0;
> @@ -261,14 +263,22 @@ static int psci_dt_cpu_init_topology(struct cpuidle=
_driver *drv,
>         psci_cpuidle_use_syscore =3D true;
>
>         /*
> -        * Using the deepest state for the CPU to trigger a potential sel=
ection
> -        * of a shared state for the domain, assumes the domain states ar=
e all
> -        * deeper states. On PREEMPT_RT the hierarchical topology is limi=
ted to
> -        * s2ram and s2idle.
> +        * Assign the domain-aware callbacks to all CPU idle states so th=
at the
> +        * domain-idle-state logic is triggered regardless of which CPU i=
dle
> +        * state is selected.
> +        *
> +        * For s2idle, enter_s2idle uses dev_pm_genpd_suspend() which is =
safe
> +        * on PREEMPT_RT. find_deepest_state() will pick the deepest stat=
e
> +        * whose exit latency fits within the active QoS constraint.
> +        *
> +        * For the normal idle path, enter uses pm_runtime_put_sync_suspe=
nd()
> +        * which may sleep and is therefore not used on PREEMPT_RT.
>          */
> -       drv->states[state_count - 1].enter_s2idle =3D psci_enter_s2idle_d=
omain_idle_state;
> -       if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> -               drv->states[state_count - 1].enter =3D psci_enter_domain_=
idle_state;
> +       for (i =3D 1; i < state_count; i++) {
> +               drv->states[i].enter_s2idle =3D psci_enter_s2idle_domain_=
idle_state;
> +               if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> +                       drv->states[i].enter =3D psci_enter_domain_idle_s=
tate;
> +       }

This breaks the current contract for genpd when it tries to select a
domain idle state for a group of CPUs that shares the same PM domain.

In principle, if the CPU has a clock gating state (shallow) and a
power collapse state (deep), it would be sufficient for the CPU to be
in the clock gating state, while allowing the cluster PM domain
(through genpd) to enter a domain idle state that corresponds to a
power collapse state. Depending on the platform of course.

On the platform you are working, is there a clock gating state (or
similar) on the cluster PM domain, which is allowed to be entered when
the corresponding CPUs are in the similar state?

>
>         return 0;
>  }
>
> ---
> base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
> change-id: 20260831-topic-lpm-psci-domain-callbacks-a8af0cd7df35
>
> Best regards,
> --
> Kevin Hilman (TI) <khilman@baylibre.com>
>

Kind regards
Uffe
