Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793109194;
	b=VKn1+tpvtXfZ40UXnmezJDGXDCTfY2FteH1No8F9DXreynqLpzO930xGFvBeb/85jmRA
	 WfuPF4fS2zu4zwdhgcZgB9FXJ+PrraQo+jPbnrB4ukeqbHW+FaSjdiaA7y2beO32LiFGS
	 Boihd2OIO4iKIokXmoA4n8tqhm6tJVbKxfmPRm/rJVqUTlpjpy9sK5w4eIrjzn0qUiu7W
	 De3SQ3DqAABEhIknBv4doIon3RPhLGV74LMtCBY6dDQTLzuaGfMGhvXgFq5/0+XSjdO97
	 3NHh196R4n/C7GDdDHt/yvwXRoh4O8FAPqwsOiSf6CzbJeX3XEMKQ/12oKoVCCeyJcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C/QHwPFaYMgxwOdflsCg2rHPFq6Z1Jx6heGTIKTaV+Y=;
	b=U5FlKPkBtiePqZTCmIOJikg1ECyQL0T6ZbEDQWaS9v6j+cBgt0vfvJLdMt+vI2539EZc
	 5lVLIj9jy41T+kppFfKzTw3tCqw2TGd2X6x88hCwMagLguqzop/+NCgo/g5t9wtq7AMt5
	 /LnfutqBmu6JZOht6+sbUAQj0KN4T6ULSSmTE18rHR6V7GNP/1sN3yaoDD7emJKmAdjEq
	 SHLePTZ/3jObTFCJ2F/d8Pu9RMUb/H9Rsh+pM/lmPUH4FK3LZCklmVSMyBnq8U8UWreKd
	 REgwOXi7C2hL6SXkjXe8SZInfBJBYTmxSpzmKrLZeXA3bFP9LsaYejp3UU1FvedTLgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=neat.no;
	spf=pass smtp.mailfrom=neat.no;
	dkim=pass header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=Cn4hdgaq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B86606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52B86606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neat.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=Cn4hdgaq
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67a4cc01fb1so2016781d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793109192; cv=none;
        d=google.com; s=arc-20260327;
        b=YCaKl+iCh1Y1M9vi4SYzTh9llgK0XJ/A2+TObyT159jGttHJNuFhuV0Fsy4FPT3y9D
         f2RPUNLNT2aVgn1V9OFac+ZCxVb2lHW707WDlVmw8wh3SNVqaf/vtJA2viCFwXJ0Wcvp
         NvVpxbtC9PB4nS8+giOtexVk+Q7jt+zdam065hqv76Jz3DDmzgoXb40DFIrokuyrVzkp
         TjuRqODkSfHwZpsk7PC4SCIqQj//t4D3dJgiLfozrK4GNAuhTNOpgKWxDar03cWTuXsl
         E0z4wqQWKm2dvhDiKI8a8feoTDet3fE6y+96FuzjlyaACsnyZopq/676N/2YsIdNp0o5
         v11w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C/QHwPFaYMgxwOdflsCg2rHPFq6Z1Jx6heGTIKTaV+Y=;
        fh=7ZxNLw/69lKrgPRTVyOLH6DgmZnT6rHfODlCjOeBTWE=;
        b=DTAO2PiGun/r7+4XhmAQe/pTxDnjtQrUHb9DotvPuvbNMsjwL9uUGLPG3FJG+sr7o0
         yUZLIXgRrEuqK8/mmSePtz6yRz87d13FVXmG6x4OHt/RrXz3Tcz9jJfwBJk5vmU+PXAr
         4LP6Zz5ElXO2GzYDUVl7f3YjJUnDqduvf+5vcUAWCkPpKwfvG7D57JfLbnbzN/gTSMLb
         CGfgK7SlQ4Ydfw7SaDo9qaM4YnwxcsXa1dUBmkfCGZtRCTfP+0CMBwoP1yPgdsJ4jaj/
         bUgHxG4T8b8ndoH2zbeV2mbGneA7XeC6goUMLpjMXFNILK/LnAO1bDGNkVDvB+mwEQOX
         2Cxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neat.no; s=google; t=1793109192; x=1793713992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C/QHwPFaYMgxwOdflsCg2rHPFq6Z1Jx6heGTIKTaV+Y=;
        b=Cn4hdgaqC4F2s/DWyAb+scaTCfrDYvwg0+px/rl9Y1lzKFAeG4MMAD6bAp7UclOXPM
         7aYflXaKOo0xGwsAFiHyJmOKUwgQ54yWvnQ4syMBHfg4daQzhGXKFR0B2HF+unfdub+O
         ReR+zZoSFj8FeVsLt0dLNS5Me/o2qiTCjy93kA6QwfmqtfMk+w0yKv+D6i+fJiczLPkp
         isVbdjMskVYWFTyOGqzmf0fv4pJiPuLXYVjwl6Tpb+JCd4WDywm37ZKAeHXwwK/K5Dgn
         LuqQLhvGBvXKpQtwQ6yOqDAOyeD1WmwHoCu2Lqk8jOeHrXetGYRuLeGd9cGOC8q95iX6
         IpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109192; x=1793713992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/QHwPFaYMgxwOdflsCg2rHPFq6Z1Jx6heGTIKTaV+Y=;
        b=R5d3lx3aKChhYN9wA8YXbsTchWNUN3oVc+Dsh0IZI8vA30B6c08FbAWpAaTxFBEg2n
         CdH0lDPP2S9kOfJDzD/GYZ8dKL3cQIqEBBOB46ghEhzLDq5veSKjeeoDQAKeVxqK10pr
         Vh8EQdqg/xldKcVfOV2F/BfB6yg8Kam9Fn8++5zE9CFzdNZ6n0SSZgRlrbfTdGPKpZJ5
         vyw5ewL3xhF06SUWh0vqMzJY0ulkxPMMkzTrn4CcQnZJfs7a0Kt+x9JUz4fPRg0aJGLs
         iw5beH2ApAMS2dqM3OV9zb5zlqUCo9QjJSB8qr3n5UyYoNcbX1wCCv6NrkYOLSW9UQJj
         V04Q==
