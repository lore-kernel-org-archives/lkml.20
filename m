Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=144.76.212.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622073;
	b=XM8wfT6U5f8U5jVw3ydEk1tUOGWLF8VlrvBmkB59ZfLGrnUjl25nfGBwrqmb67i3Js8Q
	 KSeDm5Yp87d0+V4CeusRo49dIx/nfh6DJ96D8piaH31nHeGt/a8E8NpmOcEIr0Ythqgpo
	 ldUPY2QFUXINky3Ry5sTnGy373xkJBfjgQIBJn3RhkKY9YSfsqqp/oOmHFVfllejSd8Wr
	 OQo+QPU0GRU1ZuYFglp3QRxSmr9+TN3ZelfVKvX046S5ITfCpOlPG3S2VPKiX54Ku8sjJ
	 nvGtLGsm4sMTWsdGMfB6lp/XihvfKRoxAB0Vm88d+Bz1gtH5xKcZQUpsE3+tzzUU52A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622073;
	h=Received:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:User-Agent:MIME-Version:Content-Type;
	bh=lpKUUUpovIMKNtY9owW9/5d8q3ENccdre39ztPeTxwc=;
	b=qeXfxoFAMuITXfTgLw7jkaCOH+Jps2/GlUA21UZwfvxp5mR1JybYBJ0Al4yq1cUFNAqF
	 OMthdoai1BKGufOA8lpqB2fehGjCsu8bWdnBcIx8FvfRvb6aktW8aXpCoC0Cbyl0vuT/h
	 L3ilyQJW9vTzYrRxL2uFJ1KXGJ5m9JxlOp2LzLjpswLaLMgTYA1hmlfU/eH8qWyrnDS8F
	 NawuZpWYYz0AVkXbmNm8917oRux6pNayvu/UeVjXQr9lcjBkYIKfLqpUJNr7sXYKZYbgX
	 oextXdzEk4c/UfRI8GrKlSrBKdXe8X9I141C9VbwLTwsnY2Q/wSLnungikex8HxVmrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=inai.de;
	spf=pass smtp.mailfrom=inai.de;
	arc=none smtp.remote-ip=144.76.212.145
Received: from a3.inai.de (a3.inai.de [144.76.212.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EE1606A33A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inai.de
Received: by a3.inai.de (Postfix, from userid 25121)
	id 4903A1003FFCF4; Mon, 02 Nov 2026 13:21:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by a3.inai.de (Postfix) with ESMTP id 48C5A11094FD7F;
	Mon, 02 Nov 2026 13:21:04 +0100 (CET)
Date: Mon, 2 Nov 2026 13:21:04 +0100 (CET)
From: Jan Engelhardt <ej@inai.de>
To: "Paul E. McKenney" <paulmck@kernel.org>
cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, 
    kernel-team@meta.com, Bradley Morgan <brads@mainlining.org>, 
    Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] Add two-byte cmpxchg emulation function for v7.4
In-Reply-To: <6f24126a-7f84-40f8-a297-095b470beb8b@paulmck-laptop>
Message-ID: <qnrr9sr7-19rq-6rp9-0oq9-5939r07no828@vanv.qr>
References: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop> <4p5316or-75o2-s068-74s3-6q5011o75672@vanv.qr> <6f24126a-7f84-40f8-a297-095b470beb8b@paulmck-laptop>
User-Agent: Alpine 2.26 (LSU 649 2022-06-02)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Friday 2026-10-23 18:12, Paul E. McKenney wrote:
>> >
>> >Add emulation of two-byte cmpxchg()
>> >
>> >These commits add a cmpxchg_emu_u16() function that emulates two-byte
>> >cmpxchg() in terms of four-byte cmpxchg() [...] 
>> >namely sh, arc, csky, and xtensa.
>> >
>> >There is reason to believe that these systems will soon no longer be
>> >supported by Linux.
>> 
>> riscv64 also only has two exchange operations 
>> (lr.w.aqrl/lr.d.aqrl/sc.w.rl/sc.d.rl). 
>> (atomic_compare_exchange_strong with uint8/16_t, in userspace, gets 
>> replaced by the compiler to a lot more instructions thanks to 
>> implied -finline-atomics.)
>> 
>> Are you saying riscv64 is going to go unsupported too? ;-)
>
>Given that the compiler can make it work in userspace, then the riscv64
>architecture-specific code should be able to make it work in the Linux
>kernel.  At which point there is absolutely no reason that Linux-kernel
>support for riscv64 should be dropped.
>
>Or am I missing something here?

I can get gcc-17.0.0-20261102 with no further command line options
to turn `atomic_compare_exchange_strong`+uint16 into some object code
that does not contain a call to libatomic, for sh2, sh3, sh4. Haven't 
tried xtensa or the others.
Thus, is the patch really needed?
