Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486484;
	b=HN5+pL629p0Me0Wt4dsShUa0QpXKAJN+BhKxdzWRMHiaWK5yh/SmKCfdelcEargxhj1Q
	 mGFMAA6bfWlw7bLjkkA0TQqAWn94IG4GpgOGe4R+DnEQ5EcjVjj9pm8X9NHSfVww7Ifun
	 /gfOSPLuRBT1kgeZ0AxgcYYcaN4nL3gy6HhZ0Pf676YAGmwYourcJAaanhntDoeMN/b1+
	 1pWvmJKhgzjLk1olyreNPtMuQ95OBTzOWI6NiVRvheWw/NIWRJELX3yibpsJZ/BLyvvHO
	 KlmHOjpHQSRxEHlG3XcWD/xgSdC3JEtdi5EZNtXNIL4/uDxUK6sOsF9tfRohQb+HfoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ANGFYDD6Q8p8RwiaN/nK98Pvd1sOcfyNS+EbCCUesHU=;
	b=QCPU0NPNa/Ga6Z0J+eYxuvm1IcQ5sSnFMWLF9an5WEgrkmyMIXXB5EV6YH8fGTwIyORk
	 Hb+5St7E+1rS9xIafk+rOse2dv58F4htJocchUAWfkaRajZFgkKAMEM2tsSc99jOjwJxn
	 /SIFRqeYjrRcQNApqJLPtgfg8uxF2Vvj0ao5yy/6vAjZn1UQOlc2lqazSxax9Kxq7XqRw
	 /LDaINJujuWnSyGQWOak/4VdOHMzcEBtn90ipDPG3PngyJGNRPNPexH6j0jmz23GjHYfN
	 FFMUYlnns2eGUPySYwrTZhcoIIl3oTF6gZ7Wfvb6Qold4tOKAu9yKjr7MMB3jjx7j/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QttW8XOK;
	arc=none smtp.remote-ip=74.125.228.2
