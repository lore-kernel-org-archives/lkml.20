Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499521;
	b=3COrtMhnunLLndauJKd9Pn4yd50s3zxbyJO4hBRcVQFJmzoacy5s8B8nRrfGkyTBNAwk
	 o/210dJjEjWWhTWWaQYdXy5ZvlGmLWQmwsFk/HosmjqLJbpe57uRNufOErPBj2Kxo8VA0
	 8lyHCIUBKHqbLqOAL/00DPJ4W1Jgal6SRxFmEN+udGTiJvLnMD+Oe2BYD+DZvc6YLToeH
	 6I+ez98WTwYxApQVwFITDx4d0gwkFG/PeiiH7Xh8Fo2syXPB8pi/cp+/tp76t9k1mo/Ro
	 87uGJ8JaT9WrN6pjJeKT5Bb3cSGaZKw6E/s+5ylnWzRGvRqBmdF1kormECusHubc85w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499521;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=UeN8Ru+rAKrt0PPgXy+pM/9MH+gETzdo4cmnL5YZlDg=;
	b=OtvfQmac/cRjOL140nOHLFtJ+Qv4aVjHUrsKYrSNdQf7jOqJyWKvq7x7vhTbAXClAqRw
	 z9XqNiFvGkyIL7SnUWlNhfYojVaFq9XEt7GYJC+5Cw5cZyoTVChv8I+JZbK+dsO2/70o1
	 CFbmPY5mScb/9uMV3m1fgWffJJlujVcEUXlx2ck3ktGMGzU9HCzgcGBT8Ur7/V1CX+yop
	 9+XwU21JtyS5ZDi8ccz0L1jI3RciL+zKQD2XOVArWUo0uXX5NOuAmjFqLkU2Kjh5YK6RM
	 DIo2ykV99jGjw26Ka4WPckQchkDJe6GdEyHGPmUDqNevdkTZ5SY01FtT+CE3khwv54Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens-energy.com;
	spf=pass smtp.mailfrom=errorhandling.siemens-energy.com;
	dkim=pass header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=gwxB9cAg;
	dkim=pass header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=NIx26Tkn;
	arc=none smtp.remote-ip=185.136.65.142
