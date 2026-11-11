Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407018;
	b=n7tqxSU/fxWhkn/olP2q8joiQiBh54P5rRpmHW+MykWwXxsqUvt6rmW8RY3eILM/c61y
	 kcw7ivXRQpC4iwUo6r8H5HMlN77myx0m2wjaoPryxlxQqx9yxm1qD105dqE1AylACf4gd
	 foeA3KoAQzpOEgmRA3pD3a8iqVuUX7Q7+udvZ7cxmz4cfaBisMN7rK92YZ81MYWQDI10m
	 Ez8lD1Lfe7ffjjm9nMasHgTnJnY3FoMyBS4i3uA0k/MQY55jwyp3FCTNloY6I71TrH9uU
	 +dUv6JBGmZT/zxnidHlmg1b2uwv0iXcHFxvXrV90fu8zajR3MIFDKw6udeZZGwrh5KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407018;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=mVYyTOtt69J8lU2ivCiLgRtKHwaJU/KTjBgZ9/I8rx0=;
	b=vsN2D84RW66H1MaZRyhgGaSu/Vv/Fe5uEYK9h1WhVDACHgRmY00OlEADriiqJMf/xZ20
	 fHVU5e1ASBaYqvQmrTZY85H/u9WBxNyBhDrZykRfmjW6OF0G4nMpLwgjtmYkVffJyUKZS
	 HWTNdfmsjOOfRE54wDcBhzZhLbqEbCLzS+dYYY/G9isl2r0qpquSxJ14XccRdMyTabPz7
	 PdtQ8KRsFK9g37j1n8q+DCTuXHVM+q5wpbfLam3fhFCcDj7zo91MDEAk2LoYroTHPe7Yr
	 ak8jbdaRcqma6fy9A5MtE7Jmp/a/+poIpDsyS89Q1T2tsYKNNMs9cUhryrX0sYoawEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=PDdJwcfZ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0VYKKyIe;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C51606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55C51606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=PDdJwcfZ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0VYKKyIe
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 87CEDEC05E0
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:23:37 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 11 Nov 2026 09:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794407014;
	 x=1794493414; bh=mVYyTOtt69J8lU2ivCiLgRtKHwaJU/KTjBgZ9/I8rx0=; b=
	PDdJwcfZhKzHc7uli3tMmQesPXSEBbDS6xVrdNCdKk1wvZrPHHf7VRwtlxYcaQHI
	7aqZlKutYOmhfj3IJ6K6Pn4O7DVN3PV5PCfcaWsXY9NW8Y/CJxB6pf88M2I/C7m+
	YmEvrEpBCVmrwYutYmHkr0I67Iu6RSOAB16OlgDuCi5ryJ8l1wh/fXeqcC53L09l
	ggCfd+vY1cV93L1JMlAMb6OTOMifqcURTc1TEowlm7B0DSOi0CqdBggicaSWaBvM
	e2Lhn98p42ahN7r/gJrqxbSk2b0lbO9QbVlPYi/VJJCGx0rJ9eYUVe5fYjfhHz1F
	7fZI13OLpUFA16a3sN6uzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794407014; x=
	1794493414; bh=mVYyTOtt69J8lU2ivCiLgRtKHwaJU/KTjBgZ9/I8rx0=; b=0
	VYKKyIe8ZqjZKDiutlAoQNqLh008YQNNUlYeio6z/Xqbsl6HCxCiBIFcTb3O1cTA
	RizPI2YbpaERyRr/bk3niaJrY13hCLgT8pLi1pWqpfm2LRmbVbJXA1YTB0n6kh7h
	gtSY8K5aD+xEWx+c65OO4aoZjaJw9I3C+/8XHadTr1h5wA03aK/bqnMVbBkkAlWZ
	kZwotA4fBmyQLCeUJDJ8TMXdiLFdqC3TX9CucZLbNzCxxbfgukUO+nFw+VBANMQL
	AiWQi1AT709lYgJhIVJKru0pwcM4WX32pO06nvnLwIGjionCzK0OYknIKJcmUjVP
	KBAf6ruEe0zlY2yk7dOQw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794407014; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Tn6sYpR09dpPPbb2osUAcWpMvqBP070xszhb70QWZq+eBw7
	PzkVggweSNA5yH4iH/xIT1Hr5G6EpZdS0G1zkmF1qw/t1BA1LxTcCogKJxjgOdbs
	UW+iwzCuYz/axFA4ZDmoTCWBhfI7IDsaBefBYFlUWUv+IyocEtO7OXElcXhDGtkz
	+LhZ9NRN2P9Jocot1libg7MQOIn9EcMZpZFIwKLyUu/EFgyVlcU11/8I2Jsg5dm6
	AbZqPebp4yQ2sACLOjb5pBFzXvkDTJbo4KQ/Zr34RsGdFWIO9oYkylt4muO+LQE0
	xcSWOWDQ6TAXk3yeHK9eqEC4MOp0tdV5PYFnyFw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:b1olmwb3baWkysaEA2zXCo6Mth4JpSdwo8I2lDTnVPw=:6qZslzsJBUY1FfA9JAn47viVVEMoUtz9tydHf/SeJz4=;
