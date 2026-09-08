Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B0835AC3F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899986; cv=none; b=n2NngWD/xKAvai/a5WEbovKseH+Fy6MvQ5jhT/CCSzhSjXM8VgXeJXmmF5U9AGy4WZBTwyE4gr/pWfXdfkSC6KjAR1tfU/yHJGDwqN5Lp+bQWDi4nEp4++JjEJdEDiP0cGhh7h0qJpP2pEDf6KS70NPtUnrkGicrukY2G7XLGSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899986; c=relaxed/simple;
	bh=nCnsjjMTbUDAwEVdehRrOjPfCO10U5Scg/gBoVtzFBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZR+TNatArgKEZa1IV7VUMuNbFFGiJ8EawlIETr6z8xFH7sBjRKpYHo0bcuBxl4dZnUbgfDQd15YXNgpuSgOtUdDgVNeij5cAzIfXVj75LnYt1kRWZFgKJMybeuhzursA4jOMommhdOx+wF2PQcNC+Eo5J9NUkHCkuSKNlJtMlsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxyV62hT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxyV62hT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C45F01F00A3D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899984;
	bh=VGIyugQlsIYpc+dmpbUv46JU+bLlIRQ7v9SfNEJE4h8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TxyV62hTmXbbpmwg12Mk3kNNRbaPxPQFUJru14Nhxco/Bt/2+nIf1/GmdK2QiP8hR
	 +bTBp+bO5kLBFl0OxoNNwPEIwkfqFSmD54pi44mIZtR0cecsPFfmQrj2ir/vTSI4D5
	 vAbJhe/mfFoOdJI4r/hbwIlCofmaFr5qJqJ0GCeBw9jESVIRbQTr0RX6kIkaoo347D
	 hLQ7EiikpOLnf/3XXE6d3xvV3Q8LploTNHneCAVE9YkeNSl3LLDf5Ib2CjJ5fTcxei
	 vDCyd192k828gxnMlXdN/FG+AOA4dISKIpr2V7eg0D3Kku5pgYxUWKGVewtGXdDKeQ
	 MDCJ7o8AbGA4Q==
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-9103be3b3d9so73577206d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 13:39:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzgPLnBfYBv74GF7dayAf0s/ERXgtSbpDL/qu61vPOg9cxW91QCCPJR5MlPSH4MkiI8OZfFh5iaM1MrSTo=@vger.kernel.org
X-Gm-Message-State: AFuF++ltum/6IoldAdQxOnOzTZBeLeSpLYXW+6mKvxYgQDQO1QBFopru
	R1pcLSthHiIwsXmeVUoUjA2nJd6GKniZPlISg8eiDYf247PLHVMNomCNRZNxHlMd2GFT9vAfft6
	x/oe1M5G7giffRJXyqKgonTWhlCCtgMw=
X-Received: by 2002:a05:620a:400f:b0:939:7e48:f937 with SMTP id
 af79cd13be357-939806da346mr3158589685a.34.1788899984069; Tue, 08 Sep 2026
 13:39:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830173343.52759-1-x90613@gmail.com> <20260905155507.273262-1-x90613@gmail.com>
In-Reply-To: <20260905155507.273262-1-x90613@gmail.com>
From: Song Liu <song@kernel.org>
Date: Tue, 8 Sep 2026 13:39:32 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5y0pCnqfgoB0RzyDTF+mgEsWFAmXkm-EJO-VUS354zvQ@mail.gmail.com>
X-Gm-Features: AcwNN1VljhyK_WpgGIum9xkIf8oYM84UCOrazKd5KVTGjZVWiUm5xYIHyPbTPV8
Message-ID: <CAPhsuW5y0pCnqfgoB0RzyDTF+mgEsWFAmXkm-EJO-VUS354zvQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/livepatch: Test rejection of aliased symbols in
 one object
To: Harry Hsu <x90613@gmail.com>
Cc: pmladek@suse.com, jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz, 
	joe.lawrence@redhat.com, shuah@kernel.org, live-patching@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 8:55=E2=80=AFAM Harry Hsu <x90613@gmail.com> wrote:
>
> klp_init_object_loaded() now rejects an object whose klp_funcs resolve to
> the same address, because aliased symbols would push two klp_funcs of one
> livepatch onto a single ops->func_stack and leave the redirection
> ambiguous.
>
> Add a target module providing test_klp_alias_show() together with its
> __alias() sibling, and a livepatch naming both of them.  Two test cases
> cover both callers of klp_init_object_loaded(): the klp_enable_patch()
> path, where the target module is loaded before the livepatch, and the
> klp_module_coming() path, where the livepatch is loaded first and the
> module loader has to refuse the target module.
>
> Suggested-by: Song Liu <song@kernel.org>
> Signed-off-by: Harry Hsu <x90613@gmail.com>

LGTM. Thanks for adding the test!

Acked-by: Song Liu <song@kernel.org>
