Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794863382;
	b=CxhjUec3YPW94CjgjCH52nKB0pbyzdxDPMEUjY5ew5dlAfRwFfZ9Y5KSukdAR9fq4mkN
	 KH+7YtcekWLldYFenjjx4ipq5R2LAiyo4KYXevYcWeTmpmAPvELspE0QdARKZ2UAZrNlq
	 8x7hxuQuUwNlXwlrtnHLaGnXl9VE7Dy8AQ0p5AavCcYkOpvmh0iOKaG3KEn+IPGZJgy9B
	 lbbZDBSI0PzSHaZo4d7IH24NmlbJ2vp8j6VueC1wegLO4Cw/DMVh6XZyr5Ygoi70uJ0gq
	 37XLZzA4GFGIzenfJREoav+AVhrtCKKHnS7pzmW+cIicGMHP7WFAyREH//def2K3qMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xbC0YXJeV6+UIPjOKzwg108UL1tvIUSPybpQIgpSgE0=;
	b=VND+u2N6j9Ty+Tk+XwFrjY7M42FrpUD+EPv96+//6Fsum/cKpApiRi+jp9+D1a9JicqC
	 AzapmXUpkPrsox3EEiaEyw4fC7mlGx+JCIs203TothKn5uklVpSzkPsa9Qgasdi6P9G9p
	 R4/IfLns6/oGvVVTX0humegbp5PJTJXluSV4Xjn2iqWGlMNhVc90VxhY6YhfHOEIIOnEC
	 6/eQX0mKFZ/8DvjyJ6QbxnTDGvK6r16mVubmZYnAGPQr6S4hnr9sICuguYEdo9zXJZ4mA
	 xErre9u9pv4+ZXgJ36XIpATJLeRxtRIGof304zcY+JOjnoVaOchEOhyjChkbO8dnQPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rL4/+C5/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F803606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F803606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rL4/+C5/
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5ecd9a400cbso3610698e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:09:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794863381; cv=none;
        d=google.com; s=arc-20260327;
        b=ILKkdRNZISwPFLSZIMPIPJ+K5ii8JSRio5b+D0m1uriPmO+vYGytMTOGchINFObsHk
         ys+nU6mOvb+Pid6AjHLeAK+RiD6rW677kNVRg5YT4VfUf7LadSKZvSEVA2RP3JGKITUU
         TZNSJPMiwYU9MOVlaNkvXpBUATdjLwdv8ytDT/hmG18sk2vh4x5HHRyAnMu3B38ZCO1I
         khLI+reIrXVltIsxP/OEncJP1Z1Gkl+VR32Lrh8uImKWHmoQ1wmRtdjoRabDm34TgAHG
         WGQdrsn6Nhn7BdNOCN8o5Pafnhv18LnO2ppQJN3XsbV+hPUrRQGbpkFbZQ01aNrB7vZw
         gVZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xbC0YXJeV6+UIPjOKzwg108UL1tvIUSPybpQIgpSgE0=;
        fh=5wnTcbxEONyctI1s+2Zx69XZ+lSZNw8mwEe8/EOfISM=;
        b=hQ4sKL0hm0BBAeUpzuWqwUXvli8K3SNwUEg5fQ7bYhxh8DkIt8wwAO5aB+5Ky8TmWI
         YREQudvGxmhiN7EAoG5s93urB6ivtsiEK0Q8mMTNUo+kidwRZlQMNvCgAtqG2s1I1vRs
         ESfeJztEReIlvk13qWUeWytVRfJCU8zaEUE3id/+xDWYzvhNqVOLaObO2tPyGTYoVuaQ
         278p8VCK3bnZGJyd1NB4zFDHr+H6Bqc4Slzuj0iHWLRFfu2wZy+KSnbWQEpCqqvhJOGx
         I9Zpubkq/gkTlXORF8oamcZ+bYZu54Kz8wMQS+zcfu29ixQwXuiv9cnfIbG0Jv46RcQe
         vWVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794863381; x=1795468181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xbC0YXJeV6+UIPjOKzwg108UL1tvIUSPybpQIgpSgE0=;
        b=rL4/+C5/mHNlyuAP/2smxQPn5aM4Is8Ha2rYS7F5QWHpJrhZo/a43OYQ2pd5l/Y0Jx
         pLLG/1X8tcjuUiHOhA4i9kWJ0IwR1gWVcMSxXNRVlNJGCzXuiIqi6YwhCYSzg1qTwK8B
         TI3QljCV/yU32/F8TjMIhOVXdg4NPKCoF7q9wj8+QVqqbNiWfcUDCd8eBxoVT+vIpQtI
         aCrA5gRi76p4VSPLTB5VndE3cdHc/8ef5zJeAYgsf9Kb3b4BKdG+e+EDS+VgKipaBrus
         qp2cQ6m2kJ7R1Mhsn0wfOrXVi11e68EZQpWQQO5iXZQLyhW78n2Oypu5ms++WsY4m0ei
         kPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863381; x=1795468181;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbC0YXJeV6+UIPjOKzwg108UL1tvIUSPybpQIgpSgE0=;
        b=c9d0XITGXV23gwQi/gzzz+K0MVGZJJS1brdP5P1AxTf4tidJvZPbob44ZW+tzIWfeP
         jegGRSOArIVFxI49DgoGgSqlaWce/n7wuaxUmxzTg9zcHnPXqE1JQPLzctapyJ2KFvJp
         ZWx/VpmLiUTHoY/F4vT7kpd11liPYVhWbNvlrx3VhHaoAGS8NRr2vLXdRlMHHtYVmqa9
         UK/5rpJxBzIkiF8je1U8iih2cJaTMXYoe9wE0vB+pb4xwd7/fM8kzHH6vdBn/XrdkEgt
         xKflFK2BOk0vo/2VpPR1FgPsQsgbUEj1HcpK9pblH1hwc6cWFZG4nW08bUIRJhb1yryY
         euGg==
