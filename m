Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793966474;
	b=dc5l5rj78hRZDHa90+28c4sVkD7izu6ZY+A/TlC5jJwcKlvtxyjWKMCdU4FDdhaArBC+
	 t8Jq8AGgBS5KOzwAtexdYx8DlbRUPXD4lbOW2wyYn36Zv2uM6sCFr1RgokymOHbN8hdrg
	 88zyq35VfQIX+efl38zK5Yo1EjtOT87CwuWdsfW/6IF1SLFk6+tu6ATHKalAvfs2vYrz1
	 YLZn4CjeCvVCDe+3nGbFlNNcXhHZAM/l2TvyLloKmeF1uayckB+f1VAM5j1AUwDaTSUxd
	 GOJumfneY4nGbb7tz0fl6/8vLNQA6VeLNGImROtnpWWPYZKc6K5dgqophDYiFp1r8eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=7Atkv8Av9+Ao+eHQuMY+XWjPUUdTG2IMTe5rVcJzpas=;
	b=v47hLW5y3F8+x7+o/BiRPRNKZ9r9lua2069ufCpcRS0Wp01O8s8VcuGgd9OEI9eCT6qX
	 NNFqWd5r/V+E2cidGvbJEa/XOycvCLa+sPFVpsWumCKHpeSaicAqnI3exndte7XX8FunU
	 t5ShIUdAiDDls2LQrmYIdWPzdxTD5w5L6h+QrSeyMW3v8804OaSp2p7RcZhVbbCCYzgec
	 h7y43OthKzuWlTYG3ByXSMksrmGZog/51lJBu8WdBuY836BALqLgBLab00qaRKLZY0Sa+
	 a2oxeSXYQ9gai5w9Q/MJ1yheFrBGYaMRF/7ZTlR9Ao8o5HkEsXSYsOs5navg7Mzyniw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=janfabian.cz;
	spf=none smtp.mailfrom=janfabian.cz;
	dkim=pass header.d=janfabian-cz.20260707.gappssmtp.com header.i=@janfabian-cz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m9WyR+EH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290A1606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 290A1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=janfabian.cz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=janfabian.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=janfabian-cz.20260707.gappssmtp.com header.i=@janfabian-cz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m9WyR+EH
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9441591aa5cso209206585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793966473; cv=none;
        d=google.com; s=arc-20260327;
        b=cy5bAaR7rpXMNyvGMkKSkkIwXOEgUATSX6rAb/6uuscY/PXQarCChNjfaEPFPpVcvP
         c/PdCcVkRiGIwCfMmevh+cI74ckI3qY+taucQK7+3Uxsfyt5PRyIhdPyHZnuFGkfRF6J
         IVvTg8IY3qawoQwSKg/FR7lDg20fGTC1v09bPKtn3v1sBBtAbq67rQrI+YvgVPt5Txh9
         Edf+Ovthpe7mytCvkYfsYLnsY7biiNRa+AGAfxBf/pff5BV4uENs26jHZH43zcIPG/7Z
         Jd2rry0Tvcsuw6XDXDl8OZSKWbBWPMerrR/2eFfKGrvWAqM2Iy3uwUZzTAcBTEkcPoL5
         QXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7Atkv8Av9+Ao+eHQuMY+XWjPUUdTG2IMTe5rVcJzpas=;
        fh=KaGWPdf2qxeZrwL/lK7A+tYrxN5StcBmniATkEM5Xyk=;
        b=FdVYqdO4Lq+opxLSCS1S8yWkZlqFcti9+y8MIK59QKWVlIRxypscT9A65nv9HH+pte
         v1ZYsWnLD4FySAbEPNFUhNRLACKLIq5E2YHb06y/oJNSaF21/SBMxKAjbnHXonqNgb+9
         eZqxUqSU1iii1NBVyw8f/Q/G3q31kcJk2pndgOU2lPGh0pxx2PxewXaKdsPhMyoDS67G
         /MXohr81thzdPZxaYqouJGDmbfbRpjNVwDzwglCg/khRhVPbLDInM8KbEjfs4Khc575H
         KrEFkS2FOVpndbiYyz9RtoNVysuLo27sPYhLUjy7IPxbrlszkgNocUt87Z4rslGlunWK
         13fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=janfabian-cz.20260707.gappssmtp.com; s=20260707; t=1793966473; x=1794571273; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Atkv8Av9+Ao+eHQuMY+XWjPUUdTG2IMTe5rVcJzpas=;
        b=m9WyR+EHYRDo2JoRU0miwDWW4tloiONj6mV5//vpPrT13wUC2RC07ROw+sj0IXP/kZ
         gWf70A8DRbiIQgR/LedqAaAD47/bn6N88fwuARqVz1U0dy29akqg9a/IMvPuvo+Wr7hs
         7VWaEpODH6rzz7ycrPVG7h62avoXiUDejWV4L+uc2LA1BRgoTxmcvChcxGDoIJdaVLNA
         wIJiXevH9Q9dpwJsQ5h6quAobXG+KKWQUSbVPtCgOucYZpUdT5vV7Uxaaw2/SCIgSu1f
         u4/tNWB13GzmBY7MUy/Fp2/Q0iI5YQkJvBogtjjrM7i7FK/6UbIlXVBB2OAwwvt7nABT
         yKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966473; x=1794571273;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7Atkv8Av9+Ao+eHQuMY+XWjPUUdTG2IMTe5rVcJzpas=;
        b=14QEez+TTHULnXKpGdhH4uvIvNpkPhEuDxbCUQoPwSprPuFag/skCke0Vvb+pNrPL4
         XGBmz2g8GKjMV6vNtdwFHSPF07T3Vffl3xIz3Q4UxTXIdaZh9NGhF+UUB1kbLCZOBOJ4
         RHpqzILAM0cF8dmMemxxgjT+crraL9nyTmRU6lNtTPAYMZeYI//wfY0TbihY9BhmQnt6
         OwB6gWpLWJtc0mUqpV/X0MbyizmB2xKjmVOD0vtTYKZvMIidmYmGeOnFeueZ8zH3Tkj6
         fsdsIawq4+bPU2aYgzUNsusSGkQp2P5N52JPg0mp9joR+54twviEjpbuhTvoUv4xZsZy
         ZyZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzs2u/MfgacK+AUBC2YwtA7xODBHYgxlShNXEAcUeKXLd33ct5O68JBlBM7cC98INoOYR4hgdMpPR/3y8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+3KipUYtRb5QM+7qmEUD+qTv0eGgi2NJ6n6StT6e+dKBufjlH
	G15YA8BxcAHR6Y/hHPgXMuFQMCbTFBDf2Zxmw2ChecqHvO4z+tSFtwaVZXTgb/v74QipGjgieWp
	8QMMPofB53/6rRjN62xIoVbwEU25jZN4oZ6gVo59vAA==
