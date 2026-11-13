Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794563322;
	b=Af21lmQUpDYCoxupOGoNtq+UlaC6Y1YMwrpPryQ3wAV3CivrKT2vRQOrOzt7Vzwhj+bs
	 9yRYvV3uNLDKyfTzfmgYZnwaX6Y5qSkxNtuE9ZhMKQngyiH6BcA+moZciBUmTvqaUP339
	 eLMSw4kGm6Q+ZuRTBLAsO4wyH37oftRwbuX2EWa2Np1IClWXSV+7m6lZjvk2vwjbMHuoU
	 Mh8J3mgr9jOZff/w4U8SApPC/HFhJEs67q9bpmbLJbLT0p/EhF0uEGddmll3odE2rmj1F
	 fIBTfeBHtXwp1FvNcjOz1h0bi8AGE6XxnExu477PQ+k1+2Q2YkvrczugcU81szYE+FA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SZEm3fBRIvJbx/BoWtbu1KusfNuPE7i14QPaGaBXJ5E=;
	b=dsz2ExkLyyIUjzzcoDPEj3BtNLsf8jc+wJfkOnoqsBmFVDvPUz1rWBHoPOh8rUaQIc77
	 0Uz9/ZtKE+SJf5pCXey2qE9lhhdz46FkSEcjZmNqLOnNz1bGwoaomVEfbsWjEFS3wj942
	 m1T5xl82FonbrPA/UlXlnPxLxCf/HiN8oY113V8nBEk26/D0BZUyuZRhW3lO7s5Pl00k6
	 D5gtub+MklnpwEOvKSecSDz3QaZ8cSquWC925nKg18ByWx7Dp4VxoyHaXZuBk9mFCoFk2
	 +CesH1rF8M3h/T7+BneX9xuTXoWSDYGfuwCiI5hwvxSMn5r5HNj21dfvtY25kpp7Vuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jv77Clb1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0343D606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0343D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jv77Clb1
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-7190d9bdb2cso996343eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:48:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794563321; cv=none;
        d=google.com; s=arc-20260327;
        b=jcmY9zJ3PE4biVbbhG5LuBCO9BQiGgniiX7Yc5pfLXbJ2Ee8oJe5RreY6tc3ARHCGG
         C3o9liedivJEIM25vgjLA8XmdAaWT6RDDSxoplPz9otKFAubWj1Z48KWyfseH1tb1v+6
         XnaKBMxNLjCZD+tw3E8l2cXpeeT7x862+Z2M5lTkTWYXI5qNsDzGqNqjNTzF71Q4RBHR
         k0CkMz5g29sKrr/mD/icKaf3Rn4fv7py0me+jRhRdeeHWb02nio3rqe6kbKMIUfS8CnY
         X1RllTArutfzrWQCYoz4jk3QrD2YFwQ2t+DOvPYkVQnBUhCp0Hpx0w8sgfdFlIDKTBfN
         Ol3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SZEm3fBRIvJbx/BoWtbu1KusfNuPE7i14QPaGaBXJ5E=;
        fh=vDb2Jr/f0qMB7ZO+QIHqdFnkHVNzRiojfhtOu/U27i0=;
        b=Q6rdY91vGFVPnuzqU7DZ57kgBEtTOt45cINy/gW9S0OHzsHepN682njD0A4yvfB5Ew
         LPKpzIaTNqXsikNqN/2bN5T+I5aFvZxHjEd3h2bs9fGfXxyIZRa4tiukp+1eF08GmDkW
         h/TX21rA8AHPxe0e5dU74dNGZnjSB2pn1rgMbfWwz5SY2gdgYaAv38TwfPjohlnTtFnO
         9CTyBuiDirEGfMQT6dwud4woXHWbKMH+3VphDxo2v3BotFChMPwKTIMCY9wWE8YyIEWo
         Vs0U1rKZPEIXzp7po9ZjTuNFl5xC9dAt7sDyhSAhI69OSL21AH8NpwDZlFy/0zmULWK0
         hOLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794563321; x=1795168121; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZEm3fBRIvJbx/BoWtbu1KusfNuPE7i14QPaGaBXJ5E=;
        b=jv77Clb13lyuOqIjfiPS4p3fXoGEBr/EhJKexqlJumu8TakGoQRHQSBu9VNTqY979M
         mBzvJE2kp8LOUyV0glvz4daiW66b3K22lGfcWn5dvn2rmdw6vdvs55770WG1GT2LR+sf
         R88zBeZC4Cf60w6SseDwdh/QWr+XMQVJ2AJfGwYffw1AcyXdvKS1ocNsZ3r6NAf8ZDb8
         oeExpn2kpemfprrC4LEWEkTQ6nY3ZwuD0MXjVNCKxGDpWrwk1oK5ULF99p7qxJVZAswi
         lPOPbIH8qUfHl9GizztqYlIkp2dFvN6M0bHK/JrVQ+swanTeD1pU7lvmMP5CunXAQ/dw
         MlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563321; x=1795168121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SZEm3fBRIvJbx/BoWtbu1KusfNuPE7i14QPaGaBXJ5E=;
        b=ZiNKQOexMibXpMHHE4yAEU0d08qxuz25rwnAa5Jb8wyo0G6fWvtg4hh6jJc2zxYvjD
         w3qUrbrAnK7jCotXiVQSn83Ia6k7dMhtVDgB+8JoB+PVwoBQ00GQ+UNMYDs1eIa6HuzC
         6iv22cv4B400gKBzA4/XRj/AjbuEMP/MPiGLnLmp2d4R8Plst7cV2eoJfY226kIGq/ay
         MtrLToYACFd867E5Fc6rOihEKCTDsnvseB+8g4A0xFglWnCceYM5dvEWuHspcBxGxB0s
         pwE8hK1iQ6B8rPgXGHgdkFQhtssLB28KFCRGEmKGYHToOxrcuv5+GvgSaRi602o6FFtm
         O23A==
