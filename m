Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792703568;
	b=fHy9+ND7qEk6OeLMKEHXpEB9yeUVxsAM3HASWYbe9/PkZYWP2MoO/3YpLQMVs0SzU53a
	 3Vc9PnYXCqYBQL9kvbvRdZpHceX3s52JxA7svM7vkEdlmSHm2sm+Ry6GUI6CmLz4Jfhb+
	 kdf28AYSwiFM5TZ1qom+at1n8OQiS2kLLb4iboh9pgF2rPbcPRJ1vFIxPNncEsIHGPi04
	 tHC6mOXT5RfoVtFqRFhEheKIiqCvDeIUkUXCyRgqQQyF/K1riRLAs7DsiJoY0IneE2LC3
	 VTWL7NSWR2DMhhw8ucfMJKLvyLHUthqY5MnPkth7dKWjqCZQu7xwm8zTRLgJIhpE0fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792703568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:Subject:
	 Content-Language:From:Content-Type:Content-Transfer-Encoding;
	bh=jFuOE8pfAZPQqgdzbPbnWjwK7LES4BgvCexGNd0DNIw=;
	b=CDi4zyG3EaY4znKXmbHGoQsWAw3C3YYmlsvH8Ju0DfREjs/OW48eXEVSIEJvNsj22qvo
	 NTPiXbt/8a0aIYvNQLYlzsJLHn0pR2zqqcEjBOzXqXi/GInC4wrlIrCmUXaCA8aD9ohcN
	 qb0xrhlkxTLvYNYB509lMeeACazbLQJiBPvtOrYX8exm2Ud59jyLlTdlQhN+11nR9Gn0O
	 wkiivryqPuobATttfiSrvxfzB5YopDgtduaoP/KqMIGtWrSuVcJZzxqiNckRAfX18ild+
	 SDdvyk6yrGFNDCWHNBQR+VTq/s7nMcOBioGvdmUCNBY0cN6/XghrybC6LQX3a3lY/sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NM18DjwE;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3CC606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF3CC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NM18DjwE
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so1756255e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792703566; x=1793308366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jFuOE8pfAZPQqgdzbPbnWjwK7LES4BgvCexGNd0DNIw=;
        b=NM18DjwE/DhlA2Pcg3zYl/2cyR6AxA+YbGKxkNP6zUrDPIcWKPq1OcKoTvn8rbE2h7
         MhZtrRpx4Hg41VLUP/69irJGUxbpPvFJxR1ji8JdaNXrIg/jh8cYw5qFun2R9lt9iDfV
         h22UdIA0hOGV3u9p8SHz6DT91dtC9BGF7PZxh9rgRhRVS8WswaMewe5dYlZlcDd1Nl5F
         wr/uJh2XOJrB8XBuu615kbsKg+CcjPE+Q5ctx5SvoTosUapOEMsECr3bLmy6JZZ5nwwd
         gR34KBVLq2S3Hh+44quuGJlR40NEH+59+vIeL1xL2G92dgzs0YOtSY5a9l5IvmW27YmO
         4nfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792703566; x=1793308366;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFuOE8pfAZPQqgdzbPbnWjwK7LES4BgvCexGNd0DNIw=;
        b=eW/vODuxh3iV2Ofnq7Cm28uObJJiA7q6nnPclCGQFW9aqIvzDyihi9djIX2qEE53RE
         NBUo5BTCPc4CqZ/Qb2lr8mY03UBOMN2U/0ml+SvKfNMVjt411T9cVE6w3Nx4Pbw4izof
         lVJxsUbew1oPUklUp8pvFKG4KcEGiyXNkD/B2HG+Jj21qWlHyZkZWShpz0kvgcvPzxFh
         d9mS+jBGcr8DYlbcxtfw6g4AfC1+cUSdwzLZ15bGHDQQMlN8xypHJeAjVRoAfC/nuOoC
         83GD9yPQnBFDfsW/WsYqvKQwm8bBLFPLwos+5tNbxhQplqXEi5rjwfGWpYIsWDfR8Z4h
         F0KA==
X-Forwarded-Encrypted: i=1; AKwUvByFyFirsAdCPbr8pbUVFsLTv7lIqJm6PPn3hmQaGq7z1kYIwHMPeQ9WRkQURf4FQXpt8tatKshENipwPc0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6etCJga+sy4G6b6lj6sKq3nc1pPepAz62tJzxvbiqkZ2K9+Ce
	qaFwY8EWsvb5Kqq5cAKBRabbGc5mAArdxyHjCdL11SROQeUSSOQYz69p
