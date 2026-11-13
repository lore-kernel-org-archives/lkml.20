Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577892;
	b=2lwUOPXeFCH+o/akY8lZ3dEvZz6yYt+RjL1882/YN6+Kw3c/UK6XvhBwUKMBFV7S7Izr
	 cpacJkwlAR7D3kLK5vqIhjKn6jfGeph01RqYY5ZPrx2/9Y1zanSNwqa5NtdSV5Si+7FTG
	 59PiAxN2REHI3nF6zAB1z7ZIFHHl/vfRp/3wlb1rWawzwuNxDx1wUDqF+1lFmBIzMAD/P
	 JXTPNZZAEFk0IHSEqQaQNm23Yo3s7voxWSHNRRluuS0iyv31xIKzdQMThmDbATGNP28Of
	 hsPz93oPAD2CwQ4q58tf+VXX7hCbrolE/m1AFDbfVLBR1f7NDW2//Tk1w8EYkqTp+kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=HXcFqkyCwC/scABn7YnbJt7nSVqNX1uskRy4u0MJf40=;
	b=oCGToNTtk1zpGXHxPM7nOMTfYz7VjYvUbT5v/BcmfRSJPnjPA+nmqs/knKmBERvl7h1l
	 YJ6YD8gJpoYrbcQmz/e2v6gAvjAyj9W3exFaw60XQFzZgToibmK58AWFDu+W4/zLeTC+G
	 Erc9MtZ2miRNUhQu25tOTlqM7CG+FUvTR8aVnmrtQQ830iqkiXCPlwKPQaJIb2yrLn6T2
	 ZewCPUtAFO9MFyswa/wvlyfj3847V3px5O4Yv4ikNem+HsXbhS7hnFWEAnZoP57Z55TG5
	 ViSN5xz7FBb2AypYEgRALSm7IT2j9kJU+ZwR7ZKWYdw9WXCjtlVkVI/qbw9KJBZZxGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SndIOSdP;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2A2606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F2A2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SndIOSdP
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eced5a4cb9so8220105ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577892; x=1795182692; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HXcFqkyCwC/scABn7YnbJt7nSVqNX1uskRy4u0MJf40=;
        b=SndIOSdPwggsbjvq+DliS7h/mRVdS5Q/G999q+LMu6Hk6k7RmnKb1cAS92Vu4Vljyd
         vCbJqPj/SlzkIRreTZA1sTFleRg4XzrqAoXZQK1wxTw3BVTjFgQF0eMuSxmFM747MR64
         PYQ6giTPgza4GVy+LfbtrOobCd49GA7mbf2vhtYXLDUvnDIXLgSNRerV7wl9s2j8Q+N/
         WZcG+0kB5EtTIEoobcefae9AQEhD02wqf+aXSUiq7sbTCdH8h8NJFTT3orBn8AuMz36W
         Rc3pt7votAEHxYK4NWhxl0dNZNahXeHtry/WVoiHWF3tXFVxhikyoN/abm0a5m3vdLnN
         lpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577892; x=1795182692;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXcFqkyCwC/scABn7YnbJt7nSVqNX1uskRy4u0MJf40=;
        b=HucMIt1jF1S6qSyNv2BGTt5sxvVBqqgJTuUWELlpAehZgdGbsduNMCSkJr++qxd3Rj
         1QUc1g5iOJH+YpzmbGTI8yQWqLDwnWHl9gIU6B6RuiJZEPF0OQJ4mO5lJs8MRocSDCfM
         1oHW7/AS0qGKK2ILvHW7sxvhUcpUSsQ2tWC9RrY9VBHbgRFjFkDI3xrR0BK06f7tokE1
         mlYgUJCmaqFLn9zQOtLzM0G16nDg6vlduxzxjQ5e5kz+DxNBkiRw0Lup/rXxuDs43GQ1
         7r8VjbnkhkeBNbYXLl5XpLo/+psZPIpy290vgMICMOedlCblPP+nZnR34whODbBsAWR7
         +zWw==
X-Forwarded-Encrypted: i=1; AL+hErE4AfCoPi2eAMe1b2P5lo19+ZE5mfN0qK5RrBM3vfUTbHEqVdfpy3pMqKwq4zEZmTRrjlS7cPmGtmxLI8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rSfS4yvTaenfbCTI16KNr6GcUD8yy7g36x48MrWmchg4NGplk
	Yl9lknvyGge9D31rTVS9JE1FDDWVieCg0xhhKJw5hYm+Sn9UrGu5IZavUhUjUgIb4BUQSBRubOB
	LKS0zDg==