X-Forwarded-Encrypted: i=1; AL+hErEgxdyL4rKeBPk6Ljy5UZujGSgKNqDNjbK6iw0UQgKuL0NpmnDw+QR9Tvq6Kl4LnpVSoX/gNSK+/VmQyBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bekWyF9De9JzGNd48431YgkXRK4MN6Lay6Rh0UI4l7dGJ52oK
	U365ga+dy9aevZGgR2lI4K9rR+YXJUiMrU54ZFQyd7BUSl5B9ZegHhkTZKJWcUCbex+J3R7xHbP
	oii/VmfwpgGz9Euwk1S+id+YLkbrcyo4=
X-Gm-Gg: AYBFou1GWCfnX5iPawVrYNv/W3vOALYsgU4HcBApa3guEDe4ZzsPvHjBbAyen41drh0
	/ZPhgBOu0+9U6+x0F+A8jKbwpTHy4nKqlNRMshAGXDVjTjPR5TRfDcAFh/bGjuSqH1QZ+yrvEV+
	nwryMWtcm930QzfrW/tq0/ZVFQKRKxBrEFXUVlZbEMMSePfN8OTQ61cxTdpcljWHo2Z/x92GjQs
	JiVjzf34bZYr6qjddKYwckKneX8nQgGsunlQHvh9b6KPkTK/9NLvh7n2V/0je4j7cQlOlSawgMb
	+8nLXtyA3M/X6/jjB2IKKYHE2GtyVVo2Qv/U+axMWJuzcJxe5XbEG0EnSdcs44qK5QPgA/QTlNt
	DF9+zDisClki+YHo+fYrKQmIw1aH9Z9Y87VTM5O7bnJ9POqVmR04kgu5ywpmh
X-Received: by 2002:a05:6820:6fc4:b0:716:e2c3:e48 with SMTP id
 006d021491bc7-71ab50e864emr1017445eaf.58.1794563320647; Fri, 13 Nov 2026
 01:48:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260821201432.879450-1-Ashish.Kalra@amd.com>
In-Reply-To: <20260821201432.879450-1-Ashish.Kalra@amd.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Fri, 13 Nov 2026 10:48:29 +0100
X-Gm-Features: AclHuK-l_3UXJP1eTJDtPvdLhfXvgmrVR8-YQaX4h4dQv4VKuNhz7ofGxIqEsbY
Message-ID: <CAM9Jb+hD1Pq_fT7Km23vxTKf43MHUn0g5s1ue453WuN817gLBA@mail.gmail.com>
Subject: Re: [PATCH] x86/sev: Skip DR7 write during kexec when it would
 trigger an unserviceable #VC
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Srikanth Aithal <Srikanth.Aithal@amd.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"Gupta, Pankaj" <pankaj.gupta@amd.com>
Content-Type: text/plain; charset="UTF-8"

> machine_kexec() calls hw_breakpoint_disable(), which writes DR7. On
> SEV-ES/SNP guests that do not have DebugSwap enabled, DR7 accesses are
> intercepted and delivered to the guest as a #VC exception, which must be
> serviced through the GHCB.
>
> By the time machine_kexec() runs, snp_kexec_finish() (called from
> native_machine_shutdown()) has already converted the per-CPU GHCBs and
> the boot GHCB back to private and set boot_ghcb to NULL, tearing down the
> GHCB infrastructure. The DR7 write therefore raises a #VC that
> dereferences a NULL GHCB pointer, causing a page fault and the kexec to
> fail.
>
> The NULL boot_ghcb pointer is a result of commit 3645eb7e3915 ("x86/fred:
> Fix early boot failures on SEV-ES/SNP guests"): that change makes
> __sev_get_ghcb() return the now-NULL boot_ghcb in this window, turning
> the previously-benign teardown-window #VC (a bogus VMGEXIT the host
> rejected but survived) into a NULL dereference.
>
> Skip the DR7 write in this case. Its value is not needed across kexec
> because the new kernel re-initializes DR7. Guests with DebugSwap enabled
> context-switch DR7 in hardware and do not intercept the write, and
> non-encrypted guests are unaffected, so both continue to call
> hw_breakpoint_disable() as before.
>
> Add a CC_ATTR_GUEST_DEBUG_VIRT confidential-computing attribute, so the
> debug-register-virtualization state (AMD DebugSwap) is queried through
> cc_platform_has().
>
> Reported-by: Srikanth Aithal <Srikanth.Aithal@amd.com>
> Suggested-by: Tom Lendacky <thomas.lendacky@amd.com>
> Fixes: 3074152e56c9 ("x86/sev: Convert shared memory back to private on kexec")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> Reviewed-by: Nikunj A Dadhania <nikunj@amd.com>
> Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> Tested-by: Srikanth Aithal <Srikanth.Aithal@amd.com>

I stumbled upon this issue while testing kexec on SNP on 7.4rc2.

I confirm this patch fixes issue for me.

Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>
Tested-by: Pankaj Gupta <pankaj.gupta@amd.com>

Best regards,
Pankaj
