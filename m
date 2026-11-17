Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906643;
	b=qbjP/mXH2TypiFjrVwenQ6+dteXnH9/znrgM1KYaX5QFob9bkqwEbONE6G/ZHl9dELoZ
	 Ih8zbxidqRjz6DIDl4oEFZT7+l/KfdBxW2S5N/Vqt1sqB0KEwNvINgvvlqhPAqQXxisjI
	 XoW/VpHBkk0WUW7X/W7ajrpKXrJkmyly+egVlppFCEBfKS2VEtP47Ex2UtUSFgKePrJVY
	 oAF4VPPd3FuX2z+umW4XL/FONqHUNgAFgzYrNTCD3B81Npz5UTTKwQyqb3Pd1Ny7A3lac
	 u9aoUx6VrsGbtu/6RciWXHIUAjrAsR+0sz4hbd63HSWN55w/aIDX0dES44GGTSNzEyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906643;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=dXYDFW/0fPMnA6KvoRTsUPnIpezmhFCgKFQeXv7Zuz8=;
	b=BCOrn58NmR086UhxyEQF0CUQSpITu7h599U7fplftZjo4IHJM3Vdioyj1Ya2iyx21YgO
	 wSsVIQPxrgCoY9bZU2UO0neKaQnd4n6CO5GGNLGgSekuT/cy4BzsCT2ayresS+VGDlhrN
	 AbHm0RfSMLQl6STJ/ZNx58jig8twotneF/RVNox8Kx+PRYZNOZUWUCKfTU9jnZmSBKv9J
	 BlyNG7AKHOhdRnXl6DZeE8DK/BNulWD9g2U+OffN5NIy6QFWSYWtNYBR8XVpBmlaXXSQS
	 eN/sjO0kDat5BI/ozJG8dYlv4UnVKNKjVMXT4g+pUrkSG/8KYlzzYgkoWqp7H6c6uTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=uCq7+x3I;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D194B606A338;
	Tue, 17 Nov 2026 09:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D194B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=uCq7+x3I
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D089AA1649;
	Tue, 17 Nov 2026 10:10:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794906640; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dXYDFW/0fPMnA6KvoRTsUPnIpezmhFCgKFQeXv7Zuz8=;
	b=uCq7+x3IblpzixUBPKoYlqjH8zs/iOR39mYOetjxr5v22ViJlPlRL+muvXn7yBh92o565H
	l5gus2MXDJabl8FxLA1t8MIUdRA+u5G39ihbcuNPFSN9VTM008WxgqWf9lfIyD7JN2ep8V
	kDrHJbCPio/VSRYK33xNRG9dd/il5VqhNIuuEQ+9kqeiglfJwlBVHVcz5OhLYFZ3mr2a5J
	ncrHEMSUMy1Ir7u6dZgfiVn0Xluip131cjGo5/lmMZY5WEfFVzLJXE/hxyRBS5m8FIODaW
	hoVRi4oUdr5EXoJBtatSgIhYtgl2kBfdJNnowSBODqoHMycjI6XY5EC3xcG9Yg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 17 Nov 2026 10:10:39 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: netdev-bot+sashiko@kernel.org
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, f.fainelli@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierremarinleclercq88@gmail.com,
 dave.stevenson@raspberrypi.com, justin.chen@broadcom.com
Subject: Re: [PATCH net-next v7 8/9] net: bcmgenet: allow the MTU to be
 changed
In-Reply-To: <179474771357.2199510.15722627746438398810@kernel.org>
References: <20261112-nb-genet-mtu-nn-v2-v7-8-43a5d90b3256@tipi-net.de>
 <179474771357.2199510.15722627746438398810@kernel.org>
Message-ID: <f19d926576bb56bab6bc3656fddfcb01@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 15.11.2026 14:01, netdev-bot+sashiko@kernel.org wrote:
> [...]

> [Severity: Medium]
> Has GENET v2 been confirmed to handle the larger thresholds this 
> enables?

No, only v5. See 6/9.

> [...]

> [Severity: Medium]
> Once this lets frames grow past priv->tx_thld_len, does the threshold
> split in bcmgenet_xmit() release the head buffer with the wrong DMA API
> call?

Yes, but it cannot warn (dma_unmap_single_attrs = dma_unmap_page_attrs).
What needs fixing is, that first_cb doesn't track the owner of the 
mapping
once split. Will fix this in v8.

> [...]
