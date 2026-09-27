Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com [74.125.227.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9633E3163
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790512168; cv=none; b=QfIXHcgx9/buUqRp89ua6kGX069SBG6DR/NO68WH0nmf8OG5gpoQsZ6FobvQX15+Hyc4tv5mqbNXHzfeutJ9AE4005hpNENxSuLG180Kyo0ieHarfhfpCIzGSA67NGOGyEvSzXZCzBz/kkOFnyj+yABv4TU/KzJtdXRDvDjvQag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790512168; c=relaxed/simple;
	bh=HDboq6EhNxHP1SC0MpV70Cq5drBQD4KcY81w33QxDHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ND9GZkGSrh0nOrR74/2yfwoogI6N86/0nW7goCwXdMgni7atwJDwL46gfqH4lN0T8DX3trm3hQXl7WlpXzA7syZojC31xrnhpuMDwO7g8aCBd8hDhrCo+jrPfFxch4Ww3G/Znu9Y3c+ZLkhv+AbRvjoho9blqQm2mDodaQV0q5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f37.google.com with SMTP id ada2fe7eead31-7b42f1cbcf3so514209137.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790512166; x=1791116966;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rt/VmvtxGRMo80r5H6ofmpt3nn/BIq11DVjtj9mgh+c=;
        b=n3/Zb7jUl0CIRTTwqxPx+IJ7gLRVDWkeogblt5LTEus5maUmeL6SFoTiuIUUQ6aaCf
         hWtG5LZ6vaA6Jp+pjCC2+c8aT9FOWHJzbjQI1Zwn8AFNrX1deB62TLgsQgHlfno/ydi+
         66pZF2XWN4TVb3NZ0EaRFU8o1SB74fPzAWtulsbzwBov18qw+B06/fAkvcA6anbOpRgk
         StxWt5cQlA1V/d2bhDCi+GYkHZREgvviHZPqPJfcp4uiZTlZsndqXD2AXlCfuypaCdCO
         DdoGwWxmaVLOAnsZhGdv8SfFWrddu7GEvSXsMFXvRzo5qMBGx8Vmi7jayK6ywhHdt5Tm
         4hNQ==
X-Forwarded-Encrypted: i=1; AKwUvByRVIWYZrJLgSTKZ92AYn8RLHJN5rZ7IkAKX3He0/ALfFo9Bakod12rdK+BgFdDpuUnUBbH7iuKvneiVLg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCRTcg3xCjyaL4/OaaWvYkWCP5H0FdY+aQHFAp1Mk6PvQvdkTv
	SUKorFaY4gBxD4mvoOBLxJ37puvSlPmZkHJTclZSANCxq58Reax9u0UpSptF8EZN
X-Gm-Gg: AYBFou002ew3iSLe5mHQtZvmGSR/F5tIcnpXJGwUqfyIUgMyv/cj30ZTjF3ccOkhuIk
	oyulkAZJgwICETA0atbSwQxQ/5k8U4CbeHGEWOT/oAx4+GL3+jp2s9rnl4c4iIFTMiAxhuMIwLU
	KV8V5RZsLiwfUHWt5TokQr7r/yM9zxcaIvCdnqQ+FD355Nu0XSL07ZVZAnP8G3/R4fRiWfHaKg0
	QSnn77gxQVZ4bKHN6lACVRxjry/Ul0P8GKRDkTj2RQ821IzMzjB8cdUjb5HD2ls2LPy+WHYeaw9
	g3retDFXY3VjXkV71E4U/QjQqP1gYXLrpwqSlg/b1AS3yWSH+V37cSXVrU1LmiOdvZvalC3zGd2
	4My0XmH8bc9zulXZ7vFrf9UxhxrIAEzHJIQPKajQQzBoSGYLtCUjtXBxF49792YwEjBbjV4bNA9
	mAE6iNqG23VckgJj5ZksBQyXrao08dFIFFcEJqDPryy9iHMx3LO+PX5yLDq0kw5X31M7nKROGAf
	RP4nv3vLeX9HtHOumuQLzf9IHCXSFODKjlc
X-Received: by 2002:a05:6102:3e96:b0:7aa:a6e5:fc76 with SMTP id ada2fe7eead31-7af1cb9e186mr4187997137.9.1790512165823;
        Sun, 27 Sep 2026 05:29:25 -0700 (PDT)
Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com. [74.125.227.39])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde587a790sm5109993e0c.9.2026.09.27.05.29.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 05:29:24 -0700 (PDT)
Received: by mail-vs2-f39.google.com with SMTP id ada2fe7eead31-7b240d1d786so1130571137.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:29:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzvMA+izisTmeQj1JTXjN7AF1aj1XLAKosw9wybywBGm3fUOk55ho7FWDIaFnVhpCXwNdT/zw+OczRbiwk=@vger.kernel.org
X-Received: by 2002:a05:6102:d8a:b0:7a7:19aa:8a86 with SMTP id
 ada2fe7eead31-7b38f5c21b2mr1195489137.33.1790512163780; Sun, 27 Sep 2026
 05:29:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826160911.460165-1-p.pisati@gmail.com> <20260826160911.460165-3-p.pisati@gmail.com>
 <b959b6d9-2fd1-4eeb-bc45-4968321b3ff1@kernel.org>
In-Reply-To: <b959b6d9-2fd1-4eeb-bc45-4968321b3ff1@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 27 Sep 2026 14:29:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNcDgK-3JTU_TO4V0uhQswR=yE6=pL46Z9gsP2PBnKyQ@mail.gmail.com>
X-Gm-Features: AclHuK80N3Huj581BdS3l7h66uNHbFmlTSJwMV0kOgIhzBn2ANIPVZOF_CQgtV4
Message-ID: <CAMuHMdXNcDgK-3JTU_TO4V0uhQswR=yE6=pL46Z9gsP2PBnKyQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] m68k: defconfig: enable PATA_CSWARP
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Paolo Pisati <p.pisati@gmail.com>, Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 04:45, Damien Le Moal <dlemoal@kernel.org> wrote:
> On 8/27/26 01:09, Paolo Pisati wrote:
> > Enable the new CS-Lab Warp PATA driver in the Amiga and multi defconfigs.
> >
> > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Assisted-by: Claude_Code:claude-opus-5
> > Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
