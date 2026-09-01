Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F40C4756D9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251575; cv=none; b=L1zieBl5bZ5amrAt80FImYzXVWLMflWXKyAwaOuufxsEj0pSyYUpo4Q8wsB8TBlAC/jQ6iY7yrda3ZottlXlA/QvuaPOu+Twltv7ktcjQnQ0282Uy+PdwKZFYxMKmi29+zStqoxeWBtajVP1kxjpVtNbRfdFJ4i2XmizYmF+IXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251575; c=relaxed/simple;
	bh=LN3Wb81JQEyvueQQN8NfxSx6jemLC4B75M2RBQrdGUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dnrP1+aPw6NUvQa2cxwxONOyCRvg2CJiOJ7Ee9dcZPlFjipEctDKHNTgwGy/376+vVbOZslwvWAY0odwsIr6S4VHOWXLPbEJ97acoYqlQks3KhIRySI3tmjfGoRIDh0xoeUQZGk3WuQA7PdHCSW0PoVYPuv6V9JMYMNN2uRH6xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Su2lnvrm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=INwlU/k+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Su2lnvrm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="INwlU/k+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788251572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kb1hPY3E5R+EwjHtwcdA5PerJF3fXh3Mowb0XNvM6wE=;
	b=Su2lnvrmTZrNpmWuswn7Jz51gypIY4QGq0S+yZgMDUDkj/MBoRxJBf4+0lEAoRtJ2/cA9+
	UFc/sh0agh1m4wiKGimFYcPhTV9SQkhP6ugnWja9ewpWUC2h0P5Gvc3Mp7ijCf9Ynj/DB6
	apuQ55hgnU8g3QBikYosrc8yl7VSjJk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-_x2pRZQvP2aphOxUd41AUg-1; Tue, 01 Sept 2026 04:32:49 -0400
X-MC-Unique: _x2pRZQvP2aphOxUd41AUg-1
X-Mimecast-MFC-AGG-ID: _x2pRZQvP2aphOxUd41AUg_1788251568
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49545071724so5325585e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788251568; x=1788856368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kb1hPY3E5R+EwjHtwcdA5PerJF3fXh3Mowb0XNvM6wE=;
        b=INwlU/k+qoDd4Uf+5rUWl3cC6BYjyria4hW/XYAIeBAqa8hWPr5L6BJef4GXdxPgpx
         TGAlXO994niGXDUlARVz9LsXld28RfFvsz8U7Qtev5A1dWapwP91nzRMfBZh5sFZUDm+
         9RJU5jfmCM7NnRE+7CBOR/50EjbMeZm8PN67WEUMr5Fs0v7OvX20S/GxHACUmJjE8ZoX
         6nZdCV33hp9N+ASY4kEwtnBjJ/1fV7bMh1CqZx8eg2FE7YgllWQOmGUcDD4WPb3iS/Ka
         gkWpCcongvcNQT88EdG8pAyCl4EdrjGrP8BhjFI5NV4pbzVGH05Nbn+I4VjH/PHUImoj
         pI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251568; x=1788856368;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kb1hPY3E5R+EwjHtwcdA5PerJF3fXh3Mowb0XNvM6wE=;
        b=HuZkCZwEooUFoUEvjepG4Tn4gbu5ozP94zyuZOgg6PRTuXNJXIJRT4NkJz89yJKUgj
         NWlx/P0hyHt8wEcWhGamEwnTb7osgqXRrU/X9L6W+9I+/+f7ouZSSMmXEW6OYt9O5rM9
         AZUT4xsszcCpGZg4q/P2poqYewxD3QCEEjl5FJUGuPYcldr3HxAY1cSKXcnIPQSwIFLB
         Jvk265L/rwvjEfeqyXeskh7SeEyJo/D3G+aMFJxYR7PX/Biz9whbVARuM9RsKHT8jNFl
         BH1R36WfQAbwoaBFz+5Ax+O6BC+4nLA1ajtYdGQ/Ip0vT1arfpGzIjgHOWgELd5z5sWS
         KQ3A==
X-Forwarded-Encrypted: i=1; AHgh+RqUjvDzC3AFSaEJQqksCTGedC0JfMl50hwfqrmOcWNFEyyKBwQJ5DPch755YxTHDq//oyTuGeUt6K+3Nj0=@vger.kernel.org
X-Gm-Message-State: AFuF++l4KpufS+AafkaYB4ZrlsstbCzlBpOw/Im2geqOWI0xSygFSQqK
	yglSGX9RIJDhZreWRYHCJBTZL0RAgY5cnJW3UkkPfqfaF/XAnMqtuPK6TyFR+pWWhyTlzI5NiS+
	qVj33Dz6j/DqJGZuF2nKmmJCq2RiZ14sTx1lrqi8DjkxdQXq3JDDKN8JF1ycxo+3E1g==
