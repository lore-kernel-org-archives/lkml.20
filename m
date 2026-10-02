Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0238E448388
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975473; cv=none; b=aPK8Nhct4j8qfODxAvZ0HfthN5knjVXbReq2mk1cM0CJT2gNIdkqrijYe/aEsEZvtv/Ir3V6QDZO4LkLZYEcLqkXZH9hz+ss0NyG9UkTMwkN6kCgL4MY6xU5rH2tyCwKMkc+Giqwhp9aPWHWnQir/BsEhOGzhWMTEwCeYwp0MGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975473; c=relaxed/simple;
	bh=4OJqPOL7lBDbFzlziwR1lbzs+pCfEyKnpIdZkYoT5qU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ig7a8uS7/kkOFeJfZEZ+SeQLDPHBCllizGGdRsL9EXn98M/EobUeq/hnYeJFSSA8GkgX0XQ1tn9vUgBkv5XwkzgJHGfOhXzmAaiQ9z83g+hV8hawjbjDxOi/0g6QOk3YcjXZmhNr2zdMiKMLqoHjvtrLYmj+DJgGOz5r/uocAvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZjkEsJXT; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZjkEsJXT"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so400065a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790975469; x=1791580269; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVEvejY8ub0y6DWWkkKmrQP5oPQlWXWvEpLrLoGD238=;
        b=ZjkEsJXTXftw5v2gMA87YqUnk9ibx+O93m9hJlpawaihft7wK4RjRDkNId1EX9TbU8
         CYqV3XJ7XcR9HAWNtvrb1maWhEmRkcE8hrPD+MhOdYht3+ohzoTteR2OOyTvraDILYJp
         y9xvUZfvz8YE9frgI3RK4dA5JCVVE0F2qjjVvTZGtGaYlNxpKTbuxs9N2ysQNEbLe4Jq
         FSWrPSnujEmah8vhYKCOExcPOCQQbNMRGumRwkZL3Ngu/toyP5sHAfBNTyVc3WjZyxc7
         zWW9iZ+g5V9mrkWS/KNqqX6rWXJ22mkACO9ahb5U4y1mBpL+n+aeNmi73QCiioEXoY3L
         EwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975469; x=1791580269;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVEvejY8ub0y6DWWkkKmrQP5oPQlWXWvEpLrLoGD238=;
        b=0Tsxf3bANmDLm10lMGTWexOYMSssLXr2/QTcrj1oRK+ZTCFAjrWTcje9/vh+VaxPI7
         aFoDJXKGnsgDHAu82d7Byk0b9qGU2ceSYit5hQBg8Ofd7f1LanTpKzw3kcHtl9Gt4vb7
         4ujg/LO/PUUAWsH+xG2QnzUtfOdpgHMurjIEEQ4yRyO39BgneHIKHGQY/Xc9qE3MEbMn
         Q9Gl43hdfblUrCKoyK1wxtm43XEeAv+jrMn7HzEoZcyMwzU4E3Vl8oxFF3ODSRMTfTi4
         PqC61V6GykS+bDcRcFvFozZTUGPojdwpfDeQlw85fXkepUh7nG4GEFFl4H5ZblbeMaSx
         WltA==
X-Forwarded-Encrypted: i=1; AKwUvBzKVIxsbD2pwqXPm1NzJ07j9QlJxT0TCUtyw4/zCyNfVdmEkKhzGr6XoJrnjkKFw6GoQpLhGqyw3mbJdTc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7FWmOaa9+SebjgmwV0mJxu19WdfIuzdBLM0HernT7d4mmPvvZ
	iEXmgpA2o9bMop4fydglCszUW+6b1zWl4FYq+IBwR7FZ65VRvGCDJKYQ7ph/V1s37xPQaXjI7i+
	8K0SpLA==
X-Received: from pgbfe13.prod.google.com ([2002:a05:6a02:288d:b0:cc7:865b:2dc5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7d2:b0:3a7:8350:49a2
 with SMTP id 98e67ed59e1d1-3a78350537bmr406615a91.33.1790975468419; Fri, 02
 Oct 2026 14:11:08 -0700 (PDT)
Date: Fri,  2 Oct 2026 14:07:28 -0700
In-Reply-To: <20260918113631.634233-1-gokul02k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918113631.634233-1-gokul02k@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179097463764.4067030.5907546688694730038.b4-ty@b4>
Subject: Re: [PATCH 0/3] KVM: selftests: Delete three pieces of dead library code
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Gokul K <gokul02k@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, 18 Sep 2026 17:06:28 +0530, Gokul K wrote:
> Three unused things in the selftest library, found by asking the linker
> rather than by reading: build the selftests, then look for global symbols
> in lib/ that no object refers to, and check each survivor against the
> whole source tree by hand.
> 
>   1/3  sparsebit_copy() and sparsebit_num_set(), neither called
>   2/3  the declaration of vcpu_set_cpuid_maxphyaddr(), which has no
>        definition anywhere
>   3/3  guest_snprintf(), a varargs wrapper nobody calls
> 
> [...]

Applied 2 and 3 to kvm-x86 selftests, thanks!

[1/3] KVM: selftests: Delete the unused sparsebit copy and count helpers
      [SKIP, handled in a separate series]
[2/3] KVM: selftests: Delete the declaration of vcpu_set_cpuid_maxphyaddr()
      https://github.com/kvm-x86/linux/commit/dd572ec94640
[3/3] KVM: selftests: Delete the unused guest_snprintf()
      https://github.com/kvm-x86/linux/commit/3bac3b77c5e6

--
https://github.com/kvm-x86/linux/tree/next
