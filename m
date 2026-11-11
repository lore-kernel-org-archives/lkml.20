Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418316;
	b=1zqxY7RKHdkZUJMVL6hRRVlOx4s3SixGr77JWbYNrvU4CbOGWfKbiZUJqV7Q7hZjIBYg
	 TeHe4nGXdqZoiPy2MGbZGHjhBJUECuJ00BheSK1gBkjNwxVl1+SFDi9CD5onP4DXI8+ib
	 0ITJhOUq6JsogDsORqIXGO/vT6HBaE+0PyiPNypV02IEkX7jD4LDiIf8VnZEBU4JmzWRr
	 BbWPBO76Y8D9lLuIrMU82MkOTWy3nzq3RQp8nuaF9kmGr1IsaywVndH5cDH0keSW3TDh1
	 PTvl1YnzOcUJBkumyhfNeDSriPWbOd6xhkvRp6a3vz9Uqy/TfOpNL4aQX+e2HdY8mGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418316;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YCAVBW1KXXm0mKa5qXFM1j5Nsngxp0Bsk5mcqxSW9Ac=;
	b=AH0GfGyPwfWJUeFZemQEdqYDeDUWXwtu92JWJ123Lv65diR04W5N86An9rfA7aJ8ZNin
	 bRYva60gdDBGO9u96g1r7xNj46667WmGIjOof0uvZOTt5nywSJd+C56A6wlG/9vaRwUJu
	 y9ODzAtvfErtlPjB8mvLuaHCnwMbu0d1YyWinBisjCmSrrDPK+t6coa1upOorRFwDbq6I
	 O/dZTUSx9x/XmyFwAsO12DZOMYifvSlFVZY/hWPtesFKAYWynYNtyG9sUGrNZcEVny6Oe
	 dIuLWy8ycTXZ0qi6XNbgWCYB1cH99m+xmOh6aNiyOSaExLjuKrZcrf2X8VL108iAu8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gt2/RNmt";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C0B606A8BC
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gt2/RNmt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5D71F00A0E;
	Wed, 11 Nov 2026 17:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794418316;
	bh=YCAVBW1KXXm0mKa5qXFM1j5Nsngxp0Bsk5mcqxSW9Ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gt2/RNmtrlwTJIkcvDCA1q5eVEWBQiNr9gsBtIR3QtO6CP445o7ySNLlM0OtKwQwu
	 kPs6cpTqEzectRh4CeitensUWTSymRmTDai9hvj0JDgBQLPhHXGWNsHKGiTGDC3ZQb
	 jZuUAw6JMCFsX8WJ6DVpAWX4TmHeFJfUc1toEBX+sm5UBaRrZaJrw9sQQfM3ri+p1P
	 hGLCL+tA1lwmiPhg9qqoLXMPYqBI2KP5zPmfGi52lkh1QZpKDl8z3+AWgTJrAImhS9
	 ojtWPaErrGaJQhyOPN+5X050bIlEzty9K0IjuhKnbyBUZc3BRs+B2LS1JZkiJMGCCs
	 2nEeA7ooxmafw==
Date: Wed, 11 Nov 2026 19:31:49 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Thorsten Blum <blum@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] x86/mm: Make highstart_pfn and highend_pfn local to
 initmem_init()
Message-ID: <avSmhSbrBUBqPLxK@kernel.org>
References: <20261111133635.75044-3-blum@kernel.org>
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
In-Reply-To: <20261111133635.75044-3-blum@kernel.org>

On Wed, Nov 11, 2026 at 02:36:34PM +0100, Thorsten Blum wrote:
> Since commit 35c3151a98a6 ("x86/mm: Consolidate initmem_init()") removed
> arch/x86/mm/numa_32.c, highstart_pfn and highend_pfn are only used in
> initmem_init().
> 
> Declare both variables locally and remove their unused extern
> declaration. Use min() to initialize highstart_pfn.
> 
> No functional change.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  arch/x86/include/asm/highmem.h | 3 ---
>  arch/x86/mm/init_32.c          | 8 +++-----
>  2 files changed, 3 insertions(+), 8 deletions(-)

-- 
Sincerely yours,
Mike.
