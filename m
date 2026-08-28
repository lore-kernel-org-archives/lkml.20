Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A853D3D1A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787948051; cv=none; b=P8EqVxleCHtEYEWr4GaygTw8Z5un6Urk+UUzW0u7d3vhdIXG/yiXpBQMb3g38JhkP8yHjaqjdh9OLRGK5CdmoVrTDQV20sQAm9YGk2ZDwDPkqauC1jCg7G8nJI6aLW9+CSjkMWL6RQajjeGrE+UTz7pVUQVyDtTYj37Fd26cwJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787948051; c=relaxed/simple;
	bh=RrlgIjKQtS2iaNVqkTRdRTy02FrfZJ1ASwUAxdnue2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WigLn+my+7YuegiFpPPfSLGbQisRQ9ceUp7F1I4zqDTzHxWaPYvHqeNPrnXy/GeVc5NtmRPyG3wHAIlHe4r4BHRIhRLYQenQ4YGQ3y5xVstBeeNoTkTZA2uIKpqySHD6CSDw8Yywz9JYaBVb+vk8lMYTUCk9jmK59iAy0nonbPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xy7jaMC3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xy7jaMC3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d3b440b97aso5445ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787948049; x=1788552849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1W99GsbYdan7e4eL7ZVdhDx98mSTGYMmyZJimSzUaX0=;
        b=Xy7jaMC3s/Mz4S8vdPPGXaHr2smRZE+dx1unqDZbo/sGMkQm59ENDpCVo2uXJRBKel
         5v+IVKyMB+7pzlLkyOqXNO9j/s5YvHmTG1UwrVvzTrpIvQbEdoGQktExhdBDOad96jkq
         gTAVSzYJ+qlOv5dD4Jc+4sPqRMjRmk/OOASlCykzhWf1gI1XwCQwMnjD3L1sJqVAPBp+
         LsPyJzR9IhABjN3x3zdsc0Z8+sRPHdnH4y7KD6OhMODs1nfxr9rl0FX3bfHF9uMNQY/G
         KRAGnenn49k94sOQFqwnrlCA9Mat5xpnRNU+1D35pI2Hugmic/mCk5HH+Xqae1KmoFwH
         nM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787948049; x=1788552849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1W99GsbYdan7e4eL7ZVdhDx98mSTGYMmyZJimSzUaX0=;
        b=YptMbrZCNCvfk5ZnQKAPahrvyIr88u72RG8EPST+TL4MT/53msWvhaAFdePbnKVAxE
         FqGcPT0sUXpjaT18+86PLwRx6CKLi0jicnDizQTZIqAkHdyr0aQYlXw619iUQdpJJA8Z
         En874lIPBnjx36bCgbg07uPaBLwdHhGhGEKs//U1gWXRw//z/CIw1AkCmepR9hTDEpOm
         NaWr5zC3yIjOGd6HhCTK77JUGdiI9FuwnMTu5wkBqZCaWlFNqZ9hehP5g8a1cVSHQXmr
         wdmWWqq4byYraZZsVKy5oHHxbZYIBuRjwGjT8zMa4xgfUIRHjWO1myIWccduvSZW8UfB
         PE0w==
X-Forwarded-Encrypted: i=1; AKwUvBw1phOqW1PHNoNYLwZmD4wO0RInYq8z/Tlg5P+nq/o/dm7DhfH3T7/83Qipu27+GyVprrpuyMvYqjCEIvI=@vger.kernel.org
X-Gm-Message-State: AFuF++nUTyBNUewEPJDqYJPT+5AAF4YB6cFM5PH2AtUjjZogJgUWE0LI
	CrdnHZ45kEuM0JtngjJyd/qooOBcc76mHyCKkjc6MGni+OuYow6Ag/2LqCwmzKCH1A==
