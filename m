Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275FF58FD1B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886713; cv=pass; b=fk7QKq0zPIrfTTyPe5GC9kaNTtV2wXLGUu0R+lh3AYuXigDFB0fzot8SeOiHFgfDFVHYzltQuGSZbskSDO2AZYAAn+lr7SzW0eU8nz8Au4Yjw9QiXC7JXWgFswEBUAYS3nNHigcKFQrtUhYmE2jYEgydYHSKfNc+yodmaizHd5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886713; c=relaxed/simple;
	bh=ULxa4JRrSAZB5pD9oIq2oZNnuuD6C8U1jqAHoElMSdA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jjbqJHAD0lcJnbBGuCCa/VksgZFdXmKUl68nkwXyarp0hrfdfSEl0O/zpd3Xgn6mg8kzG0yiA+isxJ1PLG7esOHsuU2qzU8ELQEAjVdzcMJp5FQgWxLAtylwSe7j7lUuT45mUpP72qyzyw/K8f07+wZ6n0mKUrUS+BAdty8Qif0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eMz+XpJH; arc=pass smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eMz+XpJH"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-9103e193381so44408226d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788886702; cv=none;
        d=google.com; s=arc-20260327;
        b=lcZNHv8JDAORgEqOVm+VFIBaWS0rnr7x+iiDIj2mXvPUIlBMmPgZKc/sQgyshfYKCm
         BRr1cYcRuZcqir20jDjZGMbjgnxRqNjO/IUgqKqhTC6gH9Jln3lwKCTaqiVUQyRwtDLW
         TlSKeGOaDQb0AZk5ecpueWCSzC6Z9+/HnweXQ8PZnVDalT6hZ8V9cW04ev2f1aj3vtjK
         FDSspo5oGFP8Nrv+Sx5r7DXqU1cVVueupSrJLeWC6/54j2uSVpiiU5fZCcGgQy+RYI8u
         W4UZ/VdSX4XYZt1TIixiTo4bkQGAtsEXh6qInyE3GbgZvo062fFonejGEUSgGWNEig6a
         PPSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=8fcdr/hrzW8YjLnM5OVm+g395+cNXrG+fCcu71g0lZU=;
        fh=DUY3ZPvOEnWhG5KymS/8l5ubM4d9GlW9A3/2i86p1ac=;
        b=c7Gejw8WUECjFhentuHqmnddm34w3INqdpSGNkdB03ZArLiLAvTYOBAdr+SkJK2+yS
         Uc1vdYEYhVxX1Pji018YRpD/DfMoj9CShm6KvXZDy13Eh634GL/8pisdihsDmug7EajG
         kAKmaHekRRVyBazLn+ElGtiBu/aSDsTLsdYZxCreRvi8XqQw6A3MbO8wyEY/ZmYhNwR6
         rEjyMaNG4OQk1GAFCH552YRVLGvqMxuKwcLo71RiZ2ozI/aI4dPx2MoN86yU3/M//8Tt
         tlFSSs5WdnIRXO+pYDMyBiQexbkDI9LlbXCw/IB1ML3aohRQagJf8hw+GsCPVhlmVIvB
         frGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886702; x=1789491502; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fcdr/hrzW8YjLnM5OVm+g395+cNXrG+fCcu71g0lZU=;
        b=eMz+XpJH8AC4z0HU59N10CwiV7jWB2XkXiXfbJIdwPg9pCizkaqKgQ2pA+sDReAkRu
         symxpB9EJaTSk3ubMMpTtNNds1xRV/H1uDJHELk26ThbzxwBw0ZicDxeurCbCsadwFE/
         +tXRzwxQLtqQq83teNHqJZ4nd8xfGB7sLCwT/Ccir7u60wm5o+R8fFsyqG848ZI5pXsJ
         zG8B876bNDs/OPgeecJK/ktGSxXN5IT+eJr7oB4IdTb1tjj6a5sNSTZcgtNJYBCtpJJE
         bvRm8av7+CH9Tdmunx74W7KDnay6nWuFHB2Kidhh8mcdhtEeA5OOQvzbF4JDUEBkAC+3
         pRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886702; x=1789491502;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8fcdr/hrzW8YjLnM5OVm+g395+cNXrG+fCcu71g0lZU=;
        b=UcL0zbL4qnZD/G9T5Aoy+1TEbRkw+Ytje6TGAv3cygIccrz6V10d4DC033EgIk8X8x
         243Jx9+1p4SZKaWLcHj/mqljcu/IYG2iO8SkAyIiuGUYrhE64G6Hr6dJWDQDggr9Q/oo
         bVAwOahN3tiKJGIsl5vUU0ncOfpOe09veLLQMGswnROtD0R1lJzA3PluChbUhX/IHD8L
         rSBbrKAtkckY8Ihs80payz7atm9vPugkz+ER71O/cxxAuIgCDFMRXeAC2ALrgZskF+8B
         Sr2sEmzvAM4a2wpUz2AVJ3m0h6S6eBqfIwN6hQv6/rMGbNFdczq5N8dFRyRQuEgXzwfi
         /e/g==
