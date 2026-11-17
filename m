Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794930969;
	b=BAucxovJf9jHt9W3ZgtKy8JFv1OaYtkua+KWCGM74k0JiokmLuTVgokG6AGib79bQW/L
	 LLIw+s3gygLjFlqhJ/bp3QokO0jkqPukdmH2uF1pU6QmSs2iUu7nFBwvdYG64Cyzsht1e
	 AoefUS9lO2E17chnV/HdAXRAfwPrUS8PN9pyH3SBPUPlHCS1x4M10Q3vEdMOGBJVb6eNa
	 l9tn/5QBM15kXMAV2BNGi5Aqof/8p7yGX+h9/tVQIWkkjMRAfIBfWke05kJieOYrQiwv1
	 RKOTdB1BzdgGzYvp40jKHBNGEck//GyTbjG7yEKogWPr4NrDjFb6Ovb2ndKqRMaqEew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TBvSlqcah1Nv0XCMM1HHM4bATdZSzarA4Ja8t39qtOM=;
	b=OCkrKaVnGFiSu9fpbBJCsjqHvAHf196JMpMBuZkXrb+LogMcxKLDAeWkiRu9LpxWIhME
	 rxtmqBQ7NoVVti3g+jbJtL8WMPIuknM7p2akAyyKZVKIextPYbuwOx9SKQ7PdEyqK3KHg
	 1UFJ2Sy/Efc4U6nhiRh5x8Kq7RQzmPzgOP2cTjg8i+F6s4VdGq2owDBImlSo8/39SrXNb
	 35EsYJcqI0RZJuUOJQuReFfcNXaWwF2rk5AnhpYjkEJx39hRyNkebCk49aYgxxrnH50SR
	 RGyidcFoMbr9Q/1ZNiookvEpBXMg6RbUB2HjpRF2COdCnmYmg66IJdqeZ9nW4PwM/ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2IzWg7B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D44606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6D44606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2IzWg7B
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so6802932a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:56:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794930967; cv=none;
        d=google.com; s=arc-20260327;
        b=iqAoTwh51iTpt508M2vAudCYE4s30xRqekt/mlJv2ve+TKyfV3H/NMvfadTztDUvJr
         i/PHL7fRAxW9V1VYN5aZN/qjLmJ45CIrq8OmrCrV3cro2zKFM/AUcx8jXHiNnTLT4KC3
         EpdQj4mA8ORNMfzKbsVbnGA1SdtZpdIP9S4oPpn3rIuROrIlOsIB6GrFXxBB0ACryI8+
         /1WNl1uXje+KjbB5wKWeZkZ6vdAm5WT3lIlq39K2gnk5cV8RFq6SexOIshIhxna1bbb2
         RSwCanSYiDuieo7K/gHUuaHYO1WcYnIWJJE/SgsbgK1+tjDmQEUt250pJque7lTJASxK
         PCGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TBvSlqcah1Nv0XCMM1HHM4bATdZSzarA4Ja8t39qtOM=;
        fh=00b/NVt4EYS3naGhD/fiPzSgMMdJKDklpcu3k1X3Tqg=;
        b=e70W++vUAzShujEAXgLSzvj0YiEEHy71b2KUHtoDFOY8rRQDyZh2eMG/fdrOTBBkU5
         7r+rN0SvOQAZaX+77fU1zPw/drZYspB6uI7v0pWTvMYmkmvR7M7OhPBeFs9pn+SxBV/Q
         ki6wAHCOJjVWzbYKgOi1KRzlK2nMU77vU30tJW6P/1UX7HANR1BAznBbmkiiwjgD5upT
         3ZNdD6yd7CKUY56qyjHI8xssAuqK24FSGql5TaGk0tZ8dXnrOSz2ClybJqQ/CvWO4Idu
         /9cikc4W4qFcg1jwgab2TEePJrorFAtE0I/w4vfrjr7WVg34MWljP4ftODhYGYWW8w/D
         nExg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794930967; x=1795535767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TBvSlqcah1Nv0XCMM1HHM4bATdZSzarA4Ja8t39qtOM=;
        b=o2IzWg7BzXnSmALOLRwk3h0Gg76tfT7on6R+S3g5tzbj8ELJ3rQg373YwqmgDjvBXD
         geqMauUB5OSm4lkv6tUhYQhRN7yZX7Iql1cAiihf3EwoK7507esxi//imuUZcCYCNO0z
         Gc6Eq4djPh0ycjapIlylED0fRrGN6vlGJDp8JD5zoYOqDH17YaeBJ++qiEw3oKle1G8a
         d9NmQnCz9c7Qf8HyK7M5sxTweyZO12g4Op4uafirMuirjE6HVjzWvCfuDWAhHwSs2T++
         lhEi26+rAzDx3Kbsh517ooG6tvsMOQxV13kXV4xGS4G7Eaidr2EZqldoFkdJ5H2WsPUM
         988Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930967; x=1795535767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBvSlqcah1Nv0XCMM1HHM4bATdZSzarA4Ja8t39qtOM=;
        b=b6f+PNJmMGTcINFrZEH0TeB7IS1o7oIWHO1ja7CZchv+biCNxemOUNbfrtR3S43PzA
         B/aG7LVu02f8vWjmToAukulgIAKdxFHp0nApIiwnnDE9ggVdYvC4YNa4qvfe/GxRP25z
         nehNBYAQzPzuP0hiee7GyJtDFjjhny5ewi+Uwha9Q2jgAmNu8An7Q0yAmPuLfQPAjoAB
         9nc0Ivb4sHOWUA22l1U9SkvQO1BdF+s5Bw99koCZ0Iqm6krST+rgYPpGXUMSjSmh8Srg
         aaRF/gKlYXO9V/KNGeRyY/ZwSm7SiArqzBpDRXKTy6OeM1ALMbuzrcBL4Lo8KL5k7U5Y
         v3Ew==
