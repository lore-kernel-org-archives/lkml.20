Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863384;
	b=ZLNDp8Pd7br1SCcSS2fbhQ8IW/Ty+Pdl6AK2JK2V0uvTER+OfwgC89GGloiSwuVzMxlY
	 Xni2QvoZE1GP8tPFErW3zoe2/dQvMZuHdxQpbyp3SFDo2G2nxZNvWJhWy9fDNYSplD29u
	 AQ1WaSw+gEHa2sTeZnf8Utbu2Q0/iquMK34CRKbHk5A5dQnu48oN2IelawYQrRIhBGztx
	 fMrmtBH3FDZQtegU7uMEMkwF2UplqCq6QQr9dG7R+PvMhgirqSMWbTtFi3zMjzgo8hPPj
	 ZRB6egNH815Am7WREk+h1ZOiwg8Ex8Va9TBvStZL43LvnklUbHs/L9ZnmTusZLfuTOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863384;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=nlzV/T1+kNEjEFIFUrdQ9whiVlNAZWM3sYOailS0+l4=;
	b=Ue+RknE0QfMB9geZW8/IJDHkz3yIQd0VQAXX3PllJTryddclNjdxm4AawVhGlfApIBJZ
	 UmJaEV92SyfRUYPLavQMFaBqx0b514R25PKO2ZQN6rgKXUwxBhBd1LQeGAOz3pHjfbHnW
	 sm8A3hixRJZR2s+tfY/QKUOnVkRUMahgbrpa1VchHPawXcxuBOB3LCxtjHW07t4ZnJ9Pu
	 HpNXYmeUk+7JmKlh0T9p4Jq2aF3Cr5tprQzqgQrktGN9Ll/1f6xPPIsQTIiMFrwkw7AuU
	 OB6GPSNQ8Z3ruS7YiBaCQP7IXSWUMqhSFpflyMFQEm+tJUbHL3UO83QthOLQKmagiAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=iU6sP2On;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hsbZUk0Z;
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F1B606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92F1B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=iU6sP2On;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hsbZUk0Z
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 88B1E7A0158
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:23:02 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 05 Nov 2026 02:23:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793863380;
	 x=1793949780; bh=nlzV/T1+kNEjEFIFUrdQ9whiVlNAZWM3sYOailS0+l4=; b=
	iU6sP2OniQvMJSDet+76nTu28CAWieRv9m10+oLO+NnYNs0xW76iWRFi/NGBTItX
	usC6s0MAjUB4DIrLFfX4dzbwzyH9wsdj7I7laCSKCgmGZWf09Mi/4bRel48ucr2P
	svbbMcZG9CilgFgkAn0ifKcw0kQu9Fz+uIFqEXw8UWFXY/6h/ZKWT5hifmLKx2WX
	qqaM+XgUSy/S1aonpog/fqkAujrUcpaSbIw1jIkrfA45cnXE45buQsn9I3Gb8dUc
	7YYrjWvYVUXdz7DbZnu9ETZch7UTy3fmPF0udGy6LL4nwPLtElyqzZxmjzKENTOB
	e3n/zrr9u7wk8TByySbKlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793863380; x=
	1793949780; bh=nlzV/T1+kNEjEFIFUrdQ9whiVlNAZWM3sYOailS0+l4=; b=h
	sbZUk0Z6BygSEO+2Dss9tFe5o1OqudoqJDGx7dM0e8zw7uwXk+iZGEtv8Uk2yc4T
	vDQmOaEzob1pfFAJOwLvH5bQkrimf5xoap8acpaiKFvlYUbtyOjUQYMkRcx7lI5+
	f9hZlbh1wJ40LolJ/hO7iDpZzhFrHsf2l2C8v0ugVow8Ge501bJfHIeN47VKGe1o
	Tq62Z5wlxIu8CeSM/p5fF4b5Yu4kDj8TyhjthxVCCadsVxK5dS6IG/Sug1T8n9wf
	ms6NRSh38JmG/1IbRouEztN0b+yfhzbedCdkknisz22LS0YjhhwJ6pwfIq0JuvCL
	z2r5XuFoE75T4T2KGoa1g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793863380; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:iehJCcfwTxBoKpnmevM3GpEUq4JOIcwZLYRZQ/fQehB/eFh
	g67PVZtD15aqWSFac+HhwCbM4cu9IISR7HNzqZsZrD6V/lGUMuAn6KQ+Y83q5pno
	R0li4nHc4g7LGJAdgI/95VlPac0cKNxffax9doi+aC+IcN0htTAV7dDSH+HD8WNc
	3MFX0+VzdZGrTt33+DYCnrb6yKwaROKYdXLDpr9woxqEbSzFbqlj3jO9n74SXWT5
	P0BOT+yPM8MPnS6VgR4PXuUSzRqUQJxx6NR8reYqis9ojbwufROGDMmOjVYQ0HAO
	V/v+VyUnHcnyihBHjfChkvNHyz7KE/EMpFy8v/g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:JTajM3dgP7b3g4KAmVX6kADouDC0AgT62Laj7XB867Q=:AAvCzUi9DWgVZLej+wjYOUv4KTW7nBn0O/xGljQIGBk=;
