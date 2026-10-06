Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95975286A4
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791302967; cv=pass; b=AoDoWJyThw3alHM0N4yT7Ve3bHYKrpKmBkjWSrTySzL4jzEnMI3L3yHke+U+N+GlylcI6n2W+hiA5+u9SHtY6PrA4BFNwjnHi9Ilt86M6FZcCa38aXwhK4EoF+l0sjQ8K2GZsJlZU9pjpzGE/n8O0EPRwBCJjf0MaihX1VpPMhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791302967; c=relaxed/simple;
	bh=cep8Cv1vd6ia4rUlLSHVJgZJDz2Dr6KiISVrbn2rzyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9Jd8bFogakJB/dCcGucW759MM6q+ED3qgvKSPqSB6KrPbcC20CExCTFxIyVNusJSfL5O9DOaorw87E8bi1i8EB/IHnuOkIHl0QdwZcHY1A8A3okNTlwxgQ5igdPIhltrAHTG6lfPHsSqw/tj2ExyX98na40KjLbp7npVYwqPDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iwl8kkt1; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iwl8kkt1"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2e5f8fe879so119801166b.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791302964; cv=none;
        d=google.com; s=arc-20260327;
        b=IPfMoZdN400yxACnk+M46+xaL8UlFMkrxUxEb4qnpOXnGAzqJwIV2+jtXrjir3zDCz
         3JByodMXIM4fczVraK6jEVFy+XPZ8aNAbiv10OLgcZlkq8VfDCUOUX0m2FnZ7U1IQeuw
         S6JOJCWocGPW42wyp5ZF7KDezaYFQlReios0Wqjn+5bTTcZqlRYjaRXTXdJjeY8UulLo
         mpkNt7hP5j6Oz5InSztWGi5nu/JxKYcgSc/VtFHAYhslXpLSFvCdJzEawxhpIC6rbICF
         6mEpGsilKcSQC4dNt03b4+dIhUdzekuLVfXjLJUP0s3oQxuKDsDsuXBrExQbUMPvzlm0
         P41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3usypQk1aH/wgn8+3d6DUOUXO79QcDW+qxXIhYKt0d8=;
        fh=wFFxS2AMyfNc0ZkfdTqCeWioLLo8XR3e50u9OFx7NKM=;
        b=LJHLTfoogu/xVU+YwQeWSWff9r2PkW4GMDsm2+7owVUc3zUHzyQPsH0EDfMBs/euOo
         KhWa8TAefSswky0tqBC3JQBqBXlcE7rXKqjI9lqv4OLMzNd462/6WUgol9WrsILn/1ny
         5gRRWt1bmK9mI2dg8TU+N4hdjMRJyECZC+tPjzYp4R1ZoHbfVTW1oYUYAB/F+oawomGc
         19o5A2G1YZ9B/2GmGTlEltsbit6nSLYdbD2TZiw/nTZnNjXQYCSpMCEPgFnNVY7mb4KH
         CgAJYhby1TXWg5Al+cmm27A5EpgDt+7A+X6N7s8YPKSznU1LytMZPQUFGPnNIM/hvnAa
         njGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791302964; x=1791907764; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3usypQk1aH/wgn8+3d6DUOUXO79QcDW+qxXIhYKt0d8=;
        b=Iwl8kkt1wVGuZTj2CV9e8ZpIPPqS1YqCQxyndX114srjrdXSoUD2nji9S5tg7489XU
         qj/oaZLzq3jaUK4RWVOeW9aiKKj7DXLSwEgRZfqlAD/jsq1oERCDwqPKXCRWqdFRtMjj
         d9sy8w7zCkuyF/H/C55z2iy6pU84Tc/Ei4F8e3QnSxx5Jjc3yyf8YK5iAr2hnCtuXNFm
         rpujyP4igflJmJrMZoWrOvYBox4UF8c/eMDLf35XI1mGMX4vhrw4LVKoyvTv3B5fybrd
         vUQXCCpapcx0C8FYAkVmP3YWPFzuJK7PezFhUB61X6AM2+vzIumA4U8nlCpHrKsKAGCN
         m/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791302964; x=1791907764;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3usypQk1aH/wgn8+3d6DUOUXO79QcDW+qxXIhYKt0d8=;
        b=hRYLfXn8kd+szs8wdw1ZsdIk22r0R+0IUIdiRMuCxEhjuSioeF0WXU/0jOGeQeHGqg
         qRpYxCSRMWH9dtgtHDduvdXoQxzzL5GsjTDNcII/ByiSqKkpBdKI4b6MJqxis+htPEPx
         JbdoyC/3pCeylUZEe4COC+dJyT2cBR5N4WYJ0jUXulVnTX/QyhDqYyc/m1tYazy4KTYD
         K7myF/BfhtpNwm/AcSdIlftlsh+42bB61YBOBVosLuHpSOwmPs3Zzyctbg41Jo76jsz8
         alISZEMie8rRLF5yWgIipAeLySHZaq09stdGsNY5QNTvKtzaNnLCrLrev/CwnIGGgHF+
         e8XQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFwtFcRYK3jn37ftKcjDdhhSvK/x0CT4lZCKhK5nh7PFnZ070Ep8QjXE1sogf/SPV1mypq+EXx/mpgr5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqzrqYtlcY9WBwOtyHEm1o+IxnJerv1ggFn8XESo5tsMGCrmqg
	nxksRxkBRmupH+SZFG/uv92m52LB4uVX40AOkC54h8yVUJ8LVcW5QUhJpaSuLIRkzBIrJINKbQA
	xT3HWl1bXC6Lu+5xkg6iADxAict0gysA=
