Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660739;
	b=hO5zACUf+FOBNwhb53G55BiU29VR/RH2zCrDv5Oh3iMrRIysiZNJYFbtiW8BaeCatTqi
	 RzFJL03cjKsZ+ffX0KPpkQ/t49VQmutxKhdvQsHm+pTdN8Qa4fip0JGfOxtgP7MRu0mY3
	 rY5zzIQbZPnaM2Bp+X6HCHAt9GZYkvnEqW4WDBfZRAjFDjtqF9tMZUmOoODOZ3aaYC4zr
	 gPKetOpviuw9IhCCREeH/w+lR6D4paDG8ZnaIuHMfTVvwLScMjQBIxyj/tfo3MrR1kmaH
	 3joT+j3COt7JwvJF7zS9jb1wGrDI+R9JwzHyszr2BXbvlj8BC8TR5WuvzBIlLLkuLcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+3+RimD4u8oBrFVN6CFkCZt6Ny3U/0D/dKYnMLBj9z0=;
	b=ugwTsFUWKLa67l1F+lX/eQM74RCk4ke0OpFd8mHuzRZaye+/h61UBwYsAh2juUgM1JXC
	 D/D9aoma8vtKsB6zr/SJy3M7TMR9Y6bxzL1xNmCRc1od/esg8mRa8TSjN+Ad+aEf35jl+
	 Jp/e67HNYIluZLISy/oK7Ks1w20B80RRQutEBQM2paOVbDEvXljoh7iv9e76wmLhl2vSs
	 VAheMjXIqNeBebg0bQ/d84YajWTMZ501ckmezRuJ0du+Bo4LeHTLHwMjDLWlloVHJjT4S
	 SftTPOtXxUtUWHemJ+MBnTHK6HRq641t3J/WIkkR2nsXQYDfa+dYdpIbaFdgFwF8y7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e1FUsMFr;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F047606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F047606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e1FUsMFr
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-16079d54c17so3058156c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660738; x=1793265538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3+RimD4u8oBrFVN6CFkCZt6Ny3U/0D/dKYnMLBj9z0=;
        b=e1FUsMFrTAW6QUpswIa27YiiEcGG5ijLLfxGR6RmpqWQsR4NH+jWQrxhV4Cd+WZeqY
         SilvJXZEpx8dcyIkaaG3dqf/oi7lQCdZL+hVZunr6sh4Xz9x5EkYUgclVMFHIEoFcMqR
         WqjZl8Cd1Grb3KGpm5TB3loCliDh2wioVKem9bzi8huMz+rIPBvWX4cJnJ0k659DA7Xc
         y5M61fbbg/QUgdxQdy5EkaEHvmYzS+AJBOM3weQgQR0F6yzcdhkdN6S25ZJY8SSkNGeh
         LVESuY1D4biD13sEGWrOUFQsr+/HnjxyVx0rlOXU2oXSzxWSKgm+Q6/OsvgJEdaxt2C3
         xorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660738; x=1793265538;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+3+RimD4u8oBrFVN6CFkCZt6Ny3U/0D/dKYnMLBj9z0=;
        b=DujgfX4YPncol0pRYHTR35zsDNaNiBTqVjHuJ9Sw8brIIm+LbUPua8AlvBF8+Zqyd2
         EzjOY/Yhuh1ZoPGfLp6NZI/S7AR/FN1PuHX3x1TdnJDoDkYPG+se/oWX93NuTFPaUhNT
         5q0BJ4xBIqzZhHqoJoevgJ/BhrDyVSofTEJmB2+TbxDs2SUTBnD/NO6hcCYv78YRSZpo
         7xT+jfRYoeUUhFVpg02aafJ6rQ5/NVvWJSJWM3fy+hmm22vX19uiIHVGhjtjWhEao1gw
         ESJPNf7rr/MGyAaXfz3+r+aG92gFEGLHxfop+nr79vygW5bbiEVG/X2f6lG70Nh6KEzo
         pe2A==
X-Forwarded-Encrypted: i=1; AKwUvBywtIWSqfvs+yJF0seBc58fwdfkbvHyc/RsVvrQU4vlOWefh8OmTXfSWvyBR+WMBLaNqzG4JWuRSeTWe6I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxOMWlT7sn/KUPl4LaQ5JJciGcyp7L/T82VKd5uWAO6+W9/lGS
	gEj5zfQGuX4jgKmC8mJNXN8vRnKMBVDH086ZyIiqOhVVrTqSeaKiqARD
