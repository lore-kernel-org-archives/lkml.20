Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887674ACC90
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999655; cv=none; b=L4bd2PcMNn8KnMXzdCySXkeLlL/YdAPliGDhA0djnTm8sEc+0QP+eu/QnTGuehbP0sDf0n7rEVWNhQ59KSaT3WGWluU+jmdTamdo7rnBXqCK7F1Qe+skzWsdHEE8Y1AM8fHTHdtt57S/NNy9HDROimspG3b6IFtxtOdtgTK+ErM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999655; c=relaxed/simple;
	bh=ph2cExDaQRQOwHEuFpPe/53YJaqNaEO2h1aVyc1Vvpc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gONUtBJfq5DK2MeAvAKEWFLHhX5bNe9SIFMj4hScVMUW9ZffQhRsDVVI5FRNXts56P3JP+2Nsgor/LNQn1Csr37JQ5phDqxgCB5EZrZiV4KJui7wJzOyx2HExwqXC0X63R6yP+uv9OwahoIa0ftMyM3UVVeIu2agI92820/+Ue0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dxXJYEfh; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dxXJYEfh"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso75247075ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999654; x=1790604454; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQJ1GYmLnk2RvPx8au14VoaR+1x+bzghWulma+pPMno=;
        b=dxXJYEfhxkwDaxKklG++KTrJbWZ5yavCjUmeX5Yc7cpRgkWHMEK2pPIgEXs17cAq0X
         p9m6UFPTbgOBkXSXD6/u8p0gO0F0vamXHQRsZ0dQr9dYzn6UscefKwQju5pog3zP4nWN
         5p2Y9T21ey6/vKPlZUUSI/yyhqNZc1Wv5l1Z3wAj79j9zNsv4Pa7pEXvOTuYTuyoxI1D
         aO2nfKhX+gwfM0RFKH9SrLvzpBQs3jt8eAX2fh5oVPYdcnWakFU1BIU84zHctOXJjmvQ
         nVXQqFGbuV7AU1QTMrQPf/RFu3UH9E534EHEr+lnIjxbvLeCfhsjbJmQx8zXgx3MO2ly
         JgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999654; x=1790604454;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQJ1GYmLnk2RvPx8au14VoaR+1x+bzghWulma+pPMno=;
        b=mA9Lnpbr76BNoeSTM8SUMs7Krg0XgX9w9BeeyMhyYSKNCNpxe1lBLSPx1ZEUStGy06
         2aw5LZYF5JIQR4S0VXbqLHYijnk0mi4u84Oc87eh8d9PeOun6snqt2GDU7le5oL4V4+n
         8S+JsLPU+Twbe64u9D1tI99tSXM8ceXIEefLXZhLtzRJ4OvF9GZSFXUfWfHK+jsUVDVt
         5zWmWAfoJ4GVlcC8hSPxPaAsH2V7G3iaCOCk2zdI61GcCLqVyc4VHHyznQg6MPTt8hm8
         2QlfeT3cHuclaEyJaLOBM+cycetXE1OQxLalbXvXihcndNdMPh5wNiTcQFxktT8ibvmg
         IXYw==
X-Forwarded-Encrypted: i=1; AKwUvBxa9KS27JnnrsQNImxmZNowJQGYQ1aBlNR6SoC9KXes1U2meFkACrk/CiiWufJRVueTWHrQtbJJvECj2aE=@vger.kernel.org
X-Gm-Message-State: AFuF++kSGyPL3S1YbMX7dlCpRIBgFMbdwi0ClzA+HvzWtDExLDU6aqN0
	3dKtAHMHpH4oSH3ImhD7xjP7xY5w6qVMjrDNLhdmQHZlhk8r019eRjgVNhsfeNtBAAvX7n3Ofjp
	9mE5hUg==
X-Received: from plan18.prod.google.com ([2002:a17:903:4052:b0:2df:500b:1a93])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:bcf:b0:2dd:c100:3141
 with SMTP id d9443c01a7336-2ddc100323cmr69307015ad.61.1789999653610; Mon, 21
 Sep 2026 07:07:33 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:36 -0700
In-Reply-To: <20260907045246.3783304-1-nagachaithanya9911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260907045246.3783304-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999930529.756750.6445682647618178643.b4-ty@google.com>
Subject: Re: [PATCH] KVM: selftests: Fix the never-true negative UFFD delay check
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, 
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: shuah@kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, 07 Sep 2026 04:52:46 +0000, Chaithanya Lagisetty wrote:
> demand_paging_test parses the -d option with strtoul() and then asserts
> that the result is not negative:
> 
> 	p.uffd_delay = strtoul(optarg, NULL, 0);
> 	TEST_ASSERT(p.uffd_delay >= 0, "A negative UFFD delay is not supported.");
> 
> p.uffd_delay is a useconds_t, which is an unsigned type, so the comparison
> is always true and the assertion can never fire. GCC points this out with
> -Wtype-limits, which is enabled by -Wextra.
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[1/1] KVM: selftests: Fix the never-true negative UFFD delay check
      https://github.com/kvm-x86/linux/commit/25158cac2d15

--
https://github.com/kvm-x86/linux/tree/next
