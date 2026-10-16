Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860584D9F7B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158888; cv=none; b=UahD4CM2jm6F/kbU380O5CE+HLTrLI/N/qQpu0zQvPeMkhT0/xXn4o4yxVOkhBXw8gILu6CropDKpxIfYapW8dQ5AS082v8AnmrUAcQNUojXF2CXx7/dsRunDT+cocDeM6N0bqbzZVMjAOMCZgbZ8tE+YZ44rJ1qbdaOIPSdNMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158888; c=relaxed/simple;
	bh=VwOW9LuuRP4zm4xzSacphrIEqTeIFqxhd0KQcV0jQFA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iuQPaQGvmQfXDQju4OVv2XbeGd77eESliDrl57BSbfKzVqqIHOAha6SUaAteB+B8MqksEfRJAkb5zZMSLTZGI+ZgyytV6dPsPnpBJF/zjeGTi4x5L0Y1JRPnXcDunS5luKDEMEHtp+xy7DDREU2KJ5k5YnPn0G9tVrt1bhrnLE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BSc8lXJZ; arc=none smtp.client-ip=209.85.208.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BSc8lXJZ"
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b1c2d36cabso5719777a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792158886; x=1792763686; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4RB0qRPK5JwVr0FFzsYrhcGUqlQtMIIbndksgD1L2mI=;
        b=BSc8lXJZpkPoF+2rlgJS9NGxWRUoNGNjcpg90FXTMa+dlNDK0ul4x0h0Txk9VfGN1H
         RrDTFfa7bWowVGFXhXqcoMeAixP3dk4S2/30sb8hNY2xYquZGXBRljHmuWxxyfERxOFp
         DQQSeDo/3ynlHsydqSKDjxV+XHWaDKQnmmfr6v9wyIhdH5dOEI4v3oIz/yr6re7IZPGA
         k23A+T4u+1tEZr0KlumCLoEDw0xznEog/k2o2LCFt7RfN+VWn8jlexK/zuqXBkPmtQJH
         en0YcQ+IqjXTfckyjxyffZOSA+5EUMCGRxuFaYVWPPh+6vEGimYlexUYq0wGsB5+Q3l6
         i7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158886; x=1792763686;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4RB0qRPK5JwVr0FFzsYrhcGUqlQtMIIbndksgD1L2mI=;
        b=erGL6mMj3MFzfYSAoLmunzdMUrONtGpGz8y3wBqYyNx2V/DmZNCW+7xS2uUTx+2Ghr
         h1YMZ6uWniJouPjEacg2dGlmE5f9AVAU7tYZU2IZzHVjcFylcG3aQjU+WVnhfz7C5SE6
         x8VLVtstWE4AE5Yn2wHp99bcOtROLG20oQ+NT3pu+wo6pMZLeVTOOIJUAK+mDHUEvFy4
         +QvQR6NdDnztll5/xqGQERtuRwWMQGY0ml90xgxFXnmt8dBDwB9Bc3MaeUywhfKBq36q
         sH0nObEzwHzI2QHkkCeDEpfV7dj4XfCiO36X9pEFpN80xP7pD0RxDkJ/Mqe3v7wTKNgL
         xrKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOm/yHLxSs4yYJ+2yQGELqBkNaX7yrecNOIr0IFn6lVCUUyKqcaPiC764bBszJyHq71G+bVQA2e1B/OK4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5JPmnDM5Kdq1eOrkGkNCDsJixeSctRH5MsjDoJDj4trmxKEbb
	a/tROSxfYXKw9tGOTYUTMaUm+M2Wkmgad3P70l5lBXhvcGlyu/VtXW2qN38KQcUkK1/8TUdklX3
	HdnJFziz35dvIJljDEg==
X-Received: from wrwc4.prod.google.com ([2002:a5d:63c4:0:b0:48c:44a2:fe52])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5285:b0:6b1:497d:1c64 with SMTP id 4fb4d7f45d1cf-6b17c293eccmr19329170a12.45.1792158884099;
 Fri, 16 Oct 2026 06:54:44 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:54:36 +0000
In-Reply-To: <20260814230923.1292966-5-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260814230923.1292966-1-dakr@kernel.org> <20260814230923.1292966-5-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016135439.44716-4-aliceryhl@google.com>
Subject: Re: [PATCH 4/7] rust: fs: add iminor() helper
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, acourbot@nvidia.com, daniel.almeida@collabora.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, 
	lyude@redhat.com, j@jananu.net, alvin.sun@linux.dev, 
	deborah.brouwer@collabora.com, laura.nao@collabora.com, 
	beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 15, 2026 at 01:09:02AM +0200, Danilo Krummrich wrote:
> Add a Rust helper for iminor(), which extracts the minor number from a
> struct inode. This is a static inline function in the C headers, so
> bindgen does not generate a binding for it.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
