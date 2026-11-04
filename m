Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823266;
	b=gEqLO/AZWGo0ek2/cbpQjyfBnptBIN2W3afWFLl2/G9ccRByRPlEAhka84no75bxhy4N
	 yNBX0nHB/TRi9Un0p01OdyeB3cjpzpUg+wCdFZRpZE7IKDIi3ERZHlhhhUz8W6O1FtNUj
	 SbRDVUCBAbjgp8ggTwqUJQ5ZWBm/WBbvJWZScfFs4xl5JjCTYIw2lOQQ1BfLEjxOkU8XO
	 gNaJejOtBQi+0qHu6y2FArUw72Jx8cecjJYF9wLkIqdQtCf5COc3sAyevEKnf2LfMcLRW
	 fdgijhy0D+o74HfZM4w4b2kiAz1+BV/4YgYlZUl5KLWthJn5TsLrEgUEBprw/6PNP+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823266;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tainVYYnXN43BqeiQHpHR1z/mUbKthabD0UanXKbPoY=;
	b=fED1p/9Gw97O4ezmgs11lp3yYdbxiiBzIcmz3mu2Voos9x6mf/heTqqac//FAZh2Zw4B
	 Fm8KnqpP+n8fQMh9MktTsHTTWoIsOqgNp3TOaxS6z1C5Yb/8K+kOXxzflX0nMcLawbmUo
	 knfH1B6j8h/zCoB/zIRRkW6YRX1wvr8Nf+KSgcIIhxbBHQBIPPsy2N7ov7bmz4tB3FAgF
	 hGOWOKnzcVCMhD4wOFB2i66sRwmNNmXCC+R5DymTC41+UNz0NhrAlPsU+hJE/GaFfmAhd
	 OR+30OMTUYOxeAm7ZBH4ItvNz2TXLXC2VxEkHvf+2bptmqsiv0Nhz7IQgWH57+ACnRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FmP/g+TF";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6EF608418C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FmP/g+TF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72DA1F00919;
	Wed,  4 Nov 2026 20:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793823266;
	bh=tainVYYnXN43BqeiQHpHR1z/mUbKthabD0UanXKbPoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FmP/g+TFmhPeDd4FVsPaEdyCQkltqTwnzuXQm9j7nj51dwhHzbDRk+88HxFJUzQ0/
	 pJ93GwtTrdvjPErG3/gyWaXWdSQwXD77DNhoM74+k0vrU7m7WpXYHtacJEaD8L9QDE
	 4n79VbA/KZgRS/670HdPGZ+tYkueeDuJ4kYDrqwOltBgKfEo/QtE1Grf4aLGHjvRvq
	 Zgx2unF+IOBjkE5AkUIBJ3Py1P1BJOFLrPtijpFZ+8Lk/Sk8RogTXlgwzOdGiNjL8E
	 0Qy39aQwpyrR+KcQOoqzuuUnOayzPCbCPmVHyn7CUngM7SR0XBrg3gfqooHbImygff
	 CNKqoC1gF/ZOw==
Date: Wed, 4 Nov 2026 21:14:19 +0100
From: Thorsten Blum <blum@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Ahmed S. Darwish" <darwi@linutronix.de>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] x86/boot: Fix off-by-one error in sme_clear_pgd()
Message-ID: <auuSG7Bvj4pXPRmP@kernel.org>
References: <20260918142714.242711-2-blum@kernel.org>
 <20261030184642.3ec0215c9b47e3f3e0dbdbdd@linux-foundation.org>
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
In-Reply-To: <20261030184642.3ec0215c9b47e3f3e0dbdbdd@linux-foundation.org>

On Fri, Oct 30, 2026 at 06:46:42PM -0700, Andrew Morton wrote:
> On Fri, 18 Sep 2026 16:27:13 +0200 Thorsten Blum <blum@kernel.org> wrote:
> 
> > The mapping helpers __sme_map_range_pmd() and __sme_map_range_pte(), and
> > therefore sme_encrypt_kernel(), use exclusive end addresses and stop
> > before vaddr reaches vaddr_end.
> > 
> > However, sme_clear_pgd() treats vaddr_end as inclusive when calculating
> > the last PGD entry to clear. If vaddr_end is PGD-aligned, the first PGD
> > entry outside the range is cleared too.
> > 
> > Use vaddr_end - 1 to calculate the last PGD entry within the range.
> 
> When fixing a bug, please always fully describe the worst-case
> userspace-visible runtime effects of that bug.
> 
> I'm guessing "none known, this is from code inspection"?

Correct, this was found by code inspection.
