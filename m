Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588745;
	b=sGxcoga9J8V7Q/v+VAYUrSB4supHGTTuuEnJdoVYpB7zLluCAmBKGfsE4TQc5m6Afx8D
	 omDt3XPWIwLNZgNsP0DUkWYTkGmXKSsLMOh51bPFJjn7RaSgEGw5f7vA+KY84v2FwSaOS
	 0mm4UzJIaXWSIL5mhWC3aGCww6zhJAPweSyxNHh8F/NC/BuOTW/VbDUZol6ZnJZ4cBvrh
	 cwF4dy+CuFY26s9mLC7G06CDMC+7P9bdZYd7xeHWeu2WE9hwurc+ZkkZwl0f/98XvnWgH
	 cnaa/aoJ/htrILoewijss+qcubol1MBXLEwGW2DkRx1Q50w27boBO05BtGcjYV9dwJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tHaSHmxG4NOOI96dWOmHK8/g0lFL5LgOmH8j1mM88RA=;
	b=mm3RFF2c1fHwLozmeegIx3E0TITZDq4wDv+d9JvfofQu/3Lc3AbV9KnPifdWtVxF0llI
	 Y0CTNR0FgWS5Nhm+KLeFPE1Y9jD5SMg5cvgBThT52ri5hyz09X0FKcrNXIM3xpCadZPPF
	 2Sc8dpbpyt7EiplhkoPQN+XudxleiZfvo1iN3Ix5SbOmkHeTR0IUkbEfHePZLt1jViZvF
	 mNC/JNGJ+Tkc547xD2XHMKne8fPpz7C8UnpVfB9S2jtzrvh004jj0lE4dpONsZssJPfvY
	 ZCYePJaJUUYUD9D6qFDvkpXMU+LOVaImU7dmZn/soSJRF9lWAa7L2Hq5BOUiCVD0crQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=I3iF0LM6;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14DE606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F14DE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=I3iF0LM6
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50715c2757so193382466b.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794588743; x=1795193543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tHaSHmxG4NOOI96dWOmHK8/g0lFL5LgOmH8j1mM88RA=;
        b=I3iF0LM67DO0Gq0+hzmssEm80yoe+wtCeqxMaeZul1ONpqI5Lmw1BT/Gl/93BHcRVO
         NuPFH9Vc9D4xwiZ1hEwiuEv3LFAS5S7a8dgkN0UuCQdXshyvOphuh6yf1UzpWZgntIKS
         NyT0sXG2e8B02M8as2STOnz6crEzlcOpweYdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588743; x=1795193543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHaSHmxG4NOOI96dWOmHK8/g0lFL5LgOmH8j1mM88RA=;
        b=C3ZgqPMS2umIaQJhBoxCuFJN4IZIjC8CFFumJjc+N472PeMM5Q8VAJDpbJS25spUGr
         3l6OUmcu+deu8BA2fX9o5ctVSw2OUVCuxaOlv5/+hncwoBHQ5cgJob9s5rzdvmxlgAhT
         zn/Vub0ljWrT1i0+/JadviU1l6tXGel4X4MaMubeHAneL0BTkNlN5MnsvALTmnFnd0aR
         1X/1GUhZqyvOFoSPJUQm5Y+owxaCMpHkbGd8BvTUfdppOySE++z3cYZaMR3au0o/NTmD
         90XxKm2HHHoEjh3awgDt06ZabzOMDDwBZCEHcVq1TWpPsIuqGT8OpodKdUrxyJQtgW+R
         T4Qw==
X-Forwarded-Encrypted: i=1; AL+hErEnW5/x+D6UNFOIplBtGdfUKvNN5v+0GyFGOQu+ObGm64dE1a4pUK8c8PpBcKexUbV5bK6kESyb+HtKqFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x9XJRnL+aXxhEbKk7gkTPpTHsUIK+OBpnp4qox4p6Fp3xrZu6
	AO0T3eMxX+RIdDV29weDU4ZjZ4GRJlhQdi6MnfG18euDBS4jZzpwJcUHf0PQDW7YeAPvLMMMFRR
	bdWb4Mv6u
