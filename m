Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793147222;
	b=vZ3tMNs4lDHZtyomi2ocOCZpWFEYI0PQbymJM/I5Fj3OSDOXexcMk9WIUHrzJ2jJJxd4
	 1YcqfiyUS5enTeGx3VZgO3gAYjNgiluZwa8Lz/H5XM5H8X6rsdM5Y92RmfkMfYUFdB+mv
	 UJSuq5xevhN1ROGQn5fBooUFUnyMPTJnSrO1em9MoIXFI8qwtekmENkDpZNHwg3vrmRzK
	 fM7piXlHP7uztMTjJ7/yOeHngB2nZPZWzoa2btCVafTkRMJtOFqwmocMHXJcql71xnhKw
	 CQOJQrURJ7E5LIqIzEfRHARaHoD5X3qx5x2eK3VgQtTNtNf/cYx+Y1+sDjMjDTKOjzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793147222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=As6DCk5gwdp2PSifV5pr1LlxEWAa0J6A8jGIhs6cf0E=;
	b=DL1MGpCibAYmZ8Wf9Z6Mp1J+YUbu7NV2uQ9jsX3hATV53VA9b52WaX8GcoWNY0v6gi6d
	 fqoI6gKUUbdY9KKjk0nCS49IqurKon+ZMAP8fQpI2VHh9IbN6CSAFw/AM0LLAB5nSRS0U
	 tgjsZKgphlC5PF2pS9sepieqy79Oef2/14jv6ZxhpuyWG2EDQeorosD1pN6vYSZHOiMLv
	 2TcATbXeEshb7DFYR4XXCt7VkQYBJH1r5qd6X/s3NgaaDekD51lS313V9rXc/QuLmvWwu
	 6Mt89jyeiASgBCs3RX3Z/kFX51z5NtR7cCDv+xIaYNQKGM8zzKnph4aShRjk3KPT4wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MdGXHYOI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED28D606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED28D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MdGXHYOI
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-843a4ca671eso235129a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793147221; cv=none;
        d=google.com; s=arc-20260327;
        b=EHb9THUiCDX6j6H2sHhCEDky4J8uR5NX0Hstjs6E34jl1lTloQ50We4OSugw91M3op
         RqW4OS4Qa5rx66P7GLPOcVrtE6CiA00xN8TeMTVUy6Ek3sWSGciqHwmXCTy1x0p05oIe
         1wA9V9ooZxDBdXBmwEDwD8zhmGXzpEjrGE+QC8uWdeaXqetPKP+GxwsxDnIQFt635r8U
         S+IPkWujjN6Q9itEx41eIc1wIx0A06c5IIWPQE51/e1cLsLrdHSvBW0LvML2a682IP3D
         f7kzEm7IXtkQbD5TJH60pI8ox8MMPf899AUpCrgbwF3yMsivA1OpY6wLYnpMedLD+z3g
         rXxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=As6DCk5gwdp2PSifV5pr1LlxEWAa0J6A8jGIhs6cf0E=;
        fh=if4hwDporG/gpqJxADOt38HU5fdwSRXt2ax0IiyYWtc=;
        b=fGIwgSIDDwuWu/NHtVnpyPtpQP+K6MUBcaLy//yxz/kmGCWf5WCH4B5l3KVqOOblZw
         RdE5NDpDz9p56xc43gjO6mhFjt2dfrfv/b4T+biwkTSvTDVTY3g2Hg0un4j2qjUS5UU4
         ZSmIR5jKPuEEnkm+IaSI43EYXG48hJBwIF0xWTZBziU4qYaLKtAp2iScMrtWdMaKwTI1
         Xnl5UiGYxrfqXNZhvE/uzJykmbrBxW+HuCBT4J3B85yHcXCFLfpdUPBLDSR64sjPYWvP
         CukDgfm6f+mpllkocp9tD09tA0jqafT5jodQY5XEx04D6LSoPDDOdhpCRdwTtzO2STHY
         aIVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793147221; x=1793752021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=As6DCk5gwdp2PSifV5pr1LlxEWAa0J6A8jGIhs6cf0E=;
        b=MdGXHYOILDckeXuAUyH/Vk4wrEtmpanm61KqhMl0MQiPrdWJh2uW6MreM5CiOpDhrC
         vBgzTGgeKNr0fKVYpY+s+r/AsCQJ4hde/luBJ2/RF4Xrxwm0Pgw5IdE0OfNTqvQPcNuD
         b2+BXdKw6kPMxWo+mfi/5dLQNMu/w0YROhYFyW55sEDi7TWfU4GMduhH/ovlWO5Li+Lr
         0hbKXaiWZAIb9DbX4/lhRJS+T3TpUqnU1fw275TKcGBUGluBhVMyDWKMFcn7uCeYKRUZ
         Iit3TdmDQ0vXDWegWNcREmk2YwR42ij/6liK7noMDxBP1CwD1RV/DB5pgvgGwvLc3blb
         STRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793147221; x=1793752021;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=As6DCk5gwdp2PSifV5pr1LlxEWAa0J6A8jGIhs6cf0E=;
        b=CVHUEZ/lZbLiB4ejw+I4RKiUpNrTCPqpL0b9KpdTbfVmUmFHZDUl1ikB2Hzq+QObY/
         IKFhqteVDvsQqRWBZkgz+pZiMYJdDO590/XDb+ZzZO9r4pVFr09ZaawWg1UcRJUJUNW/
         6lrnvwKuxQxKGGoPDoxXcbvhQK+fmaPCjOKKHp5SOjfiTOGndQ5ln1RHzn3bUhIbaX9z
         Bn4r0rU52FrhA6smflUfAL/LCYvgKDnqneEWIi50p9L0/bmReHzjRCL60D6BOsRdBGJh
         cmTG9ffA+aTRqggVo5PuGZk2bK1BjddYICg5mwIM9nY1i8u2Sp5n3STq4uq60PpMcQ2O
         bANQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJpeoYnN/mk446z/8d+8LlS9YKy3ZgkqCOqnBCT4HG/6Qt/28k/CckHz7PILB6WJdh8LgJlZ4tsrFk8GY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwUEFsKkOLa+YdYbCBFN6b+det2rwtVPT7c7gjai/COJAS5o+s
	CLc83rWbOTWj8fs2GAy2SPSxORe6fjiuMT6+6BzsoWvJPDqAqLVnvP89sI6hCRiu/hP3XrxC+Th
	8BFGem9PvpgpgAotFx56S2MW1JLsz6R8VLDqJjpiz
