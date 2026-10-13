Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2581353CA91
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924195; cv=pass; b=JAwz1jor/fclzxAqTgkz3gKTnUY9P1xP4jqlHw2czXxoMOP0ARCTYXiT4QCeqebmvA6DaF1CsmyCU/sy1F2Q92YYgF7XMHAAvMspedxsDYrIeuj2LrknUUkeZR+pEsTc3kfI8zRInii/SDuEiJUEvCCAHfsReLGx5LK12rGEVCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924195; c=relaxed/simple;
	bh=aUqSZx5Jyb/Fk1gOVNP06/1f1jP/+rE+8FXc33EN0Jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P2LV19XQTg+vWmyPzy5kWaIaLB+8tb8OnshcxJizTBK3uJnvTw3oJZfew2EWsIVXdzDO1SookeN5HavAO3BmBBHgSLoouqZbeYXGubBsBq12LYHLHK15kOqo0lRxnYfaL+drkt87/tuxDTDJDndKyeMC3Rg54NyTnLdUa7H/0b8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VXHaanHQ; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VXHaanHQ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so31262a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791924192; cv=none;
        d=google.com; s=arc-20260327;
        b=EMJ2dbicy4HbXIiCvqbzsfHp4vqwzPWXTt1rbYsyjfHdS/eSqDb+ET3LYrC9g8ca8h
         +soQEokNmqsAT1CdIiDUYAGFL/ko5X4s/QzT+M+Kx4Qog/Xa5lLX19mnc84VIy5xPLAm
         Gk4Yoh+FwLSOkcylU8yL57V1aKXdBlvgWKMdkn3rzSv83HMRUCBjt0ipi0j6w2Zh09/h
         OpOhExx6qbHVSTcHduaNV44XzfntYexQH9t41EyGgEUa2DbKm9dfKRekR6x6pO6fYnzT
         QTEbSH+sYNQRloyv5OOuuGBwlmq4BIYB02X74gYqaiC9FCwPqM5ea5nsYCjbht/TrxRQ
         BJBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aUqSZx5Jyb/Fk1gOVNP06/1f1jP/+rE+8FXc33EN0Jk=;
        fh=xO5/Gr9sO63toPGpSjQGUpBnp6GhVOJKlnUgG96Cn6M=;
        b=aftSKMPdxzpA6zESs2pbUuppeSSem/EMIFnj9Qfs5Ma0qt8HOcB8niz+MrWVFV7jL3
         K5Xd9yMbfY05+kWozWRNgTbyW1XkywIkKwKG6aUoAJwfzFjEWw01YrupFJiiAaqhZuV2
         xOPWu53vEP//eo2mARZmBptaLXo93eRhYrmaemZb6fyA9GMmQpm9fS9hkIAMv6YA7DU5
         65jwjcOkscXDCuV8lv+vcgRjMkmCk5dE2zFEn92FWKFC1bNnAu8mO6kJjHo/3wrhRl93
         nVN5OEVSJqEamnWPNCVRoC+k5D5mHb1JfyNNFKKWozO5hoD3wdvteAi0z6noEPTrFz+P
         JEog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791924192; x=1792528992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aUqSZx5Jyb/Fk1gOVNP06/1f1jP/+rE+8FXc33EN0Jk=;
        b=VXHaanHQ/eTBrPRL2Xka3nGMQGz2gCSnvjbzw1gMtINrNoibDMWmIxJAjhOQWAliyB
         zkFYB4W0QH6afS8XSud2PgiNPOpVk/c3VE8iMAB1vb3izGOsgUGCto+PRE4A2zQD8gza
         r4b46Onr2K4fPrYmrrJX4jB55wHQRhkT1vh43lUN9wve0RwchnXyO0XGm7OcA0fxx7mn
         rV3/lC73Rg64thxnyP70r5LRkJD4Q681jgvt2gWbHQ51WOObNlkjYkBX0u+4bQkzg5iD
         5outp2Yre+pBSi0PGPGGDseSDJKhyp3CDNsKW9/5GtVEbgXI/2MSsGFBVf60Ihvxyuvn
         1WeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924192; x=1792528992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aUqSZx5Jyb/Fk1gOVNP06/1f1jP/+rE+8FXc33EN0Jk=;
        b=j4SV75xZIiAfF4NmjzU0HPqm/aEj2uMQIl37k6zNOZSoH4nfqXvhaHUfjVA2qvQra2
         PVz8y2VT1hSA3lNqCsXXg9MkTuHwZDEJhPYjkKaTWZPTqBujY6CxOQ+ZNXG4qWgky90M
         WyJpPynzqPNh1EXxH/nhtfO+2e3MZe67VBEh3h8LwIktSEiWo4Na5srHDIg7MGKQn+Np
         WeyN6TVmy7H+Amrq5n8AI6UrtmUH5bf0mqkztx8ghq6AheoupS//mf6ycx90/3Qj91dh
         Cl0XJ7RLQ0L7/S5Sb9TJRlddOcJGRN/w/tkR+DAJC05IGypAFdNDcASn4lN2dNRgYVxF
         lCTQ==
