Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7370030D3F8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884556; cv=pass; b=im66jb9R2Kp0oY2ofb7/vugrnkfjXVE0Ta9ouqeE0p2olHZ2POdxzV1fTPMcpV4k3d//v5vTcOIQBdrRtSGcB/8vphcOYMRF1j8fh2jacxTC/y44mnwNiTejv5aYp0bmLijDVVp2VLlQ5AYQFYgKz+NAhrzcy4SMD8a90YSyspo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884556; c=relaxed/simple;
	bh=gx0WNzHrzpR5Vg5y5KJZ32oxwshPQgn8Fi9efTzEQjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kxVGjbEnR6toxEadmd4mq3bxkvneAJ6TnSAfUI8mvneEWnwlvoPnzir5dWRlx8wxpUlFv3ySxA3tdA6LJw1/1n1pdY7vgZanUEA5cCWJPdPl/uLST8pD0QoMdEEmENZ1rHDflrlBkVMT2NTS53nCOrYyXNpWEeA9dOOXL7dxMEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHI7JKr2; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHI7JKr2"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482e257a23aso3339020f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788884552; cv=none;
        d=google.com; s=arc-20260327;
        b=il+QPye6bQAPlSCljY1gHQpFoz8imHIYsdmasC9XXcS2ZT0/4tcdQodE7H0LmtsyKQ
         okwEblSiRuRIRHJ/GyPFkAsPi4mnm0lglg6p6NFbrpk0yaF64kV0B4AAgJuWRjEUrT6D
         JDFq/OktyzY2xM/nXJLOEEh5WHxkAaK+hWmSW3SP7dChbQbL7Jn8rEMnC55MK2yQ7D28
         T4GwhIUR1r7y6hHqvS6C8uVBGJ8XzJ/8eoXhTmHALTP6LtDzp9ApmTfZdhZMi3J/BPNc
         6AQwV8HZvI7KPINpMyYOZQGoz9S/gQCaEqt7gaBJLcV9oU+SzMP73iUPlrQtblYvpL3g
         AQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jekOF2OhfE9K8vBMYq9LG6isiwXmYjORyhfyHiOqLIA=;
        fh=W/BudQMG3F00x1KHembFVejDgOGpz2bNwbfANktsXuY=;
        b=lVImN8YKmkYIEqkuqc9MDaf+igPfxXbubOdowjEuxn8FFMareCsTGFjknGEHHkRhQk
         qCn/wfruTFu/SzI/pllo1TVD1hF5u4MFRcJKIxMo5gHcJ5UkcH1qdgaQMVoGvsyHZBcr
         LN3m2Jkguyqy40FvXG5Vu3a28FE8wefUwiJJHrJod3FsDpn5iGlkdLjSQRH/mQ8MpGgX
         /CIX8IhJk3wE9yciqVODxrMRklzThTwIzttjCFit3+zo9d616nejlwoJD9J5wYe37kUT
         4MrhgFcPL8JYuEiMxwPHr6rLHEyi5VINBxb5k10aklHkfAGMZRXqHGu7Qp81Sx2DISsH
         3mEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788884552; x=1789489352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jekOF2OhfE9K8vBMYq9LG6isiwXmYjORyhfyHiOqLIA=;
        b=MHI7JKr2kkr24YW4snLpJdEML8QbgbEuKlTVoMWeXvxapQb9bE9iEJ/apSQfsEBCyF
         6UK7QNkxSB/f9xiBqGLkw/iBAFfKmaoStMFU0SS5vDwnJAGG+tC7GH189zop7UdBzH8w
         nwK+VulVgJKrc1YU+MG+M392P5la+71HfwYsPHAQAtL6Wmj11OiTlSRr3/2FVb7gcRtK
         kzeWmmZTOwgHWcLQ2wBGrFe/9jhFTHjnktsABOgWj2M/hW1C+S4I+XMRSJOVRPGTC81W
         1m9LjXgjk7Udg7NCQtPn+rsj5TDhUg6pzer5U/kGbQZXLXNO6XY0wDlRDF54Tgi9padj
         LwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788884552; x=1789489352;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jekOF2OhfE9K8vBMYq9LG6isiwXmYjORyhfyHiOqLIA=;
        b=ffZicGe5hYqEOJFAGzSGP4JABBbn29bpMRkWgkHgtEQBsg6sfab8eCEG5BBbOgF+eV
         W0woKo99D0WpbyZ0cC94n511XyyCvfKaa+dVEE1mv3fdq/grP30i6ktvA7o2e6RB3jed
         iEW/FIymmA5+DMmQpR9ennSDXp2s/MYncOtN38uwi1Wk38NwPxpxfmFpL/yiXJ2ubfWX
         9qUWddd1DfPNWivuA3Lt7VMoaYRH0BNZCZKRECXgi4FrHpIsxcSOl2MFYVvvqMhbF4Sc
         W5Zld4G3bBTB0PQjPYM/XaZoA2C6gqsbTsbAixeF2go588Cd/to9tki+3kOzGHOvKLHf
         FnWw==
