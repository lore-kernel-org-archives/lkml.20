Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BA0496D4E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789072050; cv=none; b=m+POHt7hxgFf02epUAGkZes9vuuO1mPz/C4S4P+oCEDS6FEhqbipIHMh6VsD1l+eNErn8pqrDF5WxqnGaPL34eNVIot7utHY+vmhFYRGf+yPXE2HjNbqwxnzc7+2jqsfY/kK4ndf3yDavaoIHh4BBfBaCPE5RHgc2Z2s7MVjuwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789072050; c=relaxed/simple;
	bh=XvoPw/+1g4GThZaoDlcAPP28Aajw1FYDK2p3nevInQ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k59ElD4wMZrGS4XYifqc6pwjdQVgytJOvl1EDLjo+rIKJ4TtiQJM81TvpbqBQgRSaWPpn3RzyCnRUfdU/hrVsD1z+0ZAMEw/yVZTs4DoaaVg5eQL8MXLCErqtR3MLyP8N3o+PzxWFijhPQlV3fridpJ2Ijc5TcWxZpXTm9XGwOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cWFDD15C; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cWFDD15C"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3A7B7408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789072044; bh=XvoPw/+1g4GThZaoDlcAPP28Aajw1FYDK2p3nevInQ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cWFDD15Cai31dWTc7mYf1cWDllRRlD1Q7/augOl2OVtrvs5BqGQuQ8ouYbehuOx+f
	 9PmsiusfVhJOUEThWSmwKQcfvYTzUhWwTZDTzFhQET2coqUD7BeRoyp3QwGoh3jq+8
	 cdmsUVBnm4cEoMcg7kzP8spJvsSvlFQ2NPq8PlyP7LtoIZB9frC+faHogR2kqYA7Y4
	 08Au8+1dLRL8UPkLHXCeRMu//XlL7IiPTxKOqeKBR37uknoR9CxxOzF7cjFjdHNwBR
	 rW+WNHZlZyUb9LThWVBq3SRVXIw0eb9E4w6D6RLQH0yrVocMBiJtgUjXEWy7Cd0wh1
	 gAv8WJFkzTKeQ==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3A7B7408B4;
	Thu, 10 Sep 2026 20:27:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?B?2K3Zhtin2YYg2KfZhNmF2LfZitix2Yo=?= <ha2020anan@gmail.com>,
 torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Add general reviewer for arch/ with flexible
 alternative subsystem assignment
In-Reply-To: <CANai08NF1Ghj7fwdjppqVgb0HVCOhpetAbdy4r=3ZxcTzm-B8w@mail.gmail.com>
References: <CANai08NF1Ghj7fwdjppqVgb0HVCOhpetAbdy4r=3ZxcTzm-B8w@mail.gmail.com>
Date: Thu, 10 Sep 2026 14:27:23 -0600
Message-ID: <87a4poj1hw.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

=D8=AD=D9=86=D8=A7=D9=86 =D8=A7=D9=84=D9=85=D8=B7=D9=8A=D8=B1=D9=8A <ha2020=
anan@gmail.com> writes:

> I am requesting to be added as a general Reviewer (R:) for the arch/
> subsystem in the MAINTAINERS file.

Nobody is preventing you from reviewing patches at any time; just do it.
Recognition in the MAINTAINERS file generally only comes after a
demonstrated history of useful reviews.

Thanks,

jon
