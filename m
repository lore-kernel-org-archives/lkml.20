Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794154549;
	b=pgX8OQEPVVWjh6ErGJOUaqIgcH8Qiglhoq0N5SCa+D7yrPxtVqAMLiyDns2Qs/3jAFmz
	 nPMPsP+exscOfmu9KFkfXsY7NfS4sjlkvmaJeE/nMm7MXe3W0U5yDsx0AkXfshQwA3WiE
	 Je2njZlRQswkhgCVSHcB3esbBMLNu5SCXc4rkHmgHiDss1pyJKapDEt8NJYKDXH6P+Wy5
	 yKW1yO0/UTScfFEM+rwbpdSW2RFHvj5gVKlaf+H9o1d1o01CWnjhQniGr2GOOY7wwy5oY
	 7cxP2UpTuu5ruU7/YYhErlsMAUD8SOSm8sgiF9RZ+ijGgod4ORcgD4hCv8xo3x8/yig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794154549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u3cnT7HpHVl98z3Dg/6YlNkZdQb2f3LtCMLg/o0kNhA=;
	b=jh+EXGtGCBUeDsYrwAhgPV56RmSzUblvYDVQgRi73pS2smBR7ztg77H+TipG53ongLOg
	 aVgZKO97vx8J5jlganb5jOTINy5JhphTxqmLBe+DSv+oB86FI3ZVUOed1+Coq7kukiJts
	 hzUfQ6LJwFmf2+iIrD2SRrk0QBVOeE6BfSwoybUwnHyETQsQn0o3g9av4paHzg8zs9Svd
	 zS/tjTWDzcrJWioKrgxsgR2FnH8E9xzzRygh8uL5naML1lvR7VNPtZLa1r61z3QFLsrp3
	 tf4HOmcZTBTiBYmTBz65/PLMLJK897wmrOTMOwhIc5c+UT5vyKrdF7D3EjFs18mDwFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PatqLmUl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1E0606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C1E0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PatqLmUl
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so406035eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 08:15:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794154548; cv=none;
        d=google.com; s=arc-20260327;
        b=WDI6ZlrPjalPNBUgD6hUlB9eZT0t453prGrxrDsbJGt1tzIumI3F8RGF8/Rf4A4h6u
         pQY4LiS4VSrVoMVSHFE7hkB47uOkzoIT8y/9hlqxG7BN42ncubfn88nOBbMppn/hf0R3
         FDn+AaQZcOc0v36q7CmwkEeBQqy09NMP6YWuwMHIYw9lMstGW3yrubC/oYxBLvcD+pPN
         ggKCEwb55aaFxjbWXQXGA597bUdSpkOYObTgCXvVPsOTJ9r1QmXR3VooCp2mBCDbQ6YX
         FzuQG3Z6jEZFSbWEp0N0Ty9ex35Za150W7EsvRJ8Dtbb7NVixW4mCMhNCVgt6L5T3pfY
         RUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u3cnT7HpHVl98z3Dg/6YlNkZdQb2f3LtCMLg/o0kNhA=;
        fh=+wjJe5PO9t+LAyhDBqHKDUNL1Ulf2pl106Du+Nkm5wQ=;
        b=r8nuRiiLVD+sQP6sEPt1ofjR2aD8HkNOzxuUbev5SMqN2CrKxE/GhP0VOOCV0y/fvc
         hmG5E5BzbN7w+plzk9RKBGWGVt22VaD4v7MeZ4djtyC03MZCvorouDRezOLWOXzNeL/Q
         hAQXlbNL3T+wdxQJJGpCvNj0gHZUFGObDa1GdEqosBpuRQVaQhDlr2oOC161qi64F0uR
         qjJGBOpQo+9tX8S6KFZ5PYEMw3AFfF6PdFwryqSsjSzyiVwvaIJZ80f7i+ZiORiHeGc2
         UMc1ZVYuK1n/bzu1F2v6cN7JehZdGEQtiqxREQN5pyXcY4uytJ4356lVoec9jBwyK98m
         zcZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794154548; x=1794759348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u3cnT7HpHVl98z3Dg/6YlNkZdQb2f3LtCMLg/o0kNhA=;
        b=PatqLmUlhcvjr6Th6h7fA+Sym1vHgKml03Doo1jlKHnHeZDTWWxnbC7h7HNiWZKpwQ
         Yad5xKEBBB4vUU4MQl6TNwLj+WL9m3VAYkihbU3kIvCSMk5+CtvUc4qXLnZ3d10I0fB7
         ijHpX1q+Ek/xXaBm5iRQSBvSahQoAJ6IbEmoMt5q3FCzVUe0DzqGyzvESBZ0cpFK9xoX
         c/KlsxgU4HR90Qy7ZGCHi1wtD92JaqSHdHp8MnEcjIx+kmAEEcLtmWcyIfjdU9qU14WG
         hFmGRrMRG+MPaCmOsaa6O9BTEVjcMJcIhCsUP9KrUtCNyhEGhXZjJEpSsRt3NiR1WkYj
         iYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794154548; x=1794759348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3cnT7HpHVl98z3Dg/6YlNkZdQb2f3LtCMLg/o0kNhA=;
        b=ExJJ7ye/XGGkVHDefwvES2j+0Wp1g9kD/O4w2ddMMHNq2LEZRRvyuQ3YzLbOZWbIFx
         PqmutfIYtke36yAERUGMXViaBlqk8H/28kwDldRt+94ELO7Myecj33vOip8nUqQvjKFx
         5EGeCDAiBP0tgi2U4acyW5sKcmYS/QaGho6kj20eekXeZiHKbZkGfm631FJ/VPx4iwOx
         as3GwtgTpxp3ptGCNHIARqJGkd15nZMfaYGxQ2VfIAG9IqPz68kEsO4TB9Wc2gtw31XT
         oJyvulPGkn/aPSNONsVW5LOPRMx1YrHG/Rj5ooL966I9uR+cKiZys3qEAaml2to9sAIc
         NsZg==
