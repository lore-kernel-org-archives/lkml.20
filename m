Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794562346;
	b=Aj4uTByA/GzUaVMkAIEailwXGF7r/s+Gbcu5SmGfCek6C76TAX3PeekCuAZwbrCGPPzw
	 TiEuDaR4LIC3WAXzzsMXXZUMXCYOzTGKbHejCpA5l3KA7GmkgZI6cjkmBecFxpwEluRRx
	 tLSVCg577mjkfI74arnn2hHGtv7iE6kRDLNM+VZgaWGN6ZJus6j7EysWzP/jHc9UappRD
	 HA5pBdwRA1BgoyF1RssJ15gZxl8AvkQDIeFfdBsEO6iPtE/7+cYJb3/uoUHG+mwD2fbWz
	 3ZXqD2nHvg8ymW86ZowYjv4SuVHOMrUQShNL6kYwyVmkEo0tqWmU4bkZzAeZFMbZvYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SUNZMXe1GM6kWxO3EpXBhVnmSI9S4lEPAqUOYnawbcA=;
	b=ULwkBKDYT+3ZYyA0eSwPqKXxIFpxHhD5pHq7Juo2ItSUk9mwB9h9hzUA92CdA2ErxdSD
	 89GaPByUl4aEOoNnmmmp83J0Si5XP2RiWjOSB243n5dUPgStGp6SIiQcNaA0X/aKoi21t
	 ivNoe2/yhSU/dS6K3tzhYEh6Qo/kshWAwIonPOk8tTT5WPbznCfKMmsFFaxhfw1m3ZXnn
	 mMZO2Lvu9sHnwA3C9YnDCArYbGfPAw9W+jNHFDr1+KAwBUkOd5b1DCd3XfTnn2oSh7Vdm
	 vtVznnyy1red4YD2BWGcEDREd3riC8WGWoFVLeUf6atV9lysn6QBykOJr2V3ZvQUD5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mb9wG4sY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028F0606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 028F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mb9wG4sY
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b30ff12f84so5149357b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:32:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794562345; cv=none;
        d=google.com; s=arc-20260327;
        b=qsON4vV+cp4GBN5NIHBL7yYhgMFG49cvJ/6d3lNxhfCPmgsZDNRhMjtgJ0hg+ZrGFV
         dhYrc2vEOgFGFm2bbefXUvkk1JyoHtaJ/dk+bAAmB7AEcV0356dy4RI4ZlbazuAYZZ4f
         bzl7O0zNWzMknUsk5Tp887UuwqYwANbiVbGhd/zmKbKRyTG/BZm30UeA0XpLZg4w90K1
         gAF8zE6Ysm/fLXpE2PGYeCaqlOlJ3XNSqr0HhR/0gBRVDeAYSThycRNzhd+BAWd//eVE
         3ghSPx5jn1gy/0skFAkTx0J5lhrQtDOWe6dZddA7+M7jI93Vl8TtX/aCTdUkiuKPFE0X
         gxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SUNZMXe1GM6kWxO3EpXBhVnmSI9S4lEPAqUOYnawbcA=;
        fh=f37hhbqQ6X2nHYIQHUm3bugoeKsBiZ5VaBIAzRrCnl0=;
        b=eKJBAfw1Q7dkcRig16jjrRXh3O8bVs1uOaE9/SzOxd7c1cmEmlen9i4mNgRjvW/sLM
         CIvd/plDnJG9vgvfSHwZ7BMT8kJsrCh9hIjiTMN0mMN6sPN2niTpCqDNYhNGSBH23MyN
         14d5ugQcgcyoPAD4MMf8XDzJS0+d1bgeYbBZPTBshxrbOpoFhMvPOqRIDB5MGvYEOPoD
         NyajBClQFAx+t5tOCCSon9U2d8EUFTpXbAumXOwujEefLLaOfb6/lSaGlKMjc1qwaNQa
         Fm4kObEEyO71CFlfWIR15dGlKkghxcAuTd9WtMQlzV09P4/aTn24/WIeiw/VtRGxSz6C
         z3Wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794562345; x=1795167145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SUNZMXe1GM6kWxO3EpXBhVnmSI9S4lEPAqUOYnawbcA=;
        b=Mb9wG4sY0QqIjN4QD3o1anwYH6pdqp7Z5e0CCPPaPvOG+MNlZC3ozsr5hSXk182w5Z
         t1WhyFQLHf8KZJ71Fm7nxK26YTIeqnacdYw3dwcbyb4yi2zPScTfKiQ1qimXy4ukdmXU
         bkIbZypS6EPEokf71e4Mk8rIT5lU59HXM9QQK5yqGTPPkMzBOy2zN2FDFKS+YvSZgO4J
         eLnsu66OsbiThbcFyLsyXfDpLmMqDFmxHB7J0rNsAX1hpYnJD64WQ6JNzB9iBpo4yBO5
         hL01Y/GnP94/1JRyJs+nPltqXoTIMbvHio5nLVh57cKLyqfMkaMVd+ol3cpL6F7cLqo6
         GIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562345; x=1795167145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SUNZMXe1GM6kWxO3EpXBhVnmSI9S4lEPAqUOYnawbcA=;
        b=Ct7i6qZfdpTJJON3lqjij6G1zbdku3Lewg5EWLtjoTXpP62QoDtS7DdwVYAc4bUo5Q
         Q7ruNQAAFst60hrDiNCaqGVnu3g2+ir+t8hga1F5C5mqwCA5cjU8oduHx2j2NQ3bhHAz
         WsFzpw45vYNPKqSkHFd9LWksMwaw3ksmQQ2DccaZLuGEGlFnhSzh47jB0NmGTRJRIobO
         wn4ntuyztSMHGFNPqqKQX5/GgTxnwkbzq93EnN96DW5AE+3G2g3/IlCJh+ufiPsTOB2S
         FDRbZUPZiOAre+K1DfE5u6Zu2MIJvGFDdpygTcw4FJbaf6tlyGNXEi69ytBBFjaBoEcU
         sTBA==
