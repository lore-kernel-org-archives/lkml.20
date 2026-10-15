Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569DB582B9A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096993; cv=pass; b=lC6IEg6I+4mVDtXbjqPNrtTL/cBQbK4bck8yAXVuZxlu+7jgSxdLrU2Ko4KELX5x+S27kQbT9nuraLtxSN0hoRFrOYeOvS8e5tyRjKEB7ak4kjTnYWo7CdRYceEwTlry04jyzzdh9XAZ36l2KsRevb7++uh8K5otgfuvma0ErqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096993; c=relaxed/simple;
	bh=fpQgL7zqW+wNr1zIyUSG2tROxfP1ReOgDcM5sZbvmzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H9pVGn2XvJGJibxBIOpDMMP7uDsKiejfnyo38SQbQ9lH5QOoozmkJEpCMK+117DCccDRniHvLcPuCpPihrXOPJjMGru9i1/qLdmzSPHGozVu9HhVdiYSGMa9vmV9F8au5yzDQHiUl/8g0rhiLi3goWPQMOH3NtSPu3YZQyR53jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eJzmuXgH; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eJzmuXgH"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533202fe429so93301cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:43:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792096988; cv=none;
        d=google.com; s=arc-20260327;
        b=ZTP/Qc39yHvc0vp3oxj2iUBkQxWDg0rrYYmV9Thcd9Plp+d3j3LweYTXiCq18K2anx
         5H7ij/cXykazoWgdDvv4vAjxh0r2h/6i0BhHl/uQS8/rZgqEf+dRWtFhom4lqzaoBKE/
         f8hQlI2DfZs3PNKtv4Wh3zRHUcJoqrTyXaBUBtXfL+/ICdYNS76P5yafaxsvHke0+dHZ
         C3hPdcCdz7UTjQfzz3EWPHgiaurpWfaQOKKjO+RS2NbRxK5vzc9xFkee1rLzVBLDiK4x
         BTbf4vz5HYfDzrucM4iYQnraxDd2qtvkTQUHPhFEjaye9XYVUvQkMqs4EvfwpdvBmIAt
         gF6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sAB5wPUHGamwdatU6DxOtAu/ueiZHFunUW7sP3JUzxI=;
        fh=X5bLWGtAyS67iDj/iy/AvZCqE74CDq0H6DX3eiKfAe4=;
        b=d2eHrAHfY+nHWIFIaHZHWKVvqyNlk8it2mvELM+r1vATneX6ru1J8OCfxp2SqrXIg5
         fpTYnAh5LwAV92T4G+jqECg7NBdBwAReOwJBGIKd41C4rVHQs7nCLYYo4FMxEqTq5AqR
         ednmCKAN3bSFZyxp3SmwPi+hlIGZGdkZQYs04Jq2W7Ld/Rav7dOqOYK+O374ZtumLUAd
         z4o/oIivWKHRRH6QMyj9jiYCqEY2mBlTeg2ontw780t5nfhBfCdpguE2vSnR8bAkcT6N
         M7qtwdBKA+gwSXKE6fnOsRqHrW48Rqi6bHWrPgFDq9B/LmiYj46gnThykW6dh4FPnPfq
         TJLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792096988; x=1792701788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sAB5wPUHGamwdatU6DxOtAu/ueiZHFunUW7sP3JUzxI=;
        b=eJzmuXgHVsVJWdEzr6eJY1f1yEEfSevLZHYDp3A6vdFEhxjxqgGVO6HDf28uwgoEAl
         DkRxf24y8sSBFCE8pIZlKvisz+HjHv1pjhhCzMgjN98hD8gHdeRTMo//qkDGK9KE4B7r
         ulMruHgZLnaADzPO+3OOt/RWEVUxKctd0W4M3oYvWsagZNsCSKaVrJbhH6LSI0+Nq4Yt
         ulwookpra3JOSg47L5HbRdDVa8ujGQP437KqZgF98Niu16ddhkqnJ4AW8MOlV8oacTSS
         jmxcHZ/RAetb5PCSAw2+mwb02+HLdKOIbEidOA4Hty6+opEyMdzSjff86AwVIwzvzOv+
         HACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792096988; x=1792701788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sAB5wPUHGamwdatU6DxOtAu/ueiZHFunUW7sP3JUzxI=;
        b=jeIwCwcd1tHcM/4E2IhVErbos70t3ES/8e/l+WZIU1Ii+cY5gGDGOGQIMLq14VU1X2
         eo+6EdMnFd/ZocJB+pWtL0l580dAOKdaIqvtKQCre2vNPpcd1ABQeEJcsi/8V6OcHgau
         vkXl0jUBlmbEfODBIG9YUC5K02HVnPJJvstEzA5CSbaDxpeYjbDgZaGoJX1hpJ5/Bi/+
         hJIvHGunz0Wh1PWrTgajbWrU5bsEjLif1bBJHwJVd+2jzwGLJJEJepGaWFZpyvgVWgLx
         kViYGlPJS21CLV2iHn2ICD1DLEqU+fd8fxA3+Tjk4mDWMx1X/zboIQ+E0XSt+Q0JYV4B
         OYyw==
