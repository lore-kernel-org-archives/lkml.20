Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B7332FA30
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788320178; cv=pass; b=LKj2LfHFCZNr8Mz2xloPlXLfOVvw7bww8rLZqYom0hhKUlky0CfaWYraUpD7HEByS6PqCW1Gxf4DbrcAptqHzlWeUMd5Tn3BXFcW/lAUnDVPrx9ZaeOnQEfvnI99YuvpdNHi9EJcnFWmqkZ9ZKUCWWzsVafMAlY1YZCVi49DJWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788320178; c=relaxed/simple;
	bh=76NXQShZ73vzhWxjJQ0j7zqbp54gjiB/2hR4sJHXnRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nWLJbx0kqAludZmRrKsSGg7/RX7J8s5nzIvu1LROXTm5RBtO3R+GjhEPGkmxwYDSpBlwD2inLBWE0D6XONj83NpQ+z7ctwzMIIdsXchhZXz89LnbqJpfBmyH6nbmlNrKVu4/HgFR1hV67PBS1S+OwB06HEq48kWoCooErPpWy/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KkeglZ/Z; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KkeglZ/Z"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c01c79467so188931cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788320175; cv=none;
        d=google.com; s=arc-20260327;
        b=ibC2csZJgoedlmQBsrP0g7YFdJyQKtw63jakvTy0dgu4TRN+PlXPhzGCf3cTl2iRcj
         wZKYtG/xfCuB0yYUrEcD7Jo02WCNXzqw6ahm8gnNO5XaJ1XOe5PZS/lS+1KKBHHcxCrh
         pG0fSjyMjruQRieeIECXc1I8aPMsLWr8YzFeLjX3XziWS0NgWHLlrpzu6DtjU/qv47XV
         aqnL9fbcFreNcmqBt+zMqjjG5SLU5H3Z3wFpXJmR6p3jI59cCg5oAxx8cYfA2xqxSjnG
         YR1lClniu4PBflmFo6zMhigusp+Dr/pKNtXR5k//tpq/xrJDVb+yxD/6Bjb1yER1OzZ0
         pUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=76NXQShZ73vzhWxjJQ0j7zqbp54gjiB/2hR4sJHXnRk=;
        fh=JfmpcuqI9nKWrB7fPYapv4HaQ1rJnvjrAfCL6bx46wQ=;
        b=WHPTVDMl8uRyYTnIgzyyWoHiSsaf1ybST8jjEDBpSf2Ak7eheSo8/FpcWervRftyuM
         7ZWsTffkRTYBotZ6494r/UrGupEbVUSPbD5sfv5ID56TDyAZdqON3FYWyQ3rVDUxq0t6
         nG+UbgeYVwWdSC2Cly+m4K2zC4DZP1DLINEGxhB5RIJVZRP0lfObf2hL2I0UbWxrL2zA
         otNPVma9h0/Lo0JLC9qM62Dmp/enwV9fZXG/5qFoLTSZf8M1/PdgdGYIMzCtbxTZR3Ac
         KU2dymqSz0wMzXGmgJ/jPemfVLebEkywABHR9MIg7A78gkAYpeHaSNuZYg9qk3HMaSSZ
         z2ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788320175; x=1788924975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=76NXQShZ73vzhWxjJQ0j7zqbp54gjiB/2hR4sJHXnRk=;
        b=KkeglZ/ZTSO1YaQfEfX1Foq0beIc4AqiL15dpbfgw3vejcWeupvEQAhjGXoe9fZHCd
         FwTwL8cebNrVllETNERZTuYX/rUwk6IfRfrBODBiELrwFtuOwYX9VmoMr6Wt2wSW40Vb
         /RbXfhnYAcjO6ttXgPtYeAVxVCTMAYtJKuXIJh3BA1kHGdj6hxTfyUoTq+gsMNuOG5OR
         4eCH7cEhiw9kzoYY7HiN0ZDZziYOitn5KRxG25mm6ftEVCn8zX5rRA15IL81DccZZHjz
         DjIG1uQ2y6U9wbspCH/BwFP3ZjXr+QBisbvT7zYJS01yMbg/R/LTGL32h8Xz708nsOvw
         pQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788320175; x=1788924975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76NXQShZ73vzhWxjJQ0j7zqbp54gjiB/2hR4sJHXnRk=;
        b=SP/NbP9Nugif2S6MBpRtlUNKX/n2F3oTfYzIq1FSjH8S81imckzRDTsgQkjUlV2uv6
         LMowKeC8+9yr1V9ytoyK/rw7bHY2wTgFK90OCCVsQlz4MknGAlHoHz8+/w5VYp+e4T/u
         PF1ZiPqEZWVwzDul59fvSJvcKFL+fHxq+b7RtPAO+dmskct3RBBKuxqIwpSMFBJoDQy3
         XNi+jx45vUrWjc+mTtEaADhY34mdWzyegXyATJn9fv5Jfl1kMhpILkP7+jonJ86YmPTU
         94rryTsqih/EjTkF+b2Aip4PwdO4ieWl3PnMI3dBdyNZ2uKu/yrV6Ub0SV9H9SHRmQdq
         JpiA==
