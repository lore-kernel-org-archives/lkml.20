Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC9547ACC7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791833379; cv=pass; b=o8iG1n2ydjFZXDK+AiZzMH5WBWTUUbOUPn/VR1juP7pOR/ZygU5qHgQIq2IQao+Lt7YQj171G1/FXlO5/7+vS673lIg5Ei0Uy3Gq1X2t2P8BylsyRJmrx5v3Rtnjag8JS4hnnDa8Vrzh/5sLcQ11YhBc9hKk5lJ0+XQuCESi3Fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791833379; c=relaxed/simple;
	bh=aoPqNjug6jdHt00ush3qNX20F7lS1qZxd63aAzecos4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mhVwqJRnPZoWR2CdTiQ90MePR+kzx0px5Yb3clFJIKmzfEh2+dbGlMGn3bKxj2JVW7QeBUj+NZAYh1OeztZeIC9oX3DJzfP4GAj6nat7RbsqZs4qn71+EO9AjwPoEgxzYwRLXF8ZgBcahTFJ0DP0UI9OmmlI3X49+MEwOEvg9Zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Afe/3Zr4; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Afe/3Zr4"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso15146a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:29:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791833376; cv=none;
        d=google.com; s=arc-20260327;
        b=B7F7V7+MMS10k7r+uazd95K8XkDiY2avR22P4d9rAt5NlYJuKBMsXDab1Le6wW+y2x
         iGj9TD9H/F3XewdmngFyt/tfvgidhY9mgSX/Jc8NNb/zP1ef+bTCd0nQDbtwXjqJWJVq
         vnptTL/MX4PBpeM34POPO5cIC6T2QK097q+WrPuDq7zjxPvkIYqGPRXaKrO+pHXIzg8L
         o8Y7RcVUbXiLm6koj2WFJQBPFbRCDij6wLSzHI2vvEubKOMhiRVNZeBGoolG73lz65yb
         Eg/yWyauGPR661D794JzWuF3X1LxBS8e9a4ZbFsgQmBILFKjFTheiXOv6Vv5LIsB4yPH
         0JMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aoPqNjug6jdHt00ush3qNX20F7lS1qZxd63aAzecos4=;
        fh=97av4u7AU84QrQw4ZDeQ0aYTcE06szPt4wnJ8SQT6Z0=;
        b=bIVqbYeJysOd9x/iwjJpy+DN3djumIZpQX76L5bF6B0ev49JwJYhWueb7BHbRa919C
         05HaBeHRMqIS2VQxz+2Fjs0i0IYvOEBjVuiaAVx0eKv/uaW/s9JCdqtEuAOBJ5yueNPy
         S4U/GEoBi4MCObW8zcCR8SbWC5636Eop4ZPDM6Do9RpyicD152agqiRNW/SfidiJQK0g
         4GgSwxzTyCuEoJjJTGRktl5T1e9h4jOmBF0cVaiOVoGqhEDaEJQtMnncXqpVUEt6FEZH
         RosuEOEj2ZSCerdfeTNnC4m3F3KoNnN9PH0X6SHrFK2zJsQuvjhr/Si8WasepbBtEjzP
         fxWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791833376; x=1792438176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aoPqNjug6jdHt00ush3qNX20F7lS1qZxd63aAzecos4=;
        b=Afe/3Zr4ZBhFeXjfVNJcs5SlL8kH9Hf4n+lQ9CVzyQqXgqdq27opBUFIMFZdn2VRCP
         k7yVRUfPkGSbUSMqtxqRmmH8/OXpVZ4uXfJZAbeDOYPxQcJOEYAbB73gJxCGFQc8HJcs
         FK3N9Kez/I5hywoERU+iTFa9YoLWPiLEKMdnQn5Jzx6f6sTgvP9YHszAr8PWKlbGftEl
         s6RHPCMOr+ekjfOVGp3kfBSvmttbwYdICha4KSmjOVKRI2h34OQUMguffv7ogVewEae2
         3YXkRZ13tctZ9CZ3Itwje+mrr3IUm8TnsJEmcTshBjWKi/P4GNtJ10EcSfCDQ/3JtCPy
         HRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791833376; x=1792438176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aoPqNjug6jdHt00ush3qNX20F7lS1qZxd63aAzecos4=;
        b=ReFGcN87HIfYJNDw688L5YbQ4MaFLokPAxvL91RiZpu3tA14hgj4tYRIRmJEcjuB9b
         db2K/z3thB27ulr5wTFxiNaNR16NcSh0L8Uq8LdXw4HSQL9rIb6c4DzwFYkT467vGk8x
         Y388zVEMGJAUt2Rt59d6KGE8AV55ekpWWVwwPK281SlVUHJz64j5npGV22U9wC21kTMR
         XtSS09RrTaH18UbYat1PU2gcR4wLqT7/bAdVMnqUlhnKwt1EpJDMwSyO6sSn7JsfwUiF
         /PZtJsboF+qkJMqKtDeNMGd+CWSK5LkaNCxiYIdIfHL0jxVzXLmc7ay6jYV3scRsdYCb
         n9Yw==
