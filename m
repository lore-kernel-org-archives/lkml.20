Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793265030;
	b=KnG97A3qhlmIMVp5QpPDL1HgBbq87Mhyjy0pKWw8LpbHSS5sulJt0vyaOmytIHjOrnBI
	 Y0ujVBvTtsKMh6yOhAY4vlirIidvG0/UhAx7qEHEA24KLMfzgAWVFVBQY8NOW7H2qWhCk
	 2fufx5C0jIIenislq/VTZl9s5jGG9hfVljEuEE0iaFOy8RfcwB195cxQ/aaxeANTrNPWM
	 dU1VOPG6/H9AnSHlQ1T0Y6AAs7CdialgV1zpBuhYcIhl9PSws4nTobZiW9skKsYZriXB2
	 OSpNPt/Fe3xQqy43zvzI2uyU559Z4Rthuxc5je/WSnJnSjcwByfcqZtFNj+pzxSleGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793265030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=caAQWiNBFevbYkZD4cIAvcMK/yRV1Te8kfxrLtz0u0Y=;
	b=sEewSVVtwfe6wM/Z3TqnNGn63NaZe3/rPL+SeD817UtrL9nKZnCFOEEDNGk2qzWMk0FO
	 blyLPRYvUIaSw68gUORGAVHdG7v7h2WOC+cYZF6KYDsJLrVj1tKzb7WYRRbLoCWl1dFEV
	 X2UPuGYisLhIuoUhQTmm1ZBzd8vtYaZpwXyixWu6OZupsMzBMKBlmuR+5e/tat2qCAJf0
	 LMMK7WU6Ijtb9I3EgxRZ7CJqUssUlxfn9b7meFgF0H1IXm5fJZKF0yY73uOpqdhIzWNki
	 8Jtlzq7B35ogCd7wB97KV9M7TXR9Ccesy+Y9BnMCOAvHPwWXHNt25NqsD/L7J9/apPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LqKM89tb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B9D606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B9D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LqKM89tb
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-705cb6ceebaso1250054eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:10:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793265029; cv=none;
        d=google.com; s=arc-20260327;
        b=OBYpxxqAIljfCfF2KuuxBf3ffiqpTaMy7r60CsT1b+ScrEl1iLnnY13E/0WF13uu8h
         RyoVgopc1bLLzt6hV96QE2RgP3AgXjOBqSBjMvt0B2yrKEUaPUNAdgiJ9w6Hh3CXDIts
         Q8cKml2SzDzPwQZj9MVfR/xKqvKucj53EaoINTFkgve9fisi1Q/y3Jr5+mT/91RgnfIA
         8tCUiPgNY56VtQcwT/bZprmbdmDc+knZhwMyAEifh1Jnvn8gUGJ2UzICZ2M74rkqCKzI
         u2fRAgUAllHxnPtzXhVFghJCZeD+N2KxLIjSm6/9QdAhem93U/ixzXjnsNxtbR1wQNJm
         Xfyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=caAQWiNBFevbYkZD4cIAvcMK/yRV1Te8kfxrLtz0u0Y=;
        fh=fkBLHUV+7aIUvC/TKJ9M06J/4AlAOtI+SakWKZ/J5LA=;
        b=B7LZu6aTSMDRyqpRJXCGDU3bNL4jvxi/CRWoe1Ik3ewDE0Wwmzopkfk46APYhE9nAs
         KtkzEJ5zwJZhLZRInZG5qcSfM7p60v0/npxfGV4fHu0X/pcQlwMcS5Bp2wEllQyczyXn
         IljjvkFeZLgeep4vP1NAEoySUhzde3bJGKFoMuJHu0Ra93CRL3qr1IkIlRWwmtgS9Tn5
         kCmrrZTXlZ9VeUj64XDRppVWhSsDYWrwKlLMMRQNpJALK0RvnDxC1ZLCCJNeJbMTVYxs
         K2lLIdhGRgArM+MAjTjW+/pXy6Whk4Rbyq4uGg2W4clslTC5uIFguCkNBTc6ah72Vuyg
         dn2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793265029; x=1793869829; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=caAQWiNBFevbYkZD4cIAvcMK/yRV1Te8kfxrLtz0u0Y=;
        b=LqKM89tbHIMdvR/c7hupOp5rkP1XXZzJU+pnIYc3fsDKff1ZC+cLh+EBlFtzaEINzB
         dS4rl92nGVAhD3i8RidvdOLiG8OB8HiDiNSEY7GEIBroQvMU0OvSJ63B9xvkXHQ/2DkE
         R7+nqZBh4ASOecgSkYcadFgd7mN+moziXXAbf3gixw/87hc/FlQ4E3z//rigHLSzbU/x
         zAi5WgMW4sO21xFsjkgiDKuaKPIXNRetNl6LswNLzIVdGW3whJbeZ7HwdIcRL5FnJbn0
         pumlgtaOhmpF2hHKTsUZ4kiR8OohOb/UfKt7SzlND9QajQCOC69AkLGvLleEC8A4hLZs
         9h5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793265029; x=1793869829;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=caAQWiNBFevbYkZD4cIAvcMK/yRV1Te8kfxrLtz0u0Y=;
        b=R3F9MJFF2UgsuJI4nmw1xObpZ2TEtoLG8BN1qtWDbjzvtISEDKe9yojvVtDRqpKSpC
         QovqNJeraI3PeF/YcsZ5BNOLLtMPWx8kWs7UAnWm2eS3twteC/LI7vd7HhvIfE/D2oha
         OFbRM0AKkZCPZ0RU5KeB9y8IaD+Y5clndOMj8CMVJG1/fweGlDpdrw7gYgv47OXZV4nl
         9OgRfxka+Q8sI1y2g2JTrPfT+uX5bM/VdpWvHUKXAIMq9VHZHXbAC0JCUkkgBCCEltRt
         J4r8B4fToxEeIHFcbbGC9f77StsVEU17iDxTBOQgV97nxjwXnhFqXuOx/on5eQ8jeJtA
         xuaQ==
