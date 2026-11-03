Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727845;
	b=PE0R95stcu5ljBAbELSpLBp1EvRMLNyvXqz0HUqyBCaFhCN+92VnwY7WXnZlns3COri5
	 Xi6Cu90aiJ3Ec1PhH8xbs4ocHXPUkPrSVEajBCRBaE9rHSZ7pNNs0R1tvuXLxuUBVCd0G
	 JdUrA3xvOAA2dhJc/Qp0NGvcBDwOfcHgBbI932CE/ncYD+mocA0S3JpqG3zuBhkAhctFX
	 +/eqwCE4vkYdjCk0f4NEdIcZ1yOpscD5cjCe+DakfYm9EPE6/a3zYf9Q+VKj6bJTwU43/
	 58qlfGRQMdFtleuUkT0c0T4L2CSXOpclp1JKSmlsedgLeEurnyM6mGUG8krE+LrB7Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4On2jbBMJ6X8mnAYVO3IrjGpyK4VD72TPi1ClKlL+fM=;
	b=vWMJ9QlEj9TlBesEnhBNsm+kNV2muaEJXHeiX11qnyKJfn+YWjbmys6JWQp52SdNLGbl
	 VmOrkzrMKQEMbfNOeFMeaIqSU6Oz0tqWjJnuVNu07glVwVHc6n1xvfrEWRWoPd5mXpaaK
	 fCrwBFqF6boBnPqPYIQl420pVBou7KXuwj6F2daRfY/FeuCe9wqvgvUQI4ggquTvt3A3I
	 JgHdrxLQWSIeMIlK7G/lmWGPhRF7Lw3ib7NkMwiA7SC5Z3FZtu4ZgVs7hNZNeGtiAwO5+
	 ilpEcVxX/6qtb+fwtNSkep0okT4ao+MXhXQn36AbClp0b+4EOIXi7vcTLcZ2cQC6ACw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XbhvTkil;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A38E606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A38E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XbhvTkil
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so30020085e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793727844; x=1794332644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4On2jbBMJ6X8mnAYVO3IrjGpyK4VD72TPi1ClKlL+fM=;
        b=XbhvTkil/Nj8Sy/zzFrY9SRNgVSTxATC2KnUUQKFHuo29YQaUITobco7t/VD33yQlc
         OrJNk1PFY8bA1qL+wgck34HH0644KVpwWB0ErQ9RPMkszA0CB7lxdxpzfBoRo3aGMxQK
         iDJeq/Pdp7QRNRuvAniyJdMMLBpC5FSKY8By5FwqQLwiX2g0Hs81KjTHI8/fT/Fbf0c+
         OhQlpkg2kMvfFR1LLTL0NJff+Xeqqiyl0gvgSJ4Poz9oiCIjBkxs2rks58wwaQ2aj4n0
         wA66lUz++goOi16A0A5DiP1LD1fBhjikDOoDecZXND2FBWA5RMPLVWmImPsNJ8Bi/X6n
         EVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793727844; x=1794332644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4On2jbBMJ6X8mnAYVO3IrjGpyK4VD72TPi1ClKlL+fM=;
        b=x7qzTUEl5yrvu6NqkzIWUvhEcioO8mMvl1fF2bbCG920jpygp9aTV0wZlycPFyo1Jo
         WP9ENI28uQ0gOUqv3RkbJQom3EOCEb881v76rof4bzl+ZBR3wJjS2Z2u19tJn/jeXzSr
         MLCKM6URuHohlbWvIkZEcgVsKh56OOC20CVcbb0SFsk4Pj6ZxCXOf9N0zc+VNiykiDgU
         R32C1Zpj5IjhvLJvPKry/LCsop1ImqbF7H4fuRYHNmmqtMDaWx8d+92joATQ5lGayH95
         b7cOSY3/ufPxq9jcDZN4GOgtVNFnkfneJO49MOGX6GSZs4gfHrf3kw4kwIFk6f+G4JIw
         sjcA==
X-Forwarded-Encrypted: i=1; AKwUvBzS1w9s5FJa/q83oMcGdYyQvrJ5U8jvd8IlEcFeOy/2W7yEOfzrCgAisB3rKMvyJkHt2iCCH4GXf/DyfoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Hqi8RVE1CsDaKqv8MzkBOTG8sbQt8Lwl9BHGG7pItucfmoV35
	5aYKCf4hih+EsMRcphSOA9tQsf8KCIOs9VdPuAZkVmco1DflydqBf/i4
X-Gm-Gg: AYBFou2L43Y7aLr6URvpdGAPMcWNiQ2U0/IAwbk/bgRhEi0UEFf5YwMWRL0Jw+rlZtN
	xfT1aZjzCuOjXBB/ylGzftqVLwY3+l9+n11r0M0kYPwzFJKCA2HWXg6OCvl+sASSE2tsHtLL4DZ
	LjpBshadI91BxeJ7IRyiuiL7thZZIh6EIAtBL5bLUtwH018My9Q+MhmtU46AgyFHRqvWrmj6nNJ
	/eW2HMFl8R0ZY1QqCPZsS0EfKDAYlfi5kvkXSK1k5EVWJ3U8/XnwDGc3YxC7rrwiM9oAtGsujZN
	4+tdzDSwcCTwedYh18h8ImXOY4hxfeby3rt5ZLXSuLpu9sOY0DvQ6424NRtqdbugVCQKOz9Ye3s
	U5XTf7U3z/IgaOB3IbTXYkbDGdE27g007y/qF87xdEAPbsk6r686sp+5c/igmSi/UoqhKQuTkKS
	8U2GAkdH7Ibf9bvch8CXLfC9w/Lxu0ClmlAYrOfVfAJCZ+H0zPEgM9lDGt5bayboJdTfID+48r7
	iOohTRfPIc4vI9GD9TfZFhNwKt8Wdid/2RxQmKvBixotDL2swY42RT/oRR+qiDNrcKk4zJmLMRW
	fL3cOTGIWNdHpSUEgCNL4Lf7zfvj1vAezWVFUNYbRbtIv/Med3o=
X-Received: by 2002:a05:600c:3b2a:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4ac18a8882cmr318846515e9.32.1793727843751;
        Tue, 03 Nov 2026 09:44:03 -0800 (PST)
Received: from prairie.home ([2a02:168:fe54:0:500c:846b:8abe:fa7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abebe33e79sm262225075e9.2.2026.11.03.09.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:44:03 -0800 (PST)
From: Cinq Prairie <notprairie@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Stefan Roesch <shr@devkernel.io>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] io_uring/napi: don't end the single NAPI busy poll early on need_resched()
Date: Tue,  3 Nov 2026 18:44:01 +0100
Message-ID: <20261103174401.5520-1-notprairie@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027204840.7823-1-notprairie@gmail.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 27 Oct 2026 21:48:40 +0100, Cinq Prairie wrote:
> With a single registered NAPI, io_napi_blocking_busy_loop() hands
> io_napi_busy_loop_should_end() to napi_busy_loop_rcu() as loop_end and
> runs its own loop once, relying on __napi_busy_loop() to spin until
> that predicate fires.

Ping. v2 follows the approach you suggested in the v1 thread (absolute
deadline, fast path kept).
