Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632459;
	b=x45quMQhaw959kndP2LiTLVCHkRrdi5fXAqLIZKmF3w2lSKK4na2+NlgLHX2Ymwcytkj
	 hRcrvV7FG7j6xQQmSuMEaB3J0BZZHKwEO9hyCAAV1vjVUdpL0toMbxsar7D0KE5/r/+/P
	 O9hO7wAIv6KaO2725BcfUf1rYpDfQ8nDfchMjk9KiKx4lnjFl8BQiRZfv/wX3rEwKjZL+
	 H6s4oQY8fLVik/gL+sHbMyZ1eXNF+V0qqMMQb0mSKqQCcjDkrNFi5TNYoq9jpsgg7bFG3
	 Tt+kzds7CCZUCtHUrXH5bPk15nb+qlj5h18CrVVsfxMYVROV5i5ruDVvOT5sHUobCeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8yUDlmlI3+iGrY/dSFtrVmA03ksQdMmCOwxVGGqFig8=;
	b=AwRwCI755blYwkXK7yV1ElRl5TVDw6kI/+CLcOdZjcSTI76uo+4bKIFa3Lh7RU5CmuL/
	 Mtmp0kwMPZEl9f8c6sj4ZTFOcKOrn5Lq9jgCn2mIn/GquILTAcAx1AK1qQeaUG2riU1kd
	 3uz+aZPjWXAaKUv21RA8X6lniudGrN5qqAQ6PSkYnD3TjgJttlvml8pe/UI0ZTlaOFGh6
	 xaiCDjdtC2bfepnCEtAfWmSZHfUQAG4ftvShkqZsXeQPKeIY4uuAtAC+RBzEahXHC38sE
	 jw0ybLbOi8fEm9IA7X+9GS0v0VijHnEl5OczjT7itPXKySXeDzmOwWeiisOsgxH9K/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UW7VBpmb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A206079920
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7A206079920
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UW7VBpmb
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1ae18eb9b69so2056508c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:14:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632458; cv=none;
        d=google.com; s=arc-20260327;
        b=T8jT1c0BqReX6XHAkyZ210xj2AQ8cjIhxw4N4fd/p/6PBF6kc+kU8ii1aZFionJVWj
         q5dp0ozTYSNEokYHTksuNqsETm8Mems6xI0FM5puBSC3IERIs94yBs0TvyBap78yPOwz
         FjG7mT3CzyQgQUTlsQqa0PCGZ829dgEbhOMNHnu1tDVx8/5yTA2gNUDf/Cp9ON1F3OJr
         2uZ1An3QwF6Smg3HQjRTmi8b0MyNPnoBCUXPFiYT3hO/Xz6XHG4chaLneYDwH6dC04gw
         FqaBRkEgFIYrTIwSDeAaVa/fLRmhLQVukUk7rJkPSEq1j2xoOHG3qJ1SbqUznyvnucDw
         8srg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8yUDlmlI3+iGrY/dSFtrVmA03ksQdMmCOwxVGGqFig8=;
        fh=A+1nxdbE076oe1iee+mqODIuIhtgKCwtQ7pm2SWAe6I=;
        b=P4oWP0IrZRNxHqvBsFf15j2ToTSJWF2LBDsKO1flYO8QCI788XMnRrgbkQbzBK8OoK
         ve2GxGlw8WUGM8qJOuxoZh6969hk0pq9lMaRrFIWt3cSpqqfC16qUGAwqSseiP/666En
         cMJlquXwnt4kRKJnmFNzir537RST6NxB00p2sxBS+1OxhkM/DHyuCrSxH/qKpBkMxKT9
         0kI7yh+eUaj9QDT9J1zhlttQJj09bQTWZb+AWDMbwkLmUC3ga8YFvzq2Qa2C1KU/xqON
         TR8/4PHDRoTl1bdLV65nzE2OBlv8PmhxN0RrAQkRVyS+jcIFjb6XUK9y3dMV4oRI5nwX
         fk4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632458; x=1794237258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8yUDlmlI3+iGrY/dSFtrVmA03ksQdMmCOwxVGGqFig8=;
        b=UW7VBpmbA+R7DgWQFPW1YmAY8EEK/fr3Qcz+/ZtZMHh3wLgj23zleU/MciwV0CmwSq
         IIuqZfkmPs3AwBptvnphkRMLtpt+UDKLbzCQwKa24aSr4rykHGAIvDxlWUmVFi90sfuG
         uqCU95uYYLJaNtDOyTNUsUnDiQo5qc/zfao6V/KmjKLOsCZ/3hYH42y4QOSYpKqezXAW
         h9EatqWdNcrVuEnzf2oHuoPVnY0/gmdOge33hsezVh78T9O9R82VQyfICQcF050uYbk/
         liXbFDcZm4ya6bzjDSVdpj9XHvD/40XIpRvhB7R0ndP09JwC72RtKYUdm0JwMjDu/fTJ
         T9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632458; x=1794237258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8yUDlmlI3+iGrY/dSFtrVmA03ksQdMmCOwxVGGqFig8=;
        b=Rpd/FQpOmvsqLMVNKygEvM25MdoOmhMBtreZDsV4QWUwIafBxmCvBX5zvKgoBvU57x
         o/vrC9RcMCCeNFm1r/lJ2I/MWBKhoIqgPvG9u5ZNCgsWvtHT20bYTcdtCUSKj2IGlAIy
         8AMB6e68g5IBb+ereyQpJI1/fGIkR+6YGVy/Nx8HxyIyVBNNH8QgZY/WmPfkMD9UhZzQ
         pUXQiQebP2uh7TpRp+O12j63chNWaCTY5mYWliqdKvG56qXCz8AK7UmaxQciONNA5O8N
         6+UZ+qErXUro6qOeO2JxGNy5iya0GQDi3NwOegTvG9jaFdK4JHBhezwA0DZCY9Dx/AR9
         TF1g==
