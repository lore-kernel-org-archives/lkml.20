Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2A74F0557
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572742; cv=none; b=kb4EBN+XOBEm5YSw+5aoEyfd/3qhyPxJRkcJ54h7AdPD2Z9macZilA7XnH/uUttMydGVdRWfg+Mz84rHz7sF85112+JZGKqwWSSdzqvIeN7q5cyxEKwJdUjUTVWqc3X54fXuQxlZCzgPZD/yIqKE3yApJZC2kuRf6yW22Z2zM3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572742; c=relaxed/simple;
	bh=GNXX10jFFVYPSFMnTtwo/nB37qWTYupUa8HU1zg4KgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ER82DC23HjRrImdYN22QxXQHzBSeKonxVkSoAtiA2LKSOvU/bgOt8Xf6sAogvMRO3MdrRmWrj538fbK3GUFyhqmYFvvPSEsLKxXstJvZeor+4l+ba4wNS9A47ydLZblrn2lKwxqCnjZoYQt2jLgiVwKa+AodcRLPkPk8am7lVOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Od7nyhHi; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Od7nyhHi"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5D6D240E00B9;
	Wed, 16 Sep 2026 15:32:14 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FEbHYErFmwH0; Wed, 16 Sep 2026 15:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789572723; bh=+ncQkglgN0s+DNE7ulb0S3bNaiYn12xAJ1A7efer6HY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Od7nyhHiVCmmM93z/j14/G5Tld0fi1nBHjy2H6KN0ye5CLZ8dOr7qKsyF88rahZhO
	 P+kkOK7DbxEzdZ1KdS5fxslACPySDeeH8EyBVItSshs16dEiMYH5fVQKTpTxP7Cjc9
	 X+7wOiaIj+p0yhhGxgupjRcA+W065wW9yF9EQJOap0TZWzebIdqRwUmCD2XbT47AiD
	 fa69YNOFbfBxSUO5ElKIIXER6zUf4Fv+pJ93Ii/58OnZ9ngQKFwl07Cb/VDPDPggLC
	 Jht6oGkDUeVDMdbgjk4MIalEyzBDLe/kfGAQwD02UViHy3kAmsmivXwBATAH789grG
	 DwJzUgBwXEeKwunjJu36VaO/rfmFGZZdRxrNuBikIpciFnRo97aA/eKRlW6SMBrEPO
	 lBDYnQ7ivDsUM9ofJYL+nyHNcmcbYZ3glPsMXWpcRmwOSrwo2NzZ6dYHD5u80jP5zt
	 IajzXQ+gpDQYaCrGnqGdcRfEbcecfyghbkeDWs5HdkrezvJt+6I0BHnzr4rb+ME6wR
	 YHD/zsb/w2PhcIoMDoNjxkB5rRR8n32wvlJvnRGeQYHmsjN4Y8nv+yiT4ITD03Kxuw
	 a1WXjKWiJJAGRCXkEUZfaNBf0Ub9BIcvdlDXxXoqHOmfzAvmLGTfMiPISiLeLM2Naz
	 /j9kREWZ62V1w5aH1/sGN4fo=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1A9AE40E022C;
	Wed, 16 Sep 2026 15:31:52 +0000 (UTC)
Date: Wed, 16 Sep 2026 08:31:49 -0700
From: Borislav Petkov <bp@alien8.de>
To: Andrei Vagin <avagin@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	"Chang S. Bae" <chang.seok.bae@intel.com>,
	linux-kernel@vger.kernel.org, criu@lists.linux.dev,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 1/7] x86/fpu: Document signal frame layout and portability
Message-ID: <20260916153149.GAaqq2ZcheETQAosSE@fat_crate.local>
References: <20260908043427.1842515-1-avagin@google.com>
 <20260908043427.1842515-2-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260908043427.1842515-2-avagin@google.com>

On Tue, Sep 08, 2026 at 04:34:21AM +0000, Andrei Vagin wrote:
> The x86 signal frame is designed to be self-describing, with the
> 'xstate_size' field in the software-reserved bytes indicating the actual
> size of the context. This design is required for portability, allowing a
> signal frame created on a system with a specific set of xstate features
> to be restored on a machine with a different (larger) set of features.
> 
> Document the signal frame software reserved bytes (struct _fpx_sw_bytes)
> and portability constraints in Documentation/arch/x86/xstate.rst, and
> add a summary and cross-reference in <uapi/asm/sigcontext.h>.
> 
> Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
> Signed-off-by: Andrei Vagin <avagin@google.com>
> ---
>  Documentation/arch/x86/xstate.rst      | 55 ++++++++++++++++++++++++++
>  arch/x86/include/uapi/asm/sigcontext.h | 14 +++++++
>  2 files changed, 69 insertions(+)

Sashiko has some comments here:

https://sashiko.dev/#/patchset/20260908043427.1842515-1-avagin%40google.com

Please address them.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
