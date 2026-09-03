Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1B14A0EE3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788453697; cv=pass; b=Jp2H/AlkvRwv6NUPLJdt3CtCv+l33g7uyRpKrJpjhZkfVVtKZEDvMTq5UtfGs3rSgDuzeyL4CwEmMTP/XB74xZCabQYqQbl4mo+3Rn1obvc68AxnSaHLv+DAvxBdNJ2kX++r/NDLUKT47ELYM/fJ5Frtsc7EFOk02kwQCdquM/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788453697; c=relaxed/simple;
	bh=jmE5t/QWYXGduwCXTsexmNTSqycO4dgO83zrtscZu3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qvXqelN802G2Zfo7fvoRiSrK1r2BAcULTI4oaOHk0XPNTtOtxdppvi52wv7V8cbkVlqtf6Tw67b/ZlPzQEQkLLmifNQToR/2t0VEeSYuQRnVOqu5s3OauS6u03lDb4Rrbx5hv1CrJWDNbxBaiRnMuzn8S0GWlSi6athL7a2ZPRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CCt/bSuD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ByO3dj2J; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CCt/bSuD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ByO3dj2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788453695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=96jSKrblNa/MGHlSRt22d1bqrg1HZKp/dYSrKcWfd2w=;
	b=CCt/bSuD60TgCPDUEZpXzyoqPpiXMarYmCjPx4EsMB3itKnSSSZggPRvotoFC+OJD8SoV7
	Tr0AGH0aEXAbHWyWQqwySvZIw9eTLxp1l8Vt2tJRK6npgXOC16beL4CNVtd4MshaKsC4aQ
	MsXq/0anIWspyXqMDO0xc0PCWHvEHDM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-3GQBHI9jNMGc0TN9a7hnXQ-1; Thu, 03 Sep 2026 12:41:33 -0400
X-MC-Unique: 3GQBHI9jNMGc0TN9a7hnXQ-1
X-Mimecast-MFC-AGG-ID: 3GQBHI9jNMGc0TN9a7hnXQ_1788453692
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-482e8e1ac69so655586f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788453692; cv=none;
        d=google.com; s=arc-20260327;
        b=Ri9XBR8GDuugqONoUfLpKJFTGLqsM3IAQ8IRm1BxDynBwKE6qBGp/GoDFSYdqwLSpq
         hvN4SQqpXlQsyY0c/Zo901qDClcn1tcsPezKJ6OgCGvEjgcV8BQQGrTgoseS5MYT19vO
         3FnGwuR1VpeoGBXB7EG02j/f1J8gnrdUplMQ8gCWGHRbVZGh1Ok1fVfz7fqgNwDQlr5v
         YiZpdxPbFHAHf26so6EUrNe3EbIH/+Bao3Hagq61OusVI5wYseyzrDDSer6h2aI/BsRU
         gIx2g1HyhWmgJyTqvZ0Q1ciEzgDeWBEVyY7gr49MNimd+/J7tSvP+kb2HSLkbtgcOWoc
         XXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=96jSKrblNa/MGHlSRt22d1bqrg1HZKp/dYSrKcWfd2w=;
        fh=2/LvT52opmDTY54CAdjci+yF7pRn8OVZ0gmxhx/OTVw=;
        b=XzXfxpBHxR/6erqaIEBnW2/MHSvlAE02qSIIyQ71UCjGjsd2i1jBOKt2O8EnPjFXwg
         AEnXjpUXJJJG+jh68qBdBDUyL0NpzMGm07dl7rHrCamvh+tITaUjLml8n+1V3aQKt0nE
         2pRVT1HmMlmIDE9KOehsgziqnB0JEaNgLgXMvVQYN29JdCZwqqnHprTP0hz6Bk2EI3W7
         jK5Euun8bQEgLkkvUk2YqefBWfKEdVFo+3GZfu98BPUEDxCd+gV6w/tJJaTKG/0naMw/
         Ib1qk37Ye43oX70eLb22iEDF/12GDBfHovdtPW74/zjnvYulWmH8tlEJz3QTyzEeyxoE
         2+rQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788453692; x=1789058492; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96jSKrblNa/MGHlSRt22d1bqrg1HZKp/dYSrKcWfd2w=;
        b=ByO3dj2JbfalBQKaZuQA0LvU+B5tRWZsqkyx1ctjv/yXklp5JqEcKRMof+z/H1ZFQX
         meWNtFb+OK4BLy/kIzzp3EVxnWzU7en1KdTQizQomRQHtySm9z3Up27vdVoGTtuYymZm
         EczFj1MGuI2vMOUbp0QmFIgj3opCOO6EJGRcVkJM/f/AsNaNUeQutHoO9iWxNazcbedy
         1/GF5jVQiy35qDbYezKO3ChOk1CnDTlFebWL29JvfZC3ktZ6znJBYOxdTPm/6Dj6RT9Q
         FaB4ieKp12fnhhTYvWV9vOvirsXoPqkoXVdtr35fA1OruqQY8svFt5ViIGK9SBypmaYT
         1OTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788453692; x=1789058492;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=96jSKrblNa/MGHlSRt22d1bqrg1HZKp/dYSrKcWfd2w=;
        b=CW2ZlY56zH69CCAl2oWHeTieNZdCapjrMCrK5Jm7wQC1lE8aaaGTXtVhbfr7Qa0jd+
         R5wcRKK5it1i5wJSDp2SpwBMvQoy8UKT/YFNaBA4T91HLz+Rc5UvtNlHEnkuLvPniEsz
         634ocQL+PkhY3hi804C9o16K+U1uBVipXT1+tZDhifGM04rbAWHenRVdmdTxv/D7zYhS
         tn/JCqXeDgIbivCoTfttiG+qWaX9u2gMn636yj4dGkjmGvPSlJ4tkx5Uy9mWsrF2li8w
         ku3Jsw5eKkJA/HwLyB+1BA4oW2wdPSjaiqm76oxZo1/QFieha0F512NZFP20wS8Cci2G
         sfBA==
