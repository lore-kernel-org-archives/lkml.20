Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849178;
	b=o4AK1v/CohQnngfyPyOdquF9Ebxm2WXPg1u8+t3YBjr3TdcCJl2RuEPIpSXiIwM5gbM/
	 TH0UxuXJXN6YlO9hS9pj3avj5bV3OTbQXFYzUGghedLqnm1/bLoJKjTQ8qFwvtxR++w3o
	 3HRc4h+lyL4ybCNTJQ7FK3jJ2nWs32xVdup4aea6v4lXgDWJe01sMNToyrb4uss7Ba4xg
	 TrnHhHi9KF7KfqTXCmgsxELJ/MQwj8do6PiKxokNxFbCZI9T6Cyub9eOYFYxQTuLI7KPl
	 vnGohZKLfKBI5UPMgby71xWK2aW7lXHc7GInlZfkjmoxT2KNLNPDwl2901hf+h7V9Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849178;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=3sjBxoGOYwuAX1aR0c7CSWHtoyw3M4gkajNUpNVeVbs=;
	b=buf1XxcsxwEuUxf8rlSk3HYIhevuHaojp+AXoIvwPNm7Z7XAiwTHgSX7htmNp/COqufO
	 PMM2qhAuNbbgdSHqLCFZlgDGzKaJ5nBoRLNWhfQq5zu/O0uKgxcYqCHW5maCMZL3jD4KY
	 KAXUUtpmQdEuj90BtZbmN/4Mo94UsP0fe0YnUctiGuuI4n+SAyz6rgYE4NuatRXIJd85x
	 9fGeQuCA8xZDiXs0Gcsk+qw2qWY+hPWdE0ZAAMdxFCNRezyciR1ePf+9gZ11RQpMQvhHX
	 udiLs69ofWile9c6C6orQeGLYNDAdWeCDPYN+83X/Bi6y5MCED2PLLZFwQBZ2qyq3eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RbUFAC1D;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kJdLNcTI;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5228E606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5228E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RbUFAC1D;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kJdLNcTI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794849177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3sjBxoGOYwuAX1aR0c7CSWHtoyw3M4gkajNUpNVeVbs=;
	b=RbUFAC1DQ+Ga0j9lLxg/QxVbqX8rOli/JLkFdNZahuZ2lYz2iXxesmc00U6TjAZFbndJCr
	ncVTBKeKdTGTyjUwZzTnc0OTMDn33GIYuA2ZQj5S6cClTb5ZoEXDjDGeaa0eyOkVQgxOYs
	L8yVdwKY6qI0fg1mdiTrcbGpcLUGDnw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-u6JNg9gXMSuDatyDke5w_w-1; Mon, 16 Nov 2026 12:12:56 -0500
X-MC-Unique: u6JNg9gXMSuDatyDke5w_w-1
X-Mimecast-MFC-AGG-ID: u6JNg9gXMSuDatyDke5w_w_1794849175
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb67b2c00cso197165e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794849175; x=1795453975; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sjBxoGOYwuAX1aR0c7CSWHtoyw3M4gkajNUpNVeVbs=;
        b=kJdLNcTIAOAXbmo+mxhpsVOpRn8fad6bKX198o9EYhkfnmh3+gxdhRisH62cGwdVm/
         55nVjNVIWii2q0wOZaiBuN9D5qRKbmWMZNDasINuCA6UZVPfIEkbX2QhGF/kkRHF1W4w
         Rchq34+CYiQ6Uyn+2VpkZOeKDsuJkvp99Xhpy+2rJ1e3qdiOxmcs/+FAdlC8eQNlMaok
         SyA0gt6gih2j1RMJjjhj4vMyIXdPvqG2Zt8BSaMeOQUuBJlbL/VDPzOFunbM5njVggEl
         gCx2yEsv7g/exWJNGRpdLLXuxQXUN6hjZYeGAfbY9yqLmJh9MM+E47ZvhGdwC3PjLpmi
         L34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849175; x=1795453975;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3sjBxoGOYwuAX1aR0c7CSWHtoyw3M4gkajNUpNVeVbs=;
        b=p0/deC/fU7iS8mhkfbEbZPwMSrzP0u6OBLNEXTH3HwE7d5GaK5UvwWCOWGMNulV5Bf
         QVoWER5aXvIB9ZQoR0qoQGPAO2bpzWeWbfUqAvZx4913N7x50K/fslEAG6mqhLdbclAd
         WwtHmB2sj2dwoygpnOdhTjtUAvAOLsdUiJv0b0oqiOwLRaIThLaN73NgW78+1HKzDM+b
         HQ+h4DxYTfPtorV9uxjCYuJ6Xbpy1vJ7wTxp6RwJhap8XqL8OXN0eQ59a5rrRhvDtIuJ
         izosGpTha3YyBKxyPS2uV4RS+zND0rQTrUmCCz5hrsYqXecjfWQEX1Hb/WPrRlkv/qRr
         i83Q==
