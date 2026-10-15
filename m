Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F26E417D99
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792106209; cv=pass; b=BerHfvxXrMTdNbf4W+HkaGpvailjSZC7kHqMBFJj388/MeXtSYJJdilJYYYx2yPpeNaOC47cMi7csAw/UyYh55NH5d6IRqgpUxwtio7GBVc6veu4tUw1cQnKfcR5KX9zBUR2VwZEKsoIqTCKCnTVKdg/CoTIKGZ1w3HS5/iQ/DQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792106209; c=relaxed/simple;
	bh=uXzkqKblq6fQvGu8ml3Oo6m6nVdHmv3RtEL3U0hTe/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DNvxxC5t1YukpJMEsX5/H+nkYWGSYusF7dtfbCaw2HHmapuo1GGqkweqmROerzVOLnMdy0A2Avw/swFLviGR5yvuKLZS1f4XOkxphQgj3RBjb6b9jCUYhpGf+M1nywvCFxYTKA7k+kTClbgXgQrzM9fYn1Na4eJvPKTZvL4A1hE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JtS6bpoI; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JtS6bpoI"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so2200a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:16:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792106206; cv=none;
        d=google.com; s=arc-20260327;
        b=Ke6Ic3Jbc+Zo1SCMLdTJqnrqfUyPoTx922c1W8OwFQ7kbaDBpb9BbLU0W/12xlV2K4
         GEjkzRwin8CIz98bvj5PMfmauhifsymIfRCeA2ajKHX/yXcZ/t5YMqfbXOsghFI4NCNU
         fJhOnaaQzu0SjFp8VNx9EbFW+MtipiOEPO3zHf7oRqb1ASjSc4ylbbcr/2WFvfmaw3EU
         8Qtl1+Aqm/WVo/EEBUU0WfGjNbfwbOoxaBS0+AdZPkxXwWWtz6D5Rw72K87PGPSwyn0S
         yf63c1t/6s0m6sRZrOD4sqPaUFbl5lqLAXgIhIO0Zj6Q/gioBBKQjMRQvE889PeWeHWt
         /8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uXzkqKblq6fQvGu8ml3Oo6m6nVdHmv3RtEL3U0hTe/o=;
        fh=upxz2jZBmZt9UaoRTol9gZIMYAsECqVD6bWDvM4MpZM=;
        b=eVFVf1u0PNGWSTk/DFBvpooCw/TJjzOUfxf40PdMjZ0/Z/pk+NjyN2k6xfUCeQvFeC
         mCn5sx14XLegOLKu3YKjvPyGi7U91ii77Qsjo/v5mZ13XOkV3jR0gjyBudaKdPJNqbBl
         yXvER0nibhtFxVtMX8Q9oub4r1WjDxXreli8zQQDQ3TZ5WAIDLi8oL4FC+Ni35E1skbW
         KeNbZBWMkB1g2O7JsHNfGuvuX9PUwVUmDd0Q8+7nj6WPro7HvNkFzLZLkY6RQzvd4Qgh
         gs93E7pNoBleFOsZIhV46AuIT5QkJRP5y3BtMd+/61liMSJsiTq1h9baBbdX4eT4qKgt
         sIVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792106206; x=1792711006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uXzkqKblq6fQvGu8ml3Oo6m6nVdHmv3RtEL3U0hTe/o=;
        b=JtS6bpoIGPX8r9KkU121Dx3KXEtRitrM9eVcCnhD6vEVlt0Q43Fu5CfhMBEfPY1LfM
         VFxcqJ2v06EOr0E+nnbhgllJFiume4onIgZTfZKuW1Zer1fj6wujqMdWWAkxeDeCmMNj
         W6rOEbqdJ5PjzN19pnipmez998FpHkrMB6G4tpoG6G6ejRL4sPbXNhf0FslcN1cXywcW
         ikewGDPAMd7587dq0f6MAAej3bvy0+mTUj9rIOpCA+OpeDC+vnJHji9A0uC4pNqgyjap
         mwMG08iSoKotX14BLzjxizXt9LpzHymD+9kDfdMfGv0dTjaatQ11ndd0rDD/m8GBWRQ7
         ehWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792106206; x=1792711006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uXzkqKblq6fQvGu8ml3Oo6m6nVdHmv3RtEL3U0hTe/o=;
        b=UG/aPCqPPVPA38i2vt16ccKDaO90weJGO7nDjnbmhC6o6lX0pbmn4L0vG/xWmJnZDC
         0suY6qZOf8dluwMMs5Ul96HHmnLrkNO9lCzR/0gVZqqDmKKmBqNhpDfm7ICqaYSj5rdA
         7Sbmjfexagl63aRzFf8Nl5OFCpIoe/RuFyrKSRwITLltghvU2uDf5ZMCDW4YLlwPeIq5
         Rv6fx8mHWu823qlBfuk2u2z3SNo6Aa3J8hAFHkC7f6XEDsao7G1Yfk4ApHIcGR9nEY17
         Wy0Wr+w+ZAl1E6UjXTi8gLpN5nEqPxQCn1k03JO3aso8yn7DJkYI5X5bn3hnZG3v+m2M
         j4Iw==
