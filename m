Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219924;
	b=tJ7gaFhV2t6iO9Jvt9WS1Gtm3ZloCgfWzR7kVX5joz99665EkG7VsOyeq3PXHKXz5qKU
	 MfN7Ft4Nr7awsH3TBHZTRqZ9ukjJHi2oghtk7t7DugjOGI4AC/aJ3BKrJ3d/lnexJY+M9
	 iktI/xVaghuxDWdSmPS1eNd2lGVQA+8DMy+/x/vqz8bgkYw00suBjTkWjiIUyhK3/GMwW
	 7aSvBrdC5jDo0t8cfnlUmTKrzjytg1meogxYp5l/TQCSM/NakuC871eizeMflfULx8wka
	 ofPuMCSik2qJQQ1sc17fu5JV0oo0S0tYHWnRXRdg2KuIFnKt5MAF+KBtZZ3h3lMSgyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219924;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=7FG0ZGUz+/nJSORe3czzNBDPpFyaRa+MwsLFy+FS1XU=;
	b=TrDHc1+2N2CtHCG2h7AeAegvSXE3hh6WQf7Wrths5zHOeN2isz+doMVQkOnDiriqF0cT
	 xiCb4BcYluRcE/nc/crC03xIVeXu+DKgQNjMdQgx/7p73cQO0rQzL0MqsZkjhQ7195TTz
	 66FCTK2HWeFOaLOmjSxz9iarRcKpDEV3m9eZ9BIh0Nv+LKWVLK+nrBMZBb91Y3yG6Z8fg
	 9ngXE5uMteuXfMT2cvigCoUyiKkm/zXoxe4thkSBiJA5S1fho0bQbHxljejurhEmpez3Y
	 513UhSoOzrhqZLasHSPdINE17qNiZa1u03cNxopDPaCBdOgpCrhl0HmB67We36RL1rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=ZQAmOpQs;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=U2kfcLb0;
	arc=none smtp.remote-ip=202.12.124.158
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1A1606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC1A1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=ZQAmOpQs;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=U2kfcLb0
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 526237A0155
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:25:22 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 09 Nov 2026 05:25:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794219908;
	 x=1794306308; bh=7FG0ZGUz+/nJSORe3czzNBDPpFyaRa+MwsLFy+FS1XU=; b=
	ZQAmOpQsmISAmVQg1gBM444TIQwWyZZo+HMryNtJu1UQmmCKPkTQ1SEQwxDFpk20
	AulszDy5WY81x8qs9j4yctZpxrqOHWmu6g/6iWZ6+iRTed8hxopJtnS3Te2phJGr
	DSvgnHFHfScVtOwRKL7BmUkEl+leOxqS4gXPAcZ4hpgv5GS6f9piogZo22bauKbY
	0/U8Nehvm54WYWsZAIXqnNf7eN94xoyr2SzkjYLIBgrn+z69Kcj0EdFzEiF7S/34
	2pl+Rb/ChEpRx7PydItPShgR9n8MekBjmRNc+oet3lUkWKpLFXNaHTZjXuCtd3Rt
	asye6bFDgPlKRwmC6EqoGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794219908; x=
	1794306308; bh=7FG0ZGUz+/nJSORe3czzNBDPpFyaRa+MwsLFy+FS1XU=; b=U
	2kfcLb0HxlT0NqN3uhjycJoIjLc3ThLExG8Y2RDt4g4AnUU6DShbHjzMLdqBcoZb
	F5hBNT5PIOY1Z/lzY8QkuDAUCQJqe4rGMqx1Kk0tu9NeeMKAGiuOt/+KUUrzmy8i
	QgSa198G5MRYcBGevc3+giBfYjlfrVh9xrDNl4ySt7GjWgxMbjEjJ/8ksXyo+6ni
	ucklozhRSBXCfjQw07rpwhoclTXrONxcvu3zCXGKViNfs2cY/NO9LGlhHJ7pwNev
	cRv1+uLDY0RIQXc+5YmXzsYi+epWs03OJi1YQRHmu4/nUIlw57Do4al9J07DTYyN
	hyTsxChi3whpvAk97VX2w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794219908; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:CRU4tet6xNlFR9Ib9rySepfjmzwfi2baMXfIqe0/ggzVR6h
	2Xtz5direLdyrsKph6l5lhjT0gP75XFvwfsO89a/S+IcCITyCy517RoGfHmuikef
	TRLD/rk6G4kVqLtIdj00GNsUvl7RLPUsA3MNP7A7pIv5ES34cncTgZCncnJ961Pz
	FBhvclgCxvbW2Pp4r41AdiSCYY8dn+a0ZC1WJA6JX43jAhk/dDqXiyhrirqXoa84
	clAa6Pr24Cw7W4rOwah8nZ5N8juM3BQfWLMYEphHo61HwkhOAULabwENCXMMctHo
	8OJEM+hOs9DiTdVhKqHHwE+pRY28QGxiqycgt3Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:R8o1WRgAVmwTE+q+J2u6OTsVgmUZQj5hpHudvZ55vas=:drT5RHCZDEgytCRxXGmx/5tWTRwqxIkBs7nNVvmqnNc=;