X-Gm-Gg: AYBFou0Qo0NcrnZFJ4JNQj8yJTqeu15f5xCgH7dzeoj83sQyjB4LE8SlWG7v0XCHgJb
	5BL5pPJpmXeI+D0DSGd1Zn/8JYjBirUzLQJNysIsw7o8Fi/7lH1hW+Y+DrR3Rw7OmWI97HR6urt
	JnhYAi6kQOOH4xSiWKGCbMmwknZLxWV/voNbdusVpvKDJjjEn2acgNOT+gJPWgwppkMUMWQdDt0
	0XMk7Y1o4AZtcSMGrSic7TPbK2rki/5TiPeJqNvMUMdbMQ7/EL39WBHzJprD7fk5nEhj19lMzya
	ue7+7LBgPCgO+1x3S1A0oTUvjpDcnELtEVupNdh/nbkcP3RTwKQm1mST7KtIaMtBo/hzJFowsJe
	UcidyhPeEhFwYPIl1v/RxsQAJ6X0kFScozS8n5eHT6EMlwP/xtd1/75fu2B3k3uykeBFSAeBkY4
	W/jGKBj0rTPcuJB3zyp/zKJt5qOt1oV2Rb30tfcg4LlW8nGrFf4k5PkKqIuEcOcFyt5Ldf1sJEI
	ScoYNm+QCeX5e/RDNjktv1Vi6CRhKO9jvPQeMc7wBPEGcZO+k07+TPFT1QPDSRbS21lpjl2Bz3z
	KyRT8IpKOSrfG3M6Cs03qCv1sLW1qyc2og7+iajiXAvbnDZBAAx8Vw/GqigC8koR6JVc
X-Received: by 2002:a17:907:72cb:b0:c41:b94c:4538 with SMTP id a640c23a62f3a-c509640727cmr261774466b.47.1794588743323;
        Fri, 13 Nov 2026 08:52:23 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b979e9sm121489266b.85.2026.11.13.08.52.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 08:52:21 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso16435335e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:52:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGgMr9sMRcl3qdBF6ZfSTTRtEsLl/yxZME1ibVCsm9kGDp22b7KSzqnh1eqLF6VSsLMd1mhjveWwpzPROk=@vger.kernel.org
X-Received: by 2002:a05:600c:628c:b0:4a1:f625:2108 with SMTP id
 5b1f17b1804b1-4bb55a7f8aamr61143945e9.33.1794588740270; Fri, 13 Nov 2026
 08:52:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113111152.4190309-1-a.kazinsky@ideco.ru>
In-Reply-To: <20261113111152.4190309-1-a.kazinsky@ideco.ru>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Nov 2026 08:52:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ub--ETGe0=ChZxTuWgfu17uJummLT=k11qreJSPXT92w@mail.gmail.com>
X-Gm-Features: AclHuK-8BK7Aosy3FJvUJQDA0aWt3z629PA0xBq4h-w7yRcLDsee4gIhXacMI9k
Message-ID: <CAD=FV=Ub--ETGe0=ChZxTuWgfu17uJummLT=k11qreJSPXT92w@mail.gmail.com>
Subject: Re: [PATCH] kdb: Reject zero BYTESPERWORD before calculating the
 repeat count
To: Alex Kazinsky <a.kazinsky@ideco.ru>
Cc: Daniel Thompson <danielt@kernel.org>, Naveen Kumar Chaudhary <naveen.osdev@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tim Bird <tim.bird@sony.com>, 
	Martin Hicks <mort@sgi.com>, kgdb-bugreport@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 13, 2026 at 3:12=E2=80=AFAM Alex Kazinsky <a.kazinsky@ideco.ru>=
 wrote:
>
> Setting BYTESPERWORD to zero in the kdb environment causes kdb_md()
> to divide by zero when calculating the initial repeat count. The
> existing width validation happens after this division.
>
> Reject a zero width with KDB_BADWIDTH before calculating the repeat
> count.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE static
> analysis tool.
>
> Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
> Signed-off-by: Alex Kazinsky <a.kazinsky@ideco.ru>
> ---
>  kernel/debug/kdb/kdb_main.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 40c332d2179d..c3cbeb25f6fb 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -1527,6 +1527,9 @@ static int kdb_md(int argc, const char **argv)
>         kdbgetintenv("RADIX", &radix);
>         kdbgetintenv("BYTESPERWORD", &bytesperword);
>
> +       if (!bytesperword)
> +               return KDB_BADWIDTH;
> +

Could you check `bytesperword <=3D 0` rather than `!bytesperword` (and
update the commit message accordingly)?

AI-generated details, in case they are interesting to you:

kdbgetintenv() parses an `unsigned long` with kstrtoul() and casts it to
`int`, so on 64-bit systems `set BYTESPERWORD=3D0xffffffff` gives
`bytesperword =3D -1`. Combined with `set MDCOUNT=3D0x8000000` (so `mdcount
* 16` wraps to `INT_MIN`, `-2147483648`), `mdcount * 16 / bytesperword`
computes `INT_MIN / -1`. Because `+2147483648` overflows a 32-bit signed
`int` (`INT_MAX` is `2147483647`), x86's signed `idiv` instruction
raises the same `#DE` divide error exception as dividing by zero.

-Doug
