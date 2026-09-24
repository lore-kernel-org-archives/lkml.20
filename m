Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548354EFFD2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286905; cv=none; b=ehnNbrkqUnMh0k/9P9IviyVXOtyvo8770U1f2WBjw+28Pdx2cPCPlL3fmbAXDcAjo4imMFZq51t1W7jCqVk7RJkXsCdn6Z59/TReVNYDuW6d1Kbj/1i+8HAXafTM3cB0v7kr7yoGYx+N1NgJ9YkMpao9bfC0E3UQezGGq3mzBPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286905; c=relaxed/simple;
	bh=wANjnZ6VjHCT3Et5duiCN/uEpRPHOryOydD78oDxXhg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Tsjeb6dIHSO0Ub0h7FfTK8nTZt9d/rqVjwmDuYV8cGzuH8aAttragaPe55Bq6REwqVUxIG3KQjYsairJB8FpYqmR8dbwrkSG+xz8sEwjuRxDf6Tvm5eLRT9Y0YcMa3ytlIaHr6xdFOKsqniOp6rdd+sc1SL2x3a9qoyvm2dBMgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=isFqEYi1; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="isFqEYi1"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so308240a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790286904; x=1790891704; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dc/37vZOnRoLP9xi4DdWqpUDaxAkc6wukk/aoyxwa2M=;
        b=isFqEYi1TPI4ecFAPQDGSUMnnaJrjULGOQ4xwfRz+TtEmr84ule3MtyLnFmY3tvkEN
         /cA08WXePcHHcXZUV9fHXOqaIAAE6e3HxO3bYtubBFGq1phfe5noMQNgepo/fgH97Az+
         UIisC0yDGQfQG/0mvTz4qMj8dM/0LUZGUi90lUduF6OghmEZO7UYEQ7iEobaQMphC9Sg
         8CDNlaWq7fh04glEgb4rpfVXkEYdLK3g+04SLkLm0uVPAx5QETq2cTg2cBq/e5HWSCL5
         DdoZqIB4fZFjxOCg7pljUTwRCXDFz9PY3kUgXVXUpDwHRQu4926NELv0a8Vs9Vy03uPx
         99Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286904; x=1790891704;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dc/37vZOnRoLP9xi4DdWqpUDaxAkc6wukk/aoyxwa2M=;
        b=xNjT+u11mijq0ZrK6mk+EJHUaGdtvWK9KHmDOE3PE+/HkKMCnsVfeiKD6a18/DqieE
         Tq+l93FtLJiJ9R+mHBv4tR5Ak1eicymxV1oXrMcohTdFNpkm6qaNqUK7wRGZovozHEJp
         YqiTcollTEPu66E2ZWLUWSo7M7db8udkKojwZNc9jNImCXPpY6FdKUKSjeeFAaJOAyMR
         TFxWWq0ziqSIUsZtYfCxflbOQcNafVRbovEvrsO/uN1NB0ioBZ/zDsZ6St97mAGcr6B+
         wSLLiYLe3i8C5YCxpRkBbpvq8urfEhbHT2w0Nsv9H5FtZ6xBzQkztX1cx8G3egImU5mt
         GXAw==
X-Forwarded-Encrypted: i=1; AKwUvBzzwU4SgFR1XF7uBPflfqWAvxzMkyTe2y352HFRfy1r5/vGggIcRHDS3gBHy7QKFLeePHcP3wWTokbXLEE=@vger.kernel.org
X-Gm-Message-State: AFuF++me8MCXR+aN3CN/V/svZX+yHWvzfZjlQEQxqL/WiBiuo779+XZN
	1+tiiK6+TVFmBKhTKG8kvFrnspQIMAisx4Uv5pk/8PpxYbIVutBwZj7PzpUycICErXoPZ0rT6Yo
	c8ywb3g==
X-Received: from pjre4.prod.google.com ([2002:a17:90a:b384:b0:3a0:618b:a5ab])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b8f:b0:39e:6c69:f478
 with SMTP id 98e67ed59e1d1-3a098cf4ef8mr3712540a91.55.1790286903417; Thu, 24
 Sep 2026 14:55:03 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:52:05 -0700
In-Reply-To: <20260921235656.1107929-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921235656.1107929-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179028366129.2006410.7179106384799013251.b4-ty@b4>
Subject: Re: [PATCH] KVM: VMX: Formally define KVM's "0xdead" exit reason used
 for failed VM-Enter
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="utf-8"

On Mon, 21 Sep 2026 16:56:55 -0700, Sean Christopherson wrote:
> Add EXIT_REASON_UNDEFINED to track KVM's magic "0xdead" value that's used
> to stuff the exit reason on a failed VM-Enter so that the magic can be
> reused by TDX, and to make it more obvious that it's an arbitrary, KVM-
> defined value (though the whole "dead" thing makes it pretty darn obvious).
> 
> Opportunistically add a compile-time assert to ensure the KVM-defined exit
> reason never collides with a "real" exit reason.
> 
> [...]

Applied to kvm-x86 vmx, thanks!

[1/1] KVM: VMX: Formally define KVM's "0xdead" exit reason used for failed VM-Enter
      https://github.com/kvm-x86/linux/commit/d85f7dc8cf3c

--
https://github.com/kvm-x86/linux/tree/next
