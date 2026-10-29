Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793274410;
	b=4OhP9tvctAbhcni8MEd+fRM7/Ob8fBhJnFPbfoBxkzXfZAY3Oa9DqJOQs9iJ6PQB0Llz
	 vypKM4o9Xiqw0nLRSHAaasC9X1INeixqEePZWowi5GermPXBli6z5i1uQ6BT3BuTH8UXv
	 N39xDRyap2eGEXVVu5nti7O5LXMlJSmYLxof9IS45r8wti6oz/70Dr1/43xwPEXPM4PqE
	 w+9nA7f9dsJ2/MlnZWLxbPLD5bKc+3Zm+3YiTTubFIo0ajjw+CKbGbjmCw6+Zo7WlTQke
	 9pTBrtP/9r5gSArP1umis+VrEHtTjlbvUR3soy0hWyd6GMAqDO1P+JeiBDlINrfYacA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=riFBiDySsld/0Y1PSfvBfA5dP3L6lbgdUG897qeFids=;
	b=Lzu2+AU4XSJcGuio8rHi2FhyDdvqLqBoJvr6GDFavY4Gp0vw1VwN8o45FHqOEyEirGHX
	 mI3IkFAWeFmqvFVff/dDEtmK6Z2FmWS5sSmFpKGkJBsVi5nr7htzPS8Xwc6SroqbTuU4Y
	 pC+2nYUlRf2JFAW73QSM1OC3pUykWccWG7Cg4Asf1h4UIfIwdsVjQc//j1E3CHOFHn74Q
	 NHQCoXELKshJBiMf5nU+Mn+CyJH03EO6sZZ55tjnqWSdoxBAE+OJFTQO/WHjHkZXdtfWN
	 Ajhgx1MxXTe7UdDxD5UKZMkPXWhHzx2B6BPUvEHi7hx2UsUnR0D6BPP1OG/ruq/N9Tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=neat.no;
	spf=pass smtp.mailfrom=neat.no;
	dkim=pass header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=UNGBejL3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B5D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35B5D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neat.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=UNGBejL3
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8871ada1a26so16669707b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793274408; cv=none;
        d=google.com; s=arc-20260327;
        b=HpAw/YAFv0uH02nA+lXY6AKJoEmGfZ1sJ/hr3fkRm+zvr6IlmV66GieMqf1sprRZvn
         DVtkAejk9peNOnHvCuZxK6dQYaf8z/lp7Rvbp+TZRdP3dX2sspyE7JZIuE3yEbXdMEzb
         0/jX79CNeyaCecwhyX0XnjvzVYBxQcjBZ+lJH+ei+f59ZaxkHqbioHWpgUl3ZsuOq8S0
         oaeDNfxC0iVaDGipERT8t5Dk7f/Xkob7CZc+bHRukdycWm49AbJ2HoogLhSMBusP+fpk
         jEvrZVEM+J5K+9TrFnj0qBjucuDMEObLTaGMbVS74I6Zuzjqnk2B5FhN+UvwciWB00dZ
         n9Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=riFBiDySsld/0Y1PSfvBfA5dP3L6lbgdUG897qeFids=;
        fh=gAqLAx0ffPovuIf0QL279Zot2nuqLTvYv8pokEQaXhQ=;
        b=YLtomQnhq8le0z6ztZaud58lquUwZMWP99NYXF7dJXPc8ODX/wwtAqN/QqqONs3GI3
         AwFg0L7nzu7RcH/Hyv6/DvhxlGRiDI5RIAPF4ujim/SpJASq9/J8uE4oobmX7Ocnc0dv
         6h8MYp35ybtj/27iCkt/gH2T9GYgERhxFgFTuitWrS93AImHDdWEyadXD4iKdHhaLr8L
         pNtxY84yLo9YGt36Yvp5gJ3eLuZJh3QMhJJu1r1gvbf8YBArNbTjWjOjIRyvLG3f3ya0
         6k50xRhuLRoIzMU25Xnu2a6vwCH1vd5tbPsZ7DJb+sT7deUGubisBzS1oxJjWyRfy8r5
         yLPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neat.no; s=google; t=1793274408; x=1793879208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=riFBiDySsld/0Y1PSfvBfA5dP3L6lbgdUG897qeFids=;
        b=UNGBejL3/YdG8ePaXjDTiRKcTUKWi6gcMpckNIKbBO53r1O6756+iqg09scmbh68p8
         FJfbJvLxT8Nk18ak4tH4o82K5MOHt8IL65zSsCkYq842OkU0VujUDGJTy9SkBB3zroOL
         5uy/W4Qn4WRSvLUDttkxpibfwfvUX8h9ozDpHh/rjTSGB9e1XXNNWpeGak86YFGXNCwj
         iCb6/B8h0rWWorD/5YBlifT1kvYyEcUtKuCWzwxbLix9Z12uxEc9fb2Uhgv2H6dmltv9
         HccQCX9VSIMwg3j7awqtcHpHOk71EZfCTeP7IanPnMs7zS4WJm+ziAJ0n3J2slJw95Kc
         771g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274408; x=1793879208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riFBiDySsld/0Y1PSfvBfA5dP3L6lbgdUG897qeFids=;
        b=i8TUI9z+BEUlG8miMNDs96AzKoEdOnyHesotQ0mlcJlHGBhzjqNp2GTzyq0yq2MsaM
         GdI+AG3w3UpiLdlX7P6NpDTNa2dYy8FWsrfONr1IJIfO+MeUw5pY1Vjpk/w6uWFFahoT
         3hZ4KKbLXyvFK9gfNU18U31zZ40R2ziO+RuDBfizlRJkX0TwGmi6xeHVfBs5ctQzm4KB
         tXCIAo2k3iSPejUC99nAIZ4wVpq5oIj3ixrzklpDUSS1DgdQxkUYWyZ9uKayI6GUu2TA
         4DkFWr6sqRydyDVV+8ZoIxkvwZoJJ932KvYlefYvWRgINbpYqWlKYZaLGTBvIoAWjiQx
         PDEg==