X-ME-Sender: <xms:0i7sarWD4iZDKWENMBNxQHDf09fk8z82B_drQDuG2ZhCC498aY1NUw>
    <xme:0i7sauaFMU2AOgiQ9HRy-1v_ztiLKNVK09YLVw3zKxcwmSZYORASonckQimIQi9Av
    sfMvweggcjOgQdKdPg3VWbDSJMOVoaK3X-e5Z79c1RLeWqewUH0DM4C>
X-ME-Proxy-Cause: dmFkZTGzKVMFuGiWRjjCfF19bfEAOLSpgn/1hH/5n/yeUY7niX1m2QJU6zUwZCXylqyLQi
    bXJm5QG0MuQwRLEtqmxiXq2N0ugqyx6k4knQz/Tg3QCZpRy8qO4NoWnGD2v6bP8T5TI8B7
    vvtslBQkU+xnn4xj4CYZi0Oksd3f+RnGGoIVb2kd80n4plhiuPM+7+R1oHGrpBT+IbPlIQ
    1ECCR11PfcW0Fzc+LS/97QKKzRuiCAfOSXLmvIPrWtJLXeVhlREkKQvI+mkfJdp0GecRso
    j75mVyDCcxbtxH+6CP95L4FqmQrZpkw3IhUW5jT150oUXd+c5YTfr0U/YdcZGxhKO1Omar
    ImZzQAOnVNAWohCJTIUGz1NaMEB33N/pKoSYYL5LHW4lkPTBxawmx5xtXGw5YjNuzXBF8d
    +hamkXkTdThkkQBJ7baggXC4tmXNBWrbUzq+dTmglYXr8E67vqvlCQT80fX4ET9/dy21rD
    Xh2HoUt7de3npemxBn2Ggkdwrl+gXuHProVKenaLEXNMqkWliU9tv8nuiWSJEWIbhJIAJf
    /dmQP9cJdeST9abv/ub89ThRbHmmuZ/IdZiY6bmtN5ohMSeJbPSq74xo/TqJooWnv4oW76
    xnGyKkeDsCcNBCV7Ndk7tL14S5aqxP+QLx3tu//z0iH0U/F2J0dwzesCsfdA
X-ME-Proxy: <xmx:0y7saq6D-A-Le_rxGCgdCc6gHl-gLyAk9eTaoKQ-H0pLFO6ISZh_9A>
    <xmx:0y7sakDmF2YQmo9_ZWpIbnJtPak9h8qr372sYBcBKB-nRLGnHnOL1A>
    <xmx:0y7sahaT3SE6cs8kCJmx34XN0X-TX_NNhNpCy4cNX0gmRlgL5zvt5A>
    <xmx:0y7savYk9IylE8qotDpxzZG3P79D1v0HDAmq1FQc8DM1JOx02iuI0Q>
    <xmx:1C7saoub4Xq0_9J2jPRD_xoVR1pihTVwovDZ0tkr47UQLSPAwUdymc-r>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2504732A0099; Thu,  5 Nov 2026 02:22:58 -0500 (EST)
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
X-ThreadId: A0YankKnQQSw
Date: Thu, 05 Nov 2026 08:22:37 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vineet Gupta" <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Message-Id: <f168326f-37b1-4ed3-ade7-c32b2f9c53d3@app.fastmail.com>
In-Reply-To: <41b9058f-ce78-425a-a6ef-cba02bda76d3@kernel.org>
References: <20261104043535.2039948-1-vgupta@kernel.org>
 <20261104043535.2039948-3-vgupta@kernel.org>
 <6534a171-9e74-4e69-bee2-3a499798cffa@app.fastmail.com>
 <41b9058f-ce78-425a-a6ef-cba02bda76d3@kernel.org>