X-Forwarded-Encrypted: i=1; AL+hErFo9f0vXihZ20na42mcR5rtMawlilv1c35I1/sC8LYPGRvh37yP3GJTDavUnUf4zSihn5aDaBPsuLLcA7k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h3TUerb0hysno/SbxkPG5OLyFWmxM+hzjpJp9aGWfv/vx7sl8
	/FMNTABfNlJqmagcFAZ2pnn9T2Vgwz8k8vKW2rAuVzR5n+OcYI9hU0EI4PlAIrmhGQCkrfkBojL
	lEtfrp9z1D3/W8ECoZArHeuvnbgil6Wg=
X-Gm-Gg: AYBFou3cLHp+2twoHqjZBpoKuT67vKwEWDFW8Kzkga+GbJ+gjoSN7Kn85mwJU8zQJ5g
	pqn7Os1q2HY/Mm2zJQzd+1a46kyBcRH/n91C/ZVY2AoBW+Ddt44LDAf79t8R/CxeGtlq0OS2cmL
	DMaMhK6W1L2QH4Zbm7a2GGbrqQU1kscK1JKoUXeREeILzdO3MwevJ/EzlLffXH4h8qLw9nxtDya
	t38LggaAyrQRKbX3xrlMbzmhEaHBGnfPJJ3ZqKijj3k7rXKGsvyM+wnsJChkbJ+ItVtmpo4CNof
	a/ipaYOLqXBgqKzXD0LD06H129TkhekR+5rS+gTAmXQscORZg9GH/mwsuWCcnsi0OH3l3+Z+bAG
	4eyZcIBfM94uMmQA3t8uv8I/E5L1xf+/8nVKZLH+y8plAtZXadj0fm5sntNBZD/uhDHIrLDAvI0
	fvm8b37PGjtlT6A4x6+dS9TKJSZPdS+Q==
X-Received: by 2002:a05:7300:87:b0:361:7ab9:479d with SMTP id
 5a478bee46e88-3725e34086amr3043054eec.27.1794154547628; Sun, 08 Nov 2026
 08:15:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108154241.198160-1-huggek@klattorp.se> <20261108154241.198160-2-huggek@klattorp.se>
In-Reply-To: <20261108154241.198160-2-huggek@klattorp.se>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 8 Nov 2026 18:15:36 +0200
X-Gm-Features: AclHuK9_E5rFWHmjd6VJiQbI5thChlB3L-K94emAWszn3iblcbzKAB-4qYiSIQY
Message-ID: <CAPVz0n1mr22nZkHuYSe1pzwv-iQqAKC2Cuhx9W8nibf=-BXU-Q@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/3] power: supply: max17040: pass the device
 fwnode to the power supply core
To: Hugo Karlsson <huggek@klattorp.se>
Cc: sre@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	matheus@castello.eng.br, me@iskren.info, krzk@kernel.org, 
	m.szyprowski@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 8 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:43=
 Hugo Karlsson <huggek@klattorp.se> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Since commit f4b782af61ae ("power: max17040: pass status property from
> supplier") the driver forwards POWER_SUPPLY_PROP_STATUS to its supplier,
> and the DT binding documents a power-supplies property for naming that
> supplier. The driver never passes its device node to
> devm_power_supply_register(), however, so the power supply core cannot
> parse power-supplies and the battery never gets a supplier from
> firmware. The status lookup then always returns -ENODEV and userspace
> sees POWER_SUPPLY_STATUS_UNKNOWN.
>
> Set psy_cfg.fwnode the way max17042_battery and cw2015_battery already
> do.
>
> Fixes: f4b782af61ae ("power: max17040: pass status property from supplier=
")
> Assisted-by: Claude:claude-opus-5-5 [Claude Code]
> Signed-off-by: Hugo Karlsson <huggek@klattorp.se>
> ---
>  drivers/power/supply/max17040_battery.c | 1 +
>  1 file changed, 1 insertion(+)
>

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # LG P895
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