X-Gm-Gg: AYBFou00MXMuqCOFacYfCZfcyGJ0J8oObsg7VSunk7MBEw54J8OGHi49tKXTwqbMYGK
	LUU1N/0JPe+FJosRS2WJkIOc4ePIdGilDaRfqIoR0FA+npC3mc4jhwsRHJKgXNrWdQ5NstLZwYJ
	kb9CTAG3X2sthlNrt/Irnqz7eQiRxvUfu9s0SBs6rSqPNa5uQJIeeeGoam41h8aOSkfbR/lbGP3
	blb2O7elwCBaX3JpDRrRqqe6hNVRKLRbMGFKaUCqLJFBOrTqJujUjpmmUwuRlLdotvrOH/eEQ5C
	slo2QACOKGO1b964HUie9jLn9URNTn2oUAE2BviNxOWY4mERnqUX4pbmg5WdNkNoGKBqQSGnzBn
	cvOYSDDN4AE2p8vvhZZedLvJyYurkSbokmWjZDAIdr/8u5rRihNIFCyNWpxeP+sLAvBZETSX7De
	2l9O6bAy2y+vIiZSHFY6foiQSzxvl8xJjySzCBQzgyKvBC0hmpDKOta7T3
X-Received: by 2002:a05:620a:2794:b0:939:b0c8:b068 with SMTP id
 af79cd13be357-945f34bc0a1mr254496385a.16.1793966472954; Fri, 06 Nov 2026
 04:01:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Jan Fabian <mail@janfabian.cz>
