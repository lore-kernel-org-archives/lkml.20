Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792504349;
	b=DCSqVhoCWtrp0sdM3d67wuqdH2lTeYoKqhAI863Ftk0CJmFeiE04T9wQZiMNS5g90vB+
	 XIyMV00sXOZH/o/LGMjhA6auCLmnv+1PnFxeyf1TyjzZN8JGI+Fk86AR65CIRYu5LJHuX
	 RI5GBkqCoFcWLQD1sBnS+aAGKqqHTRZTmQyo9KzmB4SRyFI70IJps/pWeX+JTh40ZByeD
	 qpD/Aor8eIfVBGTTWednuBZ9/Nlm7L9414ZlBgwJYVHAEbge9JTSVOaBEcC1P7cdZesUA
	 Jn1s1I5RNyupCoPGAtSfSBcTAGvFhWdOvdp+B+CXdd9+iNxWT71usavkpngdvnNA0dA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=k/hbwlcYMnNfV2mBX84KMoYZ1kQ82mEtSuTGwp2XYJ0=;
	b=x7t94moZFO1rw7Ymg6YZ2YOuIPY/H0Kjc8mdbTR9SWf8QSvUiQ4w4EFFjey9TqIiLUSB
	 G1QCv3wWbC8O+oKQPTd5a2MV7eOwstEh4inxDXew5z7osHXTaFditVQv2QSKPfe7IMiHH
	 rGkLsbcrYyfH8xNJl+ySmkgemHNfbj8lcqcoXQ0Ig+MIWFJnd6PFxwiAtUgQjypHfbOil
	 cUcWVnnXrfxJgiHbhr+AYwudpDNNe2xg82O4Yn3TAV8tpgLh73C3UzCdCBQ9DPDoznNV+
	 8BWC3ngdGlm/boJWJ+U/bv5bidkZPWfc8cxIGOpt9MM+dxLIjfVnCcoTkzlgpFcylpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IV2bjblS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB96606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DB96606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IV2bjblS
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a064dcfcfdso597562b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792504348; cv=none;
        d=google.com; s=arc-20260327;
        b=WPYBCGG9y+Y4yCH0wksoG9w2WcD6xlmrPp7KQkLirKFfEGVOIRZ/bbhjXA7Y13L6G9
         QsaDcBc3RF9U6bYFF55iFyhfSyW6NOJcMjsyljXwwujIjQDADXTk+bPDB4gWNlW/MfNc
         9BCTJVIpkpxrEGk1Sb+g408eOqrrr62AM8oECH+qF1Q2Vpc+nlybvaaAICdNNTEgOoVV
         JKToD03/IqSGydh3YpEuzd2oY1Pn2hzb5WFfLoWGX5JCwaHLe0RCtCKskB2Nu+UNWRMl
         2Ncl5dFK/Qc7uxZOxkuDpo/oopa/goHwrKUetlDZMfmCR4YZhcgbRJrtvglP5CiZzNOU
         Xziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k/hbwlcYMnNfV2mBX84KMoYZ1kQ82mEtSuTGwp2XYJ0=;
        fh=5rSUPMOnV17DBdm3PI+rZCiMl2PPAOgdn5qU3258xbY=;
        b=I85vuaZd3FjIz2c7w3XOLkWBA4NbwdsJ7FNbpcTMqJ+2GduvwFAErrT/ogVNyg4aeb
         n1E1m6e2mvtd5ZElkkzi+XK2iJuz+DkaO20Hctk3eq7ZI7/LJ5cGSTvZVBMyh5YPX9HS
         XUhL9JZ8EVb95Ja2D9BAf/oJbzFUj4FVfawQlwVWnKOSYiQDsDTz3In9vrDZ6yvEWRyN
         7mlWQm3eLTHi6zXC7YpZNhD4ucol58SMa8xxZ2v9U5OzFmmReU9MfyOBd6D0legqjXqg
         qYTAkw+1hHn0GP/6/uis4PqRWw3YTkF69rRySre7hQXohVFXSUWuXz4kakfWgYJ20FGl
         Nd5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792504348; x=1793109148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k/hbwlcYMnNfV2mBX84KMoYZ1kQ82mEtSuTGwp2XYJ0=;
        b=IV2bjblS35z+WtRmdC+d2NdVsRgCEc2iwHZCl7nN04NO7e2vjqFjw+Kx6HSekD8k2E
         /NPZRHZ2d9c1Lug7zCFOG0L68NjXSPPtKPzbZDrCoc8aYx91Wv0bQUQUtgRqVZulPYqu
         1syNEVnV219YTcsBqwsBTN8OTqFxpdGQxQXvZjeKMq+Ep4Z1SjPPQ2wtKwOxkoh5zuly
         P4+EdYiXsq+MlyOJePp6ZT18lccIxbzkqhPTQ/AorTqz9PdbsZePwazefSSyjIBhqVlp
         rbcM+9y4QEhyT9xZ5apQ6lMNz3ew0gGjIvKSy+Cg69b03SN4ZpNYRn/LcJvQzq+77ydf
         +7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504348; x=1793109148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/hbwlcYMnNfV2mBX84KMoYZ1kQ82mEtSuTGwp2XYJ0=;
        b=1XZxuq8jhnD+BWFaGmA/7pZ27IRk3pN/umhs4e/UXOxBFAe/ftux5xTxF+FAAvCqhg
         9eRkXKJWYls8knibRsXbp3YjN5+s6Jh2Bfbty976kVrtoQFqOs6RnrIDJVOr7K73WUKC
         ho+nj8X3+mUoE8ZK00TX27PRT+7wLlE5p26/qlud6fzhVZyOEDzLEa8CD1E3tqPMgo9C
         i1V80B+7UhtSIWUHUWuQKJLYpBOZMiK9kdE8alL8D06BBO5ahPdmYRrTVnpVan32curY
         Wh2HigGswhLwxW0rZaaiMXF5IEcBZCDkFAek5KPNaUNtURtjUWoofvRbUh02cZmjz7AV
         sVnA==