X-Forwarded-Encrypted: i=1; AKwUvBytWGiWi1yDNfTYWqCfxowcAMY27rlilOZqhEdrTGTdD+o/IZFkNsc+MZxh5mpEeGK05oNYWtaQfGegHhs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIS4misBA2fc9ScYAtfWC6X9q9Afx4K78wNfMBRGud1/aIvyqtZ
	urnEWoJnflN5ajWFHrzP25hGzrq09R+ARG7Oriaz809rfoDrki5if1aDWQMPejuYenefvM05uMv
	EqgjA83h9clve9OgUcCvPn5C8mTR5bZ81GrP7cZBcOY38IiVQ2etUvciT9x/7U62rYCI/E6dO4A
	nZ8g+od9Z8qwKz5GMHXqdltqCkanIB1dFClMOsvY7n2xoIbG8PXab+00SqCpZR0M52/57SgBjNH
	+nYd1BkiWVGvICCwoe3RHm/UqBHgLFL+2fB4tuE1px8IfOWRhEKXPBc+MCxWrKj0nAonA==
X-Gm-Gg: AYBFou0X2/pv2/xj0y885S9x0XcPlsj7z8nFHC8iqjMZFK0VT2GqrwEH1967ilCSl2B
	YFzrjxDZ4iWBjhQ5Maj8dylVhIZsoM1B3UPjbcq0vmo4Fel79FPMnPHsg20VX7rc+xia1q2gQcB
	ondzZaE1hypv9+3y2giZkMkj+/S/+hgRnAjZ64KLpavs8XJD8GbHPbL2JaBUtVQcimcqjEAbk6w
	L4rGDfXIWcdIKK9qUa+MWqtduITf9rmJRxqPliD0JT4Mbq5W1slfNbRxIIok6IqL3kvpPA8fAi1
	Sl4vYJcJVrSsUpEdgYdzi3JCYUk+SFwZYkNkS/MddesrzHWC569ByLaRQNLQQqEL91WFjjWXRLx
	GOybhqP3ArgLUuXCGBK9Ln+xfg+u1td1rLH6D5yvDt3tccJihJGLmbRAV
X-Received: by 2002:a05:690e:1905:b0:675:6228:2fdd with SMTP id
 956f58d0204a3-67a45193dcdmr8073792d50.4.1793109192290; Tue, 27 Oct 2026
 06:53:12 -0700 (PDT)
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
 <a8b9450f-af4b-47bf-b7b1-3b326ed52dfc@igalia.com>