X-Forwarded-Encrypted: i=1; AL+hErE3sdw+UsIDKVpBtn9AFA17YHCsj6/V+eraBPhF4aM6OVHvQogmpmK1VwNfqqSO675iDq8TSGgna1VUEIU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ci7bJmi/M8aQ91x5qXo0rf5kwWAyvLHHJfIX0Xo3LcwUc8f1Y
	XL7/JtpqHIzFOABKKYRizJ2qtp19fHgVXz7BqWP1jRFtV62nuAppROgwyZcSeQdgoeTDS2tXN8w
	qS3N1QiZ1TMHafN8EcVyGi2ZxqcvPmt0=
X-Gm-Gg: AYBFou208WJDfQHmoZwN3sMtEG3tkeOeQoaTXsrIkjJQAVq7YVufVnu/JMrEnhmiXyM
	4/4v9CQBDzOFniKirPaP821MkDKvW+rjxSOTLyWc11T8t2Y12pvS7FFLwyiHZvXi+VktsdpP4BK
	nJ2mdEb/BuDVdNVhs1RddZ3NxscuwD2JwTgSAJZywwzFuB6Zbnt1Y4XWZyNfnI46aosb+qEnKh3
	Ms7xsFOLpb5kljEUHdvpMs4pz/xQ/bydJImWKlnaNK01PBrX/nnu/n60hQK560vTuCZr6y7mylG
	cXerZHBDIntodTUNjbxU1Q86KRLVu5E1sT9vTrrZDtKChnIiWAJHKR43M+/xRaIftQvGzGmFQWt
	eNHtKzs3AeMXjQVRzTbuTvT9IZCB8D+KCVsPRXlV7s6gUZJ5CiLkO39N21U1zHydxWKcHj+wmTX
	L0vtClJIFjDMi+WWAmyT5z5ZqaLbkex377O3q/yJ0/NkwpGzMFJAoXbdgrNqbdO+a3+nRNxJfeP
	ZUhLaj71J3lfPatFWVub57TDXbvSoom9aeAq2Uh9Cv+IoxTvy0=
