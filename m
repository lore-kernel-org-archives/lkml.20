Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395802;
	b=JWPYKDE3ol3RdZriNoVb9jZ+0LNondNiLZmPhJStNC04fk3LnlGiaL+lo0HRZUcwRySC
	 DY0k//bdrHk/y0cC1xxvb8S4FSW6cUaPhEW75AO4FG5fYaqpVs651BG5nSlr7J2cjB1kA
	 M2NEn3TypFpFqB0hZJNmpD2a2u8VQ97Pvl1sqPxQ0mSi2rwGGCWbfYij7+iDOixIds0cR
	 3bSx1ZMZXlFEASyvmj/uC6CXVBONX77AAPNntLlfyTnCtE/Hhrq7Dn3f07kZ+ABoEg4c9
	 foVT112HMx47I6JTTWode/BpdO/OGjz+m4shi17ZxbMCNRSxzC1mSzpe8nEZrYREnGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395802;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yn5y2q3JJulnHdFFu2RjD/z39f48yWR7C6Zxb/M775M=;
	b=Zpe7o/TDFOWlOSrV8tENSioF/JB+9LJrxgMGr6DqyWOaGXo1UHNBPEfzZcu2ew0lxyiJ
	 YuWnk6UkTerDv4utSivOMXl4eFlFBjDiadKvr+sHr+HnxjwFkGpl10fa4TOc237Y1QgL0
	 vOlXL2ZjTrPzlqjrE2Zan3Mm9tovLIda57zXDhHju+GtgK4HlAnFEimnEagIO9ImskDPF
	 DsZw9G+E5w8rZE72zpn4ybksDxZwQIKVWNhURHSCWI/BIr3a2N7cwCjj2xtSR4/9jBia5
	 seC0XAkRrqTkOU7FlNPkrdO1pOChJblyQW5fBFvDrbtNNHoXzV/cKawZRBM4DMsNq4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4C0606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B4C0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-53dda625f63so1977977b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395800; x=1795000600;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yn5y2q3JJulnHdFFu2RjD/z39f48yWR7C6Zxb/M775M=;
        b=VZ2syeA/uhlhab6irjlqIMXOEfhdl0Ce8Q+eYZDZ7TF/LLN/KCR2UWV6HJNiorTlh8
         1iIZTzk1YMBHElqHPPm8RJxyqgPcX8AzpFtOeX+5SoekLUvbb3YLPpMkgUtxD8BnLxi7
         gpxxHYD4ddDZ2LTSzfV9dz0Ewq/kJ3mQqa754Brq+PUbOdtQvhXFYUIgadxHp73NOw8L
         poODu+GZ8XlCqKCLXXHBJF8ZMGqB/cTSNN440n6wFi515cgFBr2i7JJo/4zP6UP/cE/W
         76V50n9fi9o6sXplRatpt+1hcdvpYRh/Tnu2tP2La54pQXRKCsDwhvMy2ccd0XiC0NWz
         XZEg==
X-Forwarded-Encrypted: i=1; AL+hErGyJRtlAP5XmRfAtPGxATrpbAApp1/zO4hn92v5mDZxN93dmuCO9wdJzsIKdJcoPIir2XL1G7vte5u3iHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iEIo5YhssDEiyGLRfcDxNYzyM7fZLsXZuzljhTsbiTvHcAxmY
	cEr1cfzRXntrm/fEH/eRcYIEX+ZYpA/CxgjN+u4XHlma3qnAzft86gOTgnQSZW0nQEU=
X-Gm-Gg: AYBFou1tAf5HqdbONO8t7jHf++aqCohgbpSQUbw4G0PHqLBO+5wQmcqrNkodmo767et
	O01Dhn4do6D59pn1Ngn2XMScSaaNO+2G6xKV7IfGGQxtSZsYB4n0WWfjXxGSLQRnVsjX9cPOd4f
	23xUiw50JKOuaQbCV420o/5I5vKijYX/Dwt8zEAu6da9J2QyVHNi3Ni/9an3qi3HkPjSWC4yIRX
	KQ4HryQxQ84Ns55JMkWzDJlKNyRiIlv3aTuf2ho/Q4c39WUhRC7QAunvj5iNYtlzTrPGA3s307U
	S5EgC5rd+9elEena8LVjqG/3mEPb03SZFiilr5vbXHWsOnnUOrA6FvOVIqRWEXDKDaPTdcaz90C
	9FGTdhPVzRAf1hbXrEgNUmYjsuckXAKLip7a+3/aHZC5sMAwhd1I8PmpMFclT/nwoRplnXx+2n3
	y5ka9wmeuC2U6hrD4by//ts65jrxNt7dgeJlI0zSh243vta3QhIlC6xPwtAWcCn+s7kgMH0/SJG
	IG5dRrfND4ieDn6s+6m+tyuyDoV4qOTVPblsKumidqpvh7utkJgblSpLphj/GoLYIeCIDQZPHBB
	XPPo7632c5yeWj8GzfkPlkXB8wwfKAx34aInf/yUky1rRbkIX3hZGppToqyxD4oPs88=
