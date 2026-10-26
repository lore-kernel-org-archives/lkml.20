Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793040682;
	b=M+JBdLaT8kN/UY93MzXmggC0aJz7Y/bVo+nku3SOZi16ARHPidRI0ayWaIqmfCPa/udV
	 sJgJQprK9Y/QcSwvb9ULsOZrGnGGPVb0zsrNSnqZpb/NlhJgF4G242Pmb/EBTeooJ/4kW
	 8mn1j8jIk2UVHnWBP7NTBX4a3E2NIQKWR0hRyUc+bKdh1wNqSxLxn07Mj/XLTKAF8m4Wr
	 K9PdMbJHMpTam0SjtXzNnOgqEqv1VaJf4ImgybKMs/lK75OHEYlTto6ENFR51fJR9iv7L
	 1br9TxUszJ7rOHwRdmXgq2bBqvmRFPq8LUYTn2MVmx6Nu/FTYwgojV3o9lO65luSqHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040682;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=SL66E7dXp058chPFRmwkfQb2bk9L6yNZSxbnPeoCV/U=;
	b=cLjv4TZX/nrHq4PbSNJcyfjEWVyycTd/6u3E7t8CFQB43bdtI0nnsOvjjzbflP1artG9
	 +dYbARi7P0600utuCNDnzOumc3FYJbOTxrvTqlEbRmUhj1TF9Vt4B+0JBbjNBvdUCB9Zf
	 TtYzbtal2MT3gSq3RmZBJ9WXaDmPuumWJf0rfE33gXs4rxDMYnZcQmDw2TuqGRDoJON2x
	 dD7FNix41s1cCbex+Bp1mMMGNlDzmj8qHmZekz7WnF745VZGiXALNuxZk4z+iTV+ziex4
	 XdTGGtIi/9CVuw9xn4xJnzhBOnL6FJRw92pg132kFkWQP2Yby82LcnFm13nLLbzY+Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=howett.net;
	spf=pass smtp.mailfrom=howett.net;
	dkim=pass header.d=howett.net header.i=@howett.net header.a=rsa-sha256 header.s=fm2 header.b=ejuOvIyK;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NhABH407;
	arc=none smtp.remote-ip=103.168.172.148
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49E8606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D49E8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=howett.net header.i=@howett.net header.a=rsa-sha256 header.s=fm2 header.b=ejuOvIyK;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NhABH407
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 1CF49EC06E5
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:51:21 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Mon, 26 Oct 2026 14:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=howett.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793040681;
	 x=1793127081; bh=SL66E7dXp058chPFRmwkfQb2bk9L6yNZSxbnPeoCV/U=; b=
	ejuOvIyKRkK5v03zE1fXOqmQqhCfeS4w0C3//eaWl4A2YP9r+xTehXus9QF8aXZy
	hfKQrcxowcK506ygdaNT3mW5vPYjOy6cukNmkCs/HBYiZhXANf1l0RRlKjelM42b
	+4Qw2LapXw/V6X4pEu3OU10Ph1eWxPkK2eNAJl76QFKJcL+joSR6FuBZFbqgU9e3
	jfr5u2ueffk8qNBaySe4qihHglipazogM9EX4aRU9aBcBg4p9etd0lgTHTc016Zj
	2m4WW4JjSZ35SO9ptbmBLyTjTWviL/8y7E5DmYEhOVOEekXQ8S72MWKSXcneR0Tq
	avrIaDOxQNXbFphljOD7kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793040681; x=
	1793127081; bh=SL66E7dXp058chPFRmwkfQb2bk9L6yNZSxbnPeoCV/U=; b=N
	hABH407tbRxCAOG7QivYLvbqYzzBN1uV9Fljl7/hHXIjgHuTPGPM8iIPMI0O4k6q
	lnGvUql2CkjhNcnOj/R4VppvcQ0rSDbiwzDfSQtgCdNgKCTfVTujkrood7fUQo8L
	TOpjRGB9hmXY84i9mLGeC+erh7YZf6lZtFOwVt4IKaB8K32m2eV6iMo3hBP6qPqC
	sY6Gknqg/OhJv+Fzz+CdoQ6z5IX76Y715H1QckhQtfVUIRrrS0JHtH9qF3PIwOwY
	GTUb2bDj20pPUaA7/fLHetOXL2p4eNT2Ib49ZGJkNUaFgWYKiaO6O3VeP6XR+Dm/
	IQT50qt5DRuGYEZ39KwOQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=howett.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793040681; d=howett.net;
	mf=PGR1c3RpbkBob3dldHQubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:SMnWHy+VWWFNVe5JEEw9UOLdoQiN69VR+zyhAm/J/ZGlK+4
	d0T0483tR3pCwxtR8PAO/+5xtwppd82BWrdBwuGL9iKlzi+Wv41WJCTaAclB6UBe
	VOgsa3s3GKTn6vdV8OoKpdUYMz0pM23DqH8PzsnKd77bSipgG1h+yQ+tl1IlMfPW
	hv0H8jQweRrUItO9CCjs3MnOsLSw/iO1SUg0kRprTTkgka7zoL8seBlrUNh7+mk/
	mnUV2Il0IOL3F4ugfG19kaHFSj4LE/P22EZjFrm6BCsDx6s8ov0Fi6v7NOahoWFN
	NcgKAhh6GOMYcnv30NsRe24ItwoymoBhMcPfmnA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:zYeKjx/NCKdGS+Go6b3dUtGc7HNarVrixOvoBml7mTc=:SL66E7dXp058chPFRmwkfQb2bk9L6yNZSxbnPeoCV/U=;
