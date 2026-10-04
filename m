Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8853243E06F
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116018; cv=none; b=tFxGNDtkj/xQAIZdp9/L4kKGpMjUatQ4BepPRb1RZcrUP2Tr4U4scbM53MSQeeuj+3+kGnMmb00bLTgCKxRiQ0fKzCK4M8yagQXV37+W/qxJnOqBSA10Y+6c8k452jN3aihqDdPRMUtRmCeXOHTjUH4gxo6/uT75A0+WM9kLHq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116018; c=relaxed/simple;
	bh=5Pr4pI6UHbC0U2MKjSQsGnO4riVPy06dn9dWWcRzV98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2BiglklUHDO/YoxWmvgSGc/1CEM4zMm/E5Xp/f1rAktXuidKFGmk2uWJY/WFUEN6NAr0SADgYXSc87quVkaSzdLsx/Vta9cw1b6G6iupImCKeJd9oBh8v82nxlsEkMgUsZddU+vWD2uMb6+78Pq0KAPuAG+pngJr4YSyxM49GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f38.google.com with SMTP id 00721157ae682-8ac4deda6d5so5508047b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116016; x=1791720816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfYr76LOTu8jVRzggIwBN8xVUqu42mEkcSJCjGTgQ0g=;
        b=AB1Lncyhovveq4wlxjLP5ZX6h+9YYjj61lluTJh2PeLFJMPrgFxqcMi280vO25mAko
         PRcWMEbsHfsPW5j+HXNWTItPWOzv8stFsPQr+AAR0qgmv6YAwoteVOgvu4tTPLdIrw8a
         gHYMsAFa0mHuBwGwYO3E3wgCg5CKo4cu1nndj3KOxWgv9xZVdRGaUXytusk/ktoZOpq4
         5DvyNgbsnZU97avx5xktbLlE9R0yH1BX+6hRnEvIYB+tpLykDfmtpxlFW+sd1HUmahEH
         pg14ruO6AwLIf66jlKQuCdkn+cPr7s45cU29ZxzT7CeDbned07lUpYka7yDIc3iC29hO
         C1rg==
X-Forwarded-Encrypted: i=1; AKwUvBzaX46yqILx+4KffVNAkb3XF+sAc1PXNPQzVc2/M/Ubs0ouMTX3uMOWCKS/C34JBc9WqYdH3AUXvaSYFlk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoKwUTJWxIeTEjXmYdzoyHgTv/5nBd11t1eg1+JwcCWT7fFokD
	TgZuHiIts44M9Vi1q0szTarZWM2J9k+dJmxFE6h7haF205kSEr5k6oj6G3XbidWObrw=
X-Gm-Gg: AYBFou1xEeVZpuVC9hCO5f0+ZF9EUSjCd9C0DXXpx4BQbi9fCmz50rRYOjKS84PYB6W
	FAhoL1QTeAJ6QKNlyxuOsSreQvs9a96e+kHHnbCYEBthI9n7oYfVAAaR97zcYezfQqkzBFbJrsC
	L4+l/tG+ZhmVUhLcWGp0OCLOW2X2K0yzN2bPCXXn79YWOnllFi7aucusPdMtXrMnGWP2OZPNcKq
	EFqJ/jnlzkP2g8hVZ+7wjijC1CF741YKb5Gyrb4HEfgzIeIhpaWcJM8geJnFmGyqG/fxBK5X+eu
	0VARprgS+Bt+kHkzNbwrwDkpz87nnCAZToprsYizwoIoUiuumyqFdSypLnjT/2wN1/SOyKKBYh5
	ZgGKnZaRLD535jWqhI5fuHoEDopR3hIEaCWaO9RyxBLyxrnoTrzSBQ8QC0Z9LOL6YWPGe/DJKTl
	CQEfaTFt1Xahx5AeEl4TUXgCWNCc8W9TlclUyda+a8c7XnbbE2BeyLWv96ZPSJVbzcFZSITaXEO
	xe5l/NzaZp2Y5tgFtraNzYME5IzGceYU9Sxhwd1ZlUBHurhtNFJMpYIZpNwBvKj
