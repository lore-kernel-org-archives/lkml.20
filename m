Received: from mail-qk2-f24.google.com (mail-qk2-f24.google.com [74.125.230.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFE555C316
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091487; cv=none; b=Rpr61sz/AdfxRlg5n4oDOmnJYD0xuF/bwlNHPrEFTUNGtNHUgN24GSBg6tU9W8at5kqCOgWqOfj4WNEEEHvDQR1HZ9qm5mLV8BqDKjD6Fm4DK8/k9Wqf88ZWUL36+b0eL+RiBQ7zRCdu4gaWzvwwer80fd3ZzRUGbfO01rhtG3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091487; c=relaxed/simple;
	bh=/ukrFcJMdNfUbd95Oysy1/fsP+8xyb8tq0z0ZJZKRFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFSNLxTxbd4PmvkoaDdDZYx120OvEVrLuMtZgQa3FKD8vLqZvsVhWVODNIogG2AKvEDAPS17VzLTPinNFveKNxOARnzqGJGg3oYDKngM7ujHXGUHwk7PL1MLv63GjwGxF8FY+uwDrjHe5PvAryJuFyeFaTPi17R6rxb5C4vfbYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk2-f24.google.com with SMTP id af79cd13be357-939695b5741so4842785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091485; x=1790696285;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A0rEYpC8SPWX296ZTPGePNnfJTd5Ihf4si8iFoObZU8=;
        b=KvS+eVdYjg55mfAxNT8sXd9M8a7aRVmY2P+iij5IdN2zpX9/ZnOdChWjnpv/ieEDZQ
         YY12ZpJ5MpU9Y6XOlEZQChMuQMYTNOhfFAXpxze9fir2vAZ5XUP7W0GvEZvJdypp9b2N
         QkKTnCVSIk011GvmF0ZIEiu+dh+7IFAuHLvmcF4mvo9kdi9JpZpLgRw6Im/Q6+VBA8yr
         lNuv+dyNVQn0fY7F9WsZe5nK8pnKvBvBH07rf+G7lKa14eJSOMhNsLP5exX9UZ9BXq60
         lUbqomAhcDkg13MqGJK6kSst0FtKmDPwuJAoBPCP0p+Fak6ub6DbfCCTqB3m4MrvXJIm
         nvbg==
X-Forwarded-Encrypted: i=1; AKwUvByvmTX85Aa2eXDdFRLwte3mFQbSJS9Euw6JFKT2ResGU4DW415u7KIHTiM08MlrYE+TjGWkb9Y2CFrbfBw=@vger.kernel.org
X-Gm-Message-State: AFuF++nxmVcJ8XABCJMGQxIvGO7glwUJw7qcvmadqPCtgOADPZlcZBs2
	Gv+3a5bmN0CRelIbu0J+iTjtp7bY1azA6FGBfVQUvEom+v7ZckXVrb+3DMT3BfDZ
X-Gm-Gg: AYBFou0e0nrpvCRoKjMa2EaIlDq9B3rUnKKqFATi2el5vTJmLhrqdI8/q5BEzfP3xnB
	85lt5S7H2vhvjYh4bWbJ65AIoFW7toujXJbAbozMlU9YXF272IF8dzkz+WZ5SxXDoqg++mqcXwR
	VoEXFBXefwAgU+MiqbjhrqnIHagcx+etF07G0NXlQ3AIPbC7i6ZFMuEzhl6o0jWBEynt0re2rxE
	gXevWO8OyaIIhAJemqccCwXH5HE/qcluDOwGgkPVd1E+EDsXRXFVJrdZPMpZaH9Mx/TtLpchLat
	IcIv4nOCwbSoDHRwhiqpB3lrXJLpm15qv/ZEv/csPv4H3nOIHNnq40VEDQtz1rQFbXSwtzigJsn
	SzyL/dwey5IO4vPxXAaY7t2WzhmMEzCclkdLUbqN0vwPdHLIA26hqhFak5zQ/WgmDL30s+xxtXp
	e5XxrEP54uGgEkJAnUomxn8l8+ikhkAjgrAhsvPwXRd8ByxrUjgi0Gw9KXXISh8JjT4Zmpo/ayW
	NxplIOLYeyMVYaxmKGKX0D1e4XV4UVZ7ZD4oA==
X-Received: by 2002:a05:620a:2946:b0:937:3a1d:175a with SMTP id af79cd13be357-93c15d54575mr669126385a.3.1790091484570;
        Tue, 22 Sep 2026 08:38:04 -0700 (PDT)
Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com. [74.125.230.205])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d1cac78sm170207185a.29.2026.09.22.08.38.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:38:04 -0700 (PDT)
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530fa0716f6so564091cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:38:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzr159T9LD+zwlI9eSFgO4iOMcgZmdndqb1fQyLnSjybkkKBpDFY1MTzkfgkHZKZDUs+nZB6Q9emk/+naM=@vger.kernel.org
X-Received: by 2002:a05:6122:893:b0:5c9:c60a:e9af with SMTP id
 71dfb90a1353d-5c9c60af4cdmr7442761e0c.21.1790091105880; Tue, 22 Sep 2026
 08:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260921110144.44425-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260921110144.44425-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 17:31:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU5srt57ABpHqXjM=hiYv+iAHBPu5LPsKb1u1N5q2ub5A@mail.gmail.com>
X-Gm-Features: AclHuK9iMHOIXZ9MmnycyGypUmOvSRrnhUAGxYcsZMveRI3d88Yc1uUP9CxLaUQ
Message-ID: <CAMuHMdU5srt57ABpHqXjM=hiYv+iAHBPu5LPsKb1u1N5q2ub5A@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a09g087: Drop unwired ADC interrupts
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 13:02, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove the compare match and compare mismatch interrupts from the ADC
> device nodes, as these interrupts are not wired to the GIC according to
> the hardware manual Rev.1.30.
>
> Fixes: 4ed27b4fdeb1 ("arm64: dts: renesas: r9a09g087: Add ADCs support")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
