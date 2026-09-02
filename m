Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA2344E66A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351095; cv=none; b=khNxyql/VU40tFmJ8mZu4/Na0AceE5QVWFQbv+pbFN5nYRa9zt5eInsPbJMijLItosd7XbkNgcIz9WOC12SSGIKErr3xZd4TJ+DvB6J1AK7SbnlIT1RbrHLXRKLuZTqA3kZckKfYOKLK78+OZZ2sYnXOnaMvpx7K724Vd3Kv6nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351095; c=relaxed/simple;
	bh=BGVT6NiiPBGrDzAWTCenC1f6pOP4TmMvoz1BBe+v1UE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rc57y1gnR2/hZ3pZ7GeUAwbbH1lmDkfQQsxqBXm1fce623LZ5tejfxUIo3J0+rn21lwSs8mGndVspUWdrN685qJ9gGhlf5us8bTYkBLA+upPvYqWSSeb6qK/G50WhLW7ASC6+v5cSYAwlmlsrKnRcvRm2WUM95+0Zi+jPdmMmAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93906e8a5feso112222085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351089; x=1788955889;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zZuEv2ob4j8Zh+WhkA/MTuPTTESwfEtjHWVWham0Lxc=;
        b=fZTLD+RGYKo6KQIbXP3OO/6pwIPQyD/gnpZrkBqnitoGgGlp5FcEol0p26jb+qFiRV
         AJITXH0fp5RqU3HYS2arX73OfSSgWiQQ11onjR0kFCNMlAqYPippOv3i1N+xgYhVp4Mt
         dZ6rZum8zPO/hCnXczd9U7PNA0vJMbSHEmKQL1ZLNyg5n7wOu8YNnX8o78k+znRqzVtg
         2B51/LynoG03EBeGZbji7x0I7LVNzJw0qd6ZhoelqKJIfqLkBXOQbpMZkJWNmyIzWvhS
         GRUjvitijwWjFCGY8vDLaWAZEXXkTFMhvHk2AguVd4rgM6Sk9IjMfTSosJznRitVEhdz
         1kOg==
X-Forwarded-Encrypted: i=1; AKwUvBzxHG4SV3QmunKmNNe1ajg9SW3ShPve0mmAGX/L6hQtqCt4E2FO1hHlcn++q/chVI6IM/U/kk1wdYRcDFg=@vger.kernel.org
X-Gm-Message-State: AFuF++nsNtCLJqbfPp5U+ZdM4GDOCAa6IP4AVLpVt/xbvK9NH/DFwUhH
	JQr2X4pWyA7xHftlnsFchso6MeipRMLXvWgGuTEqxKJuUfn1zriwmvr3Q6Y0BM4+
X-Gm-Gg: AR+sD13NdW+gNkXhqsAEXGlQK8vACVBZscOTrYkmahT6i3wN/PxIOTg6ngV19qPrEE2
	8Fr/3IwxLkAD1HRDikTiwaeFJE6iaKETSrQfSM26JHYDKIwA52bO3GvPNgEbeIYyeXsNiyiHEaz
	2O8PeOzIV3kjFY4crLrh2OjZ5ouss1T3fq6GPk6o35QuoFt64VVTjpMQJKq0TNw2bj7ZvttVwXb
	n3DecyAxZyjZ5FQbt0C0di3TPJ7SMlH+Kom2wEZrdstuEwbeWkA9QgtDrjcPfLGIHK9Q2PJkN8J
	3k+TWC/fUQI7VSx7l0zUSH5IBHLDGbZXVWOeMLTA99v4wcMuBBHcGTOYxMRXKfAI7e12XFKNIDS
	sjoTBuQUO+SANb9KatlpOR1keBQu20p8rzgwSs5abvEkLgBdLfjWtX99AWV87mNLtTXLdZIYn04
	+jdESYKAdKNDeZkQ4q4zN6VtaB5HpKoP/BCxiatgyKyM9MM+ClcpFcXXOGSDViKVI2Y5DnilJVK
	vdGayci8dDPEqEE4glxRpZagA==
X-Received: by 2002:a05:620a:8eca:b0:939:3f4f:324d with SMTP id af79cd13be357-93960fe57c0mr357716485a.43.1788351089507;
        Wed, 02 Sep 2026 05:11:29 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f157807sm192174185a.9.2026.09.02.05.11.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:11:29 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-90cc372d6b2so12440916d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:11:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwAfv6RcenRHyX7n7aeqrdkHVRJE6g3zx8qrX1Z1tFH6QbxY1gVYzjv5gvseH+gunGMegqljmFS9KTynYo=@vger.kernel.org
X-Received: by 2002:a05:6102:14a5:b0:784:94dd:5389 with SMTP id
 ada2fe7eead31-78a1f3954bfmr1187932137.13.1788350628203; Wed, 02 Sep 2026
 05:03:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
In-Reply-To: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 14:03:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZfH5rzN-xFvyfERt=j+c0aF7ZSbAn7XTM=R_u55+3MQ@mail.gmail.com>
X-Gm-Features: AcwNN1W7aL6kq2Ib0xjLGz4RQRE9m6dme2IHxODeY3IaF54CXwsKAcwLlCow_cY
Message-ID: <CAMuHMdVZfH5rzN-xFvyfERt=j+c0aF7ZSbAn7XTM=R_u55+3MQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Joshua,

On Wed, 2 Sept 2026 at 13:50, Josua Mayer <josua@solid-run.com> wrote:
> Add support for a variety of SolidRun RZ/G2 based SoMs and the
> HummingBoard IIoT Evaluation board.

Thanks for your series!

> Changes in v7:

Oops, subject says v4?
Fortunately b4 is not confused, and does The Right Thing(tm)...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