X-Forwarded-Encrypted: i=1; AKwUvByIWaRGgBxc+4FCGM8+V+cJOWB7Pdrxcuyn4m37IjxtASAz+tWidNc+2FdYVrinpHKZO9tax9lf463CgKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/2uR0Cu+C1kuC0i3f51puFd/NLRZFSH2moe9M687zos0DkISe
	mHHnVOIQkLcEnDzBSoKvU9rVXOsSCM2uWHpLHr+rZ81XACPbTejHHDOa9FSV/F4UGivdfxMxw/D
	7aF7ls+rvLW2QmQbswqtgTekoVGOGbMKHZnLw5Wt8
X-Gm-Gg: AYBFou3LqZ+L39mi9lZuagmplptMdAcnV5vmmUNJEB46gpNb7DVVoBMeHmEmEEnaAQc
	EuZcUmmAOASzKVYBRzSfbeIdGvC4L8V2o631+jIFRV+yte+3UKdBIIPdmM8JIoz+w+BxgOyhUTI
	x45Bm3w9BZUfISEqBA7CHE+avZJxYbmopr6QA2s3fMr8uTPVggWRKo1v27LuZTfoha3ckVLbL7X
	fXn+slwoO/bUSzXoh0e8yNSH5kWm60N0BOYUh5XkFrjdqImPmP8g4pH2w5u/Gz9Qz7ar5CG/as+
	4RbbnEyaH67zx3TUiKi9Bk5BANDZxiqZ9fsapKssMYJe3bLyAqdtAn0=
X-Received: by 2002:a05:6402:a593:10b0:6b1:d313:16f8 with SMTP id
 4fb4d7f45d1cf-6b1d3131c5emr128393a12.0.1791924191858; Tue, 13 Oct 2026
 13:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013195358.163375-1-yosry@kernel.org>
In-Reply-To: <20261013195358.163375-1-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 13 Oct 2026 13:42:59 -0700
X-Gm-Features: AclHuK-YmNn8NSDVLimMh9Yal2P17VNQJ0PnXTL8TAurb31p4J1MK23ZmaxEhr8
Message-ID: <CALMp9eRDjH=GgeCUe50JngFJtup4Lx2t-uHgpyEwyVB9VjQPVg@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: SVM: Update tracked pCPU on pCPU switch
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:54=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wro=
te:
>
> When a pCPU switch is detected in pre_svm_run(), update the tracked pCPU
> and mark all fields dirty in both VMCBs (if nested is initialized), in
> addition to resetting the ASID generation in both VMCBs.
>
> Commit bf260dc9e7b8 ("KVM: SVM: Trigger new ASID allocation in both
> VMCBs on pCPU switch") reset the ASID generation in both VMCBs on a pCPU
> switch, but only updated the tracked pCPU for the active VMCB to avoid
> unnecessarily dirtying the inactive VMCB. Leaving the inactive VMCB's
> tracked pCPU set to an old pCPU still allows an ASID allocated on one
> pCPU to be used on another:
>
> - vCPU runs with both vmcb01 and vmcb02 on pCPU A (both track cpu=3DA).
> - With vmcb01 active, vCPU migrates to pCPU B. vmcb01.cpu is updated to
> B, asid_generation is reset to 0 in both VMCBs, and a new ASID is
> allocated on pCPU B (setting vmcb01.asid_generation =3D gen_B).
> vmcb02.cpu remains A.
> - vCPU switches to vmcb02 and migrates back to pCPU A before
> pre_svm_run(). Because vmcb02.cpu is still A, no pCPU switch is
> detected, leaving vmcb01 with cpu=3DB and asid_generation=3Dgen_B.
> Because vmcb02.asid_generation is 0, a new ASID (asid_A) is allocated
> on pCPU A.
> - vCPU switches back to vmcb01 and migrates to pCPU B. Neither a pCPU
> change nor a generation mismatch is detected for vmcb01, so VMRUN on
> pCPU B uses asid_A (allocated on pCPU A), which may collide with
> another vCPU on pCPU B.
>
> Because the per-VMCB cpu tracking is shared between ASID management and
> per-pCPU hardware VMCB clean bits, also mark both VMCBs dirty when
> updating their tracked pCPU so that the inactive VMCB does not run with
> stale clean bits when later entered on the new pCPU.
>
> Fixes: bf260dc9e7b8 ("KVM: SVM: Trigger new ASID allocation in both VMCBs=
 on pCPU switch")
> Cc: stable@vger.kernel.org
> Reported-by: Stefan Teodorescu <fane@google.com>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
