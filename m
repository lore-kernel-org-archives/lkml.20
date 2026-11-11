Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413447;
	b=CNTZ08cjuwPKXdyfWOhyHT8m98eEaFOuwQRzXA9VNEIs7Muphy0MQxeaFQ9YLZzruenh
	 Xy1BfeDQ812nb1BUzuNUi7ChcnPfXawv3plqatDZu9CiOXvjyfT0xLTqPyWqrTTzoFTcY
	 71Fg40Bk3Ex/vT2or8bP1iCmMS6chzHKDEy3RfD3A1zFH+245xN7vaUfq261/9rq2pN4H
	 9j0PkaKhECWPEHMJIiC7GqTPupXWGap1BV+/4lnPZF/c8eo7msr9XDvKdldxQzCCYxia6
	 9L1HgWUycoggBzjRuHQ++6ST9KGrYNXSN12fl0Q70xAW3cI9AdSxnis8eXuDDwzkx9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/fQfvN//SsC5kV/BzNX6zgi6Mg1pRUnE62HeFEaVagc=;
	b=Kk1viws54l+cX3lv5EdCOg5TK2mhwRzAigbS+qmvvGKFM+PszJxMCIk/S3FPxf/w28jZ
	 21sQXe47SLPDAyeZ/uz+aUeh+L1HVoyrp9fwAx0OxYoWnaRgOGv3fuxav2Lv/am2HY0t1
	 ThqObtv+C88PeLG5nDFzKGihnAMPYz7n4dQPRn8Kct+wRHDXDkwXQKfAufTvxL1qBgQlW
	 2Z8qM7AnDkBKIhNbOqIaA+TMsof4U51ujCwyEjTONm1zP0/EoPivvpMvd5BowGQAT2fwr
	 PquX+zpwOAdbCABve2jlwubiC/peAdSThMdLVEqpFYHqqSg++vqbO5Vp+5Ng7+pccpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V9OfH5IJ;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68886606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68886606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V9OfH5IJ
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so5489490a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794413446; x=1795018246; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/fQfvN//SsC5kV/BzNX6zgi6Mg1pRUnE62HeFEaVagc=;
        b=V9OfH5IJti8IaVMsGoGROmRICksQAWzg5oySMiDPT3HFdwJeZaGbgLepEbyWICtY/z
         ASPtpqwLTqrU36T4NSMfOERJsgOYJFYH98JqtSK1vClQSq4oX1XlXhEq+XCq4cPEMwlI
         fkyCwFHqvv0gRYfSZFXY9EHnG44ZeTZBKqPPoQDDX99WL+mbTJ16idpMqrxARh8SVzN4
         IA1aUvA2GcXJKmXeZcUNBrMQSwRPD7h6dgj0fJdX2qV11cp7ZEUYpTUmUmkurs7FH/jP
         IKlpzd9jBXwPxkum5RtHQuh9di1FuRJ0Tnw4GUxuMVQCMElmKeaSU4n4282VsI9zpCq0
         vbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413446; x=1795018246;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fQfvN//SsC5kV/BzNX6zgi6Mg1pRUnE62HeFEaVagc=;
        b=Nfgd70qxVlLhFWlM1BtrtduQ+CJBkTO8nftl2mfc1R8o6esEdSX0gcideSO7xVUVrw
         PbS3ygmH9tpLXr+hG2m28i7ZUY1CTfBR9QDAchyB6fEzJV5YOrFi39CyuJvqnuWtg8Ez
         SaoGEUn+B4G9n9A2K4l7t2vNVAmdf1xJicziZBQ9FX/fCQ4ZtgRD5LJQhw6bS0/cA8jo
         lrQh9VODfULrMUKXqthFFssXysWA2YCG3ku7rtUn1X3UlQrdO5qg4bC/yW4/xyaY4X25
         yl/H7xhDTxShz+YT9J5mKYWmKKfO+OdAftAs2ysdJCnSDesi/lZYEXwEsU06k2qWgpK/
         5nCQ==
X-Forwarded-Encrypted: i=1; AL+hErEWQwQPF7PyohvZguAAaPb0a4F3Ifom/BedSkrJzJ4oNcQrDN8gLzJdiv2oVH+RcHVJRFutT6BChTa9vg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+6xa0qZXhO8cczGNeYd/DcAGZAdD5UpH+sJl5H0AzO3f3CIv7
	+NVzksSJlAHroQjJIgV4cMPqeayshXcUdN9k8o/FQmyh++DaDVYDrOavqZv3WD8maEWPk/NN7UQ
	ksf80kA==
X-Received: from pjbkn15.prod.google.com ([2002:a17:90b:480f:b0:3ae:b67:263])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f86:b0:39e:6c68:c77a
 with SMTP id 98e67ed59e1d1-3b182f2699emr2883420a91.48.1794413445538; Wed, 11
 Nov 2026 08:10:45 -0800 (PST)
Date: Wed, 11 Nov 2026 08:10:44 -0800
In-Reply-To: <833af78b-60b9-4031-88e0-555363f8dd0b@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
 <20261105-tdx-selftests-v16-12-2024e8fa517a@google.com> <833af78b-60b9-4031-88e0-555363f8dd0b@intel.com>
Message-ID: <avSThO-PZPrIfT5g@seanjc-mac.roam.internal>
Subject: Re: [PATCH v16 12/20] KVM: selftests: Call KVM_TDX_INIT_VCPU when
 creating a new TDX vcpu
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Ackerley Tng <ackerleytng@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Chao Gao <chao.gao@intel.com>, Chenyi Qiang <chenyi.qiang@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	Ira Weiny <iweiny@kernel.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>, 
	Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 11, 2026, Xiaoyao Li wrote:
> On 11/6/2026 7:46 AM, Lisa Wang wrote:
> > diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> > index 4330290d29e9..9d951f67b3b5 100644
> > --- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> > +++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> > @@ -46,9 +46,31 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
> >  		    #cmd, ret, errno, strerror(errno), hw_error);	\
> >  })
> >  
> > +#define __tdx_vcpu_ioctl(vcpu, cmd, _flags, arg)			\
> > +({									\
> > +	union {								\
> > +		struct kvm_tdx_cmd c;					\
> > +		unsigned long raw;					\
> > +	} tdx_cmd = { .c = {						\
> > +		.id = (cmd),						\
> > +		.flags = (u32)(_flags),					\
> > +		.data = (u64)(arg),					\
> > +	} };								\
> > +									\
> > +	__vcpu_ioctl(vcpu, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd.raw);	\
> > +})
> > +
> > +#define tdx_vcpu_ioctl(vcpu, cmd, flags, arg)				\
> > +({									\
> > +	int ret = __tdx_vcpu_ioctl(vcpu, cmd, flags, arg);		\
> > +									\
> > +	TEST_ASSERT(!ret, "%s failed, rc: %i errno: %i (%s)",		\
> 
> Nit: tdx_vm_ioctl() uses %d for ret, while it uses %i for ret. It's better to
> make them consitent.

Ugh, KVM is anything but consistent.  I didn't even realize half the macros use
%i instead of %d.

I chose to "fix" tdx_vm_ioctl() purely because it has the completely unnecessary
PRIx64:

	TEST_ASSERT(!ret,						\
		    "%s failed, rc: %i errno: %i (%s) hw_error: 0x%lx",	\
		    #cmd, ret, errno, strerror(errno), hw_error);	\
