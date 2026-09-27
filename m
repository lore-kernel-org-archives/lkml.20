Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6020D37E5D2
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790505935; cv=none; b=IGcWRf7a9W4FqTBquwq77LnOsoFlPBhfEsVEGZabLWF7j8jpUrIDv0hilCZJx9GWSPO2qU/zz4IEv/l6EoPc9S7cfWtJV5bt9cdKapchWK09NRVftdDd+6TVAniOvFOthGjyw1q1NJIZA5AZHOuRUpRmPnt0ZJwxfPwLuuF6iPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790505935; c=relaxed/simple;
	bh=E51DzdcULzRpdMmr1jtr31t0PUWLCjXdu2/DDghqgsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IL6ds7vWOxZ5yQhszI9Ktfb9iYZBBw+XNtztBtamhk0lvK8uzOQgsQ9EWzTi/hx6HkwxuMwZWRHnMFUFTcMvO6pLeWW++GPbmnq5h/rGf/TSaLPcHNAtVIFGjttqNO9KzhIa4haUF+HfqvfWHKBUYdegmVM6Z6/2X+wSxMMo298=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bF732jaA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bF732jaA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so16879055e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790505931; x=1791110731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RfJP6yt1DXJx4cKd4gNx9tniZWIU3EM+Tzk+BM3HamA=;
        b=bF732jaALJFqlUdyPcCLlGUxstiCcmpPUlPHD4GBFB2i/K0BrjyIOP4DwoJQY/50wH
         GSZdjbbubmcOMxk/m2T7/JG3ctFKcNh0dh0T0MpBbml18a9Ro07IfZJqqDMb4CSWunCc
         bcqN4Nm283SNP3PhcQURgTTTU26BgFf75xJGAE49Ndw+nbZ3pBOOmdhyOnfRTXI3/O4H
         HrhoB/Rz9G0MWdu7hQ8IVQA2xahRVQDr4kVCZI0nXhVdbl8EcmDpCL91knjR8x3wzjcX
         3zyiI7xgu8sFsOSUA5KUCU2ZqLepJe2o+zBCVNGnSA0v9ghxDb/fcSJUy4f4cYkfThmJ
         YKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790505931; x=1791110731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RfJP6yt1DXJx4cKd4gNx9tniZWIU3EM+Tzk+BM3HamA=;
        b=HHGgz4oMpfdQG2/exaKjlohCPXi1zswhXdpvrc3cyD2jOhMAY0dnfo0+cqFBS4NPlh
         AGToneCGvRPNFTEbdomT1XxnhLQL/dPA7VzqUWVufVGT8KBANHPD/YeIit6B4buCGzaz
         U5sIJn/l48Ls4yWGDDL1FnXECKHzB+Albpcbi1S3/L8tt+e0j5qmn3TV+qHxcJgXsiy0
         bkMy7XE6nB4MspF0gJwMfCDE8Ew4sPvw+YfnAuprStVZsd6Tgw1kK/lmPv6u+H4kZrtN
         3hcuLcoSR+ukUeVW7hztGD3bGfwihtZ8ZjCp1o/BhLdeGp8XiwgjOZVceRr6Im/6P6Xg
         lzAw==
X-Forwarded-Encrypted: i=1; AKwUvBzYM8t2x1OSXiG0CohAlMDt1AX/n90VTRBmzs4czpWefJVOsuK1rlkzWkpKlkjEnXwuuOOy/gCvKnK7ofk=@vger.kernel.org
X-Gm-Message-State: AFuF++mJwBmhiWnHijUG0IHAj6WyDt4grc0r3QZneQ4uAQ54an1Dlx1v
	q7d2MC4Gdde1YiP/vTeijOrqRO3zYhqFLwDZRrelUaY93Ry7/eypgQyA
X-Gm-Gg: AYBFou1B5k7FGrWqLGfm1oJ/run4l+JAdUb3xXiltTpf2Xf+9p/7VuolLFDQ0xWko/o
	Ud/vIAjkBN1P9EwbnRqpUfZ6ch4eqWDH1mtJKy3SjHPWSGpKO8GvkCeK9dBxWcQHXwnApSTIa3n
	rKaoXX1sj6uRpoUfaRM1PpJw+aqb4A+/yw3pDlxFNeIVrG10vfErw2ka9+J0WXoqmJmNTNeaAkP
	ZhkRyC0I+vs+dDnSUMFsnKSiujMcfPN5Kkb36uAymSnuOmFg77+3HDfSsF0+lqiAuJCx/T4VxiX
	w/oHS0vA2JGvz9jEcAEqLIIpCNtAG0xYa1/1LoJbsZdCAMSTwZscMkftKYSnwTN9z5N0G+HQGeu
	WmBqONbrSm+MdeB21EoBa/vL5F2ccZDIiN9bB8CPOxu49ORJQLdDQeohUbUvZCY81EhJrISG8WK
	o2MFiyAjR/Jy8wY+9I/bqjKr4a+WoA7kyw/WcfRNU1M30ZhHdcErxkK6qMO6ptlIlDPFu3tX8gE
	UFCgHIxUA4Rjew2a5qal7RFO+IryrseAo09ZPBmq1kzQIosHPZsOad+RI6y0lbPrq4=
X-Received: by 2002:a05:600c:3ba5:b0:49f:fe79:62f9 with SMTP id 5b1f17b1804b1-49ffe796457mr53954805e9.25.1790505931369;
        Sun, 27 Sep 2026 03:45:31 -0700 (PDT)
Received: from moosama76.. ([102.44.245.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001915fc2sm46005195e9.14.2026.09.27.03.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:45:30 -0700 (PDT)
From: Mohamed Osama <mohamed.osama189110@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	longman@redhat.com,
	lyude@redhat.com,
	linux-block@vger.kernel.org,
	linux-serial@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] rust: introduce DropGuard
Date: Sun, 27 Sep 2026 13:45:24 +0300
Message-ID: <20260927104528.103881-1-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the Rust kernel DropGuard API and migrates existing
cleanup guards in the block, serdev, and locking code to use it.

DropGuard is vendored from the Rust standard library and re-exported
through kernel::mem.

Changes since v3:
- Vendor DropGuard in rust/kernel/std_vendor.rs and re-export it from
  kernel::mem, following Gary Guo's review.
- Remove the DropGuard KUnit tests and Kconfig option since the
  implementation is vendored from the standard library.
- Keep the existing ScopeGuard API unchanged.

Testing:
- make LLVM=1 rustfmtcheck
- make LLVM=1 -j$(nproc)

Suggested-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>

Mohamed Osama (4):
  rust: mem: add DropGuard
  rust: block: gen_disk: use DropGuard
  rust: serdev: use DropGuard
  rust: sync: lock: use DropGuard

 rust/kernel/block/mq/gen_disk.rs | 11 ++--
 rust/kernel/mem.rs               |  2 +
 rust/kernel/serdev.rs            | 10 ++--
 rust/kernel/std_vendor.rs        | 87 ++++++++++++++++++++++++++++++++
 rust/kernel/sync/lock.rs         |  5 +-
 5 files changed, 102 insertions(+), 13 deletions(-)

-- 
2.43.0

