Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794623616;
	b=xgVB6LhsBRb4STpDhZaUdOm1WmTz7GIPaFIgwvURwYe/p4LkKScspowFOal0xrLVuUWX
	 uXE7TAcDSDOiTQGtyyEIFIyB+o7+uYOAWJujz7y0XYInCoepNmwWRUoIjNTqEodDUVI2M
	 s+kbU1fc007vcqdb0t+OAIPQtdaWoOLS28w53Dd6Q1Rc6c8ACV+pltGeMLjpP/Rkz+Rpf
	 ZzKdwVGDff5vyEaldNKku/ac57QJKavrNbm4aF6v4mRRX7H+ASoRD3Hu++s37+HWNZPXO
	 fM8pwpCtHN3Igz25OIm3IvxV3uHAqaH6EnEWCIhYykUKBnE2FTERryBiGfPWmEXC8Ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794623616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bJehl/EaRvv7fxLuacOZsocXgCWzK0RPTXvgb7IEb98=;
	b=QyPT0r+8KloKfuZgznIyq9FD+tKR+A44qW4+xSCj1Ac0xp3GMZVqUtF5TTtNtdROr2xv
	 YHxOOpIamxEUtN0yABA8e8X+kJPhWGLpwyg1oXAOG3VMjJzTdhazuVzk3JCy59+Pvb/Es
	 lHRZxwFIBnVgPTBq8GI0ipEgZUfTYf+09TDl3tmz203v0K3RCuZ4KE2aU9v5DSzffnDXZ
	 qfYjxr4eHkxAoShgJFeDy1f+jBXy8Qfd37I6SA7WNbnQSOln6PsuJvFpjtGsp8uKAAstM
	 s1liC898z8Y3YNibuI5wPJ9lkRyKTtVFIaxIBKy9U8kGKQGhYlnjXGrMpuCgfA+mNvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cpyhwBf2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BA0606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4BA0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cpyhwBf2
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91ec396c93dso41112386d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:33:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794623615; cv=none;
        d=google.com; s=arc-20260327;
        b=QzsBprcGLg05iZOiCggo4tpTTbQWecXMHD0wjgwcxjpIpFo6qABLqSEnzEwZ+XMtf+
         CbwrUrAIDEByUoIhYG1JOl5VGYn5v300dKnRhYHXXrlXGteDf7KM75MuKpAL3cUkXhTI
         oUCgfhLGXwYqE4dxAfuqgXaAQAY+aUMtZoUJGDDGSyR+ofI7EKBZqLgbH+2UoT7w+fEx
         /w+o3YwXs5+JLXE9K61kawLjAly82rtRjWSKJbEt7ggwsxKVjR9KPe6oHTeHL49GQVbk
         EqOiQbGnBGX03fDFWToBxdrStTExWEGKtpl7FNcRz04i1503KFasdg21nCO45V91bgIe
         julw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bJehl/EaRvv7fxLuacOZsocXgCWzK0RPTXvgb7IEb98=;
        fh=c2v4deE8AGSQGyjn8p2tMRVXwiPLl6sI11TMEoNDrVk=;
        b=Z4qzmeoj1F8r6z1QVUMh9EwSh2xymoLWh+LcG9HgE4NlLyHc9HuSUqAMiQagzCPuGe
         g4fVKYXi/mTWEYHZTuPmjyObUxTTga7d3/LpbavydakkaGKEL861S08XI6V3IEKAiBII
         36Kwf7IzqLCqbQopW6TPvSIDc23taJuau5WyQcPQ2akXCOhMUYjvEIUw0UI3XoAmCrsM
         Cs9vI4ijbkHMVO8Q3NgRZd1Y1zus1IMs6whzM8beW8+xwspYsjeQY/uLbzvDCtvzfWzC
         2R4eO190Ws/GDK7ydbwiLpU42O7ci8nKdi5VpbkJB0Iju5/tzgA0K1vkLiJWRBHJjG74
         yo2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794623615; x=1795228415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJehl/EaRvv7fxLuacOZsocXgCWzK0RPTXvgb7IEb98=;
        b=cpyhwBf2J6X2pdPgqT6uFinbC+cZWDMFfRBjSFx0RWM0tJyQlQh2JkQrnFEhUxBwdm
         cMXk0oRnH1iM2FlgUJtr14bX5lYTaDSVQvQazMr5+RMSyqpF62LcVh6Kmx7I6rkBQwxZ
         4B0sAvNZ8XfR0KeHSEAAEKS5aGRRr3Rg5rA4tl1y/g/DsrzWz/T0/uetEQ7t8QH6T5b7
         X/JjJ9X3e3L9uUvOCe5bIIIZxeuf9+o8ke9L1DANUdvR99hRRa5hXXCzYndOHnHKWJvs
         eic+kKavTP/lYmQOFaiK29aiOHL56z2kh2wof4fBxmWYGidLFGwlmO8Lk0PErdB1tH3P
         AKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794623615; x=1795228415;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJehl/EaRvv7fxLuacOZsocXgCWzK0RPTXvgb7IEb98=;
        b=WeAu4tQDPh3fLjUzLhEnrcOZhtPx7XIyCFk5HHStiIZJROdT2C8b4HxOYADoEhXK60
         yUiXMrV7W6rb23TeAvz1iyeKxzOKfJRHSqJON/Kvu7PZcGl0EEcFnZLehDytT1m1ts0i
         eyUkpPoi0ynh6mqcWnNISUrziQxyBZT42M113vSilQsun7/hnCHj7okUttzvV+ejd0bS
         IzZ3WOx2mxASXi1fRwM1820TFDtCSBExQQ6mAa1tG2l5iX7pyTynnT8Xv9TdYClRSCLo
         YudaE39xhgX7+MrW7zTNyavuI9RemtuoNuIUNiGJrFtMYv55o1p1XT6GI6s2NAyB9SsB
         4ymg==
