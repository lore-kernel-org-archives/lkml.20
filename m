Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604790;
	b=cUS/a3LxmN7jbtPfYahIEYrbvnxxXuX9pR67TPeH7JpMVmE1YtJfMxBi9+vSnVmP7HQH
	 9znrFiQWigdbaMn/iaqrnBYbEA+ZRI0DFEYa4Cyq3TzYHnjt3Y8wt4eKtMau4OOkIbohI
	 SbxCZXHYahQP8X4l5fCBbP5Y68vC+V4ntCMulkDxvZezFCXhRs7kLr+LuTzw/bV2pyzWH
	 dQPUAbb1AG/eHlT8+3Os0qA++8HdQByZSQe+NFzm9Y+/P8d7ZI+GbRXFl+f88mySg+6Xm
	 BNBNo6gFF5EsuU3BHnmkB/J+AGCNJhcaxPp+ba+CGjcUnf0FCTfDnrJlAueWq+5Up+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uhlq7lRBnMZgN/FlVC6dxixNTQE9Qh0fbitp0y0qEhA=;
	b=xZEROzSW8VSKMvG+7U3U6nbMwhYpVLqc0FOAoGAQdwIiBncl+Se3omL5dRwnFz1NfrND
	 ianufHeIIEQIzb8zMfnH4x7fr3oh+jq4GZkfMvmo+ZrG1dV8BtcDhqgUDvUvBILTlfKBN
	 f8PePGDoOQff+XZ64FGqfFm7c5qeZuTcoCq97b8ooRjwVKeEro7HPp9eP2sZ9zrrj+Qq0
	 QZCbHejMWGpiMwpk+LrNzaSAITJod7udfdhLpCndOwrAyFLp6JFQVm3NVPuMc+le8P98r
	 3PgMPqPwhDaZbUI9Mx37HF3SLgDc/10tcmR2uV51pQ7LP4ClNZ1V8IfkU8zIBDTJzZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FijoGuQS;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698F5606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 698F5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FijoGuQS
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so1257767b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793604789; x=1794209589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhlq7lRBnMZgN/FlVC6dxixNTQE9Qh0fbitp0y0qEhA=;
        b=FijoGuQSUaP574cBOPnGIczHrUOjWFNk+Jrj5n35e1QLUZFUl92Q2mJQAAIRY/qjmt
         yfSIm4cqlrnhqOIhYqMtBfb1vR9mQZtZZuVQk7vUKi/4kAkWME4ZK/onJy0/xUFlCPay
         P/RYk7M5cYEYydnSHpjzXyv0mTCTPnOJSmOJV0JxkzAPKs4GpSCTpso6tr+e5CyPQLcK
         5VIY2bgxCNC21HzAb5ZiGCt8JMbOFVDuWDQTJjY7H+YjIm0oweELaFeyNgqG26pMFstz
         UmlqdiGKZiiWqzGeiQ3nheYmhEBke39hbZKtUL56OgNdNlkET4GIFtEGaUhY8SCkz8/C
         8S3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604789; x=1794209589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uhlq7lRBnMZgN/FlVC6dxixNTQE9Qh0fbitp0y0qEhA=;
        b=2atZbzGxilBjguvYPX/FAwflYdEqRSN70rj9AeSjulldt7f8VjoABf8nuXdVs3k9yw
         VmfO1b3PSEVyAcVMzX26bCM5ErHNfe9ymbTjj/M5L44rh4tl+kUGyLg6azGu7+MxPY7m
         rBQLXpIZfEbig5rQMvTgmATHgyEPeJ/dtHuUhi67ZGhHzOpYXnEehZ4YnqKxb8hKb+ZX
         56Ni2OZJf+MdpKNwlhVzgIiLMCfK1LOffeWLuZONZxR+PMRAPJotqMw9D7iRwqQ8F26M
         H4X0XwduD/xJzQhKKuHuZALEwmKZ1GRhFUhugsyxqkVVXYhfpPFRNqrLdLbu8IcCgink
         +wOw==
