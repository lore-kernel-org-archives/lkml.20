Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577647;
	b=GFQ5uySIdLXgN0aABghf+A9LumYmyzfnV/C02wJRfBaGDp8w+k7sfIMOb3XHnZfTEXfo
	 4Ck6u+YzZGhGFRz4/OLYLK516FuMs4/h1t11iKCgADimIu41leqMBEB/fXei1seaMUI18
	 pXzaNyivuH4cYDqTVlvPxvYJKHElM+9Lzz/qc9P1ukGbj1/VgXnnKczgCn4uYu+1ylean
	 H/0lin3nPrxLyBub7ix2qQAU+dJSR149674HjHir01kvgQg8EdJrLzXULIL4p4m46fmyh
	 pAEvexKbaJYWMPBUifapWZ4DrKzcjgfohxE6Uu6WYavQ7Z/DaESh7zcrsja+fQrxJ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=kLkSOcJpYReFLUI0Gi+43gyJKNu0BPMvCXqZSLQ886Y=;
	b=ODLkI8RN3MLXaTkdoagjhzDiIwcrKTxJynjHE9jDAEqXL4MVRugeP1J5/u6dEqB1LbKm
	 91o0qSR7ZQXxRh9cbMdRUjb3kSCsag1g9zL7o77T4K+TNLrJWfCpwIB7FCXN9scfj/b+J
	 Cnnpr7dmjgCnCj1bHa0K+ctpiQ5LSqFTjawAqXoLcKDhCoI4dwX4cHLpOwfpqvEcOcC1s
	 j3bXuqOQ0ni0ccJ07ZZ1scZQDDT6NSr5wkVeD02RKxaHu+MC0QYyKk3dh+c1DNwfNB4in
	 4KIvyFDnRcYCCBU33xRlAyWkQ2V1194MVXo0nClRwtAik6fMEbNxzc9ZdPxSHwZPHtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YN+3fIeR;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF207606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF207606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YN+3fIeR
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so629205a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577646; x=1795182446; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLkSOcJpYReFLUI0Gi+43gyJKNu0BPMvCXqZSLQ886Y=;
        b=YN+3fIeRCj5FYZK2CTRBYWPgIwK3Modi0TuaTLObsBjVn4ZWo35fyvSYP8SK8Q77Rn
         2pVkvHg89Posq5P80+RhszdyLd9K5Fbf0PDbWocsD7GSXpwA0dCVR433ZCKpIS10A0xh
         1rzy8p2bsSatQxBLLuTH3FXlhqyD8nSUxlfPe6mizkdlSVBtqSKKi/t4Q+K47ut1pXso
         wtq3SEtqTse0Is7KCEbXvTYXVm1xHs0uWzMmiNUfbdPSIDW8fPz0YaPCkGtWZM6K4Lfj
         hwX6bzueWtIzOsl9a1qMw2U3Si3NbD+6aYCQgOpfNRUUdVV7cD0R9HHWhBAaVumqoo5s
         HSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577646; x=1795182446;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLkSOcJpYReFLUI0Gi+43gyJKNu0BPMvCXqZSLQ886Y=;
        b=ZhTltPNX5GqHPKmp/732WMnjIqfdMoDiPeAb/vK+vJtwYzkcD5wiRFf+DwBMxmakoL
         PBqW59WGJqyzsCmQIK4drW45oVQwoKC3aGDfJ9rOTDpZV/OoBsd3Fqf45MWKhYHDEXym
         NPIcjQuwuQnJ5+Df/0G2C+gpepujFm2h0aeOo5hy0wv0pqst5uXJTXaLdXErEML/qs3P
         SaW0wlZa8rM/l9042BH+QJ1Zs+voH7FOqL54/WcWWXrbZVsMp475bzBrxseGNjHQljJE
         DHEaP6y1Bo5Pwu5nQXfc8Xy+ZPewVZzS1xsYbkBQLrXuY7ZndeDl5Oe1YUr8RLTdWAtx
         1rVQ==
X-Forwarded-Encrypted: i=1; AL+hErEc4E/bUj/9l21tGZg99WVElsNwWxGpePpTFHBNp3GvZTVpopDbu8ZGATH+FR0V9dJvYGBupophfOKaY1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fswye7ppOTlbPiTuHzBN437uNBenXaBB91j1L6V/X3KN7g8Xg
	wzQnrIcZqyDL5OqAnCkPJ+a3EdfJNhxYCZMyhsMS1G8vs9ENqB7sCZhhXvkMfHM7zUgqSgCDkiB
	eNtdUGw==
X-Received: from plbl7.prod.google.com ([2002:a17:902:eb07:b0:2eb:50b1:b505])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1647:b0:3b1:2d60:66cc
 with SMTP id 98e67ed59e1d1-3b1b07feb76mr2151845a91.8.1794577645893; Fri, 13
 Nov 2026 05:47:25 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:12 -0800
In-Reply-To: <20261017093016.32348-1-amirmohammad.eftekhar@cispa.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261017093016.32348-1-amirmohammad.eftekhar@cispa.de>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441749877.74221.21689652864513523.b4-ty@b4>
Subject: Re: [PATCH] KVM: nVMX: Clear nested.smm.guest_mode on a failed RSM-to-L2
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, 17 Oct 2026 11:30:10 +0200, Amirmohammad Eftekhar wrote:
> vmx_leave_smm() consumes nested.smm.vmxon into nested.vmxon up front, but
> clears nested.smm.guest_mode only on the success path.  On either failure
> arm (nested_vmx_check_restored_vmcs12() < 0, or
> nested_vmx_enter_non_root_mode() != NVMX_VMENTRY_SUCCESS) it returns early
> with nested.smm.guest_mode still true while nested.smm.vmxon is already
> false.
> 
> [...]

Applied to kvm-x86 fixes, thanks!

[1/1] KVM: nVMX: Clear nested.smm.guest_mode on a failed RSM-to-L2
      https://github.com/kvm-x86/linux/commit/bcc359264f15

--
https://github.com/kvm-x86/linux/tree/next
