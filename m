Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793098912;
	b=cyfdP/B4RTXIXv4HwdKDXpV0SwJM1+ms5OO3mRRUlHIVc0yjgMKEWaQQxSSAHRv6nyt1
	 v9gKmIsCCM6liMBqjKpX1SsL3R4tCUE/n2njEtJyiNGhqzepLzbcrdJAnr6BonzNZlqbJ
	 ljUmzcJKo0D1Fl3Z4ewQjhNVWBl60wGiBAvPJqa+joyc8bU3NWmZ1lZAwVynqsp1Dfypp
	 W4U5pVWnkjnH4Guq/au+gWpOM8uYjzZr9DbRSvj9u1VRaqxW3N/RbKqondkRI1qXTMnA9
	 MPTnhwyVrKDiQQh3pN1RrktswfegisrYM/pBDwlOG/IBc0Cn3d48CJt/49Q1nG1a5YQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098912;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding;
	bh=mswFdaLeZadM3beKHgTV0+pA+8tp/9smRtFllvNXA0g=;
	b=JIzEah/H4vguTsQhNESyhKDfYDteqTTCfq2h10tDGqGpTRIYM54Jrqcev0exkbhBouBT
	 6+bl+BC/v492q2ZCng00YXBFLFpS08eleMTaPMmrjdTGpN4PCgV+f1iGvP3Of47DQeAQh
	 wsHnbYXSfzLxKrSmZHZIeVZZmAUD49/dEaY9G4rt7VvDvqs8O0gHqG9K04hHfQvTTcWTv
	 tcamHtoV3dS4XPHQgwiCbMb6vglD4lBNHni0aaH89e8QUXXuK+SkLkxmIeZ/IuAYIdFTQ
	 QuKj11eOYF1W729nkdhx56cHrhjtyzQ5pH1f1TxPyAfl9luXkUfwxenh1wqrSC8qFeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R+2Gxmrf;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=h8CkmMDx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E160606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E160606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R+2Gxmrf;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=h8CkmMDx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793098911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mswFdaLeZadM3beKHgTV0+pA+8tp/9smRtFllvNXA0g=;
	b=R+2GxmrfjOGt+3sj+pqMhxyzZy01V7WbiAvZpLcz2SA6ElzOFtpt0FqYcHVewWvCoLhGNR
	MA84lfwGyTGJkrrcfGkS0lc8kNk+AKfFSNBymbhwCOJftpF3HsbH+Q78BhufG3+vkLH2cq
	yAqXiJnuez/v+rVGNdKMKoDWSUO/PCA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-cSxTyhs0Nb2GN_bxDCFcFQ-1; Tue, 27 Oct 2026 07:01:48 -0400
X-MC-Unique: cSxTyhs0Nb2GN_bxDCFcFQ-1
X-Mimecast-MFC-AGG-ID: cSxTyhs0Nb2GN_bxDCFcFQ_1793098907
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so1883580f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793098907; cv=none;
        d=google.com; s=arc-20260327;
        b=lG/Kv/b3Hut5wnHEvbINCt6IA1xhLiyRC46xjB3jYpHIu2T7dxzdsxH4CKcGoxyw07
         HfMOLA52j9bz8MTTQa3dPemJl7zOtxSAAsxhbZuINIVjqGjYlOMhq2kpHTki3+JCC1aR
         q8LrEqn6WOf9rD5f5AOr8zxcg2NAUBkQ+iEn0E+g8w+kehwQ4Mj2UmZxCSpw1kWAQwou
         qZVJvwYwwys0blTdqYIvgR1plvKylA5JL9mraVlqrMgJzBa53YolXruXq/tNRj4Vlb3X
         FpjznyFrhfDdCQcuZcmT4hQQpLk168MsVLizmYKYKjGhTAMcwzrp/kgOVEVLi6/yVi4Y
         Vyvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mswFdaLeZadM3beKHgTV0+pA+8tp/9smRtFllvNXA0g=;
        fh=6gde22fUkN5EXXrfnP3NJu1ak3VPcqT3hdOueXBp5kc=;
        b=NDaRBCUFJ5LYMT5w3Q6A1SWu4Ma/LDjg4u0teaISdBzN7Dti3LD6X7C47gHG/ywai5
         mr24mJZ7AWZFne7/3OsqL747/KAEObVF0tDZpQTiFEzptHuZRi97/2gezv43EI0GuxGC
         yd03Vkr2VtHc7YVLSM9T5/o7iYY1KLT0zVj1578wUiRhCLw4vHPT52DyplxcLe+xo2kt
         4PS98LUXQASfur/ynCnzLJj9AesPyHNcr3GR8zfdjSWubsruTMdPx7hgnCrCb5fGw6lr
         NFLfOyYC7FV4y2aE7V00iDyC2U85ihdxlhDi8wzmR1K5S36atX4JbMtnGn8INghSHG1V
         vsBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793098907; x=1793703707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mswFdaLeZadM3beKHgTV0+pA+8tp/9smRtFllvNXA0g=;
        b=h8CkmMDxwFeQPzEipZnEEoY5geM9lmoCFyaLRUlxzwiKmjHAwEaATXwcjvxzIYdhdA
         lVb7OKkiHJEJRdeunfEUNTCVT+EqqoKef+sXPxCxz6VbTcjQHB2Sx6dv991b3JG0OTzY
         S7h+esRMbhSymc8S7wTRpWaCsXDEPRY02HmMhzxcvAnvtSH/xwAOzIrGH4I6+dG1ab80
         WmuYdOGoyNccDn7KR150j40L1Degzkbg1mVbggT5Z5YTS5wahixC3U4L9Rfdh7ecc7i/
         Qt9J0/QnqCtytEMWZCL1+BWfKR4g46HI2LqgCH8aMTO7nHv9cxf5f+vjuk1X0nOehCBm
         2QZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098907; x=1793703707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mswFdaLeZadM3beKHgTV0+pA+8tp/9smRtFllvNXA0g=;
        b=O24yc+SkRy6BxW4FXxG9oilKvp50ChKznes35OfwVCZgG9QgxBiHUrqdh09VOffC5m
         KVvIqfNJUPxIijIsPhR08IY836M5Ufrzq5X5GxB3apdauJ9Yrj9X2bjvVuyM8Ni75Kw9
         1PMlgln9W5g3u3IQC0dVLR65sWzCqasqMMaj95Zxjl6Hz/es+RcoUS3mJEl1xNaikKrS
         NZxNhbbxf6Pk1j0c2qM+P6BpD4AvuyY/Q4Lfggx/KoHaEeFfow/432gJ2HstnIHLAmJM
         VEX2mmO9LDV4YIY5tmVbjdXkgQQeCWCsMQYJMNFTkCC49L1PBGxqG3eFUUBaQ19L/ILE
         LVlQ==
