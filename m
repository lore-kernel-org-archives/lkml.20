Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793816443;
	b=nuF5OIGFkMeKCpfc/vDYndB0SeAZUpKUuhGCKoWsNEBJED3FEcmimSYta9MSf09zqtrd
	 j0ccBxpMrdSFxODLdk48rSQ8uiQOK+vDGBKK8P1uUe0M3HL/Plr9RVq4RBnWFqAgBuT3R
	 8k4zep71rnVnJnsN1sfqSMxs2zE73scqdbGv3I/Iy1LVZoMi/3ekUOA5sjXjLMSgtm9yM
	 w8Ud7c62MJTodSDDIlkQGnbvl/uLDv6PhRpVmpMTZlgMqaFFrW3rwxEWKWtvC33/P+TmL
	 Nz0kk6Shm6SezpYFX6t06AGRFJ95+N0nO47BzjoEbg/eRhAJD5+OdbHOo0FsnTNAb6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gVCj19jGKEoDWGgT7ubTb4b0f+R2v2V0MSyOiFiiaMc=;
	b=Kbx2ykQGXQrvQL6rstCqJr0+jXeEAi/B2SkXhCQxh3Jc4paUMeg9cc3V3KP0jLfsNZB+
	 Ylkksy7YXrTvPcs4qLNKZMBThcRUTCkp65NfmsO8wqfqk5RHeFIR4K+fC6UGee0oLLad6
	 8oDEKKvsLCkGGWb/SePr8Wa08cF3P+TsB9yZUoevlqPJ345Gp/MBQRJ8c1O7hvRxrZU52
	 0iUk1ih2yPB7OzdGiHf7AdP2udBBgggsbBRFimWOLQXZZN82pTprMoQn1fEhWOwTKY8kl
	 1Gm8nIagUJOJI0U51crPNggzbnzrtooF0wgWNjPjRKYOxRDG7G8DWJ+VzNGWYg9wyNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=k+atpzFe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93301606A339
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93301606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=k+atpzFe
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7ce645a1c6aso588621137.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:20:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793816441; cv=none;
        d=google.com; s=arc-20260327;
        b=putGK+dzxeKr4u0trQJMyC1v+s7jCy2b3es+fG/XBQDwu3HMuzwF3PZfeJNOaVKpJ3
         2/D7/IAydmbdto2immFi8x7CBaSyv2H9HePvf/Lce/TObbtFO5v8FiXBsbeR9kIb1nhw
         WP2m5bmu7SZ6vw3f+Yg8jHsJgQVUM0cEw3r4sF78TF+DENx8J2GMZGH9QJuo2e+bDkIP
         ehQKuRFAaJqW58cFZXGUa4wn0Lau89zbz5/v9Y0fVH86VEhHUY1qEShfBszHpRLO+Gfl
         6pzK6YDqIzluSXT5yI41cbJTxhZls5n/0UY7oz3B9r66HfRhzGDTb/DTehYym4+fsds7
         hIsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gVCj19jGKEoDWGgT7ubTb4b0f+R2v2V0MSyOiFiiaMc=;
        fh=rDxRdVBCSCWU8NJLBJtbehL9AmXMa2wTdqqzKH7EJXM=;
        b=bapAjVRA2HbMfhWzVlofZuCE4DJB8vwnrUmzV+vJI6WIU3Te8crMBsXq/OKbPMZLYd
         mFabup3ifyTFVglwuLeVteBcMdvjHZuSxOrppsf5zfNXldOxmNaOdC+lGIu2AS2Jrwek
         Pr4dZYkAPtbJ/SGi4ocs7XXC2bLfSNNVr+39EX1jiP7zYo/ZXhAJqb28VNj4HW0cN8nI
         P5eZJ4neAYks9Ju5aN7XM0qV3Kt5b6HACz89Fgvkv/rvfh3i5Fqn4+xXHma0MV3KFR2G
         UgO49EfSFjArjE2NF/E/SFXJ8bcoG2lXuC3nFoH0OOHR9HC2+lIs5p1K/Lu8jwXiL8Dn
         cORA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1793816441; x=1794421241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gVCj19jGKEoDWGgT7ubTb4b0f+R2v2V0MSyOiFiiaMc=;
        b=k+atpzFeWmfym8zI5kN5jy5DseeJQskSOUAO85QVdcZ5Lb+KdP9AaGCbZEh8oGb0fL
         Q+8J2uSYff4SHvumiAMWKelW+bUUckOb48/+5USiubkaSW6KLjwUFEZv6js+ycew58XG
         fTvfs5fbW6g392+5q0P1GfkBtvu+RtjmGHsXJJopWoT4XqHj2B49zFWmLw8COqgVl5ME
         /XSKAh1gAjMTovJtD8tgY+JI55XdNiVyLW9H8zALviN8Tdac7afgyqRih6n2/cqcS1/1
         VUEIbFce5dh93Wjr2ZVi/O/4jWsn+ah8HktTNMLp3dgDzjvqWPxwUyyeh82/wnYMVwWT
         /FLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816441; x=1794421241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gVCj19jGKEoDWGgT7ubTb4b0f+R2v2V0MSyOiFiiaMc=;
        b=lgewZ3MHTyP1utMxGVacjER4brgQPV9ptNhWw1XUTe+3d/LfHnxfqKr6thT8vArhYG
         AV3eXjNAiYoAqCVqnUsZTphTdu3dMua3QXYLhTPmzxQA5y0NPQ7xX2RQyDZLYjj2HoE+
         23PNZXv9SPDlvuFbPtxGqqtcBt1n04deZ+pMwVggguPIs+Zk9tPFi0RL35tSV8M7KkfA
         vKgcuCCk42roJKSsMHiOOXS5okfPUk+a5JWJ4N65JevvB0PU0SgYgaSEqGlLQBURQT3d
         86Y8Y7mF880ErkJKPRXHCUUtiRUh+WSEgUO2HTYKRELbLZxqhz4I1xztPBkvXf6T4vON
         tszQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUQ82FoZPwtnh0V9fx9L3gNkf82tkhYLmuAbfzzzl/UsxrUC0iNnCAvdjY9LsoG+BEJknRg4fTkvF0PTU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xIEkJ4tJzfAQCx6s3euTf4mYbNsXuReRhZE6d/YV1u80Pl/tf
	LlXykgde+U4KBLKW7N05QDkYcIvbqmLFUOp1H9I3j8fpLIO9RuyH9QRIDp7nd18qnK5qUfeE5KC
	OZH6SzAH3HFaODBKK4ayPUW6Hbr1s/xDHQxg727+rAVsk6Fk/z9mJ3e6uwg==
