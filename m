Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792683441;
	b=tZXy98MURt/kc9faubBD6lcop6WjQX92kmQpA0OETLoncvmxAmyqWdYJ6kTg3YNVLx39
	 t4c93dcF0Y77kw3N0GhyloJEcgLhJaG0ltbImvEIMLvkAwXjuAvnzT0izk6ZPxVTXBMxi
	 0WwSD7GuUiLsjRNIXY2TV0PqEouhq+iwfXo2yut7iWBWZofcewcPKYFH2vIKp/nQ46F0T
	 ATRWqXou1+cLfE29XfdkscI9CXd9T5y591rAZ/nnhBvyMq3+fBGC5D0mF/DgTB9uZWr62
	 OE/SDthWnPL4UYz8yok+mv8DFKXNec4QT1Pgd9Z0rhMcvQ4EseOoP5RlL4PDaT6Ozwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WT2TOXMwrCOf5xSTdDSPXtJnpx/lq+nJmOy+mLlD8TI=;
	b=SRvW+b7cXEA8rQXQ2WG+cEg8ZigDPNVMvrpcMa8MIiGDF88g2lPCKNU1rHKlhCviu6FP
	 USctSnAGtwDT4kVkNvODgKy2LPUWYPN+/XBG3Na495zzgZAVqUTLFQJE/s1fsQzahkone
	 CNFGkPt6Td2MxJvcMNS3d7Ra3ajx8kJXNddXGabjGKc8A23uHsJZ1Br8ieTa3rsCwDP0t
	 4iT52nC/z53AVkkANhDxJiD+7VHMbk5/cSDrc3eXijxCd3i79nq1ROX2xywitZwokzmNs
	 HBFtCGa52DOoMGfEo4TumqpkjYUjwFsolcjDCg4RTQZAxJ3/6p/MbMirIptImKXDhBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qLAYJQci;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA57F606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA57F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qLAYJQci
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2119739eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792683439; x=1793288239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WT2TOXMwrCOf5xSTdDSPXtJnpx/lq+nJmOy+mLlD8TI=;
        b=qLAYJQciI3Y+foOEeypA9fn6ZyK+wBJ/InqlBGJuvuOdqcHlKy3XibDotjRVo6Ef/Z
         hPJuVVkrzdxgraKz87qCk4aRASUYdtlorv7Ai1xFH/L/aTybRw7D1GaN4u33L5hFiSW2
         wraMu2qQTBKISmxxEOymTIPTnC0tZqgoJYfISuXYBWdPVU3ZFJjJfDm2R8x2UeKhy4Kr
         cVLy1tkzNzg0dgpxdeN3ejVUESv7fAZ1SqNPVvTOe6tJAbt0HUcd+JTKDFra68ZYph2Z
         2eSZkuqFiubJDZ+1cO40yFrqcmHHkXNAxfOJfg49AcZ9OG+Feiwk/vKHFuyEHmTz41Fr
         NJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792683439; x=1793288239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WT2TOXMwrCOf5xSTdDSPXtJnpx/lq+nJmOy+mLlD8TI=;
        b=x59wwL9P+RoBgp3KrVQcXEPpNGfgAQUwAo6RWdZiCYP6DQkqHjtmo08vMPjA8oTsHU
         anv/PalNEMxcbTTBZaooCn/y3595qJZ1+bTszTMxl1d9M7m/pzgmWqsXYLoWU4PxOELt
         s/hXZ2ln5odU2cLQ03vhyERQvr5uTCkTrYxLt235FRc3HOUsk7cu4y7Hs0E8LbXWOKGL
         ffRmJHwi1Q+bj3bFjZ+FHOJ0duofI2Rb+irs/vDbg0vcCL7CigY53ME3sa0srrlJP997
         t+nxLOb5wc7rM84ni1OkoC20hGNbbCAjzmu/WQWJ/WSA37RKHNuO9xrI47jkahO84KR/
         GGqw==
X-Forwarded-Encrypted: i=1; AKwUvBz4VS6RDWYrF6Nyc7+xI+PpZPZC6WmbWAqberKRFoRfvL/zTx7AfFzg9+OVfMQN93IaXPPfZnlbqkzIDxU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAW54UceXGBeAIGxCGlrb5Esx+oOCX22JcjvveFQ+TIZR86tq3
	lWZWvUQXB9n7SzA+NGAfRHAimP5QojbK2TzF7fqfoZSfPHkELJVXBRI1