X-Gm-Message-State: APuU4Z8lemuIh2erZ2sb758y6iDLUZAlIkeb+sk+uCvDUCeVQhq5faYT
	/9XprSnTg128Nigw7zwFVqDShL2P+pXs/IndyYpfk6Ub/0WA48NzFWCp
X-Gm-Gg: AYBFou1CdiqDP1GcHVncJaNsKq7QJ8aB5ZiBB9cfbGRmmC+uE0q5Fm9OUbOhc2x3yYh
	sPcIy86m7xPPNa8NNsj9/xWRAt+yR96lOvGRnSIIiDywZkiCrrex8k0YVlhrEpW8RwUue43lwHO
	jXyX49lYOOg5tMJQg3CKmTMS230LdzGX966q3D2hgyiM9iErh2jC9prFN5LJ2UODNRxGnNtbzzi
	xQau8ua1exsKA9939re74apVNO1SkT2sSuA9on2+aQQhrCUVobV/qdOcBhpMwjCf/I+7tXZyajE
	TRq551f3KYcRbhLzxiypFUZ9OYWhMXYzMygAkyd7TGr1YMsx7la/slJNn+w4cdmyKg9thycGiql
	HTURLHhTf0kLh93MCyEd3A4r7ZvpjZ3C/2NTBQgUmi6ymgX3LBtFoPaPWiBvt4anbN88apiREV3
	NuVeD9vzz3MP/qq30ueKtah8NMsbrdkzqUHETEb6ymCoVwCui+4owrPDNTyvNs6aYG909yGZznj
	ogEqPZL6sg1vBodzH/iAgiX5J7nEpLeC0X8cPa0Iba+7+9WV7+b4/furqQCzUYWknOSz1ovQE/G
	QzquLhNPbxs6ZQu80BL8grtydj980Zht5JaS2aJHN/U=
X-Received: by 2002:a05:6a00:340a:b0:89f:d449:7526 with SMTP id d2e1a72fcca58-8a8321b41acmr7898596b3a.21.1793604788690;
        Sun, 01 Nov 2026 23:33:08 -0800 (PST)
