Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793739362;
	b=X7jDSUGxWQ8EpgJDz6hvTc0pRScxSkLIPlt0BmMJTptc3N7hKoNVE2i6OgNEIK4dmuBH
	 OAfmrw7o1tTUE2STvQ0x3CQ4J0e0c6hcMuGu+8RwDvvNi1ar/ui+nwSEhjPZSrRmEYAib
	 sBazZu6hh7qZacLLJ1Ts/DMVTCXKLthFLh48jPO55hVap6rp49ZkQje/iX3rXDoovVy24
	 1+o+jP4iVuZcCHmreuDiEfs7ati57DqseNpVbwlP/U5IFWiTkwWfGEFJ9Yp8CXuGr9SbH
	 wVYn0s2kw3knf/0fUwzSM0u4r1vpnTK0NeS0Ykhopi4ln/yFQOuSqQoBSZPaIjzueKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739362;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=wXKDb0shvTVmV3AagAoa11gS9VL7nY0cemZyFZyr2hY=;
	b=tXu3rAySraMrtUdGMUbyjrRKZwKeypuq5Wt//YUHBKgtzUKL9JiFJPFutWnAx1yCBr93
	 YWEvj94nIkiJEdu3AYxzDJKaF3VV/7IYPYmuy9sC00jS/DEf1botWH0seMuIBnoxOOFdz
	 J+vKR4mFef9Z/1XYxcB5NtHL6AzknZ0nLR32kRCTJrbUqnfVdgG5ZIOiSQg8uLbML1gcK
	 DX7NfV7Oy1cC9DUea/7hYDPxd6cQiwnkq7HfXI26E5N2W5TKOnK4efLXhuEhS4vymCPli
	 rnAu4Di6hbYzIqrQFpOBHw8wZmHPKHx4BS8nEfhf1wJYFJOyyHMCfGNYfg7D3XV3Icw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K2U+Oy10;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EvRt06rc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66E6606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A66E6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K2U+Oy10;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EvRt06rc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793739360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wXKDb0shvTVmV3AagAoa11gS9VL7nY0cemZyFZyr2hY=;
	b=K2U+Oy10KM7Fc26c+kfydX9SUQLUfffKBND5sj+eSD0LEY9d9YqukUSYgwBvZBi+KxXuM+
	87vykFB79Bv01VmS7OQaMhjr7NcQaHvgky6swFzN7C6lyODuQGy9IqX9WliehVpLyd2btC
	0GGrxq5Cxr6fUedADKPHWhzuYJrrHjg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-u3SAcEApNNyz8w0-nCGEhg-1; Tue, 03 Nov 2026 15:55:59 -0500
