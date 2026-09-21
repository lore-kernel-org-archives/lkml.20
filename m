Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34B74CDDF5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005027; cv=pass; b=UOOSBV+tVlIERPSaJQMarpw+8jkwgKYkKNtHDmOUwwTxC1x5yzQhjKOfWMFsfYRqWRl8EfHcXvsFs2+bh3wKTss1Dz1AsjjsyfOoP5NjXM5qg/OZ9ItBDJ744qzK1OzgTOuWEqVvfZXSraTPvm03NWseKMPzAub3GS0eFc84hXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005027; c=relaxed/simple;
	bh=605+kgvDQ9CC7Dqfh31X+6P5aO3gnNTo5Q1U93YCcDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxVHKL9L5V7EK66rwO4f30g6geOPYEl13ymdeSs60MmgAYkOE22efizqhd7wud/L/4Fyaais9j6cOs6ev7pWNuDL9MgtAHAQ300v2yHGn4Mnboj7ZTpGyMUVyAXzscW52fzGH0rlzaCyp3qTbS+G+itho0Gz2Xq4bek/TpdEeEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=foGPqbI2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=J/mjoLv3; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="foGPqbI2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="J/mjoLv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790005024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=twdk4Tne1/4O9YpjiNMs8jU+vPfWAzKxomteFVmFtns=;
	b=foGPqbI2YKkrgTxlMyIKMSRj5zubUOOfpg9QYiyXE+aespXZjdPVgZC58urN98LsKpGBIZ
	Kvf4jQg7CkK2sVZ/YWjBto5MTTIbvZ39l2q2HecKCMcYLnTXaKXScNn5QWlgGIpgFegcDB
	N7s/e89fCX+Ccm5XuBsWWyYQ1CSKn2o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-QDaryvPLNg6IEQfQnGNQ1g-1; Mon, 21 Sep 2026 11:37:03 -0400
X-MC-Unique: QDaryvPLNg6IEQfQnGNQ1g-1
X-Mimecast-MFC-AGG-ID: QDaryvPLNg6IEQfQnGNQ1g_1790005022
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48706ee8fbaso1654558f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790005022; cv=none;
        d=google.com; s=arc-20260327;
        b=nV3rG2yo8gsrIZtQ8f/gAcQY9ej/nWJqiVh76qrpN6r/oSXz8gfsRQqpg9Fn51Zab1
         l0UAS7gH48QnlB/JlhgJ9XdYQSofNLFLUNH36YS74drkX+BpH1DbdXjgmhcwNMca217N
         jInE8QJU4HUcNUdAACfwVW1BLE/CxxKLfkpvBw9qIJjwDTgAhDhSQZaLgH8jy9voKQh1
         qQfY3gMvtV72FfmScaoaFFGOIyAxjEPGSnDCpvcp7P5VpLiBrpeug9aDSdHNUh70Fosq
         5ddQ0Yj8nv8nhIZCFmY1/GkltlStDrg3IlMUAFCnkOeECfJQ2WT76a3cuZUGJt3q2t+5
         yL9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=twdk4Tne1/4O9YpjiNMs8jU+vPfWAzKxomteFVmFtns=;
        fh=hfRA0N0hj7Fayfg8zs3tZvs9E13sLOXKLsP0nVtB8Y8=;
        b=Ne2kqbE59Rpm69zEc1whHlmkdVd+iErpWbGkVE64zSpu5f4DfSYwANe14YPVsf9/Vu
         IawSneaEvXxAquVRDPHo6I0wGTbru9G+NeR3zQfYnHcc7WEJqQS1GokbdbbzXsAes490
         wzs3NBHFgi1CSSiDs37NgrHm2aiZnBb8I0Ue0jmepn7Pcfe7rh8QgHvmO0qykbcam9jZ
         FV+Xebr7fvo78fLlzYDTjVeT+Lfufy428P3eOWUg5acTq6UVQfHbDM/UlfCVNdOE/iXo
         XMYlp+dqcThO6P89nRRzbYGtaNMHag7E6WC/uCNzdRoJ7lEt+FgTt+D6tVmCSu75dZzN
         GGWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790005022; x=1790609822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=twdk4Tne1/4O9YpjiNMs8jU+vPfWAzKxomteFVmFtns=;
        b=J/mjoLv3lq/5l1vx0AmtPWjy1dLhe5zJuMeC1Rkv6JxHOQWCGF47FKG9OU1QMf8u0r
         C4J01gAjX7HtLAdVN1eJmVoI7OPZv3EZ7fKVoJDVNlrw5J67pVIqTK6gnwZAEEOXyTVT
         8f+wckoGoZ125uIfR+RpO9Ymhmui0veB4yScleOPk5ZbYcInrS7L1frtR14RadzSM18G
         73yePQrUqt5RaBDQsJuYVwjQwoWkqyPm0bjLofFdQ1z1JmCXRhTEwJgxuMQK07GTB1dF
         kPgfEEv/YeuYiVF1aXp7Y2jnu+x14d5xgAx+rz4EBrDWgRjqRdfMWzxu99bBJFPjT2bX
         rUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005022; x=1790609822;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twdk4Tne1/4O9YpjiNMs8jU+vPfWAzKxomteFVmFtns=;
        b=KABPv0bJ7LWsnHXUWoAjRgL1COrPWmFmUL4PVvKakPhiPKkf8D4pORwbZv3m3Uctm9
         70F24CnFgRStvVOE5MLeUAN+9hahPqg9imVEFAgq3pxLZ/RHmugscPClUE2c4TeSkGWB
         WuJNy995ab7OxHk/OjWqXpsq5LcturEeABbqkKIMn3QGISh9LIb/T5Kcu0HpakXVRtwQ
         mADIBBjB/Q8EEal+EYzmNNlnMoV4EWDd+V2ceE6yApRWKVnI9hyfx9U6z+wvDn9xB3dT
         Pvlep4cNtMTzEl8dx4yJ0G9bhNkY/NEtGmSd7UciWKeSNmFwhUwXvWkfWg4yfiiQp03h
         14eA==
