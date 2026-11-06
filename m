Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923972;
	b=f7RxOvtKoVIyOKE+km0a4P1zurBU5U+a59gGgxhNOXq9FFvxYL3Rp1rgAWtkW/+Sjcy6
	 5E8FvZ+JuKRfqh7iMBYMg6yky1LMTYKFjOOuSHbSf6oFFM60zzmJkySOLWBrrVTIm+PAb
	 7TYKCpB8vqXEiv562g7az/mpN3jFWC44gxUJsTPBVWqfbUJjwx5W0/xm2QmEdbKC2093n
	 Z4LDVUGAPovfz6fsV1VK9F0meZzeupJYsj5Up/Jb1/mHO1i2U1/jQnLqXROpuXmTK/U40
	 QwW6brPwJTccoeAL7eYPuuFQ7wghz+NcoiOpKme/JLgu0F6FD2HjAZvjJI5tqoKlQiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923972;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=SGxBcvwVnn68G0KUIWhXj4n7e3+LPqUj3vgSEpFFHd4=;
	b=e+sv64zaNHjllRLbMSRBrKcXwre2QePWudZuhbSBNtA50yO3PRwa1bsAc72CmDjyfqwM
	 xXuWhHK9rPtNkDlcwL13jp//AZxl4dZ6nt5b7hvyAusCQ7EgT6Lc6HcytJp690tF8rm8o
	 0bbv4a9bb6NrTg9DVui8CzhU2Y2dF7Ul+sUqwrwuLGXjb0YTm7ASku3X1NBv3YWD7FxYX
	 8QV9yR3nJbYoEw6ePADOaZGhJ33Op/VCHLhluX+60vU2oy7sMHA91tUBFvRW1/5fDbhzw
	 2ScmKruCz86GxgQy62Y5hl2S0i6KfvJkasAxYfGdzwgPolrGzDDh3jvvETojW2gmSBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C223606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C223606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd3310348d2so554462a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:12:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923971; x=1794528771;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SGxBcvwVnn68G0KUIWhXj4n7e3+LPqUj3vgSEpFFHd4=;
        b=VE0xGHhCFwiH0tXsF/PRum1lb5+orOepEC8ZmsaMSs+S6Z+wcYiEVolZZ1O4QZ+FiG
         eTsmVC6tTCaSoyGPXSLg28/guFklj71veCsZgn2XFpO9JG7BhngMUrGjZUZlk5NQKbZ5
         zglu9eilFoQ9p/HZtuBIDnoHfcpHnKru/52hB4APumi/FU3ExPFk4gU3W+Z2c07zthjm
         MyBTD6Po4CBvX/NACFcW3j4hJ+3CqYMRgi3j6VC4uIbXftPiNJ0MaOJJbIaYgXp23uml
         B+ZUfccMpAnvAHrLikiw06xbnc+JBiTHYciEHx3ATbDb/LozD+EVHOmo0Uvl3G8oW5ky
         pD2g==
X-Forwarded-Encrypted: i=1; AKwUvBxf2WDl1bX647ov2qRlIscEsVbiHAs+38GQS9G9QFaP1vzmsOdOp2N5cCUDYMmxdG4j7AVxAii0f8yL6Pk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rxSnNlSyirKvkIVtoGWLHrYtKyYCZ2tjvMdFgV0RaeFTnimP1
	E3SLwXmf7pkbkurrRvjHETghLtPxB5b9e8PieueI9QuYXDmH01gTruMreeCRjw==