X-Forwarded-Encrypted: i=1; AHgh+Romq7ngmsLNLRbpf/SAHxHdyWNpf7WyAZGvrVLaMhy/oTM6NldmVPrteYzJbEt3wWDHNwOohrbszqZzVjk=@vger.kernel.org
X-Gm-Message-State: AFuF++lGpUAYVXpZTAjdWn5Yurzpqhbwu4c03JBJDjrwHLHC7H0U5pz2
	8sUYykmI9dwX0Jr7l1inv6t4bfWcTy6/RKtY1Ie6jazlyeAT9qN8WX/N3bxM/q1ggk7NH9R1+v4
	TLVV1aXCSEM8WiN26wMtRVNfqwRjzNMHnIXy7R5TW
X-Gm-Gg: AR+sD13q7qjMCHl1DKk4TO4lKsdt6WXuvyTsyTAjEvRXcRBFpFg6iPRqZh12vv5LC6D
	ewwKcVIXJePiHSFwDQv7Ms68Cm7CZ65XvWOo5aGbeIyIgbmcgWJcrikhIIfJF5a51dxFPGAm4OI
	cZbK6oF+mrVtNka6VdU7p6klWooN0EvGViZQeeqqBYJgjzpoT3NjdUBaLbwBKP9Cb1eEAQvEIC1
	wpGUXfUKS2VWyFXWLNO8mqedvB7jPUweRzYKX/Dp8GCSCsrgR7jFH2Q5rW4vb3zc6IQAaNZb0EE
	VLkgmK6ajj7wTCpzKFsGOUKF/aYN6loq00y/dWlEYJ/aoU88jxgJ72hJrr3dJ2nU+tgmEkL8dOB
	M6fgwKmVwWIlgTXxjRPWuvctOGkm0
X-Received: by 2002:a05:622a:1b21:b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-53035b635edmr5765381cf.7.1788320174962; Tue, 01 Sep 2026
 20:36:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813002618.3755631-1-tweek@google.com> <39f53732-dc89-43b6-bf50-2ba5c64adf38@iogearbox.net>
In-Reply-To: <39f53732-dc89-43b6-bf50-2ba5c64adf38@iogearbox.net>
From: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
Date: Wed, 2 Sep 2026 13:35:56 +1000
X-Gm-Features: AcwNN1UK8iToxVRYZbB0QJOeCKOrbeItGVVek4Zgwjy2T1K6oHlYjRUdS1Q2Ww8
Message-ID: <CA+zpnLeAag+YBtD1Pe=8UPc4Veq4k1yGkwtaJacz+vB4mwbFqw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 0/5] bpf: Introduce LOADER_LOAD_FD
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Jeffrey Vander Stoep <jeffv@google.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Eric Suen <ericsu@linux.microsoft.com>, 
	Blaise Boscaccy <bboscaccy@linux.microsoft.com>, Sid Nayyar <sidnayyar@google.com>, 
	Neill Kapron <nkapron@google.com>, Eric Biggers <ebiggers@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, KP Singh <kpsingh@kernel.org>, bpf@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 2:11=E2=80=AFAM Daniel Borkmann <daniel@iogearbox.n=
et> wrote:
>
> On 8/13/26 2:26 AM, Thi=C3=A9baud Weksteen wrote:
> > The bpf subsystem supports a signed-bpf infrastructure to guarantee the
> > authenticity of programs [1, 2]. While this infrastructure is ideal for
> > dynamic environments or enterprise deployments where untrusted binaries
> > are loaded post-boot, it introduces unnecessary complexity for static
> > platform use cases.
> >
> > In the Android ecosystem, platform BPF programs reside exclusively on
> > read-only partitions that are strictly verified at the block level via
> > dm-verity. Because the kernel has already guaranteed the authenticity o=
f
> > the underlying file, parsing and validating a secondary signature insid=
e
> > the BPF subsystem is redundant, complex (because it requires X509 and
> > PKCS#7 parsing) and necessitates introducing additional signing flows
> > during build.
>
> Note that the BPF subsys doesn't implement any X.509 or PKCS#7 parsing,
> rather we reuse the same mechanism as the module loader has been using.
>
> > Furthermore, relying on signatures forces the kernel to manage a
> > dedicated public key keyring. In a decentralized ecosystem comprising
> > various OEMs and SoC vendors, managing these keys specifically for
> > infrastructure BPF programs presents an operational hurdle.
>
> There is no dedicated BPF keyring.. an OEM key built into a kernel image
> has no additional runtime key management.
>
> > Thanks to light skeletons, it is possible to embed the loading steps
> > within a wrapping BPF program (also known as loader). In turns, the
> > loading of the loader only requires a limited, well-defined number of
> > steps. This series introduces the bpf command LOADER_LOAD_FD for the
> > kernel to directly load an ELF file which contains a loader with its
> > data. By moving the loading within the kernel, the authenticity of the
> > loader and its content can be guaranteed by existing kernel mechanisms.
>
> Same issue still holds as described in [0]. Also, this sounds more like
> convenience for Android offloaded to the kernel.. (you stated redundant
> given the signature validation and complexity wrt keyring.. so what?
> don't you have the latter anyway for vendor kernel modules?)

Thanks for the feedback Daniel.

Vendor kernel modules are verified as described in the 'precedent'
section: there are no signatures per module. Instead the combination
of dm-verity and SELinux policy ensures the modules' authenticity.

> We're not
> adding yet another scheme/alternative for addressing signed BPF via
> separate loader mechanism.

I understand your position. Thanks for taking the time to reply.
