Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762867;
	b=Rth3Q/RvmkOk2jSEfEqxWrgJWjyow3Jx9SePBMFWByxYtMyEjeDyleKnV8zGiEbDa2WN
	 VN3/n6kdc7QewL5NaEKsWUKSqNMD2srI7om1OxIH5THDG4t4caep/0vPwpuSqe5aBrNk1
	 98Plg9Nllm8JKtKI9s0DhxpveynWFIfnbnebDWdG5ylSXuVXoYtO0DHnKE/yld7xmd+NA
	 7nWT2/OaXI4to/TyblE4VGrM6wlhoMzMx02qrArXG+qYQpOS3f9jgFGITNnmm0vNwFqJL
	 zaKeVoA7O6tH2CXm51CPP5wBQxWTq0ZRl6HXPJBcYKCJUeUvu32tZy2CMB1mUx5gvvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762867;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gyyem6Fv3lVi2NFTG0OtQ98bvwiRHDvRhsGp529IoMw=;
	b=CoPxDGh3C30dcYe3XYzb3tGgvGgx4GMPzXt4yh932sImP2FvI4tLB9UQ5q+wKy/DUxj+
	 BbXgTfIPN905vfoc6Kw8xqnwaqTGlZkCSzPpsf78MbQUJhb+DaD5YSEMVZS0ii24jQVJy
	 74o5MdC62qNG6W7f16NiwJpVzTB0d9cld6i0t/SGG73hVAzK8tmmNJ2hYYdwGDZgl4hvT
	 U94/DCwMTQClZidiFQnlkBB0xZQKmIJWDS2mbRuomIv66XquxIP01PVyYDFvV3gFC7xVU
	 cStS5amwh4Jm3+26X+9q8/iRy1WlPXciQm3C/l3DUorG4+D0RZj3Pm/oVd+HULAsY5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=AyIrvq2V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C136606A31D;
	Fri, 23 Oct 2026 13:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=AyIrvq2V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E98A1F01825;
	Fri, 23 Oct 2026 13:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792762866;
	bh=gyyem6Fv3lVi2NFTG0OtQ98bvwiRHDvRhsGp529IoMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AyIrvq2VGoEdxNxf/YQnLIWL8BtVh2nVEE+5Na1RJ4DPhW4nP/6QeC9wETlVkB7wA
	 juV1t2Mb8mH+iq+0fL4lENuid4zqBLnKqSaiDwf58/HDgOFSTFuwt7qyvSL3JkOpkn
	 EQWp604lYyu3g89S0gCMl6kEm7tlnHyQCarzPxVM=
Date: Fri, 23 Oct 2026 15:34:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Timofey Zakharcuk <timofey.zakharchuk.research@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Subject: Re: [PATCH v2] staging: sm750fb: fix resource leaks on probe error
Message-ID: <2026102351-activist-quantum-3e31@gregkh>
References: <20261003175055.1511-1-timofey.zakharchuk.research@gmail.com>
 <2026101326-pectin-decent-7407@gregkh>
 <CAOm0KL_gbV=PY9DzjcsgqUOUjRK=vc--3q0c6LD_uDfbD0AFNQ@mail.gmail.com>
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
In-Reply-To: <CAOm0KL_gbV=PY9DzjcsgqUOUjRK=vc--3q0c6LD_uDfbD0AFNQ@mail.gmail.com>

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Mon, Oct 19, 2026 at 02:46:35PM +0300, Timofey Zakharcuk wrote:
> hi Greg,
> it was found by manual code inspection by noticing the asymmetry
> between the resources
> allocated pci probe (and freed in pci remove ) versus the cleanup
> performed in the release_fb error path:
> 
> it was verified with checkpatch.pl

That verifies style only, not anything else.

> i don't have access to the physical sm750 hardware to test on real silicon.

I will have to drop this until it can be tested on real hardware as
obviously you are changing the existing logic here.

thanks,

greg k-h
