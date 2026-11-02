Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660180;
	b=2tmaqN5brnA46t1jFRd1fD3yfGI4IiE4rDkKmJhwwM3lrsyi0uuagE8W1eDQpxYkDat/
	 uB+rlX4syo/ZpmFgzQvARzZ2OrsIbmTRTBtvp/vHk3RzHTE7K7jseLC59vSzLsniZY3nD
	 8pscud6B/wZBxY4+d4gd9OfE6GT3ayFkWqGAguyLk0HCJwp4BZb0gR0lTIxtX1Swvw56Q
	 vADt+L9rvhEPgpj92d+X68/uK8odXIQAnRAjhImSO/4SI/m+WTDMkv0aHJfndVGi1pHuk
	 C3+7G7cIhLVTRUvVsPSUnYu1L2in8jFM8Q5+uMMAr4ArtnqxN5KOJI6+EKkHHjQ8imA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660180;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cFYQ0d2h0844nhQw4x0ZMieOCXHXgxHX+w5eXcpQbAM=;
	b=KoKT5HFrpPJn4sc3beRbF3weCLYMdK+PuWMTbC8m1y/6EryUh7B7uU+J63CsxGWNr48S
	 M5KLpkNSS+ubV4AmfXRKiFg+7cBqWZfOLhTh3wK9njwzMjiOknGV1eUjBkIySaa/b9psm
	 DahqtMnnebxBzaVDhfgQDcdyWIbYifoNVZaBw3LxsflhYz3WvkrfdunDfxjPCzau2osI6
	 DwV61krvJnkUZw6WY+Zs/2f69CIpudehGwvVGXXFcsbVMlC4jpkYa1BpUQPeJq34/raA/
	 xGvfZTFl7RT3Sci13ZwqWLTG/5LHCMdoxPyH8SFxZsxG/lRIwlm1YP5QQDV2k3XWqzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BwlS+ODd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A09606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BwlS+ODd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363A91F00A20
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793660180;
	bh=cFYQ0d2h0844nhQw4x0ZMieOCXHXgxHX+w5eXcpQbAM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BwlS+ODdUdt0siIbyOLdnHsFImrxeLmqStw9m/xBBplYc9zMvwzEbcN/gAQUkTsWu
	 SmuQLkKbhgoe0nVXDEE7k8qzUUXhaSTUIkYRliC34SFtT7UMCHlqwt+p4BWUIqebsl
	 vQV4TPC4H2hBww1lm8aWqF4y328VCJnUBu1ZlvrwPZTZDxJOYzejW2ZaOELjFdXFSB
	 X+jVTemvcF8j0tJajy/CK+MZ3zC89zWIH8igB3jShGDM25mYp/iDL1gcac/NovwW3O
	 VANVCLdDy8AddHhabBrjNTT2ngCKjbLs/4fgjEsnVdQzMdJKl5hMkUR3WMkrRVVkI2
	 VkmMi0STm7RwQ==
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93f2049ea7aso263167585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:56:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy4+eJtIXPvmnrooVIJCqlAQ4Hqp91vpG2Z4twtOnbEuFV9pfPI2yxj1sCxaOuS4Fc7WTgL3lwJIJtscfM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGDSPZughhWQvJhh7r0RhitEjh+xcr4vwBs5WAoNBqBjIpKwzP
	iHk0+4ISwOHN+HtWOo3kjls766JIiySsPcpkIVqHg8mzcOvpr/hVH6nrjhYjtIycHq8c8W+uoSu
	dVb30iKbbPLjzhrI5wFBiGXmgXgDDk14=
X-Received: by 2002:a05:620a:2556:b0:93a:2150:ec06 with SMTP id
 af79cd13be357-944217430a2mr1904131085a.31.1793660179584; Mon, 02 Nov 2026
 14:56:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026202313.63122-1-sidchintamaneni@gmail.com> <20261026202313.63122-3-sidchintamaneni@gmail.com>
In-Reply-To: <20261026202313.63122-3-sidchintamaneni@gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 3 Nov 2026 06:56:07 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zGmtvOApjFH_-V9z_zNWWQnrBX9q0_iWtbqzENCetfgw@mail.gmail.com>
X-Gm-Features: AclHuK9iKml0mqB9U10W06jkrcvQ3DU6aATh74iQjCSlMOo7Q2XN81V-z79dfX4
Message-ID: <CAGsJ_4zGmtvOApjFH_-V9z_zNWWQnrBX9q0_iWtbqzENCetfgw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm: multi-gen LRU: remove get_lruvec()
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

On Tue, Oct 27, 2026 at 4:23=E2=80=AFAM Siddharth Chintamaneni
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
> Suggested-by: Barry Song <baohua@kernel.org>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> Signed-off-by: Hardik Garg <hargar@linux.microsoft.com>
> ---

It's great to see the MGLRU-specific get_lruvec() gone. Thanks!
Hopefully, we can get rid of more MGLRU-specific code,
such as get_swappiness().

Reviewed-by: Barry Song <baohua@kernel.org>
