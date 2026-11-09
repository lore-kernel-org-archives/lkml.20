Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254388;
	b=4Yd25py6gyqs970punrke+UQG7M/bCNWTjaMXaSGXysDIJPvtnRT5U+LkOjo4QkG5QxF
	 WBa5P++XciyTFh7y7FnyUjQ+N12ZcC7ISEY5uFNmN3ahVg5wWmyydDf2VSgzFVDMHGD1U
	 80XstMSumoPhXQR4rl86E6hykqtWaRv1YFDWBOaQTFKTIaoeC46nV+HY4oEdk7vqC/B3V
	 2NyTPZMuRW279cmdnpUsZmcAmRAM4982CtvNIEgPhQTecbu8dZnMMyEDArG1HtWdFliAU
	 f7oUROC+xljMSP93bmIdgGiZSEgf8pfaBr1TrGYDWrTIi7PDXzzB0SygznDU6mNPARg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kOt00kDVnIg1petIk2pRYb9G+8rJXwscwCWERTsP31U=;
	b=T5K4iQHu1NZ8ks8xVhB0mYchLjvVhh5aSnKKn9yZb3H6TB2e6JsHZDwq62Q9Zz83vg8q
	 6VVcggTfPrLMWw6THdqtoGSv5HZZmiZArqehzt4hYtiv/oCy0nHFdzWpNA6k00k57VUNC
	 3hRoNc9ennnJWstT69XxXXoV2wuU2kj49MuAmH0WXjhtAR+tdG5A0f6LWhXaate1Lqpfo
	 CVKUjjhfUhO/jGKIHV7+LHn8xvpRudh5ku1h6hWbqg398Uw1abb+0B18r1fD5+xbLK9K1
	 eAXeDPTdqeSxz12kKzHhnadBLb8rVgN6MGWc7zfzYTvbV0SMF5crv/hXccJB57+T/tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZJxKK6JE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D79606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1D79606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZJxKK6JE
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91ec396c93dso15456016d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:59:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254387; cv=none;
        d=google.com; s=arc-20260327;
        b=Z0W3imdAVrUSC2rdVQ6vXouc77Z4ZFK3RoQG9IA87l2WRdpY1wNVQBBq/PugGI4/lN
         MyY11VTNhJPk7lN3+rmiAljebKoG5SVIoIy70AzWFmhbKlblth1tJGiMuY7XmobAmzm4
         UpaF8q1mKRGPub4zOOO0RPYG96vnmZOPYil9NgQDJ4R8ImnroH4VS3pwNbmUtDzF727Q
         uBKRnA2X5cN5vEXcyY0uREVslktZHB6sEAfBC+8bDfMiNBB8d7Z8XcMT35j5EngpyQc5
         +fTaB3Q14QCuCpRcYdoi+DMDndLWTY1XXa1oh2IoB9gq/fW6EdYu5s1EquzBrldEy/Uf
         AWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=kOt00kDVnIg1petIk2pRYb9G+8rJXwscwCWERTsP31U=;
        fh=1cdyTUgLEWY7Lqf7riBtd6GOMbLNrIMtap/NsU460Vw=;
        b=gtWuO9VNKqvXJ6zaGJ7akvG8DFeDuYlR4agQmwHl+RWOv8CrkWKa7tryqBgf59EJYI
         g+TqreGE/OPgy4P5+iBohjKN79QV9FiOodRfQvPl2BHxlAzmFV4GhWBx6rltCOfu62xx
         ujYLXo8tvRXM98nvS4ARqJf0V3FBUrpNtwTli7CPrhFEOsMRfdwV+w5+DTa/jxj/PnfN
         rnL4OX8AnMleg4v626xBJgsg2bHlcxn9l51O3akEEI8KKqz3O2FV8ljkk9JQTAKofINO
         +Itd0TrMVjbstT/1W0djjz68V9H5TDOfiyJsBIGMJxNk9NYvCPjoLHCTmf3cf9APPD85
         tLMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794254387; x=1794859187; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOt00kDVnIg1petIk2pRYb9G+8rJXwscwCWERTsP31U=;
        b=ZJxKK6JEnpFDdDiwDL4cx7CHB+t4t2jIDCE+8esAsw6zjzpvtFUdtuy+Y9Lcpo54Dg
         OF8bXjgBr4CdLb47v1hnaqP7mSQOeJRjRIQxQrzgVVz1rZvUtIQ6BRio4B1ZQ4OvKjzi
         eSlcSsOBocNlecFaWKoFMoM1D9OltBoOMBczdFL2iW70rLVP9QHO4zQCSszv1Do/kVEy
         WzESzHncdOcrhEF/ithmaJ6CyNELwjjA/AQhEkzGHDINTyEt/nTJ2+RU7xKvItQsVYPA
         YtfRVAcUL3zB3iXQbC9y1hmIxwJ8cNhrnXpMdl9oAgNnyKbSRfIWfxAYsUzFlkneQ7nC
         mOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254387; x=1794859187;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kOt00kDVnIg1petIk2pRYb9G+8rJXwscwCWERTsP31U=;
        b=aqC2uBwnVtYHj3jpsigoCdQINjzrh+86SdhShrhuwy95mAMTtDCA67zkW8NFmzxqYm
         5HUttwO9RwUXhGzgLx1b1hlI7q8Oq2b6COfbkPIz4/2n7PIiy1Rat1c9uBRjXp4q7sYW
         RZ++otaj3w85078AWHp+tO6y3RbqMZ1LMzepUpnjPB8T6ykGFosxZpCS/A9Id99mQFGu
         +OHxoCGnhXBy5ADN+t8KwPWLk4QEoRQR7IWwMidQTZxRPowyi3mhh1i5wc7HFOfKYIk+
         DhyL1Zpuu/DRihvi6c8KT2+qNV/UaDBMHnBlmFTeUwVGb2jOrH1PNSYHXPTMlvCtRYlA
         llcg==
