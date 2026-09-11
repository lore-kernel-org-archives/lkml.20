Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C8B3AC0D9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134213; cv=pass; b=OkR4Y5TjomvJbZDYeIh97BRn3SU5pWTYa56g97cLKfTb4tIdbvlIfErdzIGOtaYgFP+r4QaGMoKt0ir9p/gwtwESOVW92gJgl7yZ7kYN/3dPbZElP9tq0LACRDGG4VdIVGgGAG1s4GnJpAkB5XZdRCA0u1Q/8AYjMTFZGG7jmwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134213; c=relaxed/simple;
	bh=qqONGiVmU3Y+JSEn4qygivSbxUuzyWx0IT02Btj63eI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iTKzp99AJBvLVC5U3WuPWhm9K27gfT4+rwSM7lSrJdwc/11vToIc+44MfOfopEgmtHhYfoPQW9mR5r37rMze4P9u1tGe7a78QYe9Be0DaK2PD5guPgyMIcxj9EyzI1oZ3ayNJFIr6imgBhOSoNWhhkloz2p0DYj8uF45v1VxtK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ehf9dS9K; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ehf9dS9K"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b965570d7so11607355e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789134210; cv=none;
        d=google.com; s=arc-20260327;
        b=auue1a1YGsRvy6y29gmdRKR6ndv+LwLLzguQ9H1F1Prm+/3xR7Io7dwIYHRCOh/Rw7
         Ky5BjIIv17tXNOTYXTiJ4lsgBtgn2t7+1Fh5QYaX7uLS4c2BpFCxT3zb1Aj+OElcgvLY
         3zQ7L1M/8YfOXqwURhs6HLmLwKsTQuEfzAmmlDKjQnXsyE285gJulsk0H9TFGG5ecuDA
         0ge21+6vjSro0L1OI7mmunrs6OrnNNjSOYYoIgR3RHnBGe88zCwjAp5CRAOuCXV4tqPq
         NC/Pr0Bw5TlojhliRjCBws86zq7N5sUnk+zrbZmO90cT5ZOl4CyrYR5/UM3LtTnfEmm7
         YK7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qqONGiVmU3Y+JSEn4qygivSbxUuzyWx0IT02Btj63eI=;
        fh=oNZan264vw6aJ4TVt9AnuDlGsNfFBvHsP1qEnzXCfRg=;
        b=GQ/IgtI71Xkj/EKVG80grPAYaObuxLN2Kmpm4gxZFJLo6ooQJWajp7rXx/+Mv201Yh
         +UcwkJwWl78rzo1xAamkuZiVdgHRMmkeMPVfeZmfSLF1q7h5WfDvpvgkXKeGSZ+1NR/x
         ovGfBvixs48f+02dUYG1DJzTn+Y9kCLYsa9WvDKDmewkP/HyQL4gv3MzBaTlXT7NYDgs
         rB7dtgiXjeVZ+TOkFFcBHWRvqe9pQI7zgiKJF2UPoXFURibXmHPV+ROgGq2PjnJdbKBq
         +9NYd7BT8Faus5WsIdqMMpSFHPA3S3jDWXaqkp0SbEb/LCrjuSr24lfdJCsSs2BGOX2k
         xoRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134210; x=1789739010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qqONGiVmU3Y+JSEn4qygivSbxUuzyWx0IT02Btj63eI=;
        b=ehf9dS9KBtz8dLPV1eOtxc8kmJv+fOyIVW2ZdO06596kBMMRx/tyUK2lDgVQgI5M/c
         SSpBMb7uUs4G1u34797nfCD7P+9zLvxXZxAHnuR56Buv7tbMHFhU+KXC31bwb8LxfuHW
         8rSFo0UCiOxET6/EGYFoQmdn13E7BSnpGDUmtBh5eTd4sQzXsa+4KMiX2L2pwFInQmBd
         XbtYZ8PflSCvO08pB5VAXZaYQ3wTj5HZ2Hp+yRGmtaYxRkpKM8QUHwvM09P+tJQDQK9v
         QG0xK00MrU/0875Gy+xMQiBhNe3qdsPJOLSKMbDDhT7ODGKOfLVFvcBzJ0WilrEwQq0E
         IdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134210; x=1789739010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqONGiVmU3Y+JSEn4qygivSbxUuzyWx0IT02Btj63eI=;
        b=Z8ljdySSUTHpG1MFH5rVYCVYUppnDVbIP2LKJOBTKHKXxHBnBzrIUai46gsymjrIdv
         fQMOJM3XRv5zyNngX75oBL8LFMS/5XgaSceJ9PL0gwPjf+i15x3Vy437OTmp2p1iSu+8
         +OOMam+rspA/sXISRtoJSGtSE9y1mgK2W4ls4tEvLQVHAehu991jM/LvlbrBTlXdz2zN
         VMAxQ8srJ0mhIG4KaFDpCQ8gWwsnkxmhPCLM3An0qnuQNfGbWD/konO/FG7IKg6nxlT2
         eRgfMQQHAgwXvsl6bjY/FKPMlXGC5JJ7LPfZCZcmJP9blo0vjiYTS7N8zQEYrCvdGG7T
         8VFw==
