Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C304DA9DE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158891; cv=none; b=bI58hvy1VEQ86S7lSY15CTmKviM/jN3N2bkFpxDGj/mmHGUDMSISf6ChLhsyfWUHtS5GKF5ot9dgavg8OLkuzC7IUX0jD9CBImVPQ2amxza59J9b5lmCixfy9FcsH07IJ0kKAnMtmglSXTMak5mmeRX2eJHIZkr+OqjuPrtbIBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158891; c=relaxed/simple;
	bh=MtJ0ik1ndDavv9Uk8j5nIXbHkpxx1+MX3cuEVSVW2u0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ILeVN1NHIHVKl8OmqTXJXXccofxZIDyMQ0efcQ8WmUovo0uo2WwSIn4+6PIVhcZ1n2xoX/Nyc8uegIaY81BaVjVwZ3pMyjgkfNmQ/QiHs5flMxiHoT8Ad26wBaPlc6azShlQKZus/7mZVI1J5jLb9dBOplrn8C1fAASG/AX5eAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BrPn+5U2; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BrPn+5U2"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1721559b4so66954955e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792158889; x=1792763689; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q2telF00vVM3XLDo3RDg3FI1UZeVzx7pDk2LUXQEFH0=;
        b=BrPn+5U2Vhk8/kMT1Ei0gsmXkqri/D0K4WD7fcPWk1BrnNqiTYZo46o9iX0YK84UhF
         H3s94VbkM4K+12y5RZak2iXxaNc7VIH9wR3q66vzypVhUMa0uWL3dB6oCHVE4edWJx1B
         4HzP+AqA6QY3cc+ykYAkygr5UguMGU9PQ0op/Ea/pJ2lQw96QJ0Q+HZTLrJfyl8p6QKo
         ZsekhuPzkRGckI00l6BM8hYUzKWMJQCzFX3M1jNNB0TqHH50sBkh12P2NPRznIeKjAOF
         bths/IroIIqO8e8pqcwsLjXcb1qfPm1Qy+/VqkCtti5+xo7bkx11Yuv0aNv5IAKGknEC
         88OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158889; x=1792763689;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2telF00vVM3XLDo3RDg3FI1UZeVzx7pDk2LUXQEFH0=;
        b=YNqRe6nhKbnK/stmnA8HtK+lhwFkMCXfnINwfirtr7Eljbeqzv40szNDP2M373ovvR
         RgJ5Re6qkfUduZtlV3/RTu4opjL53vBGfT8vKgWA9EPWsIP2AeG/kEhJKJRDHZaW2ocR
         XY4GGkixM42U1VUf/u5vzQ5A143fUikY72JBeIIKt72snH6XMv2HlFpTaAxknHtvlWxM
         w2tyQsufDjYlY4BT3sa1OU04WZM7WQrN7VJMo24rmyy4HJSf2bBP8Igd5y75bwvVg97D
         aMEsKR+BczKCDwGNaGM+pxmU/E9yqKRdvfHNozRYa7UuJ9MsNSrtPbN2Cc0MHsyGj6VM
         k2LA==
X-Forwarded-Encrypted: i=1; AKwUvByWtA2fF0NndppL+GntekRsp/QBYVI+jC4OrgOLNpLjw8h+96drUYN7c7omRzVp62L/PKk0myqafSOy54M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvl1rXUPoA7pGsVf2BBy/pkGRzbEUXNFKwpQ3YvXWTBu6JkIVO
	89mRmFyOf4SrcD8nnPd6j6Iiz36OjCRwWG6dSLjPxGjve8H260bK9fuAeZrsYKrCIIOeOb67Tqf
	W0SBVAJUwAFIoAH7ckA==
X-Received: from wmf1.prod.google.com ([2002:a05:600c:2281:b0:4a1:91fb:4150])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e8d:b0:4a1:7701:f863 with SMTP id 5b1f17b1804b1-4a18e4aeae4mr415823135e9.15.1792158888314;
 Fri, 16 Oct 2026 06:54:48 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:54:39 +0000
In-Reply-To: <20260814230923.1292966-8-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260814230923.1292966-1-dakr@kernel.org> <20260814230923.1292966-8-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016135439.44716-7-aliceryhl@google.com>
Subject: Re: [PATCH 7/7] rust: drm: return impl PinInit from DriverFile::open()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, acourbot@nvidia.com, daniel.almeida@collabora.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, 
	lyude@redhat.com, j@jananu.net, alvin.sun@linux.dev, 
	deborah.brouwer@collabora.com, laura.nao@collabora.com, 
	beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 15, 2026 at 01:09:05AM +0200, Danilo Krummrich wrote:
> Change DriverFile::open() to return impl PinInit<Self, Error> instead of
> Result<Pin<KBox<Self>>>, consistent with how bus device private data
> works.
> 
> Drivers no longer need to allocate a Pin<KBox<_>> themselves; they just
> return an initializer and the subsystem takes care of the allocation.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
