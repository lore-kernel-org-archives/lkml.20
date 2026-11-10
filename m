Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794350699;
	b=VH4WEFBnoIToSWT0Wdx6LB0vKdziTbOslEGUq9I+oNNMlVqmZLPFCFyDn+dKmIK6c6KD
	 vl5n+q6Ia1cxZdJOdtQ1mwK4I+ivkztesxl4gQDGfelSSE9AwqY8agL5t3KVn8MvpDWst
	 paBhJCY24+s3Fs2BVLciEnyu2Z7jxthbvWGWQDI25Jqlwj7JEw5Q/NxWEAxaRxQyMc8zS
	 YRaA5anFL0ouj/tpQKk/QaTyctGvCoOqFxvlb++Jbv8ULBAgEtWuLT3/slyBDGaEKvzLN
	 plFy3OiRL6Sdbg36mljE4ViaQJTPC8QsUNUR6ZviSLdtd0HTP/ceXArb/SKJxV7OU9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794350699;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=akEMPsJB9+AibNGEOvtl6pJKQU1yi8jmiVK983AjHS4=;
	b=LhZut9snacaYFe/4UDi8r84DlQcaZLAwDR3EemM1F71dlkt+ROYopGY5MRTSGyhQ1Ww2
	 jSAvpjiTJwSWKqZnZUd5Ea+dsOjGNuHP0yrisuEFF8MtHeTM89szJQ2I2Rca3x9KvHFDh
	 USXfIJVDTwf+03Xgk7S/gmJVAQT8kcwlVj+k8Yrm9ohSvQKE7GE3uksFKMMouJXzs2qfy
	 xZDRA0K9csCmsztmKjRzi5xxgQ5nT2JacjE1tJaTCslIWvoD92SE0gN+K6KOrPT65euNI
	 JXaRgBy6YBIyQ1YH0zuJ7u/oaJ/Elz/i4oi178VHhhB13Z0auDZq9yAM6izgQ6GIpCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cbSPmiLQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B24606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cbSPmiLQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2631C1F008A2;
	Tue, 10 Nov 2026 22:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794350699;
	bh=akEMPsJB9+AibNGEOvtl6pJKQU1yi8jmiVK983AjHS4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cbSPmiLQR1y7hmFwvYRp1W+dD3VaFO8QTfcQMgkv0p3ZWt8AgWT8w8k+CI3Oqla+z
	 uNBZbqy9sBEymrcc3n2DziPV3QOWfUfbZ72eoC6SKN9nVK3lGwy5RjvBhmAlOqs9Sh
	 VTA++Kpf3gXVekGoTdui5HO1a1zuD7eyZRpobCC7HkXmA+KGFPBmlE8q41ICXzZ5Qz
	 t9QOrxv8KwkJp7CDewvgtz2NyppoEdueGF98bpVUOHUIghSTP+bDGrFKK7T6Mr1A7C
	 e1DYeOvqHejASBWfLBAZ0tQnOhgmy5gowH/LqhmhqM8+sc9h6zbVI3Y2ZEV2cyWbTc
	 csfxvMOutWKyQ==
From: Mike Rapoport <rppt@kernel.org>
To: akpm@linux-foundation.org, baoquan.he@linux.dev, 
 Dave Young <ruirui.yang@linux.dev>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <avFSU0f0aE-amdls@darkstar>
References: <avFSU0f0aE-amdls@darkstar>
Subject: Re: [PATCH] Remove myself as a kdump reviewer
Message-Id: <179435069079.425130.11540887283084366426.b4-ty@b4>
Date: Wed, 11 Nov 2026 00:44:50 +0200
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
X-Mailer: b4 0.16.1-dev

On Mon, 09 Nov 2026 12:55:47 +0800, Dave Young wrote:
> Remove myself as a kdump reviewer

Applied to kexec-fixes branch of liveupdate/linux.git tree, thanks!

[1/1] Remove myself as a kdump reviewer
      commit: ab75132e99eb0b7dcd3a1882e35519f8229a669e

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: kexec-fixes

--
Sincerely yours,
Mike.


