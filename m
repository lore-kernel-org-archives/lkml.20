Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD97B385D78
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238361; cv=none; b=DGAc5VeXhl/Mw08TaA6hHUOVCWB13GUYRXot5pTsUPU+btGFCQLt35Q1buCM8pFMI+poCGnAD6du5DLJE7bKt4UX8Yw2VRHaCdeD+MiiKyWxJzIYhtnkGyM3DuNNjxi+xYmoIR3Ss6juuXmhgu/Yn0rZ1AjQ5yDoGKVegKO/0iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238361; c=relaxed/simple;
	bh=RHFOQcWkssNSHMk3U2riWeemkiOeUnPytJXwgyjSic4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VUUWysjksJtSGJhtIwNmUaVpYITRwN/188C0llw7TjssFyrTKj2uOb7j8hLl27yeHMwScjTk7s9R/SgKDLd1Zz/wzwF1GrdlHSJEKvnIObafuoUvKDi9V13owKZnHE/g/bMdb32DMxmWuLrWdt1Iwz1Smm2co5nDqycXkCNZdX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PKzEc5Oz; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PKzEc5Oz"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e6422198fso12092595e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790238358; x=1790843158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RHFOQcWkssNSHMk3U2riWeemkiOeUnPytJXwgyjSic4=;
        b=PKzEc5OzDgd8C450DlWEUs1mWIDiP9ufm6TGSESFGjjk6VtAJGJYWLFoeP0CnArCj2
         KNBmDLoCVJ+5Xfe5Ydb0+GM0wWEdhrfshg17S+JbCm1LsL1GJFhnphUllAmHMR0oq/Yt
         9scj/T/dJyrHnEQhJ7DNouUs+S51XDF6XrejGcfyNFN8pQeOty7YVqktUl2ESRd4aWow
         R/X3gtVIjjcUQbqC38BX8LUdPn+bnqLnffvmctFL7eWc++N226iU+fL2SMfnWVr1dUXm
         G6/VPnekOzw8bGwrD09pGh0Bb9ekeFAzV8A6OqSZjkHNum/3cGV/7d+fcZT53v/VEx7w
         yS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790238358; x=1790843158;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHFOQcWkssNSHMk3U2riWeemkiOeUnPytJXwgyjSic4=;
        b=JNE7Omi3y1HuQRVpTcds07BCULDItSw4QXS9Pj+s7YEAsRI47eD/fha6jcDSkPJKY7
         +R0uzl3xgNj6MTKV3+kT6lLQ/uFSRigIJfPvBAGKjX5Y91ui++misA77CDTTmWCDFELO
         ufpH4duGwAkciHJeRp8odGxY1i61ShIBj9Nip2T4XwwXhK/p9WpXDWIROUH6OUgKt+IL
         g2GL0729Wm/iVuVs4HUyc2wBI9georr17AfE+RXKFsXZ+wGzcxnM1XGB40u6njtFXjlD
         kUq2NhNSuEKsW5Jo/ZK15/yDBpAbD9jWCDogN8v1yRw7TxVQ6PvUyAnMRSORrnXDL9J8
         7rWw==
X-Forwarded-Encrypted: i=1; AKwUvBxu1KFzLjPuuU+LKNfi86WRkDKwX30o9fb8o4TuwiKqGP+W1mdM19k6hnmYNoAYf6ChYmIoMAlg++JQ0Vc=@vger.kernel.org
X-Gm-Message-State: AFuF++kjMUaPBLY05QWFpQvR/rUgS5aW0w0Yc6mf8wjjV2p6tapWRUbH
	+jT+nybUb/04gnyqJ6hgOnlggF8IQMLXcu3Vjk2v5cA/CZOK4CKLXtvTQFGILAl7J296bFcstwn
	dG5kakSyRHgu69K+brw==
X-Received: from wmep2.prod.google.com ([2002:a05:600c:4302:b0:49f:5465:6f37])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a013:b0:49d:2555:1a6d with SMTP id 5b1f17b1804b1-49fe66f1ac3mr23381275e9.16.1790238357799;
 Thu, 24 Sep 2026 01:25:57 -0700 (PDT)
Date: Thu, 24 Sep 2026 08:25:56 +0000
In-Reply-To: <CANiq72=vKg0c4CL_h7PcZ8gSZ4U-KgZVXJ1kNA8HNha86+wEEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260113192949.689834-1-lorenzo.stoakes@oracle.com>
 <20260917041453.1029362-1-springbreeze@stu.pku.edu.cn> <CANiq72ko6sGmmUhN4bSfmmmnDjo966_D6ro8y=EGhAw11ZVCzQ@mail.gmail.com>
 <CANiq72=vKg0c4CL_h7PcZ8gSZ4U-KgZVXJ1kNA8HNha86+wEEA@mail.gmail.com>
Message-ID: <arTelHxCOQzb99fr@google.com>
Subject: Re: [PATCH] rust: fix typo in bindings
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Chunfeng Song <springbreeze@stu.pku.edu.cn>, Lorenzo Stoakes <ljs@kernel.org>, 
	Chris Mason <mason@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, wang lian <lianux.mm@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 10:13:41PM +0100, Miguel Ojeda wrote:
> On Sun, Sep 20, 2026 at 10:54=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Thu, Sep 17, 2026 at 6:15=E2=80=AFAM Chunfeng Song
> > <springbreeze@stu.pku.edu.cn> wrote:
> > >
> > > Since the fix already has three Reviewed-by tags, I assume it just fe=
ll
> > > through the cracks. Would a resend help? I am happy to send one -- I =
just did
> > > not want to post a duplicate of your patch without checking with you =
first.
> >
> > I am happy to pick it up as well.
>=20
> Cc'ing new addresses for you since I got some bounces -- hopefully that h=
elps :)

It'd be fine if you took it, thanks.

Alice
