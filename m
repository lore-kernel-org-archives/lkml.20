Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264909;
	b=iV4kG1ICL21VDDDlzeflAmoMb96EJsnVwSnmm4YeRXy8VgpfIOzNQ4JPYEqhg2Poyecr
	 mRBY3uc6bW3o6uMHEMz8UWVo7NNJDgaYOz4QdXINi5Z1OBFlcxkBaRrMZf3twtrG1f6V9
	 DD7NEpXDyAJibcai0P2Ymbhs21guQzJUfdzQdi4lxtTBbPKJVoeIVDAaEnLIiPoCLB+1d
	 XkxpLFKpOJWMdp+heui4bBUIio3h6K4M9YnS85qlHvVbVE9GTouZChpYED2KmedXSAFy9
	 CBtNcfh9FPLxngMKIblJ0t9CWvZsHdE6DhGcN0SBz+64YTq6AWC4pvm/sizV8KEgm8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264909;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RnjJ9+LjDvlJcOeQCayAGBKYZfKHfE/QuFVs8cv4lL8=;
	b=qkU8CLphL4J45ImWNG43MtCGyAELAqqUuNeSRHKwGB0ykkG2jPTcrR2dBIa2hLJYPv0w
	 sNHdq0IaYqwSeklcMj7b/bRHd6fiG28C4wx6t8rJJk/+uPJrtYsvPyZOYjiEPw7X3r1n6
	 PDVHTy/H+otAtJ3HcIadJCXlbcKYa96Rbo4mkWGKIpTwesi46E/NHmIdQ2P7mmRuE5cEI
	 5+78YRyOAKNIzOjWxUNVcQCRwNmnj4MrUG7VHaQJQYIm8Q/FfT/5E6zf9lQzoVm8hUJIa
	 19rbMYrOagiYWoDxy6rku23RmTt/bblny9d0m/bmy4vus3sHVvvKBspUfCUzreajVzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZRv9I1Kq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EF1606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZRv9I1Kq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7F01F031E1
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793264908;
	bh=RnjJ9+LjDvlJcOeQCayAGBKYZfKHfE/QuFVs8cv4lL8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZRv9I1KqVuVAi+dknQU82IRiWsxn/cd2MSRVpSaadEAVnGPyb55+698AxPxuEH21e
	 /mAOMMSkw5q/+SSaHm3L3WqL0mKJcIXVUJhyf32d3MVa5CgEbxr3bUDIT35JxAy/24
	 L2HVPkqiUGI0aAEKEpgaEszSM7v5vWvr9bxRYXyWD1kCQZjXkJZKJ2eTMEILJuZkhD
	 tTZr4kLY0FdzYexeNoua9MQMzGNgiGElJSBN6Vu+XbgnHCV4k6VR6PN2dFJ0TQ2HQj
	 DaLvNAZiefd0kRnm3KaR6q5iQGfIz1YYRK4+ZNx1k8uEMUgNdUOlsXJZehpJiIrU80
	 ppIACx4OI5m7A==
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-917a64f28d0so7051476d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:08:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzXs9w+vbuZSPcepPz4Q4LOV5OQhZQRr93YO3FAhW1UC4fYraX8oaweYY+5NNEg6ZA2aH4v7wGb5uMsxq0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQL5Hl0ALUbCztRAd57z1hSwOg9odswxjKy0w6I6MlfBlIBRdA
	+S+NKA+iYLmBGTGPkjd7n+yqrvn1D+Xz4rw0Fe8BDHr7vg/11VHxyuhzJ+aAabX9qHE98vSNSxz
	t3jEo4J8+BPr+OJuwhgPIqCelVKSk378=
X-Received: by 2002:a05:620a:84ca:b0:93f:3834:31f9 with SMTP id
 af79cd13be357-94413358ca4mr270852785a.12.1793264907818; Thu, 29 Oct 2026
 02:08:27 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-data_race_huge_mem-v1-1-112e331291c1@linux.dev>
In-Reply-To: <20261029-data_race_huge_mem-v1-1-112e331291c1@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Thu, 29 Oct 2026 17:08:16 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wndM+uFwhX+7wdkm2Q8AkgVcw_4wgpObfw0DAZ1w+sVQ@mail.gmail.com>
X-Gm-Features: AclHuK-H8tWpHZZawUCKisEyC5nq49Lm5sjkdR7OLpR5GCQKP0iwghbrFFjO8Zs
Message-ID: <CAGsJ_4wndM+uFwhX+7wdkm2Q8AkgVcw_4wgpObfw0DAZ1w+sVQ@mail.gmail.com>
Subject: Re: [PATCH] mm/huge_memory: use READ_ONCE() when cloning folio flags
 during split
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Ye Liu <liuye@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:41=E2=80=AFPM Ye Liu <ye.liu@linux.dev> wrote:
>
> From: Ye Liu <liuye@kylinos.cn>
>
> The head folio's flags are read as a whole word to clone specific bits
> into tail folios during a THP split.  This plain read can race with
> concurrent atomic flag modifications such as folio_set_waiters()
> (PG_waiters), as reported by KCSAN:
>
>   BUG: KCSAN: data-race in __split_huge_page_tail / migration_entry_wait_=
on_locked
>
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---

I assume the race is harmless, but silencing KCSAN is still worthwhile.

Reviewed-by: Barry Song <baohua@kernel.org>
