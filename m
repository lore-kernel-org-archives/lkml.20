Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792804640;
	b=1I2aBfYMGCR6gXSBCLTvPZM3AG8SVkvVY4mUenkWRvq9LDibfk48Ob4cTCLjUesslsMV
	 tuugjx9jIItmnNcfSdjZyc0Qa+l1+zHXGvYWX8dcaTNInU/mYUjIdFSX6fuBzEguM/ZFb
	 CGNKxAZVbXttSwdvfr5AaVN2JaVJ5i3TP6P9ihAWvIUNxRpKysq6mN+NuI7Onl0m90alw
	 zC53C2exODWF2DJ8T6+zcaqnJZLTCdKv0X6A/pCY8G8PaR+YxEJG+PLKydIJWvKDavbvu
	 v5UQ3ICZ4DXmdX3tLoXwUQx6Y/bp4UBFuOXr5C6MBZleyhJt9z0EwcHjgvLtlKP/U2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792804640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=k2xByoCKDMYQdbnv/CMNI1SrsG+UgozZ52mY92tXu2A=;
	b=dY2LVUhbvnlKz4E4xs7Z0u3eNWWilJ789DvGYDLx7t5tgsSQGQDfsE8dF0hR7ACjPT93
	 9Wjz8nH+1izdV+tvv9WrX7PDtsBOoc/ZBye5wjpuoxMeH7tahdI5cLecGefbDIUyg2tqr
	 xJCVskmtILrLa41z2HhlKlEZw1V9IE14wawSllNCTt9lIZgF/tg/t3JMhhCFtwtE4Qmz8
	 1Lx+2Z34gsAqhDySt66IEaaMQAyugcmPu8t/V6v6HsyxOHxkqouViPRpTmWQX885uMZhT
	 KEo+wtlLrfBgRMNhJUmCeOKGD1vtF270lACTXWAMYAw/cHvMsrwa/xoZFBB2OTj9knQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=eHV1Dg0R;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6E7606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B6E7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=eHV1Dg0R
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9572e892dso10836215ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792804639; x=1793409439; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2xByoCKDMYQdbnv/CMNI1SrsG+UgozZ52mY92tXu2A=;
        b=eHV1Dg0RRPclMynewx1jnWTuwaoILuMCy80nzB3nrE2EntzzhcMvMNQbwp8rPdDo9U
         KBl7zFP8HgUdE3A5weGUngDuhhfgzQc98lKWqgJCJWW15uBZtvhv1lqiVTSqF4F0xhOh
         tqfTDdFOiQp1NxS8EutZP1o4OZnUFHdQwivgmvOi+KahpWp4BDKQyNvk9SRsJyVzFWkE
         +8ErCNzDM4penAWmboW7rn1zJuEWmNNVf9jBR6gpmommaXsUhmXnrXh0lbNe+Nomu99d
         10MES9ry8iMYhSKubbdt1ylL1CSf2o+ljr88vFKZrmtI9RtSyNnaDoVseG5sibWCPko3
         4HuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792804639; x=1793409439;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k2xByoCKDMYQdbnv/CMNI1SrsG+UgozZ52mY92tXu2A=;
        b=Av2IWiDtz1sA+TGXbNPOcn1GGfW1VGvawonFJQFuELG2PLImrq59LFsLO890Y2mSV5
         70XbiO3wOwur+uoH3vSkczCvFFng/8/tmEv1eqlJ10sH2K0Oc5xWv8kggnsb4dEE65b7
         yTfwRCWl1jsZnXNQF9RGFdMU6Fv3nLqB8nzxX8q4K8gRBqxDw0pXrqYGXZinvJOB7VuS
         mSm7pXueG5WZqe4P4a56sBVs85d/VGoSv99GfbhSMCxtWCnWdgRjD3VWk4WjYCaFo1Kt
         GRxv3hyTd/N8/G4gN+Buxw/0TVAlz+y/9uT0y2+qQfVUkan7IiyZRptC83XrRddZjVCX
         nNSw==
X-Forwarded-Encrypted: i=1; AKwUvBwI0wRgEBJILtxCLTcqF2XCtv5zln9v6v0jpludb53XodvsCZw5KlZWumkrXTFoMwvqckuuGXRAZSN6BcQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1zcRrpevw+1+mgwWrObaiyyOdl0gVUG7Yis2+wS3h4SQGbmb5
	XR48ILAblS4ZKnIYBPTyKSV18rEr6/8ia38Rlyq3DzxUZb4S10FKPhh1iVxKG1QMqgFFHgwGuBD
	TUwjagA==
X-Received: from plbjk4.prod.google.com ([2002:a17:903:3304:b0:2e3:c3e:def2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19c7:b0:2e9:7ff5:5459
 with SMTP id d9443c01a7336-2ea9c6c3337mr5775125ad.15.1792804639083; Fri, 23
 Oct 2026 18:17:19 -0700 (PDT)
Date: Fri, 23 Oct 2026 18:17:18 -0700
In-Reply-To: <20261023171307.636760-1-amirmohammad.eftekhar@cispa.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023171307.636760-1-amirmohammad.eftekhar@cispa.de>
Message-ID: <atwHHh1z3zVzLV4P@google.com>
Subject: Re: [PATCH] KVM: VMX: Add array_index_nospec() to evmcs_field_offset()
From: Sean Christopherson <seanjc@google.com>
To: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 23, 2026, Amirmohammad Eftekhar wrote:
> From: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
> 
> evmcs_field_offset() bounds-checks the guest-supplied field index against
> nr_evmcs_1_fields and then indexes vmcs_field_to_evmcs_1[] with it, but,
> unlike its vmcs12 counterpart get_vmcs12_field_offset(), it does not clamp
> the index with array_index_nospec() after the check.  The field index is
> derived from a guest-supplied VMCS field encoding on the enlightened
> VMREAD/VMWRITE path, so the array access can be performed speculatively
> past the bounds check (Spectre v1), disclosing memory adjacent to
> vmcs_field_to_evmcs_1[].
> 
> Clamp the index with array_index_nospec() immediately after the bounds
> check, mirroring get_vmcs12_field_offset().
> 
> Signed-off-by: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
> ---

You already posted this exact patch[*], and at a glance several of the bug reports
appear to be duplicates as well.  Please stop spamming duplicates.  If you have
questions about the flow and/or timing of patches, e.g. since we're in a merge
window, then Documentation/process/maintainer-kvm-x86.rst is your friend.

[*] https://lore.kernel.org/all/20261017093016.32348-3-amirmohammad.eftekhar@cispa.de