X-Gm-Gg: AYBFou08fV2sOLckysZCSYETZC1r73dlM8HKTeCvy/j6v9FeWl6x5On6TjyqwDZetIj
	vJLO5HOjzpFC+2RZ9qqg9hRho4V45kLljJVhs+y9pNkqLo/MhwmhL7j2Wb5e4PH/GvXIP27Ax1c
	OPEPPHN81Fs3223XrktYhsLAAJimgQjxZvi5HbCK0vFl/vfIbTSSPHCCK/JiwW3T3pbZMKmEo0V
	93cwEMznMyEY1oSgl9RakpNts+yCtWScKVtbSkWl4PTX7uY2yolQTI6qfd18/2Bq3PUu/FbcTLe
	n70W5dvfBYsWxudrazUhhWBlMFF1uku0ttSjtiC0M8wJ2dpLUTnj2qbj6b8H/Xgc3wC1zftsP7S
	3aehgjZmBu9l8HglTaz73iJo51P0Y7lk1sY2coAoUHq9QQeRCeDG3uwMW5paaZqpaRi19EAS0wx
	3pEFxtfYXDHVmxVXfvHIHli3m7SX+xJRoIHnOeN7QSmcL+jhTeiDU3Cd0WQ7W/7PuxACVac763r
	5oLc73Ju5gy+vXpOdWGtU7O
X-Received: by 2002:a05:6102:148c:b0:7a7:ad9f:53b4 with SMTP id
 ada2fe7eead31-7d072bb37aemr7324843137.7.1793816441323; Wed, 04 Nov 2026
 10:20:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102213011.4191020-2-rjethwani@purestorage.com> <179374158513.488856.17891105693447320515@kernel.org>
In-Reply-To: <179374158513.488856.17891105693447320515@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Wed, 4 Nov 2026 10:20:30 -0800
X-Gm-Features: AclHuK9t3mSN4XXmls4xl9Qx3TIMQVf5WbjMNgCm-i_nv9C9rnP4U_CJRGtvasY
Message-ID: <CAKaoeS0mipHa43Fs1fnp97xu1wDNWor0yNU=16ZJHNqTfwaorQ@mail.gmail.com>
Subject: Re: [PATCH net v5 2/2] selftests: net: add TLS 1.2 hardware offload tests
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, john.fastabend@gmail.com, 
	kuba@kernel.org, sd@queasysnail.net, davem@davemloft.net, edumazet@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, aviadye@mellanox.com, 
	borisp@mellanox.com, ilyal@mellanox.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 1:33=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] On offload NICs that only support AES-GCM-128, the