X-Forwarded-Encrypted: i=1; AKwUvBwNpfP45ByRPZNpAtswto5e/qgO1rrPGIWvOpOPnGubF30bnFLsflXIfnRjV5n41bTfNxN42pLpKyo7VDQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nEtp+rOkl0iOfZiSQD+5PXhvn7gUeDKZpeZcHjsvWpF9aby+bd
	eAj6L8DUHEKCOv8hxq51jwzcjNXOHnGPMtG2JchA2SKchC1NP8pbW3Pr/dRMt3v5oE6fYYZnfw/
	V52sDCt1w4TVZCBeIHd364b+/sCe6XvkKgIXrdCnp
X-Gm-Gg: AYBFou3lgGDRCGKlXFn3zBD7ke2TQDNxXyNQJpn6mSXBPY2Drfn3vghvZkoGRe+wR/I
	cw73J7YYkt1U4HxvuXTjhlCMfpHmc1ggGYUIKEabvQpATzqtmwmFcU7QP1pvWgqmtwRnA3Y1VKF
	lU1XNYB163U3fzfiHtpw8xpbeSFi60Pc4na5EWFM3ExNDu2LcJ7wsQZVKdSuI+RxLWjPuENpYvC
	cWEae+flQJtZOW6Y5Q/t8CVLHYhB+6CoWvrqFuJyh7J51OeGPpCXPGyBUmwrebwBAHuTukHWacE
	U1d4acPnMg3WfinQtka1hsCAWNCACsuDaaGpBomGkiMUJUfTtzNh8DW1AZaYlgxM9uWuZU+eJB7
	ASTdLOFSZ6Cdplhu77LY3cPvrW64ks+ZMAvOAXCpJg3o0chdEdKyy
X-Received: by 2002:a05:600d:8445:10b0:49c:cf18:494e with SMTP id
 5b1f17b1804b1-49e6198a3b2mr36939915e9.12.1789134209249; Fri, 11 Sep 2026
 06:43:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-unique-ref-v21-0-e83257373062@kernel.org> <20260910-unique-ref-v21-7-e83257373062@kernel.org>
In-Reply-To: <20260910-unique-ref-v21-7-e83257373062@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Sep 2026 15:43:16 +0200
X-Gm-Features: AcwNN1UlYe5vy_4Ph8n7W5xph6nzuuUOW4o-tvYKznIiNAx0UgbfO_rFNfVUhuY
Message-ID: <CAH5fLghC2qRh8qNmMHMWQXiWW9FAPdd-O4z-O-17FFDB3hy=+A@mail.gmail.com>
Subject: Re: [PATCH v21 7/9] rust: page: convert to `AlwaysRefCounted`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Ira Weiny <iweiny@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 11:01=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> `struct page` is managed by a native reference count, and kernel C
> code routinely takes its own references to pages, for example when a
> page is inserted into a VMA with `vm_insert_page()`.
>
> Thus, implement `RefCounted` for `Page`, backed by `get_page()` and
> `put_page()`, mark it `AlwaysRefCounted`, and return `ARef<Page>` from
> `Page::alloc_page()`. The page is freed when the last reference to it is
> dropped; for the order-0 pages allocated here, this is equivalent to
> `__free_pages()`.
>
> This also allows `Page` references to be returned as borrowed
> references without owning the `struct page`. Remove `BorrowedPage`
> and update users to use `&Page` and `ARef<Page>`.
>
> Assisted-by: LLM
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
