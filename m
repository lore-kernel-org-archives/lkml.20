Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEDB417D99
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102804; cv=pass; b=Brsf2PQPSNTFJh2xYbhvdvKDhmtELvfSVxXBfR7+gu/OMju4+5UAvhytzbcfekaMyiYf5+M3w6wbgNLf9nfiPS4viCPRPOSRPwlO/ORpm9eHQ20jjaMtvLljJsUWteMXBZf5sjiPpcfWh6eMS2vtuVWciQMIwEDEbpTc7W7eV74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102804; c=relaxed/simple;
	bh=1GkfmmTRxWbu/MUtgXkR/+YBy+TL6aN5OmAB8cTrNrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QOfDhuSYbhF8Gyluxnv8QIsauC7c8mGbGJlPTLZ5mB/+zfACsmjZbRO3FvSl4ctX9aJvsJzkSp8hnEANgwdBAeuw9sOFEv6vjChq5W8rZZdiFfpShk7Z/yBptFISmC3EPLQy/5ImTebeTeM+xylzsc9y/inkQcVpntX6SCi2zis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kV6R6a9F; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kV6R6a9F"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-533202fe429so118431cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792102801; cv=none;
        d=google.com; s=arc-20260327;
        b=Lat0FFSzqcHWFscA9bHSHnLp7dZyMy5/eW/cquVYqsM1N9yJseXHuk4+yMy7W+ivWJ
         n8e3fdst2eYfBGgUw0u1cZB9MeDe4aDFQskLfMEgvtEMxMCJP85rWHEsUNraSnZ58RbA
         g5jMeOpq+CkpJdo7FT5VTSHo8P7mSXFwk/SezQuX28tLQG18e3+z4RFdui+HBIhoOeh0
         fpXOIz9VOI0WWym/Kbv0APO8/vCStRfmj8fqO3YBwTD4MyfVxvDxvG5aC/37Or95LWTc
         qHNLrvGbmjuS/fgrlHlbVNxTfX1KOlQc6qnbHt2YGZnnWMLj1QQ2MQKRnYalF7jPa7la
         mtfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=szmjy0cblE8XnXn4Fw1g4VyNcoow3dCxiKswAyvRGYg=;
        fh=REwRJplJGujIHLgF8yU0gC+99O2ApWOT2xDJukJslEc=;
        b=C2dF5AtPFmhNGfVfS1Qh0BciCwWc4SlKtbJtsY+6x75IQIYIIKHDTnxrmJORgmJlhI
         +VFBiXyc0hhDrW9a/zKgEbS0wngB+5z2FIZj7V45STmysQdPCtzoEF4tg6KQoDI9AmkT
         F3hi58FxikSWSpq8EPigkvUNaRAK4xLRf1NkhrzwLdRgUkwVB1Hyj0YRCLF8/xM/MVEi
         4k1NKsPEnhudyxq7US1ndChOjpFmYzbqwTu9rMnrFFFhNFjRZN3Nv0yZfUgyGbNvIEXV
         0BL8fgi3TtefIrgVaGnispx01xMwj3rQDC3BVG2vKaQsxBNsjhJ9Yd6rEzjlLt626KrJ
         7uJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792102801; x=1792707601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=szmjy0cblE8XnXn4Fw1g4VyNcoow3dCxiKswAyvRGYg=;
        b=kV6R6a9F8W5UHaSlBLbrUXvBx70yCuuGkIGqzVtSMC8/p1oTPtAme1glPLaATs+c4m
         bpwAlu9ZvjD3hNGqQO/21GbGQmBSQeClhrtfNl/RrKkmO3m1LImzJXjvBokBH48RU835
         2gG2jwL449kkBvH/rMRpKsLLI6P51Ru2dxYzR7DHYfNtmcQ5d7IvzZqS6s5Kl6XmqCU2
         6i3fYBEXmy+IwNIP4dimhjlGjLDyvFPi2srAslJ3dYtRrCQqQCUT+S02BXILS5ur6WZH
         3DBYUEp/YJhoVIhm8LhGBardC+55FBFW4kHscv6nO7bZtxSBX2YwN/RfY39iK9UH0zYR
         hpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792102801; x=1792707601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szmjy0cblE8XnXn4Fw1g4VyNcoow3dCxiKswAyvRGYg=;
        b=YAHOjGVu85XMg0cA9NoyKyQyAX+Bg9NBaaMQa3Ixn1Qy07mpXfFCBqOiHM8HKwqkih
         hG+nlDSnyTNQHxGeR6uaXiIKCBCWzvKbS+uMpLpzVpPUkGBI11nxBKUzg81BAqkJujYp
         C8gZDEQHbaNUNDCNsNctdE5b/UEeiJHun8PaReOdyqPXoGlESTIvpGqG0WYQKl/34Ki9
         lvqeWdQgudUx40HnYCa0pXgJxQo8pNAe+NMQig5HDkFUhT63RT+CjpKNSPMZZCJNGBTq
         nfDUW7QJll0WY2EJl31WwVmdsHLdNSWJrjqYSnf6tLOzm/IMCMJ7QxzNULMU6DfX+UAO
         dH4g==