X-Gm-Gg: AYBFou0Czpaeidj+gOvdup+9mMczpoiAaB4gdNVVd2y7ZKrAh1LacpONGG3y2zi6Xz0
	rcst041TiwoO5jMmxdVi8DxV10C0Jim+prgeIVeLzrSJkVwwa2J8ewTGa0aHU3QEL0iv34PHAXy
	DKfH7gPBx6F6p2MCCV06sYQplWZkfbzcuLsRcTyRVrt/WaIVZuRN5ypjnoV9DUR26XnbrxPVkuM
	PWHozKNIAwR73eydgXvVsnTEDW1fAOqtQ430GBKk3oqvHxAsGae4E7cVimlRyUN89a+Bk1k9KSV
	ZDuLx7AVuNB5sfkcbCShjZEvjsqEQVX/BJQ24OxxPLN9yPZV9BLKDTLWJrfxx3V/66Brnw08YO3
	pOvJBUyDedwhLyMLGMRFNfrfTLao14b+opJa73XOoPYKkgb1OL3mrKKtISdlIfVJG46JnjT7PjC
	Gn/NZ68sScDS4aeR3UvQq3492gVnBn+X3pe0zN53cCk4BG/9+bGlMaLEr1WMaYZKeTCnAqzPFeC
	435DyvAVRvlTMQ+PqPXanaV+Aw7CTCh7CbEeZWOGiEpnpQEbcNywzJDukA7WcbApgqAHbgkuRXT
	mgKow/N8HZfHMm+s7AiU1m3PqAkDLG6e0w0hcPmg8RXbGixzqNiFKEBTHnZYQv6OmHvhXPYt/Gh
	nDyMvZVxNQFs=
X-Received: by 2002:a17:90a:da86:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b0db60977cmr445685a91.3.1793923970962;
        Thu, 05 Nov 2026 16:12:50 -0800 (PST)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com. [74.125.82.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c8ef38sm915116a91.12.2026.11.05.16.12.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 16:12:50 -0800 (PST)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35829219da8so1223348eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:12:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxSkXbU4/FtSzAWA6CPLQGVS3VxJOxqJz31nWGhI7Hatti5VZa8lO1TGDN+7LxoqLyO+CXaBYFymPXz3is=@vger.kernel.org
X-Received: by 2002:a05:7301:90d:b0:36d:6a77:960a with SMTP id
 5a478bee46e88-36f73893ca9mr1104956eec.1.1793923970093; Thu, 05 Nov 2026
 16:12:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-1-a15965a49574@telaak.dev> <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
 <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
 <ba32cd69-23a3-464f-a74b-68a29e7b8202@lunn.ch> <CAPY4CJ6mCc5HgQUZd2Mq3C=Tsmwp=-acAV8dsWcpO_J87Pr6rg@mail.gmail.com>
 <7b4ab738-85c9-4747-bf89-1a5532af6901@lunn.ch>
In-Reply-To: <7b4ab738-85c9-4747-bf89-1a5532af6901@lunn.ch>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 19:12:37 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6Pa1T4v6=3K+qN-sJeRivJqGbUeR2svJNcrLHtA=Th+g@mail.gmail.com>
X-Gm-Features: AclHuK9z-s31k9cdXUmtbrS436ZgZs9Mvql6VWlVAJgIq_YcqPSSmicfRgm0TQE
Message-ID: <CAPY4CJ6Pa1T4v6=3K+qN-sJeRivJqGbUeR2svJNcrLHtA=Th+g@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add Siflower SF19A2890 GMAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Chuanhong Guo <gch981213@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> So i think we need a get out from backwards compatibility. We need to
> be able to break running boards with old DT blobs, in the future when
> we fix whatever is broken. Maybe the best way to do that it make the
> MAC glue driver and the DSA driver depend on BROKEN.

Before that, I measured from the switch's side. The switch driver sets
its RGMII delays on the CPU port in nominal 500 ps steps, so with the
MAC's delays at 0:

- Switch to MAC, with the MAC's RX delay line bypassed: the link works
  with the switch adding 0 to 1.5 ns, and fails from 2 ns.
- The same with the RX delay line on at step 0: at 1.5 ns from the
  switch, 4 more steps of the line still work, so step 0 adds at most
  about 0.25 ns over the bypass.
- MAC to switch, with the MAC's TX delay at 0: the link works with the
  switch adding 0 to 2 ns, and fails from 2.5 ns. The TX delay line has
  no bypass, so I can't check its step 0 the same way.

Measured against the MAC's delay lines, the switch's nominal 2 ns comes
out at about 2.4 ns in one direction and its 1.5 ns at about 1.3 ns in
the other, so its steps are only roughly 500 ps.

So on RX, 0 does mean about 0, and the receive direction still fails at
the standard 2 ns. That extra skew is outside the MAC's delay line: in
the switch's output, the board, or the MAC's input, which I can't tell
apart.

The DSA driver, mxl-gsw1xx, is already in mainline for the whole GSW1xx
family, so BROKEN there would also cover boards with other MACs. Would
BROKEN on the new glue alone do?