X-Gm-Gg: AYBFou3hfIckU3C2guA5S+++WghFRYX2Z6NfpTHgTvdasN1pwXyJS9ZBP72Xo0zsCYe
	PaRDJ6FA65DiHIxtJUbc8wOFAirSsivlAUiTCuv2ATwdMX9X9OI0ABoBssxnCqQXHtfo8J3C+cD
	Y0kvb7GNCi6jUS+ZxbNYqOh9pavBwwKwlYt+W+Fx9+GQongswS/yaP12j+1bjy5C2z1DJK/RhcG
	RT4NFeWyVMyBnE1gbWmiR1QCrtESl1mePVEewrOc3uGtWKIuxZxzEWr+zq+STNJTkSM6/m6YbSV
	nP1gHmn6UCokbEjnDh7NJQDqgw7+cJOXeDnCOSvXVoJugTacriyvWyVCO4aQ/DZfykySHd4u3eU
	GimUxd4WGmS5Ulvnaw++aQDdIj0xVsF2skQbRDO8g3TKTCjNfqEPbgERR8xjiAcS45yX85O1vMu
	58A3T61l/xYq8tPM5hZxrGHP/Hyy+YX/Qdn5ck+/mQbRDgkqd7AmNTOxG0SfqWotTGRVq7Wu38I
	S4lUi10En14KJ8SlJ7wJsSCRUaDBraO0C35LG65NUDy2qqphsdrxrZa+1V1rsPPtFx3yXUBqRbZ
	YVM1pdAxB65nM/ETXjOdYQIgyZWIlrXdvmCRHr6J8l+ewrbIpMtniaupgN9KCBm3b0KOkvXmzwj
	HAcb9KAxwpskWliM=
X-Received: by 2002:a05:600c:c490:b0:4a2:d:5ccc with SMTP id 5b1f17b1804b1-4a211eef757mr3819855e9.10.1792703566193;
        Thu, 22 Oct 2026 14:12:46 -0700 (PDT)
Received: from [172.16.56.234] ([87.190.40.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211b899ccsm9084735e9.3.2026.10.22.14.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 14:12:45 -0700 (PDT)
Message-ID: <cfe12756-208a-4a3c-bd46-cfdfeae6cdb1@gmail.com>
Date: Thu, 22 Oct 2026 23:12:44 +0200
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
Subject: [PATCH] KVM: nVMX: Reject nested VM-entry in wait-for-SIPI with a
 pending event injection
Content-Language: en-US
From: Amirmohammad Eftekhar <amirmohammadeftekhar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

nested_check_guest_non_reg_state() only verifies that
guest_activity_state is one of ACTIVE, HLT or WAIT_SIPI; it performs
none of the activity-state cross-checks that VM entry requires.  Per
Intel's SDM, "Checks on Guest Non-Register State", when the valid bit of
the VM-entry interruption-information field is set the interruption to
be delivered "must not be one that would normally be blocked while a
logical processor is in the activity state", and for the wait-for-SIPI
state "No interruptions are allowed".  The same section also requires
that the activity state indicate the active state when the
interruptibility-state field blocks by STI or MOV SS.

KVM accepts a vmcs12 that violates both rules, and hardware does not
catch the miss: prepare_vmcs02() never writes GUEST_ACTIVITY_STATE, so
vmcs02 always carries active, and wait-for-SIPI is emulated in software
only after a successful entry (the mp_state = INIT_RECEIVED arm).  The
injection, in contrast, is copied into vmcs02.  The physical VMLAUNCH
therefore sees {active, valid injection} -- a legal pair -- and
succeeds.  Because the offending field is stripped before hardware sees
vmcs02, the missed-exit WARN in __nested_vmx_vmexit() can never fire for
this class either.

 From L1's point of view a VMLAUNCH that bare metal rejects with a
VM-entry failure (invalid guest state) instead succeeds, with L2 left
parked in wait-for-SIPI holding a stale VM_ENTRY_INTR_INFO in vmcs02.

Add the two activity-state cross-checks that KVM strips before hardware
can enforce them.  The HLT state additionally restricts which
interruption types may be injected (external interrupt / NMI / #DB / #MC
/ pending-MTF only); that matrix is left for a follow-up as it needs the
per-type table, whereas the two checks added here are unconditional and
cover the fields KVM elides.

Signed-off-by: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
---
  arch/x86/kvm/vmx/nested.c | 18 ++++++++++++++++++
  1 file changed, 18 insertions(+)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 9b0bfa2f8..66c9d1ffe 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -3311,6 +3311,24 @@ static int 
nested_check_guest_non_reg_state(struct vmcs12 *vmcs12)
  	       vmcs12->guest_activity_state != GUEST_ACTIVITY_WAIT_SIPI))
  		return -EINVAL;
  +	/*
+	 * The activity state must be active if the interruptibility state
+	 * blocks by STI or MOV SS.
+	 */
+	if (CC(vmcs12->guest_activity_state != GUEST_ACTIVITY_ACTIVE &&
+	       (vmcs12->guest_interruptibility_info &
+		(GUEST_INTR_STATE_STI | GUEST_INTR_STATE_MOV_SS))))
+		return -EINVAL;
+
+	/*
+	 * An injected event must not be one that would be blocked in the
+	 * guest's activity state; no interruptions are allowed in the
+	 * wait-for-SIPI state.
+	 */
+	if (vmcs12->guest_activity_state == GUEST_ACTIVITY_WAIT_SIPI &&
+	    CC(vmcs12->vm_entry_intr_info_field & INTR_INFO_VALID_MASK))
+		return -EINVAL;
+
  	return 0;
  }
  -- 2.54.0 (Apple Git-157)