X-Forwarded-Encrypted: i=1; AKwUvBy5VIWFEnKnAJRDb3/Fz8qdU9JwXWbLdew326v++kTRPozskiAW07GbXCwNo5TEKHv9lIcPbjij9rezG2A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCOuwFbx3G+rQVpBg3a4O1XKdmrX3urRoXQ598l4Tqs8yYbvnN
	djjsiFdM+zSJ46tS3OPxrz0lOCr1fr/cjCunyM0dJnv/H5DKyRWPtqSUZ3fSewbDpMylnqIgNIh
	NG6cHzsM3/Ukim1SvGGfC+jwZhvcFOm8tUIGGYM1fwVpclLl08q3lGuntq6UxlwEMFaba+z4fEq
	eLAiVEZaSYDEdFWWkZ6dVEJhXqYuggNSqpWg4s1ZxDQ/2Rd7lXPA6oYr32HDYQtdJdYwai06MKX
	cm7NtkCQytgw1r8Au0fRvoEH9duttL8t0M1f1fgLMsULc63Oh/oR5E8ko0UxYBbpf3weQ==
X-Gm-Gg: AYBFou2C2xMvj0mCefxRlrHI+fM0wQl2+gYR/K89eUA9DxzZCuM7xZEKwNgk93BeIEy
	0+zJfWTKAuMaVaNXcFsCGBkBnQ06Avg0GPhjFhOFyRwIzNLqqHElHHt5krGfiEG0YFLo9PhJo3e
	4uYBxCoPHo1dcwx0GwA2Uz0HAYD2eZKsjslfVArhGsZOEHWV5aeraIMcAGf5xQxd42hnJJze/Jk
	19B4hZrAWlyolmbyOC8vm8yKu+F4j+OqPi/9QBignNjBDyRlz6GTI1g2Bnxm600SSa1d76qIzyO
	9Wsnd0r79AAaOxGd18jeN/Nrlz2ZYeXhaulFM4HfTJL1UvsYGLzG7nfVBQU/yyOMXM+db1igD0n
	mozLCEpss6lCUW3gDIUzjBcle4RFzUprpSMjCcb79LubZBaQ0QodbamFJ
