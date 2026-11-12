Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497409;
	b=qSI82MYLb/nIG+GFBMMzd3c6GNeiGamnik23TkASaApa+IAWji+pcav/aK4TTEoUkJnU
	 wfeP6zbpStHvAZnRKV5wx58L4ubJIk0rmfu7e5MaxAJyTMuqNZJhqUySnEz8S1hXt3H46
	 1rC59HwYwFcLMn8DX7okIsCZug20AATNv8Jm01nRbPBYY4Gx73uPAXqE9msXF8SqDAMIK
	 UscnpUDmrN9mnwZbIrn10iminLnC9rp9mbrpDCOLHIYYqpqGubsJJ5rI7abazaRDypwfr
	 IRP/h4K7SvJFM/8/vjDR9N6qY+G6Tw9P80LprSKskKUa96CgLL733Nitw4jtSQALH5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497409;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=nE61lgnSmGjC8nW6hnP7/bxhS7rbX6LQQlXmuayarqI=;
	b=kWQmH9ZtZdPVddtV/+fsy3CDh9iArTQZn73ido0sbLTGSI0RryMcP1dy0hGFN2g+pGqe
	 lqcOBbjfcmkm/nVhBDnEw+HS7x+ggC4oNNKLkaZkbbnhLDUcFwumEFQZcqkV7lD/uXNWq
	 Bk2RmJs12MfYsq9nnEGNwQuf36nJfxgh4/C9OKrcGklh6xcfdTXOK49xVnk4kVq2kxyBm
	 NdM2gXqTK1xUkJ84vZiIV61cGeDJPxU2jUH7Ji4aEX/BoC6nddWTYnSER/9gxd/qT/FCg
	 5i4SqdEPb+ZYjRiJvLU4/3kNUourEvgHB7uhiztna2S8TAn10gNoWUDaVuMZCudjHng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=keFuLFhI;
	arc=none smtp.remote-ip=109.224.244.121
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2A3606A890
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF2A3606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=keFuLFhI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794497406; x=1794756606;
	bh=nE61lgnSmGjC8nW6hnP7/bxhS7rbX6LQQlXmuayarqI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=keFuLFhI1VNM6taMS8i2Zndz+isGvtOkE33PmBwMGwMP9PsTjChG7cshgZu7PvsSe
	 8XVyV1tRjr+TmsFiuwf562ZZmNO4fOOy2SusUnV2Fn+mlmjdf2RGJSI95v+6bWhAnH
	 1ccnSs/Pqusb+vAjRUc7aINTNt8DukozpTsQ0/wvJIwhu85x2lDrQlhC2WdEYrOa+N
	 Z0NCC5rwrmLeY+s1ziWtK+Tb6OT5kMnT5vXPvJQIjxkq/ccK5elD6MWjSMHropehWs
	 jjwyx1iwjknkSsokY0Sl5sIZ4e96fu/hEa/2T+Cri2UHRtM7uJT1KKsTSC37nEp5OC
	 1QjCkWjLcapgw==
Date: Thu, 12 Nov 2026 15:29:59 +0000
To: netdev-bot+sashiko@kernel.org
From: Ryan Prinz <rc4d5a@protonmail.com>
Cc: Alexander Aring <alex.aring@gmail.com>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Simon Horman <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org, linux-wpan@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Ryan Prinz <rc4d5a@protonmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>
Subject: Re: [PATCH net RESEND] ieee802154: 6lowpan: validate fragment offset against datagram size
Message-ID: <20261112152819.1014850-1-rc4d5a@protonmail.com>
In-Reply-To: <179447431152.2199510.14609873818368730049@kernel.org>
References: <20261109090226.799973-1-rc4d5a@protonmail.com> <179447431152.2199510.14609873818368730049@kernel.org>
Feedback-ID: 190731814:user:proton
X-Pm-Message-ID: c8098364fd82731015df70d6e1f0daba905de77a
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for the review! These are fair points, I'll respin.

- The accepted offset range has a closed upper bound (offset + length
  =3D=3D d_size is allowed, as needed for the final fragment, including a
  zero-length one at offset =3D=3D d_size), not the open [0, d_size) I
  described.
- 802.15.4 has no source authentication without llsec, so this bug
  doesn't let an attacker impersonate another sender as the message
  implied. The real effect is an attacker's fragment getting spliced
  into the reassembled datagram in place of a legitimate sender's
  bytes for a given span, via the overlap-eviction path you described.
- The CVE-2019-8359/Contiki-NG comparison doesn't match. That was an
  out-of-bounds write into a fixed buffer. This is a reassembly
  data-integrity issue only, since inet_frag_reasm_finish() links skbs
  by pointer rather than copying into a computed offset. Dropping that
  comparison.

Sending v2 with the commit message corrected; the fix itself is
unchanged.

pw-bot: cr

