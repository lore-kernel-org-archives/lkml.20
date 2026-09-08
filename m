Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88BB538D64
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869975; cv=none; b=SJQUR85l0NLziGS1KAHd9uy8a5Suu4ydyPSWTo+mztv3+9RE1Oixycd77Vli/TrHwRMBT7v6v/mIlsMQF9ZkiouINhv/olNqnsKnPe9SBJuOsfT8cdyKzNHMHqavAgFckQUa9FJmevNMdZrvg+CwTM1LOc2iZ5B51B9iw0MjJaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869975; c=relaxed/simple;
	bh=0TMTisvxJ+92sKupOfinZVmI2wJF91ccrQT+YBZKyKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YcPIrR/oNmyuWJsqrUvbQbSasAr2qS7Oyaq/8MBG4HFHW21aP467RBTiy/dHg9RvcpMKlVM8v+rqInDDnVPv1LpDhB3w5P/dgaTj0ynTRvVUDQXtIrGssF7JSwjTbdzsnHb5k4R/wV8Tkj/lIswtn/eWxGQtwrTYUExlyqY6Y8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5309dc5cdfcso2973171cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869963; x=1789474763;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ofUUPAlzK0RlPGiJuLSG6vss9ksk5CLPkzJ8jLWh4TE=;
        b=TOUaRosd1/3HcCbG9fNkPXMyqtI8qi6VWYs4mRtnMuw0uVwG9Tv251dRKh2xbZcYI3
         FYFfSwjssvcjFhMBFoMFPzojhWOJjTKlU5fHOsj5KJesVZjoM9Z32NKcZAIbk1lQJJxT
         Vn7fuHm6fR3vCwFGrQ8POXvINp7YAEqMe2krOYj0umLrUOa03QCHNLoKCk10u0hOohqm
         QGNMb3T74lmkSk4iagYmJSH8olgbM/yWqNidk8wHciLLCIW6rUzbJ+3ofdNBvcY9/zT0
         cttxXeixwVVFk6eMCoO/PYDQ8OAtNBWncPHzKQFo/Lpc64TMAcyOj0MrEQS/63fdiCCv
         KccA==
X-Forwarded-Encrypted: i=1; AKwUvBxXVz5/1zL3lJGUKenMUKNBKdsWQws9rTS048VuOqwkRXOJsywg4Z4gEcgOHhbeQRKKivzeqUM5D1E1uhQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l9j+ZwX4JoBY40J498O9G/W61JCq4Zp4b3kSEaKpfnGz5pa4ao
	gh6c/eBhO4S2+yviKsprsRR1MElyELxRYnPsA0oKjU3117ukUcLpCIG2VpKZkLPz
X-Gm-Gg: AYBFou0Snw/c91Sll48/ON55PYKFJ54F0t/Id6mzmqrSmH7++NplpMErsFrpsIf+3SA
	TIbD8VSC5p98U24APz9FkUb7ikS1EGtwNXNYvy+/lO80RaGQ6pmQs5qCu/1arC53ruTOqeGyx7C
	PsLJ89l/300nWvHxkoFVTmEyYDZrhk7nfS90zay+CAyKgpliz3FF2hWkMOnExeURQb8ogVubinv
	2IgusycD65YrKlvMLU6DAJBmrefL3E97x87P1xD+S+ooFPRTEdO4Pw1/ffWB40T5VBuU5rxo+0+
	akvuE+1/gWzHg75TYAV9lLW0nPJOlD1M1GBusCUIYyAWdkxC0+ApwcfhTgUsNBEYWEy2zqBz80c
	kRhMuHCD9r4uE+nBKMwvPtIjDlX4z9lqPGH7ZCQSuXVJoM5TUEmtPFR2484utd2m9Ha7oGVWNXO
	g73TDidM7VxoDl1gF0zE+u4FFDBNdRyzP5ZSmUEtquI6Gx8cgrlPkrzzEfYBUvlKU/sttarJM2t
	QjgokAY4kHtdxXlS2A/D0nP3A==
X-Received: by 2002:a05:622a:4a89:b0:52d:8743:bc83 with SMTP id d75a77b69052e-530549f8267mr74233561cf.34.1788869962642;
        Tue, 08 Sep 2026 05:19:22 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53054180b8fsm110214701cf.17.2026.09.08.05.19.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:19:22 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-90e8535619bso71207856d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:19:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzVmhZtBd0Hq5NDiIBZon/ZI+2QxxdBt7RUsNAnRXhj6BGm1JEjVFbUuXTl+yiedRw5EZexOhI8oHraXVE=@vger.kernel.org
X-Received: by 2002:a05:6102:8098:b0:783:79ac:9dc3 with SMTP id
 ada2fe7eead31-78a4a880ccdmr9426846137.10.1788869517073; Tue, 08 Sep 2026
 05:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-rcar-du-dsc-v6-0-f8ef711a7494@ideasonboard.com> <20260907-rcar-du-dsc-v6-4-f8ef711a7494@ideasonboard.com>
In-Reply-To: <20260907-rcar-du-dsc-v6-4-f8ef711a7494@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:11:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXA6koxaUjv7hobWhL4eJHHDnBtn6Z44uAbf=3thn8oew@mail.gmail.com>
X-Gm-Features: AcwNN1WQMv0pxPEjkRceB80LKKGbxYp0qnUsTTCp1Uv8lpJfhrW-zDPu8BR9rQQ
Message-ID: <CAMuHMdXA6koxaUjv7hobWhL4eJHHDnBtn6Z44uAbf=3thn8oew@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] arm64: dts: renesas: r8a779g0: Add DSC
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Sept 2026 at 11:30, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge is placed between DU and DSI1 units.
>
> The current dtsi file does not represent the DSC at all, and thus the
> pipeline for DSI1 has not been functional.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: separated the sparrowhawk changes]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, pending acceptance of the
DT bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