Date: Fri, 6 Nov 2026 13:01:01 +0100
X-Gm-Features: AclHuK9A-2FTFvlKyzhSApeifYzSQH0lEyNG7mAx3QstJCDBSgdJAuxX-NobXGY
Message-ID: <CAEwhnkgosQd5hnN0qkH_xVrxngfhCpnALR6Gi7M1j-4tnSEKOw@mail.gmail.com>
Subject: Re: [REGRESSION] Speaker pop/chirp on Meteor Lake ALC287 (17aa:231e)
 -- 6.12.73 to 6.12.85
To: tiwai@suse.de
Cc: kailang@realtek.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, mikekarcic@protonmail.com, 
	regressions@lists.linux.dev, sean@starlabs.systems, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

(Reply to https://lore.kernel.org/all/87jysdv4qg.wl-tiwai@suse.de/
sent from webmail, so it may not thread automatically.)

Hi Takashi, Kailang,

Another data point from an X1 Carbon Gen 12 with the same codec and
SSID, which behaves like Mike's: the pop is still there with
46c862f5419e. Turning AMP silence detection back on at runtime removes
it, with no kernel rebuild.

Hardware: ThinkPad X1 Carbon Gen 12 (21KC004TGE), BIOS N3YET86W (1.51),
Core Ultra 7 155U. ALC287, vendor 0x10ec0287, subsystem 0x17aa231e,
revision 0x100002.

Software: Ubuntu 26.04, kernel 7.0.0-42-generic (based on 7.0.14), SOF
firmware 2.14.1.1 with sof-hda-generic-2ch.tplg, PipeWire 1.6.2,
WirePlumber 0.5.13.

I checked the compiled module to confirm 46c862f5419e is in effect:
alc287_alc1318_playback_pcm_hook only calls alc_write_coefex_idx, and
alc287_fixup_lenovo_thinkpad_with_alc1318 calls alc_process_coef_fw
twice. So dis_coefs runs once at probe, and en_coefs isn't present.

Symptom: a pop about 5 s after any sound. The sink goes from idle to
suspended exactly 5 s after playback ends, matching WirePlumber's
default timeout. Setting session.suspend-timeout-seconds = 0 stops the
pop, but costs roughly 1-2 W at idle on battery (about 4.4 W against
2.4 W), so it isn't a good workaround here.

Runtime test, writing the old en_coefs values:

  for p in "0x24 0x0013" "0x25 0x0000" "0x26 0xC203" \
           "0x28 0x0084" "0x29 0xb023"; do
    set -- $p
    hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX $1
    hda-verb /dev/snd/hwC0D0 0x20 SET_PROC_COEF $2
  done

Results, by ear, on one boot:

- Before the write: a pop about 5 s after a bell.
- After the write: no pop after two bells, with the sink still
  suspending normally.
- The 630fbc6e870e scenario: a 13 s all-zero stream from one pw-play,
  with three bells from a second pw-play starting 7 s in. All three
  were audible, with no pop afterwards. That was one run, so it says
  little about the original no-sound bug.
- The write also works with the sink and codec runtime-suspended: no
  pop after a bell in a later run.

Not tested yet: whether the setting survives system suspend or
hibernate.

Since Kailang confirmed the same SSID shows different behaviour, is
there something I can read from this machine that would separate the
two groups, such as an amp revision? I'm also happy to test a patch.
From a quick look, master still has the probe-time dis_coefs call as
of late October.

Thanks,
JF