X-Received: by 2002:a05:690c:ec3:b0:8b1:9c2:87d2 with SMTP id
 00721157ae682-8b1b5c83536mr37789387b3.73.1793274407861; Thu, 29 Oct 2026
 04:46:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026164028.78792-1-lucas.tanure@neat.no> <at_4EgWZFghkRHzH@collabws.localdomain>
 <a8b9450f-af4b-47bf-b7b1-3b326ed52dfc@igalia.com> <CALt7t=Ef9LS5vNOZq7JGZ1n-L5rgMk7mXBGE66jicfdkqAC35g@mail.gmail.com>
 <a054e9e4-304a-427c-b78f-973fd06f1199@igalia.com> <f534555a-b62f-4bf9-96cf-ebd74b4b30f0@collabora.com>
In-Reply-To: <f534555a-b62f-4bf9-96cf-ebd74b4b30f0@collabora.com>
From: Lucas Tanure <lucas.tanure@neat.no>
Date: Thu, 29 Oct 2026 11:46:35 +0000
X-Gm-Features: AclHuK8RskCuC8Hdfkuek5FOUrJUlV6Oh_eeADhyjfk2iiUYXH6Ab5jF-a3wR7k
Message-ID: <CALt7t=GBa=9G-qGfTLohrcJaNApE_=Pc3TMD0jjTOiDevOP-kQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/vc4: hdmi: enable scrambling before the TMDS
 clock starts
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Maxime Ripard <mripard@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dom Cobley <popcornmix@gmail.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 8:19=E2=80=AFPM Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> Hi Ma=C3=ADra, Lucas,
>
> On 10/27/26 3:58 PM, Ma=C3=ADra Canal wrote:
> > Hi Lucas,
> >
> > On 27/10/26 10:53, Lucas Tanure wrote:
> >> On Tue, Oct 27, 2026 at 1:07=E2=80=AFPM Ma=C3=ADra Canal <mcanal@igali=
a.com> wrote:
> >>>
> >>> Hi Cristian,
> >>>
> >>> On 26/10/26 22:23, Cristian Ciocaltea wrote:
> >>>> Hi Lucas,
> >>>>
> >>>> On 2026/10/26, Lucas Tanure wrote:
> >>>>> HDMI 2.0 asks the source to set TMDS_Bit_Clock_Ratio in the sink wh=
ile
> >>>>> the TMDS clock is stopped and to start the clock at least 1 ms late=
r.
> >>>>> vc4 writes the bit, and enables the scrambler, at the end of the en=
able
> >>>>> sequence, long after the PHY has started, and clears it before the =
PHY
> >>>>> stops. A sink that samples the bit when the clock appears never loc=
ks
> >>>>> a 4K60 signal from a Raspberry Pi 5, while laptops that follow the
> >>>>> order work on the same sink.
> >>>>>
> >>>>> Patch 3 is the fix. Patch 1 is needed on BCM2712, where phy_disable=
()
> >>>>> was an empty stub upstream, so the PHY kept running after disable; =
the
> >>>>> Raspberry Pi tree has carried this since 2024. Patch 2 fixes a
> >>>>> pre-existing race in the scrambling work cancel that the fix would
> >>>>> otherwise make easier to hit.
> >>>>>
> >>>>> v1 was tested on a Raspberry Pi 5 running the Raspberry Pi 6.18 ker=
nel
> >>>>> with the same change applied, against the sink that showed the
> >>>>> problem: plain enable at 4K60, 1080p60 to 4K60, 4K30 to 4K60, a sin=
k
> >>>>> reset and a sink power cycle all lock with zero character errors. v=
2
> >>>>> and v3 carry the same code; the hardware test of the final form is
> >>>>> still pending and will be reported in this thread. Mainline was not
> >>>>> booted on the Pi 5. The BCM2711 path is unchanged except for the
> >>>>> enable order; I have no Pi 4 at hand.
> >>>>
> >>>> While converting vc4 to the common HDMI 2.0 scrambling infrastructur=
e, I
> >>>> ran several tests on the Raspberry Pi 5 and didn't notice any (obvio=
us)
> >>>> issues.
> >>>>
> >>>> Hence, could you please verify whether your problem reproduces with =
a
> >>>> recent mainline kernel?  If it does, could you also give [1] a try a=
nd
> >>>> report back the actual behavior?
> >>>>
> >>>
> >>> I suspect you didn't hit this on mainline because vc6_hdmi_phy_disabl=
e()
> >>> is a stub, so the TMDS clock never stops between disable and enable.
> >>>
> >>> Best regards,
> >>> - Ma=C3=ADra
> >>>
> >>>> [1] https://protect.checkpoint.com/v2/r02/___https://lore.kernel.org=
/lkml/20261014-vc4-common-scramb-v3-0-c68d58d959a2@collabora.com/___.YzJlOm=
5lYXQ6YzpnOmQ1ODUyMWJlOGIwNzJjNjNmOWRiMDk3ZmFmYWFkNDliOjc6YTM1MTpiMzBiNzY3O=
DAyMzBkOGM2M2U0ZjRjMTY2MzE5ZjVhZWZjY2QxYmRjZDBlOWI4MzI0MGYxMjkyNjQ1Y2NkNzJi=
OnA6VDpG
> >>>>
> >>>> Regards,
> >>>> Cristian
> >>>
> >>>
> >> Hi Cristian, Ma=C3=ADra,
> >>
> >> Tested on a Raspberry Pi 5 with the Raspberry Pi 7.3 tree [1] as base
> >> (pure mainline panics at boot on this board).
>
> I recall encountering this issue a while ago and spent significant time
> bisecting.  The faulty commit was d87773de9efe1
> ("clocksource/drivers/arm_arch_timer: Default to EL2 virtual timer when r=
unning
> VHE"), introduced in v7.2-rc1.  Reverting it restored the normal boot.
>
> Note this was later addressed via commit 94f39e4c017e
> ("clocksource/drivers/arm_arch_timer: Workaround bcm2712 broken EL2 virtu=
al
> timer"), part of the v7.2 kernel release.
>
> Which is the mainline version you've tried?

Master at 6b4b543fa187 ("Merge tag 'parisc-for-7.4-rc1'",
v7.3-16411-g6b4b543fa187), so 94f39e4c017e is already in. The panic is
something else. I had no serial console on that boot, so I have no logs.

>
> >> That tree carries
> >> vc6_hdmi_phy_disable() implemented, so the clock does stop on disable.
> >>
> >> 1. plain rpi-7.3.y: 4K60 never locks.
> >> 2. 7.3 + my patches: all lock.
> >> 3. 7.3 + the 7.4 scrambling infrastructure + Cristian's 9 patches: sam=
e
> >>     failures as in 1.
> >> 4. same as 3 + drm_connector_hdmi_enable_scrambling() moved before
> >>     phy_init() and drm_connector_hdmi_disable_scrambling() after
> >>     phy_disable(): all lock, zero errors, picture on the panel.
>
> Thanks for testing all this.
>
> >> Ma=C3=ADra, I also tried 3 with vc6_hdmi_phy_disable() emptied again, =
as on
> >> mainline: same failures as in 1. So the stub is not what hides this.
> >> Cristian did not see it because his sink re-evaluates
> >> TMDS_Bit_Clock_Ratio after the clock is running and forgives the late
> >> write, as most TVs do. Ours samples the bit when the clock first
> >> appears and never again. So to reproduce the issue you need a strict
> >> HDMI input.
>
> Yeah, that's probably why this issue went unnoticed - most displays are p=
retty
> tolerant and don't require 100% spec conformance.
>
> >>
> >> Happy to send a v4 on top of Cristian's series, with the two helper
> >> calls moved and patch 2 dropped since the common helper already cancel=
s
> >> synchronously, if that is the preferred order.
> >>
> >
> > As your patches are fixes, I'd prefer to push them to drm-misc-fixes an=
d
> > then Cristian's would rebase on top of your patches, as their patches
> > will go to drm-misc-next.
> >
> > Are you okay with this plan, Cristian?
>
> Yes, but sadly I will not be able to reproduce the issue and confirm my r=
ebase
> will not regress.  Hence I'd appreciate if Lucas could recheck this after=
 I send
> that series out.

Sure, CC me.
>
> Also, Ma=C3=ADra, could you please let me know when you apply the fixes?
>
> I guess I then need to wait for drm-misc-fixes to get merged into drm-mis=
c-next
> before I can proceed with the rebase.
>
> Kind regards,
> Cristian
Lucas
