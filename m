Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793905659;
	b=ebTUODRvWRIayTqtpvUbJDkvmzYatsPgYFRjLv+Gxnc1+86fkyKJ3wvD9UV07U0hnG+0
	 DyWJNyjRzJQE/QeF+RZiDsiSfiZ/0U91GTiOl/mtMgXuafxdbxMzxjMWWEgkzRlW8DWvK
	 369DHZalscP7yU5s981Ct8q2ija7uKAWUqYgilWijpfenam7ZQr2NIJpOOqDJqk3SxslV
	 0OP3tzF5OIP7j67a1y72gK7bcMZvQ4xZaxp+78A7FsmqRJoa+d+8/p3XO7LZKMwlqsV67
	 eW/ZAs59oFuI4wI7U5BtHdVE1PPSVP/WodR2QSZOGsB2KTcdkYOcFGSNdM08gxnwTyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=ZAjaa18wdRgEqxid2YInH5sQS/VPsmf9qKFCXI+pZhg=;
	b=Q1yOg46Rgqgzj+z+mntiL0PQIVjoTyuOf5rezF3QYN5ZD1kxA79XUA1bZxYDKtShxq7Y
	 b8Gj1HA5Waqqy7g0jCEvaPo2x5AZHp4FvmDZkQJZpfu+a019KqpXyd4I+aL4I6LBcVqGW
	 60rqCbOiT3JwjiDKKf/0SvhWsLaaPrYlI4sp3Ec4hpl8uvhAuHZhVUAL/ygobnAJYDUsH
	 Up20SvIuyvDS+PFVLOqyNiYoxHcjyLsEOjGBGzMjxs76r7Jk2xpCPzBLjhhde8J/3C02a
	 CRZIA7B4cDanvxvptXfODYIIAZ+J3xD9lYlod72Cl4omyuSnRCELWQhbRsbgHYP3YCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=STCQWHSR;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95717606A338
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95717606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=STCQWHSR
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed08be1c84so32678675ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793905658; x=1794510458; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZAjaa18wdRgEqxid2YInH5sQS/VPsmf9qKFCXI+pZhg=;
        b=STCQWHSRTeOQ2A1SrWC9puX1CNsDmwC7hZCDU+SD27RZU7kdDJH7eu7lzmXjN0ZetQ
         E6oukNaqUymbYvtOiywcG0X5S6YEkji8jIaTuoJUwTmHECEVwV0o/0scPMsrYMfSqqxc
         2N0pZ1kax3FHmcy/B/GujC67kOe6Bkeg/GjTho4azqiPuqwngQ5ULVY/sjoT6SRvblwE
         vYNxWsk7AtFH/z8OiK4xE+hBjr6PvpageNfoAPkLLgzkzneiZ71F0/GN5oDpR1XBFJ/m
         5PmxmRj7Z+ZGVirz8l9oOBQBFhtOgdBTjLaJCKF5Qul/PcNdmim390Bp7GP2zratNA5P
         6s3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793905658; x=1794510458;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZAjaa18wdRgEqxid2YInH5sQS/VPsmf9qKFCXI+pZhg=;
        b=ECNigZQCCZxGIVV7apvx9r+ccEDjSFGcnVo0KgyFSwIYOPsMbzwOht+HrNMeZFYzLO
         jflfB7n3aDqixx/98jboGhLhpaUvWM6zUsI8rFzIZcht+gbRPfQJ7xVH6+JQaDst6ZcO
         lkLVN8EKrL2/DJDt3JVyZ4Ir1VfEwiPRU0WZt9UGvn1ik2eQev7eN7Mu9uGfCfRYaxqP
         5NWHp4vqnxo5rOsU5yKNBRYnsF1UpME+AIRFp8dK5dPcFgWvrbC50qlcQ5pX3BI8PLYO
         A6WJeR1nE1vmzhOYKOFUBZC0w47PjHAQiKCJ7Hj2bQjSUDBA3v1x+VoK1Oi68mU+PTrl
         eaDg==
X-Forwarded-Encrypted: i=1; AKwUvBwL3qpPX71ML/73ex3PEOfT6lEM43RatX02hcbrFvwYprf0h2+RL4dmc2RYORUW0sbh0HOOR/pV7nuhVhw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hd0KTC4v+2t7rTpdpmLWO1lC7sjdlP1Pg3wbiXPnA3abF+wCI
	XSie3qOoq81a+w1+EHhVZbB35AgYUUT1f5t1IVv/UtrRTCp7lom/8pwwbNWzmr9jl0SzJjWmyOb
	ngNlnlg==
X-Received: from plch18.prod.google.com ([2002:a17:902:f2d2:b0:2ec:f3ae:b625])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c410:b0:2ed:3be3:c63d
 with SMTP id d9443c01a7336-2ed40c14d28mr5879335ad.23.1793905657669; Thu, 05
 Nov 2026 11:07:37 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  5 Nov 2026 11:07:33 -0800
In-Reply-To: <20261105190733.3741959-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105190733.3741959-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261105190733.3741959-3-seanjc@google.com>
Subject: [PATCH v2 2/2] KVM: nVMX: Do eVMCS consistency check on VMFUNC
 controls iff they're enable
From: Sean Christopherson <seanjc@google.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Manuel Andreas <manuel.andreas@tum.de>
Content-Type: text/plain; charset="UTF-8"

Check that the VM-function controls are actually enabled before performing
eVMCS-specific consistency checks, as the VMFUNC controls are supposed to
be completely ignored if they're not enabled.  Per the SDM:

  If the "enable VM functions" processor-based VM-execution control is 0,
  no checks are performed on the VM-function controls.

Fixes: 3ff8a13d41b2 ("KVM: nVMX: WARN once and fail VM-Enter if eVMCS sees VMFUNC[63:32] != 0")
Fixes: a83502314ce3 ("x86/kvm/hyper-v: don't allow to turn on unsupported VMX controls for nested guests")
Cc: stable@vger.kernel.org
Reported-by: Manuel Andreas <manuel.andreas@tum.de>
Closes: https://lore.kernel.org/all/f1f39118-2e1b-476b-9a84-ef7d56412bdc@tum.de
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/hyperv.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/hyperv.c b/arch/x86/kvm/vmx/hyperv.c
index 2b40ac32ff06..a1daf8f2ec5a 100644
--- a/arch/x86/kvm/vmx/hyperv.c
+++ b/arch/x86/kvm/vmx/hyperv.c
@@ -187,11 +187,10 @@ int nested_evmcs_check_controls(struct vmcs12 *vmcs12)
 	 * controls in bits 63:32, i.e. dropping those bits on the consistency
 	 * check is intentional.
 	 */
-	if (WARN_ON_ONCE(vmcs12->vm_function_control >> 32))
-		return -EINVAL;
-
-	if (CC(!nested_evmcs_is_valid_controls(EVMCS_VMFUNC,
-					       vmcs12->vm_function_control)))
+	if (nested_cpu_has_vmfunc(vmcs12) &&
+	    (WARN_ON_ONCE(vmcs12->vm_function_control >> 32) ||
+	     CC(!nested_evmcs_is_valid_controls(EVMCS_VMFUNC,
+						vmcs12->vm_function_control))))
 		return -EINVAL;
 
 	return 0;
-- 
2.56.0.567.gdb80ae8cd5-goog

