Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D95316199;
	Sat,  3 Oct 2026 05:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791006894; cv=none; b=r5tk7BDW40xki6c8F0OAc/LLbgQPIhkw0q2I9YICiuoS3DreUVuzEIbb5rqL6VxQmcX7PuBcZZ8fjFMyhYPK6bbXkJtZAK2OYgHA0ia8VIHxqQZW2CHrwGLmNqy+X409tem4fMR8B/pRIICfQyNA8x/ucSIdQ2GS6ylF8RHtcZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791006894; c=relaxed/simple;
	bh=pBVaazfsOgQUhNE4jetxze/7ImzN/WV5t34Ez+Q0a8o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kldwJjTo5uc0VXJK/AI9cJr07GepSf1XL6kXjpX1zkdrxOwG3xb8pgmdoeJnWUgjHw0gqAu8AAYqUMWGOIcFoeLH7VjTBcdbzCuTG7wy/KfBEe18L5VXbG5858hUhw+BxmAZ2YOMCmQE2TtA+OF+NE18Wyj0t6eDa26DFj2/2f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PYRyBF7k; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PYRyBF7k"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C1C0C408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1791006891; bh=r4tz2s61jLw4rL5doVWOTkTbvCNqhKlHwxJlvi1SVMw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PYRyBF7kD61P5LKbi3WQznMIteoo09sS/BHRndJyavZ12UVOsalg2W4Sv89PsbFUE
	 yA9gfbqNYc/HVrBK9arPkCaY6t8aa0eSh/YXNCJx6SJEdTCcCcw1CHF7tZqFtwspuc
	 WGotVA2IsSYUqZPC73y9qo/9/PCjLh/Oat477DRPCjOg3xqgIVzXMU5QvItFzfqsiW
	 6GYR48bbWwm1fFmpAaS+5pIo/K3So3aFH2gX0Ht1Xni6eqOMWs7HDKpJlwKCmhFE2M
	 YL7ytlalA+p+HPrQZyJ9eRbF/GnWoIqNr0S34Ve+wBA5HhGT4WY5szRiGE7yVO7aQ3
	 NrfyCb9W1SK3Q==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C1C0C408FF;
	Sat,  3 Oct 2026 05:54:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mark Brown <broonie@kernel.org>, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=
 <mic@digikod.net>
Cc: =?utf-8?Q?Iv=C3=A1n?= Ezequiel Rodriguez <ivanrwcm25@gmail.com>, Linux
 Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the landlock tree with the jc_docs
 tree
In-Reply-To: <asBE2fWPEmruN_dj@sirena.co.uk>
References: <asBE2fWPEmruN_dj@sirena.co.uk>
Date: Fri, 02 Oct 2026 23:54:47 -0600
Message-ID: <87wlrzs508.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mark Brown <broonie@kernel.org> writes:

> Hi all,
>
> Today's linux-next merge of the landlock tree got a conflict in:
>
>   security/landlock/syscalls.c
>
> between commit:
>
>   2ef355c4e6864 ("docs: landlock: fix ENOMSG condition in create_ruleset kernel-doc")
>
> from the jc_docs tree and commit:
>
>   dfec62ac8b246 ("landlock: Enforce namespace use restrictions")
>
> from the landlock tree.

Hmm...I'm actually not sure why I took that one, to tell the truth;
probably the best outcome is that I just drop it?

Thanks,

jon
