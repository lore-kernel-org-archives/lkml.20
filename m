Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375342;
	b=gacmQXxdWuoMjfDIXMuRhaAQW5L+PW1XAVDqPSsu20ZyQKJnJDCmoZukBN5lt6qj7Xpz
	 LAmggstuz+5J1B+nYK3coxJuzzR93FotHQxTiSsX5g9rnvL4L7CJ85lYN+ibWnsM3qkio
	 4Z46Qo7R9mXBuvlIEn1EB90RofMXTWup9S3Krsz0pZ5tx+5EPj2c/YeV9jtIPWCKtKN8Z
	 o/n3MT6IjXPfvkWyLAjBze0Af3raoVxxKHvXZjboY8gmd+jrtd/CrJul5nKZL9zgh8y81
	 mFNRIxnojQe9IkXllFlTuMhcBNFh3b8P/bAHRwiX0elJHTtix9q9rJk5lCNVbO3E+gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d0SM8LOepW7XUMwU+ZDps/Wc1zMBVt4O8GKS2q6Z4u8=;
	b=QXVbxorQlYGVruSbohqGEk+0RFak6ArkdXl7Xp+roq/sAZwAz2MNYpiqfhHgs4DJMm2B
	 P2PipwfuEj9CRLrV4j7rqilQjR4JdAVw3kHjxXiFYqA2PaFIIHCFXk9s3XRb+PnNDZNn/
	 zpvbjh76vKQh9eZvoT5di4Q/IphDLlZ5iiwkCFFwejTJpJuMi3uHMJC1AnKi/fd/G9D9L
	 i4p7X28jol0NwKvBOz2a+L9TKVKhjgftEh0yA/AzxxsdtJen7UyLG/QoRlsV+NdIwtXfC
	 FXg4MBQGbEjNcx0Z6Bb+Pl1j8zgZG2JDhSmiTrNoc1Mdo184QtZv9id2S99ox3DN1IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D+4d04eQ;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA48B606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA48B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D+4d04eQ
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ea7987517aso6701975ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793375341; x=1793980141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0SM8LOepW7XUMwU+ZDps/Wc1zMBVt4O8GKS2q6Z4u8=;
        b=D+4d04eQJNhajRiaB/I4WmxG9SSWEVIKLvDiW/Xtl9BEtjCKOnJAdJlGXoYJ8Ty5mU
         3k3rpwu0l2ZuRD3pok82XroXZqJMeIsjFJna1hpFd9jFjb1PFs0a3ZfvfXu6+iLm2ill
         8n8xYrk1esDyGhU9vDTbBSkfnyicReSBuXfvKzzfwefaZr+fs97U6uA27pwtghUG6k7U
         HiTgO9ymxPrd1BtnUsE4N1FNZ46GqZ+hqRjG5btZpb8Ox/ID/6wrZjQRaGB/VO6xSs48
         abXganD5CymVh3SOknsSzr6GnPl3nGyuo5iuGIscL4md+lkadIVadsny1/Oi9xhjtjsD
         OzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375341; x=1793980141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d0SM8LOepW7XUMwU+ZDps/Wc1zMBVt4O8GKS2q6Z4u8=;
        b=G7L0H7LRoqiGOPw0ekwJxb0Uj2VTIACAtedFaHaBJuV+3tYQYZ329XdZCaxvDzSx/Q
         NTENXfnoadIMMPKP0+VKSFSAszGUhv3GdlBsHY5Edusex1xdGnwNXRIFgWt/i+NSbiZg
         x7OXA2f36q151bgmkmzl42TAwXUI79iAqS/itpsSM6Yp7/8ysiggxVQjjETYGIh2VDXb
         +1Go4vcr6qk1hQbQy0KN10g8bTYm4ruxNw1EKQFToUx0JXEmqgCAOM1SQYMR8mPWf6Yh
         7M1R09K2WHHMOS/m0ktTBrtoDoZ+ru/o+wabdIHUIqtRyyL3txLM0ifO1nOCF4KPo8eB
         DcXg==
X-Gm-Message-State: AFq9FYIwrwlLQKgskiy6c/CYRGKJGHKlHEh7AJhbi+MALUAKkeVeu45e
	ndvP0l8daXj1L7pW7AiXWAn+Q+UPVbyrARpQc2GXCvUHcjHBStE6s40E
