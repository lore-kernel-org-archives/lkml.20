Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39B73A4520
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790226336; cv=none; b=EyZOaykptsgPBFyjfHdknhfq3wzlTz5Jy0k+HhliHMMFdXCT8VTo/Gc1nUqjI0FoEacuJwJnWqmHxAze8LCSHLJqGj+kWMZKE7jzaezou3D3Gw33FstpvENh08ea7vFVZkKweKE2XosF2XMOHX6npo2SO6wMpUwemULp22vqYOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790226336; c=relaxed/simple;
	bh=BnaA/IzRnUHikUS0/ANH87xHSLnnPUfl7eNfRPygWzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQXL5d0OTVoKUbd9FESnP3VpovKHuzsvFJPc8l29t+XLsSmTgbYXe+G/xUA5FmPGrMPt7qtTDj1MQ+yh+N7ext6qUoAKf1PAnnyXJ4rP2Ux2N683q/EOeC0zYw53smMfYmhXL/+7MMVQMB6Q2Iu2PZayXVXxiw4hkXdeL/evaNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=HW6v0TE+; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="HW6v0TE+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=7o0OeEyMuwSonCidmJ3wlDdB6qY0WHDZQ4VolkPeX4E=; b=HW6v0TE+aoqNEFIGS/fP3nfD/y
	OhfVaBXfhvKDOX9KtVMKfTXpOunv080Uzy6ZnNanY19lZ7XUOCng11UyVPRqkqdtxjwtAFXHDoE11
	BnIXUeR3Qv4J2YwQvNNgHM32AC0gXhh841U3WMfOF/L1jlz91dvUKLWDBouvOJ5bqHcp8VxOL3Z7t
	80S1UmGfMzkYGjgg6O+OjbDVAgINVrw6Nxv96213vskoEYgOlXU1JNkzFjMtU/wf3jug4gJi2mZ0X
	CwxHq1ofIors2hCePaUZAWjNc0QIb8Fv0ajM34vcGElMczPjICMbJ9l5IjN6sogUbfTJ8npXGz9HL
	+KZuQEHw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x9bP6-00000008Jsc-3Usx;
	Thu, 24 Sep 2026 06:49:52 +0200
Date: Thu, 24 Sep 2026 06:49:52 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: gao.rui@zte.com.cn
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jiangfeng@kylinos.cn,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	jmontleo@redhat.com
Subject: Re: [PATCH v2] riscv: fix =?utf-8?Q?strnle?=
 =?utf-8?Q?n=28=29_overflow_in_Zbb=C2=A0implementation?=
Message-ID: <arSr8E0CYQRi8wMs@aurel32.net>
Mail-Followup-To: gao.rui@zte.com.cn, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jiangfeng@kylinos.cn,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	jmontleo@redhat.com
References: <20260924105708488K1vV5J_xi9COWY7TvJawc@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924105708488K1vV5J_xi9COWY7TvJawc@zte.com.cn>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi,

On 2026-09-24 10:57, gao.rui@zte.com.cn wrote:
> The RISC-V Zbb optimized strnlen() implementation can return incorrect
> results when very large count values are supplied.
> 
> The previous implementation calculates an end address based on the
> input pointer and count. When count is close to SIZE_MAX, the address
> calculation may overflow, resulting in incorrect termination checks and
> wrong return values.
> 
> This issue was observed while running device-mapper tests:
> 
> dmsetup create testname9 --table "0 8 zero"
> cat /sys/block/dm-*/dm/name
> dmsetup remove testname9
> 
> Rework the Zbb implementation to use a decrementing word counter. 
> This removes the dependency on end-address calculations,
> avoids overflow entirely, and simplifies the word scanning loop.
> 
> Performance was evaluated with string_bench_strnlen:
> 
> New Implementation Previous Implementation
> 
> len=0 : 70 ns/call 70 ns/call
> len=1 : 81 ns/call 81 ns/call
> len=7 : 81 ns/call 81 ns/call
> len=8 : 81 ns/call 81 ns/call
> len=16 : 97 ns/call 90 ns/call
> len=31 : 119 ns/call 113 ns/call
> len=64 : 174 ns/call 162 ns/call
> len=127 : 264 ns/call 258 ns/call
> len=512 : 801 ns/call 824 ns/call
> len=1024 : 1578 ns/call 1550 ns/call
> len=3173 : 4541 ns/call 4703 ns/call
> len=4096 : 5984 ns/call 5982 ns/call
> 
> Results show comparable performance to the previous implementation
> while fixing the overflow issue.
> 
> Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
> Signed-off-by: Gao Rui <gao.rui@zte.com.cn>
> 
> ---
> v2:
> - Rework the Zbb implementation to eliminate end-address overflow
> instead of falling back to the generic path.
> - Use a decrementing word counter for word scanning.
> - Replace numeric labels with descriptive local labels.
> - Add comments describing the loop structure.
> - Run KUnit string tests successfully.
> - Add string_bench_strnlen benchmark results.
> ---
>  arch/riscv/lib/strnlen.S | 111 +++++++++++++++++----------------------
>  1 file changed, 48 insertions(+), 63 deletions(-)

Note that the following patch was also posted, to what I believe is the 
same issue:

https://lore.kernel.org/linux-riscv/DLLJDLKPZ4S3.1KQ5O4OQBBTEW@linux.dev

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
