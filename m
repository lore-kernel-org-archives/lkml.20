Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8865480DE8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158885; cv=none; b=siGRxuxWudnzdSnZ5LR5DlZ8HEzv3Ex/Q5z00/KXUXL2q9HmSdwfax/EYs0r9pxh5qKSwm0uRSQMOfH9O1rhvcuKO/gub7mPsAfKmMr4d4vDzJMlt3rKcp6YPf6rDZV75dN9QspzosLiTIAyjrOjWgaRLC5/47p2CQm1BBee69o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158885; c=relaxed/simple;
	bh=deHPgZF7ogGMiSKR7XCrVK7BhURB4dZRyrwFrmzyzTA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VtL3VRQcgM7ha7ztuvkTlSbdkStIjDIyodoi3GHy/d9RhE64e69CFYegOIY4W+nQ5uST9uA6ZGd3PfG6/nkaYcUF+VpyxkIi4kWH43XYN4OQ0NeH+9Q4DQ90jTozI9zRbM9uC10vF1FyxMFI34fkvJto5B8XshOmw4o1lTvb5o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fvGF/DeQ; arc=none smtp.client-ip=209.85.218.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fvGF/DeQ"
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c40420222a0so58792466b.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792158882; x=1792763682; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xqeqqSt0YOpLVQ4yu04gr8nCmmHhkZ/s47wtOe1ej+o=;
        b=fvGF/DeQ8TuIc9vSb5LoVc9HS7NErLvMaN5IC758t4K9OSq96QdQkO6s7bSKF58/0L
         xXocvne9fCQNrFY/9c70ylVda2g/Kf+7bACBkX/oa57MvJQO4+DRB6mWLfpxha7T1Q0i
         JR827BH1fZskypp5eUAr822Lzv0neJ4hrhyXtB+wOBpb74cqpL0ajmpOOvS74fYr52ww
         PEzQYZSJOkDJJZfepkbLyBaRIaPZQdwOmSfahJ3A6OoEB/lHtz7scN7n6AVhj5kvomRO
         kErXM6/KoosyAOs+9n3GwYSi68rGyfBkJo+9ldV5njlfGKLOkjzA/+wZwha/2Jmr2DI6
         A1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158882; x=1792763682;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xqeqqSt0YOpLVQ4yu04gr8nCmmHhkZ/s47wtOe1ej+o=;
        b=ObzQZjNDR5wUjny8CxuLXFKAm05tp7yas9tR8yAU4BA6Lw/4w5TXFzX18sDdzmEQSD
         2NuIiOuedKgvJzvoDJrfnRt24m00a5HsktXInUqafK6yXbLW02CiEzhI6YpVIqwuSIwg
         cMyEAD/ssSNBDypDlLlNcfoqsLTj/XGwKA51TD1TxF6eOl64VL7KD7khS3GFvgbN31c3
         opzhboGh2WIadZVFqVVZQQlKjgMNTujc3d4VDUI5jGnPppG1WEKjgRYew9vUW1bHm75o
         IgvOvG7IVMpi0eDh79Syytzu2VEQM8B/Ku5YiKqNXU0j1n3zWPYiDAmJ4DbdgK+5hH9w
         PeYA==
X-Forwarded-Encrypted: i=1; AKwUvBz1ggIpgGvoqzzG2Nwb7uNaC+k9LqH2SUNxiw7iWSby1GMCKvpDEwRG2MH3T6YZqq/f/AeKi9Gx/onJpjM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJQEYLVO7fVUd7mbhIYH4GnLFZZeHkbJIPFcy1qQchw6Dq2HQD
	zCcP/isrr/xcP1WnWyb6VkJGzmKSbnUc0HreMs0sFy+B/15jNHwxBxyIgAxUcAAFHubMyjAcWRv
	3S17BV4+jU+7Q+RCOUQ==
X-Received: from ejbrh8.prod.google.com ([2002:a17:907:20e8:b0:c35:81ab:15ef])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3f20:b0:c3e:e726:9548 with SMTP id a640c23a62f3a-c3ee7269fcdmr508329766b.14.1792158881705;
 Fri, 16 Oct 2026 06:54:41 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:54:34 +0000
In-Reply-To: <20260814230923.1292966-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260814230923.1292966-1-dakr@kernel.org> <20260814230923.1292966-3-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016135439.44716-2-aliceryhl@google.com>
Subject: Re: [PATCH 2/7] rust: drm: gem: gate open/close callbacks with RegistrationGuard
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

On Sat, Aug 15, 2026 at 01:09:00AM +0200, Danilo Krummrich wrote:
> Wrap the GEM object open and close callbacks with a RegistrationGuard
> (drm_dev_enter / drm_dev_exit) to ensure the driver callbacks only run
> while the parent bus device is bound.
> 
> If the device has been unbound, open returns -ENODEV and close silently
> returns. This prevents driver code from accessing device resources after
> unbind and is a prerequisite for making drm::Driver::File
> lifetime-parameterized, since GEM callbacks receive a &drm::File that
> could otherwise be used to access invalidated file private data.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