X-Forwarded-Encrypted: i=1; AKwUvBwa1kx9Uk6ZVw6wt9ZO9YR522XC/C6J840F7HsoNAm68/jYXcCW9Bti60HtDysbEP9ctJ2eAPbbrpfp+bk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcd5nzskp3505a2cvoKuePXesE/atupbopJFrYR75f+ZdHhC5V
	H+MNJaf7c2UAUtkIdkEx26N8L5JRk5hTHRQ3NbhoH+BIwo28USRFirMbYTALRWqTuxyHJCmUKcv
	AIpqIZUyku6Pos8y45o6ArVpLU3CJ7RwwT3mMxAHa
X-Gm-Gg: AYBFou3yP3K10Edmwt9zBP/oUOVf2cstW8IFOQLga9w3L4AYt8KlccP4r+54AdsQmTA
	vPG6UMLhe72b1n5w5zOuSSQZMcI86bUKWDTBrezoBb8OpKffRzzVhTK6dpa2trB1cVf2ok2fJwY
	KW2x/4vLuxOD8rcnXi8LgPf5uB2kmXkBoH7gske5nE+CyXz4b99XdauRpDazSFos9PgZabFbNix
	UZ3T3WMy4Ze+F8I1gQCSbxATC8w4Ep5kRhFMfalmICFaQiCUtV/WjOyvT2WIiAWQL9xbAQK5+KW
	6Yz7H+1AMmlZW0Yz5BBsWv2hcFhGhN3P9BrIeReiaitR2yq5oJ8mC2A=
X-Received: by 2002:a05:622a:c05:b0:536:d46:ffa7 with SMTP id
 d75a77b69052e-5362b40f017mr3315281cf.12.1792102800408; Thu, 15 Oct 2026
 15:20:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-20-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-20-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 15 Oct 2026 15:19:47 -0700
X-Gm-Features: AclHuK9pn6iw2-XSdhvtKYxB1Jis-OaHm0rG-azDJVuUxSdzBjHfIalhoskrHxY
Message-ID: <CALMp9eRd3COQijFU8AdcJKo+usr4A7dC6GOYT3YS93UBZ0yHRA@mail.gmail.com>
Subject: Re: [PATCH v3 19/27] KVM: nSVM: Service local TLB flushes before
 nested transitions
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> Service pending TLB flushes for a specific context (L1 vs. L2) before
> entering/leaving guest mode, as KVM does not track TLB flush requests
> for L1 vs. L2. This is not currently required as KVM always flushes the
> TLB on nested transitions, but it is a requirement to drop the
> unconditional flushes.
>
> TLB flushes are performed through the VMCB's TLB_CONTROL field, so
> service the flushes before every VMCB switch (except the precautionary
> switch in svm_free_nested()). Servicing flushes may end up purging the
> relevant HV TLB flush FIFO, which is based on guest_mode, so make sure
> local TLB flushes are handled before calling {enter/leave}_guest_mode().
>
> This is conceptually similar to how nVMX calls
> kvm_service_local_tlb_flush_requests(), except that the VMX calls only
> have ordering requirements on {enter/leave}_guest_mode(), and not
> switching the VMCS, because VPID used for TLB flushes depends on
> guest_mode, and flushes are not VMCS-based.
>
> Note that nested_svm_{entry/exit}_tlb_flush() must be called after
> kvm_service_local_tlb_flush_requests(), otherwise the TLB flushes will
> be immediately applied on the outgoing VMCB rather than the incoming
> one.
>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
> ---
>  arch/x86/kvm/svm/nested.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

[ ... ]

> @@ -1549,6 +1567,8 @@ void svm_leave_nested(struct kvm_vcpu *vcpu)
>                 vcpu->arch.nested_run_pending =3D 0;
>                 svm->nested.vmcb12_gpa =3D INVALID_GPA;
>
> +               nested_svm_service_local_tlb_flushes(vcpu);
> +

When called from svm_vcpu_free() during teardown,
kvm_service_local_tlb_flush_requests() will be called for a vCPU that
is being destroyed--and isn't loaded. By that point, the MMU has
already been unloaded. Is that safe?
