Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B751125B08E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791201769; cv=none; b=SbtkHhSzztDCVD1GTu9zy+5MFU6eBNYcnTx6md9lfsTGL1CXyGQKs2cny16u1VncvxEZQ0ryCiH8RquTRxSvUuTvQkvgWXwmX8Yz15n+zNpn8WqmBG1cWEztiUTt9WjA0+et6gszj8rJJ3mUW4JYg6OblRUNVIX6jvIvNWWOfxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791201769; c=relaxed/simple;
	bh=2tEpMZ77n6w4vVkho+p3Gf9o+ICKIrZRtsn3LDKKCDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G44Lm3hNfukbJUK2ZsKd65EL5dXCmzs3AkYs5LluOKfTOF5KtQJAJoNB5gk86J1AdJdtSKwpy+npoFeVnWaS9UVAo8skLAKINoIuIpOcAItVe9V9mJGcb/oKXz8lATS/s+Gi9Q3mmxLAv0iuObWVla/dU0nRJU5nsNLtJBBhTOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjQ2Q3fk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjQ2Q3fk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE80C1F000FF;
	Mon,  5 Oct 2026 12:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791201768;
	bh=zq7u2edxDnLVPDWE5GoYZ3fszF23Bo/rnfEjV/tytZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hjQ2Q3fkqwQNoxfy/oOqWTnKuyuYoGp4Dlw/sMXq+86HLdI/Io7YIxwwurljS/oid
	 zbOHSlByLmOcYE4/rD5pr1W5QJz0goBQc2MqrSzce8hsSTPnJxyedK3Cpv3KHe+GWe
	 DTKQ3CPpl+LHE66dCgV3CxeJH4Ck/RQZM5FQrC2vDOJg1ipxChH/zJZ/tJr2Yi+Ucg
	 vewv2SDf+t5RKn0B+FjAXjGLHWjX147n7Mf1vYegHkEMk3AITZZFBzmFvAsME8RtUM
	 9eImcyE1MY+Ybqhk5FJAL5RuQGB5u17282dfuKx+J45NodFfcYrxm3vrFzO9AJmJMx
	 7EjPuYgIQJhiA==
Date: Mon, 5 Oct 2026 14:02:42 +0200
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jarkko Sakkinen <jarkko.sakkinen@intel.com>
Cc: "H. Peter Anvin" <hpa@linux.intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/realmode: Pad the embedded real-mode blob to a page
 boundary
Message-ID: <asOR4ixY1RK-pKU2@kernel.org>
References: <20260917114928.213178-3-blum@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917114928.213178-3-blum@kernel.org>

On Thu, Sep 17, 2026 at 01:49:27PM +0200, Thorsten Blum wrote:
> setup_real_mode() copies the page-aligned size of the embedded real-mode
> blob into low memory. However, real_mode_blob ends immediately before
> real_mode_relocs, so the copy includes relocation data and potentially
> other .init.data contents when the size of realmode.bin is not
> page-aligned.
> 
> Pad real_mode_blob to a page boundary so the copy contains only the
> real-mode binary and its padding.
> 
> Fixes: 084ee1c641a0 ("x86, realmode: Relocator for realmode code")
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/x86/realmode/rmpiggy.S | 1 +
>  1 file changed, 1 insertion(+)

Gentle ping. Could this be picked up with the Acked-by from hpa?

Thanks,
Thorsten