X-Gm-Gg: AYBFou16L06YlrBQX/FYD1ZYPtiZ5rZW2Cqj19jCCbtHx0r3O2kyvMes/fEHWW86LzF
	1eFrtZ3HWyQ0qgwJlsFZfJ3h37e0ESI75UYszWncY0FVgIH/GRNHaBd2UK8Q2NjSmUzRT7eOoLT
	CCraWdZ5mMXF+nwo3mzfs+prmCrqKaO+IsKZZ6/JnLAN/FgYStoeTsWWg3z6JGQKj/qW4ZBK+uN
	h+3k81Ia1Mmw9auD0f4UdTuYjLRqGmsncWV+GmI4mjUv6qKtNQiiWtI+trnZskTD7rGMhwclyjR
	BSrj6pE3OUjvq3xXydO2k+kcDiQImwI+GzQ1zSOq06H17UFP65HtxgbEOyR5twxUehHJeBX2PJs
	VTjDFCURYk0hagJ6SN4nIko3qvSG979ERHxkYtQeTKC/ePAQvpG3ksJ8SFih68RAC0u3VI9/gyk
	AvL7QDtKs1yBeIH14LdVn0++1DYU5GtMzmM3jlu9h0xI7d54BWHITOQNKtFx09FbKxOh/a0py29
	/PB7xwpYOQV2AcdJBzKR2OiA5P7AyUCBAIYigHo0OPhfuX+TfX2jOI4HmWVrxeTpmTcCzuzQBjN
	P5OJrrlAlflSf6XtAmf7oatTWyTUoQBdQ+SY2cUQku8=
X-Received: by 2002:a17:903:3c6c:b0:2e9:73db:3c78 with SMTP id d9443c01a7336-2eb3649bef0mr30087255ad.17.1793375341157;
        Fri, 30 Oct 2026 08:49:01 -0700 (PDT)
Received: from iZj6c0kydq3fvfrtx5kta5Z ([47.86.51.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39248621sm9426235ad.28.2026.10.30.08.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:49:00 -0700 (PDT)
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
Subject: [PATCH v3] x86/virt/tdx: Skip TDH.SYS.DISABLE if the TDX module is not initialized
Date: Fri, 30 Oct 2026 23:48:51 +0800
Message-ID: <20261030154851.907726-1-challvy.tee@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <auM3KKutfutAqgWG@thinkstation>
References: <auM3KKutfutAqgWG@thinkstation>
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

Gate the SEAMCALL on tdx_module_state.initialized, the predicate
tdx_get_sysinfo() already uses in this file: a kernel that never
initialized the module has no module to disable, and where it did the
gate is a no-op.  Doing it here rather than at the crash.c call site
also covers the syscore caller and any future one.

It also decouples kdump from the host KVM version -- a guest cannot
require its host to inject the #UD.

Fixes: 5b25f249be32 ("x86/tdx: Disable the TDX module during kexec and kdump")
Cc: stable@vger.kernel.org
Signed-off-by: Challvy Tee <challvy.tee@gmail.com>
---
v2 -> v3:
 - Rework the changelog around the VM exit mechanism from the review
   and scope the impact to guests on SEAM-capable hosts whose
   hypervisor does not handle the exit.
 - Shorten it and move the reproduction data below the fold.
 - Cc the author of the KVM commit now cited.  No code change.
   v2: https://lore.kernel.org/all/20261029094705.896693-1-challvy.tee@gmail.com/

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
  Emerald Rapids     0x6CF    Alibaba ECS    6.12.0-278.el10    no vmcore
  Granite Rapids     0x6AD    Alibaba ECS    6.12.0-278.el10    no vmcore
  Granite Rapids     0x6AD    AWS EC2        6.12.0-278.el10    no vmcore
  Granite Rapids     0x6AD    Tencent CVM    6.12.0-278.el10    no vmcore

Controls, each producing a vmcore: the same platform on a kernel
without 5b25f249be32 (tdx_sys_disable absent from kallsyms), platforms
without SEAM support (Skylake, Cascade Lake, Ice Lake, AMD), and plain
kexec.

With the gate applied kdump produces a vmcore on the two Alibaba ECS
guests; the others have not been retested.  No TDX host was available,
so the no-op case is reasoned from the code rather than measured.

 arch/x86/virt/vmx/tdx/tdx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 96ced0494b68..a7eae7492c1e 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -2321,6 +2321,9 @@ void tdx_sys_disable(void)
 	struct tdx_module_args args = {};
 	u64 ret;
 
+	if (!tdx_module_state.initialized)
+		return;
+
 	/*
 	 * Don't loop forever.
 	 *
-- 
2.52.0

