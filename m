Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EED4A64D4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999570; cv=none; b=BpDbJgsj+vDQgN9XKMzieThSeCky5RPfmiBV0wByaRIuiNJ5i3U6kwhS5vJsOx/pzqKYRoxuQ/bh92RF2qhiBIwAPzEahY3j217lnTa8dHcJmoBSp1V8QN65tz0QmKy+27+aHZSOHXM3e72d8t+KaboiVSeXYOJXnxQ6+tcWqTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999570; c=relaxed/simple;
	bh=0dZ5YbDbJH39c/54d7+b7KJ43/iKdc3mwamBtUR777Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dQ72z1CYV98Bf5qZf5oS7tMWsWM8LOpeuAe5u914lxj1TWXJ8fHUCOAFDuy+Yz6LCSfy9tM0krYj9hD7tSu1KewHOal00YbwxQMEcPYNqVUiPthu4AxppNHKsbFfaX2Fxmdq4VYvRw26IKt5XCQu090KK27j+SeZMAFHmaku2AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oyEakO62; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oyEakO62"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86261e66700so3018050b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999568; x=1790604368; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=36Xgc8CFAqUqBdMyUYpwMuSstU8OP86gmDCHoH0Yjzs=;
        b=oyEakO62fWq/dA9SucaYqgYInijGBMEstSQq/6uRMpmixvL5OXPUlOq4+DWBub72nb
         OxlfFWvZ6OYitZAMk4x/cMC/iI3IY6Rb7VaTnKe4eahmubxp5I5kWO9KSsill+G+KTYt
         EAAkBQYmP+WtbN/yiy8VNpKC8q7qBnceQUG9dwieaD9a/8/mMIwixswp13GMX1QYJSIB
         lSKfYy4zQJYwhFq3G3MdDWbQ3Cir9WCNTealXnRrh+YEvnBKkGnTMo81S0yJjhWaFeUo
         JcBLeuSzORf8+vdoaumUaYXhrN/hSFAihjwj3TzpI/fXPDHTz1m3Kh+G1hmfy6ehq5r7
         coHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999568; x=1790604368;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=36Xgc8CFAqUqBdMyUYpwMuSstU8OP86gmDCHoH0Yjzs=;
        b=TdHxcY4MsRuH849TDda8vQFd2BL/gHTgM4pHVMb1JkSVcnj54F2l/UpgeT+bNoEKtj
         9XR+MIj/15QtjwT5xRx/2pYUFCvzPOMjV5K/mUGvRmTE9JO9xmXDZ5sZ3c8AvuWP/Yby
         LcY6Ik6YQYA4/577lcXPmM5ZfED0lY22CwUlXcOx/kJSm0qBZIDRfe2YPrtD2UOnE2RD
         4lLKOykr8DNvizEMrP7tuCC72ZmZtgTnYJfYNFJQdX7gZgjLVUpySZ0asA80ggUPS+yf
         0/NRF894E0gIvVoshPHafov2S37/SLiRqqLL9FjV4UOFxaOfEo9E36nUXNfwGtRHPFYu
         toTg==
X-Forwarded-Encrypted: i=1; AKwUvBxl83SyRbVGoCMqjAgVUKtALswdlzxfDAd76FFQoojMT1gSqBxT0swgLEpPO/r3yScQ1mxba3ZJxRLKIu8=@vger.kernel.org
X-Gm-Message-State: AFuF++mC7WLjsdXx0yNKUcHbVO8+eYnwGnPexwm9bAg2A8msALSTvCnR
	6YEQ918rFOHIPtx9jIrqPjAfN1xgB1xqMqq14n1tQFU3P6BGnIxrGD6TO0jna9PX3vEbvNLI9U4
	iz3YjTg==
X-Received: from pfux1.prod.google.com ([2002:a05:6a00:bc1:b0:879:b29a:eb0d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1f06:b0:857:73e2:9108
 with SMTP id d2e1a72fcca58-874ddbffd9bmr14371131b3a.24.1789999567863; Mon, 21
 Sep 2026 07:06:07 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:08 -0700
In-Reply-To: <20260826184449.814130-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826184449.814130-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999678766.712354.13131811120139507103.b4-ty@google.com>
Subject: Re: [PATCH] KVM: x86: Zero reserved synic flags when delivering
 message to avoid stack leak
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="utf-8"

On Wed, 26 Aug 2026 11:44:49 -0700, Sean Christopherson wrote:
> Ensure all reserved flags are zeroed when setting the msg_pending flag as
> part of SynIC message delivery, as setting only msg_pending can leak seven
> bits of kernel stack data to the guest.  E.g. gcc typically uses a
> bitwise-OR to set the msg_pending flag, without initializing the on-stack
> variable.
> 
> Precisely zero the flags, e.g. as opposed to zeroing the entire structure,
> to make it somewhat more obvious that the flags *need* to be zeroed.  E.g.
> it would be quite easy to misread the initial read of guest memory and
> think that zeroing the entire structure is completely superfluous.
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/1] KVM: x86: Zero reserved synic flags when delivering message to avoid stack leak
      https://github.com/kvm-x86/linux/commit/2616f497506a

--
https://github.com/kvm-x86/linux/tree/next