X-Forwarded-Encrypted: i=1; AKwUvBw/2yebbQWE/nKJxcyMDpYhcich0uZLDJoNDFHfg9+QPuW3IVEp+mJcVyviG0HuyW8qdWxS2Lq7TPuC4O8=@vger.kernel.org
X-Gm-Message-State: AFuF++njHSkh0DSw79o/EEBmVgFRtnlbWg21AN1cHqgsZDeO1BN5Ieft
	xborv/XKcdauMmUpKNbJmM9rR9EvcoI17GE4bSYE9OnJYKIfXL1SGVYpc6rS+wtWmymafPzOPa9
	C799yyHZe8vQx082T4d1DAVblFAFwbTPSAN2rezKFsYRR5IZsfrytWSefIlgAwwyIud2e8cFLbp
	qdTpwsL7VsvHA1tUXsZfAV1Hm+dxfXSKPzncSjfJXk
X-Gm-Gg: AYBFou21316KAXf+1016GhoQqT/O+iRKQiEk642E5tfb2XItgTbyfN6ikySUCeXn/dY
	y/2SPNHDsEl8sf4fWl18duz90KD6fwDnQLKj2o1140SD5M1I0n+BwkZrMurqTiUB+fr8UUDfMAX
	2rlSq4JV6PieC0anHJ2OAQES/di0r4xuzYUVPnfneDBZ8uBF9O+xJBwd2gakm/RCexPN+TeZFjP
	MpY+GXq+0E5mne8Sc+ugHyZHSlWJsuvz1fCujEoKwznfEBK+luYJCsKQxb05g==
X-Received: by 2002:a05:6000:2405:b0:487:bef:31a8 with SMTP id ffacd0b85a97d-4871dfac13emr17456019f8f.0.1790005021929;
        Mon, 21 Sep 2026 08:37:01 -0700 (PDT)
X-Received: by 2002:a05:6000:2405:b0:487:bef:31a8 with SMTP id
 ffacd0b85a97d-4871dfac13emr17455982f8f.0.1790005021596; Mon, 21 Sep 2026
 08:37:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826164214.756512-1-seanjc@google.com> <178999899502.746042.13434207152687268434.b4-ty@google.com>
In-Reply-To: <178999899502.746042.13434207152687268434.b4-ty@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 21 Sep 2026 17:36:48 +0200
X-Gm-Features: AcwNN1Vc5Dd1Z6bz0UOG_dq6CPv_obdD40QYNgy4I8WlOv2VzLbhnywhiqHrT_0
Message-ID: <CABgObfbtL48EP7+_VJirWxFj+NWnn=kmF6CF+qdctyHv_a4FAw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] KVM: x86/mmu: Fix pre-fault and map private loops
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 4:07=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, 26 Aug 2026 09:42:10 -0700, Sean Christopherson wrote:
> > Fix a bug in the pre-fault path where KVM fails to reload an invalidate=
d
> > MMU root, which puts the KVM_PRE_FAULT_MEMORY task into an infinite loo=
p
> > (although it's breakable, so not fatal to the host).  My best guess is =
that
> > the test started failing once PREEMPT_LAZY was enabled by default.  Not=
e,
> > the bug is *really* easy to repro with a to-be-proposed patch to have K=
VM
> > do auto-pre-faulting[*], i.e. prefetch surrounding pages on fault.
> >
> > [...]
>
> Applied to kvm-x86 mmu, thanks!
>
> [1/4] KVM: x86/mmu: Reload MMU on *every* page pre-fault attempt/iteratio=
n
>       https://github.com/kvm-x86/linux/commit/355323a4dc94
> [2/4] KVM: x86/mmu: Harden "map private PFN" against unexpected root inva=
lidation
>       https://github.com/kvm-x86/linux/commit/698b8c88e159
> [3/4] KVM: x86/mmu: Top-up memory caches when retrying "map private PFN"
>       https://github.com/kvm-x86/linux/commit/6415d9c4ee19
> [4/4] KVM: x86/mmu: Add sanity check to detect stale page faults in "map =
private PFN"
>       https://github.com/kvm-x86/linux/commit/f7a3be227619

Should I apply this to kvm/master?

Paolo

