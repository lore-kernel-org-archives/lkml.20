Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794172383;
	b=LIGP1KXUFv0nX9ZLMgmWOp6dTKeU2852O9TFc/V7/VSd5ip0X9osHdoWp/o4E59tjVIg
	 sdmF+qrYfqsuucyhBG5w66vnT30D1Q+7xXNHmvw9UvRUYFRy9mFH4EDED85llA9v9n+yv
	 d5Updr7tXm3Y+XXG3dS1y0AflPsFs2CLW7m/VaPKdCTVpHlYS/YjVqlMn7rzlkQpymc1E
	 8AIM4yj9KCSzGj8QMx+nE6v7oGQluJRO0VfEI25gPpo/sVbf8MAeplw55EO2oaUabs9ND
	 k3sTPYiLst/hqYxCz6JpJElSgE7aeHUEAkhhcka6pzjsyb4PDYeOZeGp6TQ7jT872dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yiUBaJeEoNZmSx4wusGC1LfIu6NLX9ueZ6F9sYiAny8=;
	b=BNaTNyvdpT66JTFvWL7opWt6m9FkMzc4Z3CiNenw4yEeH1dBsHmFyreXF5o/phwsDBwL
	 Af34D7dTMUUTC1eAL8zDxt9LCSrlvYnyhIkhuI3g7MV9F2/B/A1GRlD0bfGJp4UKHXwGj
	 qvLZZBY2KgGfXhQbMxsHd78sfJfYWkwNmq4JiB7JHLHVhE2FlhyC1EtO/DR6GoT7PrcVF
	 PnZ6TXiCGbVMcxW03gCL/YUBZMhtLO7r7Xq2VYkBMKex5awebr5KJxrm7hK5k6UF3LcYE
	 1xtGshVktUwS6aIOclo7wbetkyh86rGdab8mJxl9ZkwInOvqeWQrkdaCVWkiBXU1qmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=pqffzjLB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8ED606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A8ED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=pqffzjLB
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67921b515a7so239210d50.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:13:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794172382; cv=none;
        d=google.com; s=arc-20260327;
        b=houJ4RlqYCLkEa4rEbxEZznRTJo6n/HUfAg3SJ18u5Ji+s5gpRn9XYPoQVz6R0F0I8
         fBBYimuj7KcM1BcBHssbzh5YC+kNuTN6+Qw+pWZl/s6gIe6aZaX2Mcz5uDzyOJ6fFavS
         1VTurqoYhc+FgiE9Ot3JPqySzP9aQs5bQZUlfQiikJsUT4Sfw55zy65DqJ+7owF2jl8F
         Dwfslg1zVphdTEsyvnNGiaQXeBx8uiPqUGohws5JaEGWqrDqyVLntZGReichyLFYrrRC
         U8fTBjbK9YlHopVVdISZADv3drc4Ch+5dGcDFJUzCZAXc0TNjnRG8h6ogw0DnMOQ7ToM
         g/6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yiUBaJeEoNZmSx4wusGC1LfIu6NLX9ueZ6F9sYiAny8=;
        fh=GubgQJtdYk1aq4YqHTjz2uXkkYQRjYYmdPaIzSV2Tzs=;
        b=NcH2G/nn8qa3t4lRuM1eWDgd3Azcf4tQWpsmOhPvKIQFegYNPhwa3g67pKo+e/X9R9
         3vLbzUE8kxhWerYiAW79m80RdyVITyloubhSh7M/QJVoMyMgKSMWdyhrjGALkHuBXDZP
         eColOskIjOpkgbjoRJmJLKchScCzpYHlEY9FYOJKhvdAP1Y/LWTzGCvAbs1XfwMH3+AM
         NXVXuoBlSAyNmLTkGA+DHEsfczCLKUUqlCFyOFE7LfZOQIts9i6DF1yuHesjZBlP775Y
         PjTrzEaWiI5eFqMsYW07pDzxWAGE7HGioKpuWff7sC+Ftvi/LLWwprnjzcwFA320oYfQ
         7scg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794172382; x=1794777182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yiUBaJeEoNZmSx4wusGC1LfIu6NLX9ueZ6F9sYiAny8=;
        b=pqffzjLBdDGNrfHUi5kCes/ULy62J13uQQkGThThgnMDZNzJ+gUxu3e6roaR6ck31d
         fRwLxWlkBfGNWm8/uEAQ1UvjSv/rAdjTp4+wvHgX4gI3KiQ9sFcvCgZzvbZEEbRbhaFr
         sCv9kiRelvwO1+1flT1owAsmcTE2VBWbukd1mqQ9Uo9QGFL1BKp02PQW4pqpvTj2no/D
         KcaQWbRImQ9GgQoU4eMui2hmBkrglw4Ee2vhVn92O2B2goN5LHxGGtiKK0j2x+vdlKeV
         +FCgbnYAeETXlghQHSrdGe+rfYP3XVvTV321FcbgTbC3gcyTAtqsvkMIale7nrytTOzv
         0vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172382; x=1794777182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yiUBaJeEoNZmSx4wusGC1LfIu6NLX9ueZ6F9sYiAny8=;
        b=OcMkKtgF4UTp4QDFNta34xKPD82Aro/LwFeo0AQBCLxHVQW9B2l9y5sVfRZCnoQqoh
         DUjY8Hrux2Q96nC6O3ECTRJiObbNhHJ548XjFI7EN+6U0rKWFGzgY1cU9VvvbcL5FAIL
         e8JD3H25C8CkOdmbot/QwCAvAiRn1WA6w6QhoMD67sjW7LAOm6zl0XT/cobTbtokz/PU
         XWMIWBl0s8td2PROvnxPTaT3s1XfDNa/iVVjbajHXctSUOer0rewSI+eLm3bKGK/E3HX
         zTiDUi/5f1fEhq1UfTxfhMfTqpLoOkg+p+eOItUOH7y4zk7/I8ogspSFK/R3qGyP5WaK
         pdEA==
