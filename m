Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809762;
	b=PszMCllzPTXHdJpoSqdi/qJor6Hgam5Hrk0xzxQJMxEFl3ykFVxIU7rcH2jVUTurxyIS
	 tGwa3yy2/tHD1xUuqN9IMe7Yq8HTu6c7kvUAOCMYDZ9Ec36oj9UBhm6IG7sYzAmcpf/Gv
	 MB0hMTXVbIMExnZYWY0nyA54AheFGUn2rYjUhQxlLAclRayz9G+PgQTABaDUl31rl1nJl
	 Cm74DvttfeJNRqnvQ3q4AaiLowtf9oGJy7cLNdOjv4wgDocppxYjsFircD6H4QEB/t72r
	 gt2AguixDse+f2hwaLItuhLQzaZOBmaCfl+mZ0yEpmMS2tA6VyDyuPONt4bzTlcvMCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809762;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=LaiQAira6LJea59JkTCLBB0qD9u3ETiU1WU+A3oJQUE=;
	b=q2f5iOhMOFa18N+5AUPLxbfcXpS8XO+9n8SVL14oYMhdy9+oFrv0iZ5f12ymxz4ZZzRM
	 wPsQBSMNvKyZiGLNW05W7WF1rJZ6Z6j4Gc0SWxLqgHe+t61N2c3dnOj2+JrvPd/IsU4VC
	 SltM+GRCYFIQnuALQ+z/XKf0uAT+/WLL6Q//avCD6VNyWs9tXDCd5WOKVcglJKg9Yr//9
	 RVFcH6mok/6gfVvqyRvd+lOpYsQBUxXgwEhRl6jWNQU6AZGDpS98og49loOViHwjul54b
	 wclCrhIahjbeH9BzSmfrDosZq1QF3VjvHWoEpA11Xgid41YyFRmnipkTOzzyZQakQeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=c5jAQldw;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gNw6+e49;
	arc=none smtp.remote-ip=202.12.124.159
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E8A606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1E8A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=c5jAQldw;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gNw6+e49
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0BF027A0126
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:29:20 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 04 Nov 2026 11:29:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793809754;
	 x=1793896154; bh=LaiQAira6LJea59JkTCLBB0qD9u3ETiU1WU+A3oJQUE=; b=
	c5jAQldwwgfNnO5PGIb2SVCvwCRVrFn0AlzKunbwhvs1uypMH3RhKhsfp6lsD7vh
	2bqcD+fRJ6Ro3ct1cv8aIHCwflXsZFuf6ieUiT03qy5NBel1NZmPUPzPK0IzAzRh
	RiwW8q+X7tly4os1ahAaRhabUajpsrZPek80Los65hailxoxHZDO1CubmR5wOZFV
	vdsHaH9jdnVw6SmQCiFZRsBnuJFKnnsV4/egmTrrmUJYPXp3YupKcXYdBvyDb98Z
	n3oNyIvmA945r0eraN7VFXYuvbAwhHGwMf08fEJpOzuBSomjhk1Wd6ZzYhBuOuPA
	Dq848O8cOxZdxov4Hx0X/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793809754; x=
	1793896154; bh=LaiQAira6LJea59JkTCLBB0qD9u3ETiU1WU+A3oJQUE=; b=g
	Nw6+e49H9+mGLS37jkQ9yV2KqwmOO0TtosTC9yMm3VJQvCxVnyBB1P/fKSrz0S5X
	19DAs/+K2r1is0sDqBvE7ef/xFLwloc4lJCd+mJvaG4G7bCjX808ntks3lIk6ROc
	cJ+IlCuQd+SOZN5EyxA/thcnWtLLGPuaNmorrUUj3OTK0hWCWwexkm62WE/CZw9u
	lI21eAp88Zd/5XWnnLV3MLHwk3QtPPEtSmRmsE+e/LmGBpgvArx1lNs1yDPBd06o
	vUxRdl1VN2SMGnh4cChp/LFjH+B8rbgYFfWrUChSH3xou4PZ3BAtzvZBjHPZCIOn
	NxiSAVVXwewsxMfxezD1Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793809754; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Xqd3X/8PIWQX19j3tpwYDURhpNgy14HbJAON3QMVbtce3eY
	TQZCdzWrbThBVMVpiHgfk26BgU/2YMM1SGtfRakuRB3341XU2I3FI+QPVKyCUfz3
	OSpVlbg07G8bSz8lSei0g4IuYBmAAB//mOPpmTnCMDjMkbMH0MLIlvrBcqH1+D/B
	23rcljRbjpBdkZgl+iJqJvtkXbYD6jpC2/5a0nKS854FJajQkVkma5whuMP1f6M+
	qQ/tyqeHYvqC5nguiYu3jrj8xV/YAxP9ybazsdVu28ixEmJlOGHabp4Rop+ROmYr
	wdu0dmoQvsNTLXwSjf8diCv4PACYOi2h70kFgNw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:EL3Gd2i3YhMp0vFuwH/WrQYooSA5VSKcuTfRIbM04wM=:LaiQAira6LJea59JkTCLBB0qD9u3ETiU1WU+A3oJQUE=;
