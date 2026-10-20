Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486490;
	b=ZOE1PcDy7M5sCVSknHLmRn0fUx60Lgc+4k9ZSGuSgG8FV/a4r1dIZ4fYPfMmsYePkT18
	 PZ8l9CvazH7csOo90U9DBvcxrCLpTZUuuR1VFSdVOaznj+qElPcWz7ChxFDOXtLHQhSmS
	 5rhk1JoHINxoxzNLekDHoBNbfCFpcc4t6/LHB5FddgXpqIlCmkhqg6bDDPHj4OZXFGgnw
	 A9lNRH/72kZ/WOb4obA8aine79ulVweQta1ny7r9VVlgqhFFOoK+lmf8C/CZxbNdn4NIo
	 qMXdFEg4wd/cYlv69zSbqJ2aZGVFBZvxENGG5vt7ipD1iJjkhkrt1axX1kNlNTBCbyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bcZcmvJ3NbIWoxlSM4Tt4ETiKqKGT1/tEngMkwZ/3VI=;
	b=YKQuxxlabgdXmiBkA6N1Q1lFA9LRbnXk70GPqDrkk021LpJzx6wPx2oueRDNUaqSkkMo
	 ToA+JmJJEXY+YXy57QWaoQp8sFNq4CtHok3U07usm6NUCyLQm8sh88ACevBFVFTp5+007
	 it/zVnzC8U2BBJp9hgi7mh0mQ9xNR9dPDyABAHdOvWMQjP6szIjFSSq44KDeHR8oBYHyf
	 bJWOXlqImj4OlRY3Yqi33jKkm5WPiliD402KO4qdz704aeBqeV+eNAzlQU5Fgx7Xkki+G
	 fSY6pCQrRxmIhM1T8f0NSQBorugNHGiB+dgycBwhUqW6Lp5AoRbuJQXG4+k5aqVW/Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S7Epn4g3;
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BCB606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67BCB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S7Epn4g3
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cd68485005eso601911a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792486490; x=1793091290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcZcmvJ3NbIWoxlSM4Tt4ETiKqKGT1/tEngMkwZ/3VI=;
        b=S7Epn4g3Y7S6ruUQfhlqpLpw3vllp9oRj1fl+HH89GSLWi8fTsWWjXg9PSIVBhI2AB
         iYHwlPI2LkELNA2uhA/j3SrW5jehJmqofRfGDidzLsrWZ5c49khM+z9Rj6qqNMtjIz1t
         lMwZdW/EoFWy7bVPaiKdw9uJytD9JzivucPxF4AUsNKfkj0EhcU/bYe19You4VgVsIbf
         ow24mk3vErGhz9aasSIETqgXzzvegfuNW5sRAfzR31gG8dn0CZ0OmbHG1pr4X5PPOGAK
         04BYKz6pvD2S2iDdmEvsqrTYPQk0tWWR8V5UhE62y2X7SoEFYclckc30u1iVHkCF+gu9
         Hzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486490; x=1793091290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bcZcmvJ3NbIWoxlSM4Tt4ETiKqKGT1/tEngMkwZ/3VI=;
        b=CKIb+DfzkzT7WbWvuyQ7ZHQg3zGyzWHB6Hg6CKXRWv38zY+6MzmgAVzZvuXcqZXBfJ
         F7d52Q1WH33Q4t33w9n8AxH5FavbU2RyC99o8tBbP7SymJGPkE7XXN1dXFE21YU4bbh7
         UNUPurigpPzmyZQGeDPVDrxE3EENgxxy/uk6HmsEOtvuyfqwneTyHxhwAg1ui2AVs/Oa
         Yjq+B4nYxJ8Wos/ulpCITaI1dGZD3jPyLdFeE7HBT2emm+GkP2kmTyRSfahH/U7GyCXy
         CgVeyXVO+Cp3Uxzc69IF9vfEfuSPx6abW8qBuB+RBkQop7w5HL1Ku9WwyrZaRAP/9RFy
         if4g==
