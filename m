Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672221;
	b=hb3oS30oL2pB6lPTIgfDcndw5NJlNs/aA1O7Gysyj+mlc1sCtV/LTF222SFHs812tJkZ
	 mFM2b4oYPm6HW95ooX55/k6cbf49RRV44RhxS1iJr5MxldkAxrt1fXKaYQyf+DwBFQ7Ls
	 4E3lIODxBL60lkImu1pwbW45o953gjNNtfeVT1nasxKWg0887Qi5smj0dGnFxfyW1hoew
	 Bc2e5oGbYFBVdXx6S+Cq0epLqcUfeXXAxPZxNiylS9z9p/pD7s3G6EzcR1JYCdOeuwLho
	 sFhmhYypz9FNiEHVDdgiCpa7DKoGrV60uCopMRja6LwkvGz0HkqO4rUl0ZO3WRwZhww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IOGgt4lAkAMwt4N6sT0llhti/KNul9J7tc5dogJ2lwc=;
	b=2twsZgTXxEVZTnktQTSxc5rld1FOJegjQNKdlfa+rMq7FIt+oCP38kRvc3tQyItmtJQI
	 btbVJWZ5QkTGFdIKHW/01qq4eWs3hCIWwUrkRvSCQaRdXsZ7e0nvrw9HKWYRHqdJULBxU
	 AB28oixF05ib/qsoNcb15l3qC6nCeEca/wi+Jt0vGRfiq1ZvpDEK8XTpLeV708CzysmXR
	 nlQ3PYZ69C66DWcnuXv68evZqPxAI067zfmvQTq65JWEKmH2DgKlnRAznSgYfa3n2ygOr
	 XlXIUG4hDBEPahBUtdmRAaUm/LTcgOZP/JB4OsZAEEmBDYtToWvZMC9GznGcw3wyCmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xFeGi6oK;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B56E606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B56E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xFeGi6oK
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so1553290b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793672221; x=1794277021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOGgt4lAkAMwt4N6sT0llhti/KNul9J7tc5dogJ2lwc=;
        b=xFeGi6oKTGL99bE6SUlm0Mom52pPJKiBe5UZEoYi7l9ccEdN2Bz6NpeweBzDsGuWsA
         SZOmR5SwuDI5YXvjLMiHEZszX7RJ9i3D6Gumrg6kkHP3aNH1oLtxI6nw6dOkY6q2Tn0G
         oRhB7RrweZcmspQuF6ZWJmXlAjGru4eUEWXSfutDspaqzyWdsg7YwKu0UJYECUeyixYm
         3ZyF78/chjzNXBaSnLpa8hM+u9tyA3m6zEB4CCHnwkUlGjBpcwIQx1znQB7Gkfu6ICrF
         BUY7NwMTOg/viqnq93m2jXCqCYiUGlt2kYDVC3PK3hOnLp4kp5CnzZ06NYzX/kZdir+B
         dSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672221; x=1794277021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IOGgt4lAkAMwt4N6sT0llhti/KNul9J7tc5dogJ2lwc=;
        b=I9tPhuoB3AkBvz8GdUvQ8O508jOXMWJWlSG0jcY1O4qPY1ecaqYAiXHRKRUnlEyW03
         tfa4avHq2FPxX//V0zsah92+SQeQvhDFV8E40CfHBNKtGH+6+sGvb3B7U8ZY7K8e1gwD
         s1yb9XSBSDsDvmaVV13I9ow2l7GeFbEap634NsC/tKIM4HB9BQbWX8Ft96pyyaWkA47q
         N3CdBtf04fVljIUG7vaRaAujQIGWWoi2ycRblkto5NwOEwOeazGzviORyYMzRvvNIAzH
         gEQbK9bZJsdSoPorhNteIeT4IeajS8xjnC62yS2fWhQwxI3h67eycbevKeYFgs6bRhIW
         Ic+Q==
X-Gm-Message-State: APuU4Z8DF+T2DAPTXwwAAk6jEMmPxGjBaH9VQk8D1j6oPs5KUGggoKHN
	Xl4YK8SxfY8XgBTkZO51zHoc9bXgkWc/IsaTFBQ3GNlLkLqU6spz2fnk
X-Gm-Gg: AYBFou0wONZh//rLCbI3H/UN7brjJ8XPbZxONsbBYcuLfV8OjAnfO+Vr3GHNCgBI0ES
	2F87XY9OhvqA507ArtPgQiM/dibzzSFml72cVWuVm/Ixr/MDY5FgMlDl38LRH3VdE5evEcxfQ7V
	S9oyn4dzChbqr95QubXmVUDFaqcSOLrfWklN+qWJgl3Xk0xDg1OZgUodQfgwJsuJ5mQDWuxLrgk
	KG5JqrpXjZvDNEdTDtFf82ru+ZHFUXeRBSDgYi3/xpPMcocl3PZZyiJ1oPo3aEy0hSrfmt3R2Ji
	wy3vhZcKFk2Z0RdtaubDMtFerTaZ07ZLLv+alFlyGFY8K0H/6iuEmw5HaFRxnUpo21NxEWaEQiS
	H+CRVIvXhYNvhkP09+VPaH8b+d5EbknlMaTKqqUJC6YuZWGukzvzZ7VMvGWucEYhyNTO0jr//6l
	70pRhnzxpk/QR78swlJndzeHHRPGGi2lh/4FNOWUrYSxDF55Py8oXX/RfR3Qs9cPRykxDvfEoEx
	OZ1W2zjRZRnuOI4fchCFo+Fttzz8bgdY9c86cIC0rFs9v2hvpqj3Pluaa/ZDnc1vD0yXEzvDtGb
	RHvdUo0Wp18o/VEu0wlMaFRdbhJgRkFYChY0hvU09us=
X-Received: by 2002:a05:6a21:3b49:b0:3e1:d379:f3b3 with SMTP id adf61e73a8af0-3e928fe8569mr7948733637.77.1793672220726;
        Mon, 02 Nov 2026 18:17:00 -0800 (PST)
Received: from iZj6c0kydq3fvfrtx5kta5Z ([47.86.51.122])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb36448182sm490457a12.6.2026.11.02.18.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:17:00 -0800 (PST)
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
Subject: [PATCH v5] x86/virt/tdx: Gate TDH.SYS.DISABLE on X86_FEATURE_TDX_HOST_PLATFORM
Date: Tue,  3 Nov 2026 10:16:50 +0800
Message-ID: <20261103021650.924302-1-challvy.tee@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <09c311c6aae214c04a9a55ff6456d7abfe82c319.camel@intel.com>
References: <09c311c6aae214c04a9a55ff6456d7abfe82c319.camel@intel.com>
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
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Vishal Verma <vishal.l.verma@intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Challvy Tee <challvy.tee@gmail.com>
---
v4 -> v5:
 - Update the subject to name the X86_FEATURE_TDX_HOST_PLATFORM check,
   as requested in review.  No code change.
 - Add the Reviewed-by tags collected on v4.

The reproduction data and the host-side KVM log are unchanged from v4:
https://lore.kernel.org/all/20261102073244.919864-1-challvy.tee@gmail.com/

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