X-Forwarded-Encrypted: i=1; AKwUvBx/mx2W9/9XS3f3Cmj7ThJafAvWcExrapCH7lpGY/vnLQeptyogBgY0nFsgMrsfon9e3gLerxb2k58wFI4=@vger.kernel.org
X-Gm-Message-State: AFuF++mjuxo2Wo5QabiWYG5VWZoba6R5eOLHZtPRQ/vupqcjDdmajU79
	Jb8+u6TmA07h9Dfq2lIbTq87JzIrXPdqZv7GWudvSHG1sjD3zIaH1fsJn2v4FNFP4Lf6ezBEmAx
	R68Fi9yIg7AOw8glBz321shc1guHl/7Jdo8GTz+JY
X-Gm-Gg: AYBFou0Z4WcuhNORy/w3stR4JdaV6e40u5UoLB2vtgA/OhrnpjE38keVAlMKzO+9JMi
	/+qqQmIgY0VBu0LnK8y8UVoMVhz60NbhTgIJAXIiK/igIj1nhBFPn2KGFZfSJdEZNbmVqOL8fHu
	YkP3bh9NqhqoZoMc6RJY6KF1dicqQFd7JOFD3sQB/p/TIwnoioyVyLFnjyywVMILL91/7s5TeaE
	tH1/eNF2pgDNb2YjbehZ79gC9mVvnxkQcC1zEq4yvdvFo8NniCw58wWdTCCJYEe+2K7MyevUIj0
	G7sl1oY9H+76FRQ4zZ5nEFZIN8Qe3LfhffnhPwFKBswwX6ZW+H9dOqM+YN2fBMtQ+++vb8FQOD9
	X22+gfR+adRVy7gwMT1Dq+ohYaviBqWY=
X-Received: by 2002:a05:6214:c24:b0:90c:ab32:d9 with SMTP id
 6a1803df08f44-9103ef04cbemr59785766d6.9.1788886701269; Tue, 08 Sep 2026
 09:58:21 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 09:58:20 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 09:58:20 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260722-tdx-selftests-v14-1-15ad654a50db@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com> <20260722-tdx-selftests-v14-1-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 09:58:20 -0700
X-Gm-Features: AcwNN1Ul0Nx7jhJwVNNvygXIUovvrGXjOMRCxh0xNG50wROb5Y6Vd7rvg4wlMm4
Message-ID: <CAEvNRgFgE3DFw1=zc65iMy1gNyPryVJuKPMrNF+ssXydtuEazA@mail.gmail.com>
Subject: Re: [PATCH v14 01/22] KVM: selftests: Add macros to simplify creating
 VM shapes for non-default types
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Sean Christopherson <seanjc@google.com>
>
> Add VM_TYPE() and __VM_SHAPE() macros to create a vm_shape structure given
> a type (and mode), and use the macros to define VM_SHAPE_{SEV,SEV_ES,SNP}
> shapes for x86's SEV family of VM shapes.  Providing common infrastructure
> will avoid having to copy+paste vm_sev_create_with_one_vcpu() for TDX.
>
> Use the new SEV+ shapes and drop vm_sev_create_with_one_vcpu().
>
> Opportunistically move the existing VM_SHAPE() (now __VM_SHAPE()) macro
> below the definitions of VM_MODE_DEFAULT so that all of the SHAPE/TYPE
> macros are bundled together.
>
> No functional change intended.
>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
>
> [...snip...]
>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
