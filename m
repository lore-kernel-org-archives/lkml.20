Received: from mail-lr2-f11.google.com (mail-lr2-f11.google.com [74.125.230.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E91480DD2
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203862; cv=none; b=OTsTGVOHoXnS+PGWdt26oNpKyXfNcQYE62V8vFdOMsMBc9EQUY9jDEHidtoFRxmtNhyn36uTBV1MoP2zZ5psx+umFOD1rpvWUpZSA683rJRSyRVNzS5W2N8razsOrobL79SqCQY76qYoc3Y2X7RZ0dlXFArU0PIXdpLaEbIydOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203862; c=relaxed/simple;
	bh=vQKu+UkPI9YjIq5HOgB6KhXt09s7QFB7hmE7d9Yluoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sf6qutBsAJakCJmu+9wLFwXPumnPrMOH68MEGpAKHPAEdMK6cxeSSc7iyeg8x+ETvnc0pvU+xYWdUI+G/FJ53udDl2rfZSdo6Azv/nFANhUrnNwZVq+xyXAr3wBmV0NU1iX4q6jswoglzoPHfUgC9V2IZE5ldRo6LJpkZQKXiKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hduv/qeG; arc=none smtp.client-ip=74.125.230.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hduv/qeG"
Received: by mail-lr2-f11.google.com with SMTP id 38308e7fff4ca-3a7882fb706so19691851fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791203858; x=1791808658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qj//7+DFfG4bjalHxPM61XYRGHUSK9Wt4HF8q9klA4w=;
        b=Hduv/qeGXzcob3fIA6+/ydb1J9L6T/d9zDkFCVwAG/OUDkrLCMUFmw+cuuppDxk6Xp
         VWEOse8IPwS7/K6GQSrjaegkeLnucyfm60O/gfR7ljj9EckU0g1tl1R+nvTVfPSg+3wK
         K6GDMJZaq/nHPezwlFWuEYFG89UlQdYEhL/j+WbiFh9yGXtssSdRJYfs5neJyZIEFzpI
         sNYSaTi2fIxDOUZQCariU9J1nUyfAgAksIfs5y9sUg9eXwImXCgw4pWFTxiCK3Ly9pCg
         sFXm8htUK7e9z3512TWggQMTxzSp91Nb0d4Vxj+y5o8EhBvpSgFIcxoJa19OEZmh71fh
         Ad5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203858; x=1791808658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qj//7+DFfG4bjalHxPM61XYRGHUSK9Wt4HF8q9klA4w=;
        b=oBP3ZEmdb0+RIJIO8k4OdDNML6qbIGHpA1mvLi0d/3cmKzqjXh2lyWOWChhK3EOXPA
         8y5cduHwl2233ntZ8n+PoSfRrjcDxYCljYO5fYk+ZLGSDSXIsq5l+iHpMrq2j8Ckv/FK
         /aS8levKJvHzvYMk/8f2U9DQAplTnQIdrODUTq0qTiuWDXlB77ZP1WaK2eMUuP0B7Chc
         e0bgMTn4zcfmIYTK3ideUGmKItTNznwlYvOy6tOhbck0vTWU0MpisBJTeYT+0qhj8sKv
         1euVDkNDGJHN9EURtphxG7fH6+Sau065wJ10EW993j3wG5q/yeMCnEJ4UVhMGsvfndhf
         jn3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwwoYhUkA898HiKwzvHlIwsqF5Wx2mjxmRhUwkItMDGFvntygmA/+NjuB5yfiPJJWUsELDWOyxt0mdTyuU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdM/m7gLYRUVWAsf6+xdaIImYKk3dcwEjGc5l/jnaCvPb4rtBe
	nSXP9b9GEGeHA+/0ZPAB2sLRpcuJyov6/wsefq45DI8o4w8XsySL5FRu
X-Gm-Gg: AYBFou1X1a02GM93Som5I5zUS4S1d+exQVb4Ar2YGL60WBe7I+oN145xD0Bu6MOV4xv
	7lfcUY2MV0FJPL4woskWyn2soQpogXztm14gzhhDZcqEuNNzb5B3X5gMeGdH1IwFrhu7w/soz7w
	jpJ0Yg4BhPge5PWhzWunOKlteZ0yyhFgXs57S1UdU1NtrV18R+oaugtbTxYi15wnmI0/9oFU5Gi
	+6mam71Fh6aDLKsdt09JtfcNn8oim3n2NEEvQRDblmZGmPP2Od6491R7F4iR9kjixhrbEZCHvMK
	c7ty8wMNCJNecRwWlpYVmNbyl+GurNiOI+sXrLGosJfIc4PQmva29x/SjsBL33Qir0RkdszlbQo
	2FkyrsHNq7mZsUgLR17PPL0Tewevo9m0kNXqqp0tCxc2OK9C7etc1ZfnYV+IgvTMFrjlx7LFLZt
	e0IRvMYm1hXQHL36PW8mD1VStX2lKVInaIyoLwemZp/m12eSLMERB40i1sJQ/LcNBpxYGrB7hfs
	wf8zj6a1z9vr3+e
X-Received: by 2002:a05:6512:688c:20b0:5ba:3c46:bc43 with SMTP id 2adb3069b0e04-5bcb543e623mr1703373e87.24.1791203858298;
        Mon, 05 Oct 2026 05:37:38 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c718f62sm3228393e87.12.2026.10.05.05.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:37:37 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10 2/3] KVM: LAPIC: Write 0 to TMICT should also cancel vmx-preemption timer
Date: Mon,  5 Oct 2026 15:36:59 +0300
Message-ID: <20261005123705.137028-2-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005123705.137028-1-roman.demidov.nn@gmail.com>
References: <20261005123705.137028-1-roman.demidov.nn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wanpeng Li <wanpengli@tencent.com>

commit e898da784aed0ea65f7672d941c01dc9b79e6299 upstream.

According to the SDM 10.5.4.1:

  A write of 0 to the initial-count register effectively stops the local
  APIC timer, in both one-shot and periodic mode.

However, the lapic timer oneshot/periodic mode which is emulated by vmx-preemption
timer doesn't stop by writing 0 to TMICT since vmx->hv_deadline_tsc is still
programmed and the guest will receive the spurious timer interrupt later. This
patch fixes it by also cancelling the vmx-preemption timer when writing 0 to
the initial-count register.

Reviewed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Wanpeng Li <wanpengli@tencent.com>
Message-Id: <1623050385-100988-1-git-send-email-wanpengli@tencent.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Stable-dep-of: 54b3439c8e70 ("KVM: LAPIC: Also cancel preemption timer during SET_LAPIC")
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
 arch/x86/kvm/lapic.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 8f41a5ecea22..c17628c30c8c 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -1491,6 +1491,15 @@ static void limit_periodic_timer_frequency(struct kvm_lapic *apic)
 
 static void cancel_hv_timer(struct kvm_lapic *apic);
 
+static void cancel_apic_timer(struct kvm_lapic *apic)
+{
+	hrtimer_cancel(&apic->lapic_timer.timer);
+	preempt_disable();
+	if (apic->lapic_timer.hv_timer_in_use)
+		cancel_hv_timer(apic);
+	preempt_enable();
+}
+
 static void apic_update_lvtt(struct kvm_lapic *apic)
 {
 	u32 timer_mode = kvm_lapic_get_reg(apic, APIC_LVTT) &
@@ -1499,11 +1508,7 @@ static void apic_update_lvtt(struct kvm_lapic *apic)
 	if (apic->lapic_timer.timer_mode != timer_mode) {
 		if (apic_lvtt_tscdeadline(apic) != (timer_mode ==
 				APIC_LVT_TIMER_TSCDEADLINE)) {
-			hrtimer_cancel(&apic->lapic_timer.timer);
-			preempt_disable();
-			if (apic->lapic_timer.hv_timer_in_use)
-				cancel_hv_timer(apic);
-			preempt_enable();
+			cancel_apic_timer(apic);
 			kvm_lapic_set_reg(apic, APIC_TMICT, 0);
 			apic->lapic_timer.period = 0;
 			apic->lapic_timer.tscdeadline = 0;
@@ -2099,7 +2104,7 @@ int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
 		if (apic_lvtt_tscdeadline(apic))
 			break;
 
-		hrtimer_cancel(&apic->lapic_timer.timer);
+		cancel_apic_timer(apic);
 		kvm_lapic_set_reg(apic, APIC_TMICT, val);
 		start_apic_timer(apic);
 		break;
-- 
2.53.0

