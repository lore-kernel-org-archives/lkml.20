Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793730092;
	b=iFnyU4H9jiOrbCD0v4SwzB0t9gmKejqTdbGQf+vFj9V9dLC6lT6OGE2QWu8/CYQM8b18
	 wcEoGjVXMYbIZPUvbCo9V3GQTIMMfIal91+jqHypoTKNpy2P6Y3wNYw64r9R4cflKR2y/
	 aiPIiFkgQuuEBRGLp8vxUWs5qTEP76dmnS9WjmiJDCkrKeRHAgQZgUri9p2iNdpGxEhP9
	 BWXhmU/XipuLeTNsnKwH53XJb9AH9iqaW8Hwxr29J1zZEcwugC/lbkLBf7SQWLjxoUxX8
	 Zob4/hHMtXRKdVHuJOonW4I/Lod7nlgAYFzlsaLctH+Gp4PJAGr7ViaJyQGkx+Bq9Ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MpEcraxy9Q/+qqrBNS3dySP9r7Q89RzTEEKEaNrMPJU=;
	b=2AQgO6j7SvE9j9XeJhnSIs0eC8DIuTuHUbCEqzqjidOgvqx35TTX9Eusg13SbnzzsqEu
	 VGrvnOhUk87igUTFQyrnATOAawL9jWOJA5kBl40QFrG3FlEzHxujnaK7V09gxHAN88OFW
	 AsWoPt1RIpVZYSOFgvEokmXmAee0vxO0g8HA0Vc5C8iJMX3hNMyGwBxZcApE1k8kpxgff
	 0fvh62drNVI2bRgPMwLmxiQG6oEUawQguoDy4wRIo758VpF544NpzFDKm5M2v1lCENk/7
	 b504+CMaMrMRXh4meOEGUhGH8kfsAXgUqc5lS8kUKg942XZl0SfG17APxmBqpm0EZ2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N3Kx5i5S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAEA606D825
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDAEA606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N3Kx5i5S
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bcb6faf862so4234644e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:21:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793730090; cv=none;
        d=google.com; s=arc-20260327;
        b=sbaxHd51o/ZGGfl1CwXSBJwCinYfFB3H6EtXcJJaA1HDrTqybb5SyeZYNJyOjYajaH
         hKmvL0MAKxx55ZwDDWyNwd9SB9hnupzs/u64OdU3aYGU4fPA7/iWT3+K3UMigYif3AJx
         DtjO/Fo5EIfxLeou7c0i4MGfrEvRYPYfwIzvxZk+1GhIs44bqrLqcnDBdJb4orgWLodf
         Swi8kk8vEsSf/Jc3ittgm9xUNBNQNZ4UGhCTkSYIBPuch2CtywV+TDJXxTpnPBO5AiIe
         Ro9idiNINORcFo7rEVeYuKqLx7zlXzA5ktBzQjGC1cxhjbvI8dp2LaXu/8L9izLzkM6l
         CQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MpEcraxy9Q/+qqrBNS3dySP9r7Q89RzTEEKEaNrMPJU=;
        fh=GhD2Po4Wk//IWGNm+VneUaBLTNk2PZrCw1XvIehIvHo=;
        b=guEwt/sowwRKqq+tqQOvhfbZCApQ4NiBVN0hiUErkacH58AkQdwSQZkCfJ07xb2Hw1
         ZpyrraCstlDN2xWXF+SYcSKtdualSMbNWRA7TvxDojZ+djDcsZyNrKAEMiv7QxqkoBWA
         OtYq6EgZ4p1k5aaAPafkJfsK7q/Qz19ybqGDoLMbLP4Zb17puqNE7jgLHF5CqlFV/FES
         hR+H/afFTlj+/QoPjjraVOIK3/y1Nyk00JTrU2BLrAUN5pCFhFgTqu9ukleFujtQx6ND
         sO8dUL5ry5Da9kMuBBPMpjOgjPW6l4hkPY3qpHTJmj0xNlKHy2cnIajvOcNv/T/wnhTw
         blhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730090; x=1794334890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MpEcraxy9Q/+qqrBNS3dySP9r7Q89RzTEEKEaNrMPJU=;
        b=N3Kx5i5SxWJmRmO5L4VIpo7GfufoeIsNHQ0sJXxNueKhgtMlQuazS3CuWXewwCZksH
         mCcTKM2Ee9rxR46xzzEyno8SMc+s67Gy0DQ5uVaCK+lXISPm+yb///kOaXJQsfUkIUkp
         zLQEOnayBWqWkvrCbRvsyPhKexjGEMNutaI5M8jVAtL6Mjww22nJgUm6dMfiNK9XCCVh
         4zITjtPPZqFlB9qH6W0zBKrEmRjG8LQqN6KvRG1Zs8MSGudUErYQfPZ3Bn6c5UNBd21j
         o3gQ/xOMenzCZGuGxaM3ugKM+Z2iXh+mS1obqPv6hNwYoQ/5ZZQyUKCm26sBQK/4BnrV
         w4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730090; x=1794334890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MpEcraxy9Q/+qqrBNS3dySP9r7Q89RzTEEKEaNrMPJU=;
        b=TKC7ie04nWftHPPTWh7xxRwK51sDwdL/tSFInwv+WWW1DhUHhinl+azHo/u4P29eMc
         p+6Y5acNcHBns76uvsCniUotfYMW6BvAzrYzGOXxnE5yWACd7/Su8+eHie7XM3J3kH4o
         eKcnltaPA6yllwoGnvqNJ7wuH766BiKojBBnj8q3U6AcejANclBTwPMbPUKpD0h0PLq9
         q8GyfbN7hyN5qGPa57scdY7s5uuV8cXW5I3/FzOyH6Hvoem/6TDiqeU5aeqPmlRhpOww
         CAHUYS+Ifmi21OwjrgX7tJt0U3h1StnsModzU1mXlDo4XOBRlt2eGhpGA7uygk3Pf57/
         ZBoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbp5N7CoOMrZBuVLuQ8wjdFslCpAD1oLLKWihFQmU4VDStbuj5eFmyMz3IEGXQ9P5T1QEMs6r1/GJ2ffI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CTEfkTvdVVWIvmEl5IeWRO4gKuYQWlcEwUVqfQM6h7bipZI+S
	13lmnRHjpxH4OcIbOCWDStzzzlade3pz7huveqfl9rZn1ateuRsFIY8zra3k5eO6suzuvyih30P
	k6Tgco11TgjYuAfqGBdR6saeiJcs9Y4g=