X-Gm-Gg: AYBFou3ft5y5jtlqNR+WCwan5PQoqMmYVmvE5C9Bu3EEo0EPjtMGU1EN2DAnHa4Mqwd
	PCed1zpHzx4uGe5HokXpj+8Ivsme5RDzNJcWJ+GByhhx2t+A5XNmEHNu8tFJHOacJDp9dxozfJr
	4RGBRgpGcxpCXaXjrOQ9YIQ/iCDaWAzx8RlnEzw8pqox4g1Or6UIN+H0b0ezU1QrMbnFYVsZxsp
	67m8mN+igAvP7bWKsE3K7I10zXU7MLnhKrX/e7vDDCG00D4L+F5BfJdLWTrbBs2lLrV8ft8MW1g
	kTfP1nCVNRf1aG4qZaFU6iQnLCLZHE/QvvBid2BSo92gOn8ikJneAsKt+DdGNn2hSJynpTPgtcW
	yIgdHTpMuXUJN4sp4geh2Mk1pRxlLuK6D2SjyAKmSCFq8u/kP4iTDXpqkho2doX/d6pLf+GTuAw
	==
X-Received: by 2002:a17:907:9608:b0:c2e:350b:7220 with SMTP id
 a640c23a62f3a-c3169faf310mr221144966b.9.1791302963551; Tue, 06 Oct 2026
 09:09:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5893371ab206c97d5d2f1d72eb149d5ace4250e2@intel.com> <20260924211852.436787-1-conor10@gmail.com>
In-Reply-To: <20260924211852.436787-1-conor10@gmail.com>
From: Conor Svensson <conor10@gmail.com>
Date: Tue, 6 Oct 2026 17:09:11 +0100
X-Gm-Features: AclHuK8euk8GLEFfAD6Rnbhy2sHY5UC2jDl_5n4HYrsNEmactwXBlRsXbHOqyPw
Message-ID: <CALr9iFoWV7YVSb9Hi+kUUmZP5wUhGwaKf1XTa67KViqj1=4b3A@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/dp: Configure protocol converter only for TMDS outputs
To: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, 
	airlied@gmail.com, simona@ffwll.ch, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jani,

