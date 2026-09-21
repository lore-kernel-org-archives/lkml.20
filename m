Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0B74A3F34
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999718; cv=none; b=N8LEcI21Wqg2PyUfmY3199jdeLB7R0JgT1flFvmWf+/yYftSJ6Ymt4RGF//kPxEmI3eCqd8rX9IiWKvw0j8/+nJwyWUDQ5FNUrglWzrjekyY3oIxZY8nwJ6ZKhgv1tvPVwjDkVC94UIygKDePiTNQlu5CTQ33qtpl1PN7sFwnZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999718; c=relaxed/simple;
	bh=8CDei7I2dwKtLMkV4KDigeNWCjfyQIhXMwKsrKI5/i8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eNikuQiS9vHSrIudMtJoP1oDXWBh/NU3YMv/5nimufUZAzJs5OsImKWtHDwOW2+/0BMNZZHW+uHZ9ZLnZwj66QVt2WyIAm4pkijzdsLKTh6PhbadI+UTTAbK8qJxR49daAxrfa6JupCLZqC+REnR0ZnfLIdKQg6YoUjJbDi2lt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=swXQ/nQp; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="swXQ/nQp"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so3008651a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999716; x=1790604516; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ktenTgNfl0o5XPgbYG2l9v0n5O01ShbD6SpvOdfsUBg=;
        b=swXQ/nQpGJxl8rPWUedpPEh2Tz6g7fxvWjRvLCTsZ7djHddeaPiHGfTsyuqNTXa/8h
         xMrSwBac2dIcc5mIjBw9kb+9A3E8frxLNQflkUpyRzeq1yVs4Tgcn67gf8yQXKD9xDvh
         N7HzXjVvNy06DJghHPJrTxbI1PYedeZ9EcVgv2iuWJG/TRMOLKD7X2ZLMzXumx4HF3Xw
         raCFmRYFI6mU5wosbamiw1O3hNi1JgM9IFqHfZB6LhrsvOsyGm4lqpvuPLq28jWKe2Ea
         wc91EaMjYjQou88PiFDpqtwLVmksOpHSbK/dCSVBHUxwg7o/WuC7TlYolN9bBiwrmikH
         x8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999716; x=1790604516;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ktenTgNfl0o5XPgbYG2l9v0n5O01ShbD6SpvOdfsUBg=;
        b=KaPaIMoLcpO9GHYsK8syRGencGYcBeBaoQkGWxlA+o56i5a6SHPds2LMW9eeAvGrZO
         gJmhdruhhgjdg4Uod/VxmZkwRCXmuBBoAdlpzgUqEycvD2Fjn86hfpMKG+H1zxBwU6Vb
         GABnczA8QXI/DIgAdYqxNokuB7ssuCpyGFjFBpJtmGgSyt5lGGjuBg+x/yVyDnhnwwUa
         P5Zgu5qharrP/ydBM7uHjOyURnWZ4o7gFkVm5Sax/QdnizsGt/laHoViwnMPjIWr6ni7
         i2Uv4amGtuj8YTvG0upwSxQ6847fvI9i64fWPuP//XZKdIF+eDlxwReCskE0ZBeaVkSM
         zoNA==
X-Forwarded-Encrypted: i=1; AKwUvBxiL3Ba6cTI1Jqm+iF+r+/nqna2mNoqa+VEHOf0xDTK5pfQ1foaHxTxbR9afYGUU1lXcO8WzQ7ik7wkOQU=@vger.kernel.org
X-Gm-Message-State: AFuF++l8PpNM9g16OPgCk3xNnrLskz8T9TeoJP6PNtBwJHS9aZIRxu9g
	RP7Z6yEGgxwcuO1btXILo6l9UOgNevg8vae95PBh59HtlneSVR1Di4qcsmjBAlgZ23wgdP2Bvx/
	rnyh3Bw==
X-Received: from pgcg11.prod.google.com ([2002:a05:6a02:14b:b0:cc5:2a1:89d1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9204:b0:3c3:875d:7053
 with SMTP id adf61e73a8af0-3dd8c2aa877mr15946660637.8.1789999716501; Mon, 21
 Sep 2026 07:08:36 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:54 -0700
In-Reply-To: <20260806170602.4112602-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260806170602.4112602-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999690496.715919.3769178910150533654.b4-ty@google.com>
Subject: Re: [PATCH v2 0/2] KVM: TDX: INIT_MEM_REGION fixes
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Haotian Jiang <jianghaotian.sunday@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Thu, 06 Aug 2026 10:06:00 -0700, Sean Christopherson wrote:
> I completely lost track of this, meant to post these patches weeks ago.
> Compile tested only.
> 
> v2:
>  - Fix an off-by-one bug.
>  - Use gpa_t instead of raw u64.
>  - Tweak the order of checks to bundle similar checks together, and to perform
>    the super basic checks (alignment, size, etc.) first.
> 
> [...]

Applied to kvm-x86 vmx, thanks!

[1/2] KVM: TDX: Reject INIT_MEM_REGION if number of bytes would overflow a u64
      https://github.com/kvm-x86/linux/commit/7c9a2e3a4564
[2/2] KVM: TDX: Fix a benign off-by-one bug on the end GPA for INIT_MEM_REGION
      https://github.com/kvm-x86/linux/commit/872aae89167c

--
https://github.com/kvm-x86/linux/tree/next
