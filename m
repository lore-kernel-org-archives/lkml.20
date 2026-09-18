Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB933A4F3D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695655; cv=none; b=ssgSgX7q4ejDBET9MzADE1MMiQgehqYODvci+6PVHT7jA2kxOfy7mzxh/ocR9N5shcRmW0RHyGqpW394jizpteQ5wjcS9Znt+SPl6bULR6z5Wn7cZEDVk4bz+4Dfb7voDHWNiVw39HIGH2K8ETfahoUdL3kuoTGPHhhC+jRlykw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695655; c=relaxed/simple;
	bh=Eo/yga4vDEGayDHqVP6iJdYvyA2lrJe+j+Dvmd1JbAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOqQN9Ct7TpfcL5aOarARhgFufGCZJpsjbVO2bCKz3Bvn8OXrj0tavh0yeraCUq3bsyLBEdKUa0TzN0bYFTZLq/AoQmXaIaBJ48ovRtCj/VtI4q5T82ZQ1BXgXO5PRssu1Puz8V2MO0NLldiTQQ1wxzdNrJBvJ9OMeUqWRYD/Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mGODxZPG; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mGODxZPG"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so31125ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789695651; x=1790300451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=76px+Ex0r5rs6bbVIuEECvEPc+oBZjVRzvMFC1AHdA8=;
        b=mGODxZPGmp4Gdmnap0fOCFwlstLS+6T+Ak9EigAGvei6IWTd5xh5f0lhBDolSuV4Qa
         Mj6IVGf+qeVqlURhLCx8r16hI39W4K8mGkWVQAvV0DjJsWMs/OECj1qtIbEstV29xhjH
         DrrprQbdseo/DSVmi0noPc9DlLSj1tRWW2AV7JjoH7m2FImDfqG7ukg2YDUc/JKQ6X9y
         dt5cA9F1pRP96HQRBXWf/PGb6jNzM27k2yMowMsrws7rxa7NKIqMkgGSlLIe7pv2GMMG
         cvbE9cpWRF7Itf6s0XKXvSf3mUOhwjwEPTy6J8px8lndxJxjwrP/HLH/tfcO0a7zS7gn
         3tVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789695651; x=1790300451;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76px+Ex0r5rs6bbVIuEECvEPc+oBZjVRzvMFC1AHdA8=;
        b=FkRjggXIalxfQY25paAS1XmpgvXcnOul3HLR/awt6LAb9c1X5Q2Y64JiXGlneUlXQB
         RZ2MeGSL/gXvLZBeM6WYvgatgMtcgenZzD6cPYXHUh8jNCWtU4ZfSTS2U2ZX2M2ykKMd
         PhMwEOxru54Oge/x761gynfzjlcZexeYZljWxLT9Ii5UuqS96/dKBUAk8xlfVtFQ8KkF
         4IVb6JiTGJpP4V3mTNLIdGcY1EaJvctt+/+euRpLIHPfdpHh2cr46zmEM5gXSVKMkJCv
         YXCtn7ehj32DleOxoIEiRLMmowHW8rlK74K/NU3pA3/65BUZTKaWpFiCtihDBQDSEs6L
         1ImQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrjJ1pGA1I18wZbfeRIGW0YxEjKTAfl448rfAFioBcuDEktvBOr86gq6+HUMWa8kS47TME9epdnQyrZn0=@vger.kernel.org
X-Gm-Message-State: AFuF++nzpog3c67YQekZi3yW/9U1AcrwuiMyYKWaaYAqk8FfShcVSTyF
	mFS5IrZAGvk+Z1oOfx3xXZn+VR/bIG8N665vsKmrAk8B3CfTgbqY+pYRfGX3NuLgcw==