>   tls12_aes256 variant of test_tls_offload reports FAIL when it should=E2=
=80=A6
>
> --
>
> selftests: net: add TLS 1.2 hardware offload tests
>
> This adds a two-node kTLS hardware offload selftest. A C helper installs
> fixed AES-GCM keys on both ends, and the peer echoes data back to the DUT=
.
> It checks that HW offload is used in each enabled DUT direction, covers
> AES-GCM-128/256, IPv4/IPv6 and several payload sizes, and adds handshake
> and alert record-type regression cases for the push_pending_record fix.
>
> > diff --git a/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py b=
/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py
> > new file mode 100755
> > index 0000000000000..e720ce6547610
> > --- /dev/null
> > +++ b/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py
> > @@ -0,0 +1,321 @@
>
> [ ... ]
>
> > +def check_tls_support(cfg):
> > +    """Require kTLS on both hosts and at least one DUT HW direction.""=
"
>
> [ ... ]
>
> > +    try:
> > +        features =3D cmd(f"ethtool -k {cfg.ifname}").stdout
> > +    except CmdExitFailure as e:
> > +        raise KsftSkipEx(f"Cannot determine TLS HW offload support: {e=
}") from e
> > +    cfg.tls_hw_directions =3D {
> > +        direction for direction in ('Tx', 'Rx')
> > +        if f'tls-hw-{direction.lower()}-offload: on' in features
> > +    }
> > +    if not cfg.tls_hw_directions:
> > +        raise KsftSkipEx("Device has no enabled TLS HW offload directi=
on")
>
> [Severity: Medium]
> On NICs whose offload only supports AES-GCM-128, will the tls12_aes256
> variant of test_tls_offload() report FAIL instead of SKIP?
>
> cfg.tls_hw_directions comes from the tls-hw-tx-offload and
> tls-hw-rx-offload feature flags. Those flags don't depend on the cipher.
> run_tls_test() then requires HW in those directions for every cipher.
>
> Several in-tree drivers that advertise these features reject AES-GCM-256
> in tls_dev_add():
>
> drivers/net/ethernet/netronome/nfp/crypto/tls.c:nfp_net_cipher_supported(=
) {
>         switch (cipher_type) {
>         case TLS_CIPHER_AES_GCM_128:
>                 ...
>                 break;
>         default:
>                 return false;
>         }
>         ...
> }
>
> The other drivers do the same:
>
> - fun_ktls_add() in funeth returns -EOPNOTSUPP for any cipher other
>   than AES-GCM-128.
> - chcr_ktls_save_keys() returns -EINVAL for non-128 ciphers.
> - mlx5 only supports AES-256 when MLX5_CAP_TLS(tls_1_2_aes_gcm_256)
>   is set.
>
> When tls_dev_add() fails, do_tls_setsockopt_conf() falls back to SW
> without returning an error:
>
> net/tls/tls_main.c:do_tls_setsockopt_conf() {
>         ...
>                 rc =3D tls_set_device_offload(sk);
>                 conf =3D TLS_HW;
>                 if (!rc) {
>                         ...
>                 } else {
>                         rc =3D tls_set_sw_offload(sk, 1,
>                                                 update ? crypto_info : NU=
LL);
>         ...
> }
>
> The helper's setsockopt() calls succeed and the echo passes. Only
> TlsTxSw/TlsRxSw go up. check_path() then fails with "HW offload not
> engaged (Device=3D0, Sw=3D1)".
>
> The HW_NIC_COUNTERS comment lists nfp, cxgb4 and funeth, so this would
> hit hardware the test means to cover.
>
> Could the AES-256 variant skip, or accept SW, when the DUT driver doesn't
> offload that cipher?

An earlier version did skip tls12_aes256 for drivers whose
tls_dev_add() accepts only AES-GCM-128
(a GCM128_ONLY_DRIVERS list matched against ethtool -i). Jakub asked
for it to be removed:

https://lore.kernel.org/netdev/20261026174337.404cb718@kernel.org/
  "No need, just let them fail. There are automated systems which
check if failures are regressions or not.
   We only care about regressions and crashes in HW tests. No device
supports all features and cleanly
   skipping for all conditions is a fool's errand."

So on nfp, funeth, cxgb4 and mlx5 without tls_1_2_aes_gcm_256, failing
that variant is expected.
Accepting SW instead would hide a real AES-256 regression on devices
that do offload it.
The test only skips when an environment prerequisite is missing: kTLS
isn't available,
or the device has no TLS HW offload direction enabled.

> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261102213011.4191020-1-rjethwani%40purestorage.com