X-Forwarded-Encrypted: i=1; AL+hErH131O0LZU7axmuYFuCCTOKso63aRowA+mEWX1FRvmH5TSfx7jLVzaFLYFIiXHd5VpyYtP91lb8jha/IjI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6FWh/C7OZK2X/Tarqn/6OXy2XdrLzEJoHz6riRJPd2JdhuL7e
	xw/zw2cblyYtHqSG1tGeLp/q+CIUNlM/Tqg0Yj3h9ONgF28ywzfno3NdKKXOCuTKDEJ4Jcliy+U
	lnxA4XiqIa1LXsCWpCDEuRuAbWPisRd5sdCebxMa+Ay/oREqg3d2LtbplAu2l7TqRVw==
X-Gm-Gg: AYBFou2uOc93VAtSJgYeymr8y+9grxeRpzk3/c4LPZOJZPzuIk9IJhHS6FAg8JY7MOy
	XKza6lwv0YePnJ01T3PMcxkHTOwVMZy9uUAIntaM8i25+B4sID50OW4cYsN9wwyW+eC7YpHZRkM
	UHbh2e1lt4aylYcxRWAfds2KplntNogmH3VE5fu/h1apIf/J5nDAi1O8Kh50IOWu8eeIkqL5eQC
	Kf8tw4twtpfpLcxKltuQ76nCezqRj8vBOZBrhxLbLNGhNrb1AC8IiF+cpkY/j4irW9fik8xLlu1
	HxKNwmAjpxlHdfSeHF/3O4inFObzgHHas5ZuJVBjEuOh08HaylUe4iVgJ5/eLk0AGJ51TyqBKTN
	KaDEWlMlsHgm2LAzt584iOTXnSAzX6eCLRrp3fninyQ7UacUtMQt7ziLH/fj4PZ/sqs6eT4fPhR
	F4nXKwWJlxfdmPV68=
X-Received: by 2002:a05:600c:5493:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb783813a7mr3047295e9.10.1794849174673;
        Mon, 16 Nov 2026 09:12:54 -0800 (PST)
X-Received: by 2002:a05:600c:5493:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb783813a7mr3046825e9.10.1794849174186;
        Mon, 16 Nov 2026 09:12:54 -0800 (PST)
Received: from vkuznets-thinkpadx1carbongen12.rmtcz.csb (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb732a2a9csm67737045e9.3.2026.11.16.09.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:12:52 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: DV <dv@etik.com>
Cc: Alexander Graf <graf@amazon.com>, Sean Christopherson
 <seanjc@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 hpa@zytor.com, x86@kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 nh-open-source@amazon.com, gurugubs@amazon.com, jalliste@amazon.co.uk,
 Michael Kelley <mhklinux@outlook.com>, John Starks
 <jostarks@microsoft.com>, David Woodhouse <dwmw2@infradead.org>, Marcelo
 Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] kvm: hyper-v: Delay firing of expired stimers
In-Reply-To: <1435d106-d4b0-487e-85d3-4032a9fe9332@etik.com>
References: <20260115141520.24176-1-graf@amazon.com>
 <aXO8I6xuZyZB7CxV@google.com>
 <769f538d-dd42-4d36-a4c5-7e6e48b209f6@amazon.com>
 <87bjigaeyx.fsf@redhat.com>
 <1435d106-d4b0-487e-85d3-4032a9fe9332@etik.com>
Date: Mon, 16 Nov 2026 18:12:51 +0100
Message-ID: <kupzev8hf8s.fsf@vkuznets-thinkpadx1carbongen12.rmtcz.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

DV <dv@etik.com> writes:

