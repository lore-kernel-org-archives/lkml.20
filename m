Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070F654B1B1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997113; cv=pass; b=OV4pJd+IZKG6j9jh3g269VdYymRuqjKdB/RCcGHEcFhLTeXWiU5xPjXHESZZpw9koikwSnZcXVS6c4PgnlWCNc94x3LS/4LVqDyqpteKRMTuavI09Z2BMsVFq8g3zYkMs0krvXuWVNuHIt86BFHqH0rELxxrITBEy6IsOsOaq38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997113; c=relaxed/simple;
	bh=8Dj8i1rH1H0qgVbAyOUZ/u1ZnChPav0h8Ra6MM0kyEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WtAWwpFT6EaZCe+Quz0GNWu5cVj7ftmpvJdUXVH3ckoa209fE1fCNdXfRPfsyt+mbiojxo0WCXL0S/5A0eQ0zrYQ+njV6p8bzQf9SEIIrA26O+UVViDKs9xK+Tv7eE9A7D7p03bao/y0+BWQqtHHpuP8N0U3FbPAf2INNVO+X+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aleph0.ai; spf=pass smtp.mailfrom=aleph0.ai; dkim=pass (2048-bit key) header.d=aleph0.ai header.i=@aleph0.ai header.b=t43DRY1T; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aleph0.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aleph0.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aleph0.ai header.i=@aleph0.ai header.b="t43DRY1T"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ba357a1929so4209045e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791997110; cv=none;
        d=google.com; s=arc-20260327;
        b=L1p6zxIh8RpVjr5erhZs7CS+Nfju0kzI5HnwsQIjr2gB4naI1vBRtZTJlUumwGcsUZ
         k31x9ZXuYzVjgwr+8NEZRllAjlaWg7fbbB6I9bfDrVTzUvBoK1+4KVMHzoO9yu/02PHI
         1QLloyRg77K7jj69Hd1pnl2GxQc58zZjj25vF70mFYkaCTWQ9zSwrUqLz9pi0+VQcA44
         NrOl9HrWBYY2d3lBN6dJvYoesIQcDuOuUrGzUNnkiyI6fP1HlBDKC2OiN53+0Hi1ONn8
         JZ05DR8xz0WM8OtRTcO8BYECTDklx8YOsWwQepXktzfsu8LZwey7L6WWWZ20EUWk1VYW
         UCdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PeoY0yWKZRmwA+3BQa6rH8gq2X5w0eejzi+aqnvivA0=;
        fh=VmJt9NuhWVq7vJ7xocsjenw4z2vd/IgtSyOMSjhs0JQ=;
        b=q/ATOjE0//O2byiZE1Iz/mIuXP+mizE9n8RZi/R7o+Th9ZpuUFMvNY1BBtZzzUAidk
         LUaqY/LQFhtUIhnjNJ6NLxd9z/XVaxq8aZUizAg71AFaerrfxNs8jJ1oWGIfzGYQ1mvM
         FK+JbLhQcK5TkmuQsydTaL0BIPJ2CHVe1ZFLRivKh2q5kFyG8INEFYzFl6E6hqDd5Hce
         fwrmD54uC+UNdZtwaLdA7YvIwKxDEx5T6JipRs+9xPcXhK5bidyv/YpodWwEzdr7cTEv
         mszKm1s0hbHTu/2M1lATHinZRUs6A0FbQOaaBfZEIp+YRKj8v+blqU64ZzTtwwCxfuKK
         J4Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleph0.ai; s=google; t=1791997110; x=1792601910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PeoY0yWKZRmwA+3BQa6rH8gq2X5w0eejzi+aqnvivA0=;
        b=t43DRY1TJ++ewHPm4wwASfTqiqiDnPHHL56lPJmKikkzeRFs0v2IcJLs4zG/I2Lr9T
         B7yEiBH0Og+6y8bS5hEITK1rcX7mqoUvKkI0QmijEv6C4vblzK4o6pd7mW0VA4X1VEjv
         5g0E9f9b71i/8iSlWu67ktkzkWSkCVhS9L11q3FX+zFmrWmYVonkB/EY/LlpChucHddK
         eWRGYAsepyvXiwCiOxzetyBCSYwtlS+HB0rvqbizkn/ITQRjxairmjmDqhoZ8En9bDEV
         ssCHPda+0taF3ElOGoR2bH2DbLYTlUbU5o3ONySGV2PJiFVxwJlwNYbeWECDrxgGkJtp
         XeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791997110; x=1792601910;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PeoY0yWKZRmwA+3BQa6rH8gq2X5w0eejzi+aqnvivA0=;
        b=XxehHiFkK517aCtfKnOqNztzZHsYhQc4GT8MZNXZekXI0gvNpqoYT6VmAX6trwlTzD
         g/s6hc9mRJ7ZGeNBx7aFSDOahqvdnnykKDlndnauVLNsQbaszIxdMLLxvYC/YriQgp5v
         W9pr/twKrAxsDLw6e8UCtOlWUS9bdOpGJOQqp5MlU2IQ7F+1++PrNpudJ3MeCA3qGhYG
         eLEJIOSrf87gqB5IGcHZAilB8NAJvFwDD6JL84D+v8gS2B7Qxwywfba79vNasdiryEHx
         3A0SwEe2zaiD5YQvADjJsEeyxEsepEjIRinObeDvoOfQo4FUUB8HJFu5t7ekRbZ4ZH8A
         FN1w==
