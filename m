Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793265995;
	b=aREJLwJbtBQ4BhyZEolrREVbrpzKqbeKTVKlEgEpUKsgzQ/9Z6HEWl4zQyZrLRPDaRYG
	 yAUW299NeMIiEcetlnfUQXlrxX9tvqNM+WeacJ+XOl1YvkREizvkwoRwDElN6JF8xK0hs
	 sCHBvWqSON0ESid2efHBbFoibLQXa7OPHZGiX5sEIJZWQ8XQtJD+o4c22CPFBL+4j+EE9
	 gy8bsXBisBdzaVqsGNTmjblnYkqT+qDWtwt+6zz4kldZkBBhe6Vksd0RjRbKQAnIzFZxA
	 EswaKIeh1jVwWr/9YI1xjvfcmTwIvdlnnvKmT9AgVRO38nA6t4qds83sruxxmTfUsEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793265995;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=JUlaM9WpYiweHE0HGw2Q5wyJ053Zlh4fRUNiE0Sei2Y=;
	b=28+F0v8kFsSn6f5PEU9M9feAbUq5crDy8PReXlaJhz8yiLZaaAi6XgxsFz6L/xlcHOKt
	 3RhMddap6igV4xTmLpjLVRNZFrUDXClbVLUyZ9NiB3dSs4j7dW0AJyVhGtXnoAP6DPNUl
	 iBzCytJQsCM4hD4OH4qFDrbm1+cP1yBlHrB1TZ1aoxvsM0TXDir/bKI9ZtpfZ1M8OVUdT
	 Ueyr6lTaUw6oXyEHwrUEw4jFDAS0ErY5PtjCaqE70VdHyohGb3sJ78a3smaSZ7EH3beo6
	 cUZ9CG72JH3QCh4OWaXKjakrIWFxfGNi8jgmeccsEBKXaTMXhiDz0awhD5R1dN+Ih2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=M3HzErsW;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Rcpho1FS;
	arc=none smtp.remote-ip=103.168.172.144
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3822A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3822A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=M3HzErsW;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Rcpho1FS
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 41302EC0121
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:26:34 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 29 Oct 2026 05:26:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793265989;
	 x=1793352389; bh=JUlaM9WpYiweHE0HGw2Q5wyJ053Zlh4fRUNiE0Sei2Y=; b=
	M3HzErsW/g6HECQpY7jEbx00vA3JNOD0kWxX+foi0GfvdjHTK5bvycW/1PYGmTr3
	HXiMzam2M9yfj7HLx/HjYHLICKqF78o79VaD99UdwPJrgOV5n95dmpl5huX/C41R
	583nUwoWQn8IOC2VLMbDEyEJjcLMrd/bkySXlAHzAqK26+w0Hxt/Fs3Py67DjSaM
	hOm2yZbn4g8k5GgzyLEEx2wj30Lw+vLIBFh9cyGpZ08KsfU/BnW2u7qf4cwF8r9F
	1XKQjsKIuCjqfbGO5AUfeKQFePT7m2GnWadnLy0KCHGzNbviLKQrohuK2OyIJ1Cn
	dyAltzXnA4159R6LAVzhqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793265989; x=
	1793352389; bh=JUlaM9WpYiweHE0HGw2Q5wyJ053Zlh4fRUNiE0Sei2Y=; b=R
	cpho1FSSUHQJdVWcblRwyKVFWAc1mc/yyvdoPfIvGo5JnIEA1rHPwfS5ah7ZL1S+
	AXhGsg705BvLISDFkkDYKJEE1ABfvoADIryrlH2Q83rcOZkyK+23DzKguBvnrhMv
	eq8YFCFVQqz7AL48pvl60jpudi/X7Rbo67eW9N277ekXrKoMxWRsbpZKr6+dLUo/
	UGA0qnx6xhZ9Ac+kAIBoXJCxI/Z0nlrhIKlLWYsv0JuvY96pBYC6EZSrsgz0qnfi
	6Oel5RvolyjRAVnkGj8ToUxNvJtdPSo1R7fVS9blbJgHOtwultDUSUHGXh8e3IX4
	wyfzLLdUtxZOMHE0Gt7Ug==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793265989; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:mw8m8iWhIQZn2LDBOObLF7Ah/f+wQybfmyQ2tlGP6Z+WFuC
	O2WVEGjQDgTtXXDfFDjgd00nmXctGlu1IzUMlO3yLF6cdYwgB8ApbtUNr8gCPFVs
	sZ1Q0Nc6RwpJ2tL8RiChRI5H8WRGyg/vcikBo1f6wX3XH0rqUyyrU2qDIQjMU2aq
	wH1/jXhKGVUabC9bh32St/DfyVwPMXXoAZn0BcvKYXx1J2R8JRzVLrf8Hyditmia
	EduKEHRUUrlvof5eJYMbxKLukq1DhbcFS1k5jyDy8ZD7syzybgeWIrIYW0wz4mSl
	VZuiHx1j4rsyqvIrsqtNGZ6WjpDIO03KoeJ5Okg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:gRYhEuLfYPjj84Rlc/L9H4sSFVrF9TV51oEklc5wsJQ=:bt3SsfUt4OeNoUM7vK/Z73nVZvQ599oSq5hQ3F+V9AI=;
