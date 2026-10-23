Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792767815;
	b=qJrfnjJerj/uyscC8gGlemnEXITNh4E7O/qwFynbycgStXoYCByp8/Xq3xnwiS2Yfx5r
	 F7doB6/myxe4o6imvl1KeNWNF+KbSxYgLMozQZw1cdZSlOxkqc3UOg3H5xvdm2OHLLXsL
	 uCQ74B++yiP6Shi5Mn7SpT8TUWN+4awCsCmTcpTKGX8IumDKIWZz0c9peuXOiI9s1Hd4+
	 khrTPz7GXwwoVZ7GG23RTRVALPQyRe43Jw+j3v5n6YI0OPkwYUPMCmh3U4kEjfvhvOMyO
	 Ze3Mw3KZnx5JvUYwrZ+pOxGKuJrCHpNeZ1nl1JHlmlkNDQ6GMBwVaNdZ4JkFrWx8MaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767815;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=BBmchvCqGj4CsfCYm3jgo2XmGMieZ81AU7UvffIeeL0=;
	b=SYA/sSfnkajVd+YJLg10KS53bA38SSxLW97Dz40K4l7nuiQe57MSNSJOA6NB0XKqbkAR
	 2yigLJXE1Q3j31MxlB2KiTWiMqVLR5BB6SjXhYE3G7YjcjxSWTKmSAH/iumS50AAdfNOY
	 wYXaIVRPDXqrvQGy2qSUIqY6RMiO0RXu1YgUj+gOH9SUz6EqSzL9NOg+Q3WRzlZ2i4BOC
	 kmuQj4H5SCXS7jklkf3LuuFoewcud1eMabF2mz4mYbA3pa985acWe4lp4zUrvrNnWSPm+
	 4JCl/nKLPRFHFycM8YT+LTo2G3ecouQUTJpSECvVBlBDZbuGwsw1Xc+35iDti68t60A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=RBdX13xB;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB92606A31B;
	Fri, 23 Oct 2026 15:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CB92606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=RBdX13xB
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0DD0040915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792767808; bh=BBmchvCqGj4CsfCYm3jgo2XmGMieZ81AU7UvffIeeL0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RBdX13xB95iXHyuucPEKbEKpnFAN8zA3RKggzAq62mBaPNAhJyTbpEWp6XgGAQ3XD
	 qfWKky2rJ+AmNcE5hJYVrMAYLdBubnY1cdy5UJMfgBPaFEffU+/v/LpSQdDceBHda3
	 pKei44g30FqMbK+Yb9r3goZvUyre4VGQBPmZRuOHzp6PRVZOYO30qmMA2bdETY6YTi
	 jzs0R8gaiEoVo9nowREyOtf5k08HMOOYKtIQRK7g4pVAe9ouZXRyswWlD2jv6INI1G
	 4OjazTG4j6ICQfBt9JzrA/rpOdgUitF7E3bm+3AJNxuhxrseZpVgI3DNjr5GHLE+sH
	 QjgBXHgnUbsoA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0DD0040915;
	Fri, 23 Oct 2026 15:03:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Halaney <andrew@amutable.com>, Christian Brauner
 <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: Re: linux-next: manual merge of the jc_docs tree with the origin tree
In-Reply-To: <attxYMtvBc5AMf9U@sirena.co.uk>
References: <attxYMtvBc5AMf9U@sirena.co.uk>
Date: Fri, 23 Oct 2026 09:03:27 -0600
Message-ID: <87y0boxxvk.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Mark Brown <broonie@kernel.org> writes:

> Hi all,
>
> Today's linux-next merge of the jc_docs tree got a conflict in:
>
>   tools/lib/python/kdoc/xforms_lists.py
>
> between commit:
>
>   fd0349aadbb99 ("pid: add helpers to operate on a struct pid array")
>
> from the origin tree and commit:
>
>   4180abdb5d938 ("docs: xforms_lists: Handle DECLARE_KHOSER_PTR() struct members")
>
> from the jc_docs tree.

Interesting...I'm a little surprised to see Christian's change to the
kerneldoc tooling for the first time ... oh well.

> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc tools/lib/python/kdoc/xforms_lists.py
> index 320f977c5bac2,161acac90ea3b..0000000000000
> --- a/tools/lib/python/kdoc/xforms_lists.py
> +++ b/tools/lib/python/kdoc/xforms_lists.py
> @@@ -45,7 -45,7 +45,8 @@@ class CTransforms
>           (CMatch("DECLARE_HASHTABLE"), r"unsigned long \1[1 << ((\2) - 1)]"),
>           (CMatch("DECLARE_KFIFO"), r"\2 *\1"),
>           (CMatch("DECLARE_KFIFO_PTR"), r"\2 *\1"),
> +         (CMatch("DECLARE_KHOSER_PTR"), r"\2 \1"),
>  +        (CMatch("DECLARE_PIDS"), r"struct pid *\1[(\2) + 1]"),
>           (CMatch("(?:__)?DECLARE_FLEX_ARRAY"), r"\1 \2[]"),
>           (CMatch("DEFINE_DMA_UNMAP_ADDR"), r"dma_addr_t \1"),

The resolution is fine, of course.

Thanks,

jon
