Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E602B4A2623
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999600; cv=none; b=IrSMgFju4DpdokMAgJXEyJ4tQcwiOcCpCre++gbG+kNCPOf7596FZPzQwmdbq8zFp1izz5ZsNFO69NdNEPhPAACoXPMsblpQOU8/A/8vUoFEaDzO6cfMnZ+YJCPD444WfiG/II7pckAYtXMtvHgq5CvhR/QqURP/5OLrZD7DA+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999600; c=relaxed/simple;
	bh=A2LrtQ7ZtBWMR03+zbci/R9MzI5Pc2F2QMHjFZMlWAU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mBhFQ2fEdwYy/vB2kJgl2buRD0D9oGcx3JuOTBQR0Ix9ZijrgaO9r78Dpel1jzR07wYox4Ea6EfhmdDOVnBWxxRzffXyK21LU0OOuOZf+YMQ1EYgqxE2KxYoUqbM41tt7Cn9pOpsr5riZA0gbt6px0Jf2afMWIC+v/kgo/l3PKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OCtmNoT6; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OCtmNoT6"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd53f2b27cso38337575ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999598; x=1790604398; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/muhDVYe/u/0a8VSASygMA0PeAhT5QoDIzy8zL1loI=;
        b=OCtmNoT6uKHszyBLCmdGVgtz4gbWl1Gh+5iiscbZuc1Kp79bZqJ3UOrhHqd3ezjG3s
         kzP3E/q0JE+k/HnwiU5XlpNKMXlenXATWlfZv3JOqY99ApIrfw1XJmeDZqOKKA7dI4rb
         hYSI0t4niNJM9+8XFuAtVQHa4qM2s7fbAMmudjslW/XNBYIy8N2O+JpSPu/IzXRh0E4I
         gxhapg1f0+cEL2uyOudemkaL+K/PHOXsRWw2tyzgEWfw1UyGnVcOTfPGk0cgsx14cO+g
         /1ktYqoSQxjcqCvHjU6IZQ2iiMaAmSqETbSy2omTD734QoIiZjNQBbFnvElczS/1A7CD
         AJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999598; x=1790604398;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/muhDVYe/u/0a8VSASygMA0PeAhT5QoDIzy8zL1loI=;
        b=P3JfhR4pfWLdTwcQw+Uv0mXBRdsZ+lZqL+mu6SBb6MvfP77gDaSW1LS1eOhGp49Zmb
         VuMnwGe2YOozytRxVvIqxr3z5TZDqBfZhNw1xiYgPreHe392rLeKsIa2S8Tqbw/HGCEX
         WzNpkb1grHlREExPBSz9C/x97oBsSFW6bBdkzayf25E8mpJSfrjpnLKeIZL4g8A7cmHI
         EW2wML3AKUJMslwyGJ4xDkWqErb/3voMsQqCTks/BXqKFA0XTIjxrTSBV81OajuK01oi
         U0L7ta7+tP/0c/Pcn5zRl9UTuH6T7+fcJzmJMZ98BEUMK+0YxtRqNDikj4wdVwxjwI08
         fvMA==
X-Forwarded-Encrypted: i=1; AKwUvBzkqGlWZqXvDVItuImtp/BX6FSooNP17Sx5sRzlaXjXAYs4YxjpYxKWvznJw1CegDx8M5IJlp+3WkWC8hs=@vger.kernel.org
X-Gm-Message-State: AFuF++mo2UyZc2bKAUvBi9nsvAjdpqFfLB8H8uSoCf15mG3AtI47I7S8
	ohTo0dAJh8AOrcFEq+KPlt+E2XKyO5o0dTKk9MRa8xmMTw3jyBvpC+2+s1JlkMlGZEs+2l1Zj79
	DrO2FJw==
X-Received: from pltt2.prod.google.com ([2002:a17:902:d142:b0:2dd:86da:afaf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2349:b0:2dd:c100:4b73
 with SMTP id d9443c01a7336-2ddc1005ee4mr92173005ad.42.1789999597950; Mon, 21
 Sep 2026 07:06:37 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:18 -0700
In-Reply-To: <20260827112200.866476-1-zeng_chi911@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260827112200.866476-1-zeng_chi911@163.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999879184.740271.10237391317724062011.b4-ty@google.com>
Subject: Re: [PATCH] KVM: Mask off the address space ID in kvm_set_internal_memslot()
 check
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, imbrenda@linux.ibm.com, 
	xiaoyao.li@intel.com, schlameuss@linux.ibm.com, 
	Zeng Chi <zeng_chi911@163.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, zengchi@kylinos.cn
Content-Type: text/plain; charset="utf-8"

On Thu, 27 Aug 2026 19:22:00 +0800, Zeng Chi wrote:
> kvm_set_internal_memslot() is supposed to reject memslot IDs that belong
> to userspace, i.e. IDs below KVM_USER_MEM_SLOTS, but it compares the raw
> "slot" field, which packs both the address space ID and the memslot ID
> (as_id << 16 | id).  For any address space other than 0, the packed value
> is always >= 65536, which is larger than KVM_USER_MEM_SLOTS, and so the
> sanity check is a nop regardless of the actual memslot ID.
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/1] KVM: Mask off the address space ID in kvm_set_internal_memslot() check
      https://github.com/kvm-x86/linux/commit/7d2a727f44d8

--
https://github.com/kvm-x86/linux/tree/next