X-Forwarded-Encrypted: i=1; AKwUvBwwDB2K0XAaCsQ/nDaRrCtoKLOR0q+Sc/pje6UZFavTuROMp/VHmiWai3zIYuhQww8e2CjUHsSiFL3t8qA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWj8BInANhWEU3TjN2JH2vzC9dxKj4BO2oSjJlfB6lQujAVMpA
	hNl8OQvEOS96g0VtUFtjFvnkgjEDoxj/EMvv1b5KYESmDXy91QMbbXkd0sJ58MXCqp1MVOEA2rR
	VXBEUCH0CKFW8RFtYBmVVsDXypmNNoHv0K7vq0OGo
X-Gm-Gg: AYBFou2ZY4Qbhflh0WxeRfmQRMCTYHfHrqmjX4ni7Ea1ZRwnILBey638UAe71EBeqxy
	jOuAwSyvJwoa4N8W346/ZXOA265vmKlXON+97rZDdMwQn+extztHYzrB58DzyLJjl7WAlGzIQgP
	wk+QTK2L3wBA+Xp5RZREXwwVV4GBqKkPIVMKZpTH9Lkvsw7D+Rb+Q3k3ddTXuMcLAcFTtZCAw/B
	7svYPNHdeGN97z5J4OuFhudvseaLYkhpkO9p+t/V9Lfec4Vwh12ioc9tJvWPha3MxdM1dIswH16
	xyx2MiQhJo6G0reVIq2QZDitfqrwLKqR2GDrJ5a5Yf1FctIp07W3Cfo=
X-Received: by 2002:aa7:d58b:0:b0:6ac:bd5c:9e2e with SMTP id
 4fb4d7f45d1cf-6b38ba0eff6mr15062a12.6.1792106205772; Thu, 15 Oct 2026
 16:16:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-24-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-24-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 15 Oct 2026 16:16:33 -0700
X-Gm-Features: AclHuK9-OldzijEU45y2UUwduzs8NSJRwL3OgHFCmTXDYRVo0XnREasyo8UAXGI
Message-ID: <CALMp9eSZkbSEMkrbFDsWU962AuLVMMe-Uo_gesqrU7Nb_V+ezA@mail.gmail.com>
Subject: Re: [PATCH v3 23/27] KVM: nSVM: Do not reset TLB_CONTROL in vmcb02 on
 nested VM-Enter
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> Stop clearing TLB_CONTROL when preparing the control area of vmcb02, as
> this potentially undoes pending TLB flushes for L2 (e.g. through
> KVM_REQ_TLB_FLUSH while L1 is running), and remove the associated TODO
> comment.
>
> This is currently harmless, because nested_svm_entry_tlb_flush() always
> requests KVM_REQ_TLB_FLUSH_CURRENT on nested VM-Enter, which sets
> TLB_CONTROL again before L2 is actually run. However, always flushing
> will soon go away with proper TLB handling for L2, at which point always
> clearing TLB_CONTROL would be a bug.
>
> Clearing TLB_CONTROL on nested VM-Enter was probably done because
> TLB_CONTROL is not cleared by the CPU on VM-Exit. However, KVM always
> clears TLB_CONTROL in the active VMCB after a successful VMRUN. Hence,
> at nested VM-Enter, TLB_CONTROL in vmcb02 can only be non-zero if a TLB
> flush is queued for L2 while L1 is running (i.e. KVM_REQ_TLB_FLUSH), and

Nit: s/i.e./e.g./

> that should never be ignored.
>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
