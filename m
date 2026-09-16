Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1765912D1F1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561363; cv=none; b=GZQ5+ynQ7nPFsCKrK6RgG9zR92DGV4gwjoFvKYHnjfmwfIFsFxfnetZ4t2LCCq2et+O3orfXLBYIXb9SXnvEDZ2YSUgqWpZxsE/CKfT3wn89Lh/GY3aTx1vcVmh5EqznbR3kLWjsJNWeabvtq18O+qruMMmJt9cydMSEFrGnFkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561363; c=relaxed/simple;
	bh=EVdB+l3be6WahWsNVgejHIAOXNOl+97d/b2kOxsguvA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jSn2azErRQgjFKBNyAqKq1AHSGTcJDMB9lAwkUIlLd9DzlOWhkw7Y3pFiRs/vM2k0T2sgyN9J6N+xzs4a3ig0meV5SePvusEjD1ocB6FclvcM7p/2QS+TnaF+6Ty2WFyDXSvYgwTHbtWb7sAnt+hthhKmfn7VIEXcOsjL73K0hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=KyukPwmJ; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="KyukPwmJ"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 3FF83CCFC6;
	Wed, 16 Sep 2026 15:22:39 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 3FF83CCFC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789561359;
	bh=EVdB+l3be6WahWsNVgejHIAOXNOl+97d/b2kOxsguvA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=KyukPwmJ0E9wNpcGGAbHVp01rhvpwHebMrteMjAdOxx0yV17vLIexgJAhLLwSwTxq
	 Aav0IY42XZJr4OZLBaRBHfYiOophdhCgJ9iKSsTNdezKNgDBCUKFZawmAodthZymsx
	 bCutJJ5E9obEcZx7pJ5yJQ/c8XlTw+QlDp8LA7XZdx4rGG5p5aCay3NOOTDDY3uv0Z
	 hBLJlDCsX1tPCBPfXqQxr9u/PFwN947AzFdw6B6UHkYo9H2jAOhlSyKKJj8ob5SeSn
	 DzMOZvAZcZ/AWTQ5e7u+7gJ748odXOB9W4gofH32fQeFzP8v2/78QziE0adWm37Iy1
	 XvoNDiH+UlIiA==
Message-ID: <d40ab90590f63fc70784c510c0eb430223d73765.camel@rendec.net>
Subject: Re: [PATCH] irqchip: st: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
From: Radu Rendec <radu@rendec.net>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: linux-kernel@vger.kernel.org, tglx@kernel.org
Date: Wed, 16 Sep 2026 08:22:37 -0400
In-Reply-To: <20260914090850.897017-1-triet.hoang.dev@gmail.com>
References: <f2acee4027dfc48515091bc75422d52494ec7547.camel@rendec.net>
	 <20260914090850.897017-1-triet.hoang.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-09-14 at 16:08 +0700, Triet Hoang wrote:
> On Sat, 29 Aug 2026 15:40:50 -0400 Radu Rendec wrote:
>=20
> > Thanks for the patch! The patch itself (the code change part) looks
> > good to me. You can improve a little bit on the commit message format:
> > =C2=A0* Please realign the text to a 72 characters line width.
> > =C2=A0* Please avoid using the first person in the second paragraph. Fo=
r
> > =C2=A0=C2=A0 example, something like "This allows dropping the..." is b=
etter.
>=20
> Thanks for your review! Should I send the v2 to improve this?

You're welcome. Yes, please send v2. That will bump the patch to the
top of Thomas's inbox and also I'll be able to provide a r-b tag.
Thanks.

--=20
Regards,
Radu
