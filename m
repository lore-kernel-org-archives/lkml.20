Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012E94A689A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407852; cv=pass; b=BbCt4/iPakx+C3p5fpYONBOLXsNR9ccy9s2h4iLjz6UPtY8m+tvipcQR99kqoSwdOT+C9QEhNZHhTet0FfWtUrtk8G3bC2lDoqiXS+6b8Xld2jnJhFSb0OPTj3NSduDT1dk0J9bmI2hQlY9IaeeAq0Q8FC/JXHnuKtZZz/SUKXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407852; c=relaxed/simple;
	bh=bfHt9VJUjw2jpaKsvRmu5N8bb4qZt+FbJS5wdGnbVME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dGrATr82rgzrYDnxrUdc2Fp0Le2TaCgoWwySe/MPPkvGEEsf1d5Psd+jndWfTDESQu6m2lC66Sfg7w/1GWlMYUQSnCcQl+sPJxIEajbn69C2vhVx1L9uBgMIw/pgmETbxSNeKC/AJMdEIJKtScLE5p07XNBwB0o3hDvK4UwMJh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkE25WF3; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkE25WF3"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1648166a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792407850; cv=none;
        d=google.com; s=arc-20260327;
        b=KcHIPjQYDsbi8K+nmYgaBvSLSFTU/x2pOopKYhzYaIAnz3UNhOGCsk3hKo+ayIHg9I
         E1EhJ/jQmDGr1PEU74LcQV57EgzRnM6WGNR6+Y9hhk83C2UXytYkWFYwetKF7c2o0w1m
         UUg/icNQB3ARCfEkKFe9zEz+LN0o5Ypg2tVkqteBVe7Gt0Jjl3IeL/9npOpHY3/WA8jI
         H4vPYvFvzsnlr64YaLs8vMpANKNFtj4nIR9nndSPyraD5XziOBWyEMzsHWAOIzi8EaJa
         Lw94+KFUB93PfPYyYoET1DlpmHl0tmc46SzPl67YKN84nYGR88hF8UBAmxnxDTY0WD4S
         LdzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2RjmAJkJaRfKW8CM604T3xdOE/8FYHsXLHXgCKfQYGM=;
        fh=SUaacRKGUBNFqLKpSkQ0ii4J98zYGwBl+QCUSqmScpM=;
        b=aYD89fCkrWzWZ1FaNoDXNLTeDwH3B/g5lm/7QpEG6+Io5elzKeLBFeRMZ0oNFihaT3
         9ZsE2O3/b0Z8lOZakH5jQ0r7vB7TeVwBWIRAcP5C6W4uQTgRhN9C4/V/6uwj29h8XBFI
         KgSjrLD7NBSThcgXW5rIA38O2pqsyHY+TC3PDNm7RV4qp9SSVDErOCj9nbOiHeOReZSe
         qFWA2uF98DdQZoTImrG456SSoKyv8jTEn55N1ItHZshvCdV8Ek9g5rJPykAPWW3i6Vme
         PyMRR10M1592RoL3azEk+Fvu4NVYtzDak+gf/wR7g37bJnuBcydIxNCtmdGvtffoUvNT
         3P2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792407850; x=1793012650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2RjmAJkJaRfKW8CM604T3xdOE/8FYHsXLHXgCKfQYGM=;
        b=hkE25WF3TS5GmwX5rJIjm82r6l8ivurb5IXDVfJwUrMsU5PL2R2qw0QLzZY3D9tmIJ
         K3flmfB5VEVE1d/YIXwoibHUETJeJtOd43MmhTGeG+g8NKFgYrqRnttLtB722NsOu2m5
         dLbEM8JhoOUn3lpLAvd8PAl8Exn5J2ioRqnDfiM5UMmpoxgyuC1/xyjtDnk1suZbGUQx
         zfjYQZzMN2A3LhfSmySpIvtusTR8Ej4jkGZ5pdcKoWnND0YkcLrPFZ2lbQKxHfDFa8J1
         5zTNyMPiPKbY9f+DcepKc8q6UdSfAOBvj49wYV5DUKgP53niPT4gSGzGApQfsZImqIf4
         Y9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792407850; x=1793012650;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RjmAJkJaRfKW8CM604T3xdOE/8FYHsXLHXgCKfQYGM=;
        b=2oDE95nyBLWaWDdIdb02dRXZrT5WJSaxzh7dT+vw4JAZY3GZ65aSr7i1SdOmAq8pVg
         QdmwSXp8vd4ymyxLyl6kx9PYnVjcWrt6SSLykPp2WztWf7zHQ63Cg1Va4WdEATsdcMlP
         JF07JeUm2QMo4WTaIsATtYSRJrOFLJJDxgpc+Akn0IMiWN/e5GdSy00TkbDUhCtKFpxx
         fBjPgaa/CS+2gGZOkvgQFJJ/Jv2t8tZT/INYc5sQwPhKb5qOVv3IaBZXbRBagfweBixZ
         dsrUpyas+QmI6jranLwFyINxRm3HG7TAUHvlFPeGPzXXtHleVZwDP6snVd72pvwTOhAl
         CAGg==
