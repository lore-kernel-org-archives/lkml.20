Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98234CE68E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099965; cv=pass; b=Lxj8gsldSw48UyX4l5PxFen6NuWoTzLvsi8GhcIYxRObuJXKv7k2YYU1gHtMoUY5OgMa9PO18NrY/5xrdcZMgrW8V/2OTV0g6pyB8+1YFS45EfmkqxSA8s0QjJx+2pPCaEdkLH1EiGBY1835n3H+BKUs/zOxicefdFtBFPoyEr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099965; c=relaxed/simple;
	bh=YjXK6BgOQPsgC6R00beChvNdVm49sWujUHpCNdRld+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BB3je8deipGSYGq9CbR0tjlO8gN6p+Vvrcwor5I2p3GFJIUUFNi9Y6aREwNs0fufiirJqm+FWN3wS7EwpfFd5jbXDkbuoJ9XoEv72K4eVqesGA37BZehgcoGw6faIq/kZS5RvOUBEdDS4OSV0ehWPzgHP4fkbNzfNtY8oCtvHWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rwfwhj4V; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rwfwhj4V"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so1453a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792099962; cv=none;
        d=google.com; s=arc-20260327;
        b=ftfSn+tCsjnvvkjU9pwrYYxF26h4QzNAyD1ptaKE1V7zdsyWQ0Qu3/evoK4MYuUqCU
         pVIjHY5qlR4BY3oaGNyGi/VgVxHxHMD2lEpCtFCW3G2K9w0+CphbidCuuHLRyV6CVHMh
         kREY/JyKIR4gh0Nn+0Vs6WZ0zuvVkNi1iICHA5B3dDUtLLla76FUsi2BsIQpBbGVlDhX
         kEXxHMUpYt8SjbTRoYHpLfL1IUHKwvZ/F20xXfj5rosYRAmOwzfUsDywEbEwH3G1Fvav
         2IgaUwYE6qTTWcYm6I9QJZGbeFgrEKpXJabAETzOKxb1YhBdl8Heorcpu/kogdBQg3wN
         2pww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F9EW3y40s5N/1pz2rYlIzPCqkKsyouo5NVLiPakQV0A=;
        fh=kZP3abH6dTBZDhYCtkzw8eGUVT0cV0yV0SeU+d861Ys=;
        b=o8EDEM66juJ2UeEvV70aWCRRpTcXubBb42kGnIcN6t7kYLO/pLh1zJt8BHEnP2CXeb
         OK1BjL/2wLic1ukm5763KCD2qvXTK7ni2uSPle/UGL95CTU7cas0U3bet3DEFJYXWvkV
         iIT3w0WIyxh+CMfFnaaHqAtn5rFm10B5zyG2YaK5btvwerBN7C83pLYPlR36LKMQHdjp
         uVUZZCjXzz5Ev/QwMaJbQxgNwhwOGLiemP0MqwVBOOQN7Lt/9HOLFMk3euq5WzR6At+z
         hJhVr1hFnK2+tpWznMBCCFOBPKXXuEyjQC02Jvh4ZIwqFfLK8PElwl7qsaSYrs3q+D34
         PoCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792099962; x=1792704762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F9EW3y40s5N/1pz2rYlIzPCqkKsyouo5NVLiPakQV0A=;
        b=rwfwhj4VJCsrL5qvq66Wlr2SQg8D1u671ODcpczPQNa5EXT9QwgjLTc8MGEJboftze
         CzH7YgLJDpsRdiwOVO0fw1qmvY2DjZGSCAiI/ZRFAdry4YmInfjvzntmhh5QMt4F3l4G
         UtXVtMLVZVX6p833RG/WbYbKiYqABPCKH84Qnt/Zg/dnqTM1W8ErxPQF76DflDzREFi6
         fDZhAJsJIHYz1P+3+OiEh1sct0zKVYkzv90QrAzPhQt7t1VWomAHnUwNTRIqpIO8boGl
         mccZKco4YV92piRvaToAWeNHjn2IGQzcYwPlhVKxKuyyjg20Kt4cvliKaH/rsMLzQvFE
         Dq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792099962; x=1792704762;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F9EW3y40s5N/1pz2rYlIzPCqkKsyouo5NVLiPakQV0A=;
        b=FJ9m9oRkPVf486hWY7HKF+fJFKv6b9LMamVS4wuGFMeoPKPkhjC+t9F75XbTM2CIh3
         96+v3fjiAc2YwPmvKS4/0G/nNU6hjNaSHkQZZkaQI0WrBN7HXIx3FLD+Bmjh5QiLYZKG
         uZPpy902Zf2Ce1vJqdBx7hD3H0lhJ2dd9SW6z+UCQKZxM7y/SZ66/ecHqoKqbqiydxJ9
         CplBQQimP9tPlGCOb2atAMsGqVk8p7fNG1Be1GG3jIhKLstQDfzxsllE7t2H9prPWMh9
         l7/8qwsnbJ8T0lkGs0ovwgu9YvZVxTmvkgFby+4YPfmqZtlpgyW5BJ3Z5xcEVB5TNeXz
         33zg==
X-Forwarded-Encrypted: i=1; AKwUvBwJ6lIcjkknHOLc58OrOuqtYIPKjS7ErxbmVuJ3nGxl/jK61NeYlV3DxUuorXc2aA42E/eXoLClGXM/1cU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgH4XaYPBzm12RXtJuflovgMz69FWuq9jugsPPsVtAJ+bB42Mh
	+rl70y+UeF0NrGcMCIUco3HkKJkyEkAKVDEx7PiM80cxKhM86VjVeKr8b5+VngX+ouL9cMtP7Ac
	Svw3OXHEFqlmd97M7oXhLMvauJaM88KPu28ZQ8IQp
