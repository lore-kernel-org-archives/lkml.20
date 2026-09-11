Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8BF471265
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117801; cv=pass; b=MjgJFvpdEJOmGK1CLspizEOp0fQf2Im8qdr1HKbL/SnBYWhBqWue0+uatHOZCbqGgrqLbsw4Ih1ahlZaQeY8vEJGDB7eoE8/9wn0i44qHfg0T+QY8xPdcYarQGuw9MwlwTAt+/qDI05aQjvJ2QdtuzkJH34vX0WVziHxVqq/m+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117801; c=relaxed/simple;
	bh=DqoU+uWaz7+Vutomy33tnRZ5BBkjj/lsKZ4FCxPriAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpMCgxIEA4gdg/WMCX09KM8KvvO9Zmzt3KmJO1LtlaPDHL1p5xSqHW6xiZlHedmaSHNq7wRgLXX0EmA1H7DdunLetqCJiYI3HuKefwYwx2WolrebwqbwgEWJg7U3FDm0YDyY12Rrmxts/yDJr0f7BjWJyM6NGkOBzyuRpmF/nzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eNGfych+; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eNGfych+"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47de0093c42so599208f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789117794; cv=none;
        d=google.com; s=arc-20260327;
        b=UgrPYU1PAVEnCG6PsKNAio5roljDghO7F9SFG+0LuIPAGlgoZ7JjHVIxVq3hfwKuHj
         g5yR1Y71ULpd1Fn6holUUBLf8/Kv+4lMVwwRKX9WD/4Z+4pTOlrCxC0w/GqIDw3uMLCv
         tesA/5kgvIJ/8tunhecUEwDNXUsm2pNDigLYqwnq4e68uUJsVoSEJpgHrc4R3nfpuoZJ
         NCYK3Ht5MKjZ7g4Ox7LilpboiqMiOxu+zQoNBVKgBW2cYRtZ6lQ1ZsnG+YIyix5/XoAy
         V1hBCdh0pDz7Z+eSOfB+I4vRyUyZp2weFSkXhvZkbGilBYeF6vaVn9HimQ43KBuQGEf6
         4G0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DqoU+uWaz7+Vutomy33tnRZ5BBkjj/lsKZ4FCxPriAw=;
        fh=1E2BmVa3DT4XqyAGfQUDlB2b/P1+DFMraWpD58Q1xjQ=;
        b=GGSlXH/D+E2wrHZlokB3R2dDxbgMk/B1vPfYlx0D91gvRf6WUQZPhkI+nnI2XohNI4
         yHD26Ra4McAPxVMTgba8PPIojjbVeFzmZlMj+xCzPQQOvZq+IubAb/ydpVqRkYaaDqe/
         BEswv5vppNLMu1h1EeBAqAck5bvvxmzw8UUxcIxFwq1wSaXvJIfL7dnd48lf94chSRKE
         thohel/BHTsoMQrgvdCoG4qmpNgUuiFSyl97KkSW2Pw1Ppx6hZ/ZRZ5E/bgjnGrDLJ5I
         apfcJhf9HykmVuAOjGjy7w0X1sTGXmFi8vTNKtK0PqKpJZdsPznN/s+1f6ss9vQpb80Y
         K/4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789117794; x=1789722594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DqoU+uWaz7+Vutomy33tnRZ5BBkjj/lsKZ4FCxPriAw=;
        b=eNGfych+G6ew1jh1huHnHXvI2jzl5xzK+HSAtpKSLWbZtctnZBu2UmqID47414dAOr
         cx+GEFp9K0+oennxk4sDJmqKuGbqewsDQc2MiXlv3XueKcIT4QUEsxHr3acPcqB4GIGI
         4HfDUpiKfZef2Ak8xHoYv2DUd/WA4jh9cyFbNEqYme427y/JRzTP53sdkcyitlue0+tg
         cSHI4NaOigA3QEw985dgxgJWsWSQQmnEy2RPoFxS7K41VrdkAK+TaHX+U7RqGWwUxC87
         IT2Y6dIHH1gJmnLcvMC18hEJZZtTgzCCCKBh2mFwW/AJ5GNUrlOSII9AGVrWORFUi5ob
         VCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117794; x=1789722594;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DqoU+uWaz7+Vutomy33tnRZ5BBkjj/lsKZ4FCxPriAw=;
        b=S8m+9XJpFmiWzZx6PGTQUzGseXzAv/dgG4F9prlQWxe0YBr2mvRqhtRw0u4qUApkcv
         rdyqDzNDj5beamqGXhwC2UiWKs3oXHuBLrtm9iWBs99n2hQbvf31piUeGSdpeyR4C1Oa
         TpWUWXqjSrEcDXQW6CdpaYdStO95PHYiC2hG334xfyg7+gykETT2g8mfleOrjbwVblSL
         ay5+WxdQd9kPPR9BX29XNwocDgFEA0MTbqVSpqT0To5aIlqwkKF7mTQsIdnmmlnycaqp
         945u2xA4Oh8cjPQVf5xvFDQAwCNaDdHs90CALTc6y4oJYQ0ZeJnc6ektbPcaPfkcsvbi
         WzhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOHz+fskD8zZcsXVG6PY0SCRYyqN4NARga2wd2pG58aumUkK/vjy/O83xPrtWLOARd4y1Vq/syAOygpek=@vger.kernel.org