X-Forwarded-Encrypted: i=1; AKwUvBxgEKytjjw25jaGr+oUkR3b6aIvA62OtEtCBCQfHoM/aA2Vrxo6JdZNy1UOk98gCIXBxznva3M/jxILKv0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHQJ6hVu2wDKIdAOkQ2SvPmsX/rLWB7XISOpbMJlb1MSQiYgx5
	UIk099Ub1PincqqFD/a6DipSy0H2Mo7h6PkOMZJ+L1qAQtM9COu6UrxRaa33jp3OIwm2r/KZ41+
	JE0dvSFd1jWd+ULvNdmBDxRdrajo4ass=
X-Gm-Gg: AYBFou3GKgxL7uWJmC+PymZ7cVmVXurCtEb+fTBxs+wKzSVKeSk6MiBbnK2kX15KaT0
	bgUWll0C28eqtgsCg10TtLxAAqVwkvSbKqqxAuTD411AHwXAUebYsQM8aWY5lP/PruYTxsF39WP
	7SiBMn9wLBS1lCg+mD8wmc/xSkNtjgJZXQ1FyRSfmIVzhONFMgKTcu9lnmEU8lWvz097A7CJkX6
	4JQd9H21T+MjGT2hHWY69etAiTfSYE0unVnuU8Z/CsXo/FjndNPT2nWWZMXek/dAJ44/4QMKLkg
	TUkDNFHVoGjTEaKvauvGkW7Gv5NyHtFk423Ixs1hWlkY4uNCjcCCqkd7nVOza2qwprATZSf73qR
	ON1U5gsLg33ehcziItwIhkMUMOPmbj8AKEZtW61H7RgstUmDvxEhxKAtqvlhmT1tleuCmbwwwye
	EtQWdjxEc6B/AS
X-Received: by 2002:a05:7022:88:b0:144:fb31:a597 with SMTP id
 a92af1059eb24-1ac6069cebdmr14582009c88.47.1793632457694; Mon, 02 Nov 2026
 07:14:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260927131838.6774-1-demyansh@gmail.com> <20260927184414.6c0c8867@pumpkin>
 <CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com> <CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
In-Reply-To: <CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
From: Demian Shulhan <demyansh@gmail.com>
Date: Mon, 2 Nov 2026 16:14:06 +0100
X-Gm-Features: AclHuK9s_qVGMHFu-dL36Q48-lWDPnNvO_Yb6GHSTKkiWePXFsWruUJSaC8neac
Message-ID: <CAOLeWCu4NiedyXmoLwwnTvJitRwgg6PQq9LApO=k36ktN3-XWA@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
To: saeed bishara <saeed.bishara.os@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Marco Elver <elver@google.com>, Ard Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
	netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> The scalar path seems like generic C code and not restricted to arm64,
> curious how that performs against existing (e.g. x86) assembly
> optimized implementation.
Depends. I think __builtin_addcll() is needed to get roughly the same
performance as the asm version. In my tests GCC on arm64 turns it
into adds + cset instead of adcs like on x86.
But I will look at it, thanks!

=D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:44=
 saeed bishara <saeed.bishara.os@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Nov 1, 2026 at 3:34=E2=80=AFPM Demian Shulhan <demyansh@gmail.com=
> wrote:
> >
> > I would prefer to keep only the scalar version of the fused copy+csum.
> > It reads the data once instead of twice, and on real Armv9 hardware it
> > cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> > depending on the core (+6-8% throughput). It uses only general-purpose
> > registers, so there is no FPSIMD state to save and it is safe in any
> > context.
> >
> > If you are OK with the scalar path, I can send v2 with NEON dropped,
> > the scalar path only, and the KUnit fix for the x86 zero-length case
> > Jakub reported.
> >
> The scalar path seems like generic C code and not restricted to arm64,
> curious how that performs against existing (e.g. x86) assembly
> optimized implementation.
> saeed