X-MC-Unique: u3SAcEApNNyz8w0-nCGEhg-1
X-Mimecast-MFC-AGG-ID: u3SAcEApNNyz8w0-nCGEhg_1793739358
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4b0a307487aso13585115e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:55:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793739358; cv=none;
        d=google.com; s=arc-20260327;
        b=WrSanBp1/JUvp0hjmK5Ng/FjP5Ork0iifJb7Z82jg2FlV+9BzjhzA//cSpqsvUyTlR
         lhbcQs7v9u29OqdsXVs7uMaZZ3rGYSEFd+4NZ8aoXjxqnn6gstA/R/6Y9cbNITUKZWC8
         GvRbubIPfLrvKx9ZWoXiYpnfBrLSsH+HnrJTi0JRTcDQKKfpV0BJBN9Qn12VHAKPVDUa
         hHjlvRJjsf7xVmnlNJsENH4PE0ANb1FZnb9K4H/PYF78jKe2zweAnob7YohcRsAltfki
         X18CjAbH2q1pBFjZZVIm2IM6z9WFogKzfX3x0duJOxkMlbXagqtS0NKUWQt9JdYyPTBR
         svJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wXKDb0shvTVmV3AagAoa11gS9VL7nY0cemZyFZyr2hY=;
        fh=of34a7EpMSx8KB0OX/lT7D1GGNhGMWjJkWL9d3cVoA4=;
        b=LuO0hMJowpog0TPIMAMhcmrKwJ0TiJNw7lVIy3jEytZbMr+wFM52k2XWPvZCZqu1xp
         kdSVhTG8kfaQZk3ONNgr3H06t3d5wT6zvWpje0JEqnkt8FV5gA+VKb1jPAkCDDNmOurB
         Xv938dBhuxfG1R8o8wRSyOl+XVl1o5u/5ezOauSJnmWfm+gzNSLoFUyRNrzYP/OhNz4S
         MKsftKszAxnWWQ6iTdcsRt2kZkYeRHqMvJAUfFnsmxhEZttZ0FZE3bvRS3de8t/GthsW
         Uv9n2u7Q8+Lms3bZJ5HiuwcObWJ572sYrcGxa2CW9yjcPeuTogLohIiwDAl+6MC+pt8U
         KLuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793739358; x=1794344158; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXKDb0shvTVmV3AagAoa11gS9VL7nY0cemZyFZyr2hY=;
        b=EvRt06rcENLPGZTISqugrXcti/3DIXMpcTLyZXzDagPNxAays0a7NDHqvSUKlLvkuG
         dtwiPancTukm9o29Jik0KyD/5j2pnfNEuT88IyFwbIpsrYwexGaOccAVHzpvcLvEUjhF
         qLgjuLFApK7lAfd5NNegmmGvpeeusEvbZfSQ8u/k/qODM8oTHxkzACvOdLPixBlZlDin
         ZtQgLJCWcCIrAAZGhydl1CeQNR01MV/wFfJmk7VpFb7RSwugdN/8u8dEeUM5g5/5Ns6B
         U1sTGln7qQHmzmEkBb/uG5Qrpb1wsj9GlG5rrGwULFuDwR7wJJPxkw1kNSs+IoMEt7Vw
         +qDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739358; x=1794344158;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wXKDb0shvTVmV3AagAoa11gS9VL7nY0cemZyFZyr2hY=;
        b=pQ5Y2kvqAGBCCak0npKsnl4vGZMipJxygzoLZX7e7VCwVhF1+IRuPDsZnSfLuUOLc1
         /INyRK5ELZTeg77+3MPtbl0boEH6woZEfaUEvapygAONighb/MLdRtyE64kVwzavKjHD
         qwuXawU8lREIjkhblr0wnZFjDQVyUpQvZVE++bXkWioB6ITj5LQoKiOtF86tPOz5YlMR
         X96m24swjfvTD8Z3RWTLwJB5WaW/RnKP2AUEP51oHAn+tF5DSNYZWanQVRftbqUjVzvX
         Q60gXkQ+6MrdSqLZGF/dotamCyoyRXVsVJTMbo+X5s7labmnOV8/k0LmBWS3V/1/IXfJ
         0frA==
X-Gm-Message-State: APuU4Z9A9rtCBUatPLywvIOo0DquGa2kfG+86mZr4Vo+sdsEVlwjnZhO
	7Z7XqW5Ij7+dKbqUFaila7SViQZtBRM5DztU0QZdIzBcBO4Qc2WqMUv/B8ROqcujWbjvEDVbqt5
	qX18tanehjM7Q6elB0NejtC//4avQBy21Pl+SNLktgo4v+Eyp4nQnGY0KNQEsrQlOQQtYyvCVtC
	EsBr+I+eExOu1XTa5vaGoqWbdL30gNBQ4iDTqKQr7U
X-Gm-Gg: AYBFou1mX5nflIYXDl53K/uNpk5e5WmWXvOAnhSE7hn2FgIy9ApYcAF4YG1kG/GplqE
	qTCfIRfLmy10KZCmDvEbHBR/3hJizTz0r2LQ9h22nTbtEuT1cFc53/jK3ggVfXj8vMtd89zZr99
	7AR4oNds2uROG9Q9QVr2VlYOs6xhsi2/8h7p+01Z4fd187nfKLhUe9nArsuZE729HlQmoPx0vXp
	HM4yP3qA9g5O0G3nYAjlObHHnJfZOPUOMm+Hp4sZLeYey3IDS9GgjfN3vo4