X-Gm-Message-State: AFuF++kHgc95Trgetojo6c+9+hJill6bjbkekwSlh7yhxjo/Yz01OlBd
	xawengZXGGFzvmu6fLxc2kGLR1SPZcXp2i7996cM8/9TvJkxD6ju87aGcbIvg9lT/nIIkMV86VJ
	EAmqYJ8r9b5OKsieZ2DvWTP24BD3AQYc1cQH28KBd
X-Gm-Gg: AYBFou1gox8EJ0nOGjQyeyhSSr1AGer5N1b4E88iz1YipzUeqF6sNjMjq5i5IMTDTUT
	cUdHs62b0LwdFlEF2Rlo//pLj+B78x5fn+iRoM8OrwKOZOb3VktBPRUV+PxWmB0YGDa0kjbVL/R
	W3Wb3jw9Ibioh6wzowyDAnHebJprx3kGc4tNRG+xKXsxJehPl9zGPkPTLV9rLoSh7w6rUJxxsHT
	O6HASM8WsasUYkovqRVlbzGCXOEtrPc2rVUkxjlpYXSTzNeUoLFexOkgwDXbBwq3moj/svV8HeM
	YJ247bzaXif2b4/8u8vKXVZH9mKqrW5r0f2nU38fuAKFMaGApqReirYt6X1J1ij1kHONGbakS7u
	Qm8cDSshUwY/2uV+dxafHbLFlGrKApgk0wvtvMDopKKCmBLY9fzb8
X-Received: by 2002:a05:6000:118b:b0:485:8c16:5ef0 with SMTP id
 ffacd0b85a97d-486eb2fe6e9mr2544735f8f.42.1789117791504; Fri, 11 Sep 2026
 02:09:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-unique-ref-v21-0-e83257373062@kernel.org> <20260910-unique-ref-v21-5-e83257373062@kernel.org>
In-Reply-To: <20260910-unique-ref-v21-5-e83257373062@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Sep 2026 11:09:37 +0200
X-Gm-Features: AcwNN1U8uQc4Zj212gVRashrRro-WErwh8uVMQ_MWKQsPaL29993fZfZR2Hn4U8
Message-ID: <CAH5fLggBGvXayMT2QGo5JeQkYeJYc0L-348-kKLsBs_g45-fnQ@mail.gmail.com>
Subject: Re: [PATCH v21 5/9] rust: Add missing SAFETY documentation for `ARef` example
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
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Oliver Mangold <oliver.mangold@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 11:02=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> From: Oliver Mangold <oliver.mangold@pm.me>
>
> SAFETY comment in rustdoc example was just 'TODO'. Fixed.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/351
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Assisted-by: LLM
> Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
