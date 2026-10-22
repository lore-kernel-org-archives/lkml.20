Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792703572;
	b=mbcbqW9AkF4nHBqr7bZo6YlRDk+dDmGzjAm/QP+MNaYtjvl9WjSU/ZuZ107QVq0MFXnK
	 5BzwMuEjpaP9ms4eOyOkrAUVpw/uQrkdm+4WXWI+ftwx4mUSfpMM0+xM+F5LL9vcLYZg4
	 YvL94n1AmfSITT0jjhB+a4bstiTH/5Jr17qUlQcassMKDHs+aauROLe8l6Ayv+fyf85nO
	 oSY+/4RmNh9121uD7kaPRaJ/YqQ8SE92suNw5k1deAhTbcUEOflssdUPaJFps9qV2rhZN
	 u8cvADuaOFSzyL2BswvbaCGPq5QdT7CCSJqFICbJdJTAWyTZ4ZbCvWVhCP06pJGGUvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792703572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:Subject:
	 Content-Language:From:Content-Type:Content-Transfer-Encoding;
	bh=WlgiEtRkCWU1xhIvVqFoxfWbh/BoRWRPi2HkiGC3rys=;
	b=CNfCc0sV1JKu4qW2mOb84JYyudzsAXwPu8S6rhacIKxI8ZV0PuO5bYBgL6hV6AMjj7Fu
	 FzcwR1EWRd/UL3aoKCEFXtI/qj5N5GhTqFB3mEsDma5I81pvJpgZZTphJIiOyM7yTpDNE
	 rHI9HaGG0rGdaU0k5wXxNZp13aMhJRO0gZHW0weNa834sT2be/v8fn6tGFyzyRpPBV5Vi
	 TDZyGhWvbM0ScFrjC1cHUEanjV2H3lycMGNsM5juNMU9wnmoEUvy/9EKy60LKw8pLVC5h
	 TAFWOIFtwwGyvE+XMTO0lC/Cct6LL9Kgswel2nsREt8EzsRIed0wMae94F/0q1Ddeeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="gYKwrl/E";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06820606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06820606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gYKwrl/E
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso2264765e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792703570; x=1793308370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WlgiEtRkCWU1xhIvVqFoxfWbh/BoRWRPi2HkiGC3rys=;
        b=gYKwrl/ErmcNRW+Hl0rekl2IV6ZRmuefESzcXd3YOq03fOomKOOzEoNNsvHEywHKpJ
         AC3Dtx9LO2kt/Ll5QxP2+2WzNyyi/YAx3SUeHmykDQKijM6G+Kgh7NNoErk8CVBGHv9f
         WKtyYp+bPbzTo4aJD5GvSzE2NjXXjDt9f0XxDFIAA6GarSqIXAGnNXGQmMTn3hXtj6oQ
         mVCSluKc+Cz4sBYDojw0EksdaI/d2h6Yt6/Fd4Lnvpt3Ekn/pHfjIyUy8tWOLZkZtYSl
         RlOTZNjNDE3AMbu1Y0ptsw+YWQOs6V1MhBg737Itg9JlWIiapJDrUjTHNNTNk7ebLvSU
         4b3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792703570; x=1793308370;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlgiEtRkCWU1xhIvVqFoxfWbh/BoRWRPi2HkiGC3rys=;
        b=msh1LQ3uJLz4WsGeQYrUbq43nqUngNTCjBqWxgNo07+eDcJGzrnPHqPXiU0znuz4IH
         MQhNzeu08nLvHipRC7FpgzccllFmuA5hjPl66wv0tK8X5rMw7E0lKXdiLoFg174wb5L6
         M3QvKoJUP9aY/BtpX+1C1WQR6ofRbFLp4lDPcFx/uGF22V+BwYceCKI3+9/iU74Bogq8
         WjjUH7vkSI1FINTa+j9rLKhfYFKlWr1VqVFSBF1Ld52CDiP0z82DirEgBFHpb6wdQHxU
         z7HB2ETr0FgZEbs8P3jzF/nVyg9LV9cu0TNKJ65LpzW5ovtgiKg7BD9om5W5zMYJyqmO
         LdMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZYYJURkKIEUi5FIuARslzR6c2M5ppEkei6njv32i/ya7ho8oMqemKRQBWNsOX3Sclg+a6hv1EKTXRncg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxGu5id0Pj0eHqLBJeApJu303ZVqhbCGbroBudomA1MXaJqv3h
	JBUucmJ8bweWF8ip+Rihb5iyd4GvUITSXfHF/DUvJzmiRxvITLvhPrSi
X-Gm-Gg: AYBFou3MJpceSNAwls9E7RS2IdQhCE1zDbxOrcssliDkAOEijgmp2ryi9sjaPVV/ye9
	WqaivGuDnVKuT7WAmZZyt2ZZ65Mu0sUIPJl7pZw85hM0RUQscbyMPo5e/3b45gVzXa7F4n7Ge+j
	rwq14MRPGJ2zAWkTwt6NjI6N5V0o20cfeAjJKtZFynU/R+RHh9Jcr8JWSGw7RznW3n+MflQ1ekV
	2yxFeVRbsLjuDFQbixKW0xDGnwoqOABw20aaj5tWGi2gb6utgP5ibus1mCUWvZfgnIq5iLJ59ng
	tOVZfpDQ0qYvZEvftgV14AUE5ytWutwkAdfHsKzwoXEEHSNmpXAbDUz5b3pJEzUucsFpNhbvU/+
	Fa3ZtUlZA//oAQ4MeJ+ByQBy6cSq2XB87UFIm/vT0PW1fytMLbLERW2bs/vitor4PqLRvMn3Dek
	pvWJfCrC0lAIwqnOsCalX4NeODvn53W3Sj54ZgikEhQ2Z/5ukLGk/NR7VNZ869e0irv0JaoBK04
	wD8rkt2PTeGS9yJ/BLJm1VwimTjR/9dhTHyDZwxjaRb5+FHK3Gup66uLa9ROJHXU83g33OXnFLP
	Ww2IL3rpSnH7FPD130aPK2a2GfzDJqo4VvbcIQ5A8sTEQYCO51vw22GdPHjnOL43niJaI6wS1tY
	5skUmglSMef2dQIWzFK4CwuXg3Z8t350y2HQk
