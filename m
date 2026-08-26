Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC2C47B425
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762582; cv=none; b=pBBJIOJww6kn4AKzr06cXpD8qdFAM7MDAD0eeYLJC1XXmRDG2d71EkKtCRy44dVWXkxUuwFHe4CBpjQu4EbZ0YObTlnMaNr8AvuliY1Hbo+3jMxZLyChnVPuy2mnZ/aaTpqEXpy76FBzvPpdfhl8z1Rxn47dO4GhSCCXFRPRqFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762582; c=relaxed/simple;
	bh=tMlVS7ez27AAedNuZYlkXqOdikY1kuZl+Wcz3Klh/LM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PtaHs9wcPzX3dNxwCuSJcNzSxG0KJbBLbsi6z+2RQdTlnHV0FwCK6UNN1tk5DgpB/ctjv6M2zzFKoj93khWOV8K8UacNVvIy/hSwWmUAnUdSihWizr2ci9L7LqtVIIV5UzWiNRKs/xGS+SeWw3SW+hHPDKeHH7odO3RF+exiZDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fu9mhz0a; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fu9mhz0a"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 40E10408DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1787762549; bh=ZW3u/OmKgF5WTbfyZWzZlgBKqLhI67M0YrULxqFtpK0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fu9mhz0a6R9c3SDC8sLuroCY9eGc1CoybfzsRZwI5nfd9B+6pUlAwfpF4RPvXl9tE
	 NOSwfqJuRVuHErcjO7LcpjpKApDZBV1y/KWyDpOUOKODNC62ZkQPauwnA3kNssYhJE
	 uQXNTnNqyaSIV7w5MSTzWO94HUUTowYhVVJV+EGw7fjGY2/f+kgQc2/jd2InoAh1F3
	 FEL24BdlVi8jB5oxiyQ15wTJcJhEjoe1ok1qXOzbYzZ2i7lEHjfHXVPRJZ8r8PCnAg
	 S6EQEM/pVIA5y1uj2QYOQIKCC0ijlZNHIV+UgYbKfqAhKLifOuAnHPyF0rkzydk0AQ
	 PdS5ShKMYCU7w==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 40E10408DA;
	Wed, 26 Aug 2026 16:42:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: 3237174131@qq.com, linux-kernel@vger.kernel.org
Cc: tglx@kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] scripts/spdxcheck: fix file descriptor leak in
 read_spdxdata()
In-Reply-To: <tencent_0D1CF77320A0C199EB46300A4E82DADEA209@qq.com>
References: <tencent_0D1CF77320A0C199EB46300A4E82DADEA209@qq.com>
Date: Wed, 26 Aug 2026 10:42:28 -0600
Message-ID: <8733w0suiz.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

3237174131@qq.com writes:

> Hi all,
>
> This is my first kernel patch. Please let me know if anything is wrong.

Sending the patch as an attachment and the lack of a useful changelog
are both problems; please see
Documentation/process/submitting-patches.rst for information on how to
do this properly.

But, beyond that:

> Signed-off-by: Xia Zhoxin <3237174131@qq.com>
> From: Xia Zhoxin <3237174131@qq.com>
> Subject: [PATCH] scripts/spdxcheck: fix file descriptor leak in read_spdxdata()
> To: linux-kernel@vger.kernel.org
> Cc: tglx@kernel.org, gregkh@linuxfoundation.org
>
> Hi all,
>
> This is my first kernel patch. Please let me know if anything is wrong.
>
> Signed-off-by: Xia Zhoxin <3237174131@qq.com>
> ---
>  scripts/spdxcheck.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/spdxcheck.py b/scripts/spdxcheck.py
> --- a/scripts/spdxcheck.py
> +++ b/scripts/spdxcheck.py
> @@ -72,7 +72,8 @@ def read_spdxdata(repo):
>              exception = None
> -            for l in open(el.path, encoding="utf-8").readlines():
> +            with open(el.path, encoding="utf-8") as f:
> +                for l in f:
>                      if l.startswith('Valid-License-Identifier:'):

open() returns a file object (*not* a file descriptor) that will
immediately go to a reference count of zero once .readlines() completes.
Garbage collection will then clean it up.  So there is no actual leak
here.

Thanks,

jon
