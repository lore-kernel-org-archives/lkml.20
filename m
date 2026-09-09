Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5E747C0F8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959065; cv=none; b=Kp+luZNatyVSHVwl0iUiHU5MTw3jU+Q+9DeU9Lk0PKSGezWFSmdxGUNDtTm1lUVMxVVYoSO/yNFxwG2OXRb5iAwrVp0ADDDz7doqLgn3oxEFvnHYExqkysAx3b6m8yrYOFYNkBN7YG34iCdfww5KZ73E9HEHQ5Z+Xg7PTPmipmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959065; c=relaxed/simple;
	bh=GY0t9Zq4ZWTKP0uN21EU/sGoEGo9SbQtLMxOr/4/8YI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i73J5SCrf/WOIxINeu8PSVOoX6snRLot287Cyy5dJqo41lKd7pDv9MPYOlZSrTdhsGmBJcVQM4XW7gxsSt3LuILOqK77w8ACGCWa070/GIl7Soaozd5wAhovyBNBoim7mdqUI7VAMX7LH7tmm8KAbTqdS+vzQT6gagLZEo8v/A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=mUFM9/Ow; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="mUFM9/Ow"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c262bc686d9so723793366b.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1788959062; x=1789563862; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ts3dnJC+uruboeeufdDbrG+MSHz7hrc+y5uIHr8oVng=;
        b=mUFM9/OwtZYyiPrGCSiGU0EoaAC/+WpR1xEAcDwdFtSZS6Q1nmdrhgbWtEdwRDASFm
         bUKr/Ps+73iRV3DaZhT0omeLt8CuC5jNDUwenL4bqQbO7Eta1SjL1aFce8iMShuVP/wV
         aN3c1lLVjkTDd+EfeOX32DVISJPg8XPeilOwHKdOpO7FRCTBNallS+6k2zT0A/BDDMA4
         KtzqKm79rE3OKo/OCDaTRglznd1xQv1xGsWj01+tsjpX7BN/p5Hvr3Ma/IUWPwSA6lYK
         HNqOcr68bmQrCJpl2XvPnJnoZtE4n+6hQ9GnN/5Dd/QDlrHR6taYbPJnD/8RCVNXV0Gb
         UTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959062; x=1789563862;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ts3dnJC+uruboeeufdDbrG+MSHz7hrc+y5uIHr8oVng=;
        b=k7AYlSRi8izhUTgwOuVkCR4JfyuZ/x5XUE0Rka+uZSPO27ghvACjZ0GBjOBQnl1Sb+
         gkzbub8qIOBJSUWpuTNaM6bgOGKC8P/rSJ+m1Si7uozMfdiCrfMEjjBB80TBcJTaLZhY
         1wFRw2pF9tJJHAS0Iog+aYVAn9dSvuDcOO5lQayWy3JbGsHovsMkENJUqj/U452Ac2x/
         Xhy/6shZwzcK6GIgTft443yYmFlU9LEliyuk8EKqcdeivysZmDqmWXCcLPscrOmAsNHJ
         dK4Xg8BwuqeMutcvwZ3yUYpUs21zLst3uJjuZQlNvW3b7TyvR/CYvbNZJEsZ2ssZhRIC
         w89g==
X-Forwarded-Encrypted: i=1; AKwUvBxNctK5caa9pHa/jbHmyqA77YXeJHPvWZQ8umWLDZXmKOifXL9RXfYmJerqa3oGgEaTomCWOqjYp35ebvM=@vger.kernel.org
X-Gm-Message-State: AFuF++lYGVHKFGEaL1YB5FjnQi2ESjWrFyxFaxHlvRpxRe/hbIWgHDMZ
	07N1RrPFPGC5198BIlm7rPEa/CD1fRW89DAeJotrWI9eYfN3wVgPa5Uki+VJZrNZlHg=
X-Gm-Gg: AYBFou3+B/8hfEX8YRyBeOxqiXJ/DLNf2D+VpBRZha5e/r8+gIM9T3t0tfGoS6b06dY
	ZKH6U6KJGlDmaR0F7on6hppigbJekC7xMauPDNs/rLIj7UdvG77M1SRvSdUj+ixtlyhOUWJ/1JL
	eKsEVlQ7YMpZeM8sp2euejVjl+PU7NoUx1Z/UqQZCitV72jpYp6W9lbIiVXeau9s7kW229CtnSj
	2aGipWCzrA3xKE/C7+Rr6OsaFGwgjWATzsTI4To+fFbMVh0Kvwxvb6jERq0CM03eXnOTRynZQ8W
	4xJS+hfTJD2yag1VtOc7PS1JC9OyHX+yLT4hG8ox9SyAf1dDpqyqT6eE22AOsFdbghEQtTsbzzA
	QxGdJPYt7cv1GipEixo+hnsVmx4D8p/v9bUcl/rTxj+wmYz737hV19RD/EzzGWCxeoRyk3bceJK
	Zc78fTizBArsNLuHwAU+8FhARo2VwuiU6+i8GjPDdoxNKCVZHh1EX0+LVuZjAV4QAdeY3F6km9V
	RZyviP0BPrrX1KLQtFjCOusxwYeVb5GRPet1GUuMEa7GSl6fkQRsW2PQLJJYxg=