Received: from mail-pz2-f2.google.com (mail-pz2-f2.google.com [74.125.228.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E165C606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E165C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QttW8XOK
Received: by mail-pz2-f2.google.com with SMTP id 41be03b00d2f7-ccc451ef3a7so473647a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792486483; x=1793091283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANGFYDD6Q8p8RwiaN/nK98Pvd1sOcfyNS+EbCCUesHU=;
        b=QttW8XOKDiIhHI/oBYiqq5Z+CDP5yGMTHf5KysLuaCmZKxp++453G05dC104POHm/E
         hsUBiBFlWQLYCOIBmzSDlgLUp3oFvIOPcy14jcZjQrA2CYpviEIdv9FT9jZzdnbqfcOr
         z5/pFE5oB8/u8iLP2ho+WENXIA7gu76vKThA12Ud0XyYHs9nmOu2pnC121sdRndP3dd+
         kTlZHPUkGippGGTQxAvyFLzknORZPO1cy2jDHJ1JgAhhR8ABz1TGWUOd3bfn8czT9HiQ
         U8SZ7BgBwH/YO7OlhoLuskRUfGmInrfRNSLl5lOJ0hUEjnI2M6kOvvphDPagiyv8q1VH
         4KqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486483; x=1793091283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ANGFYDD6Q8p8RwiaN/nK98Pvd1sOcfyNS+EbCCUesHU=;
        b=Z1AQxYxQM4KYMjJPYMeGV+K8PzA0CgzNwocwO5C8BfwagxHgeEbAfIR0ZBIvqvYOk/
         yFouC6i+Ugn5+F1IJELRL2YCgbeYLwgcvkENaI7jvWcZNPpGsR+UxZAI8B8rtjD3oLMH
         CPg1kpx0L56uSOieTOqS/zNsXGC/gUVxn7I9qm7z1kssSa1YrL/UFctsBZqxpEr3IbNk
         GK2Nfd+uSU69HPHz+T9HIO1jNH3vy2n5M8zCpakz1gkBFjOV5vG0QKeQ30s2ITE7Hhc4
         icdcAM+KAWC5jMGgX+4LlUh8l+s30JD7r2jAKqQUPDO9F5svLvxk9CrHKaO7EThMtyCI
         /+Rg==
X-Forwarded-Encrypted: i=1; AKwUvBzCrdinXhFG6m10ZBAiVe//nQQErFR4xCHdyuEiIXH6YydHNOzniSCfPY3IH6m/4JT9BsTJ60f0iAOcNqg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLz+vIwgv+mAUXreBRrQXXG2lvqz01z/pnCuw/2T1GpxXpHwwGl
	BtlOvrmtEKpkEBp3L0q7dGrwRtc61O32AX4EJvX76op38NrYkWeUuXxd
X-Gm-Gg: AYBFou0ihauln75++rqkjOyFqtDGYpTECb81ToMcfeR3I/jh+BAu3x6gtPQLASbFVfP
	ItwqHe5cSkZmMBkaGDDh+SmjHlNZP4NtR9MFBoVdJwMhKSkVVBfFCrJ6xuc3J68Yl5D/7WCLOy+
	4yTHIMCnkXpDRxF5qjl3VtimLoGO1ModDZP1p0PhUHw+ZaKkxo4V0fzwk6t4c7pPyjXgzE9q/gc
	gIZtmfx7Jao0NqysxaAp5dqsSWel3OJfbQR5W6WybImUiygaafkpiRvM4I2uvuI4g22otO0SgPh
	hJGMPFzFsENYXylFmXpTzZKjGMyP1GqnW+gu6DgxEWoi119FS8d715cBBJlpGvvIzDw6NckbnK1
	qETDzQ00kS4RRwClqRdz6X+hoIZyanNYTXI2Tf/3aTzg82iKDoE7CnTnshXwBkvRlYwNEC/jcxW
	8wAml2SW11k8vXF/M1U5Ei3Aa/6xfCqe+R3vEGtAQTk17LMB1xLClpsXIw0Rrrodl4EpNLf7qXL
	yUpoTjs12eANxo/4PLjUvz4zow8Fkezv4fP2Q==
X-Received: by 2002:a05:6a00:918a:b0:899:465d:c8ff with SMTP id d2e1a72fcca58-8a04ba30b6emr7502084b3a.13.1792486483189;
        Tue, 20 Oct 2026 01:54:43 -0700 (PDT)
Received: from HXDQXTDYHN.bytedance.net ([203.208.167.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f580173efsm4540237b3a.50.2026.10.20.01.54.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 01:54:42 -0700 (PDT)
From: Jinmeng Zhou <jinmengzhou22@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Feng Wu <feng.wu@intel.com>,
	x86@kernel.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinmeng Zhou <zhoujinmeng@bytedance.com>
Subject: [PATCH v2 0/2] KVM: x86: Wake blocked vCPUs before offlining a CPU
Date: Tue, 20 Oct 2026 16:53:59 +0800
Message-Id: <20261020085401.80296-1-jinmengzhou22@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260924080648.51014-1-zhoujinmeng@bytedance.com>
References: <20260924080648.51014-1-zhoujinmeng@bytedance.com>
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

From: Jinmeng Zhou <zhoujinmeng@bytedance.com>

A vCPU blocked with posted interrupts enabled stays on the wakeup list of
the physical CPU on which it blocked, and its posted-interrupt descriptor
keeps targeting that CPU's APIC.  If that CPU is offlined, a later device
interrupt sends the wakeup notification to a CPU that is gone, and the vCPU
is never woken.

Patch 1 turns CPUHP_AP_X86_KVM_CLK_ONLINE into a generic x86 KVM CPU
hotplug state that is always registered.  Today it is registered only on
hosts without a constant TSC.

Patch 2 adds an optional vendor cpu_offline() callback that runs from that
state's teardown, after the CPU has been deactivated.  VMX uses it to wake
the vCPUs on the dying CPU's wakeup list, so that they move to an active
CPU and rebuild their posted-interrupt state.

Patch 1 is a prerequisite for patch 2, so both are tagged for stable and
should be backported together.

Changes in v2:
- Reuse and generalize CPUHP_AP_X86_KVM_CLK_ONLINE instead of adding an
  arch hook to the generic CPUHP_AP_KVM_ONLINE path, which depends on
  KVM_GENERIC_HARDWARE_ENABLING=y.
- Register the x86 KVM CPU hotplug state unconditionally, so that the
  callback also runs on hosts with a constant TSC.
- Rename the vendor callback from prepare_cpu_offline() to cpu_offline().
- Use a bare __kvm_vcpu_wake_up() instead of KVM_REQ_UNBLOCK, so that the
  guest does not get spurious wakeups.
- Fix the changelog: the migration is started by CPUHP_AP_ACTIVE
  (sched_cpu_deactivate()), not CPUHP_AP_SCHED_WAIT_EMPTY.
- Initialize the per-CPU posted-interrupt wakeup lists before registering
  the CPU hotplug callbacks that walk them.
- Fix the trailers: add Co-developed-by and put the sender's SoB last, and
  add an in-body From: line for the author address.

v1: https://lore.kernel.org/kvm/20260924080648.51014-1-zhoujinmeng@bytedance.com/

Jinmeng Zhou (2):
  KVM: x86: Make the kvmclock CPU hotplug state generic
  KVM: x86: Wake blocked vCPUs before offlining a CPU

 arch/x86/include/asm/kvm-x86-ops.h |  1 +
 arch/x86/include/asm/kvm_host.h    |  1 +
 arch/x86/kvm/vmx/main.c            |  1 +
 arch/x86/kvm/vmx/posted_intr.c     | 18 ++++++++++++++++++
 arch/x86/kvm/vmx/posted_intr.h     |  1 +
 arch/x86/kvm/vmx/vmx.c             | 16 ++++++++++------
 arch/x86/kvm/x86.c                 | 30 ++++++++++++++++++++++++++----
 include/linux/cpuhotplug.h         |  2 +-
 8 files changed, 59 insertions(+), 11 deletions(-)


base-commit: a500db7819c50db59e55f1b4fa1c3baa5a2616f3
-- 
2.39.5

