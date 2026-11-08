Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794133938;
	b=0XzYBRJK2YkMAmxFxQwKvr9EDrtviX0zP7oz2mCF2cVJ4Zp0IuGI84Ue7Qgx9bPt7izE
	 QCW16ePoiJGg0QYg6dUGLz03sb/7GwO6W0WKhe1jTbWWe7Gh3X1+xBrYfpIgfLQfmIMLp
	 cqt3zE20O3qtaW5naDrjt8+54leiU8XYtAvdc4GBoWoc34zBc/0957hCJNN2aYTsAoNNp
	 p9lfeAwqKtPVpxjd+7CLA/kud6tCCiYCkhPwCWsuLLmNbDXMAckB9hAeunwoTHH7u81e/
	 xpeC064hj26B+cCKeHXps6+PgM1vFawFmPHe3RzEsRUZXKL9+AmnhI+eKjUq+fELGaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794133938;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:
	 In-Reply-To;
	bh=mTO5vqmcYDoZcsiEN3Hfan20qaewLLsdcI5UnvFxp4o=;
	b=eow5Xy83R/SXAq2de3luAnb2as0HH1chI7VUvssMFlAkLlJZBZgbLmL4Cm70+aqAFpPb
	 6KC/yWDH+81b0RunHsd6QYEy9dr1izcr+3MyRAjL4/hFbcd11ohvRfNzgpZVdDcMCEFcs
	 6x1/wxmVve3BG81vJtt4sOtImZ25v+3mPDfrYD6jw33WPQdUcqzCiO0nXCmt3sVLJG81g
	 4h1N/sd0mYyKczpGOub3pnWECx3bm4FGxpsN1qjqL2C3WEFr9z+tdOQGe7wWYGMwVCArf
	 hUXG22HRRyi8FsLQKkqiTB+1LL+s4K9ZlZeKzo7RYV9R2sGC2SQxz7pvz+6d4yT5yzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LrMBuAH+;
	arc=none smtp.remote-ip=95.215.58.152
Received: from mta1.migadu.com (out-152.mta1.migadu.com [95.215.58.152])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04E1606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 10:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D04E1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LrMBuAH+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gs3bePMcYIKXqQVyDCBCOpVEhgvYU3mf5TBjeYoVOkU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794133934; v=1; x=1794738734;
 b=LrMBuAH+ZCVfir+2Ii0t+v8+EZ6WGhY/eFS0MYOYIgGO5QpaWdG3it23H9LBlJFPdADyLjvq
 Ca2RqzLX8hKg01/B3n9xrR58v0gmsmGTO36wH6DZHje4/cKsy6c74ZW1Tjnm7nEo5FG3Ztj4OIA
 4Ydaq6ZeWwZ0z6F27HByt2kk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f230e04c3a206445;
	Sun, 08 Nov 2026 10:32:14 +0000
X-Mizu-Trace-ID: f230e04c3a206445
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Nov 2026 18:32:07 +0800
Message-Id: <DMPREBS6GFIY.1NHDQRMP9OUKQ@linux.dev>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH RESEND v5 3/3] riscv: word-at-a-time: improve
 find_zero() for Zbb
From: "Ze Huang" <huang.ze@linux.dev>
To: "Jisheng Zhang" <jszhang@kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.22.0.r39.g5d778487
References: <20261107134613.17830-1-jszhang@kernel.org>
 <20261107134613.17830-4-jszhang@kernel.org>
In-Reply-To: <20261107134613.17830-4-jszhang@kernel.org>

On Sat Nov 7, 2026 at 9:46 PM CST, Jisheng Zhang wrote:
> In commit f915a3e5b018 ("arm64: word-at-a-time: improve byte count
> calculations for LE"), Linus improved the find_zero() for arm64 LE.
> Do the same optimization as he did: "do __ffs() on the intermediate value
> that found whether there is a zero byte, before we've actually computed
> the final byte mask.", so that we share the similar improvements:
>
> "The difference between the old and the new implementation is that
> "count_zero()" ends up scheduling better because it is being done on a
> value that is available earlier (before the final mask).
>
> But more importantly, it can be implemented without the insane semantics
> of the standard bit finding helpers that have the off-by-one issue and
> have to special-case the zero mask situation."
>
> Before the patch:
> 0000000000000000 <find_zero>:
>    0:	c909                	beqz	a0,12 <.L1>
>    2:	60051793          	clz	a5,a0
>    6:	03f00513          	li	a0,63
>    a:	8d1d                	sub	a0,a0,a5
>    c:	2505                	addiw	a0,a0,1
>    e:	4035551b          	sraiw	a0,a0,0x3
>
> 0000000000000012 <.L1>:
>   12:	8082                	ret
>
> After the patch:
>
> 0000000000000000 <find_zero>:
>    0:	60151513          	ctz	a0,a0
>    4:	810d                	srli	a0,a0,0x3
>    6:	8082                	ret
>
> 7 instructions vs 3 instructions!
>
> As can be seen, on RV64 w/ Zbb, the new "find_zero()" ends up just
> "ctz" plus the shift right that then ends up being subsumed by the
> "add to final length".
>
> But I have no HW platform which supports Zbb, so I can't get the
> performance improvement numbers by the last patch, only built and
> tested the patch on QEMU.

Hi,

I tested patch 3 on a SpacemiT K3 board (rv64imafdcvbvh, Zbb).

Against patch 1+2, the has_zero -> prep -> create_zero_mask -> find_zero ch=
ain
takes 45% less time: 3.74 ns -> 2.05 ns per call (-1.69 ns). Both versions =
are
built into the same image and measured alternately within one boot (6 cold
boots).

Note that this is a per-call figure, not a workload one: find_zero() runs o=
nce
per string operation, which takes less than 1% time of an openat() here.

Method and raw data:
https://gist.github.com/Sutter099/1c51abdb192eeedbf051ae582a1e8145#file-fzb=
ench-md

Tested-by: Ze Huang <huang.ze@linux.dev>

>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/word-at-a-time.h | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include=
/asm/word-at-a-time.h
> index f2d16c1eea8d..31240133eccd 100644
> --- a/arch/riscv/include/asm/word-at-a-time.h
> +++ b/arch/riscv/include/asm/word-at-a-time.h
> @@ -35,6 +35,10 @@ static inline unsigned long prep_zero_mask(unsigned lo=
ng val,
> =20
>  static inline unsigned long create_zero_mask(unsigned long bits)
>  {
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS=
_ZBB) &&
> +	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
> +		return bits;
> +
>  	bits =3D (bits - 1) & ~bits;
>  	return bits >> 7;
>  }
> @@ -67,13 +71,21 @@ static inline unsigned long find_zero(unsigned long m=
ask)
>  {
>  	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS=
_ZBB) &&
>  	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
> -		return !mask ? 0 : ((__fls(mask) + 1) >> 3);
> +		return __ffs(mask) >> 3;
> =20
>  	return count_masked_bytes(mask);
>  }
> =20
> -/* The mask we created is directly usable as a bytemask */
> -#define zero_bytemask(mask) (mask)
> +static inline unsigned long zero_bytemask(unsigned long bits)
> +{
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS=
_ZBB) &&
> +	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {
> +		bits =3D (bits - 1) & ~bits;
> +		return bits >> 7;
> +	}
> +
> +	return bits;
> +}
> =20
>  #ifdef CONFIG_DCACHE_WORD_ACCESS
> =20


