Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416350;
	b=quvKrIDq6J/w2tvjCfRbPD/7NRkqG28YEeOC38NuUpiC5ovd8wj13cSCjuR2AVcCIyWU
	 Ys0eX/6XM0bO0M3hOyLc8B3EbcCIkWNQQ7SzWMtgE0z8oHNSeWQKxehhTO5fmpSv55rwo
	 2P2IT735lZU/t9lbYAIdOQTvmpdvUPvfleJIlrWxFE1DR7EpdRNXFNmLupsmuBd+6xC2o
	 y2MM484hrn+b9FTHV+Xp8CrKpfonpeIaRzolTKDbYi3JV9mEiTb/lY3Gzqxzn4y8gywCh
	 Dl8ybQHSq4E0FZRBUSayM2CKAQF+W0lICbI+EUsN6htW/ppc8l9hw4cGj9mjOtCWSKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416350;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=VNrKD+T9+ky+u7d//Mvd0gAHxvQshNFDW2BCq1ar0j8=;
	b=JoVJ9MaX1ji+4ML85yLg248/IUBnYKB2n7oOuoG9WUbMANeg8nP2H9rS+Tbz5d0Ix6n7
	 McE+9cEXhWInRDCxQRvyIUd1eeJEoH84ygqgNHQIb2KgAIGugdrltwm6KbhiRm9ZX0BIj
	 eEL9kigKku46Rbb8x24n7POfZdYcOYTdv0cjmc53XooASromou9tU8XftExv36BjdCgwP
	 Yr7YLC3FX+iI4pea9BfcDyNVFmesWhQaZiLlFENEkUis0y1JsIvdzrSCNaFoEvolxt+HG
	 sRaLwtvAYX/+wEUQpT/f3oRGt04IFIqupQs12HGydBQtJTHJgjnGssU0QNAap2+5mGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e1rbtfN4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E605606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e1rbtfN4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACBE1F00A05;
	Wed, 11 Nov 2026 16:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794416349;
	bh=VNrKD+T9+ky+u7d//Mvd0gAHxvQshNFDW2BCq1ar0j8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e1rbtfN49jtYDZizjhDtohHVOEoTLir2VHiprG7Ir8IS5KKuhp6T8uxOKLMP7zbp7
	 4lSls8jkiRfr8sWjdJUrn5IETeCTjrxCWf4Fhs/mHBXtU1C6vUjHaRDabRKsYimK1D
	 XdewgfxAaCDe/GxRkVHdhovKa4iOjGTLuLZ6NV8ugUW9CoaDe0LXwzmTy7usutVr+n
	 jJ00Q7ZB7zMubOgc1ENYLB9NexmDpYSj5lJMZtYlLdqgiNbnPjWGqrrv5RtX1o6RAB
	 DSttw1U1fBu72S6GvyGbUxnEOPy9/971IFnUNFeg277cOYr5WgULWpl1zXhfpGc1a2
	 jKUyh/W9jDxkA==
Date: Wed, 11 Nov 2026 17:59:06 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Aaron Tomlin <atomlin@atomlin.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH v2 3/4] tick/nohz: Remove tick_nohz_idle_restart_tick()
Message-ID: <avSe2nCVrOik0iEg@localhost.localdomain>
References: <20261111114406.346953-1-marco.crivellari@suse.com>
 <20261111114406.346953-4-marco.crivellari@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261111114406.346953-4-marco.crivellari@suse.com>

Le Wed, Nov 11, 2026 at 12:43:49PM +0100, Marco Crivellari a écrit :
> Polling idle now leaves dynticks idle through tick_nohz_idle_exit()
> before cpu_idle_poll(), which restarts the tick where needed.
> tick_nohz_idle_restart_tick() has no users left: remove it.
> 
> Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Suggested-by: Frederic Weisbecker <frederic@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs
