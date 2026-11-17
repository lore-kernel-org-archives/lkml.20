Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910044;
	b=d1Qd3c5M/H5bEhL/oHTjU7KSKwnSrIG10m/xUNMOj553JrBUymbgz7mE3Vs/L/WZnwgl
	 Q4RxVYkHp5/fHV9eOPg+eOcpYswSsKKrtYsOI7wxbhzpLZAcB0V7pyTzfiJdSVNbk8SLO
	 3SH3NlhCYKMhHO6M/FU24g9UZZIWlevHUYqQvjND14uZeBy71+QolMYIXLWF5kWA1Gxgl
	 WDfYg1jlIo7ZMvEJjbhhWietPbbRcrMtjqz/iw+5jkmlL8kmHQOBqAlb+eiAZTp3S4aCT
	 Sy0JmJNPgS6SXxp80KLn56BQG4ga+7f0ESj/7Fx1+1IOjdW8wQwdUYk0wZnKcRmzURA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910044;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fB0tSjEpeVMnmpusdLO+EDcnV7mxDkwNNJyyPw8a5DQ=;
	b=HxgFohPqHRWlB2Nk2jO+wpm7Ym84Sf9O0NEGsYmRlQGJnwSNEqRHS0aFfrW7jzmlSAiZ
	 Ai1jn+lcXIJDa63ARwBvAtyggNPKxBSkkYPOjBKra5P7m40Rpu2YIpskEGk48arl1fC44
	 fdR7UMl9m5oNm/CiBNXPqA2NgeSo8RSSLb8+/fpgsILddlpcTU2WI9EuSv9QQOWTsMhlW
	 AJY9zlqPTNoYFN2pD5MLsWG/7OEssO/Al094dLr+wVLgJ7bF9hMyTcNhn9ELbv0ZT15eT
	 Oo045kZa6ISm9Llqmx2KjEQgnixqQ3Ld48U+Ouesji+XNc1JonG+p1QC5wtKWCs+egA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Vzjwi1/i";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565AA606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vzjwi1/i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A421F00926
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794910043;
	bh=fB0tSjEpeVMnmpusdLO+EDcnV7mxDkwNNJyyPw8a5DQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Vzjwi1/ihkFoAigcsjfkg2CEQKs6biH845zIgKbTVRYy/vpbKFYOd+IMJB0bjGrh/
	 cOMnQmtelQkgqHo/DENNb58dx7XBh/Oubb7ybwMSdt40wb2vddliaNfKbyK0pDodvw
	 EcjfUpzIniqcvS533gHXt4a+1WFCFGVA8oDthHqVEf3dqfWZgB+ndHA/M1oIZvTf1a
	 6YCLdnT8+8OVZAgf5+grif7m7wwihvJUfA55tKiV0HMLRn0RxrCrSi9L37af4zAEzv
	 rbvUAtztKu7fl+4J+lYQa+d+3GaMV3StUHgnnVHLnjlPJXCByeO/isF7QbZMpqWPYE
	 XiPOVv12pbKNg==
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9495f083657so430958985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:07:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErErVQpfFD92Jdpy+WW/2vnYxyP7WW3+6i0oh2O/LVC8FplwltGbAsD1lCw+/Wte8wk5TqIWMMqyOQsS7Bo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ASnWzx9hD75rCvYlgEV65IA6CJW+65LoIQMKvxl0wx6rVSr0U
	9dRw3C2vCvXw5myRETWO/ZNbMmt5zntIZo4ewBdGxpM+RRJnnV9MGOyG/ZgDVgVrz1LdwjgxsQ8
	za4BjewaLba1Y6UeHh7Dm7EZrgVA9wB4=
X-Received: by 2002:a05:620a:414c:b0:947:84e7:f617 with SMTP id
 af79cd13be357-9494bbcc0f7mr2241604585a.64.1794910043206; Tue, 17 Nov 2026
 02:07:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-unused-sym-mm-v2-0-2f845e94dd50@amd.com> <20261117-unused-sym-mm-v2-5-2f845e94dd50@amd.com>
In-Reply-To: <20261117-unused-sym-mm-v2-5-2f845e94dd50@amd.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 17 Nov 2026 18:07:12 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yxk9FpQMrU62bqVJP_yyffOE4QfCoH6-kWR2k7UDxw4w@mail.gmail.com>
X-Gm-Features: AclHuK9XqfHSSlV3-H8zXL-FPmnxM_EEINXhbrW6SExBJJw2kdb1xvGlKxX-YCA
Message-ID: <CAGsJ_4yxk9FpQMrU62bqVJP_yyffOE4QfCoH6-kWR2k7UDxw4w@mail.gmail.com>
Subject: Re: [PATCH mm-new v2 5/5] mm: nommu: remove unused heap_stack_gap
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
> heap_stack_gap has been unused since at least the start of git history,
> commit 1da177e4c3f4 ("Linux-2.6.12-rc2").
>
> Link: https://lore.kernel.org/linux-mm/20140430083620.GA4711@dhcp22.suse.=
cz/
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---
>  mm/nommu.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Barry Song <baohua@kernel.org>