X-Forwarded-Encrypted: i=1; AKwUvBylXe4vn/g8IfWEHPjvJCDhJaE02Dn2PRrO+yGuV7WW2IubhNcYcnDX7Cnag9GsdPfEgcQ/hAr+Vvw/YWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKC94PmTIeeHgV5j1uRIo/dWo+h/Fxho0b2ouVV5edb2+/hd1mK
	7oSB1KKua0S8AZKRvDcfhc0B2pxhuopqMsra/gK9Fh45ee3pKBCF/jy6JEMJ+hl22+bs/+rKx+0
	lwIkMI2APY0DP+hok7JzO3G3Zi/FdoxILaLqMwgo=
X-Gm-Gg: AYBFou35N53qR+iJX1JN9+HL98gV0pFrB4wtYYzEvnjn2cLRa0XbzU1HDEbSHGkoJJ6
	1S+JJz2/9PbPbs9IO2Yhrqz/Jy+FQQCa7AQKkTXpkgz5WMiFIlLDuFOiDIUCM6551PDz0teElAc
	m5lfQTIDNNuSJ54fr6mrAQJCc/rfhBwxcuF32expYWbQO4ye1wQNtFwbL7KMs35lq6maO2JoHec
	UdgqR1JXQwSHH2w+G1GeYEsCVwBrT/AotkTYOfXBCgKhho7Q7192/j4fYDCqLfJcBwYZX31ywli
	p35KieA8HgiY/sotz/+xCBN841pZ8MqNGwD1MbhSGAQDLLvJuHeZx04hPOIdseyVLpitzahTile
	xCdyKpvWFDHtaHhn4FMR/IdQC0o6YcEWSX8Q=
X-Received: by 2002:a05:6820:1621:b0:702:5ff2:ba20 with SMTP id
 006d021491bc7-713efd0ce3amr2688820eaf.60.1793265029284; Thu, 29 Oct 2026
 02:10:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028162941.62762-1-dmitrymalovanyy@gmail.com> <77b574384ed695f8ea06a2ed142907e7d5f118d6@intel.com>
In-Reply-To: <77b574384ed695f8ea06a2ed142907e7d5f118d6@intel.com>
From: Dmitry Malovanyy <dmitrymalovanyy@gmail.com>
Date: Thu, 29 Oct 2026 10:10:18 +0100
X-Gm-Features: AclHuK-YKZMvoeI3CtZ25U_SjKR3_KVJy7xMS0FRnia5X4eD1IOJsW8DEIDfCPE
Message-ID: <CAKCCmHOLiSkBp0kTy128it5znRpQ4yS_MOohZOq38T0TF3RFmQ@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: Keep base enhanced framing cap from extended DPCD caps
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Harry Wentland <harry.wentland@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2026, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> Additionally, a DPRX with DPCD r1.2+ must indicate support for enhanced
> framing. The display is also in violation of the spec.
>
> That said, the spec kind of says to use enhanced framing for DPRX with
> DPCD r1.2+. It's subtle, but it doesn't say check the capability
> anymore, just the DPCD revision. That's my reading of DP v1.1a, v1.2a,
> v1.3, v1.4a and v2.1a anyway.

Thanks for the quick review!

Yes, I checked DP 1.2 and it is there in 2.2.1.1, "An upstream device
interoperating with a downstream device with DPCD Revision of 1.2 or
higher must enable Enhanced Framing Mode". So doing it in
drm_dp_enhanced_frame_cap() makes more sense, agree.

