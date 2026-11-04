Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793800511;
	b=Z0qGI1YDU47TXqSQOtn/90m1+9LE3prEu/tdmo5XByspLwbszP44Nk8krktrD9QIqA5c
	 eJZQV09aqiDKO1EG4SAm63C2bZxY+MfYKgFoMG7pZXo6Kcv3iAgLXjJzFwoXb3EwTrw9M
	 YUsDRVDdKhg9M5Ia7ASrqxuyhLfsn4wVTa7BMQ1wxQEdx/XaQ50D2U+UMyzJua04s3dZ5
	 4US+Xk+xTLLQkE7CuXgPGG5nxyC3Tp93mUj1YsTfMRol0Df70VyrWFVU+D8v7yaVv9osy
	 GCeE1Q4bsCfZ1GTmzm7600Jzv3Msno6B2xAJfy3NaUh9qxutGCzCX19R9vvsCSQZzPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800511;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=maDQ2WD6HiiRMLihh/6PlAJLLE5S+DKoSCvfTu9OXko=;
	b=lgO1f6nKe7gTkEnnkM5rFRdlayChIMNN9hS7dXPvSda8Xo+G9SxIsQumfeHdpTdx8PHd
	 Dm/TBtJQCNXsjyF9tO6G1PQDe1lgHqSlC1EfJaaOimy6xds/SRgBtSNI+GRwH0HtuISmo
	 fGifaIc6N2/LEVjry4VnxCPv+SjG6v/D9WqZHQalIqCVJIOcElH8ioWfGCDZ5d6QWoZqw
	 eMeScXowdv+7V3YtxoAv40O/phHFeCz6GHxocpsyf1j1vfl718awXOPCyPMOOEIUSlknZ
	 SH7yPiApdS4mXVNowLLuqsNZaKRAidY0t+u66Cm5t3bDsjPSGpdayIVYKCt7h4LBK+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3475606A331
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3475606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so1068537a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:55:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793800509; cv=none;
        d=google.com; s=arc-20260327;
        b=nL7X7yulbBfkdKYgOprFm0+oPvA6g31nuDgQzwbaBSIbQ1p5NVTcKMIE7DOnBec82Y
         ZZU/0G2nlT9GJ2fG5MDBIPqljn9c99cfXalsn5EF/TWDd+pD1XHiSsOUUzrLoItuGJOG
         21N+/MV77TQNhJDXjlpQNCJ8Ty135MJPJhAuEODXxmKVzCJu9ClTNMrAN7F8ox+R2+0Z
         EKEyYpEuR1e5kzd+noxhD4IMzO3oy73Z8rtasinvGNACzKXJ1GVSakrCOOqnDOvkU7+l
         IodlCBNTRD3slDIk6JSis9ZMRmpus+vr04v3+zJPvJ0mdM1YfUeuM99HOibtpyHuMtZL
         YZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=maDQ2WD6HiiRMLihh/6PlAJLLE5S+DKoSCvfTu9OXko=;
        fh=4EUGzNkiW14/rgFgHNpIuxwhVFPDK4vvK5Gq7qMa4/4=;
        b=hKEueNi6EffiS1tKuc4vVs8miDc0vC0nI++Ov+GuWZL1C3HyB/0ZxY4ozPhptAC3U6
         3HvLAxMvHKQBp5835CQ7cayLX1T1XzCefjtaiVFwilORHv+iasd+8MSYUUbeUc4PDubR
         V/UB5ar/XWm05vzt+uqVELdexMCYEj9PLekmQG+3G+Z/NpNTCx3pCYHI1WWYBeyK0P+f
         GoCM55mnCO2MwfK4jlrQOIWbNEuM5jJAbGb7cX7htD3oPAOeg8NWYGM6Cgh903FVyLL2
         p6zRTLSxfdzeVxHQQAxkxv1ox6KHnPgHazCYGpcRWiPvhAfot2+qdroOCV+4HmYDj2+c
         FWKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800509; x=1794405309;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=maDQ2WD6HiiRMLihh/6PlAJLLE5S+DKoSCvfTu9OXko=;
        b=gxNyqJU+kX6Lo2yiHHau3ALcCPuudvuv3mZHRZ1vkAKA91Fi8p6tYb96Azzv2b3U1B
         /friZi12GrpuTPD/alZhtlUfofrquwnml0gHgaEhJCyrddc2+J1ZZ26FX1+IZlsM8PHN
         IN56Fzrd5Xnb1Su2SeWNDUVUiTTPwu8QRG2KWyWuYI7mJz8Al+nBNZYGAlmI4aL0LAEh
         W/iEygntOwDWFi/H6xu/qqFhgMHAvOQ7P7JuQmgoLoY4q3TfASLV27RTdxvA3pvfV+7/
         WSiWyJraFFaWcS+zMzpCbV+S/ODqEuIkiKjvLn9cGM92eJlydhsOD3ZnLIg4Mv7bKhf/
         lc9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwPEqxrc+hlHCV4q+2fIhzAnaBYPEAlQMXbrPPeqNXkIkzJiInQb+hA3NjbP+1QNwxLHbQ+IdRLe9hWsc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4TBfipgDAxwRu0ITN2G7I6nH86BZnvTsvpt+2eGZbgyKogv6O
	FWVxZIjchXdAWUeXkETD9Arim68MD3mN1cRTgycZY1RHfL4TO0/PRGJHiVnVrYiUFI1QSDnZ2gq
	w5LWIG44yOD2OyTwmbTzMq1/QnGTbQ7+1ypH/ofDEFg==
