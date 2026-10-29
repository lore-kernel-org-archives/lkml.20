Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267240;
	b=hMi98dQYblzV3z0X1g3F8LNg4eySTMpTmTa4H9slyIieMs4CkwtZ0Gw2MhPW6Lr3Bbju
	 Q4PoXFblHd93gnwGTm60GBfsIri5QBtacGBkom493V+eFC0DX0ymoRRfKa9O7ob7s//Fq
	 ifI77+jHk8Vc81DoZVGmO/gpAZumYHO/8X/pznwZgB0EFIBgC7NjoMbWMaBYMYwCqbPAz
	 1CTz1V3FHBcjKqljPvC+gZIoyDYY8oPWgraIGbo7MjL+MV7bmj21cSEXz7mbPpJzg9hOR
	 /ev+LtVEKf4oHrK2qonx7udxcEU4q6DkGVDYq06VWkYmeKAe1f61jPFbrvfIrJxGm1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ln7ETxCnDGUOhcBIhAMeXSU0zs0khHi7wfl/J1q2waY=;
	b=CoEwHfVFsZhsJc4lMuXGjfHEuAzOZcDIP73/SG7FE3Wv28wp7KWQEzIUuxhJ/ptrenP9
	 YmF1OvyvYuL+1+UhgzMbH7sNYSaDzqd5cugaaNq57LMcFy0cyxtCbmcIeCntGVlvJKs+B
	 XiVcWHeT+vH059UasXOpNn+Jz1X6EZtQujm+B1x3qHoLBxbjJ9XnrsQwESuvAiKFth+9v
	 LjSgu0NTvzNYuNuQRGj0MI9g7POGcfM1aYJsypB/P4mVApNcmKkhwfmxHLSvzWYWAggN9
	 dXEQ55xpHcs1dkunWClXIOOhuko3I2I6Sn2sWdRfi3BS8GXwr8VbgcqHPig3m7OwJvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yfzmFTac;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EED606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4EED606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yfzmFTac
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-369f33df08eso3581046eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793267239; x=1793872039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ln7ETxCnDGUOhcBIhAMeXSU0zs0khHi7wfl/J1q2waY=;
        b=yfzmFTac7XBP8kqbbsMoZ+xLWzoC6AUSQRoKI3zWGfTaFLApxY+IxeFyBvWM5spngV
         KWOBbV6UawH7lLciqy3xtgsYoe70SNL0oH+JiqnOshYQp/xGiII8d+ma+NiHP3VylJ7k
         FnGj/fByujpPpiLKt8Kwfq3IbaTtodPFsYfN0CkB5w2F8NnqHK4lg6kFQOvd4SxVv+QJ
         3gP6Bbxf7x5KtkbG+YLXWzycH7j4ExkzDZHPNBFjJATgxP3sSO6znNRFzqhvPCPJZJZU
         UuMolS2u4K5ObxHCSfhRt+1pfiwfj1kKAI+EsXDvZlPsnDJqdHwP7v6ee413MvKY3uSt
         31Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267239; x=1793872039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ln7ETxCnDGUOhcBIhAMeXSU0zs0khHi7wfl/J1q2waY=;
        b=O7y3GO6H1VSviqw3tSVStkTAOn4KR+rx0jW1TzVgyINtqMQc/3TyNngXmMZ+F+w7IH
         82ut9eZP4oCfle3VAeaiXksIXbgicPb5u6sDODSkgzhr5bSUWWVl/UlQPbX47L2aj3JS
         CgtJwNsR8l5bTBKlRzwnbfga9MxnVmC5oQdnyH8PS+09mwuj5E1Fb1co41DvrE+Y2aI6
         XUZGeomlX0cScGh0ynn/BShWmOU2/LGWPRms0Ddo2IBXSGU7qV0LQUeNNZTosAAiKI+v
         11p0yjxx5o0nhSDgQq5KlBs3zGIZXX9vmX8Oxf1K8BCqFr4+/6D/x1MXtaeqA793sElR
         28+w==
X-Gm-Message-State: AFq9FYKB8fjpFI4pT6IlxoW+miFj5VulLevnMiGtrI/7pcFa58L1R7GF
	a5bi/sEXuolNE7MLaq55YahM9a10OlorbtdciPcAfDE6Bey7lDcteFZ5
X-Gm-Gg: AYBFou0UbRWBKE4uQtciGVCC44BlHGAIlon4GmPgdnKL1WZsqRVTFkXqPTrwQg3DW6r
	pYpo23OjB41jc0WK/28el43E+aQIurQ7UUksYBRdIdoIF/TNuU864qDFKFTurcXHkXrnchKLFFp
	kSBWOJhcvb5NtQFTp3aFWH/DKMnehagkMBlr3ogl1reU92+tjXIlLu+rDNNwj1id5KJS68Xhg68
	OBgPOgOO8YImSazQEat4l/LH9qYhgiZ2wV4MjnzL1hNpxGah//J5HlnSF5gmxCfby0ldkm/i6JI
	VOrjEp0YVIvtS6berjoUuhiLvPkG//qTHCQZGC0IcZl+3ZGP1jiCgcya8MSg00cXmox6e4mhHLX
	PWQujYWV2wVVThkCT3Le9Bn7y8ft718PLoYIM7AfvVjUU84rb+xGigi2+7s+ZcSDI+lB9udCncz
	sqgzUUCqFJcvNTB9ZiFxzwNyIxBYQId26AJvYbKiTPerL1VCTr5VZ3j/I1+HCfKIhkg8I8ZAgJP
	F2a7i8MB+qF4VZafg+MqsEDoNuM6u/Kxi4itZhR/tVZn5qFC9sWoaD+jdagXUXN1l9DpuJHd2gQ
	HAEHaJuG2/Eg3xpiiE8InSbsMvz8n3WojAF+KoNr7w==