X-Forwarded-Encrypted: i=1; AL+hErF3ZuvJHpeWI1ty+IHqd9F68TC8TWMoPWSa2jyfjOcbeGgLZN153hUARqyRMfNDO0BDUJ5QOWmuRMuVhTQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z82g3agT/WFdd/w5TqtG/oBpRlsZCvteAfcM4YbbRt945cJ11Hf
	Ore1PIFRyCEjuQbE1VfOikTB9kIDYjtWyOyflMeaLxoSr3Y/YvljmgWiwYtTDe7FuXUpG+lJVgb
	6b7SWvtmkxgVxBurh+xPlQ2HBudQWnyg=
X-Gm-Gg: AYBFou3oakloFLD/vG+xB9DrgiOOdzUDyswofVuXsPG2SaAfdWk3ogUQNY5aLjq34ZE
	NwckmcHmtBTZKkdgk8n53xVC0AMDxo4cjWL9WmN5/YpsESq8zL5vGB0CqdtOh0IEKIXQn4JMlul
	2+6h9iCFndGb2y908DiEuv7VJ1K43PYtcoauFv2Aqg9mQ6UgwGY5XOPcXt0ecpB6o0Sj8RlD2QF
	kfAClgGWMUHESrrpIXvNLSDFrFv0J0d8P7znQaQXysb1/cdwUF/ksP4fw3nsApiF3JFzm7F4O0N
	vT1poCZNQv+CqlsWrsCHyA5h4TfjmF1mtA2IIBg5QDIKWh8Zrq5BA+ebjrd2eNE6fOhhKDrW8mp
	yjrYZwhyI6+6jimgmYoCVccx2AjjxKOr2KUKw2fzVrIfQl1QsQwJ+rlWv4ldJd1o/ikA7EXhZje
	/oU5a+scc92Cpyk8DPxp8mrgyov2gzkGegNA4uzBrrHSz1uglpPuMHhpO+C2jneNJ5tv8n6k1mQ
	m6xrQ5HtsCSZbzYetIvaGaPJjkgyZZr72qbtVLaXOonKccgkRgZ5Da4uAV+Ptw=
X-Received: by 2002:a05:690c:1b:b0:8b3:7782:6759 with SMTP id
 00721157ae682-8b4aa323715mr19625897b3.38.1794562345098; Fri, 13 Nov 2026
 01:32:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112065037.1800467-1-dmitry.torokhov@gmail.com> <20261112065037.1800467-3-dmitry.torokhov@gmail.com>
In-Reply-To: <20261112065037.1800467-3-dmitry.torokhov@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 13 Nov 2026 11:31:49 +0200
X-Gm-Features: AclHuK-aYVuDT1vvMCtJLPucjNeheRM7g7YQo6HW2E7XrTdn0Ql1diwa05ev5tk
Message-ID: <CAHp75Vfn68p5G6i8khQyo3COt9Aq06JeYJjHBqaOGXbmtmRNdw@mail.gmail.com>
Subject: Re: [PATCH 2/5] Input: tsc2007 - remove unneeded memory barriers
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, "H . Nikolaus Schaller" <hns@goldelico.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, Andreas Kemnade <andreas@kemnade.info>, 
	Johannes Kirchmair <johannes.kirchmair@skidata.com>, Yuki Horii <yuuki198708@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-input@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 8:50=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> The driver invokes mb() after setting the stopped flag in tsc2007_stop()
> and tsc2007_open(). These mandatory barriers lack pairing barriers on
> the reader side and are unnecessary.

...and they lack the comment why.

> The wait queue operations wake_up() and wait_event_timeout(), along
> with disable_irq() and enable_irq(), already provide the required
> synchronization and memory ordering when stopping and starting the
> touchscreen worker thread. Remove the redundant barriers.

Reviewed-by: Andy Shevhcneko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
