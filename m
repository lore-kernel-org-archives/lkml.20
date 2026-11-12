Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494921;
	b=CQhMMZWl9ifqsKffBgZoUddp9KaJWcOvX2M94BJdEDwgbIUZ9fP6GzJ8Cj1MQ4rlhe3B
	 /bVq0At6TFKnzRHyaf/IUvnQLEh85pn0LqfdvDVb0rypjPxwDvvBbjpizu+C90j6aBVv9
	 v0h9qJ6m10aB/+0kQS1im0S9G7/kgxdWfa/iThYi5DbsrdvfiwAtYLBOj3FK8KAuAEEmJ
	 lllUgMwGzQK+M22FSHNXXr6NwfKIueozvyvu6cVSbUqIXKoJtQ2spkjhiG0mOF4S5vSPG
	 RhmCn2jdAkzczxvKXWImZ1myxKOjiJKPwnQBhTjlXEtNiLkZI0Z5MMqorUy3D39BUQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494921;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=X8IIACO//pLnyNoft075EvxEI1VedbxVA+QpkQ+am14=;
	b=5VSYSRq0eZUTHXRr8n5VILlHZ3hii67uOvwQLbRdp91Q7Z1GnpjaxAVOoknNeyrfLi7X
	 AKaMnbWQL8QwYkylpRGwgHPW/uSILGyudwc3jVAlSyYrwXvHLQfQEGrLgaAXZ4eIWv28P
	 o4ngacD5D1YcXR7/dOXhF+MJNiPOnR/B8JxI1VOUL04xLGTdda4OF9fwofXzmzNAk8/5B
	 VveDPh3WSLSFyR2Bn0Th2FsQaOw2nG5P537ppjStIaKiYk4mcIXMdLHkfRsY94ABhi4n4
	 +gIL9KVU2pOHngfdXPNZemsQ3yLERg7x8RLVvsvPaBITp/iR7AyMtiyNc/bL7n6yIGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=Cb+A75Qg;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D8B606A338;
	Thu, 12 Nov 2026 14:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2D8B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=Cb+A75Qg
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3BB5940904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1794494920; bh=X8IIACO//pLnyNoft075EvxEI1VedbxVA+QpkQ+am14=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Cb+A75QgnDGA5Wt7FdnL0DDTgTAx9jo/pf1OPq/TqEgx467iDTHTsK+PH0QolZggX
	 SwiRZ9YnQYAcq8pnRrLQ5Hh+28FUyHddlQUO9wpLUYe1xXS2YXvAIUq4ev7uTiTh23
	 nzQcDUKDtvjj1VPAnf9PKdX+U4hSxxiAVNnWNRIxiloVsS131nhpH1GgSaG2bkw7PE
	 LxaZKMfYjVm6eU/X/Ab7kDUe6EW7TRBynKcmHo3GZakPiAxMmgMxFonFh4or23Mk2m
	 fqOjbZI8A7HOJ6oXNwflT/OdU+HhZjVnCyR+nGRoejV/SKLvGCoHZkYuzgIcWCw0sU
	 bRrsVh0jgW+MQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3BB5940904;
	Thu, 12 Nov 2026 14:48:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v3] docs: submitting-patches: Clarify partial review tags
In-Reply-To: <20261110141429.149451-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261110141429.149451-2-krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 07:48:36 -0700
Message-ID: <87cxsa6r7f.fsf@trenco.lwn.net>
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

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> Refactoring of driver subsystems or some core driver parts often come
> with change of the actual drivers.  If that happens within one patch,
> people giving "Reviewed-by" tag only to piece of the patch, like one
> driver, and ignoring the rest including the main concept of the patch,
> are not really reviewing "the patch".
>
> As explained in the Submitting Patches document, the "Reviewer's
> statement of oversight" is for patch as in "entire patch" meaning:
>
>   (a) I have carried out a technical review of this patch to
>       evaluate its appropriateness and readiness for inclusion into
>       the mainline kernel.
>
> The sentence is explicit, exhaustive and complete, meaning it does not
> allow implicit variations like: "this patch or part of this patch".
>
> Reviewing pieces of the patch while ignoring the main part of it, is
> much closer to Acknowledgment, thus Ack or at least "Reviewed-by" should
> be followed by '# subpart' suffix.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied, thanks.

jon