X-ME-Sender: <xms:KKHfaqojCf-9GKnJvSSHpTBxFRGwqJuQphT9Mbx0bXypd4VeO5vg7g>
    <xme:KKHfaje_NfVSdIQxtWldF_t_tb0EU1elvDmSyj69RNXh247nNJhyG32BvZbfo1-CC
    X-0xBCr17W19QxRNJ1zukJnqoCRoKUCdK9_9UM6lXz-7APPsORwvtZB>
X-ME-Proxy-Cause: dmFkZTE2dwOP0Vr+4fAh4BxkrpQ5LpXyFFxx++BpHANOfekz4ic3VMne7WWJjd6EvB5K6C
    /0ht8ytgxN0LT24yFAEVFvvP2nd+n0tBhTzmwJNcYm52CpCv4UhbZ0yHEYoMFP9ECj6ae7
    3fa5MPPxjXLo0K61lMOYYoT3n5hSeqnHYa8/fa9oQ5sQ5O+eHv0ud36YnCCUcZs7fLNNDy
    FzMovSL7hLU5worsPv4doQUFcleCp0bOqaVkBmdgo4cullV5gGS8bnf2h4B8M8MyRyjh1G
    Z8aoPaIVp3JQkhzj7eiMnlX2iWWRPNA9I0FVXPdQT4ovfhkvteOnhaamBrQTqWO0qSu7qV
    bd48OJAuEFrPFvuafO9vPJ86rTDX2CjrdiC4Hhybq/qPw9bPhu5D1zHt3ERpWzKrokGlMW
    JIx4ONS4HQ8JuHsOgdB3YO+fFpPofMMBfIh8+gha75ZuhlaKJS7/+4ofrDYJUSlCmoFiUp
    umoW7Hcms8WJQSpWZp47FH8SM9GAXSbkYfS4UX8QIxXowKz9SRaVlJ1GaYiJXNfJOAGz56
    2ozl+tPvQN3uwQayiU7q5rQS88dvy+8pIMiQow51qw+EgFTwaZboUB4jJ0ttyKSPqgKQUp
    ZuJD4MF5pFdPj488PignE3YF8VYCAEjbZsTEXClD8Jh7uqB1Q7EqO0EI4EvA
X-ME-Proxy: <xmx:KKHfar3C2Xp6rCvYCBMXqmoz_0olnaYM4RWv0ASc3zhdMQHeyQC9JA>
    <xmx:KKHfajAS5mM3gxUQsIp-TTqSYgSiq5RmN8SOTNqLY49Lt6mbGfUsrw>
    <xmx:KKHfancmxvd419M67bxZ3fbJwqZCHlD6YcBoTCUPnT28h1Qi7za5_w>
    <xmx:KKHfag6MEiXOqVH-31Jy97_afBONPm8w4g3G_SHrvro0gDKACHiQpQ>
    <xmx:KaHfaqbnyHYmYdE-ZLSrMvWt17oqU_Kn70010J8On7-tf2_wCGN_PusE>
Feedback-ID: i32264b73:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A973B216008B; Mon, 26 Oct 2026 14:51:20 -0400 (EDT)
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
X-ThreadId: A1nFJ8LpI0So
Date: Mon, 26 Oct 2026 13:51:00 -0500
From: "Dustin Howett" <dustin@howett.net>
To: "Till Harbaum" <till@harbaum.org>, "Andi Shyti" <andi.shyti@kernel.org>
Cc: Whinis <whinis@whinis.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <e46dd1c9-05a4-4f75-932a-03eda7b2a03a@app.fastmail.com>
In-Reply-To: <20261017-i2c-oops-electronics-v1-1-ce960f8f1b7a@howett.net>
References: <20261017-i2c-oops-electronics-v1-1-ce960f8f1b7a@howett.net>
Subject: Re: [PATCH] i2c-tiny-usb: add support for the Oops Electronics SFP Media Buddy
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Oct 17, 2026, at 12:56 PM, Dustin L. Howett wrote:
>
> ... Due to a bug in prior firmware versions, that protocol
> can only be used with devices reporting bcdDevice >= 0x0101 ...

Just following up to note that the firmware update which makes this work
properly is now available as version 1.6:

https://gitlab.whinis.com/oops-electronics/sfp-uart-firmware/-/jobs/9582/artifacts/browse

Thanks!
d