X-Forwarded-Encrypted: i=1; AKwUvBwEaWVOvdVTCofnQ6fEiSghSw6vCamoT1nEz/esr3BQ+ifpljl0IucIQeTdUkLCzROlVk8QaAxTxwacN/U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQkQdQbs+zQ5TjClSITJ8Ri2hgvoovcq2jNK0SXRANwktcO9bm
	6GZLEMLvHL0tiQoLR8sQTkwxdmLabrVFX3bQbSwoUgWfMP8VbXOCWJbu7GDtnjUk3BxhCIcsxHS
	bqG8WTBN9NWR+jbM6JRc/+iC50fvAEmc=
X-Gm-Gg: AYBFou1W/fLWbcUW3erhdqlEmXXGUmq8a9brti6lmwRcq/dGejrKjLSs1GiR72SEXF7
	MXneiznXoLgta1ruUmBk9e0hOATSFL1pXhdsjiNuFHVtNGgVTJgWbVwrufmGCqaW1t/bOZvkVAl
	nHPiTx3eKymzg2zd3srL7i1rkPMqgq2I96/GVLRa2abhfHny94DPwpCP2HD+zKq1DHv4GqJX8fe
	trQxj6B0o32GRA+4jo8ctneXFXl1BXBQY2sBzHYG0kd/kKSizzCdI8BzZirqe9m84Qagdaqaxok
	iP1p8oo+5DWprynGJ5bWu4fZ5PWhfQXSWAORl/riuqggg6ZcKln4r7/b8H+CKgsu3kusTMP1CB4
	oKpXI5n2jo93zdIR/Tfjy+czGDJqayL5RphUqKdR2
X-Received: by 2002:a05:6808:3509:b0:53a:6769:c35b with SMTP id
 5614622812f47-53ccaf1f442mr5332468b6e.12.1792407849778; Mon, 19 Oct 2026
 04:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018-vlv-dsi-owned-gpios-v1-1-3ca18bcda670@gmail.com> <atXp2NSPKZUPj8sq@ashevche-desk.local>
In-Reply-To: <atXp2NSPKZUPj8sq@ashevche-desk.local>
From: Michael Anderson <mwwa919@gmail.com>
Date: Mon, 19 Oct 2026 07:03:57 -0400
X-Gm-Features: AclHuK8biEMfZ_1GVer949iI38PfSha8JvD86j9Plx2_choI2YB3QRBY5aZp0yo
Message-ID: <CAL-Wm=O-Gr3CuvCn8iSQceQMhu=LGFz0SPhmWeFL=RiVnoprdw@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/dsi: Use owned panel/backlight GPIOs in VLV MIPI sequences
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	intel-gfx@lists.freedesktop.org, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Hans de Goede <hansg@kernel.org>, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for looking at this. I'd like to make sure I understand before
doing a v2.

Here both users of pin 10 are i915 itself: intel_dsi_vbt_gpio_init()
takes it as the "backlight" enable GPIO (soc_panel_gpio_table,
PPS_BLC_SOC), and the VBT MIPI sequences on this tablet then toggle the
same pin as the panel reset (low in ASSERT_RESET, high-low-high in
DEASSERT_RESET). Do you mean describing pin 10 with a software-node
"reset-gpios" reference and having both paths go through
reset_control_*(), or something else?

One concern: the VBT drives explicit pulses on the pin, and shared reset
controls are refcounted, so a pulse from one path wouldn't reach the line
while the other holds it deasserted. Would an exclusive reset obtained
once by i915 and used by both paths work instead, or am I missing how
reset-gpio handles this?

Thanks,
Mike


On Mon, Oct 19, 2026 at 5:58=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Oct 18, 2026 at 04:12:40PM -0400, Mike Anderson via B4 Relay wrot=
e:
>
> > On VLV with PPS_BLC_SOC, intel_dsi_vbt_gpio_init() requests the
> > backlight and panel enable GPIOs (INT33FC:01 pins 10 and 11) for i915
> > itself. Since commit 8241b55f1ded ("drm/i915/dsi: Replace poking of VLV
> > GPIOs behind the driver's back") the GPIO elements of the VBT MIPI
> > sequences also request their pin through gpiolib, so when a sequence
> > toggles one of these two pins the request fails and the toggle is
> > dropped:
> >
> >   i915 0000:00:02.0: [drm] *ERROR* GPIO index 10 request failed (-EBUSY=
)
> >
> > Before that commit the pad registers were written directly, so the
> > sequences could still drive the pins i915 owned.
> >
> > The Toshiba Encore 2 WT8-B (Bay Trail, DSI panel) uses pin 10 as the
> > panel reset line: MIPI_SEQ_ASSERT_RESET drives it low and
> > MIPI_SEQ_DEASSERT_RESET pulses it high-low-high. With every toggle
> > failing, the panel is never reset after i915 sends MIPI_SEQ_DISPLAY_OFF
> > during takeover and stays black, even though the backlight PWM and both
> > enable GPIOs read back as on. The tablet only has a usable display
> > with nomodeset.
> >
> > When a VLV MIPI sequence targets pin 10 or 11 and i915 holds the
> > corresponding descriptor, set it through that descriptor instead of
> > requesting the pin a second time.
>
> Ah, nice, this should be solved via using reset-gpio, which is exactly fi=
xed
> for the reset shared lines case.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


--=20
Michael Anderson
