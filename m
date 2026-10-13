Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4394CDA2E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895126; cv=none; b=svBVyF4NMBMId1f4iG+07wqq05caHqh+Vepe5/lJLZxTntdNX/IoQws2eIlZhB/IrLT8fiUs1yMny5ti6xbnyS3E6gLle3bR8wcnCGEEd/ItaE2Y12JTPbwE7QbOpul4LdnX/Eod9LI9QDZzN3oDr19lO1z7+1n+PLx5ClXImFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895126; c=relaxed/simple;
	bh=iXnTTb4klyb+l7f1BqJexeWayV9i3kkO/y1GFvUKBuk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CxrMg358if7lMY6nmGE3KmjhTm1YpPCITr0R0JYWd0Mr82cOTNkKBIzFNFUV3e5QInml5EG9XUhlcDdXH/LMl9JnojD9cbBR6GuxwzuHlxB8nJoHed36tDmhpR/30lcM4cUHGPfZfXH51Ai8W/Uqk2OfShWLUtCzpcG18KxAB6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=otmecN88; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="otmecN88"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so17939185e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791895123; x=1792499923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7va2tjnmsFPr310Pasr2Ke0RqISF8aL004YHAE7kjOw=;
        b=otmecN88bppjWyqDHr5evLm/9XEfpL365DOa6bgSmEb7ylCcxZcyIGF941SEdoWKL+
         isxV9u3sLdxrYlWh7/rlncqnMbUUWOvyFWaq2gsNW0MNRmkhPTBPHUprvY9tA2DxoqQT
         /Mizb5VfeZjfJ9nUJRjpuUnGFsww8MpoKUOlSH22YaEgvyf6TrkRppiojtl/gkhNkyQ5
         xNQ9hZV/sDZ0ytDmQSV1+ZDrd6q1Kavo02bap7j76uRWL853xbRhycwiRMo4tZyfeRhE
         f6jV7VuFleL17r6OgPKYAGIc6qq+vOcyMb4On2ThuxulxzcPwMVRvDnLamGnWE/o/bv9
         ljEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895123; x=1792499923;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7va2tjnmsFPr310Pasr2Ke0RqISF8aL004YHAE7kjOw=;
        b=sD6Jknxjh3jHgcTHSgvVjIS7zQyy3X9g8wF2jvC5bAXhPvrtqWBn/9PUW41Fc8V0mj
         +cRR3myIoIHw2M1AzzMX5mHTLMt0awOlhDeh3s2eeYYkoB1Wrlu4a4fnr0P9RtOYwooO
         CtrGLmOOVSGsSiBtCHU6tCLMpGbnvllUUtBMHuKZanD3hRBvjSbpHHX6796UMl5npBk5
         i5W0JZz7ZT/YT6dLP0u2aRGU5gUpF70JBvAvIaYT8xBtGOEPN2a4I0bzo2PG0uFseoYB
         ivlZCaXJDjXh42spF+m7+wphRX188u3g03cmZxQhdXiEIYCzi40DIgPCYxITczTVQhlg
         JnvA==
X-Forwarded-Encrypted: i=1; AKwUvByy3bGW1A3uUadfIACGhl68sltlcC19trbQTvKZ+MacDsDL2kUtJ6Z0u2aeaZXny8jzLvO71UFJN4jcV1E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKYqlIXM0nEsY1HJINmle7y3/T6O5ghcG2aQtShywZ74Xh1sT5
	Bcic9SQI7chvmjCN8TlRuKnE+wTbW207XFHc8qzKIGGhepq91MSEzWo9
X-Gm-Gg: AYBFou1r8gBvYg0Uv36H9dPkfGQrsP8AxWfGPqIN3Tma2W8U7jad9WsV2nz+sDvW1D8
	uwnM0JK585EA2lZJo+k3VWfxInvfFZ25I7jTjSuU2WxlnTRretPFyjHB5ym0JtZWjIn0UWGVI6f
	NMb1urCh/EFx3TKuHz+n1yaUyLOFtmJSi2hb6CaFa5QP/zcqy1YFXIjSreldAF70ewEqrmVboEv
	qiEUeanvnJz/ZXxdpOUHbBme75Ve7wPhQm6FVJcjolPLqFoTV/y5pZzX53BKtg7fffFwBMOHNkF
	Jp9s8foArWFmUMMi1O/dyhWXaAWZ6XOtIZAmxCWCGBMIjvxYM2Ou4FuRZ/GaWRSx1cQdhqtyHKr
	oxMbog5unSEgt93io+nXWCPDbm51+RR4lqqlpXRRQUpwuIs9b6G7sjOqQAIL6WqBxGFX7kd+JH3
	3S+pxDIA6HOb9+YnVWpr9RQZ8PycpSZ7ZTXiDifvBZFonuAGcg88PyS/xObe2bwWUTOIAfEUqVB
	xOrsbd0Kg==
X-Received: by 2002:a05:600c:6384:b0:4a1:7741:ec43 with SMTP id 5b1f17b1804b1-4a18e4b8966mr226521575e9.26.1791895122588;
        Tue, 13 Oct 2026 05:38:42 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1a1feb78csm184740265e9.0.2026.10.13.05.38.41
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 13 Oct 2026 05:38:42 -0700 (PDT)
Date: Tue, 13 Oct 2026 14:38:36 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Sean Rhodes <sean@starlabs.systems>
Cc: Ulf Hansson <ulfh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Ricky Wu
 <ricky_wu@realtek.com>, Lee Jones <lee@kernel.org>, Roger Tseng
 <rogerable@realtek.com>, Dan Carpenter <error27@gmail.com>, Jisheng Zhang
 <jszhang@kernel.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] misc: rtsx_usb: avoid USB I/O in runtime
 autosuspend
Message-ID: <20261013143836.76ad7bf4.michal.pecio@gmail.com>
In-Reply-To: <CABtds-0s8Co-qWk0xm=R1pdz3JyV_GyaiwYzgxS9g2tFwtHRzg@mail.gmail.com>
References: <cover.1783352430.git.sean@starlabs.systems>
	<7acac70a471452a6ccf23b7ccc557f3c3861e0ad.1783352430.git.sean@starlabs.systems>
	<20261005103011.03175826.michal.pecio@gmail.com>
	<CABtds-3t+ECCPeFShq__iNa9niRAge=WOED4cHtNZAFVw6kPzw@mail.gmail.com>
	<20261013142737.7b10a5b0.michal.pecio@gmail.com>
	<CABtds-0s8Co-qWk0xm=R1pdz3JyV_GyaiwYzgxS9g2tFwtHRzg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Oct 2026 13:31:26 +0100, Sean Rhodes wrote:
> > I have a card reader with RTS5178 and a simple SD slot, no tray.  
> 
> Thanks, but what is that attached to? i.e. Arrow Lake

A whole bunch of USB ports on various xHCI and one EHCI controller,
none of it makes a difference. For the record, I have no issues with
wakeup on insertion when the reader is suspend. The problem is when
it goes to suspend with a card already inserted and doesn't wake.
