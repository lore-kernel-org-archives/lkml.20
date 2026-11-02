Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793662777;
	b=HtHJHpwiyJUvorQnfX6nOcyVwejOSqFJg6TvqTiDgUpYpgxJO4+sLxu2n2MTyE66Lijw
	 JBjlDy5NZw9s1X+pbzYaCoUwdDcdSgPAKpq5gRz8cPXUqXU0RN64lfqvASH1Ok+12Qheh
	 Bw+HvrhIMGWHpY2TN2MeQQap3KWhptqkzkyiP3gOrpw4FvKJcAdigk4sFyseFDxq0HX3j
	 RZZgosqpYiR5ldJ5HRmnRsBtMgP5iuR81wbW1vNyYD7A5BoLlWkS4u5caQrVaLJVDoGgy
	 cy7XPGqG1FMewZLuogrMtj+JsrQq1TgMD9vbDUn19Pv7KhC6K7a93QLbjtcvTP35AJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=+q4epD+/kjYFUHxTaUaWiSwNZ7dSox/dJ3V0P9S7xc4=;
	b=jkgvkX5W4tpumK4AGmlol9t2d0K00KYmhs+OutjA0+pAZOTjxv05yEk8+uCdEN3Xt+sc
	 OMLNJSbrFBe22VK+JHJw00raEQO+NDuZL5x+pP0U2nQPVfOCbbRih2abv78xhqWZIWkyA
	 +tPuErJfWIh36hCqqc1GazQVskhYQeCEvna3SRCjgkF5xgaF7iKI/g3rxeeqGuSVCNoes
	 wa9H21Ivqmtc9nEMm5SaPzl8avmFecqoAiASNE4hvfVcCie6q6ndj8lCHztY0kksJHCZI
	 TYjbS/WsT2FgIyMkbgSIJRfIB2GsULsrQH+R8XN+tm9mrsktFhYshJXPfvu31/E96Cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XUVIaN0k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FC2606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1FC2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XUVIaN0k
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so3815a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:39:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793662775; cv=none;
        d=google.com; s=arc-20260327;
        b=dxuklPgG8mTcvqEJUY3d/JUG7UMn2TDZNT02ROGDBXQxpmbf2z4aq77UUKwXbDdI5y
         6lNxU356E0Jyik/UeyU902w7PxKQ5lKTpniHit0Jgiv13c/0UznxMTfF3AZyTvhQvi7W
         akx5j7AIsQqoe/K/UJ/BP6+NZvIuiLPzVQHskupxfBpXs65rDufsj6m28Fbb2N6BKWJs
         xtP7G8vDZYs0ZKb7do3rXFI8WUTxZTt77bfZFDIu4Jjhm13zc4IyGNO1SbNwKza5Anq5
         XUXmyobgW3KDry+73qq93JmfMGYIWPVLZVuMHoA0vOYlOF5ku6YTnq1pcUgApXsNJM6p
         ftrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+q4epD+/kjYFUHxTaUaWiSwNZ7dSox/dJ3V0P9S7xc4=;
        fh=l6cOhIo/kaOT4a9xBk6NHMz9bLk/xmDiZO2AE3+4Iqw=;
        b=DTz9Y3YFZC9yp5lpfPtSeTM2esFSTlnPvvUBT3cxGEzIQ5hTjhqo4h9GPXsMUIIE8M
         jiECXaqWGoW9bAWv7pByE7PO4H3hY4uj2vvLI4H74OXhFxlUoQh7Gp79YqyrkLdLPB+g
         HkMJHVKSqeismvkSCMh03PuzsYV9KZxCA4lk92By6cS1ALGFBWX6W8QF1UFxR4xdeDIf
         8iFEmbH7KDyFOC7mDZxAFt0G/YUAzitGF8KUZSOm96EbvpT1oYvE/szM6X/nPqoHRCpd
         dAMnw88IMXVI/xQwKced55dOJ4nqpjKNu7Ap2aIQuBTJX9xMLESyLBSOg0tgWhTqnPg4
         +77g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793662775; x=1794267575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+q4epD+/kjYFUHxTaUaWiSwNZ7dSox/dJ3V0P9S7xc4=;
        b=XUVIaN0kG8xdtu5h2ZGfO1duG7NUeb3NlnGwuDdCm7+GDP4sti5i3GtIgh/wGANS3v
         iLG4FWeU/XVJ6RmDWvjMsWFVP2ETCkzWNm6dvkWqmBfIMStsQjPPeFKt9onzqxRkV+9n
         SZqobE0JlV574RoDGd+Fk3S5HJchvZj1nbns4BOgjX5kWZ5+GqfI504FWg8QCZ3CduVA
         txlnmutgVLylcu9Kvuo57PytOMdh+52MKoLswapw8HS3LbMVWaZ+aOYTma39FPnOIL3v
         aolVSsmSvffPjE/n/j/IztRqZzgXtwiE2epckEY/tLPgbodm7hh+EjAE4BoQUwHS5z0y
         K9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662775; x=1794267575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+q4epD+/kjYFUHxTaUaWiSwNZ7dSox/dJ3V0P9S7xc4=;
        b=guZJHIZ9L1HdYTfX/yfddiNK4TUjUd4itH+QzMZCj49JZ4wvV20qvRClYBw012N59T
         jr71o39H2b2BPVCqQjlS/oAMNxre1t8ljhXSCx3sA0VM3no06Q7kzoMC5I4DFoR4zpsY
         KGS9xtJ2F5Q6d5ffCXwKIarL++4baAievJ+0RVTdKgC2/4y7+LSxk2O2frgimXUfSvnO
         s5RY/LR6wE0ZRWrGgE9Q9K6Tyo8n+mdS1QmGgJAIPH62NO83WbMAf5cYh/dPLMBW/T55
         VzWzpK2/wIjq2T8rcMC++R8Xz2OBd5sG7walJFklIF954xJv8yE5MzSu6vtFgp67GS07
         h/PQ==
