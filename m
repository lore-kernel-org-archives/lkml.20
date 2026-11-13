Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577934;
	b=3i8KrMFflfJHfs/EbBiixBeysn5K04tWf0846DG9H64hq/tkIPZi//iTvOdrrD4CUVUZ
	 +ygvqZsPtLPjjMgaBQBxmGLxMrD9HKcA45yNOLvLe3q3fY3Wc+Eh2WRN3URrr7aQjIucQ
	 t/DT+1wTtjPM310GM9vnHi5nbGHbw6iTdhmCTioBPHRa8u3gYLmLoymY+1ueD0GoH6zpF
	 Kx++xTSokbVB/47aJlIaVd0xd1rxSmZgLbKoB7En6Ti5AdUK/PQ9iOqfWr3A1fsGIjsTw
	 SyKd1lz3rcMwgORtKfLhC5IrxwoCS0ZUg05gJfAj/hDOpvO5x3Fbvsa7IYzgnqKZbdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=MlPSuCq58e3P4npzO9nCJTYzKVXM26Cp2n+6yfohh6Y=;
	b=U0hy/Xzv7xjmymFmaNe6b3XvZw0EwfSrT5tIE1KVsj8V7pUURKybbGNEhQt/mhQrQ3zc
	 P7eSsbkbWjfOu5lpPGn6uVn+1h392Z9JKlHk+EbM4RXe43fx6JbD8YLchRIrugdidKhnd
	 KjquyF+wBWLOWUJUIsTP+cHuO0MVkoIVUlUtLqZtiAuUw+gKytZxS+BzcVGfMPXi39YxM
	 IuKxPBWpAYCaXXYW1KvqQMpsPbQ3srgnVrkNV4zT7K1HL9EGbGU/6WFSy1kgMlbaVhTFE
	 MBIPDPmqssl3W5YWqcGVYuZEYvqkm+QEzp7ACelEuKoxF+Me2eLOoY54uc5gCLYuZlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TKl1Fpo0;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A18606A887
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76A18606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TKl1Fpo0
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed2803f863so8268965ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577934; x=1795182734; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlPSuCq58e3P4npzO9nCJTYzKVXM26Cp2n+6yfohh6Y=;
        b=TKl1Fpo09aGy2X/6g4rqWMCDe6yRsGaCn4ziqqMCt/0BCllTEK/txyF3L+0dqyNWoz
         5Od1dnzxNCQwBS8yxStc6Dq1GcvuI6UEk4Hz/hDG8HdhemvzD2ZpS2Ahjaz5Ct1n9uYy
         eo4xcF+LWNWzWMMKinYUDIT2hG4FZ6FYvdm9oc8mK62op1pxfBXjX7tfJk8krceQYyXI
         iMCjPO15xuUmL4/iZvf8rvSS3pp2FMKWpSOEPzGx6/w5ODk7vyIO0siRPUcts7X+6Wv0
         2pLEokDE8n1HY+Mj0PuxRg1JqaDpKeeG67RL5mUYgtVa7vLJRD34hMsFZmZ0KhkgSAnK
         qi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577934; x=1795182734;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlPSuCq58e3P4npzO9nCJTYzKVXM26Cp2n+6yfohh6Y=;
        b=PxG/OHFlCpBl5rahvjxWQNXb8P3+aWA/yAmvSFF1ulh6MEuudv/whurSvol6Nl+5i8
         SVENvTTU7gugDgg6toDws06ktX3qMUULmCKCj5tOewQcMCkh/QyVvWCrfovokEUh2fhp
         mtUcNYelrQw7lX8dCuAKEai23sns2AE3ynK38EICG1WVbxc7Nu5ClkviPkplB7wBVlay
         yXmK0kRve82dznWtnM7ojpmxSWKom7tv1QeS7VSNwuJYJT1ZLgTmz5xBDadkwXl5Nk1b
         t8CNLI7TYX67rVjUSRrZKLjhkZRI91FKCnA653oU67ohJ4EVLkPmfYpd+4QOluVz/BfH
         pTfw==
X-Forwarded-Encrypted: i=1; AL+hErEqbzZ4G4JS5r+oNdm6k5VdreUL7btthQPH+6P4t841RTBZFdNXi6KYZfW/8wMB/0wjc5/8SMRTa41vQ20=@vger.kernel.org
X-Gm-Message-State: APuU4Z8roNLC1Giuhu+0WHbEvNGlIc+70RIN23E+Lkpi8REBANhxDzIk
	bbFDJGun6Ldq5k0V6JfFG+cUNHQCi3cuRjMmP636HVhltnh57Bm4/AKLlzimx/XgxjrH/IKupTy
	jEKPOZg==
X-Received: from plly20.prod.google.com ([2002:a17:902:7c94:b0:2e9:4ce7:154a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:da86:b0:2ed:1fb0:7784
 with SMTP id d9443c01a7336-2ee0da7bd5fmr24791955ad.10.1794577933550; Fri, 13
 Nov 2026 05:52:13 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:27 -0800
In-Reply-To: <20261005192431.87317-1-hmushi@amazon.co.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261005192431.87317-1-hmushi@amazon.co.uk>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441831766.81610.17390734527567827315.b4-ty@b4>
Subject: Re: [PATCH 0/3] KVM: x86: Support hibernation of a nested Hyper-V
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Mushahid Hussain <hmushi@amazon.co.uk>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nh-open-source@amazon.com, mushi.shar@gmail.com
Content-Type: text/plain; charset="utf-8"

On Mon, 05 Oct 2026 19:24:28 +0000, Mushahid Hussain wrote:
> A Windows guest with the Hyper-V role enabled runs its own hypervisor
> (hvix64) nested under KVM. When KVM advertises the Hyper-V time and
> frequency MSRs, hvix64 lets KVM own the partition reference time. It
> then offers hibernation to Windows only if KVM also advertises CPUID
> 0x40000004 EAX bit 20 (RestoreTimeOnResume), and on resume restores
> the saved TSC and reference time through HvCallRestorePartitionTime
> (0x103). Both are reserved in the TLFS and defined in Microsoft's
> hvdef crate.
> 
> [...]

Applied patch 1 to kvm-x86 vmx, thanks!

[1/3] KVM: nVMX: Clear stale vmcs02 sync flag in free_nested()
      https://github.com/kvm-x86/linux/commit/ef289f270c59

--
https://github.com/kvm-x86/linux/tree/next