X-Gm-Gg: AYBFou0OB1BmlhYGnXdvvrmsSv0XVlh25zuFdG1SYYoSuC4y1Zh44iIu3j9qukJ03Vb
	b83LkEyExBTqbyFwmxbqcRSoglsELfBCS5DCgADzgsI93cGaDbC7prIPoSMg46We7cjjhdGKcXf
	MRV1ZbN0UR4Hx2OBtWcjJ27yJ5xe13ucoyX3alU4cOvdKd3CoStlLWMGN41WQhMGMi9SVEq+LYm
	Wt9PZfpjGdQFwUvaxwZydH4F572lPy/pQ43f62IXRFBDXj0QK9dQkbAbOlFN37Bx5GbAk/Gdd3D
	Oc7pF/JhJUYcNIr2an+GKcAF1Inmu6axaaLT8cj6mR4GbauuOsqGVE8=
X-Received: by 2002:aa7:cccd:0:b0:6a6:8513:7e14 with SMTP id
 4fb4d7f45d1cf-6b389316e80mr23741a12.9.1792099961542; Thu, 15 Oct 2026
 14:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015060430.5877-1-ravi.bangoria@amd.com> <20261015060430.5877-4-ravi.bangoria@amd.com>
In-Reply-To: <20261015060430.5877-4-ravi.bangoria@amd.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 15 Oct 2026 14:32:27 -0700
X-Gm-Features: AclHuK_p27UYc0NrEirae72lDoPwVkg8nyO4-1bdkKyLQyhcreyw4plaer2PY6E
Message-ID: <CALMp9eRTG=uLkAWohYW0HOoS1xvNc_0brovYsfbCUS_mf4H3Kw@mail.gmail.com>
Subject: Re: [PATCH 3/3] perf/amd/ibs: Simplify event state handling with IBS_CAPS_DIS
To: Ravi Bangoria <ravi.bangoria@amd.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Jayapal Ashwin Nair <janair@amd.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Ian Rogers <irogers@google.com>, x86@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Santosh Shukla <santosh.shukla@amd.com>, 
	Ananth Narayan <ananth.narayan@amd.com>, Sandipan Das <sandipan.das@amd.com>, 
	Manali Shukla <manali.shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:05=E2=80=AFPM Ravi Bangoria <ravi.bangoria@amd.c=
om> wrote:
>
> The IBS_{FETCH|OP}_CTL2[Dis] bit allows IBS sampling to be stopped withou=
t
> a RMW of IBS_{FETCH,OP}_CTL. Systems providing this bit therefore do not
> require the IBS_STARTED and IBS_STOPPED states used to coordinate control
> MSR updates with late NMIs.

CTL2[Dis] doesn't make late NMIs go away. Hence, this patch needs a
50us poll. With the two-line fix in my original patch, the existing
scheme handles late NMIs indefinitely: IBS_STOPPED remains set until a
late NMI consumes it, even if the event has been restarted in the
meantime. This patch trades that for a 50us window, after which a late
NMI is unknown (which *is* fatal with unknown_nmi_panic). Moreover,
since we still have to handle hardware without IBS_CAPS_DIS, we now
have two state machines instead of one.

> Add a separate stop path for these systems. Preserve Val while disabling
> the event so that a delayed NMI can be identified and consumed, and wait
> briefly for such an NMI before restarting the event.
>
> Leave the existing handling unchanged on systems without IBS_CAPS_DIS.
>
> Reported-by: Jim Mattson <jmattson@google.com>
> Closes: https://lore.kernel.org/r/20261007234815.4026028-1-jmattson@googl=
e.com
> Fixes: efa5700ec0da ("perf/amd/ibs: Support IBS_{FETCH|OP}_CTL2[Dis] to e=
liminate RMW race")
> Signed-off-by: Ravi Bangoria <ravi.bangoria@amd.com>
> ---
>  arch/x86/events/amd/ibs.c | 145 ++++++++++++++++++++++++++++++++------
>  1 file changed, 122 insertions(+), 23 deletions(-)

 [ ... ]

> +/* ->stop() for platforms with additional CTL2[Dis] bit. */
> +static void perf_ibs_stop_dis(struct perf_event *event, int flags)
> +{
> +       struct hw_perf_event *hwc =3D &event->hw;
> +       struct perf_ibs *perf_ibs =3D container_of(event->pmu, struct per=
f_ibs, pmu);
> +       struct cpu_perf_ibs *pcpu =3D this_cpu_ptr(perf_ibs->pcpu);
> +       u64 config;
> +       u64 ctl2;
> +
> +       WARN_ON_ONCE(test_bit(IBS_STOPPING, pcpu->state));
> +
> +       set_bit(IBS_STOPPING, pcpu->state);

This function needs to be reentrant. If an IBS event is a sibling in a
group led by a core PMU event, and the leader is throttled,
perf_event_throttle_group() will stop the IBS sibling from the core
PMU's NMI handler:

    amd_pmu_v2_handle_irq() ->
      perf_event_overflow() ->
        __perf_event_overflow() ->
          __perf_event_account_interrupt() ->
            perf_event_throttle_group() ->
              perf_event_throttle() ->
                perf_ibs_stop() ->
                  perf_ibs_stop_dis()

[ .. ]

> +       if (in_nmi())
> +               wrmsrq(hwc->config_base, config);

As we saw above, in_nmi() doesn't mean that we're in
perf_ibs_handle_irq() for this sample. If IBS Val=3D1 and the IBS NMI is
still pending, this clears Val. When the IBS NMI arrives,
perf_ibs_handle_irq() finds CTL2[Dis]=3D1 and Val=3D0, and therefore
returns 0, leading to an unknown NMI.