In-Reply-To: <a8b9450f-af4b-47bf-b7b1-3b326ed52dfc@igalia.com>
From: Lucas Tanure <lucas.tanure@neat.no>
Date: Tue, 27 Oct 2026 13:53:01 +0000
X-Gm-Features: AclHuK_nxwMrSebAhzH6BzwzfF__ms2hub9Qe_tDk-dxbFBTVEwwSaw33DD8X-Y
Message-ID: <CALt7t=Ef9LS5vNOZq7JGZ1n-L5rgMk7mXBGE66jicfdkqAC35g@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/vc4: hdmi: enable scrambling before the TMDS
 clock starts
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Maxime Ripard <mripard@kernel.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Dom Cobley <popcornmix@gmail.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 1:07=E2=80=AFPM Ma=C3=ADra Canal <mcanal@igalia.com=
> wrote:
>
> Hi Cristian,
>
> On 26/10/26 22:23, Cristian Ciocaltea wrote:
> > Hi Lucas,
> >
> > On 2026/10/26, Lucas Tanure wrote:
> >> HDMI 2.0 asks the source to set TMDS_Bit_Clock_Ratio in the sink while
> >> the TMDS clock is stopped and to start the clock at least 1 ms later.
> >> vc4 writes the bit, and enables the scrambler, at the end of the enabl=
e
> >> sequence, long after the PHY has started, and clears it before the PHY
> >> stops. A sink that samples the bit when the clock appears never locks
> >> a 4K60 signal from a Raspberry Pi 5, while laptops that follow the
> >> order work on the same sink.
> >>
> >> Patch 3 is the fix. Patch 1 is needed on BCM2712, where phy_disable()
> >> was an empty stub upstream, so the PHY kept running after disable; the
> >> Raspberry Pi tree has carried this since 2024. Patch 2 fixes a
> >> pre-existing race in the scrambling work cancel that the fix would
> >> otherwise make easier to hit.
> >>
> >> v1 was tested on a Raspberry Pi 5 running the Raspberry Pi 6.18 kernel
> >> with the same change applied, against the sink that showed the
> >> problem: plain enable at 4K60, 1080p60 to 4K60, 4K30 to 4K60, a sink
> >> reset and a sink power cycle all lock with zero character errors. v2
> >> and v3 carry the same code; the hardware test of the final form is
> >> still pending and will be reported in this thread. Mainline was not
> >> booted on the Pi 5. The BCM2711 path is unchanged except for the
> >> enable order; I have no Pi 4 at hand.
> >
> > While converting vc4 to the common HDMI 2.0 scrambling infrastructure, =
I
> > ran several tests on the Raspberry Pi 5 and didn't notice any (obvious)
> > issues.
> >
> > Hence, could you please verify whether your problem reproduces with a
> > recent mainline kernel?  If it does, could you also give [1] a try and
> > report back the actual behavior?
> >
>
> I suspect you didn't hit this on mainline because vc6_hdmi_phy_disable()
> is a stub, so the TMDS clock never stops between disable and enable.
>
> Best regards,
> - Ma=C3=ADra
>
> > [1] https://protect.checkpoint.com/v2/r02/___https://lore.kernel.org/lk=
ml/20261014-vc4-common-scramb-v3-0-c68d58d959a2@collabora.com/___.YzJlOm5lY=
XQ6YzpnOmQ1ODUyMWJlOGIwNzJjNjNmOWRiMDk3ZmFmYWFkNDliOjc6YTM1MTpiMzBiNzY3ODAy=
MzBkOGM2M2U0ZjRjMTY2MzE5ZjVhZWZjY2QxYmRjZDBlOWI4MzI0MGYxMjkyNjQ1Y2NkNzJiOnA=
6VDpG
> >
> > Regards,
> > Cristian
>
>
Hi Cristian, Ma=C3=ADra,

Tested on a Raspberry Pi 5 with the Raspberry Pi 7.3 tree [1] as base
(pure mainline panics at boot on this board). That tree carries
vc6_hdmi_phy_disable() implemented, so the clock does stop on disable.

1. plain rpi-7.3.y: 4K60 never locks.
2. 7.3 + my patches: all lock.
3. 7.3 + the 7.4 scrambling infrastructure + Cristian's 9 patches: same
   failures as in 1.
4. same as 3 + drm_connector_hdmi_enable_scrambling() moved before
   phy_init() and drm_connector_hdmi_disable_scrambling() after
   phy_disable(): all lock, zero errors, picture on the panel.

Ma=C3=ADra, I also tried 3 with vc6_hdmi_phy_disable() emptied again, as on
mainline: same failures as in 1. So the stub is not what hides this.
Cristian did not see it because his sink re-evaluates
TMDS_Bit_Clock_Ratio after the clock is running and forgives the late
write, as most TVs do. Ours samples the bit when the clock first
appears and never again. So to reproduce the issue you need a strict
HDMI input.

Happy to send a v4 on top of Cristian's series, with the two helper
calls moved and patch 2 dropped since the common helper already cancels
synchronously, if that is the preferred order.

[1] https://github.com/raspberrypi/linux/tree/rpi-7.3.y

Thanks,
Lucas Tanure
