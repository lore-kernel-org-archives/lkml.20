Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377593;
	b=LYzYlGzObRSZUVDYak7K0ncv2lPOJnibBnoOnADx/sz9zBoEBmojr248kwphbE0UbAY9
	 /P5I3Bwg9v3aZ47EDbuKcjjRbVpmURGFKJ1AzTK9yM2VH1L65/l+I9730P/Jz9w7cEUJN
	 v+zrf7I4v2duI+/Et/2zs3ce59gRI9HUOcW3aPcnR2LiOvs0LelgyX4XKWTF90aUf+ykE
	 YXPgn9J98cYa2UwRUSz447hgXYz7kNSgdmEGcH/o7aLTp/IY4dn9KF0Tero79UEKAMRMH
	 isAewYEAFM/0gw7r5dgXA0DQR4jE+AemW43towoN8zSrhJfo9I0oa4TD9JMUj+Lm/MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377593;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hS+rLYQpPQo7cr5nb9uqxFHEAlKH7SAJLbqNhPkjfzw=;
	b=YPARurMwi1i6ha5SgKewJ5Ng29bdSffMgG5SnIXLGq0cpe879qMGpTY8VF9UJkyaitmy
	 nUOtxSDetOnaD+N3J6DwlaeTfJ3U3WaYC3UT4aoPrNknNgwv29TLjRqkVH5/cq1gLWGWQ
	 tRS4W1hLbxxqylaZ0UjlRWYP5Zxyi8zF2QPtFHSQkSfFuvSBM+uIL476OFf8IGdSaIvcI
	 l7z69bkcH70Wc0XsERTd0n8CiiCIRF13EUd9uc8vJQohb4AHYc6XSpACVNWv3F2XXjfzP
	 KFBH+V7Ej5bYjfCsohioWhN/sRRmEhjYrpQxtcearLP6cu9k8AVpe+Pde7Bdmn1/Zjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F8S2wxzS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54405606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F8S2wxzS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B1F1F00A02
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793377591;
	bh=hS+rLYQpPQo7cr5nb9uqxFHEAlKH7SAJLbqNhPkjfzw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F8S2wxzSfpI3XS2R50duy7R8ZC8VDYBCBAhG/KUx2IWeK22Zw27Uih84z/0NlmflS
	 bi9ab1LST9xG6zQhoV/FRVlNYtRRAPbu/kFGJYMocthUqmw/ICnFE9d1Bl31QVxuE1
	 Zy2M1QGoMMJGW9cTJcx/I4oiQrrYEO0zZ3H2WQ++9rfi4w2CHxDSpvOvIBHb5Ecgym
	 Fk92f9Sx9ACIKe/9ePSxsAJ3ix+zDhaTWelzVFu5bzj4loDJtB7rHaBFEbCl32LYgV
	 6zFA+N3ojDI3vvpMAfbod5G1PEYkshD6dCFn/Ts2ZojDeMVn8WOQ/H+xx8cXgsi7Vz
	 8EWzfB+yaQHyw==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso34639166b.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:26:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByKtWfSqaQLN24750NM/ibUluF8j9kyDDiRA+PFFAb/BcX2YxQtGJesIiVDFQOA4JbHRw+AYAtkbZKWnLU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEOsGoLm0T1iNIMsT2VzsE3d3SpUr29KkMbIr4n4TfJaBHMMs2
	lmAH6hPJDOW8qpfcz50kH5MyM7dZiVIB5UAd5GTWrWDkEl2f4auKY4dU/EmcrsYtYaiTRNp3BeI
	ir6zQZJJXcJ2/vBL8Ow6U8R4G77bIKQ==
X-Received: by 2002:a17:906:f595:b0:c43:ae92:9a9 with SMTP id
 a640c23a62f3a-c4ca7aa3e0emr267070366b.33.1793377590568; Fri, 30 Oct 2026
 09:26:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029224843.1155201-1-dakr@kernel.org>
In-Reply-To: <20261029224843.1155201-1-dakr@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 30 Oct 2026 11:26:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLVJ2S4bhE-kSLM3Q5VzWStuTVZk7sP7RD5mP1B0ydR4Q@mail.gmail.com>
X-Gm-Features: AclHuK-nQBbKy4gKK43XfqZDxGiS_yeHOcBQ7MwShw_wdc0eH6EgYHj_NsV3Rwk
Message-ID: <CAL_JsqLVJ2S4bhE-kSLM3Q5VzWStuTVZk7sP7RD5mP1B0ydR4Q@mail.gmail.com>
Subject: Re: [PATCH] of: unittest: Require BUG_ON_DATA_CORRUPTION to be disabled
To: Danilo Krummrich <dakr@kernel.org>
Cc: saravanak@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:48=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> With CONFIG_OF_UNITTEST=3Dy and CONFIG_BUG_ON_DATA_CORRUPTION=3Dy, the
> machine no longer boots after commit 5b5224220747 ("refcount: Use
> CONFIG_BUG_ON_DATA_CORRUPTION for UAF-related errors").
>
> of_unittest_lifecycle() deliberately calls of_node_put() after the
> node's reference count has reached zero. The test expects a warning and
> continues to check that a subsequent put does not produce another
> warning. With BUG_ON_DATA_CORRUPTION enabled, refcount underflow now
> triggers BUG() instead. This panics the kernel during boot:
>
>         kernel BUG at lib/refcount.c:37!
>         Oops: invalid opcode: 0000 [#1] SMP NOPTI
>         CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                 N=
  7.3.0+ #14 PREEMPT(full)
>         RIP: 0010:refcount_warn_saturate+0x89/0x90
>         Call Trace:
>          of_unittest_lifecycle+0x158/0x310
>          of_unittest+0x105/0x130
>          do_one_initcall+0x127/0x350
>          do_initcall_level+0x7c/0xe0
>          do_initcalls+0x59/0xa0
>          kernel_init_freeable+0x118/0x1a0
>          kernel_init+0x1f/0x140
>         Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x=
0000000b
>
> Make OF_UNITTEST depend on !BUG_ON_DATA_CORRUPTION and explain the
> restriction in its help text.
>
> Fixes: 5b5224220747 ("refcount: Use CONFIG_BUG_ON_DATA_CORRUPTION for UAF=
-related errors")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> Alternatively, we could also just remove the refcount underflow tests. It=
 seems
> they are not really testing anything OF specific, but rather test the ref=
count
> implementation.

I'm fine with that. I think we should keep just the first part with
of_node_release() error check.

Rob
