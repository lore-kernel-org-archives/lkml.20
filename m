Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60DA53B5E2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176231; cv=none; b=TwAYvbXJBJRnubV1QlzCHxTvr+IbaTMLD1d3p1/Lt5kfjw7orX2seTHqkg9vEpVE0Z8jxFSpLzzNOBW/fPbz81mRx9ibM7yFimE2IbS18b4q+KsT1ke4rH5uOjgQQUo+1XiG7tMVU/y4Kq3cS5aIgklwORhaOp5sRcdfeZ1xwjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176231; c=relaxed/simple;
	bh=EhjWSKImZwoAXYfqAyTmCpINsx0oSO9M/RawkNvcdAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obRJ71M20n5jHk8kC5LDaXAvkr4BxOL+xwEvosw2B4MQWCcBneaILK0/FI3//lEoV9ulZpb002glVjsX7mzrl+haMAldKJyr9wSrTNoHqQ597U6LtUoqAXp5hCkeJ66qGvQLzj6jD5brzrpFZ2aqyBBC7PMIG55Tn0/53xd26dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-79028ca9371so403087137.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176228; x=1790781028;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sDvgyyoRqIDDfI9/dyDxtj/9kppA0KcEIyfQ/4/NmrM=;
        b=sWRpOrveCQIp6oJLNP0Ey7i6OTvWN17oJUiUe6+JtSHZzTlEmhuEhONiObKPywvSzV
         hcgT/ZiQIknO/qKDDFirkg+XoUTYmrMZgbOcmoXybCkH1MDfircDuWipKodLr1krebqM
         aeM9M5sC9udNuVBigDGGa53ewhX6NnKN6U737SwizS+/oe5pCwzfWUbKoWafGwDFQqMu
         r7arZ4OqfA1rkQw3oQCwXbZwzi1VzY727iSY3PNgXKf1/nWrP2SiPhK2uIHpVLRtkVod
         4LKOTpCAynRnhxfNClbycZqaGan1DoLSIAVxiwu8lbiroYqf67c1c9Aj/pMH7+CSlf3K
         54yw==
X-Forwarded-Encrypted: i=1; AKwUvBzrks/388zu2vYRej9iCEzhFVnAto7mo0bUdIzcUwrT19P9XOHhSuKOO5HbHe8U66LlqARrNHrNMO8+dWU=@vger.kernel.org
X-Gm-Message-State: AFuF++lBgA8w1wW2gnL+79AL7m00iFnYpDPjjMLkp1LANHVVq1nOZ6Y6
	iDP7y/IzGi1K4UxO4MD0DEi8pIOTdL+szbPpJHrUI5RS6U5/DWrHn+d+FQDlvw4I+r0=
X-Gm-Gg: AYBFou1zX8z6jtTeV1l8SHqGMs9Yl0y4L3wIxKTMnlDC6w34pqA6VsaXTl7g2esXsd6
	jYHpgraKgKAIOe5xy9NncwZq4A87JuBiNBlCddUKYqlU3RXn10neuCE7c8ebCLc7JVyUx+PBsQm
	/STPo3T0YnCZbB3BTBjGAeYsAxA0U78BtfoloVy8BA8rB+Grm7bnjdP02IbYAFXiNSp5VJa/Puq
	Bi4UBBAtXAe95AzRHt02l4/XpfKLY3q/wIHpExak5PudQNH86UphpzqBKSIUTh6RjH6cNShppbu
	BCz1P0Jm8o4RWEJ1liQtGMbcTJp7Y+7WBJrfxxmRXVj9Den2I2vqqMFXlsCuAUo7xDTxj3IMwC3
	whRGqAF1zc3qcxAZ3ih6u2dGfqmfF62eOZctn6up8rhckXSpgZRIgmrOXzNMSBlgAGvJ8/lFyGo
	60wLTlpT9R2Yr2HLzJEQp1c+nPNr87lf7/8T80b2uraDnlF1BGleP8sy2li9ETcZ82CUGFcmRD/
	CGuJ6+o6zfQyqBk35v2FGLNI1tpPmKtsYTD
X-Received: by 2002:a05:6102:dc9:b0:7a7:19aa:f0d6 with SMTP id ada2fe7eead31-7ac1de3a457mr2483660137.35.1790176227965;
        Wed, 23 Sep 2026 08:10:27 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf61931c3sm3809383137.11.2026.09.23.08.10.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:10:27 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-785686d2764so253033137.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:10:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzOeV7YTmQjSNibzq2+qzLVvpupokMtq3FsoQHfY8U7U8a3rXn5ibZH77qeQm/dWEGa4vsxllBuSKpqv90=@vger.kernel.org
X-Received: by 2002:a05:6102:26d3:b0:7a6:accf:72c1 with SMTP id
 ada2fe7eead31-7ac17ff1a5cmr2593444137.0.1790176226764; Wed, 23 Sep 2026
 08:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-9-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-9-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:10:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQ47vaVRKRGvwSY1Sy5B9VADC6YOJ7XMt9ruPZdd+hrg@mail.gmail.com>
X-Gm-Features: AclHuK9nr5QPs8sC-PMKUOwR3cdMhCa7cZVvTQqDSW5Li8NuNQleAMbNnooakSU
Message-ID: <CAMuHMdVQ47vaVRKRGvwSY1Sy5B9VADC6YOJ7XMt9ruPZdd+hrg@mail.gmail.com>
Subject: Re: [PATCH v8 09/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzv2l som
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun HummingBoard Ripple [2] with RZ/V2L
> SoM [1].
>
> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> featuring:
> - 2x USB-2.0 Type-A connector
> - 1x 1Gbps RJ45 Ethernet
> - micro-HDMI connector
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> - MIPI-CSI Camera Connector (not described without specific camera)
> - RTC with backup battery
>
> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
>
> The RZ/V2L SoM shares PCB with RZ/G2L, differing only in the SoC itself.
> RZ/V2L is adding a powerful DRP-AI NPU which G2L lacks.
>
> Due to the similarities, all descriptions except SoC are shared with
> RZ/G2L.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

I didn't compare with the board schematics, but it LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
