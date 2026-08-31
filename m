Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C634AE131
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190243; cv=none; b=sBmfAhlD97C+I9s1I00BK2GsC468wZ6ynXxhwJW81xt4nw7uUtVRALsAVQoaPtKGvar7VzfnyedHNy+6DjqtA6pFmWbWxOxQy6iXONuxxumdR16ekuIGf1wKS1/mEXTzrmDyrtIh9FgifqsvpZichb5HUSWX/Nx6k6ZNhCe/zLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190243; c=relaxed/simple;
	bh=3OBsLN1/MgB2D0J47N/jZjwD4E0kqsORlAyBJqrdre0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=anMuT/owAbSlsPtkj27/qn6F+wJta6WjJH1mYlzR5zjQA3/C3E/RMnDeInI6OtaEJ+tOTKorW8FIBwEKUj7WJzAReWoWz/4y0ZqCPfq6t/L8iY75PnLcubPqWzdylQrtsVI96cTaVXfxD7fwgZF8Dk0nnWI2W8bv+o0DJtkEIUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fq5pNrnY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fq5pNrnY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231EC1F00A3E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788190242;
	bh=3OBsLN1/MgB2D0J47N/jZjwD4E0kqsORlAyBJqrdre0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fq5pNrnYFYD0qFPWzc/bZ1MQJVXy6T9gI2dETak49dwXfzYIlPzxI/DldPsOHWQjy
	 r+tqD6uN30nIf5F3BZTVV04Tj3u2eEleo2pEiNNfZ96MLm67hrRX9Ii31BKB04NJ0/
	 roRSfscVu1clNZ4hOrdvYtOVI2hjlRTvoBcu5QHSv2e7hOsgcyAgOB3bAJ2nFtX3Xf
	 Ljv4O2RlSXPecBMTMaWNYlS+V2Dsn9Us426APPnlLJuk41TA7lbW8voJGGIVGYgqwt
	 UwdcbkPFo4i/PBDSywUWRe6/C8zTyJyYttRkKmQpC9lQMgwBPSiYNEL6lddGiLtRMS
	 R4NmkOOryXoBQ==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15e2dab83eso90958866b.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:30:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoQz76fT4DqwgtseaaNLVih+A0shQQc3JI1d3lHxDleVj8sBPOlK9LZ3FoPkpQ065O2GMGRb/aBnqU+VTw=@vger.kernel.org
X-Gm-Message-State: AFuF++nj/vWjKoyYuaalH77pPAptt0n1700tcno3oe/G9i8qjiZDrKH9
	lhQelb9ZLvASXaOLBe1YMvHmHbR/QqRckDlVe2PjwHeibYAkB7vlXXviaXGC7ZlQdRqScS17G87
	rYAhCzApuzX4JsQrWNvDnZpqLhyI9l/E=
X-Received: by 2002:a17:906:730e:b0:c25:254:292e with SMTP id
 a640c23a62f3a-c25567a9274mr1687801166b.0.1788190241053; Mon, 31 Aug 2026
 08:30:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830114731.8322-1-wujianyue000@gmail.com> <20260830114731.8322-4-wujianyue000@gmail.com>
In-Reply-To: <20260830114731.8322-4-wujianyue000@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 31 Aug 2026 08:30:29 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMR2+QqJRHnp2YiobA+p2VZKYcj+XFJQPfgdJt=vDT1VA@mail.gmail.com>
X-Gm-Features: AcwNN1XToK7V_Z8zp2ZtlR_wmIi7rQGDkJiHpbBdZy3zGKhWkS6aFkmEagMkGdQ
Message-ID: <CAO9r8zMR2+QqJRHnp2YiobA+p2VZKYcj+XFJQPfgdJt=vDT1VA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 3/3] mm/zswap: reference the pool by index to
 shrink struct zswap_entry
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 4:48=E2=80=AFAM Jianyue Wu <wujianyue000@gmail.com>=
 wrote:
>
> struct zswap_entry is one allocation per stored page, so its size is
> pure overhead. It currently embeds an 8-byte pool pointer, even though
> the live pools now sit in a small fixed array indexed by a u8 slot
> number.
>
> Replace the per-entry pool pointer with that u8 slot index and resolve
> it through the fixed pool array. A live entry holds a reference to its
> pool, so the slot cannot be reused under it. The lookup therefore needs
> no RCU read-side section or zswap_pools_lock.
>
> The u8 fits in the padding after the bool referenced field, shrinking
> the entry from 56 to 48 bytes on x86_64. This raises objs_per_slab from
> 73 to 85 and saves about 2MiB of metadata per 1GiB of data held in
> zswap.
>
> Suggested-by: Chris Li <chrisl@kernel.org>
> Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>

Acked-by: Yosry Ahmed <yosry@kernel.org>
