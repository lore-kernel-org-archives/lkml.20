Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768578;
	b=p4bH1zUk6dBT4lOp0d/VshKGHuBRxYNhxUmwYaT4V/ZmMP0LeKrlKQW6lr98wO/67T1C
	 v70OjMznsP6eUyJtR8FWlH2g1tnVMtRLZrG7Gj1T474VFtyA9vkx15V0UtNDgxv4HWgi3
	 XW/I3POygrAuWSTXtwDgj6E54j8926k67dirSdugFjidHJtuQWqqsk+H+SmZ1Vv3UUeQf
	 cBo7/6vx0J6Wk2qV4teldC9/K02uVTaBrCuJ7B/b5ihsNZ67ta3KxicMCa+/CYAQtoBgO
	 MTXySYTmoEJcKWhzv0xoSuiet8fL/khi307x0xim9bJ6zisNRHLdSP8bP2iZTyoOQmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768578;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=gDbAbkhzYPwo+o4xIPlEaPoSb04+k7+HNXie8Q57pgA=;
	b=usQMqcmCaaCT24n26/nB4FENVSWA1/w4FjB4nFgAgytqyeHNkEYbZtlQnptQ0HqP4O7C
	 PlZyqedSbjKMissg3OL5cH8mYA5ZRqBrAsoIKYHVNmhUTNbrlysNpqaYVWQap3MbChBJy
	 RdDcyS6+d/RboU7HbJs+FVIfRFcklat6rsOZAiQIkGmlRKKugk5KfcYKJXDtCHl9+jbqZ
	 T7RGzPfuUJNMa3VQQgZKmvueWiEYxp2msV7Ji3WaDeAr3Nf3dUwlSRbzvuxCEB5mOouTT
	 6PZxnb09pCmhVY0UPfj5Xvi13lnFNKp+gcr0BAedYBGzGlSJd2RC31r1SvUfRy8AmJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=T7bPkBFk;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54A6606A31D;
	Sun, 15 Nov 2026 18:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D54A6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=T7bPkBFk
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4EE79A1654;
	Sun, 15 Nov 2026 19:49:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794768568; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gDbAbkhzYPwo+o4xIPlEaPoSb04+k7+HNXie8Q57pgA=;
	b=T7bPkBFkxC7VpDc3eN8Z5T1Rt4DtIUySaIzoxz9SxCjHKlQpNV0PV8GF9kxn2l3ZtHs4Kv
	3bqwiNeFjUXkkhHqE6kJBNF0KvFS0vJCUPQARrbrvHrQD+cA7uOqhoRb/7Egq5a60Y5mcU
	z6J2ZcAweNbiRNnNLvY8nxd0LBkdGpL/Vbf1D8iyHmFCxVGM6SynoVMVatr+27SusgQzDL
	N41mzCXlXAx5rwntAQE9hdXFbk9ODInNbcv/OgHXM+S1mSdUCscCabsTP2EjEkYTg5xRT2
	M3BH3P2BJAjhHVkL+Mm6P41x4CwF5en2obNFTeHlwvaR8/ySkJDKt63bRBZFXQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 15 Nov 2026 19:49:25 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Doug Berger <opendmb@gmail.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew
 Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, linux-kernel@vger.kernel.org, Mlody12 mlody12
 <kudzo51@gmail.com>
Subject: Re: [PATCH net-next 1/3] net: mdio: mdio-bcm-unimac: Define
 MDIO_OP_SHIFT
In-Reply-To: <20261113211554.2058181-2-florian.fainelli@broadcom.com>
References: <20261113211554.2058181-1-florian.fainelli@broadcom.com>
 <20261113211554.2058181-2-florian.fainelli@broadcom.com>
Message-ID: <b66402beeb5ad97ce60db4e127543b90@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 13.11.2026 22:15, Florian Fainelli wrote:
> The MDIO_CMD operation code field starts at bit 26. Define
> MDIO_OP_SHIFT for it and use it to build the opcodes instead of open
> coding the shift.
> 
> While at it, rename MDIO_RD and MDIO_WR to MDIO_RD_C22 and MDIO_WR_C22 
> to
> make it clear that these are the Clause 22 opcodes, in preparation for
> adding the Clause 45 ones.
> 
> No functional change.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai
