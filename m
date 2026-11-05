Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793897088;
	b=neTY7iHllfy++p6MqCHTXZXc1P7nXkUU3bOJXSIS+OXCYsaaUFn9XFUIDIdfNF3Us3U1
	 AXQzqz+4NBaHGZXypn001bj5HHLGyBD+Ep+9TJdMlPjdQMoo+8h8X/Iyg+ebpqA3J/1EP
	 stgTMF+A/2ioeuedvRYIVEvkdglbjxbIjA8Vv7yuaqs1B68yF4GyQwxelCs2pPRC3cqRk
	 Y+pP6e4Q1J8n4iRmQnWoKE9OwbDpTjwk15fnynQWLS8Lb1/6YheGXVk9BN/YaRGKaS6yq
	 FStSusc2LPFYdW0/ibQLiSfvYACblxyy7hr+VPlT52M1l08d41IHx8gC8kJtcwz0r1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZqMiJDrBp9dqyb3cO42U+9O+NQ7NWtABCad+4xnCfR4=;
	b=tmFAPkV4nzJZ650dv5oxmWRqQQDdAEVto2JVkuk0KcowZWT65BkTcLdaRDsHGNNINfba
	 W4VwG2jpurMZKIPSoYubHnR5u/K3MQnSNxD/9kZ4NJfAWaoNamhTnZt/hjAsY8wN68mo5
	 dD3AAlJfWT4NNTW3ORha6rK/dt1ds1tTB+w7/F9xNm8fd+cs/VcY3ChU/qEa0mpPSuFd2
	 yMHp2JjzymzysjBxMuafBMd/gJf4eMMqvjg1tAG6yz/SqqUb3ivyUmtvG29gTMRPCbM1B
	 kp8jDYA/YBjAb7e2wy1HSZIPEI/L9hsee7LHjTycVqk67NMbqwxpbqCQVpIMKZV1aBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b01Rcwgg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D92606A900
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0D92606A900
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b01Rcwgg
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c169ae1cb26so144804766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:44:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793897086; cv=none;
        d=google.com; s=arc-20260327;
        b=KfBIe7LsWtiDGwENb37oma+fau1DHMdTVOy37E/oJHuMOY1IeF7BRiXg7gELsIPo9P
         dZ57oP8kXHEjfVVD2VNirBT97ilc1ufKzIZXubRbfueDpjrpDfQK+j8J731U/lwcQ62+
         bAB0dEqxjaaRX5HOLZnvMObWbGW9SyjvnkoSZQEoSKAcfnKBC4YgLK18d8RgjCHC1r/b
         3CD+oIVvkqTldWgcWCjT+E3HzgwzKJ+ziBx5VC7UOlkoJK0JcK7hakIIv2iarn+6bneo
         vzQeOztW+AQXtirizoDEO4q2ZZBXf4jZC0AK6xwuQ8yfWh10NcytzonCt5NCcPqCTeCf
         UBwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:mime-version:dkim-signature;
        bh=ZqMiJDrBp9dqyb3cO42U+9O+NQ7NWtABCad+4xnCfR4=;
        fh=8LpqKqTLRrVaAHWrmnuOLTTE0qjOY9cxY9k96MxyliQ=;
        b=h3Ca9PnG5ai/hPL/LNnWlySY5R8n9GobdxkE/PD4UFXxZDwIWDNW/vm9FSwCPhQyxH
         qKsxOJnxWXNLcWM8W4vYi3ZYqrPOcOg774G6ic+LxorVvHZKCgqLW4W7i8cpC2PXM2fI
         o9odCSY+XYbHrj7Ljdjq1PR0ZoguJA8LgPKW6+Zv1Dz0wQXAWaAgyogep2gftVCy+QWd
         peCpCu2vukH+o220Q/wYLH5G+RA72nb4412dRgLGGGRNCPQFnE4oqYbqDlKGK5TeqeUW
         rglF2jvJh7Umq8EwQBrYHmxxs1WN+8r2gKeLvzIX8CVraTQthNRoLNbNC5ce93GfyjE2
         glZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793897086; x=1794501886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZqMiJDrBp9dqyb3cO42U+9O+NQ7NWtABCad+4xnCfR4=;
        b=b01Rcwgg4xzxHkoGJsC9MswRqBWrzkxTQNBAVtIkQfYjPLLvI2QKHgosecpsHrTcn7
         PI8eXrcMKe0WT3HnhXDNHZit3ibYF1yx0BNyXAd8u0UqPg3XtBYsJQ/5CF6/utvJrC+2
         V02saf/O3u2/Qyor9iPiSwa0zGX9TZYQFBfIR5sHVlzcxG1i6eAfa3wLJLzPu+OCJRQJ
         9voFjAokw76fxBV2dnOXVZDaNbm0KYp5/dSdjPDMlORXFdzzLk+WHXYdgsqXwd18jLv3
         ATgv17clGJnQmIyBQfYC0hSCMQq0Gr9gCoc7h6P/ST8O8rfRw3aitX7oDWM8U09hekDx
         mcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897086; x=1794501886;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqMiJDrBp9dqyb3cO42U+9O+NQ7NWtABCad+4xnCfR4=;
        b=olg9+xW4a4pUTJyO8lGSHfEs6O3/f/ro5gEmrXqSG9DAhlrMKU5kjv3AI+qvIGEO6P
         l+pmfGvvUn6KbE/b+elKuU6N16Ooovfu6lt5AtdSZn3J9vypJ5O1lnokZ4msiJQc2l4j
         PJj6DKX8uXQjSpNe91xsd4uKn4iwn39KpGP6mQ9ElFjuVjuNQ+B9pTi6uRulUaeKodb5
         2UaRc+TZJhwdf6i5GVSgrd7CpmiNBZT/0Nl/Z0d9/14c5kerXR4u6vs/Ir3qaESaCEF9
         GfmSJBEGTCqW30puFd40TljcXvJ0c6BYiELumIpyRFFB6ce7O+JjJsByURb762PlPZUG
         rdtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQ8Qx7WCkJK0UXZKEHm/RGBStI6GLdbvcfREg894plfdw96iFKbzHutDVEt52vBYqIeje6P5YlsoksSWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CHlKfI+Hfxc0Q4qGpOhnzijEfkZzXzEGz4lOezg18M0N4OGha
	KMOSWf8l5xItnRJwI+rY3RdIftYRNfD8a7APeTTJNYas1ae9O3QhT6/To8bJoFsPw9Pg08EzXcq
	NNafRmC6uxIKEgxuS6LcR39gNR7RaFfs=
