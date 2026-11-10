Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327963;
	b=YE/WEJQRSR/UFOstM0v2e8QDjk/ME5y0wxxuPJjGPYVeyc1KrWd0aniCJtzJduv9qtlB
	 oBTpNvvvMkgDZ2dQfjDCQDC4xHWIwGskRBhX63nLHW9poD5R9KLQzh2WjGyyzK7IUFKZs
	 j4zQddCj7EbYdRHXd22ppR8GUtJgPU1qs+gnDDLdwxIe38ItQZToHjBiU1s59Q/9Rm/uX
	 DkflcHhZ5UPgrw5t+lI6vipGjKVMVSa+ydxqUYhy9v5l/hHIJjDAORrj1RzDt2zvTJNk1
	 OkOzjyZAz4FA5/RV3urA/OsPgM1M9xGz2d0PZCY3FQ59jvTnXcQ1uaeU9NwPfKE5IeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327963;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=3BEJ+N6X5QOJCG5EBkLlL2QIdGj7WHzAmj1HB7NOhqw=;
	b=AOF8JfocwmZc2vAWHHEg3NZ04zJLt1npKmIE1EsI2BvLj28EaSz5aMduKPcLOs2k2H8q
	 QV81d5uOA4wBO251hTqt5OZcGGgUFtUPRGQJeCF6IIP00/lqqG7GlZhA2lONMrfhxLByt
	 8TtvyatPchp6+rXXNxTf/qVAKSPvKHLChTaCbV/xkkGBjVWeAbRfFRzbcuy/dYlQ2TodG
	 /ltagNWufRctbMZ94MnP7nRnkgeZoeoifgw3XVUYjdaUgaal0MhuLJERxQPwp3LrEpf/V
	 Fas5kf4UpZNsXok3d7BjNv9R7MdJBi7IIBA160QOlR4BPO+65ocd4iRW/+2IsFluaww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pe9TUcD3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C006B606D7C6
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pe9TUcD3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BA61F008BF;
	Tue, 10 Nov 2026 16:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794327962;
	bh=3BEJ+N6X5QOJCG5EBkLlL2QIdGj7WHzAmj1HB7NOhqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pe9TUcD3LYq/q/7NRm5EFbDym/O9ALmDFI5/4iNhaovynQKcL15k8FeMv6wg0XydE
	 ruo9fvwxuyOeHVnmqoAcV/wQ83wH6qgqePExkAUfRE3TGOFB1MpZ4PqUxCorFZ9ys3
	 K17ITBxYwJv+hyRh+8s7yR9x7gAF6wCN6m6KbwyVVgW9H3/lJ+I5ywQDMgi32SxSOI
	 yfy/BISAfz3CVpbDyEk+yLg7pzDXXPZBbM0kLJbsqXe/4HS3RLtjKkr7+Eybqj9Bt/
	 tEU16sL8+NTG2mnFcH1AQiGxTzK5XzKYH6UJeBCVpjRKiuAbFzlc0nekH6g2hdBSXe
	 uM7ewFABO3W6g==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 19CDB198004A;
	Tue, 10 Nov 2026 11:25:57 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 10 Nov 2026 11:25:59 -0500
X-ME-Sender: <xms:lEXzapK5i2GNnSJALWNOOfBGjAybXByO8mBSfIiJ1paMkN6tk9GIpQ>
    <xme:lEXzau0RXJ11OjNLocymthTox7pNREpkRnOqeLsieZbN2k7xZT-uTfkuPErz1w51B
    boPlnTIqKok2rW7afKfoJes1k9-xtLfKBOCKoIEbXiYhvW49Gjf6df->
X-ME-Received: <xmr:lEXzahDRK8TUZp8Xrl80WQCq8I-UcdHx4wWreulZrynNH0qG17lfQtCSGKU>
X-ME-Proxy-Cause: dmFkZTGZawqKKOfEYZHZc8DS63drErmw9P3IKNW3nTCzfxnO6LtlDWJrbqp+TPMuU+fdty
    sor4W3IvdifXE0sozO/ARvFBvsk24uAxaJ7TLfDIJv0Sen+/YF8RjSBrXfTm39VYmwO6r+
    2Cl2RAby5olA+17oEHttZuE6gwk3c8ZkgD2RkpmuL2tE2pjO7V1y29oZ/hIWoD/juG/uhE
    gh6ObnbXxHbzJDQljq7eM97dSzQZ1bm8o0Zu6DjQMjg9n2ya7YHTxPRTRw3amhtCe7rhMm
    Zf2CWBI9Du2Hzb82KkwNB10dCpq+0lnEfJUOVRauRG+4iARIAxacUOlB8CK9whRW/QiFWG
    thilX9cwARqZ3/xwdtxspY+GIEa/rUMbqvS+wXyH73zb+HNQHM0xGAmyFVVCnoL/yAJ6Cs
    ehM5Z3Oxr41DJpTxua8D9QL+ynemNP37UJkgIjMuFIgx8GApo6tWBH2+5Wvo7seQ+hIEAZ
    1AD0j34i8+Cj8D/ebrRxUNcHJBLAD5coF0S43vY24XHlNLTdIvy5UflUaefCPhoEKM3hrH
    iDt80wJ48UJ7ZHgk/MxFfZ9ByH59szgxjyQeEs7+WxCj/EU4z4st6Y3eheab4Awt4I7W7Q
    sQFcC/MmhBGHFZWLuD54slX/YyY5dI3BO31/DH0nD3sqyLz2ZEbQcUA9JiWA