X-Received: from plty11.prod.google.com ([2002:a17:902:864b:b0:2ea:f122:5203])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2408:b0:2ea:778e:8652
 with SMTP id d9443c01a7336-2ee0dc93dbemr26695325ad.14.1794577891435; Fri, 13
 Nov 2026 05:51:31 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:12 -0800
In-Reply-To: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
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
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441802621.78886.14787732299465308597.b4-ty@b4>
Subject: Re: [PATCH v16 00/20] TDX KVM selftests
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Oliver Upton <oupton@kernel.org>, 
	Andrew Jones <andrew.jones@linux.dev>, Lisa Wang <wyihan@google.com>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, 
	Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="utf-8"

On Thu, 05 Nov 2026 23:46:44 +0000, Lisa Wang wrote:
> This patch series focuses on setting up a TDX VM and adding all code
> necessary to run a basic lifecycle test.
> 
> Unlike standard KVM selftests can set up the VM through guest registers,
> TDX module protects TDs' register state from the host. This feature of
> TDX causes problems on VM boot state initialization and the ucall
> implementation.
> 
> [...]

Applied to kvm-x86 selftests, with various fixups.  Thanks all!

[01/20] KVM: selftests: Add macros to simplify creating VM shapes for non-default types
        https://github.com/kvm-x86/linux/commit/c2033e19e435
[02/20] KVM: selftests: Update kvm_init_vm_address_properties() for TDX
        https://github.com/kvm-x86/linux/commit/14a02e43b463
[03/20] KVM: selftests: Initialize the TDX VM
        https://github.com/kvm-x86/linux/commit/b025bec48e28
[04/20] KVM: selftests: Expose segment definitions to assembly files
        https://github.com/kvm-x86/linux/commit/8f2123548d66
[05/20] tools: include: Add kbuild.h for assembly structure offsets
        https://github.com/kvm-x86/linux/commit/6661b422d6fe
[06/20] KVM: selftests: Introduce structures for TDX guest boot parameters
        https://github.com/kvm-x86/linux/commit/72643c4ab9f0
[07/20] KVM: selftests: Add TDX boot code
        https://github.com/kvm-x86/linux/commit/1b46806fea4c
[08/20] KVM: selftests: Expose functions to get default sregs values
        https://github.com/kvm-x86/linux/commit/67dd56f4f841
[09/20] KVM: selftests: Set up TDX boot code region
        https://github.com/kvm-x86/linux/commit/88a23d1703b4
[10/20] KVM: selftests: Set up TDX boot parameters region
        https://github.com/kvm-x86/linux/commit/b86c78a4b546
[11/20] KVM: selftests: Require guest_memfd for TDX VMs
        https://github.com/kvm-x86/linux/commit/ab9e3c679b35
[12/20] KVM: selftests: Call KVM_TDX_INIT_VCPU when creating a new TDX vcpu
        https://github.com/kvm-x86/linux/commit/f347a3c84cfc
[13/20] KVM: selftests: Load per-vCPU guest stack in TDX boot parameters
        https://github.com/kvm-x86/linux/commit/65d1a3c322bf
[14/20] KVM: selftests: Set entry point for TDX guest code
        https://github.com/kvm-x86/linux/commit/edc0212274c0
[15/20] KVM: selftests: Add helpers to init TDX memory and finalize VM
        https://github.com/kvm-x86/linux/commit/8d6f19adc15f
[16/20] KVM: selftests: Load private memory and finalize TDX VM in kvm_arch_vm_finalize_vcpus()
        https://github.com/kvm-x86/linux/commit/e8414d36fa14
[17/20] KVM: selftests: Add a helper to issue TDVMCALLs from the TDX vm
        https://github.com/kvm-x86/linux/commit/6c477f8d23b7
[18/20] KVM: selftests: Add support for per-VM ucall ops on x86
        [SKIP - effectively squashed into patch 19]
[19/20] KVM: selftests: Add support for TDX ucalls, via TDVMCALL_REPORT_FATAL_ERROR
        https://github.com/kvm-x86/linux/commit/0c350dc88dea
[20/20] KVM: selftests: Add TDX lifecycle test
        https://github.com/kvm-x86/linux/commit/d0926be36474

--
https://github.com/kvm-x86/linux/tree/next
