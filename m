Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110265;
	b=qy/KB94BmY+dbJkpmhLMf8vO2AZv7PFMheR7OqJhsitL3S5zNNczHhnfKxrMvFTMjJIM
	 ZkjC25nJcpkiTG2073Xb4HUqTrfb0hwLZclmpvOVu+6/urb/rrIYoR4leE7eR619rxs0D
	 Ehbgb0ebZGcH15f5nVBEw7KrUhUfi/xKtt0pgMyt7QT3cDfwhIC1bqzvbu7Vy7LBxWZ01
	 lsn+pncVGoFFJd54N/miFJKpOVMiemcf4XPzG/4jOj2HlxWH+bwAMr4yxLzu+Syq5hMYR
	 MQn32e2fCwkRA1q0pCEqgGalXIFR+vY1HwUFXyCcD2USqnj7WqtZME4iLZzQUtK3Jgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110265;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RRZ2MBWzNYwJggTbwmtM9gGdzgMEuA60JaOMzb5uQqo=;
	b=IEMzsMUa/xQuNBAmQECkIFXLcSIHUXO+KZKcmeF4LsWT++1ICUNRGrKM3ZSZjozn7YP/
	 B3JwEIl17XWHHypRNuvFpqZFH0/kUNbc8KZvxwjVIHv0uGOvMH/woNiCh83QhqUUbSk1p
	 3kdKoRdvnATtAW78i7RSZ/G8ZsM6U4d3FV2Si7kWCO/akn9t0QNqy2DJVUe06iuVpA8WY
	 L5rH4VWJxCkZmwnoIT77+KR4ZBP7Fx83IAtmaF0L1pdPJJOGx4Eos17aATcEc7zU24hc6
	 xiC0EJg3sMxArPGcFp6DhDuJX3jd9ZOxhekKYB7ge3fbEVSxD+igdJGcbbf61Sj7V3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=dnxdZgEr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C79B606A31B;
	Tue, 27 Oct 2026 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=dnxdZgEr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE6C1F01825;
	Tue, 27 Oct 2026 14:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793110264;
	bh=RRZ2MBWzNYwJggTbwmtM9gGdzgMEuA60JaOMzb5uQqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dnxdZgErPgpAnn3y4STx7guGScvMQyW9idNcDDFdW8Tl0+csBOl4PWo6GJ3o+fQEc
	 OFKV0M8ag3mV1PZUlq8Vp2dhull5IE3TeKUf89ArU4rqbQjKxrZiwaXa5IIpWWNk8d
	 fUkwizDUiy3/OPHBauHmw8rrro0F0G1NFwCvgFxk=
Date: Tue, 27 Oct 2026 15:11:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Haowen Bai <calvin.bai@ugreen.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: pci-quirks: abort xHCI handoff if MMIO is
 inaccessible
Message-ID: <2026102749-spender-coke-2fc1@gregkh>
References: <02C44DCEA968C75D+20260914022743.30852-1-calvin.bai@ugreen.com>
 <20261027120152.4120138-1-calvin.bai@ugreen.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027120152.4120138-1-calvin.bai@ugreen.com>

On Tue, Oct 27, 2026 at 08:01:52PM +0800, Haowen Bai wrote:
> Hi Mathias, Greg,
> 
> A gentle ping on this patch.

Sorry, but I see no context here at all :(
