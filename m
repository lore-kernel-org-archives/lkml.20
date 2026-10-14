Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A82312836;
	Wed, 14 Oct 2026 17:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997322; cv=none; b=tURgQEKAu1vuDkFd/mXrFzxCrC23YFHu+Zzi7NmfzIamO/lgM/misLsc5B4GWMQb8JeOGfdSYaDv41TVSqBkIOnSlNo6Hw5VgsVSZ4WrgKSwrfYBnLsUMr4RX0wUQO5OjZj1HtWqzpuZKNaNRqgGU7IOS0nndnfYimo71LBBPNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997322; c=relaxed/simple;
	bh=FHuEQlrJeSyFCnx0Sl6KYjcJChvZI4aji8nSCtEbPo0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RyvorHOOuqJNpLj03rS73PLfbE/rUVzzcsdjiNMSp/DUUw/BH9VMZaegWbuUeULD7EWoadoLxsdSWbCR7aEKjEc8er1o83nMTsdgiJ4d+c+MjzdHGm3nW7BSojR89pckKRZU8Wf+xyQeSY5wfTCXsAXF1VzZZc6xgkVfiU3AG3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=eT7p6b1I; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="eT7p6b1I"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 71E87408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1791997319; bh=r2IDnp5QEPh+48VvYTqPgu9xOpF9QcmZVlg8exZ1OMc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eT7p6b1Iq6jlbv8lusfy3cx/LuCOugso2dpGUqWtXa2Ywjsbe2EK+UgVy2a2teg2Z
	 1RjxIhjytkIIFHxdjk60zKDUc8I9EgPXNRSXhbQmXRaAHwqhUB4YXZfa8XeuP6Pids
	 fLQ09QC8HL/sA81PXhmyTVd12S07//AhFXFIOkFdoL5V/wPI6McXA8/7Zb3CBJ1iKM
	 bryuAbYx8xE13ndyWetLSqIbVCeBoTcOxGtFl7xQhCS+eck6Y7a1rnfzpUcl713+Is
	 kNJbaN2l9kgyKZJZGnsN+zy/nPEqRj/iDsXUsrnQFpPJypwsIR24ZZwd3B/EySFT9L
	 jm+U/5Zp1OsBg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 71E87408FF;
	Wed, 14 Oct 2026 17:01:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akiyoshi Kurita <weibu@redadmin.org>, Akira Yokosawa <akiyks@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Akiyoshi Kurita <weibu@redadmin.org>
Subject: Re: [PATCH v3] docs/ja_JP: translate submitting-patches.rst (review
 and report tags)
In-Reply-To: <20261007004715.107860-1-weibu@redadmin.org>
References: <20261007004715.107860-1-weibu@redadmin.org>
Date: Wed, 14 Oct 2026 11:01:58 -0600
Message-ID: <87fqy8w709.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Akiyoshi Kurita <weibu@redadmin.org> writes:

> Translate the section describing Reported-by, Tested-by, Reviewed-by,
> Suggested-by, and Fixes tags into Japanese.
>
> This includes the Reviewer's Statement and the guidance on adding or
> removing review and testing tags in subsequent patch versions.
>
> Keep the Reviewer's Statement in English and add a Japanese tentative
> translation in a formal style.
>
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> Changes in v3:
>
>  - Use the current Reviewer's Statement structure from the English
>    documentation.
>  - Make the Japanese tentative translation a literal block.
>  - Remove reST markup from the Japanese literal block.
>  - Translate "statement of oversight" as "=E7=9B=A3=E7=9D=A3=E5=A3=B0=E6=
=98=8E".
>
>  .../ja_JP/process/submitting-patches.rst      | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)

Applied, thanks.

jon
