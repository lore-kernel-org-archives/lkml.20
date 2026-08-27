Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BC22FD69A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787801986; cv=none; b=WNw4HIa/Ql7TmbKkB3Q7N3HQw6BQKqHauHpUSpgdOb7myYylbsfOlSnpelGlVThC2dQ4LuKnVEl8LJW7GO9HrJ86LopAfARkG5a+he/MJk3LE01iCI+OpC8mu3luulIm/i8LMgy/QJpKt+5QTlPZIK5JpEjUd/zlMfy+y02cCZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787801986; c=relaxed/simple;
	bh=WTssfn9m212ec6TuPhTSGIgtmfO1EfVL+491l/ZXSs0=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IM9ggFGwPrJfUzanGX1KooxqnoMcRx6/FkVDJxdEIAEcTQtb7kFefrQxtVERvp0ad2pOVwg/zLoHpIxHJTh4puNK65aTFZw5DQWC9NNLQiSY/lq+E/xEFFCa7sfE+x015q1SEmm7ni1JfRihiprsYFSfvqNPorjSnOQCcmt2/m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fur76tLs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fur76tLs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05DA81F000E9;
	Thu, 27 Aug 2026 03:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787801984;
	bh=6Sbv1lPOHsKI0SbemAvzpnjd3AMXsypdj2b6qA+OQtk=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=fur76tLsou539OlHWRlqQAj47SSzQsRc/2C4mqrF3pz4U1vaMdtOarOEvXRFXO4PC
	 QkQWfqxSNbwNlXIFWGx7dGLj7VlYDPTKJK+37Raz1ZwsdCcEch3VaSh421vGuYq8WQ
	 GhG69G7rkEXs9QzRN+dt5NWb2TGGB5Tqn1nkJRZbAogEpinhklYgYm5RyIA8xbjh6a
	 Gxl5NyoOkW/bVGtHhWQIi3yyYisvnfTgveRUNHAPYB2uf2fQM2oCG+e7qsYKbefUYw
	 +yz+dKJ6zFxqIE33t+/sjTZOz9qAc7ZjHb/zDItOkgRhGOpDRokZFT46FyO2uZJgbZ
	 giWnMJ0DpTxnw==
Message-ID: <ed48c7f2-1649-430b-a2bc-f44d1d80a632@kernel.org>
Date: Thu, 27 Aug 2026 11:39:42 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] f2fs: avoid underflow when counting free NIDs
To: Xinping Zhang <zhangxp1998@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <CAH=xXfFVAwQ3r_NdUDtmXhtg6Lw8kDWoNTzGL5oy4mwHMsJLJw@mail.gmail.com>
 <CAH=xXfG2Hzc-kNAPqEUsTJ4hwrQ-gYEnFrXHGxL7qpYpggkLUQ@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAH=xXfG2Hzc-kNAPqEUsTJ4hwrQ-gYEnFrXHGxL7qpYpggkLUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/27/26 05:39, Xinping Zhang wrote:
> __count_free_nids() subtracts the retention threshold before checking
> whether the cached count exceeds it. The operands are unsigned, so a
> smaller cache wraps before the result is assigned to long.
> 
> The PAGE_SIZE-derived threshold happens to make this an unsigned long
> subtraction, whose wrapped result becomes negative when converted to
> long by supported toolchains. Do not rely on operand width or
> unsigned-to-signed conversion. Compare values before subtracting.
> 

Cc: stable@kernel.org
Fixes: 1b38dc8e74a3 ("f2fs: shrink nat_cache entries")
Fixes: 02110a4fd531 ("f2fs: avoid casted negative value as shrink count")

> Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
