Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711645;
	b=4NQE47Zla9vFCKOANONyWa0k7gUMBY/v8COB5V65K6RmDuA1PTEEXsLvAtEFfY5WLFL5
	 UbOro1T7RB7puf/g02OmGDcrRlUDjRDeId+pQlJq05bqFTjfBqBz+yu5QGvQ9Ya5PC5LA
	 74WVmpnNce47+O+pySEi1onxcLifhU7EbaFM1BQ7aqlQ+CerQCsm233u/y9RsHx+NkJGS
	 mm+0vUY80xANuQRnrBYbFVsC65j7H+krE7QwbAABqGSz1v8hBPkfLkPlaTt+UtP4T+ehP
	 2EUNqbRIKtmb/fMIXVP1392wcBvTjP1ho0pRlJDSSnNH1dUDMfTxJ++8KjomKG1l9bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711645;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=7Uut5mkWx/3NAEsIwT1QlJR3fVGQS9QLbsjW5+7LTfQ=;
	b=KP6vldBTQMT2T66zwMLqH3SmUaGojWijevpvlVY+7XG7CzPjWjo6YBz/OreAyPXbDFX8
	 5bqToBHZ712HUCEzbQKgMGw38BtXBE6yf6tGp34IhfcfkSPvhfEhEMlQmBqBsearZckry
	 qpxZXLnZDddCfo3KH8Tpo+szmmQZ0o2wIW8BvsjQseXNVYH2ylHYKhqmsSTLM/3avpmDB
	 TzcSq6sHEmj7OWBbcPYHaWrXzIu+7sqXY8oFErsWxGaTyBOofTeMaACQtiyux5PRMfD6/
	 01dhpNmbfcsI6f1zzFRgNvGNTaEhJVfvbJXHCEnconVtj+mIaJFiLX9ZUWhmnjdZlQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=UY8T4xQg;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=wMMh74qP;
	arc=none smtp.remote-ip=103.168.172.137