Received: from iZj6c0kydq3fvfrtx5kta5Z ([47.86.51.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada6c2c28sm1563174b3a.43.2026.11.01.23.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:33:08 -0800 (PST)
From: Challvy Tee <challvy.tee@gmail.com>
To: x86@kernel.org,
	linux-coco@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	kas@kernel.org,
	dave.hansen@linux.intel.com,
	rick.p.edgecombe@intel.com,
	vishal.l.verma@intel.com,
	kai.huang@intel.com,
	seanjc@google.com
Subject: [PATCH v4] x86/virt/tdx: Skip TDH.SYS.DISABLE if the TDX module is not initialized
Date: Mon,  2 Nov 2026 15:32:44 +0800
Message-ID: <20261102073244.919864-1-challvy.tee@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <07cfa95a-e766-411b-8765-33352a04c0be@intel.com>
References: <07cfa95a-e766-411b-8765-33352a04c0be@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 5b25f249be32 ("x86/tdx: Disable the TDX module during kexec and
kdump") made native_machine_crash_shutdown() call tdx_sys_disable(),
whose only gate is compile time (CONFIG_INTEL_TDX_HOST).  A kernel that
never initialized the TDX module therefore still issues
TDH.SYS.DISABLE.

In VMX non-root operation on a SEAM-capable host, SEAMCALL causes a VM
exit instead of a native #UD.  KVM injects #UD only since
commit 9d7dfb95da2c ("KVM: VMX: Inject #UD if guest tries to execute
SEAMCALL or TDCALL"), first released in v6.18.  On an older host the
VMM gets KVM_EXIT_INTERNAL_ERROR and the vCPU never resumes, so
machine_kexec() is never reached and no vmcore is written.  Kdump is
thus broken only in guests on SEAM-capable hosts whose hypervisor does
not handle the exit; plain kexec is unaffected because tdx_shutdown()
only runs as a syscore op, registered after init_tdx_module() succeeds.

Gate the SEAMCALL on X86_FEATURE_TDX_HOST_PLATFORM before issuing it,
the way paddr_is_tdx_private() already guards its own SEAMCALL in this
file.  Without that feature the module is never initialized, so there
is nothing to disable; on a TDX host the gate is a no-op.

It also decouples kdump from the host KVM version -- a guest cannot
require its host to inject the #UD.

Fixes: 5b25f249be32 ("x86/tdx: Disable the TDX module during kexec and kdump")
Suggested-by: Kiryl Shutsemau <kas@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Challvy Tee <challvy.tee@gmail.com>
---
v3 -> v4:
 - Gate on X86_FEATURE_TDX_HOST_PLATFORM instead of
   tdx_module_state.initialized, guarding the SEAMCALL itself the way
   paddr_is_tdx_private() already does, as suggested in review.
 - Drop the v3 rationale about covering the syscore and future callers.
 - Retested with this predicate: kdump produces a vmcore on the
   Alibaba ECS Emerald Rapids guest (6.12.0-278.el10 base).
   v3: https://lore.kernel.org/all/20261030154851.907726-1-challvy.tee@gmail.com/

Hypervisor -- KVM on all five (CPUID leaf 0x40000000), across three
clouds: Alibaba Cloud ECS, AWS EC2 and Tencent Cloud CVM.

Host log -- yes, from the Alibaba ECS host of the Emerald Rapids guest:

  KVM internal error. Suberror: 4
  extra data[0]: 4c
  extra data[1]: 2f
  RAX=0000000000000045 RDI=0000000000000045 RIP=ffffffff855422fe
  R12=8000020300000000 R13=8000000300000000 R14=8000020200000000
  Code=... 4c 8b 5e 28 <66> 0f 01 cf 72 05 ...
  check runstate transition: 'running' -> 'internal-error'

Suberror 4 is KVM_INTERNAL_ERROR_UNEXPECTED_EXIT_REASON; the two data
words are the exit reason (0x4c = EXIT_REASON_SEAMCALL) and
last_vmentry_cpu, i.e. kvm_prepare_unexpected_reason_exit().

RAX and RDI hold 0x45 = TDH_SYS_DISABLE and RIP is at the '66 0f 01 cf'
SEAMCALL opcode in __seamcall.  RAX still holds the input leaf rather
than a status code: the SEAMCALL never returned.

Reproduced with 'echo c > /proc/sysrq-trigger'.  All five have
CONFIG_INTEL_TDX_HOST=y, kexec_crash_loaded=1, a kernel changelog
naming both backported commits, and "TDX not supported by the host
platform" in dmesg:

  Microarch          x86_vfm  Cloud          Kernel             echo c
  Sapphire Rapids    0x68F    AWS EC2        6.12.0-278.el10    no vmcore
  Granite Rapids     0x6AD    AWS EC2        6.12.0-278.el10    no vmcore
  Emerald Rapids     0x6CF    Alibaba ECS    6.12.0-278.el10    no vmcore
  Granite Rapids     0x6AD    Alibaba ECS    6.12.0-278.el10    no vmcore
  Granite Rapids     0x6AD    Tencent CVM    6.12.0-278.el10    no vmcore

That dmesg line is printed by tdx_enable() when
X86_FEATURE_TDX_HOST_PLATFORM is clear, so the feature this patch tests
is absent on all five.

Controls, each producing a vmcore: the same platform on a kernel
without 5b25f249be32 (tdx_sys_disable absent from kallsyms), platforms
without SEAM support (Skylake, Cascade Lake, Ice Lake, AMD), and plain
kexec.

With the gate applied kdump produces a vmcore on the Alibaba ECS
Emerald Rapids guest, retested with this predicate.  The Granite
Rapids guest was verified with the v3 predicate and not re-run; the
AWS and Tencent guests are reproduction evidence only.  No TDX host was
available, so the no-op case is reasoned from the code, not measured.

 arch/x86/virt/vmx/tdx/tdx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 96ced0494b68..9b01131f7b7b 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -2321,6 +2321,9 @@ void tdx_sys_disable(void)
 	struct tdx_module_args args = {};
 	u64 ret;
 
+	if (!boot_cpu_has(X86_FEATURE_TDX_HOST_PLATFORM))
+		return;
+
 	/*
 	 * Don't loop forever.
 	 *
-- 
2.52.0