X-Gm-Gg: AR+sD10rUTpYJC6/6Sfk1rfI06J3H/RUrbADQe41nB0VShWYN2zMdUmV64pAv9z/SP+
	GqFBgy053KTW7+hqNftKF1640lARr11uZRoPh4l1fHsHIL4AF5R+fkn0mg9zfcI2aoIGkkz823x
	BC+CdHll0jdlH30bdu+88KiE3gBQ3pQ9FThKQixo/bJqtE3P1rZcjNy+1br1RrMWSF1vKALtGe6
	IMzxoW6Ogdyq8oG7SCyUTh0S9vc53MkTt78RLFu/TETQi8WK08JGn/oEtaYDLC5S+5ogNFk5uNx
	l41mHkDBsZ8kChG4lcUuvbxSw0mYwkS/su4h9s7QjLxUghA+aNViExpCnu5nSKgcdm2Jl7pKNJF
	Be/Ogv1OZ99ZDBLX6Tx67C8gNw+dVWz3nhjKpCD2NbEp+PrHQqGdT11QidZQ8x2AT/aAUSiBaGg
	==
X-Received: by 2002:a05:600c:b85:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49cc96ad411mr404159425e9.12.1788251567995;
        Tue, 01 Sep 2026 01:32:47 -0700 (PDT)
X-Received: by 2002:a05:600c:b85:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49cc96ad411mr404158475e9.12.1788251567565;
        Tue, 01 Sep 2026 01:32:47 -0700 (PDT)
Received: from [192.168.188.103] (ip245-45-231-195.pool-bba.aruba.it. [195.231.45.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccd1e19desm310558275e9.1.2026.09.01.01.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:32:46 -0700 (PDT)
Message-ID: <68c51086-eb10-4074-8495-b31c8e8a21e0@redhat.com>
Date: Tue, 1 Sep 2026 10:32:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 2/2] net: ethernet: mtk_eth_soc: populate
 lpi_interfaces to fix EEE support
To: Aleksei Sviridkin <f@lex.la>, "Chester A . Unal"
 <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Qingfang Deng <dqfext@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260827211652.63504-1-f@lex.la>
 <20260827211652.63504-3-f@lex.la>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260827211652.63504-3-f@lex.la>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/27/26 11:16 PM, Aleksei Sviridkin wrote:
> phylink_create() decides once and for all that a MAC supports managed
> EEE, and it requires the tx_lpi ops plus non-empty lpi_capabilities and
> lpi_interfaces. mtk_add_mac() leaves lpi_interfaces empty.
> 
> So ever since EEE support was added, ethtool has answered "Not
> supported" on every MAC that uses mtk_phylink_ops, and
> phy_disable_eee() has locked userspace out of turning EEE on. MT7628
> is unaffected, as rt5350_phylink_ops has no tx_lpi methods.
> 
> Leave 2.5 Gbps out of both bitmaps. MAC_MCR folds SPEED_2500 onto
> MAC_MCR_SPEED_1000, so MAC_MCR_EEE1G would govern LPI on such a link,
> and that is unvalidated rather than known unsupported: MediaTek's SDK
> driver sets the EEE force bits for 100 Mbps and 1 Gbps only, and the
> unit of the wakeup timers is undocumented with the port clock at
> 2.5 times the rate.
> 
> LPI stays off until userspace enables it, but the EEE advertisement of
> a PHY that advertises it out of reset comes back, since phylink stops
> force-clearing it.
> 
> Fixes: 952d7325362f ("net: ethernet: mediatek: add EEE support")
> Signed-off-by: Aleksei Sviridkin <f@lex.la>
> ---
> 
> On the netsys v3 switch MAC the xGMII filter empties lpi_interfaces
> outright, as PHY_INTERFACE_MODE_INTERNAL is the only interface it
> supports. It is a fixed link port with no PHY, so phylink had no EEE to
> manage there before this patch either.
> 
> Pre-existing and not addressed here: mtk_mac_enable_tx_lpi() programs
> MT7531's reset wakeup times (17 for 1 Gbps, 36 for 100 Mbps) whenever
> it runs, as its own comment says, so they now apply to every SoC driven
> by mtk_phylink_ops once a user enables EEE on an eligible interface.
> Those values do not appear to have been confirmed for MT7981, MT7986 or
> MT7988.
For a 'net' patch, I think it makes more sense to restrict the lpi
interface to the chip revisions with support confirmed.

/P

