Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793921015;
	b=S8GfmksbQFYzYGSBehiWj6mwd/crDvhbcb+JKZeUf1i7mujyAMrTG7L3nnU/n44/Agwh
	 e+3Njw6T/ks4SCU+w/vN6Gt4KZb9/DgXEqe8TKnx9dzbS1SkwiKw303sjcrHgvL90aq7k
	 ba0sH6wgEiiKWZzDZzTToKbXMkXGjnppLIu3QbJ9gXAfxIVHdtobcPA9hilmsJxBrMTY6
	 jTeiGzI7maNmVe0CmcM79gvI4ygKnAAvUnD/cYCI304lCQXKfud8Q4UOIaOB0H3jMI6PK
	 DlaUmvDZ4jVdAeOtjhGCAP2oSAAaNTXNUcdER2phpHOOgnk/JTES1qv7tvHVeLhHsVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793921015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=++VDHdPlpTNkCnA4mn1+LWZP5PXeiA0pzKCa5Fy4gJ4=;
	b=C3EGCYkGo26dLoWvkLMLFT9P4s8CzrVYRsZVj0cVd9qTtzMVt2WkzDNBzngmHfzdbXmZ
	 L0fyotsmmmb+us/RacrK/NbseveEivFBwAoL55ff1Jp04ouqZM/dW76MAy466im1OmymP
	 Ngtg4kD+maxdh8Fdf/b6IVNbLABDoF+3fFnbqXCvt3yT1yXTSV+nnpPLbVYtWG/Apek7E
	 X2aQm2xVB+jHUbur5I9+np3jqg2Dl/gV83hdsFeqhZQ6L8fkTGteca2rWn4/t/dFUh63f
	 DuF/6WIoOsiKdqjqA8hkV9/i9nc2671AvDgndTeBsBh0an1QVlSuUg3a5510L1lp1qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lwEhz+cv;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24863606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24863606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lwEhz+cv
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0d09fc934so10264a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793921014; x=1794525814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=++VDHdPlpTNkCnA4mn1+LWZP5PXeiA0pzKCa5Fy4gJ4=;
        b=lwEhz+cvmKxY+3AyfjBFSx/KuYZciYjwvWqjEpzgONTUQWMMjbGXC/myBcx3WrAci4
         DtXOMPIC6dCJaB14U+9KcT9yJs0B7ZFFnphmYMcJWbL7twfS9T50PtRp3phmaMufiDMH
         LLXdGtnC1zZRoprf7APyggElz6MRxkd/Hjfdu1dNfFnsuN4uStAr2OXt07yUsndQmNfd
         cQdtVjcYaZ1yPYsLhs0uHEDpJPZFbaE7HN4iuOPQGgorBhUUYthJKnA7G4osbEDGv9uu
         AoQfQrf75KCp4agb0EQ1ZrQDa1YoC+Tq3PjJ49lJxpaSjJy0xPn/s+4ap6/3x8DGBZ3H
         lP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793921014; x=1794525814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++VDHdPlpTNkCnA4mn1+LWZP5PXeiA0pzKCa5Fy4gJ4=;
        b=loDGsjytGAt2rspQ+mES+CR/WeRR071LQE/OcLGjz06XVZv654hebsdUCgsrFEch1x
         z8fVb+v+zJyTehXl+TwwDFHQN5wOmcISfWEwgtml7+M2Y2TsBPPmvvN6NgdV2UawrfHR
         A32DuKWxa44UUENzEngHj+itihtgw8duRD9Ep24MeQv1JD5tV4uERRqkxNayE1MAwRxa
         LMWnJrlMn06qRzplfy7+ph5GVzo7ImLbF0u3TlVB+OYwKtJgL70HoTFUIsAWGhvaT+Qs
         on5dkdUSPEhv5ml9HMsNWsyb9h3578kmmGB4pKuJHfwmzFCszBIas1jtYeGf2Cmo1sXU
         vztQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBDUIGHDnhD+XkDBomFZ/z164KIiYlARfQ+P7zaZYT4406ApGAC1oT+ih2tHrxmK2mvmlpV47cdQP8/xk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hkGQ2vgLh62Ypg40Rfc86HWJWJSLyKtclHaI35YPrz2GOhk6R
	X6QqjYBcwG09kCv8bk/C4y4Zmmir4LExonQSQHaGZ0Vp6VYI2qzROaPV