X-Forwarded-Encrypted: i=1; AKwUvBxHC7NPreJWaTM09Z4+d/ZMLlscftB9jEZDr7djWVa6pZV06yYX5ovrq3Dw50HR8xe+OPyszQClx6j/6z8=@vger.kernel.org
X-Gm-Message-State: AFq9FYISFcoDQRSegf53NJLypX9oFSINaolJuLp+P7MeQsGLYg2ZJXko
	JOR3lx1UZg0b1/4Qp1ZBPVWRBIFv6Qcj9PaCu69xxCJrBY4JpOxOj5v44LS/EwmDsExsUy9BtoX
	IS2MIdSHLt+D4QrDuwrajchg6DXWEXLFUTYQiGk1c
X-Gm-Gg: AYBFou3KtLNuWq1MmmJppc5AHkevNT6XJhiUXUv8uxUjopdQnPdCC4BaelkqPo1r25g
	mR4jURMYZSlK5Rx9uyWebbuY6F0ICeKRKK9nX+1dGzf3kNk2l7oI7PcYauzbG836Fo+tKmdyUkq
	CCzHWMz7wLt2YOhfcgCHVj05L3WxF3/PkNHa0hUdaysbgjUHsS9Hn7sTX+EpkK4DNRuyFf7t5+v
	ddRpCi+ltycff42uw8R/ZoCX/d/Z3gR6oNyLtvJ/hDbdmvi2sqNfUs9hJ8d1kKRRg136fCQKH2q
	O427f0JFiLK6dShjYtHdZ2Yn97yXH6ccnuiI4Ui4CzGWq4q85zmi9yA=
X-Received: by 2002:aa7:d58b:0:b0:6ae:188e:e119 with SMTP id
 4fb4d7f45d1cf-6b199a610c8mr109200a12.9.1791833375825; Mon, 12 Oct 2026
 12:29:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005192431.87317-1-hmushi@amazon.co.uk> <20261005192431.87317-2-hmushi@amazon.co.uk>
In-Reply-To: <20261005192431.87317-2-hmushi@amazon.co.uk>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 12 Oct 2026 12:29:24 -0700
X-Gm-Features: AclHuK_hh2UTJ_clCzObOqLEy25Uk0BI6IitQI982CcGkWt3YHwLApApzuL7Il4
Message-ID: <CALMp9eQB_FmUocuEf8hTYVVWoOTZCWzJ1LhHm__BaVoNX8wKMw@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: nVMX: Clear stale vmcs02 sync flag in free_nested()
To: Mushahid Hussain <hmushi@amazon.co.uk>
Cc: kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nh-open-source@amazon.com, mushi.shar@gmail.com, 
	stable@vger.kernel.org, Todd Frederick <tfred@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 12:25=E2=80=AFPM Mushahid Hussain <hmushi@amazon.co.=
uk> wrote:
>
> free_nested() frees vmcs02 but leaves need_sync_vmcs02_to_vmcs12_rare
> set. The flag means that the rare guest fields of vmcs12 are valid
> only in vmcs02. After vmcs02 is freed the flag is wrong.
>
> L1 then executes VMXON and loads a vmcs12 with VMPTRLD. The flag is
> still set, so the first sync copies the rare fields from the new,
> never launched vmcs02 into vmcs12. This sets TR, LDTR, GDTR, IDTR,
> the segment registers and the FS/GS bases to zero in guest memory.
> set_current_vmptr() re-arms the other lazy flags at VMPTRLD. This
> flag has no such point, so VMXOFF is the place to clear it.
>
> A nested Hyper-V follows this sequence when it resumes from
> hibernation. It executes VMXOFF before hibernation. On resume, it
> reloads the VMCS images that winresume restored from the hiberfile.
> VM-entry fails with exit reason 0x80000021 (invalid guest state) and
> the guest hypervisor resets the machine. vmx_leave_nested() also goes
> through free_nested(), so KVM_SET_NESTED_STATE takes the same path.
>
> Clear the flag together with the other nested state.
>
> Fixes: 7952d769c29c ("KVM: nVMX: Sync rarely accessed guest fields only w=
hen needed")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-fable-5.1
> Signed-off-by: Mushahid Hussain <hmushi@amazon.co.uk>
Reviewed-by: Jim Mattson <jmattson@google.com>