> I think drm_dp_enhanced_frame_cap() should probably be:
>
> static inline bool
> drm_dp_enhanced_frame_cap(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> {
>         return dpcd[DP_DPCD_REV] >= 0x12 || dpcd[DP_DPCD_REV] >= 0x11 &&
>                 (dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP);
> }
>
> And the remaining direct references to DP_ENHANCED_FRAME_CAP should be
> migrated to use drm_dp_enhanced_frame_cap().

Will do it in v2. I will add parens around the && part, otherwise gcc
complains with -Wparentheses.

For the direct users I found cdns-mhdp8546, it6505 and gma500, I will
convert them into separate patches.

There is also nouveau, dispnv50/disp.c checks the bit for the watermark
calculation, but the actual enable is in nvkm/engine/disp/dp.c with its
own definition. If I change only disp.c they will not agree with each
other. Should I convert both, or leave nouveau out for now?

drm_dp_get_phy_test_pattern() also uses DP_ENHANCED_FRAME_CAP but there
it is the DP_TEST_LANE_COUNT register, so I would leave it as is.

> One of the main reasons I don't like this is that we have the logging
> for the base and extended caps, and this sneaks in a change without it
> being present in the logs.

Makes sense, I didn't think about the logs.

Thanks,
Dmytro

On Wed, 28 Oct 2026 at 18:24, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Wed, 28 Oct 2026, Dmytro Malovanyi <dmitrymalovanyy@gmail.com> wrote:
> > Some sinks set DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT and advertise
> > DP_ENHANCED_FRAME_CAP in the base receiver caps, but clear it in the
> > extended receiver caps at 0x2200. drm_dp_read_extended_dpcd_caps()
> > replaces the base caps with the extended ones, so the link is trained
> > without enhanced framing.
> >
> > The Xiaomi Monitor A24i (P24FBA-RAGL) is one such sink:
> >
> >   base:     12 0a c4 01 01 00 01 80 02 00 06 00 00 00 81
> >   extended: 14 0a 44 00 01 00 01 80 02 02 06 00 00 00 81
> >
> > Without enhanced framing all lanes train (0x202-0x204: 77 77 81), but
> > the sink never syncs to the stream (SINK_STATUS 0x205: 00) and shows
> > "No signal" until it is power cycled. The same monitor works on macOS.
> >
> > DP 1.4 section 2.9.3.1, as quoted in the commit that added extended
> > caps support, says the extended caps match the base caps except for
> > DPCD_REV, MAX_LINK_RATE and DOWN_STREAM_PORT_PRESENT. Keep the base
> > value of DP_ENHANCED_FRAME_CAP.
>
> Thanks for the patch and explanation, refreshing clarity.
>
> The display is obviously being silly.
>
> Additionally, a DPRX with DPCD r1.2+ must indicate support for enhanced
> framing. The display is also in violation of the spec.
>
> That said, the spec kind of says to use enhanced framing for DPRX with
> DPCD r1.2+. It's subtle, but it doesn't say check the capability
> anymore, just the DPCD revision. That's my reading of DP v1.1a, v1.2a,
> v1.3, v1.4a and v2.1a anyway.
>
> So I guess that might be the more appropriate fix, really. Even if it's
> slightly more work.
>
> I think drm_dp_enhanced_frame_cap() should probably be:
>
> static inline bool
> drm_dp_enhanced_frame_cap(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> {
>         return dpcd[DP_DPCD_REV] >= 0x12 || dpcd[DP_DPCD_REV] >= 0x11 &&
>                 (dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP);
> }
>
> And the remaining direct references to DP_ENHANCED_FRAME_CAP should be
> migrated to use drm_dp_enhanced_frame_cap().
>
> > With this change the link uses enhanced framing (0x101: 84) and the
> > sink syncs (0x205: 03).
> >
> > Tested on i915 (Arrow Lake-U) through a USB4 dock.
> >
> > Fixes: a1d926527b79 ("drm/i915: implement EXTENDED_RECEIVER_CAPABILITY_FIELD_PRESENT")
> > Cc: stable@vger.kernel.org
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17719
> > Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index e623ccb4c..205b6cc89 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -1219,6 +1219,9 @@ static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
> >
> >       drm_dbg_kms(aux->drm_dev, "%s: Base DPCD: %*ph\n", aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
> >
> > +     /* Keep the base enhanced framing cap if the extended caps drop it */
> > +     dpcd_ext[DP_MAX_LANE_COUNT] |= dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP;
>
> One of the main reasons I don't like this is that we have the logging
> for the base and extended caps, and this sneaks in a change without it
> being present in the logs.
>
> And having the decision in drm_dp_enhanced_frame_cap() is explicit and
> same for everyone.
>
> BR,
> Jani.
>
> > +
> >       memcpy(dpcd, dpcd_ext, sizeof(dpcd_ext));
> >
> >       return 0;
> >
> > base-commit: feaa32dc98090b2f45f7b6f179711a6640169c1a
>
> --
> Jani Nikula, Intel