X-Forwarded-Encrypted: i=1; AL+hErHf4X+M1kE59j7uYZ12rdbe8b5eNOhZsji3NvfJuDGfsXi0Bu0ezPiJ9VGN2GdZcidaeIvtqqjI4VoO5TQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Pq6sALD4mOpX3hl9H7FjXK5zzVb9iICSrUhb6fnCVHbIaSyP5
	tf5M/68sKEn/kHt7Zo+D522hDkrSoOmZ8kSnrLSZ4Inm0wwXyQuCoEzSXH/BUUx+YazfYceNey6
	wwZMZFvdhWTJeSLUjhRtd5k056AiDtYU=
X-Gm-Gg: AYBFou1oZKdPytek5z3p+ycuYZPFT4l8vOVqlCeseGtulmuQM721+9EA8igrO1kOspS
	N+hzWO11eiHR1Taav9KRRULJBlPb/M4USBitmGxIZk1Rbvhn66ssw+sEJvem2XkUmHN0rhFkQOM
	C5XPdWZxvXibrIIl4ukSNztDAKHriHLwfFEO6yLb4wl0LprLMpuT06P2w5Xgb3eKu7MfomLuxu9
	wgq3HY+03NNbh9QqcOTqPCjrJtmVKHuusanP9pKwUUynde2guNfGIsjDWcdImRAjMlfjxT6EH+2
	wA1HfKYKmIivk07GmF8KBPGv+dvP/nAU84GHLCKKpX1DMKsVHjU8y+LIVsCYJDKyh8qlWeJS2RH
	aaXeyLpoQ8QY6m2WX2hUkkbdpo3k1LWYbf7ZvHT8aaRQag5ECKOP/vNVEmBeKZDcPRu+2fCX30+
	1m6KASVsG+/e0zl+obcrEWoDPK33kHwJzPBlmLTZLjcYkaaVGqbQpfqlwmvEEQo/nh6/KZhFxfQ
	WNB0R2/XMY8szKbET5WmKqaRMr0/w==
X-Received: by 2002:a05:6122:793:b0:5ea:b972:1403 with SMTP id
 71dfb90a1353d-5ee346766a6mr4625862e0c.3.1794863381379; Mon, 16 Nov 2026
 13:09:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
 <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com>
 <37e4b9b8-d381-448f-a2b3-b92d7bd9033d@lunn.ch> <CADvTj4qh8Pvss+xEwcjshodwv-yN6haP-9aaeRXg1ydSu5ibVg@mail.gmail.com>
 <d3f2dc1c-9daf-4b5f-903b-657ae3f32647@lunn.ch> <CADvTj4opiu_vhat12BRzk61b7ymG+g12c2aoK+rcZHjpWZjL4Q@mail.gmail.com>
 <b84021aa-f843-4668-8172-0afcbb97c27f@lunn.ch>