X-Gm-Message-State: APuU4Z8ijREYhJhCwFBdatsdtRYf2zcLh9VGqXB0Tlj5LLkeYOhBXVna
	DkEM3iInpZ8utf40DRO8MpY25EEmXwWxFVcFBCazwDeBTnH2H/t7VMLVFqvYf3wSMOpkA+Z2UZc
	2z8xwoezJ+OVrLigduNzMeq1TikE2PZFYgP6MuVTe
X-Gm-Gg: AYBFou1h9WFtM38lTpizzHxLavY0GJjK03qcIb1h1mI6uCbF05rzHQn4NYSZ+boVOEL
	DKSrPhGVpLabL4sQtXFkU0PwXmB8/mA5bxz3DHJBgLm8LpOEW1/G8NALs3VRStiB5GzBEvV8dI/
	19JohVmovbBpWZdLQzwglEVUam+jo2EH0kP5ZZj76Dci7UsC136Oquj90ZcvK4dY5nfiwhcFSwi
	YORPzx67J1sfJ+cum01qkMDub+ZmIw4H+ptlScpmtaXwOWCPMebsq9EvYp8GiLoeGzVfZ1szuBj
	toEwPi40851dkKw/9OEItYZoYEdp/OgNCwtPzXc8pC+0KXilTeg0NSYtHo93a9vWflOyaP/uS8/
	WzAWHgFU/bvpaa60znIQ9OSwe9ZEBFMu4ZGGc
X-Received: by 2002:a05:6402:10c9:b0:6aa:128c:36ad with SMTP id
 4fb4d7f45d1cf-6b53e764c47mr10361a12.10.1793662774603; Mon, 02 Nov 2026
 15:39:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102231428.13523-1-pbonzini@redhat.com> <20261102231428.13523-5-pbonzini@redhat.com>
In-Reply-To: <20261102231428.13523-5-pbonzini@redhat.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 2 Nov 2026 15:39:22 -0800
X-Gm-Features: AclHuK_llZQOnCwx54tZ59oMjrQu1r-_j_89HC5UjrdUh8dhwsQ0SoPYuUVmetM
Message-ID: <CALMp9eT7cnBf6kSXZLWuMyG9a52QveWjzzLz3Z9E=kPuX_ahVg@mail.gmail.com>
Subject: Re: [PATCH 4/7] KVM: nVMX: Process each host MSR entry at most once
 when unwinding failed VM-Entry
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, stable@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:19=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Add a missing "break" in the inner for-loop of the open coded mess that
> unwinds MSRs back to the pre-VM-Enter state when VMLAUNCH/VMRESUME VM-Fai=
ls
> due to a consistency check that is caught by hardware but missed by KVM.

That sentence does not accurately describe what the code does.

> I.e. move on to the next MSR in the VM-Entry load list after performing a
> write using a value found in the VM-Exit load list.  Processing *every*
> matching entry in the VM-Exit load list makes the processing quadratic,
> which is problematic if the load lists are full of MSRs that are expensiv=
e
> to emulate.  E.g. writing APIC_BASE triggers kvm_recalculate_apic_map() a=
nd
> a whole pile of unnecessary work.
>
> Functionally, arbitrarily restoring the value of the first matching entry
> is "fine", because none of this is architecturally correct: the load list=
s
> are never supposed to have been used in the first place.  In practice, it=
's
> likely a moot point as no well-behaved VMM will have multiple, diverging
> entries in the load lists.

This isn't "fine." This is disgusting.

The assumption that the VM-exit MSR-load list will "undo" every
assignment made by the VM-entry MSR-load list is misguided and wrong.

Xen, for instance, puts SPEC_CTRL on the VM-entry MSR-load list, but
it does not put it on the VM-exit MSR-load list. Instead, after a
normal VM-exit, it restores the host value in
vmx_asm_vmexit_handler():

        /*
         * Restore Xen's MSR_SPEC_CTRL setting.  The guest's value resides =
in
         * the MSR load/save list.  For Legacy IBRS, this flushes/inhibits
         * indirect predictions and does not flush the RSB.  For eIBRS, thi=
s
         * prevents CALLs/JMPs using predictions learnt at a lower predicto=
r
         * mode, and it flushes the RSB.  On eIBRS parts that also suffer f=
rom
         * PBRSB, the prior RSB stuffing suffices to make the RSB safe.
         */
        .macro restore_spec_ctrl
            mov    $MSR_SPEC_CTRL, %ecx
            mov    CPUINFO_xen_spec_ctrl(%rsp), %eax
            xor    %edx, %edx
            wrmsr
        .endm
        ALTERNATIVE "", restore_spec_ctrl, X86_FEATURE_SC_MSR_HVM

After VM-entry failure, Xen executes this code:

.Lvmx_vmentry_fail:
        sti
        PUSH_AND_CLEAR_GPRS

        /*
         * SPEC_CTRL_ENTRY notes
         *
         * If we end up here, no guest code has executed.  The MSR lists ha=
ve
         * not been processed, so we still have Xen's choice of MSR_SPEC_CT=
RL
         * in context, and the RSB is unchanged.
         */

        call vmx_vmentry_failure

KVM needs to do better.