X-Gm-Gg: AYBFou0y3tWCP07ho1Q9rQYAVvfjlB8vHbpB7nypOLBbsqt7fEBoFHlGJf+rhG1v+Fs
	c1c3vyBs/7ZKASJp5q3wHJS25CsV/XTnCAZwIiferYjb5kR4hs6+BmydLN7SQSDQxVG6emCIu6p
	Vfz6nVpBNcQgSegoEZzJFeQowiXaZxuHmDL4UklWSpomNXAhBZQ5xVhAU35byCNh3a3LL7Gypfx
	Vc79/03o7rFo2YClEBCuvEzSSwHSaQiv8P+H3sG36U7rzerbgDEvL1PWdbcnqugtsaDZN8JnaXQ
	ht+xbQwYjXbqp4cLEt1B/FuP74TvOqT4KNL5AlQR1kE1wcdeCvyJg4vaD+OvNp4pqlXIMNObxbx
	trVGIir5O/ooWO01MD1O4W6mp/G8YDma3ApYCp6K5CcpBBhqiXxXgodWeXTlokeCNo8KxjPrpA7
	Xp8KpSJwInVeIWWAaM1k3B//VtREz14gNDGwreobZcTmviXtCzJ6yGgFER8BZp3UoUvVjntGSId
	Uc6srQOg9pTs711OVCEXxJlFKOmJ7JqTFlS24rLIVtybtWjWhblWkzLrErpvEpkGxT8WOuda60K
	rh0I1ihVTPITWXvqr1QwDXHKPEvWmbCn7vmbZvJWIG9+vDza7+SWGvbc5Gsyg2qpXmCggVmS4sx
	qRZQLPM0=
X-Received: by 2002:a17:90b:2590:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b0db014274mr896768a91.0.1793921014532;
        Thu, 05 Nov 2026 15:23:34 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5b64:e100:f564:53e0:ae9d:9600])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm5317297a91.3.2026.11.05.15.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:23:33 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	libcamera-devel@lists.libcamera.org,
	Robert Mader <robert.mader@collabora.com>,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH 0/2] media: rockchip: rkcif: ENUM_FMT and bytesperline fixes
Date: Thu,  5 Nov 2026 16:23:08 -0700
Message-ID: <20261105232310.385463-1-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series fixes two issues in the rkcif MIPI capture path, found while
using the libcamera simple pipeline handler with a Sony IMX415 on a
Radxa ROCK 5B+ (RK3588).

Patch 1 makes VIDIOC_ENUM_FMT honour the mbus_code field, as required
for V4L2_CAP_IO_MC devices. Without it, userspace can select a pixel
format that doesn't match the media bus format, e.g. a different Bayer
order, and the captured images have wrong colours.

Patch 2 aligns bytesperline to 8 bytes, as required by the MIPI DMA,
and honours a larger value requested by userspace. This allows the
capture buffers to be imported as DMA-BUFs by the libcamera GPU
software ISP on Panfrost, which needs a 64-byte stride alignment,
instead of copying every frame.

Tested on ROCK 5B+ with IMX415 (SGBRG10, 3864x2192): correct colours
without any userspace workaround, and a stride of 7936 bytes accepted
and used for zero-copy import. The corresponding libcamera change is
under review at:
https://patchwork.libcamera.org/patch/28662/

Faizel K B (2):
  media: rockchip: rkcif: Filter enumerated formats by media bus code
  media: rockchip: rkcif: Honour the requested bytesperline on MIPI

 .../platform/rockchip/rkcif/rkcif-stream.c    | 37 ++++++++++++++++---
 1 file changed, 32 insertions(+), 5 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

