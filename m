Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628545;
	b=dtBRFyU02RsT+gumko4qwNTIWjTJ234sOjH1PdJaBMW7gKuQiV9zlDE4YSrAZt9tx/7n
	 MgVIWbDUDNVSe4Qb+zciH064MLoqAs+BVZs6HfCTnIE62ING2R6pjBZJ+kX9fEU6wpr90
	 hQJFj5qfXmO6SXJiaOh0gQnMg1uekwNzaK2jlwtTmdnYHWhysNswNwSzPnXzZqEhyvMm9
	 DUkdVPLIDHCenFwNucecIXSkOtyDYwyBnwjueC8ly1hpvHhOg+B6SbIi/U//J3NnLPqTd
	 k9cw1JSRw8NckRu5tZfePzrjt+h9a4zjgoNsjommHmfwBSA8pFux7TvJcRbUoiH2UaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628545;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=CAqyXnbatRIxBUPXJvLgl/1tUTrqCnGhDWrCSybeMNA=;
	b=WCxya4Ryljz4E9dFm+jgycrptZO6sJ2Ta9ngAZe+5qLNpguLcYiUPcbo+yENE/dKAOMI
	 g4PfgjNF76nwx9aLkksZ02uTiIKyG1YDXY3TvTd2pNtHLnNpM8HQF6aerHJ8+nSMqGaFy
	 utbSlUHIxjpR+9WKWj6AMayBriTaAE15gbGb7EgtP9fggfDv4TxudE3AFBFXZKNZ590fC
	 Np6JbmIO6K257vpvpFFFNb6sYfmNML0skeNExWWL0R346c3X6g+APjCAq+nehHv4IHPHf
	 MES4iyUVJGG+efTOiP44REgruzwpmzIRvduaDTOEE4iZr6sFXPsVEjx89lrGSoLyeSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pp3sXm0F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6621A606A330
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pp3sXm0F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7614D1F00A17;
	Mon,  2 Nov 2026 14:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793628545;
	bh=CAqyXnbatRIxBUPXJvLgl/1tUTrqCnGhDWrCSybeMNA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Pp3sXm0FP88M4Sm8fdwJyOMcqW5njt/E9BvOYvZGoviOANrSz4h9+jKNCvQtFB4tp
	 TA30EulLuVSrRS3OwuLumTH2C6UoQjEfSdq7j2Uvg4wHQsIIHD4o+1zJrm48UNBces
	 xdiYh0IYpl9+728JnO6jHQO8FHXRVQSslpuPiMRiC4Otx5JK2sOkqQrNjN9aSEHZvh
	 OyNij775rr9i7pr0fEsjKicWnOKCayUVV/ar8E7JuvDjtWgHGhKc/S5s3extQ1qI3k
	 GOu/Ue03yr87mHA+J4SOlRMpgjm7W2+YBJWVqvRcJQykxfJC6QoyGUczghVw9Gb/0g
	 uesWC1wF7/wEQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imre Kaloz <kaloz@kernel.org>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20261013095046.6006-1-kaloz@kernel.org>
References: <20261013095046.6006-1-kaloz@kernel.org>
Subject: Re: [PATCH 0/2] w1: Search the SGI 1-wire buses only once
Message-Id: <179362854400.191254.16898815548578297050.b4-ty@b4>
Date: Mon, 02 Nov 2026 15:09:04 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Tue, 13 Oct 2026 11:50:44 +0200, Imre Kaloz wrote:
> The slaves on the SGI 1-wire buses are soldered to the board, yet the
> w1 core rescans each bus every 10 seconds, busy-waiting through the
> time slots.
> 
> Patch 1 lets a bus master set its search count, and patch 2 has
> sgi_w1 search once.
> 
> [...]

Applied, thanks!

[1/2] w1: Let bus masters set the search count
      https://git.kernel.org/krzk/linux-w1/c/c6c851e7499ebd075590a6c1ed1a707cf05f4058
[2/2] w1: sgi_w1: Search the bus only once
      https://git.kernel.org/krzk/linux-w1/c/e8bb5d130f2592632897aaa8e4e05a908a4847d6

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