X-Gm-Gg: AYBFou3wrPxLUblK5A1CbVUPx7do/32EQlv1VWXE34Eiwnwwkh9dMflguM1yXaJLata
	zqJGOaK/QMcU8il1AirZV84a365GXezls/hhhTb4IrMdC1DH7rEdZ5+nR1Lat+0ZIU2yZsPqBF4
	mFWtkIN9B/RLlkIc5+7Y1aygCuNaGGA0xSf2AUzs/4D1Vyt2XYPtm4kUSU5ML1clelOPmgmw4Db
	YFf9elqTVKytqwDMYobPnDd5kvJXBxXZNRzoE0p0nvE53QlVSNJtqFnx7PTj3Bvvr4NxtE4zWK5
	ZFBA4x2/anmlw+7ZtP6zuyQMKOkfrdOqgpaAtv73a0aK3anEDjWZJlzklvJfs5exjr89I9p91eE
	WSuudSYEefW7/G+Muozp/z/KRRlLO+XMjpmSiuUm0LnFs1C9YOsFYjSLICc76ESLwHwDcPqq682
	/cA4SJ9UtDw52afHXJ8u4ZDHSIomHfOojiKB44bVAh80zOqDoz1ifufiStFxnvm3BzygZNkV+29
	rGOfwBJ
X-Received: by 2002:a05:6830:230f:b0:7fa:5c68:d053 with SMTP id
 46e09a7af769-85ac14a8d6emr843028a34.29.1793147220374; Tue, 27 Oct 2026
 17:27:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027221209.1560865-1-seanjc@google.com> <20261027221209.1560865-9-seanjc@google.com>
In-Reply-To: <20261027221209.1560865-9-seanjc@google.com>
From: James Houghton <jthoughton@google.com>
Date: Tue, 27 Oct 2026 17:26:21 -0700
X-Gm-Features: AclHuK9X9-tagkcZtNpeYN6-ZH2xFAn91vEZn2rqSYOeh808Aib4fY8cPgUneqg
Message-ID: <CADrL8HVtDucwUSnZVb63pQPmo9YJksSTu+E9dDYgB2sLQ_N-ZQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/15] KVM: WARN and reject guest-based uaccess if VM
 is dying
To: Sean Christopherson <seanjc@google.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 3:12=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> WARN and reject user accesses to guest memory if the associated VM is dyi=
ng
> even if the current address space happens to be the correct address space=
.
> Accessing guest memory after the last reference to the VM has been put ma=
y
> be "fine" from a safety perspective, but it's still a KVM bug.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: James Houghton <jthoughton@google.com>

> ---
>  include/linux/kvm_host.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index f3f59bdf7e18..ba8ea62b7304 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1355,7 +1355,8 @@ int kvm_gfn_to_hva_cache_init(struct kvm *kvm, stru=
ct gfn_to_hva_cache *ghc,
>
>  static __always_inline __must_check bool kvm_can_do_uaccess(struct kvm *=
kvm)
>  {
> -       return !WARN_ON_ONCE(current->mm !=3D kvm->mm);
> +       return !WARN_ON_ONCE(current->mm !=3D kvm->mm ||
> +                            !refcount_read(&kvm->users_count));
>  }
>
>  #define BUILD_KVM_COPY_USER_WRAPPER(fn, to_user, from_user)             =
               \
> --
> 2.56.0.307.g5fe7bd680c-goog
>