X-Forwarded-Encrypted: i=1; AKwUvByNTKU9dm4s6+iYencaCLaOKFSZJv7p9GJ6YtdGxQ7S9ullQDtRzlUGusvxS+hDz6Epo1MxZKMfdVoLjSs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJg3j+dx7QogJpE+qiN2U59TsIkPcI+PqS8Bgpduw42GR0wRqKU
	r7/CRy7oGkzZkD/igkwFeReIAw8ExDTCkI9H5b6mvo1SPjzxaxCCYnYcrksXLKY9Pb3NfYBL9cH
	EZpXnC3rJgkYp2l9mtAMpRSueOKNKvXMysmt3A7i0BA==
X-Gm-Gg: AYBFou0xcqwSGEF/hJokmel8r+GcL+4thQpCp3ZYFYCJ867JB6NOfglcjRphKLGVBT2
	sICTrddVnDna+0+1VKSbbEynqlEFkVtKAuqM28HyZm2+ZJG4ogtDBGX2A43DxaP1SBbpjWiQBLL
	iSZ/7hK6Be09f9zkS31wF0rjcLaidoSqo/1VI7MtTPrxhKfuWBTgyQs76v2+0hdRcCBWS2ULhW7
	ZbshAqJNMpEF8znyTDhcAsBb0Z+JG7cwl9f/tbn3zhMQWlWVG/ij6cK/jLx9FcStLUFpbG5W23d
	dcBONJF+wgtRtl7V0MIVb+fL+C0xp3K97jq/egLpXQd4vCamCErHvYv0Ty31SG5FzYvf3sbsxy3
	h/0ua6Xm9yev+BAzkdiqcVlth8g==
X-Received: by 2002:a05:6512:3187:b0:5b8:bc5e:d0fe with SMTP id
 2adb3069b0e04-5bcde6d0062mr5550632e87.40.1791997109796; Wed, 14 Oct 2026
 09:58:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-fix-psr-async-trans-push-v1-1-ee79bf31b66f@aleph0.ai> <as9lLU0VnFW6JLKf@intel.com>
In-Reply-To: <as9lLU0VnFW6JLKf@intel.com>
From: Vladyslav Yamkovyi <hex@aleph0.ai>
Date: Wed, 14 Oct 2026 18:58:13 +0200
X-Gm-Features: AclHuK9DejIsKpYNlJitvulcu8uweG4HpEyel77BVIQowt9vPUrR_69jHdifP7A
Message-ID: <CAGkn_9h6TMgEk6e0JEROYx_O08Dtpn=_Jyd=T+HuiJZmyGynCA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/psr: Send a frame change notification for async flips
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	intel-gfx@lists.freedesktop.org, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	=?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>, 
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There was indeed an error in my testing. I ran a synthetic reproducer
separately from my compositor work where I originally encountered
the issue, but failed to enable VRR in that test. I do observe the
errors now.

I withdraw this patch. I will review the logic more thoroughly,
particularly mentioned vblank evasion code, and try to investigate
sending TRANS_PUSH consistently and if this is worth pursuing.
If it will not inspire confidence, I will seek to reliably disable PSR
trans push usage.

--
Vladyslav Yamkoyi

On Wed, 14 Oct 2026 at 13:19, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Tue, Oct 13, 2026 at 05:16:07PM +0200, Vladyslav Yamkovyi via B4 Relay=
 wrote:
