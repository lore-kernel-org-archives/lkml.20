Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19CC2AF00
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790550952; cv=pass; b=uIP2C7XQ2nz1Mr7uza4FWizrta3LSDdS9Cmopeue+mjZsAjXjukWVZRPXStkGASxThlqpxHcvKr53uX6MuyaRTLI5ymognkkYs44CDtvx0jAUat2zPlWS6S0ayDsP/W9TRgtYGCVtbmQCj8sbBUgpn1b+mCNg5o1ukXEvVY7p88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790550952; c=relaxed/simple;
	bh=Ou3b3cWlbHbJ+7kgTjQuk4/2d8eoHkAAMLMLbj2Apo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8Tk4jMOfgOHbiRicSUQ5xdLbgQwUKBdqSSGlR+qnjgC1LTNf/1xxz/q6vOaSIzjIN6PxZzZyyLkakNACudmTTRCyGEE3z7I4PR5FmQ57+u6dpLna4S6mS27ijNCYJXWQV6bh0EGBXmCsRnmS+yLcDLB3ecnU+snmGnU7CM0D18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+PqK2M3; arc=pass smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+PqK2M3"
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5ccfbaf6da8so571065e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790550950; cv=none;
        d=google.com; s=arc-20260327;
        b=FMmOwUlHTn02P6+Fxu5jAPFZmj6XfcSj2v9VrE7AEVCHNSkPx5MtrIBLDNTNS36fkR
         VKefaSjur1SPl/Eyf8FgxaaiCf4Mtf/ZL412zgY0aWtvdi3TiaUNqeAm4kXwBjgS8Lxu
         yL2KTnLMG4fCMpESAZj4Lcg+0IRrwZYV+kIm8lL3DAJaxyh+wQhotap+SF4u6YUyPgOt
         NNIwJKaEry8yWFBJmUU3BZyqx9YlkWE4BPMfcaB5dXQ97goy+4ZwmNkEz4ineDJ5hpkU
         5+vhnk31DhrPL7N3Igv89lNKb3Am+lwE/+uVhtR9UWH2fEk4JqdMX6F/QmDilGqcbp+h
         Nb8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ou3b3cWlbHbJ+7kgTjQuk4/2d8eoHkAAMLMLbj2Apo4=;
        fh=E1SyJ8LsCD/Ebu9ylDeb5myuDApJhW7JcnJAfRkYo6Q=;
        b=ZaaCPxrYqyWLBojt8dzYNqKK8ZAvb4FMR1Rf0A8By/VaQIYZySv7L+PqHozi4GXv5X
         Xns+HMZwbCk3CFxvFvJMZ2I6nZOVkgFRn5y9wvCOVBKyxKwvoWiGu6BdSWvrcgr4bpzq
         SalMMId5eO3cIdwrRwkgo7FDtBu87YQoPEAqjR6QUwmpvSCAl3VW2z58ajrbESkgUdEK
         pa8x0DRLfaipyUBxQdqovLhPmH9kg1MYONYuCzVd6bhAOSSQ18Ph8DDA4rxTlrmouaks
         f58qNzc0JicY4W2Hhx3RMnPuUCy/80lo4Vwwa5Oj+8gNTlFHUvDlHdE/8CKWMZqk1NEF
         yPvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790550950; x=1791155750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ou3b3cWlbHbJ+7kgTjQuk4/2d8eoHkAAMLMLbj2Apo4=;
        b=T+PqK2M3lz6/GTLTbfZ+wf3aH0CDX+6TeFjym9+zJKGpyXZBxlmBOEa+bHdSrN+L6L
         BncmTDBzL/9lC4Xq4JftFpOBn6xfR1/LHL6L5gYkF6VoEtTAYYVQpTghOM6I4tcbtKar
         oIcmUwPU3BmUtsKWo+aCKFc2Y8jdJBNNr5iABZ6lFf9QVCKtC13Lk8vgNU9OsSQpygb0
         uYMd9wcsSuEnwRkV6OB7JdMHqA3/Vd2Bm1OgR75maAc6Vv9X3KdObSIWTvc8RXmLgoOn
         ehx1VXnA2MTpbY1aXfrL11rTOH8IGNB9cOz63EOKNIRzunvpE7Jj1JbiZqQcONtUpp6s
         e1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790550950; x=1791155750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ou3b3cWlbHbJ+7kgTjQuk4/2d8eoHkAAMLMLbj2Apo4=;
        b=qZsP+yksXAZgMh/4HvssgfIw7X59WjiyDpS3yfvYMUe/M6w8DeFqSV4AMsLsYMGP6X
         6FLhhnPddhiWFgQP8nCdtaAmwGXIQ5aEoYhEcqWV6thxjAX2w7WoXi78mfa0A+UF7VXV
         JXvHNYSkdyTYmAM2+m3k3JX0VjCtss02eMg7tObE41qG2U4JobCwmyWna2Xw1I7jHPs6
         kYwInUxESFl6tOcCXhWydAGhkTUll8Okj2ir/AYCyiD8Bom5Olu+56+rsV0HjhLgL9lq
         HLJQqqgVJRwvEcg9cXr3WzTkQ7lLUYf/ABLVebU+5VXtkPX1eVgUj+TpeM4VBwVeyk2a
         yNyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwK/eguNuP6pj99uPA9kZBu+7LtA4ZaKq/HmabU68XA2/01rjPiisVUxd6AFVbDhqTUizCqJE6m8kiMAtk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmRDfzSJhdcVaxcwgMB7N6kuk2w+kFUw3wSlzhsNni2iIRpgno
	98rkwu2un2fOjhLVsS6RUQBjAorEutkCFeidBq20KWCnRuR+B9CNM/9110BhyePFUPEb6aTOIGh
	MpvV8m3RrBBZ/aR6EEiYgKA/2ulvrW4Y=
