Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008832;
	b=0bkCp2nidvN6nzVDHR2bGdaymcxwT8aURXu3ZiGdfHQfqLEpR4Ub28MKMHeNqBF7NTuD
	 ky/8yGqwZeQX7R7gypRJKymCR/ZPTP5zlXB8cfJ5VNFKYwpYq5BJ4kOVW/Fkv2clJPsB8
	 DFNeTD8QLd7UFNQ1hDmnmIPD8bF7nmjFCYMLV0Vz1niQr5j4VoULd37UVnmqv5p9tEqOf
	 jHWDEHe/hMohumHk4vZNJ4RJbW0SNob9aaEnDS4koZhp1WMbdMVJKZomSsV7UN0z57sCq
	 5Rlocp66QhW7FsqIxum8Cub8+Iw91IZydJzhi2yMtl9/prdTsTVSLytfGIzG51vAB8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008832;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EW/KiEjTAKTNb6Fyq8su27LID0Q+hpX4ZUreLIT/B5c=;
	b=qcB4Bp/U0pT/BSpKDVrpDQPtIRq9YAyHQFnTMPpxJwS25uwAI6dmmiDe7BXoPzWVEI7G
	 pOOVQNSJi1fKFSnzbCnVOqaeTr3yCePB+fACnTjZtPiQMZp8Icv+S3s/X4tSyFq1ALcFk
	 GfnPu90kKbivp2t6FH2lZ8aV3WtZlRPLwHphq6pFuPYR2k2joVjXgBA3MpyzpjlvI17LU
	 rwREIHvqKWdJtEpptrXb8vfiqjLqYA+4EHJh7Mv8EdWDAANwHJjfnOiZ2Q2ysJYPzv5W8
	 cHRVu0UFMgF37ghTEWqtJLsQJeZW7f4RCmDO5ZhqnvwVpzc2sNltF0+tx+r7ZiJeO8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VNvc6pV1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1400D606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VNvc6pV1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F331F01208
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793008831;
	bh=EW/KiEjTAKTNb6Fyq8su27LID0Q+hpX4ZUreLIT/B5c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VNvc6pV1KwkLNz7BjGhjnq+VYIsTGl4JnniVjAcCFhD0sBFAU44WnZGfNflXA6arO
	 fA0V2jFC/etbtX17o8n8yyb1SfkBk+VxtfhHayxTEqrqyyT18yBF2AXbqb/3zxoQuk
	 T3/f0yLq4hwKiuLlifdqeIcPaWpfjJaLH9zXK4BYJ5JWiRmSH1nln1KAyQiMHaO0kq
	 Zw/8LVI0SLM32ZUnxxqsLirVo4EavlyxboUJuUe9P6uXcuov65C1A84OHwj96spcGA
	 9MckRz/fanohDlX3/zJffG6KEo0ugRrVHv54eKIAaiB4+RpO3yfnYqTozcuRzydGrg
	 J1z+3PUBNjiYg==
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53397554beaso34441141cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:00:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzacQI8x/kC3K5u2rUxPz6YkrX/5+iXHFUERIhvq9BjR/w86quxPvYVYb6TAgdOi8FEGnXXDa/4X5lDQg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUYfE+ywLp9N48zAa+xzoPAcAtm9i+M9QWzPKOSn9WJaJKNy5h
	18ZGImUD6h+yhPz47UDVPtvBnBB0XD07ZFxO4h+kL3JYN5DDHpLk0geCJqsPhsXsx6UeEepHgcK
	TRd0sYVGz9ksceyPuEta98lCYY4rTLu8=
X-Received: by 2002:a05:622a:4814:b0:536:6f16:d923 with SMTP id
 d75a77b69052e-5383b529e0amr95920481cf.40.1793008830988; Mon, 26 Oct 2026
 03:00:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021235606.89545-1-sidchintamaneni@gmail.com> <20261021235606.89545-2-sidchintamaneni@gmail.com>
In-Reply-To: <20261021235606.89545-2-sidchintamaneni@gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 26 Oct 2026 18:00:18 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4y7AzEHUjj-g_FaQdodYidC26-7MSG8HPkgfRgi67TCkA@mail.gmail.com>
X-Gm-Features: AclHuK_OwUoSS1vRNFgm5ezmxR4vQc2J_QfUTbATBQkBDlrYE43IstKZ-dkjm9I
Message-ID: <CAGsJ_4y7AzEHUjj-g_FaQdodYidC26-7MSG8HPkgfRgi67TCkA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] mm: multi-gen LRU: remove get_lruvec()
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, david@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, ljs@kernel.org, 
	kasong@tencent.com, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	yuzhao@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	apais@microsoft.com, rlmenge@gmail.com, 
	Hardik Garg <hargar@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 7:56=E2=80=AFAM Siddharth Chintamaneni
<sidchintamaneni@gmail.com> wrote:
>
> get_lruvec() was originally introduced in commit ec1c86b25f4b ("mm:
> multi-gen LRU: groundwork") to guard against NULL NODE_DATA(nid) on
> uninitialized NUMA nodes (`return pgdat ? &pgdat->__lruvec : NULL;`).
> After commit 09f49dca570a ("mm: handle uninitialized numa nodes
> gracefully") and commit 931b6a8b36a2 ("mm: multi-gen LRU: remove NULL
> checks on NODE_DATA()"), that NULL check was removed, leaving
> get_lruvec() as a thin wrapper around mem_cgroup_lruvec().
>
> Remove get_lruvec() and call mem_cgroup_lruvec() directly at all call
> sites.
>
> Cc: Barry Song <baohua@kernel.org>

I guess the correct tag should be "Suggested-by" here?

> Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> Signed-off-by: Hardik Garg <hargar@linux.microsoft.com>
> ---

Your patchset organization is a bit unusual. Patch 2/2 is
sent as a reply to patch 1/2. I think adding a cover letter
would help you organize the series properly?

Thanks
Barry