X-ME-Proxy: <xmx:lEXzaieCPY9WCKGzJUmJse37IZLsz3se-7KnGBrjugD49WJhNoUqfA>
    <xmx:lEXzakzJ22r6WW8ZSstUU7eappnij2Ly0RJG64BzEzx8u0bvrLKMsg>
    <xmx:lEXzaqmheA0pL6Y9ict-OsnCx3ZqN_jL9dTcY_NWuBeDvgVJEmdgQw>
    <xmx:lEXzalAIOtC50DsC1ushcLOQN4eqqpVuNE_M60Yup_Mnon614oDwBw>
    <xmx:lEXzavd_Gk-r5l8IUGnYtG2F7-d67sKcq85jrUzLB4FZ_0o0pVCiXep2>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Nov 2026 11:25:55 -0500 (EST)
Date: Tue, 10 Nov 2026 16:25:54 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: david.laight.linux@gmail.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, dsterba@suse.com, hpa@zytor.com, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, terrelln@fb.com, tglx@kernel.org, x86@kernel.org, 
	torvalds@linux-foundation.org, hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev, 
	kernel-team@meta.com
Subject: Re: [PATCH v2] x86/lib: Use REP MOVSB for large memcpy() on ERMS
 CPUs without FSRM
Message-ID: <avNEZ6Zz5IhN2Zao@thinkstation>
References: <20261104222806.1826508-1-usama.arif@linux.dev>
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
In-Reply-To: <20261104222806.1826508-1-usama.arif@linux.dev>

On Wed, Nov 04, 2026 at 02:28:06PM -0800, Usama Arif wrote:
> +#ifdef CONFIG_MITIGATION_ITS
> +	/*
> +	 * Returns are patched before alternatives. Align the replacement
> +	 * source so its return is in the first half of a cache line and ITS
> +	 * retains its thunk. The copied return can then execute in either
> +	 * half of a cache line.
> +	 */
> +	.pushsection .altinstr_replacement, "ax"
> +	.balign 64
> +	.popsection
> +#endif
> +	ALTERNATIVE __stringify(cmpq $0x20, %rcx; jb .Lhandle_tail), \
> +		    __stringify(rep movsb; RET), X86_FEATURE_FSRM

Does this mean any RET in a replacement needs the same alignment? Would
anything catch it if the next one doesn't have it?

Linus' layout keeps the RET out of the replacement, with no padding:

	movq %rdi, %rax
	movq %rdx, %rcx
	ALTERNATIVE "jmp memcpy_orig", "rep movsb", X86_FEATURE_FSRM
	RET

Non-FSRM takes the same jump it takes today. Does that avoid the ITS
problem? Why not this layout?

> +	/*
> +	 * RCX holds the count for REP MOVSB and scalar copying; RDX is scratch.
> +	 * Shift RDX to check length >= 2048 without destroying the REP count.
> +	 * The 10-byte alternative fits a NOP without ERMS.
> +	 */
> +	ALTERNATIVE "", __stringify(shrq $11, %rdx; jnz .Lerms), X86_FEATURE_ERMS

The RCX/RDX swap is most of the diff, and all it saves is one MOV on
copies of 2K and up.

What about something like this? Untested.

diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
--- a/arch/x86/lib/memcpy_64.S
+++ b/arch/x86/lib/memcpy_64.S
@@ -31,11 +31,9 @@
  * which the compiler could/should do much better anyway.
  */
 SYM_TYPED_FUNC_START(__memcpy)
-	ALTERNATIVE "jmp memcpy_orig", "", X86_FEATURE_FSRM
-
 	movq %rdi, %rax
 	movq %rdx, %rcx
-	rep movsb
+	ALTERNATIVE "jmp memcpy_orig", "rep movsb", X86_FEATURE_FSRM
 	RET
 SYM_FUNC_END(__memcpy)
 EXPORT_SYMBOL(__memcpy)
@@ -45,11 +43,11 @@ SYM_PIC_ALIAS(memcpy)
 EXPORT_SYMBOL(memcpy)

 SYM_FUNC_START_LOCAL(memcpy_orig)
-	movq %rdi, %rax
-
 	cmpq $0x20, %rdx
 	jb .Lhandle_tail

+	ALTERNATIVE "", __stringify(shrq $11, %rcx; jnz .Lerms), X86_FEATURE_ERMS
+
 	/*
 	 * We check whether memory false dependence could occur,
 	 * then jump to corresponding copy mode.
@@ -169,5 +167,10 @@ SYM_FUNC_START_LOCAL(memcpy_orig)

 .Lend:
 	RET
+
+.Lerms:
+	movq %rdx, %rcx
+	rep movsb
+	RET
 SYM_FUNC_END(memcpy_orig)

If you keep the swap, please make it a separate patch with no functional
change.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