X-Gm-Gg: AYBFou2ti6nwM/rAACuOCWTVKr3PtxMpiP70rBvMl5rCaPLtcMZzn5kT0j/KBprj0G3
	TNpXtJwTvVRixfWV9Ba14iE+TJCn1YAyDFlFCPKJIwg3BXnkcMxOy2ARvZ96EGqyLBR0GYlmwio
	LyIpUWvEyAlIdyPZlhepB7sFipAVRCjFPQ5lh62ZWVZGmtfYBXkfrnkjLv/M1XRj1rUVbf4CB1m
	QqRxoK94ComD36CqlWBwOgkWAlY8V3v8dKTX94DgHFmxpVwMVrINJF2LgMpjMLH//sVDH7eAl7T
	oeoFk0EggGpxeCXXZzoJv3Pri5EZo7vDOp2qjpP94KzPLyv6ZPNZuUOZSMDgnC0OveD38eQ3XiS
	Zr7URIAWcGgdir6PDPSuTrDzBGYxyaKpL4Ir6gImepkMkmT4wiO8IV3nFSJzvjJQTb3T9oJ0xVC
	vPL3uaFJcM9B8EWRYCWruUaI9vnE8v5NiC1jxPyNnOBIoo
X-Received: by 2002:a05:6102:1627:b0:7a5:673f:9a37 with SMTP id
 ada2fe7eead31-7af1eef5929mr3482037137.15.1790550949793; Sun, 27 Sep 2026
 16:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927-submit-stmmac-reset-fixes-v1-v5-0-feec6c14dd06@gmail.com>
 <20260927151043.7c8dfb36@kernel.org>
In-Reply-To: <20260927151043.7c8dfb36@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 17:15:38 -0600
X-Gm-Features: AclHuK_THxkPfcffLWRyKYWHUWs5mZ9sx2wsFti5QobsyH-hd7-eV_3I5VuXwpA
Message-ID: <CADvTj4pZpJBAa99F322jBetg96axu_Dbv-iKAWwhOUqe==EE1A@mail.gmail.com>
Subject: Re: [PATCH net-next v5 00/19] net: stmmac: preserve datapath state
 across MTU and resume failures
To: Jakub Kicinski <kuba@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Serge Semin <fancer.lancer@gmail.com>, Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
	Richard Cochran <richardcochran@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Ong Boon Leong <boon.leong.ong@intel.com>, 
	Voon Weifeng <weifeng.voon@intel.com>, "Song, Yoong Siang" <yoong.siang.song@intel.com>, 
	Linus Walleij <linusw@kernel.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Simon Horman <horms@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Jose Abreu <Jose.Abreu@synopsys.com>, Yao Zi <me@ziyao.cc>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	"Alastair D'Silva" <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	ZhaoJinming <zhaojinming@uniontech.com>, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Ding Hui <dinghui1111@163.com>, 
	Linkui Xiao <xiaolinkui@kylinos.cn>, Linkui Xiao <xiaolinkui@126.com>, linux-tegra@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Rayagond Kokatanur <rayagond@vayavyalabs.com>, 
	Ding Hui <dinghui@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 4:10=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sun, 27 Sep 2026 15:59:35 -0600 James Hilliard wrote:
> > Keep the stmmac datapath coherent after failed MTU changes or hardware
> > resume without changing the interface's administrative state. Retain th=
e
> > working MTU configuration for rollback, and allow ordinary down/up
> > recovery when hardware cannot be restored.
>
> Please read:
> https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
>
> The limit is 15 patches per tree, you have 22 outstanding to
> net-next right now.

Oh, I had bundled some prerequisite patches to avoid breaking the review
bot since my fix for prerequisite handling for the review bot doesn't appea=
r
to be live quite yet(it was merged but the live server looks to be on an ol=
der
tag still).

https://github.com/sashiko-dev/sashiko/pull/389

That just got merged so that shouldn't be an issue going forwards as I
assume it should go live soon.

This was originally on the net tree but I had switched to net-next since
some additional prerequisite commits were only in net-next and I was
trying to avoid conflicts or having to bundle the patches to avoid breaking
the review bot.

https://lore.kernel.org/all/8ed1298a-4c29-4db3-b76e-c8d34f91b4c9@bootlin.co=
m/

I guess I could move this back to net and specify the prerequisites with b4
metadata. It isn't entirely clear to me which branch is appropriate for thi=
s
however.