X-Forwarded-Encrypted: i=1; AKwUvBxjMA6sI5uRztPyYk7iTSLbnV9mWn9mLToiNAhwP+Vt4y15AbhJIv7uOhre6JyS5o02rHQ1cZTr7nMFDzs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKofIUi/QWiYDpWbSNXMMS3pyaMl4tKZ7cowRU0so1s2gKL2FTR
	nPxPu2An9ceMJ10bDMNmcZtfd/LbisUynuiWmkr8Bwn+7088ciGpebm4SUor+KwzWveu1MRzGLa
	mn7tCPVG0y4RGzZC5KbQRKYe9evHp8l4=
X-Gm-Gg: AYBFou3Aiwc/L+mF1UNyh5FBqpd+bC1IadIA1A7LLQqo/MwgLv8AkVE24kl0fPm5Yd4
	jTr+vQJpHSZTyNQ7MPKXrRYGOB+qatb0xIOq8L0/hNB6uyPazUy+m4R2kX+rM1XE5GOBjsQ+KgL
	JhEujQW8nnemW6auoQTtm+Q1E5Geb3X5+/1WCTTK73eoFrZOwj29Bqo9GccGXr35Fol5XV/2gXy
	We0ZZoEXKEoX8Mi1dnUacJGtAHzIelFTp9uucRZhUG+97KwBRsvCjxXyBo2OXQj4foiVZv7cypw
	aVeMtcMwzq+RSmojN1sJQtsJ7aY5rG0fgCZ+RLXCNAnn9GTFJ8ackxovKbmERWhPxKOGOjtcU3w
	uBGu4o/D2HutPhsGAZL6ULSk0AiTTDblSFYOEehTzeQO0fxf97e+uQ1dEFtRNybZALkHuPzTfsg
	bgv/+0lWDLVkWgO98MuMcQctGz5t7aQ1+wAYzXCw==
X-Received: by 2002:a05:6a00:2343:b0:89e:9c7e:fd51 with SMTP id
 d2e1a72fcca58-8a04ba30b92mr8261328b3a.10.1792504348492; Tue, 20 Oct 2026
 06:52:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019135441.1420968-1-sashal@kernel.org> <20261019135441.1420968-252-sashal@kernel.org>
 <20261019172836.GA1885@quark>
In-Reply-To: <20261019172836.GA1885@quark>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 20 Oct 2026 09:52:16 -0400
X-Gm-Features: AclHuK-B306P9cHCODywZCNc6I1CxZirkEbtUGcvZRPSRQ2med4P2bdTR4gz54A
Message-ID: <CADvbK_d3hcGcP21Fy_z9hkoSuQT0Bg7111Ejns_WxOYfCCGFHw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.18-5.10] sctp: auth: propagate HMAC calculation
 errors to callers
To: Eric Biggers <ebiggers@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, patches@lists.linux.dev, stable@vger.kernel.org, 
	Qing Luo <luoqing@kylinos.cn>, Paolo Abeni <pabeni@redhat.com>, marcelo.leitner@gmail.com, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 1:28=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Mon, Oct 19, 2026 at 09:49:03AM -0400, Sasha Levin wrote:
> > - Residual in this tree: `crypto_shash_setkey()` failure still `goto
> >   free` without an error (mainline HMAC helpers no longer have that
> >   path). That is preexisting and outside this commit.
>
> I don't think this backport can be considered complete without handling
> that case.
>

Agreed. We should return the error from crypto_shash_setkey() when
it fails in sctp_auth_calculate_hmac().

Thanks.