X-ME-Sender: <xms:QRHjaglpHll0wa0l8ETUmtD9fM5hSvvBOWT2MCvZq0yT0h5ZGae5HQ>
    <xme:QRHjaqqiK8J__Kj3fKPDmRKHEiYduaHxPC4bjINj82iGPD8vb2HbloTQp_gdiorCj
    ibsLnh2eVw9IlFpRd5y-vsAxC9yWa6CTcEaHeUsZefCmfJZvO-jMh9k>
X-ME-Proxy-Cause: dmFkZTEydLGx17G3tJGFs8/rLhDDNPytwT57npfrZUsvU4FFkOlqCeshcDsfNw4WRb6bmp
    nc8bKdNhN2BRlvzUFgKOPR/2G7dfvA7UlOBEAJFiSuSCqWHgqEsEceT7rOvJIy8oZVyOpx
    p6kS3PcLzBdM3t378p35pFs6p3tjubY1QAzXP/Et/3h1zVQfzgII1sArGBOvcD/6XR8GzZ
    2WAQsgjJsipmY8ohsl4WNPenetVPsHxKauAu1Qs6hdpE5PJo9vxvBHSxuGj3tlC6EBbFlz
    S+kuJDxq2+gHyzSK6BwlQ3DmT4N9KJitrVREfXyjBMvc+8tNkmmIZlOWNGWuuYAR4yoFZ9
    aXfKa0KUApkRfHpIwg2v3AyJ0UMKsjzM2OmNSdWwJt6NrVWk8JiYZB5jLlM36GleMhcWVp
    P+nQy2CmN1sCiVEfqsNtOo+eMYXEaLyNuDIaLcvCppwG/9qkOkPqWN1CB4kVIeXT+yrIGq
    rl2pogtbB64T5sFQtscodPHZObWWTnuXyIKsWQ8sMifty4ZjUo507faJg+OqLPm0i21tdS
    P56oU4Y89ftFskAL8z0X8Wu0PuWnfGM6W8aYzwlbVpWiWC4mNh8YR1+5jlXHq2gP3f2mBr
    G9dDvOCTfHMl0adVS8sGckH/ecJma8ygW6YzCLG6+1ZzZUGRkosTg75eQ4Og
X-ME-Proxy: <xmx:QxHjagw_8zbmMxvqDdbuWxyG4Qx3L7KYSqHPCbe_SA3wmIoh2_35Xg>
    <xmx:QxHjaqQXSVD4itmDLfpAKla35wOOvskshe8BrjBVRa-uDy7GefjC3A>
    <xmx:QxHjatLRTHH0rmJlT9CX0moceHf8GOVMTmBNWuUrjOGbNcFSb_MW6g>
    <xmx:QxHjahUTQo5x1QXjcASV2nrIy5VLwHtEYrZk74UWhWPvYuzeY9-sEQ>
    <xmx:RRHjahM0wXMhwIWa9bdUu7ADKEwwP0GgydMwqRgjldSArJNW2S6Cnch9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D347932A0093; Thu, 29 Oct 2026 05:26:25 -0400 (EDT)
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
X-ThreadId: Ax_s3xrhtzps
Date: Thu, 29 Oct 2026 10:26:05 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Linus Walleij" <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>,
 soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-Id: <8bc1c573-bd4f-4dfe-9d7b-8b17d386ada7@app.fastmail.com>
In-Reply-To: <2a561a27-a3bf-4cac-a4dc-bfbc5c859f45@roeck-us.net>
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
 <20260706-sa1100-swnode-v1-1-332759bbd930@gmail.com>
 <2a561a27-a3bf-4cac-a4dc-bfbc5c859f45@roeck-us.net>
Subject: Re: [PATCH 1/4] gpio: sa1100: register software node for GPIO controller
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Oct 29, 2026, at 05:23, Guenter Roeck wrote:
> On Mon, Jul 06, 2026 at 08:14:00PM -0700, Dmitry Torokhov wrote:
>> Define and register a static software node (sa1100_gpiochip_node) for the
>> SA-1100 GPIO controller during sa1100_init_gpio(). Assign its firmware node
>> directly to the GPIO chip prior to calling gpiochip_add_data().
>> 
>> This allows StrongARM SA-1100 board setup files to reference the SoC GPIO
>> controller in property entries when converting legacy platform data to
>> software nodes, resolving pin bindings directly via the attached firmware
>> node without relying on name matching.
>> 
>> Assisted-by: Antigravity:gemini-3.5-flash
>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> With this patch in the tree, the qemu "collie" emulation no longer works.
> There is no console output.
>
> Bisect log is attached for reference.
>
> I am not suggesting a revert if that is even possible, but maybe it is time
> to retire collie support if no one else reported this problem.

Thanks for the report. My current plan is to retire all of sa1100 by
merging my board file removal series for v7.5-rc1, so it should be gone
from linux-next soon but still be available for the LTS release (whether
that is 7.3 or 7.4).

Hopefully Dmitry can spot an obvious fix for the regression, otherwise
a revert is probably best so we can leave collie working in the LTS
kernel and not spend much work on that.

      Arnd
