Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407085;
	b=QSHkJ3+uJ/UKlHN36UumHa92gW2Flj4tWQCa2At9lcr6524FAReQze/SKTMCxxmFDYRg
	 rJhHCXGTxaBTCKalc0GsmxG7PCmME3WxIZQOiiwbHKzWXyHJVYAITmtg0Ud7PoTJFQXft
	 kVuK8tUdMuDz39e6xAkKfwGixLu7W+lXoDTYCUw4/WhDVj2ESXdHyNJjQYwSD9bJcpns8
	 l7P65yzRIy5DIdN7yZSdFuwUpwYCiIzeg3hISFk37VJvWmy7qxOSu4sHl6/Un4bE65kp3
	 QxXhGsl57b9bdJo+8zv+n0wHq1rzrwtpClL7AWzS0bFTRwn8+KScEe3Tr0cMv3J6h8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407085;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=3TwglgxLWnAxX+mS1r9ZwGA0WJrncrgzLhkdtYm1buI=;
	b=45x9tD74D/NTVmIVg6ghjGbckJzHUN0qpvIEvuuTatltDVTeDXLXWHRkVh0p3Vh8OUMT
	 dClgqrRT/Ws/jpPOVBrO2gzgVa/z7HKSqtIqhOybUK9EDcE8hCDtpw0e3cy/84gdM4Pd8
	 W2bMdeZ3fXy+gYkxH/vD0pzpFGQr7L/T2EUDZOYPw1TYz9fLApXY4BafFWcxpInXg9H7t
	 TOnJ5RuE805edQKkPEyVAdBFe6zE/KMd4L4NdpA86NSO56gBS0LEZh8dybZo52sw1uWk4
	 b59EhwH8oRRQ6I0FDt2yHu8Y/Ln1Thsl7CVrpPA2M6ym7xXW4No+9/yiByDiaCuobzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=RH7SY87L;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DkoyMIQa;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DAE606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62DAE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=RH7SY87L;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DkoyMIQa
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 70046EC0633
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:24:44 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 11 Nov 2026 09:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794407081;
	 x=1794493481; bh=3TwglgxLWnAxX+mS1r9ZwGA0WJrncrgzLhkdtYm1buI=; b=
	RH7SY87LiwkHVy9cgslSDnIz8sD/o0b4zBjMZMvzA+24pRxnD+fa7YidgfXMPfad
	ermH94Z5y9+39PFpCeeZEQRaeRarZbl/2wgtrRIlK24ftcnCnj3EDN80+VhJYPN7
	07zxww3X4jEXnVkJuJV/FMzBgbYcresVBlFmDLupaHN0LQsxYyrj2yfHGHMjT5FM
	zmc4kbqKjZ+dL+hp/xzquP3rXLnpX6FLfyYBmzlSl0TkaZI2+Ik7f4n03X4xCE3d
	5Gtq4yMAqJwWeQN3Dtr2mYABO+qlmD/OfvM1rC410u7qtBmvn53LBhr9IU5u1jth
	miVk5E+LktvttM2+oB158w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794407081; x=
	1794493481; bh=3TwglgxLWnAxX+mS1r9ZwGA0WJrncrgzLhkdtYm1buI=; b=D
	koyMIQa8ZTONxRUJofZyeusQxJ+rHMdzpsnatnFDlgY3krzuqIFufng5JrnIwK9J
	ijkvN8cmd3AUYpT6TjKyjhEhExPuDmHn3opRQtoXvCeASpr7qwadvnkk34Xjec7/
	GikAaMOgukWd2kSDU1IglSnj15PwWJaiZeFZX2gFbONoUjMdVt+CYdA5yFMgxYv+
	A9vJfiiQ9x2xMX8LdgjzeVHdBINCIBGL3Hf6ZqkJMbaM0LiCh2QayVZ7VnePV3Ux
	bBjvscrK+YEEinO8F0xJkPltKnQchPna9eqMNmoKsagI9kyupi8rsSB+vvL+qSgi
	hiKFr3O3XfrsZKIpw/zlw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794407081; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:JlfOAXluJ6SZFi+++OjSBLxe2vhKn1hUEAYcdxKOfkxVAWC
	YjWIoV/QHrQ0dxkfz0KQRdbCcgSo1Azm74t2YrfLtbw+dzZtCr9JfdaDC7R6JOv1
	2ExoXosym3c5sv5S4HkPAtr2EEEXwaxQwYdmQULSk1CKNoar1G8B1bdyAXOEVxZU
	QXlsqrz9QD9N47lKw69qPVaSEdGBeqCg/XGjd7NCzWAG+kcqcB0ejzHTpR5ZStbk
	HMEhZ/KRpNG9yKbHk0H+D+L8Qcb8UT6eNxe9drPPXq5kDNbQR9xDOgZXlDKa8Dmy
	maTrKnx/VuFjFbSvRze3d5twfb8wpDagjk0Z2pQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:brchbrSjiSUdb5zlu/9g80IQ0bsBCqP5Jks/we0uqbQ=:p4rMGuJU+q62McnvRiUfh5OSocpkBbOE4t6t/A0jo58=;