X-Received: by 2002:a05:600c:8b38:b0:49d:34:420d with SMTP id 5b1f17b1804b1-4a211cbaf90mr3986765e9.20.1792703570283;
        Thu, 22 Oct 2026 14:12:50 -0700 (PDT)
Received: from [172.16.56.234] ([87.190.40.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211b899ccsm9084735e9.3.2026.10.22.14.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 14:12:49 -0700 (PDT)
Message-ID: <bce8e397-6d8c-4816-b147-4830abafeaa9@gmail.com>
Date: Thu, 22 Oct 2026 23:12:49 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Subject: [BUG] KVM: nVMX: emulating SMSW/LMSW/POPF/PUSHF for L2 injects a
 spurious #UD (vmx_check_intercept default)
Content-Language: en-US
From: Amirmohammad Eftekhar <amirmohammadeftekhar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Reporting a nested-emulation fidelity bug (correctness / KVM-vs-hardware and
VMX-vs-SVM differential; not memory-safety). It appears to be the same class
the stalled series "KVM: nVMX: Synthesize nested VM-Exit for supported
emulation intercepts" / "Consolidate missing X86EMUL_INTERCEPTED logic in L2
emulation" (v2, Jan 2025) set out to fix, which has not landed; v7.3-rc6 
still
carries the stub. Sending a concrete, reproduced list of the reachable
instructions in case it helps revive that work, and a minimal stop-gap.

The defect
----------
The x86 instruction emulator has no notion of L1 vs L2; all nested-intercept
fidelity is delegated to vmx_check_intercept() 
(arch/x86/kvm/vmx/vmx.c:8190),
which is a partial stub ending in:

	/* TODO: check more intercepts... */
	default:
		return X86EMUL_UNHANDLEABLE;		/* vmx.c:8272-8274 */

For an instruction VMX does NOT actually intercept, the architecturally 
correct
answer is X86EMUL_CONTINUE (let it execute), not UNHANDLEABLE. SMSW and 
LMSW are
decoded with an intercept hook (emulate.c, II() -> ctxt->intercept =
x86_intercept_smsw/_lmsw) and the hook is consulted whenever 
check_intercepts is
set, which x86.c sets precisely for L2:

	r = x86_emulate_insn(ctxt, is_guest_mode(vcpu) && ...);	/* x86.c */

So for L2, SMSW reaches vmx_check_intercept() -> default -> UNHANDLEABLE 
before
em_smsw runs. UNHANDLEABLE becomes EMULATION_FAILED, 
handle_emulation_failure()
queues #UD unconditionally, and the CPL0/userspace-exit escape hatch is 
gated on
!is_guest_mode, so L2 is resumed with a spurious #UD pending. For L1
(is_guest_mode false) check_intercepts is false, em_smsw runs, and the
instruction completes. SMSW merely reads CR0[15:0] and has no VMX intercept
control, so #UD is architecturally impossible here.

Reachability: L0 only runs its emulator on an L2 instruction that faults 
to it,
i.e. a memory operand resolving to an MMIO/unbacked GPA, which L1 
controls via
EPT12. No privilege beyond running a nested guest.

Reachable instructions (reproduced, fresh VM per arm)
-----------------------------------------------------
Confirmed at runtime on BOTH vendors (Intel 7.3-rc3, AMD 7.3-rc2):

   SMSW   #UD on VMX,     clean on SVM   (II SrcNone|DstMem|Mov)
   LMSW   #UD on VMX,     clean on SVM   (II SrcMem16|Mov|Priv; also has 
a real
                                          selective-CR0 intercept to honour)
   POPF   #UD on VMX,     clean on SVM   (II ImplicitOps|Stack)
   PUSHF  hang on VMX,    clean on SVM   (store re-faults the injected 
#UD until
                                          the watchdog), clean on SVM
   IRET   fails on BOTH   -> EXCLUDED (vendor-neutral emulator 
limitation, not
                                       this bug)

The VMX-vs-SVM split is the root cause made visible: svm_check_intercept()
initialises ret = X86EMUL_CONTINUE and returns it for anything the 
nested VMCB
does not actively intercept (svm.c:4852), whereas vmx_check_intercept()'s
default returns UNHANDLEABLE.

Suggested fix
-------------
The general fix is the stalled series (synthesize a nested VM-exit for
emulated-but-intercepted instructions; CONTINUE otherwise). As a minimal
stop-gap, add cases to vmx_check_intercept(): SMSW -> X86EMUL_CONTINUE (no
intercept exists); LMSW -> evaluate the nested CR0-load/selective-CR0 
intercept
and either reflect a nested VM-exit or CONTINUE; PUSHF/POPF -> CONTINUE 
(no VMX
control). SVM already models all of these.

Reproducer: an EPT12-override harness points one L2 instruction's memory 
operand
at an unbacked (MMIO) GPA and runs it; a MOV control through the same 
fault path
emulates cleanly, isolating the instruction as the sole variable. Happy 
to share
it or test patches.

Thanks,
Amirmohammad