Subject: Re: [PATCH 2/2] ARC: io: use asm-generic MMIO accessors
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 5, 2026, at 03:57, Vineet Gupta wrote:
> On 11/3/26 23:40, Arnd Bergmann wrote:
>> On Wed, Nov 4, 2026, at 05:35, Vineet Gupta wrote:
>>> Two things stay ARC-specific:
>>>
>>> - The barriers, now hooked into the generic accessors through
>>>    __io_ar()/__io_bw(). On ARCv2 they remain dmb (rmb()/wmb()).
>>>    On ARCompact they were empty, relying on the asm "memory" clobber
>>>    as a compiler barrier, so make them barrier() explicitly.
>>>    The generic defaults would be mb(), i.e. the heavyweight SYNC.
>>>    The *_relaxed() accessors only need ordering against other MMIO
>>>    accesses, which volatile guarantees.
>> Sounds good.
>>
>>> - The {read,write}s{b,w,l}() string helpers, which, unlike the generic
>>>    ones, cope with an unaligned memory buffer. They are defined before
>>>    asm-generic/io.h is included, as it calls them (e.g. ioread8_rep()),
>>>    so they do the volatile access directly rather than via __raw_*().
>> I don't think we want a custom version here. Do you know the reason this
>> tries to handle unaligned buffers? If there are drivers that require it,
>> we can change the generic implementation to be more like the arc version,
>> otherwise this likely just causes larger object code for all users that
>> don't ever need unaligned access.
>
> Not specifically but one of my old notes mentions a driver calling 
> readsl as follows:
>
> static void dw_i3c_master_read_rx_fifo(struct dw_i3c_master *master,
>        u8 *bytes, int nbytes)
> {
>    readsl(master->regs + RX_TX_DATA_PORT, bytes, nbytes / 4);
>    if (nbytes & 3) {
>     u32 tmp;
>
>     readsl(master->regs + RX_TX_DATA_PORT, &tmp, 1);
>     memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
>    }
> }

Indeed, that one looks like a legitimate use of readsl() that
is likely to be affected. Can you send a patch to fix the
asm-generic implementation and use that then?

We have also debated previously whether there should be
barriers before and after readsl()/writesl() and have so
far decided not have barriers against DMA here.

> And with readsl at the time being as following was broken due to the 
> recast to int.
>
> static inline void readsl(const volatile void __iomem *addr, void *buffer,
> 			  unsigned int count)
> {
> 	if (count) {
> 		u32 *buf = buffer;
>
> 		do {
> 			u32 x = __raw_readl(addr);
> 			*buf++ = x;
> 		} while (--count);
> 	}
> }

I think we want something like

       if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) || !is_aligned) {
 		do {
 			u32 x = __raw_readl(addr);
 			put_unaligned(buf++, x);
 		} while (--count);
       } else {
 		do {
 			u32 x = __raw_readl(addr);
 			*buf++ = x;
 		} while (--count);
       }

I.e. use the put_unaligned() unconditionally on architectures
where this is fast and treat the 'is_aligned' check as an
optimization for architectures where aligned buffers can be
accessed faster. (dereferencing an unaligned word without
put_unaligned() on architectures where this is fast tends
to work as well, but is technically still undefined behavior
and may cause the compiler to misbehave).

The coding style for include/asm-generic is to spell out each
copy (2/4/8 byte) rather than use macros to generate them.

      Arnd