X-Gm-Gg: AYBFou2aKwR7FOHWowClD4pPgbGK+3jqIvHuB8K/1t7PaEpNch9eXgi9fUQO5y0H9vU
	9gmS3e0HfF1Mnkm+/vxRvqSaMxK0wjLzu6Yw5Kt812+Fcjc54VYaoo790mBOwJdPgHrFlR9SZCk
	YwARXQvw9kaVXAXseIKxteSc0wopUZ+qD1n5jtGaVHO96hw5q2NPJuTfVzR3pnkq3BoIiLaOWLw
	U9AfD0cj8ybH6U0Xmr0x24ir2pUSwRLghWOECnQbXzH6hXo+CBHvauBD9PFWWQ7E9bqV4swE4Ja
	eLgGcTmJoILApA2V6SeSlmfFL9+G9kYKROYZtlxDVczopc0rUPvZ/xSAfwPbb5bjLPORUqcFBaC
	cydtRZ+aEw5NLWMepV/nnZVvTxUKyVDfaK7dZmhFppTKuSSe5+amP+QhBsRhOR1B7Zq8KRVYYMd
	M7dlClvPqFbmXkbXsC6xCGcqxIKNPME1wBY45bv+nOBZwA80FXPlZkmJRYsoKvXcrZeTY5LthMG
	aXZXcEbpvtfekMasohhrjfXGevVpPiau2vzWfOgOZU7ccjqqIW6YTpOnBRu4oF+rh+qUXeKmA5O
	v+I=
X-Received: by 2002:a05:701b:2616:b0:182:2feb:a170 with SMTP id a92af1059eb24-190a6adcb12mr6334470c88.11.1792683438586;
        Thu, 22 Oct 2026 08:37:18 -0700 (PDT)
Received: from kush-pc ([106.213.87.38])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm15780435c88.14.2026.10.22.08.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:37:17 -0700 (PDT)
From: Kush Chandak <kushc451@gmail.com>
To: Risto Pajula <or.pajula@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/nouveau: fix GK107 VDPAU regressions
Date: Thu, 22 Oct 2026 21:07:12 +0530
Message-ID: <20261022153712.11208-1-kushc451@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913201225.5975-1-or.pajula@gmail.com>
References: <20260913201225.5975-1-or.pajula@gmail.com>
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

On Sun, 13 Sep 2026 23:12:23 +0300, Risto Pajula wrote:
> This series fixes two independent Nouveau regressions affecting VDPAU
> hardware video decoding on NVIDIA GK107 (Kepler).

I ran into both regressions on a GK208B (GeForce GT 710, NV106) with
VA-API and arrived at the same two fixes. Built against the same nouveau
source, my versions and this series give identical machine code for
gk104.o and uchan.o.

Tested on Ubuntu 26.04 (kernel 7.0.0-38) with the two changes applied
to nouveau, video firmware extracted from NVIDIA 340.108, Mesa 26.0.8
with the VA-API fixes from Mesa MR !45340, and ffmpeg -hwaccel vaapi:

  H.264 1920x1080:  600/600 frames identical to software decoding, 115 fps
  MPEG-2 1920x1080: 300 frames, 164 fps
  no nouveau messages in dmesg

Without patch 1, MSVLD faults with PRIV_VIOLATION on the first frame
and the channel is killed. With only patch 1, decoding blocks for 30 s
in DRM_IOCTL_NOUVEAU_GEM_CPU_PREP and then fails with -EBUSY.

Patch 2 also fixes an out-of-bounds access. Without nonstall_ctor,
nvkm_fifo_oneinit() creates the non-stall event with a single index,
so event->refs[] has one entry, but nvkm_event_get()/nvkm_event_put()
are called with index runl->id and don't check it against index_nr.
The Kepler video engines are on non-zero runlists, so their channels'
non-stall events increment and decrement memory past the end of
refs[].

Both regressions are in stable kernels (since 6.2 and 6.6), so it may
be worth adding

  Cc: stable@vger.kernel.org

to both patches.

Tested-by: Kush Chandak <kushc451@gmail.com>

I used an AI assistant (Claude) to help debug and test this.
