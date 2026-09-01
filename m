Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB98A43303A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275221; cv=none; b=iBnbObK/Xs1EeavrXnq3n9svjn5yhoy89bWvS6VI/+0lXUeLHTRF8JXLPPh2QisYN7V7VmiPLU3TBGMFnX6mapAtKhfJZj6PLaD98Yhu1JSDPSNTdcXaBPxyhYxonQGifoboGmcI6vzXzSjJbZZViyLoLxOV6rBKcLdMW5iRPMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275221; c=relaxed/simple;
	bh=IO1d1IK5naV0clT1y60mbzjUZ1i1Ufx4f9zvROWWDdw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZJKA7bqqDzIrT1QX4fN8qBsA0vPthO+sX3mc/FeCOU4PcfTXlG8Uf8eNQ+HXO4UrHGDZfz9WFoes1RY7+nj3m3AmwfQQJh4I5hopKypTK8m4ks0RkHjBdP9OafSQolcyR+Sm8eO38QlGR+nMJQWVXg3SKa4uP/tPeiGDYt/L/NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GVzIIKHI; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GVzIIKHI"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so2723835a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788275219; x=1788880019; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gW8X5PJ+vB6MltrnZZz8mv0H9sxjQGZjiNCW3Xegwfo=;
        b=GVzIIKHIkORbnLsLka2BlNxwyaZaKuD/ztZeqjB4UQ8IPy7P/64cQlHS2BufEgA31+
         E8eTGRxo/b/YI8Y2TZbbn9ENA+r/b2ZpmssswX+U5FhohtUXPI12BhLXSdjeFJI5BWkx
         PgPGAM3KOrYoi85s+jMH0a6o9o9rp3Rr4MjGcdAGEdE4ysQGu0IuGKLi2OQLmv11ey5d
         4NzIsabObDT3jV9XuU0XMJgD60ts8+Jv1pi4+2FEbbmeXhZcuxSn8jP+ArfUFDzauxy1
         dk5KoazzVo63Q0/mzsNDyPDfCoPxHgEB+2r/LmiCDLsMdSQFmezlp8mwU2OpcxUXAfvG
         ff+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275219; x=1788880019;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gW8X5PJ+vB6MltrnZZz8mv0H9sxjQGZjiNCW3Xegwfo=;
        b=TGutn0laddvmbj5bvWh7iH7IFMtZI5EZaDfMxt3CHNXnADVkIxc26VGfvKtv9UW4lP
         tjJ91baeCI474k25PpHKT/h0PGqpLiylrSTQfsXqJudZbck4lNX45TOZCEJYcdbJeGwf
         L8GLFgBlpIbd+PrO1ujY58ok0l79p3itfPnKirB7GbWlqwPnymFLJ+gxg5u9DlBEobPX
         /woV+lJKmtMwy0g2QI+jfMGN89zzcJxX/PrrNL0w5cpijKnQ4k6mhL9aCFh6SW8YWO1W
         PZSNZjp9Ah+oQSnqTQGADkXD6PtBve/0qrYD8lWmzC6T7RczNIrzdFbr7CKss2xsqE8R
         QPMg==
X-Forwarded-Encrypted: i=1; AKwUvBykcsfTjmHSZADbuKVzl2WnrwSwjlXcT13mNiqdj/w0s3mSdMRMUmQ3dRrRQMOmWE3kqPznCzPmvG/M/yI=@vger.kernel.org
X-Gm-Message-State: AFuF++nlZAcXQAS4+C8pdTs0yZKKV9PU861zSN2xZ0WO5jzRJbWvk5oR
	AvS/+D5Yk54yZM3KaCxw8ujNSxS8mnAAL14CAE0nqrqJSTa0NI/dotafXBZSSCmKt5rMVj9HJ4A
	yigsWqA==
X-Received: from pgee16.prod.google.com ([2002:a63:1e10:0:b0:c9a:53ea:434a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f0f:b0:380:fead:448d
 with SMTP id 98e67ed59e1d1-396d0fd2a75mr54462733a91.13.1788275218580; Tue, 01
 Sep 2026 08:06:58 -0700 (PDT)
Date: Tue, 1 Sep 2026 08:06:57 -0700
In-Reply-To: <20260901-gmem-selftests-fix-v2-3-5a273153354c@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901-gmem-selftests-fix-v2-0-5a273153354c@amd.com> <20260901-gmem-selftests-fix-v2-3-5a273153354c@amd.com>
Message-ID: <apbqEfeCQhgdAvKa@google.com>
Subject: Re: [PATCH v2 3/4] KVM: selftests: add get_numa_mem_nodes()
From: Sean Christopherson <seanjc@google.com>
To: Shivank Garg <shivankg@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Jim Mattson <jmattson@google.com>, Peter Shier <pshier@google.com>, 
	Ricardo Koller <ricarkol@google.com>, Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Sep 01, 2026, Shivank Garg wrote:
> The xAPIC IPI test uses MPOL_F_MEMS_ALLOWED to get the memory nodes
> available to the current process. Move the query to numaif.h as
> get_numa_mem_nodes() so other KVM selftests can use it.
> 
> Call get_mempolicy() directly instead of using the assert-on-failure
> kvm_get_mempolicy() wrapper. The xAPIC test already asserts its two
> node requirement.

NAK.  This is not an improvement.  get_mempolicy() straight up should not fail
for this usage.