X-Received: by 2002:a05:6402:191:b0:6b4:203:a1a1 with SMTP id
 4fb4d7f45d1cf-6b7c0bc3606mr8801687a12.25.1794930966800; Tue, 17 Nov 2026
 07:56:06 -0800 (PST)
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
 <b84021aa-f843-4668-8172-0afcbb97c27f@lunn.ch> <avtHbulALsI61uVr@pengutronix.de>
 <CADvTj4ocz9_rMDbDG1xOPALNw1yx9ypXp0S59sh04wSv_YMyrg@mail.gmail.com> <avwPa1MTMjf53lWN@pengutronix.de>
In-Reply-To: <avwPa1MTMjf53lWN@pengutronix.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 08:55:50 -0700
X-Gm-Features: AclHuK8qG37XEcbg14a3PfNYWvevsV6OWpW3NnnFEnzwuN5zMG3zNjx8OCYGh2s
Message-ID: <CADvTj4q8Yxi3SyS+Uiue1SwwujFcAABTD3+2BsdSwS3fs89wnw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/3] ethtool: add a PHY receive byte total
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 1:25=E2=80=AFAM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:
>
> On Mon, Nov 16, 2026 at 02:20:50PM -0700, James Hilliard wrote:
> > On Mon, Nov 16, 2026 at 11:12=E2=80=AFAM Oleksij Rempel <o.rempel@pengu=
tronix.de> wrote:
> > >
> > > On Mon, Nov 16, 2026 at 02:14:38PM +0100, Andrew Lunn wrote:
> > > > > > Think about it.
> > > > > >
> > > > > > If you don't have a MAC, you don't have FCS.
> > > > >
> > > > > There are existing mainline PHY drivers exposing this functionali=
ty.
> > > > > The QCA807x/QCA808x drivers use qcom_phy_counter_config() to enab=
le
> > > > > CRC checking, and qcom_phy_get_stats() reports the RX CRC-error c=
ount
> > > > > through ethtool_phy_stats.rx_errors [0]. The IP101G driver also e=
xposes
> > > > > a phy_crc_errors counter separately from phy_symbol_errors [1].
> > > > >
> > > > > This demonstrates frame-aware diagnostic functionality within the=
se
> > > > > PHYs, rather than something every PHY necessarily implements.
> > > > >
> > > > > The generic byte counter need not require that functionality. My
> > > > > question was whether rx_bytes should count received bytes without
> > > > > conditioning the count on FCS validity. ACx00 could then report i=
ts
> > > > > hardware byte total through that field, including bytes from fram=
es
> > > > > which its separate CRC checker identifies as bad.
> > > >
> > > > Read 802.3. What does an 802.3 defined PHY actually allow. That is
> > > > ideally what the kernel should support with these counters. Lowest
> > > > common denominator.
> > > >
> > > > So i would say RX bytes does not differentiate between the frames t=
he
> > > > MAC will later throw away because the FCS is wrong. I would say it =
is
> > > > also O.K. to include the preamble, and the FCS, any padding up to 6=
4
> > > > byte frames, etc.
> > > >
> > > > Since this counter is not actually defined by 802.3, i would also
> > > > allow some flexibility in its meaning. Different PHYs might have
> > > > slightly different meanings.
> > > >
> > > > Look at it from the other direction. What is your use case? Does th=
e
> > > > exact definition actually matter? Does it matter if a different
> > > > vendors PHY counts it differently? Does your use case require cross
> > > > device compatibility?
> > > >
> > > > You have not actually said what your use case is. For new board
> > > > bringup, debugging broken networking, the exact definition generall=
y
> > > > does not matter. The PHY RX counter is going up, the MAC is not,
> > > > something between the MAC and the PHY. Neither the MAC nor the PHY
> > > > counters are going up, something between the RJ45 and the PHY. The
> > > > absolute values don't matter, its that they change which matters. B=
ut
> > > > maybe your use case is different?
> > >
> > > I agree that for bring-up the deltas are enough.
> > >
> > > In the field the question is usually: is the board broken, or somethi=
ng
> > > outside of it? The MAC counts FCS errors both when the line is noisy =
and
> > > when the xMII corrupts frames. The PHY is the natural place to tell t=
he
> > > two apart, but only if we know whether its error counter checked the
> > > FCS. Without that, the wrong part gets replaced.
> >
> > For ACx00, rx_errors specifically reports Ethernet FCS failures, not
> > symbol errors. We verified that with PHY loopback and MAC FCS insertion
> > disabled: a software-generated valid FCS did not increment the PHY
> > CRC-error counter, while flipping an FCS bit did.
> >
> > That establishes what this particular counter detects. It does not
> > distinguish corruption on the link from a peer transmitting an invalid
> > FCS, but comparing PHY and MAC observations could help locate where
> > the frame became invalid.
> >
> > > I have seen a board where MAC and PHY both provided the xMII clock.
> > > Frames were lost only when the clocks drifted into a bad phase, so
> > > production tests did not catch it. A PHY that checks the FCS would sh=
ow
> > > a clean PHY side, while the MAC counts FCS errors from time to time.
> > >
> > > So the meaning has to be known, even if it differs between PHYs. I am
> > > fine with that, as long as rx_packets and rx_bytes describe the same
> > > frames and the driver says what they include, for example which error=
ed
> > > frames are counted and whether rx_errors counts CRC or symbol errors.
> > > That is the metadata I suggested in the v6 thread. The ACx00 byte tot=
al
> > > also counts frames with a bad CRC, while its rx_packets does not, so =
it
> > > does not fit rx_bytes.
> >
> > In the original v1/v2 implementation, rx_packets and rx_bytes both
> > reported the inclusive hardware totals, including CRC-bad frames [0].
> > They described the same traffic, with CRC errors reported separately.
> >
> > The packet count was later changed to subtract CRC errors to match
> > the existing "Total successfully received frames" definition. That
> > introduced the mismatch: the hardware does not separately count bytes
> > in CRC-bad frames, so the equivalent subtraction is unavailable for
> > rx_bytes.
> >
> > Should we revisit the original approach, with both rx_packets and
> > rx_bytes reporting inclusive totals and rx_errors reporting CRC
> > failures separately?
>
> Before we decide that, I have one question about your test setup. In
> your mail [0] you wrote that the MAC drops the 63-byte bad-FCS frames
> without creating a descriptor, even with error and runt forwarding
> enabled, and that MAC-internal loopback shows the same. Which MAC is
> this, and does it count the frames it drops in hardware? If it does, I
> would expect the numbers in the ethtool rmon group (etherStatsFragments
> for bad-FCS runts, etherStatsUndersizePkts for valid-FCS runts, per RFC
> 2819) or in ethtool -S.

