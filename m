Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3473590AE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789524060; cv=none; b=UwCxZ/uZaByqpsXZgPuAMYFZ+TGT47MyssxeemdDahk4RLzJOgYFFADw2fwM4spKWb8IwonBdB6g79M+gMy/m9uNPynTpyq1Js1v38jXAco8kTw9yyaiRNvS7nBJGod57/gRIdcEBouI6a8cVrAhVJ4nB/DI6JS4grxVu4CZVB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789524060; c=relaxed/simple;
	bh=z2vnxYECfe/CK+/EmMjMDlztEhbtnFjpr0RMVFWdXpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sflQ8In2K4PyXidSXP7cYAFpB21CvLTAkuGHNSsKZqB9//ll43GFBZ8M5p7a1eBPpm3PG7HtHfkV3x6P61q+rMUJ/aTLnq8mwaCzao9G0zGRABIJDtfJIvr0Ct22TSN1M7VrNMw1CzYuL8TYqY33E/tvOEudsTMnSGmM9/otjSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maticrobots.com; spf=pass smtp.mailfrom=matician.com; dkim=pass (2048-bit key) header.d=maticrobots.com header.i=@maticrobots.com header.b=HVCzwgFK; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maticrobots.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matician.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maticrobots.com header.i=@maticrobots.com header.b="HVCzwgFK"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso245964a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maticrobots.com; s=google; t=1789524042; x=1790128842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RR+WtBbiVNxPAorgDWRwyWsfbjTaY0Xp64w0w7OzUbY=;
        b=HVCzwgFKkfh6aKjgL2wKm+4FvR5rkaT7Y6nq7I0TtPmzLzpX5BAbJZjdiIXkBnaE3/
         W/y1TWuTikGZGhQtgL0kHC1HA5DrSpHTiI6aZ3+N1s6naSeM7bzUekvVtIA5zcqG4CLT
         h6xI9S17e8cBgdTBtxnLBWxsC7S0BU247nHEq15JXpIYcCgHkC2ZhrpVxbMF3AbOzuYF
         ngIniWzSDSZmhcrJuWB5lRAB537qrktO8t35j4NPnigpAErznE3zZ+A7Sd2KcVijqckb
         i29pA/aPhxrQs1k9r6du4Iq5LZN+pBwc8XVueiThQon6quRBMeg87A91Qn2X+fOw7AUC
         Uzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789524042; x=1790128842;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RR+WtBbiVNxPAorgDWRwyWsfbjTaY0Xp64w0w7OzUbY=;
        b=0btgRbrzrbWdKx/vtJHsMSIrOI46RJWGYR77YlxpltvEnEjygD2n3eSC+J6ZlZ3Jkx
         MyT8xWPayXnCLDkv5QM/VcdNVnKbDTGs2BkAaG2s4RsiM5EQ5PsjeEoEdtU48KdX86tY
         kxqQZJPcFa++W15cH8RRgjNEN9V9R7lme+x91J0fi4rOhqhnbqwI2p5u8TwIEs7CgEEA
         cRvpdPykxe/EzcwPzrVqJYkW/rMkR2WH4ej0tUTWWJVCwloOTaRfIUsFtxg/NFZMD6tL
         mbZaoI478/0QwlX6kY11ceSsSQMfy3LYJ9GYy2lR+mtGIB6N+bkapmLM6ytVdvesFK70
         wQoQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3hU8WIDAQiWEfpjJm26T7Ymzdso/ksNs24fLyh1TRvWaLDZoG94VkL4qiD+sqOSRlwCThL6ry6RHx+kE=@vger.kernel.org
X-Gm-Message-State: AFuF++kQDg4c7z5zyyWC0TGH1UYetCzR27DxMPapJIoXKY9us+RuAAkt
	U01Xl3T41jWQwlgrDfsvwlYW00tL3PhAM6U02OCTkcMzXMWewFXXTqjoP0KuLgdKH3o=
X-Gm-Gg: AYBFou0sjIomk2ZjYtGjUl8t9KoTHyig/tqR9zkX8S9oRUbPlzEYbDdcdblE2tRavT0
	DpFFTTO9WK48PdzeqPAZOHNNRZ6AXfLFRtucSTnjs4cWR/pzE4MJqtUjCFOGrNFoXk4ZzuKq2+G
	Ii/I0X/09ctY41/XQUjjxYjlE2yFoMOzuFOg0HAtK8HtWASQUdoIsDL4gFA9UxkuRD4Ozoawsis
	XIkpyx75RrWwKp2OHevRdf8cAGwOpwXYrHBsXbC0gteE499S+ZB1jL/Plabje8OtDAosGy0inFF
	OuQAKp0Z1S1ev4hQOFfnD7YZVWQgDE1lsb6j4rFAnHp1WxNAFGNGjpMUgSbdp1bWq/7eDAnJ/zf
	SXKdv+YdPwWh23/Kkg6p0ezPVFOTgxPgpabJ0Ki86eDCz2hSrE9oGhrBZUGmQOZboaiQj0vXp1W
	cCzFMiLmK4Eto0M93cPZE1ZRs+eO/ijTLRD7BCqkJ/MttCbOCTCXWb+FwIAeugSPc2P/+eY97Vy
	XUcPNcuAfT8XH3roJFe2egKQyN9jS+WhZUmdvXFdi+qWtddGwvVZHbKbZA=
X-Received: by 2002:a17:90b:390d:b0:39d:f66e:1720 with SMTP id 98e67ed59e1d1-39e1e4907e8mr1658967a91.13.1789524042128;
        Tue, 15 Sep 2026 19:00:42 -0700 (PDT)
Received: from abeMaticDesktop.1020marsh.offices.matician.com ([2600:1700:471:807f:c09a:1c02:505f:9e4c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b1d335sm3056984eec.28.2026.09.15.19.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 19:00:41 -0700 (PDT)
From: Abraham Zukor <abe@maticrobots.com>
To: Mark Brown <broonie@kernel.org>
Cc: Abraham Zukor <abe@maticrobots.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-spi@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] spi: tegra114: initialize native chip selects inactive
Date: Tue, 15 Sep 2026 19:00:28 -0700
Message-ID: <20260916020031.161347-1-abe@maticrobots.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <c6868d2a-f55f-4196-9914-f096420cbabc@sirena.org.uk>
References: <20260826000517.631736-1-abe@maticrobots.com> <420de339-53d2-40d9-b04a-a54428450830@nvidia.com> <c6868d2a-f55f-4196-9914-f096420cbabc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Aug 27, 2026 at 04:38:39PM +0100, Mark Brown wrote:
> I can see a system having multiple variants with the bootloader
> selecting which device is active in the DT based on runtime
> enumeration.  Not sure if anyone is *actually* doing that, but given
> the state of the world with overlays...

I think we should handle this per native chip select:

If exactly one node is enabled, use its polarity, ignoring disabled
alternatives.

If none are enabled, use the polarity specified by the disabled nodes
when they agree, including when there is only one. If they disagree, log
a warning and use the polarity of one of them, since no inactive level
can satisfy both polarities.

Multiple enabled nodes using the same CS are a configuration error that
the SPI core already checks.

My v3 needs adjusting for the first case. I will implement this as a v4
if no one sees an issue.
