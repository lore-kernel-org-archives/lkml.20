Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CBF3C1983
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822009; cv=pass; b=BPPaR4NVorqN3vwyO6rMGrddbtu7l47A58tS3L0Zt+xImMHEraF+Oiw5kIpgs9qPvm/JYXffLfHYgnfOjIdgo6zm/TXaWjOyttCqTMyfJemv2QbrGeSrdsYOg/3rBMaTWQ1o9HuA/0H8r/oKgBO3R5tXMOTtWiz8XHT2FU/uMV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822009; c=relaxed/simple;
	bh=Ld04QgHnuQtaTldYHRunEt86jN5d7aW7NrQ+RrkqBZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l8TCExE5OS9Zn0SMLuL/TSDijVMVyfDjeADfhI6D/YiyBQrejjVn6V3oXQSdmAz84REoc1uetg4LJ8PKXDmbgAci+MV54EKT5zGadhhbDafmVeeBtojh2wgsVO6F+n+27t4ED11YgqsnYYyjad5z58bs7iSmiu05itneTBIN+os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ml8w3APq; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ml8w3APq"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf452def93so5929895ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787822007; cv=none;
        d=google.com; s=arc-20260327;
        b=Xa3OGbqaHOS0n7mo1X52s78YJ7SW0rOhUwfdA52duMqNI6qEkC8TkOdnqjec1jiglj
         pXc4jCgkqwlfyO5piNXwF9Pr7pB1b1fpSH0Z9tbgXaInYyzrVQ7RKBaTx63TgC4w7yOo
         0fNVQsIrxib9dr+zUEu98/icV2s79Qlxxv3KXGOu14gcsWnppptpabZBsEkxV9UTX8wW
         B2K3AZ2izbT2j1ZDxwuyi4ZcDtv2czQrEQXjTjCNnAnT4jbv/LVV2RSG92+89I7K28di
         eFEzg/evc6SZBgkNsBbVTIiFBIK3tJfWxWeuYgMRtpYeNcwtJq4lIMnKgk4ldrvlPewP
         oDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ld04QgHnuQtaTldYHRunEt86jN5d7aW7NrQ+RrkqBZs=;
        fh=Re5eQCMOq1F4yq50URL2MOuqlMhZemNypakRFfYcEq4=;
        b=RHry00Y0lVv3Lhk+94c4ghUnswlFlwDD+lYZxIyTr6IJr1uCYWUwo5xJs7nS0yzVy6
         k4M4SAKKNFAUDg7UVq5IpDT9gV3MT6RI6B6NWa7aApVvWv4USrfQsB7jF0CCWbYV9hHr
         i39GLOZL+Wi2m2RIUcN07uLE51XJtVEg+PciXV2zsgM1V49dJNQq5A5K1gRuYtoFgetr
         hhxoxwaNBnYxQ5jVSkYKyAh/stNCqJbkTNJj3Nx9L3tbYAHTO4kSoEEftAcaj49XfcmB
         KCoxMO+moX0dmqkRSDODEcZx38Rx4Bt7MPCu/GbNtvuM6usDsebbOlhcvFknNLp8kIWk
         OlIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787822007; x=1788426807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ld04QgHnuQtaTldYHRunEt86jN5d7aW7NrQ+RrkqBZs=;
        b=ml8w3APqBckVikejRjUSgLmPxghuk5Er3MZp9jNyGufE90B0tkilzRD1CrBlHm2vik
         CQp4PsUW8ngM97/hIjrhRqfZtsoe8r56e2U/m5kt/Ld9TfguM74ycKt+QaRDBQx9s6Qf
         8kF2oEpMW3E8swWAFcPsPgVarxvCxQ3gsajnNrja5iC9w7cZkJIP40bpjUsR3L40PI1s
         CZsWDkrSiT1hsnfY5qgMQIlux5jwHSS03NTEwpUwhkBjQi1YvvptHXXt6oh0B6+8Gl+m
         eaqRMX5CT7Hi57p5q6QxalsIH/DY71CVBOq5iP/7lpV6giEJBteSS5LdKWle0PT58/Dd
         o92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787822007; x=1788426807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ld04QgHnuQtaTldYHRunEt86jN5d7aW7NrQ+RrkqBZs=;
        b=Bg9QNgdLEcSXEPVxkURrauyicV39dRs8Qn4v5wHWAmpDl+eqpNraPfsGpuvwMINV3T
         b3HKrARp/wPYWAhToekW8y31eTyKLtIAz1bsrGhPx9aazAg25EeKikbDmtm8mOO0s9u9
         J5lk78btG8eIWp7LMDBnAz03M+nPnCIo5SSQSo6YRWckeoVfezq59V31e4tb/MlLcIm4
         JaqQQyIH5oV4rb0Lp7+RXZ4hDfatz0oUXFf78ppsuSWu3oxf2g56RLlqaJCRl/E2uJij
         c+W1e1NOSgw8DPxnd60qLgOyxkCPv0qeWWMGe26RoyGEy9YLWdbCcYZs6xMW+POPbkCG
         ZoeA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2idNsp/FgLkW/LXBjBVwZ+1kNqcGnhIfO9RbmDninmFnz6FUFObN3eVEzp9AfVQbUV6tC3TfLV3PjuyI=@vger.kernel.org