X-Received: by 2002:a17:907:1c09:b0:c25:8878:3e09 with SMTP id a640c23a62f3a-c260ca1f44cmr1371266466b.22.1788959061478;
        Wed, 09 Sep 2026 06:04:21 -0700 (PDT)
Received: from [10.86.8.48] (static-101-125-100-159.thenetworkfactory.nl. [159.100.125.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa01dsm770252766b.15.2026.09.09.06.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:04:19 -0700 (PDT)
Message-ID: <9af28de2a07f7965300b898994481ccf194a30da.camel@ndufresne.ca>
Subject: Re: [PATCH 3/7] arm64: dts: rockchip: rk3588: add an OPP table for
 the NPU
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Igor Paunovic <royalnet026@gmail.com>, Tomeu Vizoso
 <tomeu@tomeuvizoso.net>,  Oded Gabbay <ogabbay@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Sidong Yang <sidong.yang@furiosa.ai>,
 Diederik de Haas	 <diederik@cknow-tech.com>, Sebastian Reichel
 <sebastian.reichel@collabora.com>,  Jiaxing Hu <gahing@gahingwoo.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 09 Sep 2026 09:04:14 -0400
In-Reply-To: <20260909091825.10838-1-royalnet026@gmail.com>
References: <c58d711ff5c9a01cfd69c2ddf86bfd969b36cc63.camel@ndufresne.ca>
	 <20260909091825.10838-1-royalnet026@gmail.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-vMgI82IkHW7sjh+hqtEY"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-vMgI82IkHW7sjh+hqtEY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 09 septembre 2026 =C3=A0 11:18 +0200, Igor Paunovic a =C3=A9cri=
t=C2=A0:
> On Mon, 2026-09-08 at 15:44 -0400, Nicolas Dufresne wrote:
>=20
> Thank you for taking the time on this - and no worries about the PoC not
> being posted; the credit in the commit message was deliberate, the rates
> and voltages really were arrived at twice independently.
>=20
> > My impression, and I was to study this properly is that having the same
> > table on every core and adding the opp-shared set on it was actually
> > probably the proper way to describe this "single clock for all"
> > relationship.
> > [...]
> > I'm curious what's the right approach, and what is the real meaning of
> > opp-shared if I got that wrong.
>=20
> You got it right, and I got it wrong. The binding says (opp-v2-base.yaml)=
:
>=20
>   opp-shared: Indicates that device nodes using this OPP Table Node's
>   phandle switch their DVFS state together, i.e. they share
>   clock/voltage/current lines. Missing property means devices have
>   independent clock/voltage/current lines, but they share OPP tables.
>=20
> That is exactly the hardware here: one compute clock and one supply for
> all three cores. And it is not only documentation for non-CPU devices
> either: in drivers/opp/of.c, _managed_opp() only lets several devices
> share a single opp_table instance when the table node carries opp-shared;
> without it each device that points at the same node gets its own table.
>=20
> So the accurate description is the one you had: the same phandle on
> rknn_core_0/1/2 plus opp-shared on the table. Putting the table on core 0
> alone describes core 0 and says nothing about the other two, which is a
> worse description of the same hardware. I will change this in v2 unless a
> DT maintainer disagrees.

Great, let's hope a maintainer talks sooner then later, but it really looks
like the right approach.

>=20
> One consequence is mine to fix on the driver side, not yours to work
> around in DT: the driver currently picks the core that carries the table
> by taking the first core whose node has operating-points-v2. With three
> carriers that choice - and with it the name under /sys/class/devfreq -
> would follow whichever core bound first. That is a driver bug the moment
> the DT stops being lopsided, so it gets fixed in the same v2.

I was not aware of the component framework, but some of the gpu driver, and
recently some of the media drivers are using this framework to facilitate
the initilization of n-cores in one combined device. Just food for the mind
here.

https://lore.kernel.org/all/20260810-rkvdec-multicore-v2-4-986f89d22cdc@col=
labora.com/

>=20
> > We must not justify our DTS choices based on driver behaviours (or miss=
-
> > behaviour). We must justify it based on how accurate the hardware
> > description is.
> > [...]
> > It should probably be fine to not use opp-suspend, if transition back t=
o
> > 200Mhz works. It not fine if its to avoid a driver deadlock (argually d=
ue
> > to a bug).
>=20
> Accepted, and it is a fair hit. The paragraph as written justifies a DT
> choice with a driver limitation, and that is backwards regardless of
> whether the limitation is real. It comes out in v2.
>=20
> On the meaning: your interpretation matches mine, and it is stronger than
> "descriptive". The binding says opp-suspend "marks the OPP to be used
> during device suspend", and the devfreq core acts on it directly -
> devfreq_add_device() reads it into devfreq->suspend_freq, and
> devfreq_suspend_device() then sets that rate.
>=20
> Which leaves the question you actually asked, so I measured it rather tha=
n
> argued it. On an Orange Pi 5 Plus with this series applied, in-tree rocke=
t,
> the OPP table of 3/7 read out of DT, simple_ondemand with min_freq/max_fr=
eq
> left alone: 25 s of inference, then 60 s idle.
>=20
>   - The governor takes it back down on its own. trans_stat records six
>     transitions for the run - 200->1000, 1000->800, 800->1000, 1000->900,
>     900->500, 500->200 - and then 60129 ms at 200 MHz with zero
>     milliseconds at any other level for the rest of the window. The step
>     down happened within one 250 ms sample of the load ending.
>=20
>   - The transition completed, it was not merely requested. vdd_npu_s0 goe=
s
>     700 -> 850 mV under load and sits flat at 700 mV for the whole idle
>     window. In _set_opp(), when scaling down, config_regulators() runs on=
ly
>     after config_clks() has returned success, so the supply could not hav=
e
>     come back down to the 200 MHz voltage if the SCMI clock set had faile=
d.
>     All four voltages of the table were exercised: 700, 750, 800 and 850 =
mV.
>=20
>   - The clock summary in debugfs agrees, reading 200000000 for scmi_clk_n=
pu
>     after the load. I only sampled it after the load, so I am offering it=
 as
>     consistent rather than as an independent check.
>=20
> So the transition back works here, and by your own criterion it is fine n=
ot
> to use opp-suspend. This is one board and one part, so I would not call i=
t
> more than that.

If you can script the test, I can run it on Rock5B later on.

>=20
> Two things I want to keep apart rather than join with a "therefore", beca=
use
> joining them is what made the original paragraph wrong:
>=20
>   - What guarantees the rate across suspend is the driver, not the govern=
or
>     and not the DT. rocket_devfreq_suspend() in 5/7 sets the recorded boo=
t
>     rate itself on the system suspend path, and 4/7 restores it before th=
e
>     last core goes down and on .shutdown. That is the answer to "is it sa=
fe
>     without opp-suspend".
>=20
>   - Whether the governor walks back down to 200 MHz when the NPU goes idl=
e
>     is a separate fact, and it is the one you asked me to check. It does.
>=20
> opp-suspend acts on the first of those. Since the driver already puts the
> device back at its boot rate on that path, the property has nothing left =
to
> do here - and that, rather than any deadlock, is the argument v2 will mak=
e.
>=20
> Worth saying plainly: every number in the cover was taken with the limits
> pinned by hand, so this is the first time the governor was left to decide
> anything on this board. Your question is what exposed that.

I don't want to pretend the doc is ambiguous for this one, but its not 100%
fit, but is not 100% unfit either.

- opp-suspend: Marks the OPP to be used during device suspend. If multiple =
OPPs
  in the table have this, the OPP with highest opp-hz will be used.

I don't think we had to transition to 200MHz before suspending, but it
will be at 200MHz once resumed. I think some maintainer feedback here would
be helpful.

>=20
> > This is irrelevant, I think you can drop this paragraph.
>=20
> Agreed, dropped in v2.
>=20
> > Ack, this is safe thing to do.
>=20
> Thanks.
>=20
> Regards,
> Igor

thanks for working on this.

cheers,
Nicolas

--=-vMgI82IkHW7sjh+hqtEY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaqFZTgAKCRDZQZRRKWBy
9HjyAP4vbUUwrczBVQK/M6Ks4OklPUf8WieQQH7iOFv/VnvRAgD/cqMxwQeiF6s2
zTobwvQD9DoWkqU89RkQBfE66maJcA4=
=1ROv
-----END PGP SIGNATURE-----

--=-vMgI82IkHW7sjh+hqtEY--
