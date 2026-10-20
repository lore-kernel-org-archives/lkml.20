Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792521425;
	b=vcYRVgvpwC8GY8qHsBZ/DMYen/OPlSmopfD9VSp1YIq0gPZBYs4B7rv4IP3d1qd51bhA
	 bxWorcp+VgTVV7XCDFhgVPOS2BsJH6ziTWn+ZE38msnghzsTGZHMupfkuuu0Sd/wIq00V
	 oivTspOw4gsyNBY29YOm7S9Cc0JH9Cgq7v6I29gGYGckfcBkqruYYZglX/wcwHlAuGz/Y
	 HzDaUzeJvQ0e1zxCLVVXOZKbSoJrE1naWN4bEHu71V1n+WTvQP5eThz0JM0ucU6GnkbFV
	 DNzq3TDoHTIZKD2cnns5JdUsTUcuFl58if+Gc2tzMAUn590m/u2QzR5PsHkZD+VKHcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792521425;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 User-Agent:MIME-Version:Content-Type;
	bh=Xk97U5KKr9uT2wGVlkJMzD5zV/qzXLcGQzuyBrZTy64=;
	b=YB13RMQEjEO04/iT+WBV1MoTCDs3AmXW5KZ/JuruaELw77nJe4TKQztYu9mZRcItOavM
	 aQK4t3c3TH9OWf1njc2qTUIJ3e3YU+n1JkWcovak6lGSHR/skBJzk1kDDqoKIT6VFoL/T
	 EfOGy6dTwlHkbKcYUk6+p/S6bW2uVqckYg8iSpdTq5fcPVUspv0cPb0sfC409W6X6xsfk
	 K7EbBPdvgrC/SInR1rBy0wKjOfoHrrdMvS4NmRKPb+Wj8J+rtEaYQYvG09NldD12dVk/7
	 TS3vDWzsn+ZUw1Qp8pHw/USQV+CBP2O6NvpO/dP30Tk6KmgC21Mp0BsqsdU0itCdakA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pobox.com;
	spf=pass smtp.mailfrom=pobox.com;
	dkim=pass header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm1 header.b=LLTGl4te;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="s2g37/qH";
	arc=none smtp.remote-ip=103.168.172.144
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401C7606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 401C7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pobox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pobox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm1 header.b=LLTGl4te;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=s2g37/qH
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 77F0BEC01BF
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:37:04 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-02.internal (MEProxy); Tue, 20 Oct 2026 14:37:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1792521424; x=1792607824; bh=Xk97U5KKr9
	uT2wGVlkJMzD5zV/qzXLcGQzuyBrZTy64=; b=LLTGl4teA5x8cNENGHYfr+cGNn
	x6N3fx9/1QSvsOSx9ztEXiWTwfG/85rQ1YcUbkycTJLnYC4C3RZt/Z509PkpljA5
	JfFFv/L6jpo+P4FbjQa3BYRYWS4yfy3uMjoYZ/0/rKaKbBfwMkwNuKpR0r3IkHK/
	qeIFkfmnk2TlX1+u1gFgwQW7b7DeQlB6jyyvmbRmbIhTxHwe9qeOfddpdMfqrMP/
	zUvYnPbzWrsTKTA5vChjAMGhdLb/FNR9iHOPwzUGldCSYnG0MvD8vVDwqZBV7cwN
	z1WF/B6ud07JIgaHIEp7pWn0FwqXV2Kcf0v85IBvp9focUA4+ptYoNvpccjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792521424; x=1792607824; bh=Xk97U5KKr9uT2wGVlkJMzD5zV/qzXLcGQzu
	yBrZTy64=; b=s2g37/qHM7+0g1Ei+Dnhv2jKDPTX9Uhqcpq5K0LwtuAK7jpXyce
	I70MsT1jQYPAYQW52wIHQ9p3u6N/rZe6x5YXpyUHTJA7Y+MGYwPwzF3z4An9qyNp
	Ge9S850BcYsbnb9FC9k6dvYCe61o2WOTuMNaV6CrL9JaVF0MMfqQoqk7MEwaU6tX
	obYuPU28PcgrMv82efdEt4URI4cZSIxXIe2FQ9OrMr8CpR3jmRAUa0d+WFDpFtck
	6s9h6GB0nBJV3bak+bTghfOvU8EkK0eXWFEF1uaRLR+PpApYNB2CryZuJiQaKrK4
	zQFlfjy/i8sLOP7PMNEdjOqZoJcAt/D7DvA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=pobox.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792521424; d=pobox.com;
	mf=PGdpdHN0ZXJAcG9ib3guY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:aVUWGeSPfmi6hUR8/J07LECwRamEmb7blBzJ71Mvaf1dMOB
	7U5yzaX/02TujG6pPZqCWt2op7A6ay25gKuJBYVwsLg0+EaAvkx16li8w0Obc6MK
	VfpO2n+GqDAX93BCVN35olRk2963Ic5Aec0mkPsK1qq0r/lUtVNvOlZmRMIpo9SJ
	3WrHMCSw7aVZd1/NIBcw/3yoz6/dcoaqKK7us5Ip8wy3tzcmRInoN7U6WPPRRwqq
	JGJw6DOQEvMCokF9cJSV5VgHrnu9tvwDs6qOZPR9x+jUwjeVgKbpi1LGAJCR/cr6
	H/ofmfDYH4CxHoZ07dzefVuvqI5+5XZiFrsAHmg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:qSyeHOcuEn8uaqs3aepQ+orwsjIz75rjI4vMfAyNabc=:ckcNN+M9E363QiM9yS58/K5MUSml3LoDrCv0Zallm5w=;