X-ME-Sender: <xms:ZHr0ajKaLSXUQXI9fewAL9PJwbZhFNpgdiz5iTCAWLQLmFuRLwn3Ww>
    <xme:ZHr0ah9nmioxu6Vvgh5AHmpMqzo6nzhjtHUphxuHBnXwLgIsk2ZlJe50oJu6OEdO_
    hQI8W0q9i74bRHH82H1t2RPKkBgQVeIZ44XoKN4v6U80fafXi7j6ew>
X-ME-Proxy-Cause: dmFkZTEiQuUJW4bONPxnchf9K06jrYXzC3831sBioJwMMGVT65FLPW2G2ZogSA/qIS45Iw
    DkPkhjVWsgBzSP2fQ4U41+xHlreMPUU9xEUpjQbEJVgEidyKJb6HgkAVKIW8kgEEA+SRAI
    1EFxVeG/zvgU3qeOXAI2EoMrmtF3OfzLgNf7Hd/2mTTNlpXwsAmsMFKV5oNULWfQkNPcg1
    ZkwOw/IBz85hYQyKJFJ/3SXEKZVta9K+O3nz1pqnTvtpDdZYN7BeolGooZSgyf7Ju/IUvm
    W9foaEveU51BDY7D/auUAQgB7j7ovdLdtEUd+m7jVCFbXUTp36ODpCXCx54ev3KpB34Sk+
    pUjtnQZJewabtUTCjAMpB308SbrCgIrdjfgwG/gdAFeyTr31b7IBg/hUyShr/hnW8G3Yyp
    x2d1gVtPPS1ET2nB3qNuqULdGufEzQ7h5Cc3rxxfsSZB7I29q0NS57n44+93NgXMLtleG7
    gBEYHXOnGnd50qCVJK13p/9ch5dDt6pVH0pqrKwv42dOXKMg9Vz9v0OeJvH2vGbDu/yKmd
    By/OojYL+sepNmE7ffcDlbEySuxfWyRv6MTIJsg+Kzjwg0Iz87OeYxsvPUN4XioTyCdn/m
    6Kz6y0eS3vLm29n6SMQuEzOiZDuDNsBnaGC1rzoZKmkjNJrjrArweuRFhu6g
X-ME-Proxy: <xmx:ZXr0ahsluX0ZJmAWCdIHXiP68xKk10FTE05ZT1JS7bgbCPDdrz0fXA>
    <xmx:ZXr0assS3XyTXdYbmtHK0ton-VqeYCU8nD6v9HJ6LNvXEQy04gohWw>
    <xmx:ZXr0anA-axEvKR0fo6R2j7F5m7H1IBNcJhzAFl67Mrh4B388T7uh-w>
    <xmx:ZXr0auOjsQJGOxhiuTI2cKeZAJYewXEoIZFLBHOEYfdm8HfghOqzCw>
    <xmx:Znr0amgHNqFu2TlPhJ5AK-95GEDv2ZVSYdKFyZbPhGejUcg_3AhmgZ-P>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 121FA32A0099; Wed, 11 Nov 2026 09:23:32 -0500 (EST)
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
X-ThreadId: AgpoH-kgjtug
Date: Wed, 11 Nov 2026 15:23:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jeffrey Bencteux" <jeff@bencteux.fr>
Cc: "Paul Moore" <paul@paul-moore.com>, "Eric Paris" <eparis@redhat.com>,
 audit@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <6f26e8fd-6198-4c2c-9702-3b7b8dc73f7c@app.fastmail.com>
In-Reply-To: <avRzKRB2f_dP-xEv@ultrabook.localdomain>
References: <20261111110200.30415-1-jeff@bencteux.fr>
 <e817126f-83b7-4450-a893-ac4e59460ae1@app.fastmail.com>
 <avRzKRB2f_dP-xEv@ultrabook.localdomain>
Subject: Re: [PATCH] audit: add missing syscalls to signal class
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 11, 2026, at 14:52, Jeffrey Bencteux wrote:
> On Wed, Nov 11, 2026 at 12:18:01PM +0100, Arnd Bergmann wrote:
>> Why the #ifdef checks? These should be available on all architectures.
>
> I included them as convention, should they be removed?

Not sure where the convention comes from, it just seemed
odd that you have the #ifdef checks for the newly added
entries but not the ones that are already in this file.

I had not checked the other files that have similar ones.

     Arnd