X-Gm-Message-State: AFq9FYJNFeepb/MkuuZk3eIoH766esNtqTHjUqyWwOBoEb/pVAzivIRN
	VPEUbypW30Y4SGqF9RgY9+jyQO9s/ReIdwOUz7QyKb1von+DPi8d9pXm2Z9c8J7SZIganHnjAKC
	OCdbAESt/hTCFkyHlu64sToO6qhCv7i/D6QV3zTboQEiKedQd0w7JRodC+B//O1taZIFgNJdeO7
	IjqZVPhIfYEa98KuLAZV/letLQvzpDodY8TFPsRwaS
X-Gm-Gg: AYBFou2A05+KYWTyDexxfxjAvqHIRoJspD0SpZJl4MPZ0qJYATEK5UqtsvRTd4dnBLZ
	47LgWiQ/jIhunD5ioSG8L6tTHLOFR0wOSebIdiCWCZxFrBMeE2Gi7B7ao5LzkwR/Eq8L+N9GXHb
	UTZg1krdrSSbA8qicfEPgggSsh7fRjRwNdeNrZpgrBUpscSBma7hiBP9HQpxG8I4GVbh+NzHrYh
	t656ww9EbN16cA6ZbfTX61/aswoFEJOjYfF+d74+r8zTCg=
X-Received: by 2002:a05:600c:8b6d:b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4a7669cc9d8mr64989035e9.23.1793098906365;
        Tue, 27 Oct 2026 04:01:46 -0700 (PDT)
X-Received: by 2002:a05:600c:8b6d:b0:4a7:669c:c988 with SMTP id
 5b1f17b1804b1-4a7669cc9d8mr64987735e9.23.1793098905407; Tue, 27 Oct 2026
 04:01:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260804120529.1730187-1-pbonzini@redhat.com> <at9ahKiYsVtH8kpU@google.com>
In-Reply-To: <at9ahKiYsVtH8kpU@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 27 Oct 2026 12:01:32 +0100
X-Gm-Features: AclHuK_gMHxkpSkqtzZpmI4E9n3tRQVDE0ExdUQ32JdSX7MqnvWed3WEPGPoNjU
Message-ID: <CABgObfYgZ87=W+6E=N=WwTuyYkaoKU3hqd84JDTSAvT3_9dh6w@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] mm, drm: fix interaction of .pfn_mkwrite() with fixup_user_fault()
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Alex Williamson <alex@shazbot.org>, bcm-kernel-feedback-list@broadcom.com, 
	Boris Brezillon <boris.brezillon@collabora.com>, Christian Koenig <christian.koenig@amd.com>, 
	David Hildenbrand <david@kernel.org>, dri-devel@lists.freedesktop.org, 
	Fei Li <fei1.li@intel.com>, Huang Rui <ray.huang@amd.com>, linux-mm@kvack.org, 
	linux-s390@vger.kernel.org, Michal Hocko <mhocko@suse.com>, Peter Xu <peterx@redhat.com>, 
	Sergio Lopez <slp@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 2:50=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
> > To sum up:
> >
> > - patches 1-3 introduce the new MM API, and use it in the DRM .fault()
> >   callbacks to install writable PTEs in response to write faults
> >
> > - patch 4 is a preparatory fix in KVM, eliminating inconsistencies in t=
he
> >   handling of !VM_READ and !VM_WRITE VMAs; these would return different
> >   error codes for a !VM_WRITE VMA depending on whether the PTE happens
> >   to be mapped (but with wrong permissions).  This needs to be here
> >   because the next patch would introduce even more inconsistencies.
> >
> > - patch 5 moves the check for writable PTEs from follow_pfnmap_start()'=
s
> >   callers to the function itself
> >
> > - finally, patch 6 is a KVM addendum that will have to wait until
> >   the next merge window; it removes yet another inconsistency in
> >   KVM's handling of !VM_WRITE but is technically userspace-visible,
> >   and therefore it shouldn't be included in stable kernel releases
> >   unlike the rest.
>
> What happened to this series?  It seemed liked something semi-urgent, but=
 AFAICT
> it got silently dropped?

It ballooned a bit and getting acks from everyone involved is hard...
Either I or Sergio will get back to it.

Paolo

