Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577698;
	b=t6IpnGi0jAg3ijfp4xyGJcmIhu8B4HqcaYRl6fOzJF7hCRnpp72qZ6GFPnTg4k05EUFy
	 JsiEvhsbzNP6rCG7ekmcynQfMa4f3qx7rcABvVTnANxeBbRHGK+U4ujJBPtIIczDwjFJk
	 LlkMKxtuF65fQ1QOrKmTOmn32yIWRz01zk937nilVLNfWeNMLvV7Lgu1WDqDBRKAIRA81
	 uN+pkZcVWI6GBF6sGxfcrkxFJP+ZZOpKewDPEDivqZndh4oqTpjox3yKaVX4hOIwBuicP
	 5dRdi3vpGWhbrblICOuQdbxW47Kod4pHHP0NjnWc9wEE6p7KMkQYBt65TtUaxV7BmNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=PHxtB1Gf4ENCC56HT1H7/YouUUYQa+0aDpYwbN8Kj/M=;
	b=WapmZkpNev6maKJcSqBK9RXuargPsVjd6/RtdHteZeW2GawUWrGghlExL5K6xK9NONOw
	 SH30eSvtoWcrMYcbyWKBt6Amrohkb6KwqDlIA2TWfKbKCjhig7+BpegnsxubCNvkDKmOm
	 pWlVN9TRDijnvIPIkYcAoZC8z0g0uEbl59eg8Kay7vtPkM9bHBV4rQ7Nqx7q8LAI657Eo
	 OUnG2/i7ZPrM+eoZys/NInEBX7FMJ9dWoWjxK0vvGoUpY1PUlBoXzVw1BGdU5YBDmTCoS
	 bx8A1teXYAJOXCx66FwSDwB/y4PQ5ZDCtcLgGuYcvM+x/uI9q034Xtn+sWeCs/ryH3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n5yFHqG6;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D70606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59D70606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n5yFHqG6
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso1515027a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577698; x=1795182498; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PHxtB1Gf4ENCC56HT1H7/YouUUYQa+0aDpYwbN8Kj/M=;
        b=n5yFHqG67oOmruubX+rthq3ghH/8H/n0V5kwPNsuo/bga0lzdJMGUppbPL3nLX0KrI
         fYvXvKn9qTUpaIwrFlNEkXptz4S2Wt79rBj5/d4fG4AEj3XH05uWhyhUFEntMPZMFE7Y
         WQCRbkDhtwyrHTo+7ULy6q4LAyvCBn+DVPtnuuq7AygbybqpArxRoMS9KLEFKqMApKHq
         rxpANoYzz3zFyyyfUD1rFrgRc7K6hmuPWGgwTKFsb4IehgAzqrfgJXVKuTBwImc8pSzN
         MhYibuAXClUTV9NCl8e6a51yuD1H9NyM+xkwHYzKNAezPR8U+NlL8pLU+xDqUtK7qCSF
         740w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577698; x=1795182498;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHxtB1Gf4ENCC56HT1H7/YouUUYQa+0aDpYwbN8Kj/M=;
        b=zyekAZk5JvcUJ/Okk2i5KKD4ZED23tadYvtyOuAn349Wn+OpYd+SvJwVPGGZ41rWDW
         kQhD+GuO908c4IZAn1OAGCl7oLgZVAGUWY5nqyLEG7uMkazur6joR3MLfbFBDqEylgYO
         yGQMUfyd1TzkG6i+93YltwB6KcBK6gqH09txKqydB4emr6xjcLlOLI7knlozDYx4Tc5P
         +wewNXYbgB3JNL8rahiUMtzptLh/PF0DHnF7FxBi+Ia6dzv8DKFo9S2rtG3ipEZd0P0e
         NE1PQit2VUULrYHiLDbrAqUkbfBpR9oFFkNY1wMWOv2K+V/PbdjDJeElyUGkr7wND0gb
         FbLA==
X-Forwarded-Encrypted: i=1; AL+hErEhP3cUCY2cM3dlHDKMJocPkBaVB6JKZLPWhTEimfN4AA82SuY+ZERbws6cBQsihxkicnKv1t1xwllZKkY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KNSZw5X4oglkFwgLNMsc9tognv5xNKrNC024xSr6SCyxKZz8+
	aPjIWf9OM/jrCXKeNAYFcZVvk+G47ZafWtSQkoou1TLoT73h/w7hjdsf3oGTih3R7fs96XQ+KpS
	Php/vJw==
X-Received: from pjbfz9.prod.google.com ([2002:a17:90b:249:b0:3a8:8d0:61eb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a45:b0:3ac:7406:b49
 with SMTP id 98e67ed59e1d1-3b1b0b5c202mr1376156a91.15.1794577697434; Fri, 13
 Nov 2026 05:48:17 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:22 -0800
In-Reply-To: <20261030212112.2598640-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030212112.2598640-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441847158.83355.13758439775824427618.b4-ty@b4>
Subject: Re: [PATCH v4 00/23] KVM: Fix+harden against bad uaccess using dying VM
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Fri, 30 Oct 2026 14:20:48 -0700, Sean Christopherson wrote:
> Stupid SMM.  Patches 1-3 need to go to 7.4, everything else can and should wait.
> 
> Fix a class of bugs (limited to nested VMX, as far as we know) where KVM can
> corrupt an unrelated process' memory if KVM (attempts to) write to guest memory
> during VM destruction.  Because current->mm usually isn't kvm->mm when a VM is
> dying, e.g. because the associated kvm->mm process has already exited, writing
> to what KVM thinks is guest memory will corrupt the current address space if
> the associated userspace address happens to be writable in the victim.
> 
> [...]

Applied patch 1-3 to kvm-x86 fixes.  I'll probably create a dedicated topic
branch for the rest based on a later -rc.

[01/23] KVM: Reject user accesses to guest memory if current->mm != kvm->mm
        https://github.com/kvm-x86/linux/commit/2520694e6048
[02/23] KVM: nVMX: Don't force a full nested VM-Exit when destroying a vCPU
        https://github.com/kvm-x86/linux/commit/99872af7b904
[03/23] KVM: PPC: Flush/zap all memslots on kvm_arch_flush_shadow_all()
        https://github.com/kvm-x86/linux/commit/93862ef1afdd

--
https://github.com/kvm-x86/linux/tree/next