X-Forwarded-Encrypted: i=1; AKwUvBwlDOZjtdCeHveU1qoTaC9g/MDMovpQtd/B6lsu4wcdqCq6OWGsCxBbHg2/4EacnQl5/Yvnqt9gs9dln2k=@vger.kernel.org
X-Gm-Message-State: AFuF++kBNdjeOS9yJgIVaMua58YV6l8OumYyJuQbTgwfdRhbtm60hXsP
	B8Cx4N2nyMBh7tgMpOJ48YF0N/zKcXgFTVr2JeXwXIrwR7OysE+Ki1bwAkJrMQlM1hogi0BWjCm
	zhsbJScEnELGrfcC2Ud/NHL73/Gq5QuM=
X-Gm-Gg: AYBFou1cqCj5a+/qHXZx2XN3bNxUxxVbicgU1gbArIDIdoc6ZIeAhiA1JS1aGyF27kK
	kzxcBlJmF6NLQmidNIMHhSJAeXgaEzKb+Mne/7EA/mT98NSBVh2zM4reLcJrUROJwRZGfhj/gk5
	PiPObSPn6thOc7wh1qKU4Gvy1TnMK8UN2OmlNlHwihwvbTfMlJXBPI+Js9lFgrJB5zYkseP4HG7
	xp0VC4HLi2pzkgUetd8+KEXRrny0INoHv4Hsjch2Fhdmu1laR7+Qasd9hnEQ3WzDXnYazcnRZxr
	ixWMksaoYFHkr6H7XYiJHiDp/Ab3o4lKbvwlj8pDwDOmP46Aewwzan7Kw9bDx1q4AwlGelM2uPm
	XW34VC/iffmp9z50jPLBUvIkHxsRaMg==
X-Received: by 2002:a05:6000:29c9:b0:485:8ecc:9415 with SMTP id
 ffacd0b85a97d-4858ecc96bfmr18626346f8f.48.1788884552482; Tue, 08 Sep 2026
 09:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXBFu=W1MnEA+Eu_zzUy3qMyFRbbeLgYn0waxMdr5cAnA@mail.gmail.com>
In-Reply-To: <CAMuHMdXBFu=W1MnEA+Eu_zzUy3qMyFRbbeLgYn0waxMdr5cAnA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Sep 2026 17:22:04 +0100
X-Gm-Features: AcwNN1U9H3bV0zPtcgBr5_fY5_Ex_KcZm0AWkc_KXas88ZieEy0_hzjnmDi9vSA
Message-ID: <CA+V-a8uSR2jgpYqeUxteqhSD-FuxKBT_o2519y1z35cg+3XOig@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Add syscon support for Renesas RZ/T2H & RZ/N2H in
 CPG/MSSR driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, Sep 8, 2026 at 1:31=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 17 Aug 2026 at 21:25, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs
> > in the CPG/MSSR driver. The CPG/MSSR block on these SoCs is a
> > multi-function block that integrates several system-level features beyo=
nd
> > clock and reset control, including clock monitoring, write protection,
> > and peripheral configuration registers.
> >
> > For the other IP blocks to be configured a syscon support is provided i=
n
> > the CPG/MSSR driver. This allows other drivers to access the CPG/MSSR
> > registers via a regmap interface.
>
> > Lad Prabhakar (7):
> >   clk: renesas: r9a09g077: Register SYSC regmap
>
> Thanks, will queue in renesas-clk for v7.4.
>
> >   arm64: dts: renesas: r9a09g077: Adjust CPG register region sizes
> >   arm64: dts: renesas: r9a09g087: Adjust CPG register region sizes
>
> Thanks, will queue both in renesas-devel for v7.4.
>
Thank you for picking it up.

> >   dt-bindings: watchdog: renesas,r9a09g057-wdt: Add CPG/MSSR syscon
> >     support
>
> This is now in watchdog-next.
>
> >   watchdog: rzv2h: Add syscon support for WDTDCR
> >   arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
> >   arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
>
> These two have a hard dependency on the first five patches, so they
> are postponed.
>
Agreed, once I sort out the series [0] maybe we can take all the WDT
driver changes via renesas-soc due to its hard dependancy.

[0] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mahadev-=
lad.rj@bp.renesas.com/

Cheers,
Prabhakar