X-Gm-Gg: AYBFou37Ce+JfvDszVEXmdMoixbqKQvrOxzunRrEWzsmNvD1/pZVJdyje/AvoZzTMkj
	j4TQQuOo/p4InZSBtj2KzLjEmgNg137QtIg6eAGXR8UNC9onknrj6XhnuGUDe7yArb2N41Fb1Mn
	5zea7K3aj22lQNcXnsn5N3GbvIeCPXTEK3sUZMDd2eWynSio6xsxuyyzGNoTLeDhb5gcliqPhzK
	6Fnm+macf3k1OCuZBnqt7mGDSTeaGMGdJkBMSS187LXlgAkUXGddD4xpLBHOgdfrnMEJ0VaJeEe
	UhQbJBXXELwID2+jSc7O6Ug/gF+V7Hbws6xSgrZ42lzfy/hX3ZhXoHXDnXyM24L+qgugcxV8buu
	JBqhKAY0HL+LG/P8WmHY3+zfVZlONW+CYD0l3mMb4Fa/Sv8TnJJaaYKsxJp422wR7YKzO9D+uf/
	001CwTxzEPmNudrc3YiJX0b9CfVqPnOAKwk3VBUvbQSTydlU9WHhs3VJnnCrCRZWt2Ly4fAylKU
	PIlwQQOLclTsAgaP6hNjoXzsUKqBWlJ
X-Received: by 2002:a17:903:4b4c:b0:2dd:3a08:d47b with SMTP id d9443c01a7336-2ddb2bdaca1mr2575225ad.13.1789695649908;
        Thu, 17 Sep 2026 18:40:49 -0700 (PDT)
Received: from google.com (230.0.127.34.bc.googleusercontent.com. [34.127.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e36116920sm7796342a91.5.2026.09.17.18.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:40:49 -0700 (PDT)
Date: Fri, 18 Sep 2026 01:40:45 +0000
From: Lisa Wang <wyihan@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Binbin Wu <binbin.wu@linux.intel.com>,
	Chao Gao <chao.gao@intel.com>,
	Chenyi Qiang <chenyi.qiang@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Roger Wang <runanwang@google.com>,
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v14 03/22] KVM: selftests: Initialize the TDX VM
Message-ID: <aqyWnaGBa7Az5sND@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-3-15ad654a50db@google.com>
 <c8b7a800-58ed-4ef7-91bd-31da77763717@intel.com>
 <ap_Bpe7dZm_eWsJ2@google.com>
 <CAEvNRgFHTAPYTVQ8a_PVdFLqQ8z07Uep2XhA9r_Ypw+D0WAC8w@mail.gmail.com>
 <07cf5761-48fe-40b7-9310-b64712f5e314@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07cf5761-48fe-40b7-9310-b64712f5e314@intel.com>

On Wed, Sep 09, 2026 at 06:00:53PM +0800, Xiaoyao Li wrote:
> >> The reason we could not use __TEST_ASSERT_VM_VCPU_IOCTL() directly[2] is
> >> because it formats ther return value as %i (32-bit), whereas
> >> __tdx_vm_ioctl might return a u64 hardware error code.
> >>
> 
> Since we cannot simply use hw_error to replace ret, there will be not 32bit
> vs 64bit issue. But ...
> 
> >> I agree with your suggestion to introduce a new
> >> TEST_ASSERT_TDX_VM_VCPU_IOCTL() macro to print out u64 hardware error
> >> code properly.
> 
> ... if we want to print hw_error as well, we still need a new macro.
> 
> >> [2]: https://lore.kernel.org/all/a58e2941-77f9-43cf-a54d-023506dd7eb0@linux.intel.com/
> >>
> > 
> > Is tdx_vm_ioctl() the only place where TEST_ASSERT_TDX_VM_VCPU_IOCTL()
> > is going to be used though? If so, maybe we should defer introducing
> > TEST_ASSERT_TDX_VM_VCPU_IOCTL() till later.
> 
> I think tdx_vcpu_ioctl() will use it as well?

Thanks for replying.

I agree all of the other parts of your comments.

Just wanted to point out one detail: tdx_vm_ioctl() is the only place
that actually needs to evaluate hw_error right now. Unlike the VM-scoped
ioctls in the x86 kernel code, the functions dispatched via
tdx_vcpu_unlocked_ioctl() (such as tdx_vcpu_init or
tdx_vcpu_init_mem_region) do not currently return the TDX SEAMCALL error
codes into the hw_error field.

Thus, I would prefer to inline TEST_ASSERT directly inside tdx_vm_ioctl()
instead of introducing a new TEST_ASSERT_TDX_VM_VCPU_IOCTL() right now.

Lisa

> > I think the issue with if (ret) is just that TEST_ASSERT(!ret) already
> > does that same check, and so we can drop the if (ret) part.
> > 
