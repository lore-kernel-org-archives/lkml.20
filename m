Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793824001;
	b=4iTqIyLdXS1aU/99WvYNLsHIXkgZ1Qo+I+dFFaBBviqse6OySWXvLEYbMZG/mCAD0HgN
	 iwuVw+X9GC2ES1g9ogTtgR777eR8vGvN5YmuQid4nUoQR1XAqsshqGgb+c2Bsff1ZWM5H
	 dJ5sACrWOrK27M707Mc+DpvrQeN/L4N/56kDleBTUBhV2hDzz9LuxI1aDAYcD/j+4N8gF
	 tyRjAFfB0yHhKhUNpdb6tUYKLbQObNERUwTmDAhw/FQiagIVO5pYkSEJZc8SpMKQHqd+U
	 NafVH3mqkSyajzLJaFj7d26py8TbvuANZ28HL0LaI+6OW2O3vkRXQLcl5tNHMxeZOAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793824001;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type;
	bh=aghPuIRJUWq9GU43IJYTx4S4suWXwLWy5dvY8oh2ixQ=;
	b=ALHe1bQ0yhanBYfTHMJS0sMRU5kMT4A7svNA+AWNaXdgxduyR0vUPOA5XFz+D9wM/R8w
	 zGyK0J/iQReHk/XN/A/TmBnBtm21ELizK8M4qNtLYZOTFQBk4sIvnAru46mcOAtK7w73q
	 WZJ5oW3upyZvRcKAZEu7AINk+3Ogo2smYSKlsB8UlprdyZLa8Tm0XmYLyY2ygppNRfBYW
	 wWLfUAZ96UxEJBwz3qOcS4qi2inu31tHODAmRq9hGsNE3ETIZ+y/C6WYjK24++78BHAzh
	 jw6Xci+6Y5ivVl/Aj+yGdBl+Ztv+aY19UoejJ3bHYz6xiiax++vNVTJ2uWiagDwvZvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GJScaAsK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E911F606D80D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GJScaAsK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7021F00A17;
	Wed,  4 Nov 2026 20:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793824000;
	bh=aghPuIRJUWq9GU43IJYTx4S4suWXwLWy5dvY8oh2ixQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=GJScaAsKHLdEfFmLAXFx3jWP2kmDsO9g1M/dGe7GY5GxgJPJ18Vu3Uwe6l01HTnVp
	 invE5IcmMOonkYnaa1dPR6r+Mm+jYOGl6pGQA51T5qma5V81MCGHcdRdM5kpib5jNi
	 /xhNRn2cH5UBh8tzu4qaHb3khjC8uOQ4f7FQDAZ/QRcbX9fzU31jzz76/8RZdkekJg
	 2xF3aUAOEvtCR2orv5T0Eo+ARZqcVfEYq//Sz6HcobLBxMdu24SbXce0JZdBnSER3N
	 xiVQIiYGbPJng9iv0zJfIJyeHNvcJpFDtpRnJWE2359K91NI3exvLjTt5GfLJyxOyf
	 SGzWVfmN4F1rw==
Date: Wed, 4 Nov 2026 13:26:36 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Jisheng Zhang <jszhang@kernel.org>, 
    Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 should depend
 on MMU
In-Reply-To: <1b1ca4208d725ae0bb834a61636e48728d79cf80.1791973171.git.geert+renesas@glider.be>
Message-ID: <9d72bd63-51f7-7952-f325-68b9f50b757f@kernel.org>
References: <1b1ca4208d725ae0bb834a61636e48728d79cf80.1791973171.git.geert+renesas@glider.be>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Oct 2026, Geert Uytterhoeven wrote:

> These options are irreleant for nommu systems.
> 
> Fixes: 36de74049ec8cb1a ("riscv: introduce RISCV_ISA_SV48 and RISCV_ISA_SV57")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, queued for v7.4-rc.


- Paul
