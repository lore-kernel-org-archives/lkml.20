Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760662;
	b=gI752qr9i2VDN6gs7I8VWlAPY7Mep6QuRbjbht+EIsAli2ud9zM0tD1A4rohM+lMFCnr
	 XggFTpGIA9i7a8M/7C3/n7qcHx2Rr2pOxqTL6vo53Kn1/JN5Y15pvv5eUYbRFkTGcq+8w
	 HRD8yrJjTwILEgog/Oin5QtGaRZP10VX4jh/q/6nvmPs5JHNmfAajvWXsJZXgO+zyU6/B
	 6H1Vi+5bJKpaNsfWT58RXxTmlGZnOUiPvFECa5W96GG1baSSEXRcMy3FEpe3Mxh4zyhJB
	 t1bTNHXuDCLPJ/nmjPmEHxwUpTgYf7OshB6y5Ez7wX66fpi9/x1KHTR4mwqvHIbQPEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=K+gvpLnHAWCS2qej9/dKDbqHpvb2Unj69ztz/dYZD4I=;
	b=GKORE2tAtR5BnLzwR0dW3BzQ6RzLlAVhTs7XYxPH7aRrsLIrpQ7myha2CNU1pJENZqlg
	 a0XLpKQl5geRHIDI4ztr4dmx+tP/oDlviomWZriVFdb2EIHHo0EdzTaYCz03mw49/hOC2
	 auNDgQ8t41apB9B1g8UzgxIWxJI+0sCgJGm11tYlzl5sjYz6jIZ70v4PcTczGyuQ2UfAH
	 dIcN6FytZmxbiHBCijcaw6xexgZCw1qU6qwc7v2zmEDX1Nrtx+c6UuDkyP2rLamu7BhJd
	 x2v383BA5bTzFdziEZ1qndmugZdH+v80KTtDp4o86+eWyZch0zGB0AFz3Oq4dpdp1Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TAVMfL/F";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60C7606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D60C7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TAVMfL/F
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so2781528c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760661; x=1795365461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+gvpLnHAWCS2qej9/dKDbqHpvb2Unj69ztz/dYZD4I=;
        b=TAVMfL/FjyLswmQ1OblEHRo8HslRF3gicwrmde1Gm215hLqGigb1ZoLJ8PZV/CS4Gb
         ilniSrB7HYZYBWzDpptKEH8rbtveWPXCIzkrlVwtCwDTl+kdC8t50LXkxKBy+akDCell
         tjmcSNXsP7AGvI7U1ZN+NhVuycyA2TfbKsOJR/mjZdkVGHJ2UiQtKk/2F+4A0dPZXN+b
         VIDphpsSG92z7rSMlzU6wn0Cwy9JQlbouj2kon93XxBEWDWjTXuEbSaLnsA0XtXKl7Wn
         PvrwlbJUfWbnaWo5nUd5b4yLb4Fl8UsHBX9FIhPz15QW8R4osAe8KJJCn8+7Rhg4J2oQ
         /DLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760661; x=1795365461;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+gvpLnHAWCS2qej9/dKDbqHpvb2Unj69ztz/dYZD4I=;
        b=asLjXp1RYxq0P+9YKeFxMFk0uEHY9jjLgX/HwN5JlbidJRSIGArkGe0u0n1KTUR6lE
         Xc4H5SrFp97qj7echKgh2E6M7BCchBsxRYEfmgj7JUqfC8QQrA4loLIDNNDgDwDIMoh0
         rkTpaXOr4kXWUqfGjd3vrtI+iWLYm7dHwoq0oggNTxHwOlWRe0mz/g7XkTDyjb/XxKcq
         WUPs1aH2pdx6WARV/ExwKfJmgTavgCwHq5lXuBbChZnekhr6a+PiAmwJhIyIVlr1ROK0
         v97gtw9HP8UlJ8UGayM5Pnh5NgsVEAxjbxc0xHTGD+vHpgnWFV9XynnJ6ifC0/BkUilv
         Hjvw==
X-Forwarded-Encrypted: i=1; AL+hErHBcdYz9Q+4mtcrrT+Pjw9+3KgiV9LMpqoJrLws5L5A1tuthMrm5Fuwh3paagMhc3/HspSyWWF1yZYHN20=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k814L1tHMEm0X163Jz0FP+JkJqmkfCPvMcuLsiBs0RlmL9cQ0
	8pArhwRu1NVX0S89biVC5l8AhLYy4wiXOZnOFSJxJMHHb4p3oCwAHsOe
