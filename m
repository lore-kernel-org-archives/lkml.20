Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794165653;
	b=UpkATJZxS1R4pTD11hii44Ew2SKmdHY2ZrhwvjTdor1WqJSDTTdZZ8+P+BIHAcVc10kH
	 Wo2+LxPGhZXDjpmwJtT8/+F7ShpSr4qNeLE9V9Odm2yNOEeIHd3bH9oCOVHd2NBU2lQy/
	 dubXhLME+Gbl+8koHWFzmwI1LtNfd5cEzTUgdsIQr01gUD0nwf2n1oK5O9aAjYTtluvhV
	 UH7kCGSEgvzZ/rQuZsyN8Djlo4frR9aTcJAd1ymue+1w9PH04IYsWAJpga3qUZClwddfM
	 tII/uSoHfD+CyckfUVZwmvG1XoD7nX7UlUu1CJjk5iqxTSAqD65G12RVMahzNR2YsZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165653;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Feedback-ID:
	 X-Pm-Original-To:Received:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-MIME-Autoconverted;
	bh=nET1WJNk3mHLCrQL6NVnuBWMpCe5epTVs5C8Nj7DNa0=;
	b=0uqeZaep6RzhSmXKRsFnjDf4bwQ+Q4VXUv6IswraJUZn+J5CuoT1xx3vBIbwQKIq2X+N
	 a/pIfq9QC9FN//SWF9ex9XBksfaX9FQlNDF1Pe7c7/sUzRh434uW2c6MebTmKfm4WYpZ6
	 +dxMKgtBKBt8fXIG+ex//8Sa9zfsj7/uVflfhH3ygPQ6Lscg1NK1LWuOiADZRR1KJV5Rg
	 e6zRfuos0EctsKCQ1vd2OFSFXk1BqEQNZk911a/yWUbrEhdBqabpRGPIssP48aKavJX/8
	 /25p9G9NWT3JIOSTwL25E9Dp6/G9QFOKn4Nns9EMiGaQNoJO61tqQamb4CRBlrNqNGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=c127.dev;
	spf=pass smtp.mailfrom=c127.dev;
	dkim=pass header.d=c127.dev header.i=@c127.dev header.a=rsa-sha256 header.s=purelymail3 header.b=bYrUBH4i;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=Qby1ahSP;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CDE606A333
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91CDE606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=c127.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c127.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=c127.dev header.i=@c127.dev header.a=rsa-sha256 header.s=purelymail3 header.b=bYrUBH4i;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=Qby1ahSP
DKIM-Signature: a=rsa-sha256; b=bYrUBH4iUsBPghbZDki/P3a8hQZmHlPyPkwCo1+aE65BNeEEifHU7dtas/0ClkJjmUUwOJf2rIGrzBo7LOJ6IupdxaBQfop8Q1jkhsxRUPfdPy8wD6o65WnvpAR9AELFGtOwmxxB7pTeABTg7ltrlChYeKdvQuE5cI/4kVc+SBacYi+eXdsezcJ97jAy645t9XG0kV0sjdhb2/Mu1OEejqdT+kj9vxM3v2D+JiFmmPWTxD1uSfqXOgOXXTvadK/oiEmmuG/oMdgvkcQTPO24BZCmZZRp5beoq7hX/6NykXX+mEzfra68LQD0N0Skr35xorNCSiWveED5n90WilxLJw==; s=purelymail3; d=c127.dev; v=1; bh=nET1WJNk3mHLCrQL6NVnuBWMpCe5epTVs5C8Nj7DNa0=; h=Received:From:To:Subject:Date:Message-ID;
DKIM-Signature: a=rsa-sha256; b=Qby1ahSPpZ5NkonjottD6WZtcXGrm2Ur5blwqmp97dQHox6qWoUirBypQoEwuzpTh5gv5eYEXLjnytS8UATZTYVp+goO+QT2DPt6a7I6VJzhJPyBwvYdL1usSwBs6BBIZ3oV6K/MhdP2CG36PM8uhOVkk3VGQqefE7TvhGEFD7o1NLDyrrDPZCsCGxYn+WocB9mOKFXumwbBxSkGODWVDWSeue4DW3AfBE7GUXuztHjjNzepb4PKMXLk0Ha2R1JbIr+1biul/6JIC+ET0KxLHcIdUpRPWNUA2SEHevg6Z7d64kWGfyPc933Aarx982GHGLhTWjYw1Ig4EBchBywDSQ==; s=purelymail3; d=purelymail.com; v=1; bh=nET1WJNk3mHLCrQL6NVnuBWMpCe5epTVs5C8Nj7DNa0=; h=Feedback-ID:Received:From:To:Subject:Date:Message-ID;
Feedback-ID: 1017243:43747:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 322991363;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 08 Nov 2026 19:20:06 +0000 (UTC)
From: Johan Alvarado <contact@c127.dev>
To: alvin.sipraga@analog.com
Cc: Mieczyslaw Nalewaj <namiltd@yahoo.com>,
    linusw@kernel.org,
    andrew@lunn.ch,
    olteanv@gmail.com,
    kuba@kernel.org,
    davem@davemloft.net,
    edumazet@google.com,
    pabeni@redhat.com,
    linux@armlinux.org.uk,
    luizluca@gmail.com,
    maxime.chevallier@bootlin.com,
    netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    gusfmora@gmail.com,
    kuncy7@gmail.com,
    fabianotassotti@gmail.com,
    gabonpivovich@gmail.com
Subject: Re: [PATCH net-next v9 08/11] net: dsa: realtek: rtl8365mb: re-latch the family D SerDes
Date: Sun, 08 Nov 2026 14:13:05 -0500
Message-ID: <1e8da5e3-0d1c-4ce6-bb3c-4b9b7a5789a6@c127.dev>
In-Reply-To: <39e46930-0d24-46d6-8861-5dd309bb7640@yahoo.com>
References: <9b73858d-fc09-4988-8bab-fd7b88db9412@yahoo.com> <39e46930-0d24-46d6-8861-5dd309bb7640@yahoo.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail

Hi Alvin, Mieczyslaw,

Thanks for adding me. I'm looking into this on my side, and I suspect
the problem may be somewhere else rather than in this driver.

I'm still investigating and will report back once I have something
concrete. Until then I would ask to hold off on patch 8.

Best regards,
Johan Alvarado