A gentle follow-up on this patch. Following your advice on the
original RFC, I investigated the root cause and posted the findings
and testing results to the GitLab issue:

https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17180#note_3679658

The revised patch replaces the device-specific quirk with a change to
the protocol-converter configuration. Feedback on the approach and
whether this belongs in i915 or the DP helper would be appreciated.

Thanks for your time,

Conor


On Thu, 24 Sept 2026 at 22:19, Conor Svensson <conor10@gmail.com> wrote:
>
> intel_dp_configure_protocol_converter() currently writes the HDMI/DVI
> output-selection control for every DP 1.3+ branch. The write is only
> meaningful for a TMDS downstream output; a native DisplayPort output should
> not be switched to the HDMI/DVI protocol-converter mode.
>
> An Anker 565 branch (Synaptics OUI 90:cc:24) changes its downstream port
> descriptor from DisplayPort to DVI immediately after this write. i915 then
> derives a 165 MHz TMDS limit on the next hotplug probe and drops the
> monitor's native modes. Skipping the write for non-TMDS outputs prevents
> the transition.
>
> The existing dfp.min_tmds_clock classification is nonzero for HDMI/DVI
> outputs and zero for native DisplayPort outputs, so retain the write for
> the protocol-converter cases that need it. Colour-conversion controls are
> unchanged.
>
> Tested on a ThinkPad L14 Gen 4 with an Anker 565 A8388 hub and a Dell
> S3422DWG:
>
> - native 3440x1440@59.973 after DP recovery
> - three USB-C reconnects on the first USB-C port
> - one test on the second USB-C port
> - suspend/resume on the second port
> - HDMI through the hub at 3440x1440@59.973, with HDMI-specific modes
>   present
>
> On the unpatched control kernel, the live descriptor changed from
> 08 f0 01 1e 00 00 00 00 to 0a 42 00 00 00 00 00 00 across the 0x3050 write.
>
> Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17180
>
> Root-cause findings and validation details were added to the linked issue.
>
> Assisted-by: LLM Codex GPT-6
>
> Signed-off-by: Conor Svensson <conor10@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index ffddf4b33..cdc3d7786 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4422,14 +4422,17 @@ void intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
>         if (!drm_dp_is_branch(intel_dp->dpcd))
>                 return;
>
> -       tmp = intel_dp_has_hdmi_sink(intel_dp) ? DP_HDMI_DVI_OUTPUT_CONFIG : 0;
> +       /* HDMI/DVI output selection only applies to TMDS downstream ports. */
> +       if (intel_dp->dfp.min_tmds_clock) {
> +               tmp = intel_dp_has_hdmi_sink(intel_dp) ? DP_HDMI_DVI_OUTPUT_CONFIG : 0;
>
> -       ret = drm_dp_dpcd_write_byte(&intel_dp->aux,
> -                                    DP_PROTOCOL_CONVERTER_CONTROL_0, tmp);
> -       if (ret < 0)
> -               drm_dbg_kms(display->drm,
> -                           "Failed to %s protocol converter HDMI mode\n",
> -                           str_enable_disable(intel_dp_has_hdmi_sink(intel_dp)));
> +               ret = drm_dp_dpcd_write_byte(&intel_dp->aux,
> +                                            DP_PROTOCOL_CONVERTER_CONTROL_0, tmp);
> +               if (ret < 0)
> +                       drm_dbg_kms(display->drm,
> +                                   "Failed to %s protocol converter HDMI mode\n",
> +                                   str_enable_disable(intel_dp_has_hdmi_sink(intel_dp)));
> +       }
>
>         if (crtc_state->sink_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
>                 switch (crtc_state->output_format) {
>
> base-commit: 703cd271db3a35088460ab3fec0a96bd48e7fe04
> --
> 2.55.0
>


--

Conor Svensson

Schedule a Meeting

+44 (0) 7497 376 365

LinkedIn  X (Twitter)