X-Received: by 2002:a05:690c:e3cf:b0:8a8:8945:c415 with SMTP id 00721157ae682-8ae39bea565mr33020737b3.25.1791116016518;
        Sun, 04 Oct 2026 05:13:36 -0700 (PDT)
Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com. [74.125.224.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae32fe9ed3sm27306457b3.29.2026.10.04.05.13.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 05:13:35 -0700 (PDT)
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66e4ab201ecso509565d50.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:13:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxHVOpDPh50E75ZrxEfLGEcg//XZ/Rbw6po5zP9NyhjX+IgtEjb2AwSUb5MInQHrdo+pititc1dc9XECXY=@vger.kernel.org
X-Received: by 2002:a05:690e:d01:b0:66f:7e05:c3f8 with SMTP id
 956f58d0204a3-677ac00785emr2680725d50.42.1791116014048; Sun, 04 Oct 2026
 05:13:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905153234.133217-1-tanure@linux.com> <20260905153234.133217-5-tanure@linux.com>
 <aqSX-kUvYaixESxe@redhat.com> <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
 <1jcxui79k0.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jcxui79k0.fsf@starbuckisacylon.baylibre.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 4 Oct 2026 13:13:22 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+0T=k44tHbJ5BSAsD-RvpytA6mLu1FKu_2GZgYucorXNw@mail.gmail.com>
X-Gm-Features: AclHuK8rosb4K--WkyZLuEcRV46M1KSWdwcM-4rWMY7HfYobH2sNfTEc1o2MX3w
Message-ID: <CAJX_Q+0T=k44tHbJ5BSAsD-RvpytA6mLu1FKu_2GZgYucorXNw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 4:51=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> On sam. 12 sept. 2026 at 08:50, Lucas Tanure <tanure@linux.com> wrote:
>
> > On Sat, Sep 12, 2026 at 1:08=E2=80=AFAM Brian Masney <bmasney@redhat.co=
m> wrote:
> >>
> >> Hi Lucas,
> >>
> >> On Sat, Sep 05, 2026 at 04:32:34PM +0100, Lucas Tanure wrote:
> >> > sys_ampipe_nand clocks the pipeline stage inserted in the bus path
> >> > between the SD/eMMC controllers and the NIC_MATRIX fabric. It does h=
ave
> >> > identifiable consumers - the three MMC controllers - so marking it
> >> > critical was the wrong tool: the clock should be referenced from the
> >> > consumer nodes and claimed by the mmc driver instead.
> >> >
> >> > Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
> >> > sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself =
and
> >> > have no single identifiable consumer.
> >> >
> >> > Assisted-by: Claude:claude-fable-5
> >> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> >> > ---
> >> > This patch depends on the MMC controllers actually referencing the c=
lock:
> >> > the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
> >> > clock must land before this patch, otherwise the boot hangs and memo=
ry
> >> > corruption this clock caused are reintroduced.
> >>
> >> This series should be merged together in one tree? Which tree? I can
> >> provide an Acked-by if it should go through the mmc tree.
> >>
> >> Brian
> >>
> > It's definitely best to keep the series together in one tree to avoid
> > boot regressions,
> > but I think the clk tree is the better fit since the core changes
> > revolve around clock logic.
> > Could you accept it ?
>
> No. This applies on top of another change already queued in the amlogic
> clock tree. It can't go through the MMC tree at the moment.
>
> This clock is not critical in mainline right now, so
> 1) I could merge this and it and in practice there would be no
>    regression. The problem you had would still be there until the MMC
>    change lands
>
> 2) Or you can wait for the MMC stuff to land and re-submit this in
>    the next cycle.
>
> Your choice. IMO, (1) is fine.
>
> >
> > thanks
> > lucas
>
> --
> Jerome
Hi Jerome,

Sorry for the late reply. The MMC side is in next now, so the clock has
a real consumer.

Can you take this patch dropping the sys_ampipe_nand part or
should I re-submit a new version dropping sys_ampipe_nand change and
only marking sys_am2axi0/1/2 as critical?

Thanks
Lucas
