Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793847444;
	b=BGWuQQl2AL+Zyu06oinGWlIQImPdi7ocv/VUalzSqckAc9cYHA1WvDnnJy8Sk9b+/Em2
	 VSD8HJSICnO2MTC+BmgFgGk2mg3+0x+ooXxROQ9vR62Y2FGg0kPoo8SyyCXmG40Ky/gBs
	 m4K+VF0q82G05ZBcVwifNjxy8IwxHd2dUtfizF00N2LL8hWnTCBtPtcMAINZFhWzGrw1Z
	 EOrsbTpqSgooluNKrqRQmrV+k7hgn5Sy+HqipTAUrOy5kthztgsqKLsGvizmRlN1oxDQT
	 wgts2qWE2iLuOeexW9gAz8iRdkZ/fXtutl3eHzjkqAs26okhAXcQvI1xjsRW1z5C0RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793847444;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=yi5pnfb5AXE+YjDZddXWKzl9WSyDPIx6cK+vPTAPQ50=;
	b=SQAq0TDUuyzSzhFZcElQj47fwnmO5IC59f1bTjVuQjk1+b4T7ubwFJdGx8eK09ewfCdf
	 Q+uE1CnsO9BGDhawTy7pKM8EfpSNVUDPDiAHiLEvkZNk7/iTaipy9thQncJLEhdPp7RaJ
	 sq1hU33jYfcmjOG39aBNmo2YHJCqSN+v619aPG183qyodSo4avEJzHXZCo4wnrMfILIUg
	 y3Ge7tD4dLj1kLVAdUrVEmp23HkNme/uTZ5fA2bqY4UNc18fJ+ZYjirwRvq+ELbL6v4uw
	 OOLX3o+cE6qxJSZvzWJ9zO0mgJvDVMThpT3Ae3H21lWOqXFBCS5Lae2pS2tuUwRaoPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ght8HFf+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFEF606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ght8HFf+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65AEC1F00A16;
	Thu,  5 Nov 2026 02:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793847443;
	bh=yi5pnfb5AXE+YjDZddXWKzl9WSyDPIx6cK+vPTAPQ50=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Ght8HFf+vpPTxaO/GvNStRwQJNNYnccd84qhTyXWGJiUSFkBEERF8RST3pAGebzSt
	 Rp4j10CTKlvkTPHydzZcKSyOwmDXJkuMWW9eY69EdTUfpf/i235A9jcQ3fzIT5Uf8w
	 R1SAKZvvIdLMBHiGoVGLVBze5O2j0FLj3phaYND4HEAKogqlGkTW1xJQIP9D/OrgH5
	 XnYAYts3vstbs4lSQZ8vW7JEdj/m/zVB4D3MhCLtrkklFeFiHa5FC023flq3jYYYIY
	 krn8du0DML9Sk8cnxQFl0N+SYr7HX3ZiyH0Hqrk2Wm/Uvwz4+493HSyfgGkeoP0FaB
	 dN73d83ax0MWQ==
Message-ID: <41b9058f-ce78-425a-a6ef-cba02bda76d3@kernel.org>
Date: Wed, 4 Nov 2026 18:57:22 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARC: io: use asm-generic MMIO accessors
To: Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20261104043535.2039948-1-vgupta@kernel.org>
 <20261104043535.2039948-3-vgupta@kernel.org>
 <6534a171-9e74-4e69-bee2-3a499798cffa@app.fastmail.com>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <6534a171-9e74-4e69-bee2-3a499798cffa@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 23:40, Arnd Bergmann wrote:
> On Wed, Nov 4, 2026, at 05:35, Vineet Gupta wrote:
>> ARC MMIO accessors use inline asm, which isn't really needed. It was
>> introduced with the original port back in 2013.
>>
>> As the previous patch showed, inline asm can be error-prone. Letting the
>> compiler emit the accesses also allows 16-bit encodings, scaled-index
>> loads and folding constant offsets (s9) into the access.
>>
>> Without the asm, ARC's __raw_{read,write}{b,w,l}(), *_relaxed(),
>> {read,write}{b,w,l}() and io{read,write}{16,32}be() are the same as the
>> asm-generic/io.h versions, so drop them and use the generic ones.
> Hi Vineet,
>
> In my experience, the generic helpers are also fragile, they just lead
> to different problems when the compiler optimizes them in ways it
> should not.
>
> I would recommend keeping the __raw helpers with the workaround from
> the first patch, possibly both variants depending on the compiler
> version.

OK.

> Using the generic higher level interfaces is a very welcome change
> though, I hope we can eventually get to the point where every
> architecture just needs to provide the __raw_*() ones.

Yes that would be ideal but what we have today is not bad either. I was 
trying to see if its possible to remove boilerplate.

>> Two things stay ARC-specific:
>>
>> - The barriers, now hooked into the generic accessors through
>>    __io_ar()/__io_bw(). On ARCv2 they remain dmb (rmb()/wmb()).
>>    On ARCompact they were empty, relying on the asm "memory" clobber
>>    as a compiler barrier, so make them barrier() explicitly.
>>    The generic defaults would be mb(), i.e. the heavyweight SYNC.
>>    The *_relaxed() accessors only need ordering against other MMIO
>>    accesses, which volatile guarantees.
> Sounds good.
>
>> - The {read,write}s{b,w,l}() string helpers, which, unlike the generic
>>    ones, cope with an unaligned memory buffer. They are defined before
>>    asm-generic/io.h is included, as it calls them (e.g. ioread8_rep()),
>>    so they do the volatile access directly rather than via __raw_*().
> I don't think we want a custom version here. Do you know the reason this
> tries to handle unaligned buffers? If there are drivers that require it,
> we can change the generic implementation to be more like the arc version,
> otherwise this likely just causes larger object code for all users that
> don't ever need unaligned access.

Not specifically but one of my old notes mentions a driver calling 
readsl as follows:

static void dw_i3c_master_read_rx_fifo(struct dw_i3c_master *master,
       u8 *bytes, int nbytes)
{
   readsl(master->regs + RX_TX_DATA_PORT, bytes, nbytes / 4);
   if (nbytes & 3) {
    u32 tmp;

    readsl(master->regs + RX_TX_DATA_PORT, &tmp, 1);
    memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
   }
}


And with readsl at the time being as following was broken due to the 
recast to int.

static inline void readsl(const volatile void __iomem *addr, void *buffer,
			  unsigned int count)
{
	if (count) {
		u32 *buf = buffer;

		do {
			u32 x = __raw_readl(addr);
			*buf++ = x;
		} while (--count);
	}
}


Thx,
-Vineet

> I see that the sparc version does the same thing, other ones without
> unaligned access (in particular armv5 and riscv) assume that the
> memory buffer is aligned. On alpha and parisc, there is an alignment
> check for insl()/outsl() but not readsl()/writesl(). I suspect this
> is not intentional.
>
> If they do run into this problem, they will fix it up with a slow
> fault handler on the unaligned memory access.
>
>        Arnd