X-Forwarded-Encrypted: i=1; AKwUvByvgI4IaLVJf8JgPxpjDmLXpL7KTh8Yrt8zqkO4nJjXTbEuAz7pmAT74ofLE2QC64y9/2ld8R/2e8UDbQI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpGaAOlokpwPBhGWwbtXMqGPaLxS4ZZ23Wm2mpgCeldXjUynJ6
	Mca0Sw56iwLZZ3C3HJ3FYWGOtP0PSmZRXpnevtCeYuvPp5JlBm6OLYX8QhUSPQReEfr03GrrlEW
	dxsKL3SJFwNfQ+k6lKX2Y510QomKzc8uF5aFd8Y8H
X-Gm-Gg: AYBFou27hRB+CTBa+eGojAPkTFSyQQTnQEAzHyFLGgtFBHO1iW6XuK6zjp8yIlV5hsX
	2tKm3JH/TYEHrLlAulX7trGuNez6pzKf8maq3bwsfqBv2w4JHVl6O+spz8dVLf7taPX06LBjoAk
	wOQthYIU9UpP0n118VvZNbNG26M2x31zGCyMewVFbq2Ain0RGhMWCdaOdT/oJ1UyMzEtow1QjSA
	KyV8ZczNKiilRCQefmQJLDndN4HJHQ8aK1rcb0vKTGMxypRpOp/yqbyx51W/wzi5QQqKmgA7ByB
	DO0zS0fEaIaZuxbTlAsDWajBL9eC2q5aNfopo9m2+7LaBmeR19rS1gjl
X-Received: by 2002:a05:622b:da:10b0:532:9003:35b1 with SMTP id
 d75a77b69052e-536296751d7mr3921681cf.2.1792096987506; Thu, 15 Oct 2026
 13:43:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015060430.5877-1-ravi.bangoria@amd.com> <20261015060430.5877-3-ravi.bangoria@amd.com>
In-Reply-To: <20261015060430.5877-3-ravi.bangoria@amd.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 15 Oct 2026 13:42:51 -0700
X-Gm-Features: AclHuK-iC84TxLC2NgPzRKp_ipyKQ7WfTjp-m6hssJeqnP_I8D-Eg3EHFWYlDEQ
Message-ID: <CALMp9eR7BFGU0zOwTmLF571t-ZcuY5NjkD2nNXWNJoa=cEitTw@mail.gmail.com>
Subject: Re: [PATCH 2/3] perf/amd/ibs: Fix kernel address leak via REGS_USER
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
> IBS hardware captures a sample and raises an NMI. Since the NMI can be
> delivered with a delay, a privilege change may occur between sample
> capture and NMI delivery. Because IBS only provides the sample RIP, the
> kernel records GPRs from the NMI pt_regs, which may reflect kernel mode
> if a privilege switch occurred in the interim. This can leak kernel
> addresses to unprivileged users through PERF_SAMPLE_REGS_USER.
>
> Fix this by discarding samples where the NMI arrives in kernel mode and
> the user has set exclude_kernel.

This will systematically under-sample instructions just before a
transition to the kernel. For this special case, perhaps the GPRs
could be obtained from task_pt_regs(current) instead of the NMI
pt_regs?

> Reported-by: Jayapal Ashwin Nair <janair@amd.com>
> Fixes: d29e744c7167 ("perf/x86: Relax privilege filter restriction on AMD=
 IBS")
> Signed-off-by: Ravi Bangoria <ravi.bangoria@amd.com>
> ---
>  arch/x86/events/amd/ibs.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
> index bfb51f8e184f..3cb46c775eaa 100644
> --- a/arch/x86/events/amd/ibs.c
> +++ b/arch/x86/events/amd/ibs.c
> @@ -1373,12 +1373,15 @@ static bool perf_ibs_is_kernel_br_target(struct p=
erf_event *event,
>  }
>
>  static bool perf_ibs_discard_sample(struct perf_ibs *perf_ibs, struct pe=
rf_event *event,
> -                                   struct pt_regs *regs, struct perf_ibs=
_data *ibs_data,
> -                                   int br_target_idx)
> +                                   struct pt_regs *regs, struct pt_regs =
*iregs,
> +                                   struct perf_ibs_data *ibs_data, int b=
r_target_idx)
>  {
>         if (perf_exclude_event(event, regs))
>                 return true;
>
> +       if (perf_exclude_event(event, iregs))
> +               return true;

This excludes events with an NMI skid past a privilege change in both
directions. Do you want to omit a kernel sample taken just before
returning to userspace if the NMI arrives in userspace and
exclude_user is set?
