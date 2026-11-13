Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577787;
	b=xYfCmGb9x+j7AbdKseSOl4V74ELXyBhZ5csUXSvJ1hkRJcY3/DQplpHR0Z+g0UoOBhPq
	 3be5nVJj9Erlf34EOuW6ZcqapU0wEC2T30twBSOKRcpWEfpa62sT1goGtnN25Hjk12I61
	 cAqWd6Q/e9/e4qNM/7W1NXbkFd2SnyM+Q94d5lzkc7XS04iwtwTvmTel8OC2qbyw9BGth
	 M80cng9CL1HEDJcbhFIjaeaIzW4cTFJuvzxMF1EghCYLOc/XgSMOXOslcCDNQlHZKC86d
	 Mj/qG8IJ1TZeCJtPgfO0bE3+bi7Y1pIyR3UW03fzRIKwq635Y3LoTjCBA4tUVi/6luw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=JhiXYpkQzjLGTthVjpwYYHAyy2NJiDkV7bui1K5fAuo=;
	b=XONq/btrsyZTeQnsdYViibjFeVjPPhacJ51jeM26rEzkB1HgZWXNqMyZg+f7YJ4HElwi
	 D8d9neuqfJSqcHR+PuHZoF6L8N1lCHUb7xSRCN4NkdntwcTDkrLsDPxLZq27ZvpxGe0hu
	 EC3s7uy2QUKZMBi4hXsq7yn6FCXr7zioclPC4eFm9ycsDLcHGzC+QFchle5PFH84Ecv1n
	 ir1YqdamQGL1kqXjxRu0v3ByR82f0xlgNwrinut18pVrJn+RrVEyYWFjiKO9QU07TYTpx
	 IPm6I4bWrOaPfFAMY7SMvfhuMcwAdhYMzFLo8gk0RKIwOFsdteeGyWc42htS0D6uGbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Zog8kNj/";
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632DE606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 632DE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zog8kNj/
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ee184a2474so4046865ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577787; x=1795182587; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhiXYpkQzjLGTthVjpwYYHAyy2NJiDkV7bui1K5fAuo=;
        b=Zog8kNj//F+tJ47iZ4rd/vRdwfHcPmZr5PIpEYASYfSU0uIpdAaAQbKb2iSjKuGrJC
         LmUEbEK0fotsAIirWG4OVuVjWqDlP7pjuqWSA8ipK/qrk7DYRZNuaVDxOvHgO8kfS5gP
         iAjTP1uaV81zzy4WrR3/1ArFc86+k1PfnfcpRkgSeqWInm7zP0pERW/SD5cgU0GHTp/g
         QLtTRskr0/3u+qWWtQxU1Y2cafkDY01Es0N0hG0T1L7SoYF7+CpvMvrqir+NdpRFWV0W
         0f7V7cL5Svjza55mLbBuxfs/sAB4CwLy/CiFck2gS9zBwaFsk35GRMhzzzKtluEwoiP7
         jd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577787; x=1795182587;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhiXYpkQzjLGTthVjpwYYHAyy2NJiDkV7bui1K5fAuo=;
        b=HTBOcC+yQxb5YDNOj5tJKUsIUuhuwGQYkxInB3vAUEKuasI0s4ndp2MyLSdFt3S7bM
         1P1w35J1H30Url2xzrW9sv3P719wF0gsyi1MILDvVBn3de3ATTY1903P+miiyWntCLVo
         mCUN0PIHHoQsOTjoQRym4P58tHjo10wfSvjYT2mRXIandGK79JC7OI/oE1YHphneIYU3
         3Tc9++05ap1p/u+rpmKo0Ruplz+TLCjCHjgcRH/176i0NIRyTQLO1FrznLmkl3L30LMf
         3VlvnbSUVVXRvMrnTjOFvQSmsaJz/9AxnkZIhyWw+refWWtVWklGGTQ3ZwiRTZQyJEtS
         f2dg==
X-Forwarded-Encrypted: i=1; AL+hErGChEcHaPrJbEdtakmJwj6Alm97SLfE8s9D3TEvQ4hMqXiw22WnWNwuJTsxDWPhDt+iyW6CtI+pll9CttI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h5zb00JVhARabCJXNa8+9l8maOGBgBdWRe4zhg/l1RfgCXw//
	6sf6cL1zq/kt2jMmb24B+9mYkkyWq5YaiQbe2GmbE7WufT3lnVAcsWhkN5xmCV0XfrASSFXvGH9
	sp+fKVQ==
X-Received: from plnd4.prod.google.com ([2002:a17:903:1984:b0:2e9:6b18:1067])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:eccc:b0:2e8:e17d:c8c3
 with SMTP id d9443c01a7336-2ee0dcd18admr25455115ad.62.1794577786632; Fri, 13
 Nov 2026 05:49:46 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:44 -0800
In-Reply-To: <20261027001600.2742995-1-ingyujang25@korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027001600.2742995-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441787804.77218.13995076862430553653.b4-ty@b4>
Subject: Re: [PATCH] KVM: x86: Move PIT existence checks into the PIT ioctl helpers
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingyu Jang <ingyujang25@korea.ac.kr>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 27 Oct 2026 09:16:00 +0900, Ingyu Jang wrote:
> kvm_vm_ioctl_get_pit() and kvm_vm_ioctl_get_pit2() always return 0,
> so the error checks on their return values in kvm_arch_vm_ioctl()
> never trigger.
> 
> Move the !kvm->arch.vpit checks from the callers into the PIT ioctl
> helpers, so that these error checks handle the missing PIT case.
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/1] KVM: x86: Move PIT existence checks into the PIT ioctl helpers
      https://github.com/kvm-x86/linux/commit/9e03a08bda04

--
https://github.com/kvm-x86/linux/tree/next