X-Forwarded-Encrypted: i=1; AL+hErFy1THAVWX/hJ4QKroUFKfVkHog+IpeYlWksYegubHI+6XOWbivlkjaxrZIUpMK1hp6luPRuimxnBvcDFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Htz3vULchRzEp2OAd3hdTZaI8n4icXWJsw+iOyKdQ36tcgoek
	/uUhpWtAizJ8IEvc1Fa5tBxufoPGWnC0cfDhr8Tvkj3rGkYXySYjwk/XMbEIAJHWL4haeZdmG3E
	zdv1A0r5jGd7hV0UnWQu21d+FZoDYXO0=
X-Gm-Gg: AYBFou2HTU1qBI4Cnr1ode430tND+NwRFqa16GbcnOV8ERqbbh+4z9n0uf9/Cicameu
	TfxwVDaGYXYfsqVy2gyhGx/3SXtjQZFSioa0x4sDMBnwnPZMm2KUYlXTQy/+msu3urAMm1n7t70
	7DR0pgJA6/WThj+go95rI1hqVi6rPnBkcfuqEtikzEzy9AyDEE6bydJvAObNRSGc9bYWmBKwKnl
	9i0BY30n/2p+6Yfa0WzZ/SxAOgWSHOEDOm6nwK7z55umZRmxeG+jlcdV5NOj6WJAWOpWC0iTFTi
	CK7aNBotwOgqh1eChhxFngKDm95XLvWvfpavicDc8rv7lHLstdcuKHaXS1o14Xt1CyyttvkPGg4
	r5XcRc+eof7uTdePJ05P+6gSc1ghNlzklu8dqY+YGiKdYYklacJrELlv2qP/IxKaPxrbNyYiEI+
	tcadXy9jHe3fs9nX0=
X-Received: by 2002:a05:690e:1917:b0:677:ceec:5eb6 with SMTP id
 956f58d0204a3-67c3da75649mr1372951d50.91.1794172382380; Sun, 08 Nov 2026
 13:13:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106101913.46664-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106101913.46664-3-christian.koever-draxl@student.uibk.ac.at> <CAFBinCDS_toG+4BySkUoXx73a2JWtp+tD6NHwYHk4mU+p+GF=Q@mail.gmail.com>
In-Reply-To: <CAFBinCDS_toG+4BySkUoXx73a2JWtp+tD6NHwYHk4mU+p+GF=Q@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:12:51 +0100
X-Gm-Features: AclHuK-s_rDsDj1PWZlIOcV5ImuQxceuPlDPh6uQEE-d_X3ekVMWkJWbJHC7kWk
Message-ID: <CAFBinCADS55=UYVXRFkavSXQFtpCGG-wiXG9r2PSRWPFnppcww@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] thermal/drivers/amlogic: add S4 support
To: christian.koever-draxl@student.uibk.ac.at
Cc: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org, 
	rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 10:07=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Fri, Nov 6, 2026 at 11:19=E2=80=AFAM
> <christian.koever-draxl@student.uibk.ac.at> wrote:
> >
> > From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> >
> > The S4 CPU sensor reads its calibration through the secure monitor and
> > otherwise matches the T7 setup, including the separate bus and
> > functional clocks, so reuse the T7 data for it.
Sorry for following up so quickly. I think I mis-understood this.
From what I see in the dt-bindings patch the thermal sensor(s) on S4
and T7 are fully identical. If that's the case then sashiko is right
and this patch needs to be dropped (and replaced by using t7 as a
fallback compatible string) in dt-bindings and .dtsi