X-Received: by 2002:a05:600c:811a:b0:4a6:b49f:9ae5 with SMTP id 5b1f17b1804b1-4ac18e5dac8mr298620565e9.34.1793739358119;
        Tue, 03 Nov 2026 12:55:58 -0800 (PST)
X-Received: by 2002:a05:600c:811a:b0:4a6:b49f:9ae5 with SMTP id
 5b1f17b1804b1-4ac18e5dac8mr298620325e9.34.1793739357803; Tue, 03 Nov 2026
 12:55:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103124930.2278671-1-pbonzini@redhat.com> <20261103124930.2278671-2-pbonzini@redhat.com>
 <aunzE4yywHJOqsk4@google.com>
In-Reply-To: <aunzE4yywHJOqsk4@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 3 Nov 2026 21:55:45 +0100
X-Gm-Features: AclHuK9NbLFeA4rOMmjWiElPvRKkJKekyTJisFXX1WKeTFZUAYkS3xpedGH9E5s
Message-ID: <CABgObfbvv-fQnC35EU+TxEtNMyYA0wgJ-nA_2B1eqKrZ_2qqkQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: register asynchronous page fault waits with
 interrupts disabled
To: Sean Christopherson <seanjc@google.com>
Cc: "Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>, kvm <kvm@vger.kernel.org>, 
	Hillf Danton <hdanton@sina.com>, Steven Rostedt <rostedt@goodmis.org>, Harry Yoo <harry@kernel.org>, 
	syzbot <syzbot+f11512d1e5878ba5e60e@syzkaller.appspotmail.com>, 
	stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Il mar 3 nov 2026, 15:43 Sean Christopherson <seanjc@google.com> ha scritto:
>
> On Tue, Nov 03, 2026, Paolo Bonzini wrote:
> > KVM cannot use a node on the stack like kvm_async_pf_task_wait_schedule() does
>
> Oh!  Yes, KVM can!  If we fully handle the PV async #PF in vcpu_enter_guest(),
> then the node can be put on the stack, right?  Juggling preemption and guest
> timing is heinous, but on the plus side it consolidates the PV async #PF code,
> so I think it's a net positive?  Especially when factoring in the node stuff.
>
> Fully handle PV async #PFs (when running as a KVM guest) before enabling
> IRQs so that it's impossible for the current task, i.e. the vCPU task, to
> be preempted before invoking kvm_async_pf_task_wait_schedule().  This will
> allow the guest-side async #PF code to eliminate its dummy allocation,
> which is needed only to handle the case where the page ready notification
> is delivered before handling the not-present #PF.
>
> Add dedicated handling for PV async #PFs instead of wrapping/piggybacking
> kvm_x86_ops.handle_exit_irqoff(), as the act of handling an async #PF may
> enable IRQs and schedule out the current task, i.e. needs to be done just
> before KVM itself explicitly enables IRQs, and needs to enable preemption
> before calling into the kernel's PV async #PF handler.
>
> Opportunistically wrap the code with CONFIG_KVM_GUEST to help document the
> context, and drop the CONFIG_KVM_GUEST=n stubs.
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>

More like Instigated-by. :)

The main advantage would be that it bypasses the missing lock issue
that Sashiko reported, but I don't know... That;s surely nice, but at
the same time it is not great having to add a new callback, and to
duplicate the guest_time_exit/preempt_enable code into
kvm_handle_pv_async_pf().

Not that the extra field in vcpu->arch is beautiful, I admit that, but
it seems extra unwarranted complexity.

Unless you insist I will send a v2 that takes the lock properly.

Paolo

