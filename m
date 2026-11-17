Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794880268;
	b=42WsgRT5tTNVP8pQrMxKNdFWmoL8REY7ryqgGGt2sq+lEX80rDsYO7V1yDHXk6746CWd
	 Gaz2dRqfnBTyId81wXFZphraiC6Ug1coCe0tVB070Q9502aK9SufJjOQ7CqUmWX25YC6d
	 Ut9GjUjqDCMe5Rg8sGu5NLD/ano1qlmOFg/EhaMu0IqAhSnzUed9seEyXtxKEzY2VP7l3
	 GLSaOGx2MWtOtvgqf884dpyEBo6RmjHLa2SLgynBFei1pLZtbqOX+GofvGwirnYyn8r0E
	 r8hAYhd8EU4qXNTelPorgIQ8EDAz5DH3GVGk/n+9fQa1LFWTG1VcbvUFKFRA6vKIsew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794880268;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=D0FCTYt6jHaJZUw3wHtDw4KARhIPdPMYdYHwx6jns/Q=;
	b=jy2q1MSeTIlFZnyEac/mBIOSLqbScVpI42Ng1svy1SGy91Fi9ULtYdqKjafMpZM+63XQ
	 6FDV81ighL+ZFxMK0fHGmV4L6feFeT2u+GnRc5cDZJpG0xJui38A056r9PX7vf8aYWNBt
	 PzqPLcuYzLVM5oeZ/jinMPtIGWtu0QF+wW8FiUwKtrqIFm4W+Vu8gOu5Tlx1RsSDcYQhG
	 NxISmnxIlBagmkguwfkT03BqUKs4m0L22mmDCCuzrfCR3R8Je462YWeqepzZIIuxp3Um8
	 yzyWF2AmB4QX+BpDeLBm+Z50OIHPbUGxwdyO0W+WDsMNdLyXJgmcyU2cdf1jmS7Ppeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ehp/U92I";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D656A606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ehp/U92I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3152C1F000C4;
	Tue, 17 Nov 2026 01:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794880268;
	bh=D0FCTYt6jHaJZUw3wHtDw4KARhIPdPMYdYHwx6jns/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ehp/U92IgWIGbUkFgQBTffkVW93m6TfXkzFBrR8uKsxPMf0wpo/qi0973gaZodsvt
	 RTjhKgW7YBwN4ILV18KhUJg4z/j/dQohydRe9pmHGdQR+FA83G2h3cN4p2cXIzclv+
	 0Lca7mxdzWahhH67f8VF5ldDBQHYQjtfWsRK3sl3s/7VGVrRrNUf1HjFxTwag3M6L8
	 d/rCgd3p7phD77v1y9Fz0TCVVqLasxgHpmyAKgODJph6U/vdSgiTN26MQ6VS6+E+IT
	 2Kjm11Qp2lNwz3+Ib1g3HhpMHeGFrvMhfBeguFx00d8UCai9/sWrGIEubLBMyoMnob
	 ANpQRkM1kgmrQ==
From: SJ Park <sj@kernel.org>
To: =?UTF-8?q?Oscar=20Alejandro=20S=C3=A1nchez=20Lucero?= <aleszlucero@gmail.com>
Cc: SJ Park <sj@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/pagewalk: document missing struct members
Date: Mon, 16 Nov 2026 17:50:59 -0800
Message-ID: <20261117015101.109312-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112-pagewalk-doc-v1-1-6cc5ce7148da@gmail.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 12 Nov 2026 18:44:07 -0600 Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com> wrote:

> Add missing kernel-doc entries for @walk_lock in struct mm_walk_ops, and
> for @ptep, @pudp, @pmdp, and @vma in struct folio_walk. Also fix @pte,
> @pud, and @pmd descriptions to state they hold entry values, not pointers.

Looks good and correct to me.

> 
> Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
