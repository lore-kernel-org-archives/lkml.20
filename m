Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAAA4718D1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116318; cv=none; b=pOgnhdumLETzL1FhoNbhnzobwgFqDLy97I+6urG86wEsNxLmPuOCM5vGrEyn/yzkRrnJNXPX9II2fQCD5g1onhTz5EroWR0vNC0PsmveJrRZSAbYHJW8oU1OUXaLyn+XYpL6R7mlBZ2HVH5ZfAA1TyZAjaB6AI7iIY7+t1unDXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116318; c=relaxed/simple;
	bh=h5QtskLdwN0aOposRJmsMlXcFaOCxlrGFlXawJuLUoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ksbpmOhKbxlUD4MFRIqioeOiOLsP65KYDWgz9Mv1wedTI5ugNJjN6J0Df4MnWfO/RsMmpvjH3+oEpCIKi0EQYlfvw87CFLgbxgQxwzMOP4mtE/5kI9g4NbqQF32fwDSfbc5AwG1mUq+FaQd9Y2NRG1xMkwgsbFi0GD9cHnUudlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5292faso293391e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789116310; x=1789721110;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dFqCzfESKQLEVO0Bv6rt70nL97v3lPj6zjiKBmAFaxk=;
        b=aEfK8wO/EyDvcRynZZ0YTzp2ZrpZGu0JwPTCfKia9AV4+v+JKkhWo4Pu9VzS9kBhxq
         gG9U3QF2bkb0S50Fzv6nu7euH6ratnldmWIjr5sP3q42nTim9JNQJKxkB3oeTLPTh4x3
         0uQm7cp1DPrphe40dJjYNSbvgJhlWnNp3F0uCQUwuPIgF2QBfIOoIe/4VuBhF/2PAh6c
         CYcu3r4ZgAN2OsUoffL1kIW7DZ54kdv9kEtpDrRAZgUpGNN4IukiIjDqhTjjEjwClJLj
         jWQxkL0oz0YiwrHqpL8ZOVgBzqXyqQvTMLdWrshwJuj3hT9vOUkTcVDHAyv+DsI8fUlQ
         qNHg==
X-Forwarded-Encrypted: i=1; AKwUvBwkqYinGyf1TIf6Wn9RZ3dy0FOp4ZBwghu2Hk3q107ujrMTrgYLHgqXaOZsZn2xa1fAjIrobaX9AuHzVN8=@vger.kernel.org
X-Gm-Message-State: AFuF++nFTM3NaI+bCQfbvsczWc2IjS2eOb/FNxGrrKR5lUmwIniaj2wh
	65hrYAYGq92UvhaGwtbbGjo/2aqoGw8f04UsZW3OEN/wZM4WV4bcdSz0s338gMRJ
X-Gm-Gg: AYBFou0LC9mQqP+FcmVr3bsTGLhbaEClB+NaQItTciu/RSNS8o79PyeF8WTJYNXBjCg
	qJDiciuK6+k8OlZ0pNIzIFC7uLA7IH32gp/VZgmy1Fav2cGq/HNBDQM7tpoprMLFCNU0PUhi4a3
	OsPvaofBUohiQA9SlTZYdiZQ3tVEcXDyoqY1f3Fb8/4BzrU0aPJqWWI7W86D5m3ZTvpzcgnG/Ng
	zycP26506o9DcHgfYcK5Le4D9pzPzpRxDjppkT2GAHc3ZSba8SNCjIDsadTutpC8XiYJtflEaDT
	xHDiQ5xzIAnc/QGuZiPouBBIytn1JH59W83BJVmsUpI0feJLfjD0g/7/1jp2wpbnYjiZU4rVrU6
	1aIni6Lldkksk8NClkSDnDo5vdEnErp4rAo1rY1ypDAPquWg7JCNAuwCymzayEIvBsweXbm1J4r
	ReW/3QXG7G2UwOgtpYZIPGVd/gbhvU7J1ykQu48lDH/9lDmLuSYrAwaD0jw2P3ok9d+/csImxdW
	x6aRxBjtMFH7eok2TxuWMYyHXBg986q0sr+