In-Reply-To: <b84021aa-f843-4668-8172-0afcbb97c27f@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 14:09:30 -0700
X-Gm-Features: Aa3M54q_Tii21W65owc4nMI0TRPC095pgsqSNf31IEYTxCFkefhvfgxKPUvxAKA
Message-ID: <CADvTj4oGZ1hwBqrcXp9-M4zhoG=QbVWuyqNV=1xogqL-pJ4Kbg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/3] ethtool: add a PHY receive byte total
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 6:14=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > Think about it.
> > >
> > > If you don't have a MAC, you don't have FCS.
> >
> > There are existing mainline PHY drivers exposing this functionality.
> > The QCA807x/QCA808x drivers use qcom_phy_counter_config() to enable
> > CRC checking, and qcom_phy_get_stats() reports the RX CRC-error count
> > through ethtool_phy_stats.rx_errors [0]. The IP101G driver also exposes
> > a phy_crc_errors counter separately from phy_symbol_errors [1].
> >
> > This demonstrates frame-aware diagnostic functionality within these
> > PHYs, rather than something every PHY necessarily implements.
> >
> > The generic byte counter need not require that functionality. My
> > question was whether rx_bytes should count received bytes without
> > conditioning the count on FCS validity. ACx00 could then report its
> > hardware byte total through that field, including bytes from frames
> > which its separate CRC checker identifies as bad.
>
> Read 802.3. What does an 802.3 defined PHY actually allow. That is
> ideally what the kernel should support with these counters. Lowest
> common denominator.

FCS validation is part of the MAC functionality defined by 802.3.
Counting received bytes at the PHY need not depend on that validation.
The PHY CRC counters I mentioned are additional hardware diagnostics,
not functionality that every PHY must implement.

The original statistics interface also distinguishes the IEEE-defined
eth-phy statistics from the additional phydev counters [0]. For
rx_bytes, the common meaning can be received-byte activity without
requiring the PHY to determine whether the MAC will accept the frame.

> So i would say RX bytes does not differentiate between the frames the
> MAC will later throw away because the FCS is wrong. I would say it is
> also O.K. to include the preamble, and the FCS, any padding up to 64
> byte frames, etc.

That matches the ACx00 byte counter: it includes the Ethernet header,
padding and FCS, including bytes from frames with an invalid FCS. It
excludes the preamble and SFD.

The separate counter was prompted by the existing kernel-doc wording,
"Total successfully received bytes", rather than an IEEE requirement
or a need for successful-only byte accounting.

> Since this counter is not actually defined by 802.3, i would also
> allow some flexibility in its meaning. Different PHYs might have
> slightly different meanings.

For this use case, documenting those differences is sufficient. I
don't need identical byte boundaries across vendors, and whether a
counter includes the preamble does not change its diagnostic value.

> Look at it from the other direction. What is your use case? Does the
> exact definition actually matter? Does it matter if a different
> vendors PHY counts it differently? Does your use case require cross
> device compatibility?

The use case is the board bring-up and networking diagnosis you
describe: exposing the counters already available in the PHY to help
locate where traffic is being lost. It is the same PHY/MAC comparison
described in the diagnostics work accompanying this interface [1].

For example, in our tests the PHY byte and CRC-error counters advanced
for traffic that the MAC discarded before DMA. That distinguishes
traffic reaching the PHY but being rejected downstream from traffic
not reaching the PHY at all.

A common interface is useful for inspecting that activity across
devices, but exact cross-device byte totals are not required. The
important point here is that received traffic remains visible even
when the MAC subsequently rejects it.

[0] https://lore.kernel.org/r/20240829174342.3255168-3-kuba@kernel.org/
[1] https://lore.kernel.org/r/20241221081530.3003900-5-o.rempel@pengutronix=
.de/

> You have not actually said what your use case is. For new board
> bringup, debugging broken networking, the exact definition generally
> does not matter. The PHY RX counter is going up, the MAC is not,
> something between the MAC and the PHY. Neither the MAC nor the PHY
> counters are going up, something between the RJ45 and the PHY. The
> absolute values don't matter, its that they change which matters. But
> maybe your use case is different?
>
>                Andrew
>
>
>
