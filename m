Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E4531D39A
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789934197; cv=none; b=IqiE0tbtv1sNgwPDoqFS0jWkHWHA5wm+ojmgais+6uqoyKmviTQ7dQiSrDo8Yp7ynM6bm7UgDd9lS6w1/ODsEKnzqBVrVBnH3oa9pwPbkOsGrkWrxHhOvONHNDN5uYIume8jHKz5vhDhUAEEcdXhGZuQDqvLU+mmulkWVodzgao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789934197; c=relaxed/simple;
	bh=5EGif0kPteReu4FEo63SSbb6sEw1DT4Y1+qAgkau8gc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LLJGXQP33VO7SWqr4LbAovJKM5BLD0AUIEdxBHcgYRQTVELWuf06QZ+ovqtRv+UEt169Hwk9ofE7wCxqlvd20KXlJDemVPIGq3TQgwh7goctLCZZrVdytEV44xQ3G6qDJtZO9BD759Pe4dCjLiLSW5lZpADMkjXgPqSZ1lZ/JWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSzJUsV4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSzJUsV4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE111F000FF;
	Sun, 20 Sep 2026 19:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789934196;
	bh=5EGif0kPteReu4FEo63SSbb6sEw1DT4Y1+qAgkau8gc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=RSzJUsV40uZ9OQ6MNASRkEc2xi9XfCzPzz9xY3MIRgjao1EXKWVvDeQDmIwJwV7m9
	 eCaJZfZhs7SI/98r5NVDjqfwPq1gXSAiaeMIycqXENN3007UG0BDt9kt+P664YD5KW
	 ZAw8bQJYAvNXhXK/tqhfWohhQBhS6qtqeJtpe2SZJFAsA4hgF0iKgY4kKldqCZ3lL+
	 EhsVUVdJ8Hg6GHsvJgZ8a/zDetTVHiwRBPTKDonhNbJ691Y0xghnUEE0axogVMEkR1
	 a9RNibsftC0xFVrs6iqpZfVAwkd8F5PE+JI+oTBXLIbfNHX5PxEWzVGUxAhCGKhADe
	 9MFGD+wn1jmqA==
From: Thomas Gleixner <tglx@kernel.org>
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, Eric Biggers
 <ebiggers@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Catalin
 Marinas <catalin.marinas@arm.com>, Alexei Starovoitov <ast@kernel.org>,
 Oliver Upton <oupton@kernel.org>, Herbert Xu
 <herbert@gondor.apana.org.au>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 01/13] selftests/arm64: Remove big-endian support
In-Reply-To: <20260918145217.1669-2-will@kernel.org>
References: <20260918145217.1669-1-will@kernel.org>
 <20260918145217.1669-2-will@kernel.org>
Date: Sun, 20 Sep 2026 21:56:33 +0200
Message-ID: <87ld8v7l3i.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 18 2026 at 15:52, Will Deacon wrote:

> Big-endian support on arm64 depends on BROKEN, so the arm64 selftests do
> not need to worry about testing this configuration any more.
>
> Remove the 128-bit byte-swapping helper from the fp-ptrace test and the
> big-endian definition of RSEQ_SIG_DATA from the rseq test.
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Marc Zyngier <maz@kernel.org>
> Acked-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>

Acked-by: Thomas Gleixner <tglx@kernel.org>