X-Forwarded-Encrypted: i=1; AKwUvBwyGNcko9kKDjJ+7e9gySINFvRCnUxkJmRH60T64zaD5tsKPGZ5GzlK12tTagwE0s7Q9iT72Uz/ZQ7wWO0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHNt4laBJKscaiBKU1P+w9nP7cDNo8aL3O+aNwCoLot2xrjIkd
	iDWje2dZN/VmDw+aLAJLwgPs+BpUa7ZDn4yIOBYtR2GzkmPPG081MolB
X-Gm-Gg: AYBFou31DfetOmd6XcswJp92IVArTG5nPtykOTUE98n7KwNBoRPL4f6bddHOIJ8ioeq
	hSTbl3ShMg4ajkV8BUzYtD86pv9MTEnUKy0Sz3T6wPHB2Hs3Y+dXBV1GAymFUguK+eL4Fns0XR2
	sIJR1l+JQpnQixK78w/5cAQaFOtrOOPaWfd0x/kr5YIZOPJwpR7KS1Gm1dYkcng7Km7mris7OhC
	Qm600oJhfgpxpZa4fJHT0Mql0mwPhR9gJtJraL5dUdsCsyrFjoJIHZWiZXHihck75jf7Te9fcj2
	T+2ywOQz2yv2lCyE4h9iSuSZB5HWnEY0YIo9JH+F6zwTzS/lfYm5oNYGL73U/5SqyNYvHcyNos2
	g8e6iTnZrcmSI+rzMkch1eHG9n8O21X8ZXGC6YEPjhEy0P/ukqGJrAjTs1dxFa1ESPs44OI7a90
	UrmZAg3WwBPo0UG7cYNezoJC2V6ICcezrZGebE9FcxKO/EGCClZkg/N1zlf/0xZw5rOOIeqWI91
	T31gMgXQq/9uFkOiQIgA18k2IRgkC8TcNNjZA==
X-Received: by 2002:a05:6a00:1394:b0:87d:3894:197b with SMTP id d2e1a72fcca58-8a04cb1ed84mr8394665b3a.59.1792486489688;
        Tue, 20 Oct 2026 01:54:49 -0700 (PDT)
