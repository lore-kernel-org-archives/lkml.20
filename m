Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577866;
	b=BnotfS1Us0vGPr72Dc6vAL9G902hQMdwRjE/DAQiX7kMXzJzeNNCAhZss14YgfpljmgH
	 MaKm1OzJzDn5OyiGx33Hs+KwFMRlMJyZTZ3Y5Gw6BpGhCNIU2EuU2hzwj3N0wywB0U02T
	 9pzpj/iwZvX3342UECgH9kmT7kOnzjfL3nK9GcJ1b2pRbw0VE9bUrxljn9Oun6+kaLYHz
	 w5UifvjYfgdkTX0lJOTBuXIEjYXArbYNdW1ZbrtkBgHWnNeCWGby6Rlswo+b+lZ+o2wg4
	 h2mmFFUgnAvM/2sQ1M5msBdeIxblcrJDML9pJUtiuMJRiq4wfchouVbbKZ+G3oiGFkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=kXcht9P+JlFAWDjvNBwE3nXsYUOs8z+TyJ2+cP3q9Yw=;
	b=27bM3JkICrG9CpI7PtSsvODPb2CSDHh5VNE91cQ1zTAux15SbMFVWLlplRLG0TnKGYkF
	 TBFpYiVO2iOJaGRMNIWD5wE9/HpccHSXkj9NxQ98/effm6nyBGf4IoWauwFHVVPxAfg/E
	 L9zjftg6Cvf0+G3Xczrs/MT8nTwJIbIVzBaVZXA51EKj1q8arhXjdrzu756N41q5zwWmm
	 nsbXm5SvgWO+U8dpRJYcvhYb6DWi/9gkMDGhJgYvUpsJZYVGXTS0femoVc8lNLx4Yj+OV
	 cgnNQK39cDMS6X630+1a5v5azmsdvNNd3rnvDjqR9QzNtwcXDNpIr92Vmrq3qAtNhYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=omzjmy47;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16D7606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D16D7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=omzjmy47
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso766094a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577865; x=1795182665; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXcht9P+JlFAWDjvNBwE3nXsYUOs8z+TyJ2+cP3q9Yw=;
        b=omzjmy47L2fSY2Y5fdXegm4426L+6ApFXYiWB6LN1Mc5oWkRVfyCO6E2LgqN9lQ7dL
         HI1q44cMbtFmX//vHoaDda0vaS6GzVkzcfgAyyv04Lim/nb8G8/nDgjF/u3urE+g3G5+
         ym63ZUYL3nHosUBKGwMw0gWSJ+fIOhWRwfOSSeNcz832T0OB5usjffeRL3HZd8oLnFE7
         Hajg1uoCmFMoN5Jg3TPtuCkH7PNd3+9gFHreuhCCRJ0u2CMtGswQpABzbPlJSIZtFVFp
         y/mBBMgT6z2Jf0yjOlxEAfDVeTs0aVY9li8mGbltauIjwQB/o/KA+tIQV9TizZPHveeu
         bUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577865; x=1795182665;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXcht9P+JlFAWDjvNBwE3nXsYUOs8z+TyJ2+cP3q9Yw=;
        b=iF5jBw3nwtbhc0oYhMBODsaR1I1XB3cTFa/0Ov21zXgpFaPrPIhmZpBOsMr0hf1sao
         EManVASMEIMsFluf5Oqf1zCg5H9twhfPt5zNI6BaDOpKbx4lwlE94WT+8dbsRvbtnuGG
         Wwvkf8fI4eZvLuU1Nbh8kN35K0bisUVxFzTJS6l+pylwWo5mUsLhBM/zNCODd5IazWdf
         SatKMHKCB8tZNUck1LjBmA/vtLRc+EMCuLmQdD4zshCcD8GLexjNlBCejiYhpT7WnmuA
         fStJBTZ8PONDciR+Aecqo1F/vhlTu3XjQf00jmEtZDwEOv6GpNDQ8dW3cGLdYjG26kht
         CyMQ==
X-Forwarded-Encrypted: i=1; AL+hErE/wIqRUuq1oE+uNin8MuXdTbt4wpuabH0DRTXyah5Pyuu3rcVKoVPJo3HGQyfSJEJXsfmSevpg7+gKBJg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y3PC9K1LbN98vV7/eMz+bIya9JsMd8UDGXVX8jZY8AcO7Dh1g
	VLFOan6pMCr6+cNATV46YGg/jijl/saSoy0FLa9Nrez8wtBL0FjbWg8oFRjMk0apoxfSTuo+VQ1
	5SmfYOg==
X-Received: from pjbqd6.prod.google.com ([2002:a17:90b:3cc6:b0:3b0:979d:e867])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5906:b0:3b0:934c:5e41
 with SMTP id 98e67ed59e1d1-3b1b0b4acecmr2199158a91.29.1794577864940; Fri, 13
 Nov 2026 05:51:04 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:06 -0800
In-Reply-To: <eef6bc34bdf7391c5d3eb4b1ba5e97819e22ae8f.1791542392.git.priyankamani2100@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <eef6bc34bdf7391c5d3eb4b1ba5e97819e22ae8f.1791542392.git.priyankamani2100@gmail.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441834884.81867.15216676468170040644.b4-ty@b4>
Subject: Re: [PATCH] KVM: selftests: Fix ndata size check in test_mmio_during_vectoring
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Priyanka Mani <priyankamani2100@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, Ivan Orlov <iorlov@amazon.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, 09 Oct 2026 11:30:17 +0000, Priyanka Mani wrote:
> test_mmio_during_vectoring() verifies that KVM reports the faulting GPA in
> run->internal.data[3] when an emulated MMIO access occurs during event
> vectoring.  kvm_prepare_event_vectoring_exit() always fills five entries
> (info2, reason, info1, gpa, last_vmentry_cpu), i.e. internal.ndata is 5.
> 
> The test, however, checks "ndata != 4" before dereferencing data[3].  That
> predicate does not actually validate the array size: it passes for ndata ==
> 3, where data[3] is out of bounds yet is read just below, and it spuriously
> fails if ndata were ever exactly 4.  It only happens to work today because
> KVM returns 5.
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[1/1] KVM: selftests: Fix ndata size check in test_mmio_during_vectoring
      https://github.com/kvm-x86/linux/commit/509f344f9480

--
https://github.com/kvm-x86/linux/tree/next