X-Received: by 2002:a05:6122:8c2:b0:5bd:b2e1:e1f5 with SMTP id 71dfb90a1353d-5c846073f75mr1999893e0c.2.1789116309699;
        Fri, 11 Sep 2026 01:45:09 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c846f77dedsm2000570e0c.1.2026.09.11.01.45.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 01:45:08 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78a6c77d255so153932137.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:45:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxGJmZvEOulMveIxlg20hD9EiVBgfWgrdmWgnUaFtPumPbEW6zlEF7cR9eHWxVWJXYz9uxRwEJQEd9ldq0=@vger.kernel.org
X-Received: by 2002:a05:6102:2907:b0:789:3f43:645b with SMTP id
 ada2fe7eead31-792a83eee14mr1339655137.2.1789116307687; Fri, 11 Sep 2026
 01:45:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911073058.253000-1-den@valinux.co.jp>
In-Reply-To: <20260911073058.253000-1-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Sep 2026 10:44:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVAFq4izexG=Sf2i9dZdMMNLnb85AVgBazAFMtTA2jwxg@mail.gmail.com>
X-Gm-Features: AcwNN1U9x2Dw0_q7aq6BSLyw8iIHJUaRM391u6KpE8PvZrGWtybbNLMNuLVxPdU
Message-ID: <CAMuHMdVAFq4izexG=Sf2i9dZdMMNLnb85AVgBazAFMtTA2jwxg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f0: Set UFS lane count
To: Koichiro Den <den@valinux.co.jp>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Vasut <marek.vasut@mailbox.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palash Kambar <palash.kambar@oss.qualcomm.com>, Bart Van Assche <bvanassche@acm.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, scsi <linux-scsi@vger.kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Den-san,

CC ufs

Thanks for your patch!

On Fri, 11 Sept 2026 at 09:31, Koichiro Den <den@valinux.co.jp> wrote:
> Since commit e72323f3b09f ("scsi: ufs: core: Configure only active lanes
> during link"), the following error is observed on R-Car S4:
>
> ufshcd-renesas e6860000.ufs: Tx lane mismatch [config,reported] [2,1]
> ufshcd-renesas e6860000.ufs: link startup failed -67
> ufshcd-renesas e6860000.ufs: error -ENOLINK: Initialization failed with error -67
> ufshcd-renesas e6860000.ufs: probe with driver ufshcd-renesas failed with error -67

This is very unfortunate...

> R-Car S4 has one UFS lane per direction, as described in section 152.1
> of its hardware manual. Without lanes-per-direction, the UFS platform
> driver defaults to two lanes.
>
> Previously, the core used PA_CONNECTEDRXDATALANES and
> PA_CONNECTEDTXDATALANES to configure the link without checking them
> against lanes-per-direction, so the missing property did not prevent
> initialization.
>
> Explicitly set lanes-per-direction to 1, now that the validation is in
> place.

Given this breaks backwards compatibility with existing DTBs, I think
this new check should be relaxed iff the DT property "lanes-per-direction" is
not present. Are any other platforms affected?
Possible solutions I see are:
  1. Skip the check completely, like commit 06a34d9c1f47b923 ("scsi:
     ufs: core: Skip link param validation when lanes_per_direction is
     unset") does for ufshcd-pci?
  2. Correct hba->lanes_per_direction based on the actual values of
     PA_CONNECTED[RT]XDATALANES?

Alternatively, ufshcd_init_lanes_per_dir() could override
hba->lanes_per_direction to one if "lanes-per-direction" is missing
and the device is compatible with renesas,r8a779f0-ufs.  Or perhaps
hba->lanes_per_direction could be preset in ufs-renesas.c, and not
overwritten by UFSHCD_DEFAULT_LANES_PER_DIRECTION when non-zero?

> Fixes: 5235d551779d ("arm64: dts: renesas: r8a779f0: Add UFS node")
> Cc: stable@vger.kernel.org # 7.2+
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> @@ -901,6 +901,7 @@ ufs: ufs@e6860000 {
>                         clocks = <&cpg CPG_MOD 1514>, <&ufs30_clk>;
>                         clock-names = "fck", "ref_clk";
>                         freq-table-hz = <200000000 200000000>, <38400000 38400000>;
> +                       lanes-per-direction = <1>;
>                         power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
>                         resets = <&cpg 1514>;
>                         status = "disabled";
>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Works fine on S4SK, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Will queue in renesas-fixes for v7.3.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
