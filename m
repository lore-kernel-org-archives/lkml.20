Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794802368;
	b=yfaAxVC4valbexby7tfHitpzVw4WDpjJ3ejPPrcgT4NyYNxSlvvtTEA8vbcPf7ogTkzj
	 StRs7O1YEgfVverZ+xAtBRGVNewmqbO0cJc+Z5Xid5hLcn23NnMt54G29w+Ur/mzboOxN
	 P1oxx5mR8UOqTM5iShRhqWlk4igw3oUDftYxDm38hGQIc/S1JLM3K1d09OHWQwmSwW0bV
	 jpsADjKGKWijEjnKFOmYZZlaTIvdY4HnB+91cMDGKqZVee8GWIb9s7vMwfg8RQ1K5iAs7
	 5nDNx7rMcEalwEkII72YSM6ySlBDCnU/59FnSl0HgsYdOHRE03Il6b+d/wZvVBKjb3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=02Znqn8yz/ktSadMwkToSavZ3zbFTsFGNf4SxxWIuWc=;
	b=c//sqMecF04wo+opyuDo7uEXIlnM0G2+rcfBh/g6Es8OanF8DGdIv7cUvQzO02/G+Sa0
	 1HTt2r+TtbfyFzDrnVkU2cY2CES3PyAUxDbpXtGo2cf22QmCrVmttpmw3fnF+J3rlvhw2
	 g1U9bWcUL1Yqw/VtXf6a1rMJoqNzKPPfzEk2qVYM4buKv74DKtNKlPDvXA+OKHCn/CWTG
	 Zs639GKXjep4LTu1Ry8I6kkXBJQa6fI/LGpvjrM9vsFv26WkQouzO5viVwLSLj6iAQt8h
	 pdnOHHX6Q3lgvZ/aIsfkbfM9ki3wZG/zVR5fxqdreMe6HHzgZ3ISvOeUx8q7SIUvDrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TXuPr6SE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCDD606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CCDD606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TXuPr6SE
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so4691963e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:12:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794802367; cv=none;
        d=google.com; s=arc-20260327;
        b=XaZ54AdJ3EVW6Sz/L1ZzJ3YXtOjDf8vWCvEbtIqwTYANHvwTWpQb0a6KaNS3P1mte8
         y1YbuqPal4taB9EzZ0N1Or7OaZyIxkpVdBIKfdFT6vuL09frTV0kU/NDe2kV6LoagoEp
         RHRJQn1Dvw+O7WYfVscKlrexTq78G4QnswYjlM6QfU+x0oOpcb2zw74pkG3xyOt82bP6
         1NJSiFlmO8P23NR9GdRU9MlzjDhBi+WhTEwDdO6Y+sptGBjcTGLtEzGXn4JxKIjPD6Uv
         da6b8aApq7CiFQO5FBpoDEr3z2zAYXHxYk9WmxpDTW1M1hg5Kr6TcVz3TZZZPdgTFFuo
         1Nwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=02Znqn8yz/ktSadMwkToSavZ3zbFTsFGNf4SxxWIuWc=;
        fh=7vaPmCDq/VZ+CjyHTDoYh9bp+0wcWM7AbpAKxRKrM5A=;
        b=XsCC6h43wIvMKhaZKMEPaad4iNae2qFSV+kx3zxxTI9P0a9C+Wv92qpmzEAG2nrqJs
         TEap9UOjL8Ti7Q/8hWoosWPRjPra8qbLlNViOp+qYUsXkR5r6/Mpc9yS742ULuT0UEd5
         V6es2NZbdFjZlx1o6Ua8iO7CgdmkqvzUU0msqfOtx5egNW43NHGxQ61IXCHL9tTfGBwE
         ieScwvAwAWWCJcKCTbnpjM4Clr2jEZZlTk7cGSTKR+BxbKLpZI8s90kUDalaUp0ZyXu8
         5uyZW9JqpRfP+oD4iuX4wl2EeI+MccrRUXvORR0kMDHAfNO/RG7oentSLk7b0atJgPV0
         jDCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802367; x=1795407167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=02Znqn8yz/ktSadMwkToSavZ3zbFTsFGNf4SxxWIuWc=;
        b=TXuPr6SEkNx59MeEiBxkERt5f4mWr/KLQDwLa2jrvJYieaT+qwMYtqe9ZaojTHhZHG
         AJ7lHgR8xxpjk51JCJIadB37QGvLRiP0FBhk3yEvDf2lPtFkkJLF90wQu2Nb4O6kIf4n
         zZTlOkFImdMHRYpm3Uy2EfdKdMtJfA/3jteb9E4VGVwYJMWXf9j9hzcoPZu/AaDp2LFa
         0cDrWZEbL6WdhqLbjlTg/btbj0ILHRNIJZJYgX0J7h+us/HHw5W40QvqwH9YTLQRNAfF
         fTZ2SCX5ooqvF/KXBuYoINgxOHsrXPaKwcKZzhWOjTqLOZjq+6bIkxVBjdmcC8NhevmQ
         qkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802367; x=1795407167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=02Znqn8yz/ktSadMwkToSavZ3zbFTsFGNf4SxxWIuWc=;
        b=KNYjFIkTnvXodABnFPVFy48WGhIRQ84nVedkFomRzWwvWf4CY/LGAqYZfoD1javjlr
         ouis7mIY32/6s/9uXb/C4yaQPIa4k9DPGJWb4qBb0edqL9Bn21uhhB5ULl6/34eqav32
         a2aM70xWzNcZglXLWDYB1YORlKqOF7mRFkaAOgUf4lGs3gc8egAJAq3VwKYQh6CCpy1T
         ouVAlWseR61hDoCeXI/lhVcR9yMY6uoUIMXEDvfMUJwUE+3Pl/2bM9C0PUce1khpfdDg
         j6EyzTXWlHCBKe3QP3kiD5Hg5hVt1AbLPaBnYfHpYb+ACr9lzaXZnpGoIS/B+XH9npq/
         CcBQ==