X-Gm-Gg: AYBFou0+8o/V5itqauIzWJKElx59LZLIDKNXkpH8ryL8pchjD4mJmruUB9pxh7ej9Hc
	uAZrFLk5Yh18RMmz5Ky3qVURUmldUAbhB5RLh3N0IWmMd7InphO3isX+Ecp+jrZC5m6NpS8gCF6
	eUPg+gZ2IOqEQ40MgXMNu208baojsQDB5+zCXff3m4bYr42N0NFgNvhHMinNjlJdRBrlDAl92OB
	IprgvTJNzNcqB5PnX0m3T1G8wqyAs2G8bWuoA9lCYIRVsbwdaeAVj6KXv4IijD4b+XlhCqoKdqD
	rF+/zT6TRsBWuBGiCRQ2gX4Qvl8thauM7okqokVJHGqti3p2UU/1G7lMFTFDULZTlFS954dQqQ2
	o8zCsHRtB25q/PxRbIeUTVaGK0PftsrBBtK2hO8LCx6TpiOD5sCpfwIZ5VKx48x7Q4iPn2DSP+A
	YmQXoAbqjB4KrvUSBYIIpPyRAQxqtveVI00gNJmwswioX6sizKdsI/zHzWLybf9lRmpEDlw/Bsa
	0GHm9E3+BoNubOEFJgKLMkA
X-Received: by 2002:a17:902:f642:b0:2d5:db38:800f with SMTP id d9443c01a7336-2d8df554483mr1432235ad.14.1787948049010;
        Fri, 28 Aug 2026 13:14:09 -0700 (PDT)
Received: from google.com (139.58.247.35.bc.googleusercontent.com. [35.247.58.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d759869cfdsm8784715ad.51.2026.08.28.13.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 13:14:08 -0700 (PDT)
Date: Fri, 28 Aug 2026 20:14:04 +0000
From: Lisa Wang <wyihan@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Peter Fang <peter.fang@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Binbin Wu <binbin.wu@linux.intel.com>,
	Chao Gao <chao.gao@intel.com>,
	Chenyi Qiang <chenyi.qiang@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Roger Wang <runanwang@google.com>,
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>,
	Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>,
	Oliver Upton <oupton@kernel.org>,
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v14 10/22] KVM: selftests: Set up TDX boot code region
Message-ID: <apHsDCRHG-QIYZuL@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-10-15ad654a50db@google.com>
 <20260824192702.GA3694338@pedri>
 <aoyi4nhWkhFrlIfs@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoyi4nhWkhFrlIfs@google.com>

On Mon, Aug 24, 2026 at 01:00:34PM -0700, Sean Christopherson wrote:
> > 
> > There shouldn't be a need to "pad reset_vector to its full size of 16
> > bytes" as stated in v8 [1]. The exported "reset_vector" symbol in v8,
> > plus the boot code start & end markers, should be enough to help
> > tdx_vm_setup_boot_code_region() put this boot blob in the right place.
> 
> Ya, looking at this with fresh eyes, AFAICT there's no reason to handcode anything,
> it's just basic arithmetic.
> 
> Side topic, this series doesn't compile for me, so the below isn't even properly
> compile-tested (I hacked in arbitrary literals to get past the undefined references).
> 
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:26:(.text+0xf): undefined reference to `TD_BOOT_PARAMETERS_PER_VCPU'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:30:(.text+0x17): undefined reference to `TD_PER_VCPU_PARAMETERS_ESP_GVA'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:33:(.text+0x1d): undefined reference to `TD_BOOT_PARAMETERS_GDT'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:37:(.text+0x26): undefined reference to `TD_BOOT_PARAMETERS_IDT'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:44:(.text+0x2f): undefined reference to `TD_BOOT_PARAMETERS_CR4'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:46:(.text+0x38): undefined reference to `TD_BOOT_PARAMETERS_CR3'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:48:(.text+0x41): undefined reference to `TD_BOOT_PARAMETERS_CR0'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:54:(.text+0x51): undefined reference to `TD_PER_VCPU_PARAMETERS_GUEST_CODE'
The patch series posted here on the mailing list is correct,
but I made a one-line mistake when pushing the code to the
GitHub branch. I have just force-pushed the fix to the branch.
It should compile correctly now. Please let me know if you
run into any further compilation issues.

I will test this change on my side. Thanks!

Lisa