X-Gm-Gg: AYBFou2+fOrx+/l1vJep01LiiTYpvwfTFqa+UCzy3mH5EqpDjhsZBeX0/2XqYhA361r
	HkKWPnS2NU/gc7HjQU7N8dC6T3UgrXYH9fU+qgMhS8elnCtSSiEfgAOG6ILvVF2+tNZ3y6hH3bq
	IbhTL1vJSh0BNh9YzcTUkSYwUCb8Cqdc3Fa6C7Nb727pUqBMu6hgMreGmzIU/BYiJn7eOxgs5sH
	xR+I1bTZriz2jpuUvyUCBAs8ly8IYGvwhR+xJmz7+Cixi+iRdpMGEUMiVDJMMHby7E7Bfo3WBx/
	1s7OfRozuJMPKznO9YVPpoc/crepW9IB8ed+S2r985LiNNso9lDeoP13ZIBjvCzPVxLFiikaHK+
	5bykxIvNFk26gvQ0UjDduHSzugavTrHqRdZn09bd4z2ugicJOl/ij9AKDDcEzyGzJEB1oq7LQt8
	51/eoCXt5KRERHEiNut1h1zIiTPoiwDjNoWxeRoGmlZJk022SfnM5NhwC3Vj2TG4LiGOdARx0iZ
	GTYKqdopVF/focTZQ==
X-Received: by 2002:a17:907:6d20:b0:c2e:204d:9490 with SMTP id
 a640c23a62f3a-c4d206eeb04mr289874166b.17.1793897086336; Thu, 05 Nov 2026
 08:44:46 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 08:44:43 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 08:44:43 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Florin Badita-Nistor <baditaflorin@gmail.com>
In-Reply-To: <CAL4WiirS2n23vb9qHUHX+xBWqjiiM2KzCoFR2dysEzdXrcFQpg@mail.gmail.com>
References: <CADnh+D0zSzAyYCLo5cXU56o9X-P3RG3N2ix7ARPrP95d8sBXmg@mail.gmail.com>
 <CADnh+D3nz5aehxjvurK+Fv7gF6n4csMm-dFatvdMmg1fWdGSQg@mail.gmail.com> <CAL4WiirS2n23vb9qHUHX+xBWqjiiM2KzCoFR2dysEzdXrcFQpg@mail.gmail.com>
Date: Thu, 5 Nov 2026 08:44:43 -0800
X-Gm-Features: AclHuK8kDXY8JI8yzjWMA1cEKLPpuiBD7I5EcwcGty_AjuJnIHOuzNY_Tlbm3_g
Message-ID: <CADnh+D3faqV0QBm5tnqpTCoU9ugX_5j0mbkzKae7GT0hhgOU4Q@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: avoid false bind exhaustion with odd-sized
 port ranges
To: Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

> Please mention the side effect: with an odd @remaining, the wrap
> (port -=3D remaining) flips parity, so the first scan is no longer
> restricted to odd offsets.