X-Received: by 2002:a05:6808:118b:b0:4b5:5bfd:518f with SMTP id 5614622812f47-56b963a82demr1647104b6e.21.1794395800366;
        Wed, 11 Nov 2026 03:16:40 -0800 (PST)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com. [209.85.160.46])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56906330d56sm4832412b6e.15.2026.11.11.03.16.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 03:16:38 -0800 (PST)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-451a49abd8aso2915685fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:16:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEdhDdzeG9yKv1EhXzX6sc9hIskuzkslliXA172/Qg0L3B4mAEEjf5khSC4QuO+m7Cxxw0frTNlfBR+TA0=@vger.kernel.org
X-Received: by 2002:a05:6102:d8e:b0:7c8:1fd5:82b5 with SMTP id
 ada2fe7eead31-7d4fb291ba2mr478980137.14.1794395373576; Wed, 11 Nov 2026
 03:09:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-1-1b2072e8c37e@ideasonboard.com>
 <20261110-steady-kangaroo-of-mastery-5fcd7f@quoll> <179438844820.272237.18262716067322018404@neptunite.rasen.tech>
 <e179b228-3f18-4b99-9c54-93699d13e63b@kernel.org>
In-Reply-To: <e179b228-3f18-4b99-9c54-93699d13e63b@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Nov 2026 12:09:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQOMX2GXnBpH=onofFp1w+TyZPNc3RWjM1pDbpLTG1fA@mail.gmail.com>
X-Gm-Features: AclHuK-p812fgpXzcAZTo074hP5s29t5onlgPposQZBLZQWezlnyhodp5CVCArI
Message-ID: <CAMuHMdXQOMX2GXnBpH=onofFp1w+TyZPNc3RWjM1pDbpLTG1fA@mail.gmail.com>
Subject: Re: [PATCH v4 01/13] dt-bindings: clock: renesas,r8a78000-cpg: Add CPG_SGDn_VIO_DP_{TX,OTHER}
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Paul Elder <paul.elder@ideasonboard.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Nov 2026 at 10:16, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 11/11/2026 10:14, Paul Elder wrote:
> > Quoting Krzysztof Kozlowski (2026-11-10 18:30:50)
> >> On Mon, Nov 09, 2026 at 10:34:22PM +0900, Paul Elder wrote:
> >>> Add the CPG_SGDn_VIO_DP_TX and CPG_SGDn_VIO_DP_OTHER clocks that are
> >>> used by FCPV, VSP, VCON, and DPTX cores.
> >>>
> >>> It should be noted that there is likely a discrepancy regarding the
> >>> clocks. In practice it ought not to be an issue as all the clocks der=
ive
> >>> from the same SGD1_VIO_MAIN clock and none of them are programmable o=
r
> >>> gateable.
> >>>
> >>> According to the datasheet, the FCPV[BID] and VSPD cores use
> >>> SGD*_VIO_DP_TX=CF=86 while the VSP[BI] cores use SGD*_VIO_DP_OTHER=CF=
=86.
> >>> However, educated guessing suggests that IP cores in the same pipelin=
e
> >>> should be using the same clocks:
> >>> - FCPV[BI] -> VSP[BI]:                  SGD*_VIO_DP_OTHER=CF=86
> >>> - FCPVD -> VSPD -> VCON -> DPTX:        SGD*_VIO_DP_TX=CF=86
> >>>
> >>> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> >>>
> >>> ---
> >>> Changes in v4:
> >>> - Add all the clocks
> >>> - remove DNI
> >>
> >> What is DNI?
> >
> > Do not integrate. Most of the patches here were DNI in previous version=
s
> > because they depended on a lot of downstream things, but now those depe=
ndencies
> > are in the process of upstreaming so these can graduate from DNI status=
.
>
> Upstream clock indices ABI does not depend on downstream at all, so
> seeing this unmergeable is just confusing.

In case of the clock indices, "work in progress" would be a better
wording than "downstream": multiple patch series are adding indices
in parallel, so some of them may need to be renumbered. Just like when
adding syscalls.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