Received: from HXDQXTDYHN.bytedance.net ([203.208.167.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f580173efsm4540237b3a.50.2026.10.20.01.54.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 01:54:49 -0700 (PDT)
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
	Jinmeng Zhou <zhoujinmeng@bytedance.com>,
	stable@vger.kernel.org,
	Guixiong Wei <weiguixiong@bytedance.com>
Subject: [PATCH v2 1/2] KVM: x86: Make the kvmclock CPU hotplug state generic
Date: Tue, 20 Oct 2026 16:54:00 +0800
Message-Id: <20261020085401.80296-2-jinmengzhou22@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261020085401.80296-1-jinmengzhou22@gmail.com>
References: <20260924080648.51014-1-zhoujinmeng@bytedance.com>
 <20261020085401.80296-1-jinmengzhou22@gmail.com>
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

Rename CPUHP_AP_X86_KVM_CLK_ONLINE to CPUHP_AP_X86_KVM_ONLINE so that the
state can be used for any x86 KVM work that needs to run when a CPU comes
online or goes offline, not just for kvmclock.

The state is currently registered by kvm_timer_init() only if the host
lacks X86_FEATURE_CONSTANT_TSC, so it is never installed on modern CPUs.
Register it unconditionally from kvm_x86_vendor_init(), and remove it from
kvm_x86_vendor_exit().  Add kvm_x86_cpu_online() and kvm_x86_cpu_offline()
wrappers that call the existing kvmclock helpers only on hosts without a
constant TSC.

Keep the registration after kvm_timer_init() so that the cpufreq notifier
is registered before kvmclock_cpu_online() samples the frequency of each
online CPU.

No functional change for kvmclock.  On hosts with a constant TSC, the
state is now registered but its callbacks do nothing.

Cc: stable@vger.kernel.org
Co-developed-by: Guixiong Wei <weiguixiong@bytedance.com>
Signed-off-by: Guixiong Wei <weiguixiong@bytedance.com>
Signed-off-by: Jinmeng Zhou <zhoujinmeng@bytedance.com>
---
 arch/x86/kvm/x86.c         | 29 +++++++++++++++++++++++++----
 include/linux/cpuhotplug.h |  2 +-
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 79468ddfe4736..a08ae25f373fb 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6812,6 +6812,22 @@ static int kvmclock_cpu_online(unsigned int cpu)
 	return 0;
 }
 
+static int kvm_x86_cpu_online(unsigned int cpu)
+{
+	if (!boot_cpu_has(X86_FEATURE_CONSTANT_TSC))
+		return kvmclock_cpu_online(cpu);
+
+	return 0;
+}
+
+static int kvm_x86_cpu_offline(unsigned int cpu)
+{
+	if (!boot_cpu_has(X86_FEATURE_CONSTANT_TSC))
+		return kvmclock_cpu_down_prep(cpu);
+
+	return 0;
+}
+
 static void kvm_timer_init(void)
 {
 	if (!boot_cpu_has(X86_FEATURE_CONSTANT_TSC)) {
@@ -6832,9 +6848,6 @@ static void kvm_timer_init(void)
 		}
 		cpufreq_register_notifier(&kvmclock_cpufreq_notifier_block,
 					  CPUFREQ_TRANSITION_NOTIFIER);
-
-		cpuhp_setup_state(CPUHP_AP_X86_KVM_CLK_ONLINE, "x86/kvm/clk:online",
-				  kvmclock_cpu_online, kvmclock_cpu_down_prep);
 	}
 }
 
@@ -7109,6 +7122,13 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 	 */
 	kvm_timer_init();
 
+	/*
+	 * Register the CPU hotplug state after the cpufreq notifier so that
+	 * kvmclock_cpu_online() can't miss a frequency transition.
+	 */
+	cpuhp_setup_state(CPUHP_AP_X86_KVM_ONLINE, "x86/kvm:online",
+			  kvm_x86_cpu_online, kvm_x86_cpu_offline);
+
 	if (pi_inject_timer == -1)
 		pi_inject_timer = housekeeping_enabled(HK_TYPE_TIMER);
 #ifdef CONFIG_X86_64
@@ -7165,10 +7185,11 @@ void kvm_x86_vendor_exit(void)
 #endif
 	kvm_lapic_exit();
 
+	cpuhp_remove_state_nocalls(CPUHP_AP_X86_KVM_ONLINE);
+
 	if (!boot_cpu_has(X86_FEATURE_CONSTANT_TSC)) {
 		cpufreq_unregister_notifier(&kvmclock_cpufreq_notifier_block,
 					    CPUFREQ_TRANSITION_NOTIFIER);
-		cpuhp_remove_state_nocalls(CPUHP_AP_X86_KVM_CLK_ONLINE);
 	}
 #ifdef CONFIG_X86_64
 	pvclock_gtod_unregister_notifier(&pvclock_gtod_notifier);
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index feb32949aeea6..91da42fd11161 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -241,7 +241,7 @@ enum cpuhp_state {
 	CPUHP_AP_ONLINE_DYN,
 	CPUHP_AP_ONLINE_DYN_END		= CPUHP_AP_ONLINE_DYN + 40,
 	CPUHP_AP_X86_HPET_ONLINE,
-	CPUHP_AP_X86_KVM_CLK_ONLINE,
+	CPUHP_AP_X86_KVM_ONLINE,
 	CPUHP_AP_ACTIVE,
 	CPUHP_ONLINE,
 };
-- 
2.39.5