This is Allwinner H616 EMAC1, using dwmac-sun8i/stmmac, connected to an
AC200 PHY over RMII. The driver reports no MAC management counters.
The CRC and length-error statistics in ethtool -S are software counters
updated from RX descriptor status, not independent hardware counters.

I also checked the MAC register aperture before and after controlled
traffic, including CRC-error traffic, and sampled registers during
reception and descriptor starvation. I did not identify an additional
packet, byte or error counter. That does not rule out undocumented
counters, but we currently have no MAC counter that accounts for these
descriptor-less drops.

> The answer tells us whether a PHY/MAC comparison can account for these
> frames. As you noted, a difference between PHY and MAC counts alone does
> not indicate a fault. But if the MAC does not count these drops, nothing
> tells a user whether the difference is such a drop or real loss between
> PHY and MAC. The same holds for your valid-FCS runts and length-error
> frames. The PHY counts them without an error, and the MAC discards them
> or reports a length error.

The exposed counters cannot make that distinction on this MAC. The
controlled tests identify the missing frames because their contents and
counts are known; a PHY/MAC counter difference in ordinary traffic does
not provide that information.

The tested length-field mismatches did produce descriptors and increment
rx_length_errors. The accounting gap is specifically for frames discarded
before an RX descriptor is returned, including those bad-FCS runts.

> Could you hold off on v7 until we have this answer?
>
> [0]
> https://lore.kernel.org/r/CADvTj4qMgKrRZ_uq3K4t2+w_3eai4dwuCPod_vhEKEOsO8=
5_Wg@mail.gmail.com/
>
> Oleksij
