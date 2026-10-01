Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E427143DEB8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833310; cv=none; b=OimSrhWS3Wl8WrjK7QdsQ8xNXRnj54K19n1Uf+4cEzXKV1Gw8exUG9pwIaLZt01orjTKbjMC7AyQ54yr92b+BT8rFdLRiqocjqo2qM4b4I0droa4QWmZWZfFbjZ/0Ox1hWXtZy6FBzn34+hNpTaNfehYkOrSnWvyLatkhY9Evy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833310; c=relaxed/simple;
	bh=XJGZ42AAks+v4ejAqRTKl0CGogzAehzbyzuDcc55rgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cs7QY68JjwklJzJRLge7ABX1LMGLFE1J6uQbx4kMJxgR1pQlvQs5L4psnjGi6nHRUe/CtDXF3frohpT4/AmeJKPsv8kDwaQgW7iRrC9wJrasWGcXdCy1j6hvIMTb0tMcVrkBo2pQavEAUEMR4X0hN78rxCVDiYAu6NT90j2aeR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oihq4PZU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TEWDmLLR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oihq4PZU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TEWDmLLR"
Date: Thu, 1 Oct 2026 07:41:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790833306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7h0gq7uYdAHxkRv+0+Xed5H9vJRADepCIHmDfn4dN+U=;
	b=oihq4PZUiUofW7VsizXy6GutADB+k3Foqw7nNG/XTGVIvgGf428HTsP8sOw1HsI4vy3+VC
	XsioNwEPNzpv8UftBWK2JSoP895LJACWIq/eUYIoVY6imLUYLWLnBeTfuEi6hCxT9kjXJr
	Qa/prHWP6e0rapiV6J3yMDPVdGhNdmX2ieKzOTJOH6ydSc1jQNXO7kktZx4QW/4FbHd8Fo
	+VGFODm/VwS+BSKn8LY5tvfpp35swgd/QPyRE3Ktd2ZjfklzMDY5Ts16t8SkS5X7SGpLj+
	C/iOvAkDcFDWQRVJFkUy/NhSG1E64CN/CinE+OhShNfXD92xEFnbH8cvVEfaWA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790833306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7h0gq7uYdAHxkRv+0+Xed5H9vJRADepCIHmDfn4dN+U=;
	b=TEWDmLLRCiO/Cmk9W7bo4GDdr1TRKjayW0dkS3uneyt4n2QAQXlFMbgp5dGDw9ArMM4fFq
	g+qWhoNT9WkrpYCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, David Laight <david.laight.linux@gmail.com>, 
	linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH v6 4/5] vdso: Move BITS_PER_BYTE and BITS_PER_TYPE() to
 vdso/bits.h
Message-ID: <20261001074114-1196ec3c-ab6f-4d70-9518-7a019c5871a0@linutronix.de>
References: <20260930154500.722828-1-zhanxusheng@xiaomi.com>
 <20260930154500.722828-5-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260930154500.722828-5-zhanxusheng@xiaomi.com>

On Wed, Sep 30, 2026 at 11:44:59PM +0800, Zhan Xusheng wrote:
> lib/vdso/gettimeofday.c is built into the vDSO, where linux/bits.h is not
> available.  The next patch wants BITS_PER_TYPE() there.
> 
> Move BITS_PER_BYTE and BITS_PER_TYPE() from linux/bits.h to vdso/bits.h.
> linux/bits.h already includes vdso/bits.h, so its users are unaffected, and
> vdso/datapage.h already pulls vdso/bits.h into the vDSO translation units.
> 
> tools/perf/check-headers.sh tracks both headers, so update the tools copies
> in lockstep to keep that check quiet.
> 
> Suggested-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

> ---
>  include/linux/bits.h       | 2 --
>  include/vdso/bits.h        | 2 ++
>  tools/include/linux/bits.h | 2 --
>  tools/include/vdso/bits.h  | 2 ++
>  4 files changed, 4 insertions(+), 4 deletions(-)

(...)