X-Forwarded-Encrypted: i=1; AL+hErHjFIo05gk+VE6d8pygGEcPYu12Nw2L1N2JFyIRCXjevoTj482BPkSHE3loAZGmXpXzkvlIiXzScHkguz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z93KnlvbIV/oKavrOpyrL80zS/BB0xajPSkEcRDtZmKwdxRAsgh
	Zn/RbYG64IaILE103+0ezKZGP76jCs3ALEQEihcqqKYBxzmJkpOKKIApdT5mM2Ba2LuHxJGrkfD
	w0Id7PUrf8FB9VYMD/qx89Sod3NS1Bbf0G4La
X-Gm-Gg: AYBFou3o9nsOWpaZOTT+FyzGQNWMgd3t0MBdAxJx7MZH7DQOoKMDEjrj1YavQN76d8l
	gRA+4pCpMsH2XMMJv3VGz+kGtdapmGeqfP3nbl+MU9Z9s5FBrmGiRq/B+Tcy8815XF2JNvZJ7f1
	OnTEj35wIEgNjF8f7eKFhapbVLNXQaLWqF5qtxxxcJnDcB9ED3aIhST8Hv5K8WXpsR6aKMOrEgW
	4W/Sb3SOHWyoiA5jOpmKdWAgTbgKNZk82MYTxP3k7fOhnScz/YBFoKFjtArnydavlS/zTPvMn0k
	truuZflF7kCtIAR1AjCcScdbjrAEdFT7R46OMycp+9hafmyqgQIWB1O4kSNL0YFAwKHbOSntgeo
	v32hQBvlDpNP/a0aMS1L9pImKwgaRJ69r5JB2/0RU2VHIyXF//+zk55JFhIQkD5OprZgjozUoW3
	Ry1TRpJsk4bYxiKX/m2X2f/U6Nh9L3/qVYKMhSjvlUSB1CgEqXFXbCL9il//SUsCVrH+XsTiGyu
	1O4ESYVAcxg5OnBvxlRdli216lIcA==
X-Received: by 2002:a05:6102:6050:b0:7bb:64cc:1362 with SMTP id
 ada2fe7eead31-7d64d727889mr1664247137.6.1794802367378; Sun, 15 Nov 2026
 20:12:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
 <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com> <37e4b9b8-d381-448f-a2b3-b92d7bd9033d@lunn.ch>
In-Reply-To: <37e4b9b8-d381-448f-a2b3-b92d7bd9033d@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 21:12:35 -0700
X-Gm-Features: Aa3M54rSYwnxbv99PItlCP4qZptsSVG-Nk2eGb_2dwgIzFKw24XwIBCbb3Igc1g
Message-ID: <CADvTj4qh8Pvss+xEwcjshodwv-yN6haP-9aaeRXg1ydSu5ibVg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/3] ethtool: add a PHY receive byte total
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 8:25=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sun, Nov 15, 2026 at 12:45:46AM -0700, James Hilliard wrote:
>
> > The generic PHY receive-byte counter describes successfully received
> > traffic. Some PHYs instead count bytes in all received frames,
> > including frames with errors.

That restriction comes from the current kernel-doc definition of
ethtool_phy_stats.rx_bytes: "Total successfully received bytes".
It was the reason for introducing a separate inclusive byte counter.

I checked the PHY statistics callbacks in net-next and couldn't find
any driver populating rx_bytes. The original series [0] introduced
the byte fields, but its initial drivers only populated packet and
error counters.

>
> In the general case, that is wrong. A PHY basically does digital to
> analogue conversion. It takes a stream of bit from the MAC and
> converts them to analogue signals on the media. In the opposite
> direction, it recovers the analogue signals, converts it to digital,
> and passes it to the MAC.
>
> Thinks about SGMII. When running to 10Mbps, the MAC has to duplicate
> the bits 100 times. At 100Mbps, it duplicates the bits 10 times. The
> PHY then puts the bits onto the wire, it has no need to understand the
> duplication, the boundary between the MAC level bits, it is just a
> dumb DAC/ADC.
>
> In order to see frames, not a stream of bits, you need a MAC.
>
> Now, some PHYs do in fact have MACs. Those that implement PTP for
> example need to reassemble the bit stream into frames. Anything which
> does MACSEC. Or rate adaptation.
>
> But in the general case, its just a stream of bits. And the byte
> counters should be for the general case. And for SGMII, the definition
> is a bit more fuzzy, does it include the repetition or not?

Should we instead clarify the existing rx_bytes definition to include
errored traffic and use it for ACx00, dropping rx_bytes_total? That
would leave the existing packet counters unchanged.

For ACx00, the byte counter includes FCS and bytes from CRC-bad
frames. We also tested at 10 and 100 Mb/s over RMII: the byte counts
showed no tenfold inflation at 10 Mb/s despite its repeated interface
cycles.

[0] https://lore.kernel.org/r/20250110060517.711683-1-o.rempel@pengutronix.=
de/

>
> If the PHY has a MAC, it can additionally fill in the frame counters.
>
>        Andrew