X-Gm-Gg: AYBFou1aglNsuSa3/pEORgKQeP6GdLA655zN9BugGJBa6wdBrJZE06txEnbUk3jOEje
	mpVicXbmbk62R0eIbdzAa+c9wrGZVnAKrmvLC+VtbrAwjan20ij91U+3WAR2C2O/kcta475CcWv
	kn7TbvRXv0f0zLp3RVp085euk2NeuDLIR1MThuGm9bpm8NABBnltqLgWxJU9abAeL2sa5ZzfeAf
	YGL4JhaxfpCTHViIv1UiRSelgxd85gPPA9I/qUSlEdn+lG5QNTKLuLXs03jVbxxIxD0kuZCKRhA
	s6neTRFqRo4igYPIx9e0WGB3MGCc3UsFW//4w4XsH4XsRQetnfrBk5DPL3TPPpI+GEx8yuIn8OJ
	MIwYPQ9RoOQbMlmtFimzlJGu3ZUdivJzT/VWlzEZ7I62mhoclbUKsHGc=
X-Received: by 2002:a05:6512:15a7:b0:5bf:a7d2:e8a0 with SMTP id
 2adb3069b0e04-5bfd956a316mr4721107e87.24.1793730089789; Tue, 03 Nov 2026
 10:21:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013201538.43156-1-rishik.yechuri.code@gmail.com> <2026101402-spotter-stitch-056b@gregkh>
In-Reply-To: <2026101402-spotter-stitch-056b@gregkh>
From: Rishik <rishik.yechuri.code@gmail.com>
Date: Tue, 3 Nov 2026 12:21:18 -0600
X-Gm-Features: AclHuK-WvTHT1ZlqTF2qAihAoEI62WDFaQZ_G19gGgQx45WPEFF393UzPQZsYo8
Message-ID: <CAL4M7k4kABFmDrReZ0dnuYHiEb0Jn2N=iutncNJ4X-S=HPAYXw@mail.gmail.com>
Subject: Re: [PATCH 00/10] staging: rtl8723bs: replace private 802.11 header
 macros with generic helpers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rishik Yechuri <epicrishik@gmail.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I forgot to add the assisted-by tag to the series. I wrote the series
with some help from claude. Should I resend the series with updated
tags?


On Wed, Oct 14, 2026 at 10:45=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 13, 2026 at 03:15:28PM -0500, Rishik Yechuri wrote:
> > The rtl8723bs driver has its own set of macros and inline functions in
> > wifi.h for working with 802.11 frame headers. They access the header
> > through hardcoded byte offsets and pointer casts, and they duplicate
> > struct ieee80211_hdr and the helpers in <linux/ieee80211.h> that
> > mac80211, cfg80211 and other wireless drivers already use.
> >
> > This series switches the driver over to the generic versions and
> > deletes the private ones from wifi.h. Each patch converts one group of
> > macros and removes their definitions once nothing uses them anymore,
> > so the driver builds after every patch.
> >
> >   Patches 1 to 3 convert header address access and the Frame Control
> >   flag checks and updates.
> >
> >   Patches 4 and 5 convert the frame type and subtype checks. Single
> >   comparisons use the ieee80211_is_*() helpers, and switch statements
> >   mask frame_control with IEEE80211_FCTL_* and use IEEE80211_STYPE_*
> >   case labels, the same way mac80211 does.
> >
> >   Patch 6 removes an unused struct member. Its initialisers were the
> >   last users of a few private subtype constants that have no generic
> >   equivalent.
> >
> >   Patch 7 converts the frame subtype setter and removes the private
> >   WIFI_* frame type enum.
> >
> >   Patches 8 and 9 convert the Sequence Control, Duration/ID and QoS
> >   Control fields.
> >
> >   Patch 10 replaces the driver's destination and source address
> >   helpers with ieee80211_get_DA() and ieee80211_get_SA().
> >
> > None of this should change behaviour. In the few places where a
> > generic helper checks more than the code it replaces, or where the old
> > macro kept bits that a plain assignment would overwrite, the commit
> > message explains why the result is the same.
> >
> > Compile tested with W=3D1 after each patch, and checked with checkpatch
> > and smatch. I don't have a device with this chip, so it has not been
> > tested on hardware.
>
> Did you forget the assisted-by tag for this series or did you really do
> this "by hand"?
>
> thanks,
>
> greg k-h
