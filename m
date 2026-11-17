Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909884;
	b=aZyapHkQx90nKUOZJ6eDak26OCApY0ejaCQtk1m6H5ejppn9/YllytoRCl+C7YwwDVFb
	 74FmA/EzHrG61uWpZIo/79UEXhnxyOouxkaQAQvXP2AamcoMjEDbML7YgyAD0+8+VZIIX
	 dtCeRB2F7aG4IJUd0sNxzhILw4jSG0rLL0n6IFOSV0iJ/iZ8lUaANJuIb+kMWNC4JKwks
	 KolcJ6KOi00G/0l6bSYUKX6Uk2R5Y+Ch0Ih/w6V5UbYzliXLLfMnUwDCUJtG9N45EfBOg
	 O7N9XhLdJo4gkVli1P4yLDCI6A0meaJdowvnmPHnaclzbWctP/+l/ZsRPj4++J5Bcng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909884;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w/Tj+yOQGHlgMdHJ2zoX2kGKpzAY6RpKaNTOi5Zt6rM=;
	b=Qijh1f+GwgAeyUHe0sZplogo5PHJUevkv6T0grA1GWfwst0MPDckFnYm4AAsegtdITWE
	 cazbe8RFRhk1QOri4y1O5GRcbh+dv/ehXPPqLCx8Jkrkcksg8erpDEu39nOGUvMbxeYMO
	 YFtpw3VhJeVhZ1/TMgzZK22x3Fe/wMQPxyNZvxFTB6TwbZNjma7yVVKKqZJLsNlu/3KaF
	 wFpYvrRsHHHFOvxmyO1ZUsBEVEJiAhm3LBC3dYavSCsyEP1dWHsajLd8UYxn7SiaWHMho
	 tVoqQJVhaLTWZS+ERN0/CMJ+kOWCtcZDFjjXDy0qnMFGQMtijKXm43sNFJpK0nW/dAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0u9DNVA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490A2606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0u9DNVA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2636F1F000CD
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909884;
	bh=w/Tj+yOQGHlgMdHJ2zoX2kGKpzAY6RpKaNTOi5Zt6rM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=e0u9DNVAMICPOaGQ00G5l3VUdjwKqXhcWqtNE3HYcRy93xGW+rb+l657J4dC32smz
	 OvNil7dtuxVr3u6ZfbIlqxbJuBbWN9bTgPKO7MToNhd2nAs1MhQMYrrh2iISEnuaHJ
	 0ds/wTxNtInls6vIiGQ8tGSrAwRxuBOpEFiX/d7uR5ZrDPI9QrhIGP7C1NdOLCgMXM
	 SbXdatAJwX3Iw2DwYlr+1JjrtXzzZC7LAsT0nAx4pxrqjNMfSh0+BwzeMElA37YBS8
	 Kacx9430eex1JdHXbGX2NJiTjN5mj/c6muFuyo/be8UbkTaXpvZlu2q7QcRf3jIydk
	 iJfFcHNSpdKvQ==
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ed2f163a2fso1258990e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:04:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGUbUaYsfZtn7iZrsq7CV6YizKjTxIEo+BpgLg/us4yv1APPsIGet6THsq58oBJDFeygIgvHK/DtkeFRtw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qgdnugGrx3cfFnEq+ypOquelneoP4ZWAPheAeyzR74Ay+n/HK
	qyfVk58b11V3DsXtqfQHErKUg4qOjmuj0pSKuMJNB/HdnOz3C67RZ6AOrGXp86//uXq2Bs8xok9
	rfkr9GF9Fz5xK3pow8RLmAJ4TfKTaW8M=
X-Received: by 2002:a05:6122:2891:b0:5ea:c11b:432c with SMTP id
 71dfb90a1353d-5ee34a7d16bmr4305139e0c.15.1794909883279; Tue, 17 Nov 2026
 02:04:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-unused-sym-mm-v2-0-2f845e94dd50@amd.com> <20261117-unused-sym-mm-v2-4-2f845e94dd50@amd.com>
In-Reply-To: <20261117-unused-sym-mm-v2-4-2f845e94dd50@amd.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 17 Nov 2026 18:04:32 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w-KED0S8kzVy_4B93DTKVpOgAoP40CRtiyv348_tiKvw@mail.gmail.com>
X-Gm-Features: Aa3M54pZMronU9ebrmctqqD2wcMMdI4pxY04GKVdkValZaPDGgB_Qb3xjyXwYPI
Message-ID: <CAGsJ_4w-KED0S8kzVy_4B93DTKVpOgAoP40CRtiyv348_tiKvw@mail.gmail.com>
Subject: Re: [PATCH mm-new v2 4/5] mm/zsmalloc: remove unused zpdesc_lock()
To: Shivank Garg <shivankg@amd.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Youngjun Park <youngjun.park@lge.com>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 3:17=E2=80=AFPM Shivank Garg <shivankg@amd.com> wro=
te:
>
> It was added in commit c1b3bb73d55e ("mm/zsmalloc: use zpdesc in
> trylock_zspage()/lock_zspage()") but has never had a caller.
>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---
>  mm/zpdesc.h | 5 -----
>  1 file changed, 5 deletions(-)

Reviewed-by: Barry Song <baohua@kernel.org>