Received: from flow-a2-smtp.messagingengine.com (flow-a2-smtp.messagingengine.com [103.168.172.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346B9606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 346B9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=UY8T4xQg;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=wMMh74qP
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.phl.internal (Postfix) with ESMTP id 3F66E1380C57
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:14:04 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 03 Nov 2026 08:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793711624;
	 x=1793718824; bh=7Uut5mkWx/3NAEsIwT1QlJR3fVGQS9QLbsjW5+7LTfQ=; b=
	UY8T4xQgsrtJHlSlsbPCFv49Fu6y3+FNDxITfYYQ7oFaKnUROsQyQlppAvx5Y0qA
	2x1bZ9/062t/g7C/EnhxN2/QHCAmK+8LOotk3BYlnhzVgCy18UkSijt+gdV/7653
	3WFgQkvGceaQo7nCCVOGKzJLr3vhXH2LpsG3OY7E1MADcfZ9EJuofwR5bjp93LlP
	T6NwTkb0M5yVs1x+I6hmuzaw/AHkHnmgmHJzpl0ZskNqGfTBrDjfB8ptknRb4dap
	pJJ3GEICH6SRqhDCFtoQlgfcLrXkizgdfbr5wCUJV0ASNwpmx85jRYwb6MAO8qsb
	ntW0bArCpY4mbE4XHoPVAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793711624; x=
	1793718824; bh=7Uut5mkWx/3NAEsIwT1QlJR3fVGQS9QLbsjW5+7LTfQ=; b=w
	MMh74qPs1ZQgSr8/Td6zE+4gffcP1WdDsVta0Pl8vm92ZzzvvtTGJWedy/vM84R9
	/6PW1d7z/ME/7mWH6E00fELlb3PSJAdINWHU6fNqhkgI3bjnTo3No8nrt9EftFwf
	jKRvvHRfPpgb0HWg4K7leXmS3t0Y/rxlVk5kyjA5DczwT1MI+3EumsbHcgLiqj7e
	NrjLiRZYEURYA9QQzojhpZSvqkADSIBzSyISIrz4VRI/RXLg/9U5Xs2rBvEe0h1Z
	TXUwfrfZhGhOQZOvOEp5zjEdK+VjnLRoG4ujhDbe0Khlsr1MaDLr55/X94wJPw+/
	UejOH4ejUMw4NRktjE/Kw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793711624; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:ehR5Dw1xEWoZ2OVcLP86q1w4gylBALjRkTJTYCEFh9VrrlE
	iGBchnnoq8Axd8SFLroAsZPsVyp9iBpY6INyJmd5X6IqL9MpbSvoQJTCxctnQpPc
	XmA/SISpUwDcgblU+YvS8v9CB+2MTkHEvJcCMpguNxQRBNkG9W131VIU4I/aJE7B
	hPyrZr+WA81V6Fyhnge2boU8S6L/M6zkn1MTSSupfZY3vSXZivVFTGB6lNlz8PA/
	CfB4wVFlUECyp4WEwFhT8UiNLQoWgX1jHXWwUcsUBe6ap0sRM/4tHlFtkAm+OPKK
	2Sn62r/Z826mLpKNcmYN8Uw4aarJ5/4b8MLNeNQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:UaizHl8egV/jrsixzSKLvKmdYvF4WtLCEGHA2kA3WkA=:zsolxs/hYbTrgyUK5mu6bC3loibRPhiWpdnp7Gh6Bz8=;
X-ME-Sender: <xms:-t3pamZn16O-F_dCjy0ATtHl3Rtsq3MeYosBdQT67QxXwoYiHJXcog>
    <xme:-t3pakN-M-t9UEqkehjusToniKsKaXk6s2EhWR4AnnIMSgzVxXSNj6DhYs__UNJEo
    ywpdK-tMkPZiqbmmhrKHKc9P-lrmDI3oOsUWQqov8biAoxOHk-oAn0>
X-ME-Proxy-Cause: dmFkZTE2L5a2p4A+UM6tRErQyKhPf0hJbRZZS3ULmbWFkCsy4zWWH2d08vZGKaEXzdKsY/
    OsKn0nkWj+LbsldmJ7mi6ZuoRi1WXwrCH7ZfDtHQZELafiVeD0qb1LvtRbrz6KtbNgiQ1d
    RRpQr8EhZHLXYQviRoKDmAS37qn041Q1n/dhGWRVclQQtMqcN8DjvxGXREFVU54e9IXKPG
    v/AEsdpvs7fhjVbViR/7hLy+moJ1RBCk56A6MloCwcof46fueMWMAA1FnxSX+Q2tQQrZTw
    gXJCfUEsID2E0jl3K+93j5O7z4KdF+nFKNIERbBBZt0KfkX1tYkYh07nWId2skS3AItFMW
    t0iukAVhIQd2ezU59xjYBhM5rUoCc+FdcZ7QOQ5aTQmyGjL/5hq7Wf0sAkG604j+2Z0a8T
    AiuiYneFWbPqR8ATufo1nFvBeezDBuMRpAUNEAQL1vuYeuL3QRN4a8o5neRS38LocSqAsk
    Stko79x6V9eUSevs+vfuiL+DAQWjWLK3BWYAtbKduRlT0Xxd6Vp2dW4+gfgZ4yRiMlLT43
    Eal/lj4sJLRFjZMmYw0S0Xb5YhkLf1q8apMh/4pRvVfZX5X2TouH+BMdNKEnHn08sXNesD
    JqO0NZRg3uBTqB4IZNSxf77ypOex0U96ZRlHD4nI17i/n6a6l7toXjwujyug
X-ME-Proxy: <xmx:AN7papP24kpc6s3jFYukNxjo65OEBVZ8v3fLlTygEn0DOCwXbBPOnw>
    <xmx:AN7pagYdjOm7CgSfQ3KLvqc_3hsynblm-FVse0Ub6AFh0oTC32Snzg>
    <xmx:AN7pajnUfCREr3qJmgREmVqjpV1wC2oVA88gl-jrSG0RchD7zw2CCg>
    <xmx:AN7pajA-AqUkF6H3U1HD62vvcX2UU2tFo-l4hxcdjiI67Kz1xAvJ2Q>
    <xmx:CN7pairgqP9A3xKBMGRViOFSYS7aO2otc__GwQlHgGJFDOVVfMbc4HnC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4983432A0097; Tue,  3 Nov 2026 08:13:30 -0500 (EST)
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
X-ThreadId: AHCvEt5753PB
Date: Tue, 03 Nov 2026 14:13:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sasha Levin" <sashal@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>
Cc: "kernel test robot" <yi1.lai@intel.com>, oe-lkp@lists.linux.dev,
 "kernel test robot" <lkp@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, "Andrew Morton" <akpm@linux-foundation.org>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 "Kirill A. Shutemov" <kas@kernel.org>, "Finn Thain" <fthain@linux-m68k.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 "Alexei Starovoitov" <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, guoren <guoren@kernel.org>,
 "Hao Luo" <haoluo@google.com>, "Jiri Olsa" <jolsa@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Jonas Bonn" <jonas@southpole.se>, "KP Singh" <kpsingh@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Rich Felker" <dalias@libc.org>,
 "Song Liu" <song@kernel.org>, "Stafford Horne" <shorne@gmail.com>,
 "Stanislav Fomichev" <sdf@fomichev.me>,
 "Stefan Kristiansson" <stefan.kristiansson@saunalahti.fi>,
 "Will Deacon" <will@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>
Message-Id: <e69e6690-cfc0-4ea8-83e1-5ad2d98b84d5@app.fastmail.com>
In-Reply-To: <20261103123508.3910990-1-sashal@kernel.org>
References: <202611022259.def3e086-lkp@intel.com>
 <20261103122647.GL1813469@noisy.programming.kicks-ass.net>
 <20261103123508.3910990-1-sashal@kernel.org>
Subject: Re: [linus:master] [atomic] 80047d84ee:
 WARNING:at_include/linux/instrumented.h:#__split_huge_pmd_locked
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 3, 2026, at 13:35, Sasha Levin wrote:
>
> I tried the typedef change. It works, but gcc ends up realigning the
> stack in a lot of pte/pmd code (126 more functions with Arnd's version
> in a small config, 204 with yours), including handle_mm_fault(). Just
> aligning the two locals seems simpler:

The question is how many of the other functions may be affected by the
same bug. I see a variation of the same code in vmemmap_split_pmd(),
and aligning the types is clearly the safer option here, especially
given that most 32-bit architectures already align u64 all the time
the same way that 64-bit ones do.

     Arnd