X-ME-Sender: <xms:Vl3ranwSd_CykXkfKt_DisDilg4d5ENtLvR5s923aJuWzflU5eJaxA>
    <xme:Vl3raqEaLcs3p0xIklBe_kdOatnAVtJBGfzdGDeXfP-4l2039sFGhGyJj6LSkF8Ar
    2hbuMLLOjdHgZVIybpvYYx09UOO7Zb-Wved_JG7Sv2wsBzAtihg_es>
X-ME-Proxy-Cause: dmFkZTFH3IypNSuXYh3Kd74bqwW9a3lD7bkOwTRBwylmNrIwAT/Vx39h5sxOyk8YBaSEZz
    xzvHXAYiNUdZ462ifvJfTSJqf91mHwxbEpFrPXMj1SHnj4aDidHBfYvmdBRdhvh0/PF8qX
    +FGCYX+gKEh7CGDLNwxbtVgwqJruBNp8XHMf+TMZGOQne8JrvnwZCetPfQkOD5+EGGoMVB
    i5t9gZhjOBTBFO3jzM8Vekg6mA6KqIVFvH06ObjWAQ81Jf3Ti57IDye2cEHmj7kEXzUqyA
    /4QFAKLHp3mu+XBx8EG5H5mAbNWXF4jgXOdqGLBP4+Wv/YNfC1572fnWbAFvBi43/YU5NM
    7IIUxNxdMAWVIpotu+ptvwKET/+uHDJd71bv8K0TDpMF7vB/gyGDH1Rq5PKPMlYahzd6Jb
    u0CDbP6TmvPeo92Q3pkO2fYYBFLcS69KkVaI8LXslUr+jvc+dJcvZ7P5LRrVsgrbtcNq0Y
    700mxh+Zf7ZTNCsLuo6G5Uc5HTPFtCd24BG6Z1RMx1XI4arIvyWVRvPHj3nBjWEjgwBw7t
    1nF1eR86yNI65ea9glVmwA+tAdRWS5n4iwRaurZurrVmqqsATLEtljzUfKkQCWuL2O8Kro
    qef1ZgLBCxyqSnae30OfExhtiQHgC7DUjo7i8BECYPzKdp4Cfomn1bTx5hng
X-ME-Proxy: <xmx:WF3ravNYn0pPMBtNVZ2bgjPadk6SgfgsM1kYdJ-IZ2KlPBkEu4C1QA>
    <xmx:WF3ranWahz3oPRDUywFK761jpK9YNubOerF7kYQCFpjlvNFlXgH8eA>
    <xmx:WF3ranzyz6N30adHDEAyUTUYxaqtaXtG_VMEf99hlyORLZgnTCmvaw>
    <xmx:WF3rau9oMC-j4FQHSfUNHyNNuvuvWuQ11Qj3eJHgHLLBTfQVHHZo4Q>
    <xmx:Wl3rakdMjb9ALM8TzZT31cm7vg5FWCxysTNlakVIHZfPzQ9xYXHB_LWq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 848EE32A0093; Wed,  4 Nov 2026 11:29:10 -0500 (EST)
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
X-ThreadId: AgP3mv5Dxly7
Date: Wed, 04 Nov 2026 17:28:50 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thorsten Blum" <blum@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Pasha Tatashin" <pasha.tatashin@soleen.com>,
 "Pratyush Yadav" <pratyush@kernel.org>, "Alexander Graf" <graf@amazon.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Changyuan Lyu" <changyuanl@google.com>
Cc: kexec@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Message-Id: <be6ee9f8-ae2b-437c-aa04-0390954f9adc@app.fastmail.com>
In-Reply-To: <20261104162352.140836-3-blum@kernel.org>
References: <20261104162352.140836-3-blum@kernel.org>
Subject: Re: [PATCH v2] kho: Remove redundant 0x prefixes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 4, 2026, at 17:23, Thorsten Blum wrote:
> The %pa format specifier already includes the 0x prefix. Remove the
> redundant prefixes to avoid printing 0x0x.
>
> Use phys_addr_t for size to match the expected type.
>
> Fixes: c609c144b0e8 ("kexec: add KHO parsing support")
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
