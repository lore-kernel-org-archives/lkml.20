Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829048;
	b=jK9xDYAcVtW7MqaiZtmf9xjkBiR9uEUyXyjYcm/Y2h3X3f6sWWMwhZifVPLz/GVUbSGr
	 Ck25X2tXaros7SHe3u9Sroc4ml8frLGE2Nf9CTN/aT260gqHSpjo/C4+jBnyMCC3YEk2m
	 csV+0mgGVdSCuMyRIZviN6IJ0yqfgKuT65SRJzXnXzdk/p5KOCe1nKZnKVz3mqxVHf3jr
	 +mMGHjmKhjoObSpb0MAFAZmlmH5++GnTno+XH+uxtb0+i3XHEIt62OIwB0DHNUZ3IkR4P
	 dmaytwvCWxEbZq/ByCS/HnKPFt8X2aKssvsRtZaGQl9pgj5P2CsxT+Z9omCwdXT6o0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=dFChQ0mLr2TKcvvcevcbTzUnz/dF2dQnZUL2ZukNc7M=;
	b=tBtxj8zIq/qNbMWYw+A6909wPepwoVzD4y9Ro+VoKjDEhcs5BilFkNT2r4FkcLUgYYtA
	 oZ//zalT8lORPSe1JuVrLu2b0+pn/TBEVDd/DlarcDO0SHZ7MKpYCSN4xI8cvtEEkW8Mb
	 z2KzbphG9zDqmtPfnzpKnA0hrr0+by+6YIEuqNXmuurzgWELIgXEgAlza4D1FzfZCoXE6
	 W96m4nALvltd5YN0n+3pkl1UV+qaU3B5Z/P3vYDicFoDVDiK7J2uc8qdwqV8IVBjChynk
	 5ki3UQt9ouzEfWFGyKaAJdWiGMLgjMpcDKMy4q0DVYQaPmjMxrpzexciS4DHjGOTSmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M9S0tvwz;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716A360807A8
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 716A360807A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M9S0tvwz
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed1fbae872so7318105ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793829048; x=1794433848; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dFChQ0mLr2TKcvvcevcbTzUnz/dF2dQnZUL2ZukNc7M=;
        b=M9S0tvwzc3cQs/jygskQ5D8xUmXs1a229U7+1Z0I98bqqBjLA/pme3j2jrHJ/tu3dg
         WXusFODXXGOllpNsB2M2bk++eeUlT5C/w6TJ8QxTlcWEVdsqHbnrTTwUeU/s3EZJREwQ
         vz9ebxujUXuZPxkwjDmh45JnUTNAOsh6QgzIMILNDcRqrVURkI75NvEvHq0RMj7K4etr
         PevPKnVPUQXSkiwaBr1C8NkgfhIYiMEcg77e78qhI9pZ5mF8LtDKZeNErJDulCMYsk4q
         62/Fhyk5Pc3R6YSq8BzBkUxAbD6dM3rPXfV+iHgXBsHecd37xPL98lsIWlMNeS99nYSJ
         hSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829048; x=1794433848;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFChQ0mLr2TKcvvcevcbTzUnz/dF2dQnZUL2ZukNc7M=;
        b=kTW+mcOhm76IIwTQQ4l0ujx/wIBvPe8hOv8p/riLuFfS8BHeEpqyRE/OTpaRuq8ok/
         q6lFnlXrGjrLIMhG283O8QVjyHc4tXOVMX0bPU/mYNMgTq0OgH1YF3U9SFYrxKrYcM2O
         DIRr9UtPVKlaPHbB00TH7DHb9V/ksC8A9QcHrhb/OynJUPCvXEMsF8JZ6Me0khOZ4+2e
         mp0cCThjJnQhtXP5hftMYMMlIMHHw/703CKM8FWxPsXQIIrwMERNBLCO9r2q7QlCRNuJ
         CXv7og0pVgqF0AQlxS4/ykimnxgZ1kWJw/lY+pE5S4ezHK85ZaNLdZHe316jNQCcdOnY
         UgoA==
X-Forwarded-Encrypted: i=1; AKwUvBwp5Ijy7TaYhxeWlTGM4saKdUdHCz9I1ShO0DZcm65DAEzqqbAQh57m7+SLJV0a6+psAtpBfym4Vf9NyE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6kWxs7kMaElJ1eDByjId5vEi6KZ33lKDbgAw5iXJykF+mygS0
	gAQvmvTyAD/zqAPFme8QFNlHlKyMuCIYZCT8P2hTK/6xz/E2uEsgLmRMKnpVNNeu+QLwfXDnF6k
	mF+gAiQ==
X-Received: from pleo5.prod.google.com ([2002:a17:903:2105:b0:2eb:15a2:31f2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ef03:b0:2d9:216a:cdd3
 with SMTP id d9443c01a7336-2eb3649be94mr173739735ad.18.1793829047606; Wed, 04
 Nov 2026 13:50:47 -0800 (PST)
Date: Wed, 4 Nov 2026 13:50:46 -0800
In-Reply-To: <auue7S_vdnGtTM3c@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103002205.3348519-1-dmatlack@google.com> <20261103002205.3348519-6-dmatlack@google.com>
 <autHA6aNrg4s5PkV@google.com> <auue7S_vdnGtTM3c@google.com>
Message-ID: <auuotv1vFpocCSeW@google.com>
Subject: Re: [PATCH v2 5/5] KVM: selftests: List the known IOMMU modes in
 irq_test's help output
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Alex Williamson <alex@shazbot.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 04, 2026, David Matlack wrote:
> On 2026-11-04 06:53 AM, Sean Christopherson wrote:
> > const char *iommu_mode_names(void)
> > {
> > 	return __iommu_mode_names(false);
> > }
> 
> How about listing both? That keeps -h consistent with how other KVM
> selftests list the options for their arguments (e.g. backing_src_help()
> lists every backing src type), while also showing which modes can
> actually be used. e.g. on a system with only the legacy VFIO container:
> 
>   # ./irq_test -h
>   ...
>   -t	Override the IOMMU mode to use
>   	Options: iommufd, vfio_type1v2_iommu, vfio_type1_iommu, iommufd_compat_type1v2, iommufd_compat_type1
>   	Available: vfio_type1v2_iommu, vfio_type1_iommu

That'd be awesome!

> The available modes also get printed when the requested mode is not
> available, i.e. when the __TEST_REQUIRE() fails:
> 
>   # ./irq_test -d 0000:01:00.0 -t iommufd
>   1..0 # SKIP - IOMMU mode 'iommufd' is not available.  Available modes: vfio_type1v2_iommu, vfio_type1_iommu.
> 
> libvfio exposes iommu_mode_names_all() and iommu_mode_names_available()
> for this, built on your helper for juggling all vs. available.
