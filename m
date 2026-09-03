Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6594400DE2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425559; cv=none; b=MbOdf7vY3bKTyW9xUczpa73cQ/GvnBi5f6/E6Y5tvWvrF5bTYiAjDB6+8aH7qNnz1jRZZnh/pLwON3cjspliPjJttGUJ6VO7EPjjW7zUBk39y3Yrj9aTvz5UWvOu8StXlMHlRfszaBckhf9VWBq0e/+ckR9Txp2YGjCgvnQkT/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425559; c=relaxed/simple;
	bh=nCjep19YpVy7ptXJy85uM8qZLDh2PaaoyCU7UFW2ucY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMtiBbOZHlSSctzpQuwO8CTPbMs6/CKq4SyaxDaj4Qis0RIRjfSWDwu3udnwNQHaOQmOk5b2d8Mj75g+8WMbDsF3tldXDxtDUb+RWJ9FUmAjDVSZqa3FKQQA3tw5GyDDBePUXhdt/J51SkcldHMQYg0v8A4uUItYQfAgqe3El3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c675e64ffcso738382e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425556; x=1789030356;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C4rlCOn37h5gJZpVKAKNeNVZ0qRLT1DFUGwUmbfCeTs=;
        b=pSk/RWejf8c/nRM6OQcapZ5rYfDFiEyT0ql3zgr5sjQkogDu2rsGD1OeE7yulP1Ill
         E0zyrkGh9kfuY7Y/cec4sF1LgLwistjdQ4er+1ooWokIhSbC+gqMZutM98K/mo1ohkJm
         VNhDjkCYi7vxNJxvELrU5VUrC78WCL4Vv2vK+x06z6lAA0FTcDk4S9OaIIS/cgLSVzNJ
         J0ZVu/RqEpdDIJ8tYXmJJHLFkkNY+nhsb07QyVMk2Y4qCAJeKz/KZVKxJone1mKEl+rN
         JotCf/ZteY2t0d3cOHAgG7IOudnjsIX7akIJZdRSpkgDkHRiInEoEWlvlk70/lljbwPN
         JN6Q==
X-Forwarded-Encrypted: i=1; AKwUvByES3d6wbRDOkZLJ68BgDgkxSks5f9te/ebhdsezLxaGHRgffGHS2B59WS8YRah2CNuqHY3fAFBWXdwDhk=@vger.kernel.org
X-Gm-Message-State: AFuF++nQgAK5ROzYBr3nmfri0IX7HVmdMZ3W41+BXOLwvdpYcW7Frt/y
	AHqEh2nGEORea1/DtIxgNODGihUp40RkIIh80jVO9yQd99sOVJ4Y/YRRS71V804cwbY=
X-Gm-Gg: AYBFou3/n/8qpM+Q8f+PlZk5i6ctTjWa6+LR0DhYdjml7vyWO1ZLPybQ9ATSVAjMcDi
	x0iHpJvLtzpsdh7ImkRWb8Pto6W6cDqc1wxuqfutwM1OMykEim7EYjHADsqJiuwKxITbwxH/j+5
	891kSe7RhnRLEzSQq1HywCNL64BbjXljMPjIbssNIwoiyviTzpPkt0y2A4f96zK9HBCsEKHM33u
	e7eMHy8F/BvF38WcKMVAMxds9seC4teiBlVN5ykfPb2vTlEnivSKKI/EDj5y/YngIw8Va3q82Zb
	M/jFOfB1iiFh98DZl5tWbSgcvLvnYkYbCexEwdk2RKtRIS3NKEbjFxLUPoYlvtmnjB4XHn4ls7+
	eXc+ppd6t1kyNPu/uMLJ/7aWpoMV6czlRvp9LnvxSqcoRGrlacxF6RWykFv2Bvz/UywBkJzNbu0
	y+ktv5dW2RuaHeTnxGtXbxHqpU4qevhgztE/4ZMRVI74D2TwHj7fTdIhX0/34ENIabPZtvBLKWY
	R61Y3Df1fDFg1RCjhhZpaimE2WSFg5DvlyhAtSB
X-Received: by 2002:a05:6102:8345:20b0:777:2e1b:1e2e with SMTP id ada2fe7eead31-78a2ed7ca4fmr1058037137.3.1788425556503;
        Thu, 03 Sep 2026 01:52:36 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-980673c9da2sm3900595241.9.2026.09.03.01.52.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:52:36 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c6670fd413so688186e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:52:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx62oBV/sgo+3k2mcJT7u7lY/UAEJI0Hyv4ahUN6S41YkbxlNaUOhx/A4zx8+tTxzbM7WEY1xQagCvWvIc=@vger.kernel.org
X-Received: by 2002:a05:6102:84d9:b0:778:6695:2f71 with SMTP id
 ada2fe7eead31-78a2efc74e0mr951843137.15.1788425555897; Thu, 03 Sep 2026
 01:52:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
 <aob6pW_BQbW_hF2e@ninjato> <aovmzeyXAQtb063B@ninjato>
In-Reply-To: <aovmzeyXAQtb063B@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 10:52:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYg-QhMZ9e0i=Nzym7-8fcFfahkTT1HKwxQ4d=_0YDng@mail.gmail.com>
X-Gm-Features: AcwNN1V03wVoMTHnfOLNCqV0N8TGrKgNMWk4P9bpEKw35T0AC3SEfctOY_5pVKE
Message-ID: <CAMuHMdWYg-QhMZ9e0i=Nzym7-8fcFfahkTT1HKwxQ4d=_0YDng@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] pinctrl: renesas: rzg2l: Add support for RZ/G3S I3C
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, linusw@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 24 Aug 2026 at 08:38, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Thu, Aug 20, 2026 at 03:01:25PM +0200, Wolfram Sang wrote:
> >
> > > Changes in v5:
> >
> > Tested with my G3S + I3C setup. I3C still works, I could also not find
> > any other pinctrl related regression with basic testing.
> >
> > For the series:
> >
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> I'll reply individually again because patchwork doesn't pick it up like
> this.

That's why we use b4, right? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
