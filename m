Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794410231;
	b=lLEb3fUObfgU2p8uOEbkdU9jwd/0+APzHO2rPc8I0sYMj/3gK/MHPBCYQlBsMtdTefS/
	 8zVPLPfufL18C8+gnhmHJ/zoS1nvOIhek9bdq67jjK055nORRAERpr5vEfaXElxVpEpUU
	 YrrzTiA+Dh1piX4PObuBcszlgdpBqskrkrClr4bUdsikyt/CL7+TNXN88kD9yp9wAc0w9
	 wccwnkaSGGL7P1lX/SqzVkW7yyZtsTn1udqdJZ4D7Mn45crKOBWV8nb2aBK0A1+4U78mg
	 e8JRFGnwp3+g49e1Yz2OgT/SF+f7/44Pj9X9OzWBJSI8JIvcaOmEwGbP1XD6B6RPESQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794410231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lV8e6DuZQ+gcSvtMbjrorr5ZEnQbK8gl52vAPo45Rbw=;
	b=mC7/Y7oOK1YzM+1D2tN35uJDQ/1+u3eNzwpjYHVbUJWUW6lY/HUfvtC471zOsUDr7tKc
	 CP/xCLzwKz305cCqqCMD8PJZQrdzs3Zco7f0qLBmKutPiS3L78eQ58/7rSqme5ndydtjp
	 f9xOy9FH8lCWkAY1RD2TSbQBI6sbOrnyz0BfUfNXpA0dlVx+B2YtrtdGPM+S7/BKs51sE
	 tx3XMozZjGplwsLRPhj31ivBMqSzrir9p0MQN++lFzLuT6vF/3QB/U71Z1jN0mToJQreS
	 u5VtbukeQAH9FRm4KVHe8xhTj1+6BrsbJqeYVyD/Tv8HXUA+7cyjPVF7H1OGzI8722g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NfjHn7o0;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E033B606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E033B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NfjHn7o0
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so33050285e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794410229; x=1795015029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lV8e6DuZQ+gcSvtMbjrorr5ZEnQbK8gl52vAPo45Rbw=;
        b=NfjHn7o0nU8H/NUucQXScm7RP9x8Mw6dBA0Z6DhhkUKoR/QVph5zu+bXI1k9dxjsub
         Hdc7SndSqbgzVOWI/SX78/KBQkWjCyfONe8MZocaMPqcU/50ofO99L9EQx74p89HY6L1
         s/uJCFT2xEdxUPpT33DqfHDQMXKRu3J3UupGtViGWK5gqAo9MKr8r7z1CCnjKQe6wQ9i
         z6kzwaeWF6KvJxKhvpaWPfm7TwwcslR9RPqaBUzRF97z2+zru6WDlWJ2Ws+WSfedQ0GI
         kw/9fZjua/Ui2SkLZp+mNAQ+NmUq/I9Eww0W4ntYiJ5cYjPg8z/wMF1OedFomMarCfs6
         bJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410229; x=1795015029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lV8e6DuZQ+gcSvtMbjrorr5ZEnQbK8gl52vAPo45Rbw=;
        b=SLOU4CmMr7ZLjVHTXPmCerReBgMDvLSITdaivYKHoNaSaqWIwwLi/A/H9c+ROBXzYN
         b3NlQTl8ZLJRqagZonNrY+Ky79KWFoD1PgoEU1tfxY9fCIocrfIj1cfeG3dbj75upKJj
         dJYF/3ty5IFG2t0GzDjYqXhXl7adNcNIJPaunaO2xNA0g6ozZkW+y3banh436SHWtHeb
         fTIOFASyRsUnidYXVxyCn6Ny4jmYyDeAwiJnL9GiV4wJZUcG0Fpruz/RnsxVi7tkyJrQ
         +vvif3ZeZRY/jTBU+t5128RxO6xFghfJnlxQ2z2H5cMNtvUznEL1AgNTb5Smrnz5WSS2
         r66A==
X-Forwarded-Encrypted: i=1; AL+hErFmJ/eisE4/MItv9tKWydgVniHkBb1TGq20dStqUdNVnoUES+MKIxnT3M1/PSHTfoDWb9AIXiDge6cZ2vM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Rh4ewyLRTTspNBWnst6dnPLxXYbtNMTibEgYD0Ko4DiU3E0qJ
	O1mSDXeQxsBieDIH71MM1GyJ0lqE0RIqs7irI+Nzc7pzFTq1Pot2+gft
X-Gm-Gg: AYBFou3m6gOvQvVY5btQbDWybYufGv7t4Sd3Bgrq4laPeLujH+sH8hRyn7A6sgMk/Gi
	n6m0U8nlwq2poKJsfZqQGS1dS0qNMcI0Uy8b3d+M+d2cM7pcObyZI/d9OjzkxbDq/SvUu4sCgVK
	Ik+gMVbf5TlggcTdsSE7TjXcTk8SePDaGwsAtbWoJGZKWUN+vb3QTuvhPlNSeaiEXv6LNWj7MRY
	dq4JQxfBmG7SBChnJZmtuDz2xx1mGD0Rc72bsYk77ECqfQEVG5awaBoR0jqpYxapfc37vSFA9Uy
	3cxe+5gfOtduGWSqmCEVTTlt2Q7DdFw5M/iGQDedPW1fT/T0eQdi8Zdk/4rm82Ls1tyBrvL3mSB
	fs38RR17ENjZdRnMmYxfE+jNHTiaheil+252toHDgWNrvJQx/SyRyNpPH7Qzb7WofHfMglfyWrD
	YPG0pWch6MobYofKlgGfSEispvMo5udc06ayd4Yb71zChesgiSjRp8goDv/4ixPvUPrXVOTGVog
	BNObJXmPku9KkPtVlvqj63izJRYTL9VqvUEXmoow1726SOWUGu1z5Wlpj9r8zgEVcTQILt2n61x
	jtGEFNxNK1gEf7Ji14z+GS1w4160+7GQM7/UFeXidk+JrPXWyrlsxMJb
X-Received: by 2002:a05:6000:250b:b0:48d:f99d:a0d3 with SMTP id ffacd0b85a97d-499c7b1bb2amr4471623f8f.46.1794410229162;
        Wed, 11 Nov 2026 07:17:09 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm10149677f8f.20.2026.11.11.07.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:17:08 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] ARM: l2c: honour status = "disabled" on the L2 cache node
Date: Wed, 11 Nov 2026 16:17:07 +0100
Message-Id: <20261111151707.2253768-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <49846243-34ae-4643-9b39-1537947fbd96@app.fastmail.com>
References: <20261111133930.3665251-1-isasmendi.agus@gmail.com> <20261111133930.3665251-3-isasmendi.agus@gmail.com> <49846243-34ae-4643-9b39-1537947fbd96@app.fastmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 11, 2026 at 14:56, Arnd Bergmann wrote:
> It is a little strange to use the MMIO registers of a status="disabled"
> device to turn it off, and it would be nice if we could require
> the firmware to leave it in a consistent state instead, but I assume
> you can't do that for the one device you are interested in because
> you don't have the firmware sources, right?

On the H3600 the firmware leaves it off (control register 0 at kernel
entry, cold and warm; the bootloader never touches the controller), so
this board only needs the early return.  To be honest I also prefer
the firmware to be responsible for leaving the cache off when the
device tree disables it; I went the conservative way for a firmware I
do not control.

If you agree, v2 drops the disable path and patch 1, keeps just the
early return, and adds a line to the binding saying so.  Otherwise I
keep the check and add the comment.

Agustin