X-ME-Sender: <xms:z7TXaq0cROy1WVLL9ym1OYaSQmRQE6FBNLRJiHKDUzSwAxJDuS239A>
    <xme:z7TXamYTLSRnsoBNfmIvW7l11qWu99Q1svFyZDNy6EU0TBbiTDoNrvGgrj9fgieYG
    OCZoq2Td5rcI0lPlbbIyfh3T3vL-y6UJBviU2Uxhjt1Q3dvTUoAsSL5>
X-ME-Received: <xmr:z7TXaqK1HKPASoNwuhlxHm6uacvs_x8DKf3FagXPyfzC6D9Aw57NkzrR85wdrI2cz7k4Esdt_736uUt9a5SWmpnuHH5x7PfnJi22>
X-ME-Proxy-Cause: dmFkZTENpwGJFmMc1CaYH0vt2Z8+AIIVPE3R1cazOcMtGJIprDOjGDUmTjCfchiu8XpH+U
    gCeKJvguI9mTxSRKImLw5VTPGzXBcn8CudhkNF+HoUKe8tLuBfYYgzMr82AoDM4qKIPIHN
    yJxWJWNWhv27Hg9Gf2e/c/QB+AMeIXK4ArGa8o1ioFfetSzARIRTcqkZ4UZOAyA5qOSnao
    LBwoMaVv3txsk+jPw4c+d/QKy57eMHG2tqBFA9dy5TMJf/tGorbNCeyY6IaQLASZVL4b7N
    tN5hA90V4+MC19L341SxhxDOSsgdSyLomb3RrYxB7SWIK9fmU9TXpGbXvkl5xOu0GgmNFI
    b8XGYxd+dPG+4/yhnzfnXYYsAx1ayLv7z3dWmEhrNPC9pIbAJHSmRbGXjMAmR8iDk64D8p
    JMac7KrceXAPWfcqM2sRhxegPEpK7hWk9aDlozK4vp90Ms3eL1eQhP2fBMMltypNCJXgcR
    cm+t2Z0i7iqWXC7HEUaHhROUvAnMWvXXDSuMHQRm5Rs9Gg8EDt0eUL2TgzUzDPPCEEInmg
    VuwknMWCNTzkBMyys1r6Bk48lDk1NyLTuwCdzUihjNUpvABYZLOMogmmNxbdrmmqKuP7ji
    jVe7sLlhqXNbGpSVRD+uA7NxYcTRbkc/i+z6ERSc0a/C7K1yZ/rdSO2lGF2A
X-ME-Proxy: <xmx:z7TXatEA8bo8a_bHBrOuf_g6MPfOht9EmhVXdVY1Rg1GoRpuGxsjLQ>
    <xmx:z7TXapuVDSzAmpes1DBrJVus9MR5UhFMGj3TYSeZU-YM3XRskKqLXQ>
    <xmx:z7TXakv540nUJR3xrl_-dcde6jAWwUUFyTW8FcDd75USQvwjhFt5mA>
    <xmx:z7TXavBicg7t_fruGgYLxTrzr2SX88pzqE2OMnyFMEQnvMBAeD-ONg>
    <xmx:0LTXahJ70rrjicdiCkb2Zv3Y8XN-eB4nmPLltef1ctDK7C4tDhzCt4R->
Feedback-ID: if26b431b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Oct 2026 14:37:03 -0400 (EDT)
From: Junio C Hamano <gitster@pobox.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: git@vger.kernel.org,  LKML <linux-kernel@vger.kernel.org>,  Jonas
 Rebmann <kernel@schlaraffenlan.de>,  =?utf-8?Q?Ricardo_B=2E_Marli=C3=A8re?=
 =?utf-8?Q?_=28SUSE=29?=
 <ricardo@marliere.net>
Subject: Re: FYI, git output messages are being used by other tooling
In-Reply-To: <20261020141011.0015d172@gandalf.local.home> (Steven Rostedt's
	message of "Tue, 20 Oct 2026 14:10:11 -0400")
References: <20261020141011.0015d172@gandalf.local.home>
Date: Tue, 20 Oct 2026 11:37:01 -0700
Message-ID: <xmqq8q3sw75e.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Steven Rostedt <rostedt@goodmis.org> writes:

> Hi,
>
> I just want to let you folks know that ktest.pl (tools/testing/ktest/ in
> the Linux kernel repository) parses the output of git to display the first
> bad commit found in an automated git bisect.
>
> The output was recently updated via: 0c0f93e7fa64 ("bisect: print bisect
> terms in single quotes") which made ktest.pl fail to find the bad commit.
>
> The change is being addressed:
>
>   https://lore.kernel.org/all/20261009-ktest-git-bisect-v1-1-1d1428f6cbf4@marliere.net/
>
> But I figured it would be good for you to know about this dependency.

Shouldn't the script instead seeing "git show bisect/bad" instead?
