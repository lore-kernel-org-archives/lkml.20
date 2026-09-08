Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA423F7AA8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901102; cv=none; b=nyAPq5z6qQngnUAaFJeEhh0/rUiXraYdrpHmXphn2zNqRypL7paiLuKjCBijGc6g9q3WC1msCnbiwI63aAhkbss56mww7YURo/sfKjEvvwP7btVyKtV/uRXfTDlSlTHAVdvDVtSMxC8V1a7W1pOvhMOZ3zjHX5UwGq1s/zN8YaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901102; c=relaxed/simple;
	bh=wRD2aA2ENyPJVAfyo0ydoF4fWjPaMHSVeZs2Qpg1mmw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XvBHnVoPrEowBUNVsTL3STmjaUb7wueVbBUJ2nIcGVF+XTfJfcp0E/Qp0C0A9JEBekDgjB71EHrPFMLNr6rl4KMC3WEIk3QeUtwQ8phQthLqSZGLOatTlkJtlnom3I3Z7rUk4HbhgrtLWW3kbMwN4G4GRgmqEJZPcguKYDNk4+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mkcpJ06v; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mkcpJ06v"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0AF7B1A1A63;
	Tue,  8 Sep 2026 20:58:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C3FFF6031F;
	Tue,  8 Sep 2026 20:58:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D34D11C7AAE3;
	Tue,  8 Sep 2026 22:58:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788901094; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=i3zFXK4XCXpFb9mdgVDDUMRSK40kEGwt+M1r7DzBTHs=;
	b=mkcpJ06vzRAcZ4LYqfH1LVIqTxya3bkX5qLc5bMH3dCuCoxb7w4yDQRWHFzSu2mVqMWbit
	5eVNXAxDOp7Hc9Wm9LFa6vriuUVZz3l4B7aMrjRAV4eRQLg9rWSE6Lv+R0mcKjpi+Kswg2
	6qgVtyESOdo3I+V9M6bWm/zB6j9Y55pKi1q3SecBQAN71HzH23GHLfkyEA5s53CuaWEPcF
	LcQVTQS7GvSbTsvLYSVh0M/U0B9crq+ftnIiDtHEtK12QJn1KT0ziLTgH+MuRHkKi6ZKTb
	/vx2iT+ebJlkkGXCVi9ScJYzsBtDqe4yM/ePs4mO2pwGmEP1HeWER03YFQ62rg==
Message-ID: <5aeb6fd1-f1c3-426d-a2c4-1ad45ddc8572@bootlin.com>
Date: Tue, 8 Sep 2026 22:58:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: stmmac: restore NET_IP_ALIGN in the RX DMA
 offset
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Pascal Kneuper <PKneuper@dspace.de>, kuba@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, 0x1207@gmail.com, si.yanteng@linux.dev,
 larysa.zaremba@intel.com, aleksander.lobakin@intel.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 DBaldin@dspace.de
References: <20260813092923.284285-1-PKneuper@dspace.de>
 <20260824125014.47862-1-PKneuper@dspace.de>
 <09e7cd4b-b79c-47ea-95b6-1c1a96fe7657@bootlin.com>
Content-Language: en-US
In-Reply-To: <09e7cd4b-b79c-47ea-95b6-1c1a96fe7657@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi again, 

On 9/8/26 10:16, Maxime Chevallier wrote:
> Hi,
> 
> On 8/24/26 14:50, Pascal Kneuper wrote:
>> Since the RX path was converted to zero-copy, the page pool page is handed
>> to the stack directly as the skb head, and the offset the DMA engine writes
>> at is what determines the alignment of the packet headers.
>>
>> Before the conversion the payload was copied into an skb obtained from
>> napi_alloc_skb(), which reserves NET_SKB_PAD + NET_IP_ALIGN. The
>> conversion moved the headroom into stmmac_rx_offset() but did not carry
>> over NET_IP_ALIGN, so on architectures where NET_IP_ALIGN is 2 the IP
>> header now lands misaligned:
>>
>>   64 (NET_SKB_PAD) + 14 (ethernet) + 20 (IP) = 98
>>
>> Same for the XDP branch:
>>
>>   256 (XDP_PACKET_HEADROOM) + 14 (ethernet) + 20 (IP) = 290
>>
>> On ARM32 this is fatal, because ldm and ldrd trap on unaligned addresses
>> even when CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is set.

> This patch breaks the stmmac selftests for Jumbo Frames on dwmac1000 :(
So looks like the problem isn't this patch, but rather both the way we select
the bufsize, and the Jumbo test itself :)

This merely surfaces existing problems, I have some fixes that I'll send shortly.

Maxime