> Hi Vitaly, Alex, all,
>
> On Mon, 26 Jan 2026, Vitaly Kuznetsov wrote:
>> My bet goes to the clocksource switch, e.g. the guest disables (or
>> just stops using, good luck detecting that :-) ) TSC page and uses
>> raw TSC for some period or something.
>
> I think I've hit a close relative of this, with a reproducer that
> works on every boot. A Windows guest running its own Hyper-V computes
> direct-mode stimer deadlines from the raw TSC, while KVM's reference
> counter lags the TSC because of how QEMU restores kvmclock. Here the
> lag is positive, so the guest's timers fire late instead of storming.
>
> Setup
> -----
>
> Host: Intel Core Ultra 9 285K (invariant TSC, 3686.4 MHz), Linux
> 7.3.0, QEMU 10.2.4 (pc-q35-10.2), libvirt 12.2.0.
>
> Guest: Windows 11 Pro 26H2 (build 26300.9711), 8 vCPUs, with
> virtualization-based security on. So Windows runs as the root
> partition on its own Hyper-V (L1), nested on KVM.
>
>    -cpu host,migratable=off,hv-time=on,hv-relaxed=on,hv-vapic=on,
>         hv-spinlocks=0xfff,hv-vpindex=on,hv-runtime=on,hv-synic=on,
>         hv-stimer=on,hv-stimer-direct=on,hv-frequencies=on,
>         hv-tlbflush=on,hv-tlbflush-direct=on,hv-tlbflush-ext=on,
>         hv-evmcs=on,hv-avic=on,hv-emsr-bitmap=on,hv-xmm-input=on,...
>
> Symptom
> -------
>
> Every timer inside Windows fired 0.3-0.7 s late. A 1 ms wait on a
> high-resolution waitable timer took up to 466 ms, and an indirect
> display driver paced only by a timer refreshed at 6-8 Hz instead of
> 120. Things only moved when some other interrupt woke a vCPU.
>
> What L1 does
> ------------
>
> With both hv-stimer-direct and hv-frequencies, L1 arms stimer0 in
> direct mode (config 0x1ef8: vector 0xef, direct, auto-enable) and
> writes absolute counts. Call X the amount by which the reference
> counter lags guest TSC / HV_X64_MSR_TSC_FREQUENCY. L1's counts are
> X too far out. A timer that should fire right away looks like this:
>
>    kvm_hv_stimer_start_one_shot: vcpu_id 6 timer 0
>        time_now 40095770231 count 40100417164
>
> That count is 464.69 ms ahead of time_now, and X on that boot was
> 464.7 ms. L1 writes the count again on every L2 timer exit, so such a
> timer keeps moving to now + X and only fires once the vCPU is quiet
> for that long.
>
> Without hv-stimer-direct, without hv-frequencies, or without
> hv-stimer, L1 uses the local APIC timer instead (TMICT/TDCR writes,
> a relative countdown), and all timers are on time. I've turned direct
> mode off as a workaround: a 1 ms wait is now late by at most 1.24 ms.
>
> Why the reference counter lags
> ------------------------------
>
> get_time_ref_counter() follows kvmclock on both paths. The fallback
> divides get_kvmclock_ns() by 100, and compute_tsc_page_parameters()
> takes the TSC page's tsc_offset from the pvclock system_time.
>
> QEMU's kvmclock_realize() calls KVM_GET_CLOCK when the VM is created.
> kvmclock_vm_state_change() writes the saved value back with
> KVM_SET_CLOCK when the VM starts running, and saves a new value
> whenever it stops. So kvmclock, and with it the reference counter,
> stands still from creation to first run and during every pause. The
> guest TSC keeps counting through both. On six boots X was 297, 465,
> 570, 495, 669 and 512 ms.
>
> Two measurements tie X to this:
>
> - In a trace from QEMU startup, extrapolated back to zero, the guest
>    TSC started at host monotonic 265208.1505 s and the reference
>    counter at 265208.8205 s, 0.670 s later. X on that boot was
>    669.2 ms.
>
> - virsh suspend for 1.045 s, then resume: X grew from 669.2 to
>    1689.3 ms (+1020.1 ms), and L1's far stimer deadline moved out by
>    the same amount.
>
> hv-evmcs off (X = 570.1 ms) and hv-reenlightenment on (X = 494.7 ms)
> didn't change the behaviour. Host load and power management were
> ruled out too.
>
> Connection to your thread
> -------------------------
>
> If the reference counter were ahead of TSC time instead, L1's
> deadlines would land in the past. stimer_start() expires a one-shot
> whose count is in the past at once, L1 arms it again on its next
> exit, and that would look like the expired-stimer storm Alex's patch
> delays.
>
> I haven't been able to try that here, because libvirt is set up to
> start a fresh QEMU whenever the guest reboots. But a reset inside the
> same QEMU process sets the guest TSC back to 0 while kvmclock keeps
> counting, so I'd expect it to flip the sign, possibly by the whole
> previous uptime. A resume path that restores the two clocks
> differently could do the same.
>
> Questions
> ---------
>
> 1. Should KVM keep the Hyper-V reference counter equal to guest TSC /
>     TSC frequency when hv-frequencies is exposed? L1 seems to assume
>     it is.
>
> 2. If so, where does the fix belong: in QEMU's kvmclock save/restore,
>     or in KVM deriving the reference counter (and TSC page) from the
>     guest TSC?
>
> 3. If not, should hv-stimer-direct be documented as unsafe for guests
>     that run their own Hyper-V?
>

From what I remember, direct mode synthetic timers were added
specifically to aid Hyper-V-on-KVM case as non-nested Windows was
preferring non-direct version anyway. So I believe we need a fix and not
3).

I'm wondering if the issue is somewhat related to the nasty hack we put
in 

commit 0469f2f7ab4c6a6cae4b74c4f981c4da6d909411
Author: Vitaly Kuznetsov <vkuznets@redhat.com>
Date:   Tue Mar 16 15:37:36 2021 +0100

    KVM: x86: hyper-v: Don't touch TSC page values when guest opted for re-enlightenment

but maybe hibernation is somewhat different. Or maybe we misunderstood
the problem in the first place and only fixed one sympthom of it?

> I can share the full traces and the Windows-side timer and frame
> probes if they'd help.
>
> Claude Code, an AI coding assistant, did the tracing and analysis
> while I was looking into why the VM's virtual display ran at a few
> frames per second.
>
> Thanks,
> David
>

-- 
Vitaly