X-Received: by 2002:a05:7300:d80e:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-36a1ff846e3mr7012686eec.1.1793267238675;
        Thu, 29 Oct 2026 02:47:18 -0700 (PDT)
Received: from iZj6c0kydq3fvfrtx5kta5Z ([47.86.51.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237bc445sm14464245eec.1.2026.10.29.02.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:47:18 -0700 (PDT)
From: Challvy Tee <challvy.tee@gmail.com>
To: x86@kernel.org,
	linux-coco@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	dave.hansen@linux.intel.com,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	vishal.l.verma@intel.com,
	kai.huang@intel.com,
	Challvy Tee <challvy.tee@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] x86/virt/tdx: Skip TDH.SYS.DISABLE if the TDX module is not initialized
Date: Thu, 29 Oct 2026 17:47:05 +0800
Message-ID: <20261029094705.896693-1-challvy.tee@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261029080731.890996-1-challvy.tee@gmail.com>
References: <20261029080731.890996-1-challvy.tee@gmail.com>
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
kdump") made native_machine_crash_shutdown() call tdx_sys_disable(), but
tdx_sys_disable() has no runtime gate: its only guard is compile time
(CONFIG_INTEL_TDX_HOST), which is enabled in most kernel configs.  On a
system where the TDX module was never initialized, kdump now issues a
TDH.SYS.DISABLE SEAMCALL that it did not issue before, and the crash
path never reaches machine_kexec().  The capture kernel is never entered
and no vmcore is written, so kdump is completely non-functional.

Having the TDX module uninitialized is an ordinary state rather than an
error.  tdx_enable() returns -ENODEV early when
X86_FEATURE_TDX_HOST_PLATFORM is absent, and it also bails out if
init_tdx_module() fails.  Any guest whose host does not expose TDX is in
this state and logs:

  virt/tdx: TDX not supported by the host platform

The syscore path is implicitly protected: register_syscore() only runs
after init_tdx_module() succeeds, so tdx_shutdown() cannot be reached on
an uninitialized system.  That is why plain kexec still works and only
kdump regressed.

The crash path calls tdx_sys_disable() directly and bypasses that
protection.

Reproduced with 'echo c > /proc/sysrq-trigger' in VM guests on Intel
Sapphire Rapids, Emerald Rapids and Granite Rapids platforms, in every
case on a kernel that already contains the change described above: the
capture kernel is never entered and no vmcore is produced.  With this
patch applied kdump completes normally on all of them.

Three negative controls, all of which produce a vmcore as expected: the
same guests on kernels without that change, guests on platforms without
SEAM support, and plain kexec on every platform tested.

On a host where the module did initialize the new gate is a no-op and
TDH.SYS.DISABLE is still issued, so the poison clearing that the above
commit was added for is unaffected.  We do not have a TDX host to test
on, so this part is reasoned from the code rather than measured.

Gate the SEAMCALL on tdx_module_state.initialized, the same predicate
tdx_get_sysinfo() already uses in this file.  Putting the check inside
tdx_sys_disable() rather than at the crash.c call site also covers the
syscore caller and any future caller.

Fixes: 5b25f249be32 ("x86/tdx: Disable the TDX module during kexec and kdump")
Cc: stable@vger.kernel.org
Signed-off-by: Challvy Tee <challvy.tee@gmail.com>
---
v1 -> v2:
 - Use the real commit id 5b25f249be32 in the Fixes: tag and in the
   opening paragraph; v1 went out with a placeholder instead.
 - Drop the claim that nothing reaches the console.  panic() prints the
   message and backtrace before __crash_kexec(), so they do appear;
   describe the failure as the crash path never reaching machine_kexec()
   instead.
 - Drop the paragraph that explained why guests on platforms without
   SEAM support are unaffected.  It asserted a mechanism we have not
   verified, and the negative controls now carry the same information.
 - State explicitly that a host where the module did initialize is
   unaffected, so the poison clearing the fixed commit was added for
   still happens, and say plainly that we have no TDX host to test on.
 - Restrict the syscore claim to kexec: tdx_suspend() does not call
   tdx_sys_disable().
 - Resend with the full get_maintainer.pl recipient list.  v1 only
   reached stable@ and missed LKML and the x86 maintainers entirely.
   v1: https://lore.kernel.org/all/20261029080731.890996-1-challvy.tee@gmail.com/
 - No code change.
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