X-Forwarded-Encrypted: i=1; AKwUvBxDn10ryuxBJvy6yGgy66GB8n94wYTuRVwDlqf+vUaAsgoq3Nl2gairVGU65fCsugolN84C+7pwEyvJe4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++m55tdl1ZuYmu6IuD6afrX4Fnww/StriK1jQdcg7gz33c6KkJ8c
	A8kdRtW8TpZEvrDytI75cMzT1HGn1+xOWaNBoVi4i85T7ptPidmPIdfZcrznrJwzRGOT5dYsdDF
	JeLupVUPL2UdpVoB4746Vna5Sdorfth52GjRfT9T2jLRA2Z/6fOn31/NffdG1z78jGE97bbrSKs
	ey3Cprr7y2y8zgrwoLpfQpmuD+55jOY+XNHxliJzsH
X-Gm-Gg: AYBFou2fFCgoSxGLlfX004/AIY1wSy4ypi2XYD8TLlf7RRzWVRU7ccuzDsrhEFtOY8l
	JcDxKnEZCnNw/2AFEnNjyXsm0qlOutfPdry9dy1jNaJ1SfPavRJXV9T9Ko02gd2eX3+IMFA7UpJ
	3dNowzceUfHo4iQMhTUnKH9WnNjmeKUsxX/VmWIfY0aVhWc3ZVA2Kd+fcRlJZp/H1RkPKA6j3Qc
	tBdhsMRyqA/ljzWEXDvHYailOm7dQBwhtTWjXzrnSMFKg==
X-Received: by 2002:a05:6000:22c2:b0:484:3147:49c9 with SMTP id ffacd0b85a97d-48582315a47mr5571237f8f.2.1788453691904;
        Thu, 03 Sep 2026 09:41:31 -0700 (PDT)
X-Received: by 2002:a05:6000:22c2:b0:484:3147:49c9 with SMTP id
 ffacd0b85a97d-48582315a47mr5571189f8f.2.1788453691502; Thu, 03 Sep 2026
 09:41:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831144802.834315-1-seiden@linux.ibm.com> <20260831144802.834315-24-seiden@linux.ibm.com>
 <aphMx5hsoXwIpNjt@google.com> <20260903083857.33034-B-seiden@linux.ibm.com>
 <apmHrnxRLl9BuVhn@google.com> <20260903154317.246414-A-seiden@linux.ibm.com> <apmhX8H-WUc3U4_N@google.com>
In-Reply-To: <apmhX8H-WUc3U4_N@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 3 Sep 2026 18:41:18 +0200
X-Gm-Features: AcwNN1UO9-vCqk6RvEI48oEKpR6Wrb2Fp2swzaiyckPlKKdzDRVW5sMiBpGtdhU
Message-ID: <CABgObfYUYCRtmJkh1Ns4VBbWqk3ggnDu294G9rZ6tva56=F11Q@mail.gmail.com>
Subject: Re: [PATCH v7 23/23] KVM: s390: arm64: Add KVM_S390_ARM64 Kconfig and Makefile
To: Sean Christopherson <seanjc@google.com>
Cc: Steffen Eiden <seiden@linux.ibm.com>, kvm <kvm@vger.kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Grapentin <gra@linux.ibm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	David Hildenbrand <david@kernel.org>, Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>, 
	Gautam Gala <ggala@linux.ibm.com>, Hariharan Mari <hari55@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Hendrik Brueckner <brueckner@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>, 
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>, Oliver Upton <oupton@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"

Il gio 3 set 2026, 18:33 Sean Christopherson <seanjc@google.com> ha scritto:
>
> How many people are running distro kernels on s390 hardware?  And how many distros
> actually change the default KVM settings, e.g. to build KVM as a module instead of
> baking it into the kernel?  My guess is "not many" and "almost none", i.e. the
> actual impact on downstream users is likely miniscule.

RHEL and SLES *are* distros, and I am not sure which bank or insurance
company would be running non-distro kernels. :) So I assume you mean
"how many people are running non-distro kernels on s390".

At least RHEL builds KVM as a module for s390x, but it's not a
problem. I agree with you that having the equivalent of INTEL/AMD, if
possible, is a desirable self-check.

Paolo