X-Gm-Gg: AYBFou3iFLC7g4ps+Mimm7PKzB4y/pChLomoL6CPcaId3u6IyHVVybj3s+j/tYmB0Bz
	TlecDyMXmhWA26C4NW02Vji1RanUTFZTbBtOp/GjK4ZmdrWMfQ3khUlw7RjjvUKCXfWd/FGxuSo
	/aK/+r+XCROPdKUeQ/KvszQ1KWLuesCR1nhgOKXHEI8sq0h0eQRtnDmLwigG3AxfiGV5PsBMV5K
	5AsbJMLxAGe+40C7rXIa3mGCOln4Lg+BalbliAiGv9ohI8APRKUzm93nWshnga6eN7P3AoR5pj/
	tbk7fW/UIQMklSSbA+xX8ye2x8s3eWASP6foBdjJVmhVU4eK64u+0vh5hhsjFJKkVK6ZHw/8mL/
	WPr66g32OnZgGoF1C0X8WN5RrqPXdrxYYQb+ZfhHr8jal1jFhAvDn/yVXlvrnkkbmLB2OW9wxES
	JJrvq4Hv7Nwt+DLbCPUv0Dflt9fofzUbIwAw7Y+lo1IExe/4AcUN+iumcvrQjrAWKw3bv62R/ZY
	5bgS06kFfcW2TvOqczxLG+NZH2MHmeXCHr76ZeDfVJ/5nVViMqHn8CK1TagDVDGUClNtkV1jEGQ
	rQGotMxPgBOf5TQyAME7Kt2lfo0e5dMm7UMjADnu
X-Received: by 2002:a05:7022:ea57:b0:144:f089:b189 with SMTP id a92af1059eb24-190a74775b8mr5453836c88.36.1792660736253;
        Thu, 22 Oct 2026 02:18:56 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035926035sm11607230c88.1.2026.10.22.02.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:18:55 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Eugenio Perez <eperezma@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] net: tun: zero-copy path can expose uninitialized packet data
Date: Thu, 22 Oct 2026 02:18:47 -0700
Message-Id: <20261022091847.3654028-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

The experimental vhost-net TX zero-copy path can hand TUN a user buffer
whose effective vhost virtio header size is smaller than the TUN
device's configured vnet_hdr_sz.  TUN computes an skb copylen that
remains larger than the bytes actually available after stripping its
configured header, publishes skb->len from that copylen, and
zerocopy_sg_from_iter() initializes only the real payload.

The resulting frame contains an uninitialized tail.  The tail can be
read by userspace from the TAP peer through normal forwarding.

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1, with:

  init_on_alloc=0
  vhost_net.experimental_zcopytx=1
  TAP vnet_hdr_sz=200
  vhost TX total length=256
  real payload length=56
  TUN copylen / skb len=128

The exact control with vnet_hdr_sz=10 delivered the expected 246-byte
frame.  The corrected trigger delivered 128 bytes after submitting only
56 payload bytes.

Sixteen of sixteen corrected triggers produced the overlong skb.
Eleven of sixteen had nonzero bytes in the 72-byte uninitialized tail.
Several contained recognizable stale kernel allocation content from
previous skbuff_small_head users, including fragments of environment
entries.  Those bytes were never supplied in the virtio TX buffer.

This is a userspace-observable kernel-memory disclosure on a
network-forwarding path.  It is configuration-gated by experimental
zero-copy and an enlarged TAP vnet header, but the overlong skb occurs
regardless of init_on_alloc; init_on_alloc=0 is needed to observe the
stale tail in this test build.

This is distinct from candidate BR-023/BR-025, which exercise
IFF_NAPI_FRAGS.  This reproducer uses the non-frags tun_alloc_skb() /
zerocopy_sg_from_iter() branch.

I found no direct upstream fix or CVE.

The vhost ring reproducer and complete program/console logs are
available on request.

This was found with a multi-agent workflow; the
information disclosure was reproduced in QEMU/KVM.

Thanks,
Cheng Yongkang