X-ME-Sender: <xms:fZ_xatgb6jaRi0FE4oy8zHT7ztpa6_CVkpUG2QlOJX6o6CXfny6Khg>
    <xme:fZ_xas2-YI1EIf70Ijf5xhnaNsqMBw68I4sk5LZRlUIWlzU1PgBStBugbd7TUCsnn
    5NQ12dKOEVW88ptkwVxdNZxuHuvzEgMN7D30NzyRX1Xxgm8xta016Y>
X-ME-Proxy-Cause: dmFkZTF/aW+sj82PSRLNw3HRhYg0nNEjjFFR3a04RBHKRf+YplwC8fK0J2LyOPcAeBCFgc
    /z8LVW/Ml3ezpIlwbVjLYi39cBmpmMOzpvmKUNq4cpBMBZIt2QpJYxqhlxobUZcaNAbM6W
    MhfhqgApU9g8J3iOakJXLWO0tc2h6pZdjmy+l35A7T6LvjSnI1doHLuxzatY/opFlgfFTb
    5NYTAn+gJLOhZGE9h61rSJn2wz657/F5h9Yn2+OF6Yi+H+nmYlc4WaQ/rK97lZNgRWi01k
    zAKlLTWlZrh92i4CgJOfH6bEA7eu6fM/U6bHHN+h6M+XXvCeWbIo6TpEfVeyYyvL1h2Pi1
    XApZckRXh/UuQv+p5Z9E5geql3klAb6Obv3W4CyzUtscjECMEKqCXcGmxWJTQsSBodabsu
    wd4czGxck3HjJczVay5AH/P8Uhym5O9mkH72+4iV9K7IT5tnryr07n31mkwf1bJsjQrnR0
    fC48ts0J0rGCP0Ef8JlfX5sQpzeuQh3vDfvuGeU3dZQj9xDeGoUjiEwmNafuWSLs8V5HBq
    1ESPAWoAXc4lcHKmk/ePG2cY8uXTmN2D+EEe7DFZDeqSVbnHfybXTucRBdSowQ/Wpboi22
    DrTo9kVr9UPKdmhFE/jXgWy7hLaI48TbWDuSLr3XqadJhUz+7rhFrOqPHPXg
X-ME-Proxy: <xmx:gJ_xaie7E6MOJ9PFdlStcTnmQ4BSiwVWFAHUKOYZezrLMSZKAbR0xQ>
    <xmx:gJ_xanxgkUmKM3qKiVSR30_qs3ANA4lG-RY7eqshkYiDYVUNUJSVLg>
    <xmx:gJ_xajgZ4DcFgPAtpODSt6U7hImdOQNAVPF-BaKq5S-vJJhwDJucyg>
    <xmx:gJ_xak4ABPN_5wu-r2nTuvHOm2XySPZZx876j_onhX9akt6RGXLfKQ>
    <xmx:hJ_xart5rMUS8W_iRvGz9wvVLCEPQ8f19mAI8Kf2_ao9S8c_IR-KP7qF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 14E5932A0099; Mon,  9 Nov 2026 05:25:01 -0500 (EST)
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
X-ThreadId: AqNyIDC2Pk_N
Date: Mon, 09 Nov 2026 11:24:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Laight" <david.laight.linux@gmail.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Ingo Molnar" <mingo@redhat.com>, "Richard Weinberger" <richard@nod.at>,
 "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Thomas Gleixner" <tglx@kernel.org>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra" <peterz@infradead.org>,
 "Will Deacon" <will@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, "Yury Norov" <yury.norov@gmail.com>,
 "Rasmus Villemoes" <linux@rasmusvillemoes.dk>,
 "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
 "Alexander Usyskin" <alexander.usyskin@intel.com>,
 "Anthony L Nguyen" <anthony.l.nguyen@intel.com>,
 "Przemek Kitszel" <przemyslaw.kitszel@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org
Message-Id: <b0e3b33c-37fe-401e-9f97-a2753ed6e22a@app.fastmail.com>
In-Reply-To: <20261108203042.7e36f15b@pumpkin>
References: <20261105163440.2381661-1-arnd@kernel.org>
 <20261105163440.2381661-4-arnd@kernel.org> <20261108203042.7e36f15b@pumpkin>
Subject: Re: [PATCH 3/7] x86: make CX8 usage unconditional
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Nov 8, 2026, at 21:30, David Laight wrote:
> On Thu,  5 Nov 2026 17:34:34 +0100
> Arnd Bergmann <arnd@kernel.org> wrote:
>
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> All supported CPUs now provide the cmpxchg8b instruction, so remove
>> all compile-time and runtime checks for its presence and the fallback
>> implementation, to assume it just works.
>
> Is it worth doing a run-time check early on any (trying) to output
> a message and fail to boot?

I think the existing checks in arch/x86/boot/cpucheck.c should be
enough here, as they cover all known pre-586 CPUs and anyone running
some other CPU that we can't detect is already on their own.

      Arnd