X-ME-Sender: <xms:pXr0av6Lu6xeWLyuv6Mb4nWPTsfd6Ik9BRHt9iXkAfK1TqsTglNxVw>
    <xme:pXr0avuiVzmk8-p9u5azSDwYSLNZGrL8Zrb6A8SYIF8gAl-gGs5KyQBuo-7zxiB3A
    ycLK8fL42L9obFASxb9HcmlRFkoIpj2Ij9pQIiITmpvtvMwi6bQAaY>
X-ME-Proxy-Cause: dmFkZTEKKjBhFtwnKUVG+UzeK+T9XrlhXvPXTegWPGIpg32SD2Ui/IHxWmbtlbQjXrAfST
    a1tuBMrlmT+T3MDYFzCzcrRgU+U7wVVz0/i4o6VsgkkhIrd4SLrg/kc+/gs6AnqZY12rdZ
    +icjB3j23LVnU7CfXma8V+M6aeRSjlAcsyNariP9y5t7GXcOvt5FcLDZm1mfU+EgXt+Xpw
    qMcz2gUMjP/B0NcKLxSx0G/5OEBSMJvLiAWsSLkYhqdXRJhF1gMUC3mJjiO86lxpPbDtDg
    13MTTg05/vvqd8jM+gMLkhteU27iBJ15znFcQfyLlB7/0HNuq9hlVFcYsV2WkFcj5zlsjT
    uk9aeO7WxwxFTqKHt3xdJetz7ONOWpcHhF3wrSozj5UB3Pa0mYwUYQu4gNKtqZwDwN4/nt
    Tn/keb1Mmm+CF5kI0R3yGLsEWn6gSjbZLNo2vihrJLyPvXWGX/PQ850syTHQHEs0Tc5GVV
    3sI2mf6bOJXvJ9Q76xQdSaLGdusxa7v6VQAUayujc0uzvB6oxCwqbG0LfzBbja3faz78NM
    iQ2uIc1Rey+nfZdVnlRFepUy58ES4YcxGJmcNPDL1d9+g1zNi9F2YPZVDj8PIQzl4xRxFu
    8oeFzoNXCmgsfk1O6ygP0vRxVw4vOv7iwFAURYX2KDpQ71HRnUefbrV7f6iw
X-ME-Proxy: <xmx:p3r0as9iBAyYdh0ku8wBkbOe759cmGuJcP9VcOrpN9XaOJMbiGWe9g>
    <xmx:p3r0ajwH4TUb7xExaNVmJk-Zj79iQ1JLmJINQbHOw3mtHlCKSyFiIQ>
    <xmx:p3r0aoO6LGSoxDh2pwvge6111uT7t3OXW6jj18gI-0K5p99-7yrK3w>
    <xmx:p3r0ao85StYK1JZy8nFDnJElCGpVTr69L9NsVpHFhNmc9L44QAJzvA>
    <xmx:qXr0at4h5mT7r5kp1cbB0f_-lnHJd0F1BCX6HWfI3k2ynSimTgln5Mtn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id DA12532A0099; Wed, 11 Nov 2026 09:24:37 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AEzoRN2GBSm-
Date: Wed, 11 Nov 2026 15:24:17 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Agustin Santiago Isasmendi" <isasmendi.agus@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 "Navid Ghahremani" <ghahramani.navid@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Message-Id: <a9b6ed5c-4514-49ff-bbec-3f8206e8051f@app.fastmail.com>
In-Reply-To: <20261111133930.3665251-2-isasmendi.agus@gmail.com>
References: <20261111133930.3665251-1-isasmendi.agus@gmail.com>
 <20261111133930.3665251-2-isasmendi.agus@gmail.com>
Subject: Re: [PATCH 1/2] ARM: l2c: factor out the number of ways
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 11, 2026, at 14:39, Agustin Santiago Isasmendi wrote:
> __l2c_init() derives the number of ways from the cache ID and the
> auxiliary control register.  Move that into l2c_num_ways() so that the
> next patch can use it before the cache is initialised.  No functional
> change.
>
> Assisted-by: LLM
> Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