Received: from mta-65-142.flowmailer.net (mta-65-142.flowmailer.net [185.136.65.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304FA606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 304FA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=gwxB9cAg;
	dkim=pass (2048-bit key, unprotected) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=NIx26Tkn
Received: by mta-65-142.flowmailer.net with ESMTPSA id 202610201231503dafd2fb1f0019fd8b
        for <linux-kernel@vger.kernel.org>;
        Tue, 20 Oct 2026 14:31:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=UeN8Ru+rAKrt0PPgXy+pM/9MH+gETzdo4cmnL5YZlDg=;
 b=gwxB9cAgcfInTIj4dDHEUuFot4nXTZn5IMoa8m2nJW8Z/SW6r20mLTwMjK2iQYp2q/abmC
 UnxDT1jFy2ZVpTKqf7B+Dms7nRtacRSRpxUs3ZCG5/493F90g0QpJpaedRMiDcOpAsfuclui
 iODHFuTLcWIUNlIGiC8RFv2QMRGSQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm4;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=UeN8Ru+rAKrt0PPgXy+pM/9MH+gETzdo4cmnL5YZlDg=;
 b=NIx26TknBkc96UyeZMGheTuELXz71beyVvzWbYGFf6P+dgWY8tf3EeE2bE1Wtp/nfkHON7
 7KN9gWxyOB8BFGg+lloeBUrx6ktNIT9DTfCNRESaMmb9Bzbwq/lUYgeQ22xf/+R8UCmzPUwm
 HsL0E+na+ePtC6EnuPJFIDbnXr2hmOp/vVJHMGzX1BCxlqX407N+y1hSQAXU1PZ4yYuC0LPk
 59NT5VouOHeX3FF+SDmYrckCMCxzzntV9OrQ/XLdG/cRUtmHpuTC1vj+FMRBUMuQ7qb0zEnu
 81Silazv/+LWa3owt262yKDYhdoGqCr2ASIDpVZ7mZELGfOQ4wOirgKQ==;
Date: Tue, 20 Oct 2026 14:31:49 +0200
From: Simon Schuster <schuster.simon@siemens-energy.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dinh Nguyen <dinguyen@kernel.org>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kernel@vger.kernel.org, Chung-Lin Tang <cltang@baylibre.com>
Subject: Re: [PATCH 1/2] nios2: remove libgcc for lshrdi3, ashldi3, ashrdi3,
 muldi3, and ucmpdi2
Message-ID: <20261020123149.cyjzz4uo25oiiu2m@dev-vm-schuster>
References: <20261019165015.2656521-1-dinguyen@kernel.org>
 <f13fd39f-1ba4-438e-a1f7-fe4184adbc26@app.fastmail.com>
 <20261020085630.w7je2ev3f6ectshy@dev-vm-schuster>
 <686f4ca2-0fb6-4a73-9cdb-0edcccafdd62@app.fastmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <686f4ca2-0fb6-4a73-9cdb-0edcccafdd62@app.fastmail.com>

On Tue, Oct 20, 2026 at 11:41:59AM +0200, Arnd Bergmann wrote:
> The underlying problem is that the kernel is its own special environment
> that is neither a standard C library nor a 'freestanding' implementation
> and only vaguely similar to a mix of the two. We need certain parts
> of libgcc but for convenience we want to force a link failure if the
> compiler ever generates calls into functions we explicitly avoid
> in the kernel like 64-bit division and floating point.

Hmm, makes sense. The question is to what degree we assume those
particular implementations in libgcc to not do bad things... But if we
do, what about something like that:

$ nios2-buildroot-linux-gnu-objcopy \
        --keep-global-symbol '__divsi3' \
        --keep-global-symbol '__modsi3' \
        --keep-global-symbol '__mulsi3' \
        --keep-global-symbol '__udivsi3' \
        --keep-global-symbol '__umodsi3' \
        --keep-global-symbol '__divsi3_table' \
        "$(nios2-buildroot-linux-gnu-gcc -print-libgcc-file-name)" /tmp/libgcc.a

$ nios2-buildroot-linux-gnu-nm /tmp/libgcc.a | grep '\sT\|D\s'
00000000 T __divsi3
00000088 T __modsi3
000000fc T __udivsi3
00000160 T __umodsi3
00000000 D __divsi3_table
00000000 T __mulsi3

Wouldn't that fulfil the requirement as well? Only "vetted"/trustworthy
symbols get exported/linked, while it is easy to add additional symbols
if the need arises? (If we gracefully ignore the downsides, such as some
degree of brittleness such as implicitly assuming that all
dependent symbols reside in the same file as they will be switched
to local, and the fact that this is a hack, and that we tie us more
closely to gcc on architectures using said "hack").

> > On a more practical note, while technically feasible, I'm not sure
> > whether we can actually vendor/copy directly from libgcc; I think all
> > code there is GPLv3 with Runtime Exception. (I'm not a lawyer yadayada),
> > but I guess direct reuse in that way is problematic, given that the
> > kernel is GPLv2 only? So I guess we would need to do a reimplementation?
> 
> Right, the easiest way would be if you can locate a downstream gcc
> (or clang) fork from Altera or Codesourcery before it was merged,
> if that still has GPLv2 or a more liberal license. Reimplementing
> the functions otherwise is of course annoying.
> 
> Adding Chung-Lin Tang to Cc, they contributed the original files
> to gcc back in 2013 and may know a copyright holder that can
> provide a GPLv2 compatible copy.
> 
> I also found a similar implemention for m32r that was still
> GPLv2, maybe that one works, see https://github.com/gcc-mirror/gcc/commit/38b2d07632#diff-4de4f3b573100be00cf40045c85faaca8ded1f13ef80df1822889cbd6ad639a8

Nice find, m32c-lib2.c seems identical to the modern nios2 lib2-divmod.c
(save whitespace changes). This already covers:
__divsi3
__modsi3
__udivsi3
__umodsi3

Regarding __divsi3_table:

This basically seems to be an array of 16 x 16 (even though its
linearized into memory) that caches the result of row_index / column_idx
(with divisions by 0 being assigned to 0), so "reimplementation" should
be trivial.

Regarding __mulsi3:

The iq2000 target seems to have a GPLv2 implementation; slight
difference in declared datatypes (iq2000 uses unsigned, nios2 uses
signed, I'd need to think a bit more about this), but should generally
be viable.
https://github.com/gcc-mirror/gcc/blob/releases/gcc-4.2/gcc/config/iq2000/lib2extra-funcs.c

So we should probably be able to assemble a libgcc-free nios2 kernel
runtime without the risk of introducing new bugs in potential
reimplementations if desired.

Best regards
Simon