X-Forwarded-Encrypted: i=1; AL+hErGjsMDpGtjp8J0xZRb7WGjpDYvBSUNRVRyCXGQurpUTWDo+C0uMGj3dCKpsd6YcI/crs1NFO9YSx5nAUBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bdqcjuAkTEmK681jGtEPCf8VBPxwhBsQOen4PrIfAn90Zzf/d
	TtrxpvO5FZ0KCazPcZOne6+c12sUAVXY680CxCZ9JO4rqF2Scemzqqs4fiZUiO6BM4I669cG0kT
	3zekfXeNDmRmVG1dUOZTwgAB+GLYR1OQ=
X-Gm-Gg: AYBFou3d3p+w6FOJnAmF2OpIFezMAUpoBi3370/NxdB2xp09W4rqvbIIq4LCfmA8AL1
	qkVMEVtEVqVZXUREZQXJZi56nCvDF9fmnZmIUhoazQa3SDcyFJF4Qfx2z5kMm4M+qkdCs7PTUYV
	hh3dwAmh6ZNz5HPcRyZCT0JxTpsby0IP4JiPh7UrC9tyVXfMLHVcmf/0Dxd7I8l3U4V5fq7mdji
	UgmB1Tm3ZybNwHyFUrGX50QPKah5bfHIfNWGsKsRMKagxa0Fd+NXjoeoM1dhF5XJp5oa+nz68+S
	b2JLLaNogOIZ+3W7hRpAbeQ2HzWAyq1Zo94GxDVtolvLt14g0bBI0DkXfJ7gYB50ikTQVBbNNvS
	fkZKl9PVjvQUnTOyOI1Xc9dbarsbNGTarDyP7
X-Received: by 2002:a05:6214:5907:b0:91e:938c:1615 with SMTP id
 6a1803df08f44-91f242070b7mr68774826d6.40.1794623614738; Fri, 13 Nov 2026
 18:33:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114015554.2187341-1-zxyan0222@gmail.com> <179462149962.2168702.2687296647559611353@kernel.org>
In-Reply-To: <179462149962.2168702.2687296647559611353@kernel.org>
From: zhu xin <zxyan0222@gmail.com>
Date: Sat, 14 Nov 2026 10:33:23 +0800
X-Gm-Features: AclHuK9PJFdnYQp60hzQr-aoL6oSJj2AKTDyP8sv_Y5ch8KGojZzj_LkveAYZWE
Message-ID: <CAP7veT+LavpYFKWuniXO8ddfXF7cYXNO-r_r=0Bj_pKVXJdawg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: re-enable on-chip parity checkers for
 XGMAC ASP 0x2
To: netdev-bot+sinfo@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, horms@kernel.org, 
	0x1207@gmail.com, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The issue was triggered on real hardware during safety-feature
validation of an XGMAC integration: FSM state parity error injection
did not raise the expected safety interrupt.

There is no kernel log to quote for the failure itself -- the defect
is a silently skipped register write.

On XGMAC 3.10 and 3.40 cores, with the patch applied the checkers
come up enabled on ASP 0x2 devices and the same FSM parity error
injection now raises the safety interrupt as expected.

On Sat, Nov 14, 2026 at 9:58=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