Agreed. I will state that wrapping an odd-sized range can select ports
of the parity preferred by __inet_hash_connect(), while even-sized
candidate sequences remain unchanged.

> Also note that __inet_hash_connect() has the same rounding for
> netns-wide ranges, so connect() still misses a port there.

Understood. I will make the scope explicitly bind() allocation only.
The netns-wide connect() behavior remains unchanged; I will not suggest
that odd-sized namespace ranges are fully handled.

> This has been there since 2016 and needs an odd-sized range, I would
> target net-next and drop the stable Cc.

I will retarget both patches to net-next and remove the stable Cc.

> Both patches are mangled by your mailer [...] Please use
> git send-email for v2.
>
> Also, please trim the cover letter to the problem and the test
> results.

Sorry for the malformed patches. The raw Sent copies applied locally,
but that did not establish that the copies received by the list were
intact. I will use git send-email for v2 and verify the received copies.
I will also shorten the cover letter to the problem and test results.

I will allow at least 24 hours from v1 for further feedback before
posting v2 as a new thread, with a link to v1.

Thanks for reviewing the change.

Florin


On Thu, 05 Nov 2026 12:17:56 +0100, Eric Dumazet <edumazet@kernel.org> wrot=
e:
> Le jeu. 5 nov. 2026 =C3=A0 12:04, Florin Badita-Nistor
> <baditaflorin@gmail.com> a =C3=A9crit :
> >
> > inet_csk_find_open_port() rounds the range length down to an even
> > number but keeps the original exclusive upper bound for wrapping.
> > For an odd-sized range, the two scans can therefore miss a valid port
> > and return EADDRINUSE while an eligible port remains free.
> >
> > For example, restrict a TCP socket to IP_LOCAL_PORT_RANGE [40000, 40002=
]
> > and hold explicit binds on 40000 and 40001. bind(..., 0) always fails,
> > although an explicit bind to 40002 succeeds. Both IPv4 and IPv6 TCP and
> > MPTCP are affected. A namespace-wide odd-sized ip_local_port_range can
> > also trigger the failure without a per-socket range setting.
> >
> > Keep the full length for the scan bound and wrapping. The two scans
> > then cover every candidate in an odd-sized range, with at most one
> > repeated candidate when exhausted. Even-sized candidate sequences
> > remain unchanged.
> >
>
> Please mention the side effect: with an odd @remaining, the wrap
> (port -=3D remaining) flips parity, so the first scan is no longer
> restricted to odd offsets. For odd-sized ranges, bind() will now pick
> ports of the parity __inet_hash_connect() prefers.
>
> I think this is fine: same-parity netns ranges already trigger
> "ip_local_port_range: prefer different parity for start/end values",
> and __inet_hash_connect() ignores parity (step =3D=3D 1) for per-socket
> IP_LOCAL_PORT_RANGE. But the changelog should say so.
>
> Also note that __inet_hash_connect() has the same rounding for
> netns-wide ranges, so connect() still misses a port there. This is
> fine since the sysctl already warns about this setup, but the
> changelog should not suggest netns-wide odd ranges are now fully
> handled.
>
>
> > The issue was triggered while developing port-range selftests with
> > Codex assistance, then confirmed using userspace reproducers on
> > unmodified kernels. No kernel instrumentation or fault injection was
> > needed. Booted x86-64 KVM kernels were tested against the regression
> > selftest, the full ip_local_port_range suite, and a Go net.Listen
> > reproducer. The Go reproducer fails 100/100 times per IP version before
> > the fix and 0/100 afterwards with a three-port namespace range and two
> > listeners occupying its first two ports.
> >
> > Fixes: ea8add2b1903 ("tcp/dccp: better use of ephemeral ports in bind()=
")
> > Cc: stable@vger.kernel.org
>
> This has been there since 2016 and needs an odd-sized range, I would
> target net-next and drop the stable Cc.
>
> > Signed-off-by: Florin Badita-Nistor <baditaflorin@gmail.com>
> > ---
> >  net/ipv4/inet_connection_sock.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection=
_sock.c
> > index e56beec43..755fcea35 100644
> > --- a/net/ipv4/inet_connection_sock.c
> > +++ b/net/ipv4/inet_connection_sock.c
> > @@ -343,8 +343,6 @@ inet_csk_find_open_port(const struct sock *sk,
> > struct inet_bind_bucket **tb_ret,
>
> Both patches are mangled by your mailer (wrapped hunk header here,
> wrapped diff --git line in 2/2), they do not apply. Please use
> git send-email for v2.
>
> Also, please trim the cover letter to the problem and the test
> results.
>
> The code change itself looks good to me.
>
> pw-bot:cr