X-Forwarded-Encrypted: i=1; AL+hErF9s/qLJFzSTLJQdnUtXVlbqWHNmj3KqHQV7evkZs+NC0Ai+ZnSpCHK/7ZZn0NvDUt4ADvfAcgWfj46C4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mazwGGJQ8iGWq+PQFoq318/Bs2fxKzBZpBJWL/bDPqDUQq9+I
	a4A9i7c5oYvGluLhrYUCCJVuqEkhHxQHgrTLn9opaSzjfOjyJVlAWEPUJ2Ikag7mT3OdiHQ83Tk
	KY+l7Atf6HuVJ25BXDMQJp87pKn4885ZgHUAqqUe4
X-Gm-Gg: AYBFou1G+Pzz1Ir1o7uBeaXCk8AuLihF606wpq+iOAb+ZCL1qmAONu6wzP9KATRm+6t
	YjELzbGPfZ2NzSmq/bCNOdrdxOyG5VWI0c1qM8cn1dfjn6k1BAAud5xH56Tptbk5ugie6l0P2FD
	UrkEH1iJzC5fzKWDzayixr0ZchnQLyay5uj0QR2N5o/BiYcxA4dKKD9+grm1KGQrXC8QejCG4kn
	xkGcADh1VBFWamKe4mtflYv3/kYENqOF8x9nw7ZC3ceH2oOl/johRnuKLC9QdOmf5HPDe+mDFe7
	ZMsWTPNHTPmyXS3e7ih4ww5Y4ELyGGAE+h/05ZuvhTcdx88BP0KvuAYl6P3Bc9Gkb9FKneOvE9+
	iIu7e3HBJ7Sm4nGRUuuA54YXnbe1//Mbr77oXNPCmWfd8dGY/dI+fFzHmDeV5Cnh9rAQi1uXsXI
	uFuORv+Gr20XOPiMxrWm6FPZY=
X-Received: by 2002:ad4:574d:0:b0:91e:a16d:7a30 with SMTP id
 6a1803df08f44-91eef808c9emr12577566d6.21.1794254386073; Mon, 09 Nov 2026
 11:59:46 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 11:59:44 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-12-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-12-2024e8fa517a@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 11:59:44 -0800
X-Gm-Features: AclHuK90wR_z4yVrzO4MfdjN_1RfU4RbtNS-E8SukabdQfjTq985Vre6DirfMaI
Message-ID: <CAEvNRgEkS=aNPcWn3NPRL56ibPvFS1d12Rvbx6gCE-yonVgLXw@mail.gmail.com>
Subject: Re: [PATCH v16 12/20] KVM: selftests: Call KVM_TDX_INIT_VCPU when
 creating a new TDX vcpu
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
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

> From: Sagi Shahar <sagis@google.com>
>
> TDX VMs need to issue the KVM_TDX_INIT_VCPU ioctl for each vcpu after
> vcpu creation.
>
> KVM_TDX_INIT_VCPU has a strict prerequisite for the CPUID state. To
> satisfy this requirement, call KVM_TDX_GET_CPUID and KVM_SET_CPUID2 to
> pull the CPUID configuration from the TDCS and commit it into KVM,
> allowing KVM_TDX_INIT_VCPU to succeed.
>
> Additionally, unlike tdx_vm_ioctl(), tdx_vcpu_ioctl() doesn't check
> hw_error. KVM's vCPU-scoped TDX ioctl handlers don't propagate SEAMCALL
> errors into hw_error: the error is handled in the kernel and only an
> errno is returned. Checking the ioctl's return value and errno is
> therefore sufficient.
>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
>
> [...snip...]
>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