> > From: Vladyslav Yamkovyi <hex@aleph0.ai>
> >
> > On platforms using TRANS_PUSH for PSR frame-change notifications,
> > intel_pipe_update_end() exits early for asynchronous flips, before send=
ing
> > the push. The register-based notification is disabled on these platform=
s,
> > and an ORIGIN_FLIP frontbuffer flush does not force PSR to exit.
> >
> > This can leave an accepted async flip without a completion event after
> > PSR2 enters DEEP_SLEEP. On Panther Lake, scanout freezes and the kernel
> > reports "[CRTC:152:pipe A] flip_done timed out". Intel IGT kms_async_fl=
ips
> > reproduces the failure with the compositor inactive when a 200 ms idle
> > interval is inserted before an asynchronous atomic flip.
> >
> > Send the PSR frame-change notification after plane programming and befo=
re
> > releasing the existing PSR lock. Restrict the push to CRTC states that =
use
> > TRANS_PUSH for PSR, leaving other async flips and the synchronous and D=
SB
> > paths unchanged.
> >
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9582
> > Fixes: 129a4da11707 ("drm/i915/psr: Use TRANS_PUSH to trigger frame cha=
nge event")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM sparse smatch
> > Signed-off-by: Vladyslav Yamkovyi <hex@aleph0.ai>
> > ---
> > Based on drm-tip (2026-10-13); also applies to v7.3-rc7.
> >
> > Runtime-tested on Panther Lake (xe, eDP-1, 2880x1800) with Ubuntu-based
> > 7.3.0-rc6 kernels, before and after this fix. IGT kms_async_flips,
> > async-flip-with-page-flip-events-tiled-atomic, dynamic subtest
> > pipe-A-eDP-1-4-rc-ccs, fails with Flip Timeout before the fix and passe=
s
> > afterwards. An LD_PRELOAD interposer inserts one 200 ms idle interval
> > before the eighth async atomic commit without changing its request or
> > flags. Both runs enter PSR2 Early Transport DEEP_SLEEP with selective
> > fetch enabled before that commit.
> >
> > Clang 23.1.2, W=3D1 builds and Sparse/Smatch checks of the CRTC, PSR an=
d VRR
> > translation units for i915 and Xe produced no new diagnostics.
> >
> > OpenAI Codex (GPT-6-Astra) assisted diagnosis, reproducer and fix
> > development, validation and patch preparation, following requests to
> > reproduce the freeze independently, trace its driver cause and prepare =
a
> > tested upstream fix. I take direct responsibility for this contribution=
,
> > have carefully reviewed the change and ensured rigorous local testing.
> > ---
> >  drivers/gpu/drm/i915/display/intel_crtc.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/dr=
m/i915/display/intel_crtc.c
> > index 10ed9bdfee76..8ef24cddbaa6 100644
> > --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> > +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> > @@ -736,8 +736,16 @@ void intel_pipe_update_end(struct intel_atomic_sta=
te *state,
> >
> >       drm_WARN_ON(display->drm, new_crtc_state->use_dsb);
> >
> > -     if (new_crtc_state->do_async_flip)
> > +     if (new_crtc_state->do_async_flip) {
> > +             /*
> > +              * LNL+ uses TRANS_PUSH for PSR frame-change notification=
s.
> > +              * Async flips skip the vblank path below, but still need=
 to
> > +              * notify PSR after programming the new surface address.
> > +              */
> > +             if (intel_psr_use_trans_push(new_crtc_state))
> > +                     intel_vrr_send_push(NULL, new_crtc_state);
>
> This will make the behaviour of async flips + VRR inconsistent
> between platforms where trans push is used for PSR vs. platforms
> where it's not used. We don't want that.
>
> So either we want to start doing trans pushes for all async
> flips+VRR cases, or we want to disable the PSR trans push usage
> when async flips are happening. The latter would be the safer
> option since the mailboxy trans push usage this would cause
> hasn't been done before. The vblank evasion code does try to
> handle it, but it's not actually tested.
>
> >               goto out;
> > +     }
> >
> >       trace_intel_pipe_update_end(crtc, end_vbl_count, scanline_end);
> >
> >
> > ---
> > base-commit: eb1bf4700d3b25a1a1e670ef31cc06969fa08019
> > change-id: 20261013-fix-psr-async-trans-push-bfa6550270c7
> >
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