X-Gm-Gg: AYBFou06D2khiMGgrckM1RofrHrCpEvZwbpn8oWxLxWWNdv62mBI8n00wtlJb09pAJ9
	A2Edd/WiEjXWspUxyl68DdM4b749DSFG6IYJvbc0zi13F4paMjmSpe5EjUmLDF1YYNdcq480Sq3
	H/ZHSvbihj9aCiA9/XDvORURosE3RMK/ybdCEuSPzjbO2GeW+kBpI8csoOpIPYNLoATaQsbpZAD
	hIRfVgRAiU1Gn1abTQ/FvrfDKHMRTP5sNvanE8Jicdj6MoyXdqmWau1j75zj6LCTtFsXSmaVHpe
	+T7NQq5ZCnng11yonpWfSsJ4CyJiT9Y+hA7WZfDWQDJ+XHiTk81DYcUje63v2+eiP+MgjgBJsqj
	6EM7AzIuYB3HMMxi+hWDN4sLGrXWMDxdyaPSp6hTaK7tHE4/Cv96u7ZrKUCHBOLkhaZVIcIfxgC
	4Rm8SlwS68aBIosNuYq8rB6VvIKlOcY4DQxW4GtDB8Vd2PzeRcsc7a0yijX5HPQywDGPI5c2stW
	W6v9+OlarYnjaFZNuE0QnfPn51hiVpH1yB3jO6KNQc85U4+QDH0ltKJYqwr39u3L9zZEQ1pEEJy
	p+v0U/KhDVpdgbfLXlNmo8nwGRs3jsZqT4jgRVUZehSNMraRZ4E6RqVmRRwWfWtrhQvu
X-Received: by 2002:a05:7022:3a87:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b503068f8cmr8823437c88.1.1794760661026;
        Sun, 15 Nov 2026 08:37:41 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm28775558eec.23.2026.11.15.08.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:37:40 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] KVM: x86: INIT leaves a stale RTC pending EOI
Date: Sun, 15 Nov 2026 08:37:33 -0800
Message-Id: <20261115163733.227072-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sean, Paolo,

I hit a corner case in the in-kernel IOAPIC RTC EOI tracking. It needs
a vCPU to get INIT before it EOIs an RTC interrupt, APICv to be
inactive, and a VMM that injects GSI 8 with KVM_IRQ_LINE_STATUS, so it
may be rare in practice.

When a vCPU accepts the RTC interrupt, ioapic->rtc_status records it
in map and pending_eoi. If that vCPU then processes INIT,
kvm_lapic_reset() clears IRR and ISR but does not touch rtc_status.
The guest can no longer EOI that vector, so pending_eoi stays above 0
and rtc_irq_check_coalesced() treats every later GSI 8 injection as
coalesced. Only KVM_SET_LAPIC or KVM_SET_IRQCHIP clear it, through
kvm_rtc_eoi_tracking_restore_*(). The lazy repair in
ioapic_lazy_update_eoi() only runs with APICv active, so nothing
repairs the stale entry when APICv is inactive.

On v7.3 with kvm-amd.avic=N, running nested (the KVM under test is
inside a QEMU guest), with IOAPIC pin 8 edge-triggered, vector 0x50,
physical dest 0, and GSI 8 routed only to the IOAPIC, 6 out of 6 runs
gave:

  KVM_IRQ_LINE_STATUS(GSI 8)              -> status 1
      LAPIC: SVR=0x1ff, IRR[0x50]=1, ISR[0x50]=0
  INIT through KVM_SIGNAL_MSI, processed by KVM_RUN
      LAPIC: SVR=0xff, IRR[0x50]=0, ISR[0x50]=0
  guest re-enables the LAPIC: a stub in 32-bit protected mode
  (set with KVM_SET_SREGS/KVM_SET_REGS) writes SVR=0x1ff through the
  APIC MMIO page and exits with "out"
      LAPIC: SVR=0x1ff, IRR[0x50]=0, ISR[0x50]=0
  deassert, KVM_IRQ_LINE_STATUS(GSI 8)    -> status 0 (coalesced)
  control: KVM_SET_LAPIC with the same LAPIC state, so
  kvm_rtc_eoi_tracking_restore_one() drops the stale entry
  deassert, KVM_IRQ_LINE_STATUS(GSI 8)    -> status 1

The entry is edge-triggered, so remote_irr is not involved, and GSI 8
goes only to the IOAPIC, so the status does not come from the PIC. In
the 0 and the 1 case the LAPIC is enabled and its IRR is empty; the
only difference is the stale rtc_status entry.

The code is unchanged in next-20261113. Xiang Zheng's "KVM: x86: Fix
stale RTC pending-EOI tracking under AVIC" only changes
ioapic_lazy_update_eoi(), so it does not cover the APICv-inactive
case.

One option is to call kvm_rtc_eoi_tracking_restore_one() from the INIT
path of kvm_lapic_reset(), as kvm_apic_set_state() already does. I
have not tested that.

Thanks,
Cheng Yongkang