X-Gm-Gg: AYBFou1H+uopT8wCJ8rFM/3ShD7yCvrjblYUqDYJyVyxs0tFcoMcFO5vYNfKiMlqiKN
	SD8OiAVxIOa3YuXpLuz0Tonp4LrPFSTGK1+QsnGgs/x13zk7hf593FT2c1tFaSlTACAjq2Zf4Nw
	LAZmx9JGMn+avYrreV+7BoALdhmLbEJMT4/rpVQQMaady8e475xjBl12NfI+PoTFToJx1JoN8Jx
	xCQpSgLqQDZR402Z2irkzwBtwFaxFoT2em5ugzUTwQFbQfCiXPpiJ0v9Cc4ApuNJ1D81CtLbPFM
	nAL/Desqcy37VUt9HfRBF/YWEnLDrM3p0Di8WXYcGfQMQ4yl4ZYPs30lAaGTFcWfRN42nNYd2Y3
	rBY8MfIBHI6KR05PBgBOYiDtai7YBItsl6RY=
X-Received: by 2002:a05:6402:1851:b0:6b3:f7f6:649e with SMTP id
 4fb4d7f45d1cf-6b4d438aba8mr8776244a12.7.1793800508173; Wed, 04 Nov 2026
 05:55:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020190319.884375-3-opensource@grische.xyz> <179279532326.3134.8925339564776340456@kernel.org>
In-Reply-To: <179279532326.3134.8925339564776340456@kernel.org>
From: opensource@grische.xyz
Date: Wed, 4 Nov 2026 14:54:41 +0100
X-Gm-Features: AclHuK-Y4PhN7UgN6Wg1KVGHuCHUflIixbfP_eRM3Iuwj9ty4dhSxmMFdf4CmYc
Message-ID: <CALsH2cy0Pn2DFAjqb5H2PR6o+_Vr=ig7bbL9-RA82sC99wf50Q@mail.gmail.com>
Subject: Re: [PATCH net 2/3] net: stmmac: dwmac1000: don't discard frames with
 only a checksum error
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, o.rempel@pengutronix.de, 
	stable@vger.kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, aaro.koskinen@nokia.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Can this mask let giant frames through when Rx checksum offload is
> disabled?

Yes, in threshold Rx mode. The dangerous case was a giant frame that
spans two buffers, because stmmac_rx() parsed its last descriptor as a
new frame. The same happened without this series for any frame larger
than the Rx buffer.

Commit 834ec9530832 ("net: stmmac: drop split frames on AF_XDP
zero-copy RX") has since fixed that in net, and v2 will be based on it.

>
> Should bit 7 also count as a discard reason unless IPC (hw->rx_csum) is
> enabled?

Bit 7 alone does not identify a giant frame, because on cores with the
advanced timestamp feature it reports a timestamp instead.
With the current code enh_desc_get_rx_status() does not know which core
it runs on, and it has no access to hw->rx_csum.

A giant frame that fits one buffer therefore reaches the stack with a
verified FCS in threshold Rx mode only.

Dropping it would need a new parameter that tells the parser whether
the core has the timestamp feature.