X-Gm-Message-State: AFuF++nGgihcmHRidsOLazBWlh2FeVBUQorBgS+yuAgZ9oTaVuyoNyQy
	PaP6tPjDXtfGLZ7Ef3FtQCFuwA4UBhdV5t0hAGPX8bGen1+8VuVXkaEuUL6F3ALR7LQM4dzKiyB
	kywXB4QEs+3UGPQgfb7tzkpgJMdVWvv8Rp4h1Ma8=
X-Gm-Gg: AR+sD11plajKJaB4g65OKL+78m02Xf5IMPQbXBwNDC1ZyeJKyOrN5fMOyQkywN3GO7h
	gBMv2jJMtH5P3Yjby69aleOMhNchu/iBqB6fzC8y8Jvkr7GUZ3wUJtkFqT4n7xWTM6F1qJt+kb3
	6At3ZFdJdGzj9gzob2+EkA/bNRmgjUyafLV5RNrPUjp1b/Zpa9mZMCc1MT7GsvIN6/A2eDIGLmU
	Phr4bmmvz36bRrozwlK3AxSrkKbvS+n/JT8+SBQJf/hl9Z5XimLOm/glPUJVmZ7oQXGi7iDf0Nr
	i3wuLh3WZ8+eoB1r37j9sY70GiahhgDrny/2dHlGwd7AfbEqrXyS8wmU98UIokrNgDYxCO2ef4G
	h2gahygqp5OxU4dnraJ7XPBEjohwDGWQxZ5kK5QG2zycB5Z5wuWMjyPvA8gGEig==
X-Received: by 2002:a17:902:ebc4:b0:2d6:f80c:6ff1 with SMTP id
 d9443c01a7336-2d726784320mr62363205ad.9.1787822007483; Thu, 27 Aug 2026
 02:13:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-b4-fix-pcs-lynx-an-v2-1-9bb1dec96f0b@gmail.com> <20260827085533.2a3ocp6llvhzczps@skbuf>
In-Reply-To: <20260827085533.2a3ocp6llvhzczps@skbuf>
From: Patryk Biel <pbiel7@gmail.com>
Date: Thu, 27 Aug 2026 11:13:15 +0200
X-Gm-Features: AcwNN1XkdYMffT-zVIM4aiQ2Ta4r4ChtvNMg7ZZdnyQSZTDvH24EYnxG1cTB2ow
Message-ID: <CA+DkFDboHq+fw1bYdQR_2M9hM+Vp6W=jR0VYCO8u7KXWVq9F4A@mail.gmail.com>
Subject: Re: [PATCH net v2] net: pcs: enable autonegotiation for 10g-usxgmii
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 27, 2026 at 10:55=E2=80=AFAM Vladimir Oltean
<vladimir.oltean@nxp.com> wrote:
> Furthermore, you don't need such a long text under ---, it will be
> discarded when applying the patch. Fold whatever information isn't
> duplicated in the commit message and drop the rest.
>
> It is acceptable as an incremental step because logically, it is a
> different change compared to also supporting PHYLINK_PCS_NEG_INBAND_DISAB=
LED.
> No matter whether you also submit that or not, they would still be
> separate patches.
>
> I guess the more important question is: do you also plan to submit a
> PHYLINK_PCS_NEG_INBAND_DISABLED patch? Any problems there?

Yes I plan to submit this patch also, however I'm still working on
disabling in-band autoneg on phy side as the procedure is not clearly
described and I'm trying to recreate it from vendor's sdk code, and
it's not that easy as the sdk carries I believe support for all their
phys.
However I also have one question regarding
PHYLINK_PCS_NEG_INBAND_DISABLED on the host side. I planned to discuss
it separately however, since you brought up this topic here, I would
like to discuss one thing that is not clear for me and as you are the
expert in this domain, perhaps you would be able to give me some
hints. Looking at the lynx_pcs_link_up_sgmii, once the neg_mode
differs from PHYLINK_PCS_NEG_INBAND_ENABLED, the IF_MODE register is
explicitly programmed with speed and duplex values. I browsed through
the manual but did not find any similar register for 10g-qxgmii. This
may just be due to my limited understanding of this area, but is this
intentional? There is no need to epicly program speed and mode for 10g
qxmgii with in-band autoneg off?

Given all of the above, I just wanted to add that I'll be on vacation
for three weeks starting at the beginning of September.
So if you'd prefer to send these changes yourself before then, please
don't let me be a blocker.

Best regards
Patryk
