Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E361470EA8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256652; cv=none; b=Cph7XvNKytkKJk+Txj3C06sSPTk7Gdk4BfAcdlywHTYddgmlthiiK/eS13hTg+f2PCzSWBp+FuaQMzTEzimfYHoL33QAsId0Xbz/BMuq27a1GQW4fk+4GCvVEqskGSzKkZj8u2r28Ht6J8TKZST5OewpTQ5mWvuTBYBN0uNdSI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256652; c=relaxed/simple;
	bh=11jjKfUY9KFzwZxUWk/NgcNwLRgWeMnxQMKfWVaoYGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YC2xqop6t7iyoDxuQm4CX59ynP80L/2Bfr8f+0aLXKkpsD6/sdsEtXH/BK39Sllhp6VGCsAULFDsko6A3C/xUZR6Xzab5WWJQAnGD1MMWOgH7Dn3d5W3EHNq64F0qMemPCisYz2uq+A5BF5oMRhWT95NepfHHlDPvmAH5fNohR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ceaiPkqY; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ceaiPkqY"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47de0093c42so696422f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788256649; x=1788861449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uOoFj1fnBYzWP1dEYsJ9SaTJjzi1C6FqQt+UOHHWVdw=;
        b=ceaiPkqYvAfGp1kO5pTt6BpnYCubF+fRNWGepwp1YFw4IY17Y/vVxbLgH5BH0qhrw3
         ag5x9GyUhqeW9maZYar2c+HNKlWkUyP4Zr4bb3LFbrvv+QR1944JNlKNMtYqk10ON2un
         sy0uFfjlM8P9bZuF2lq0ouHtdiO/En+pt5w+fv/EQO5cZRyIbG4ooqb36aLQKT/EgX6q
         /smt/xb1FGo58lMQZN4/mQ+qLjt705GZJPGwg0icf7hKJs6dM5MNZ6pvJvT/HnSAvd71
         TukzautT7qBX1yvHplDM7rMrn0USdaI3NSE6b4CSHSeurB3jotlNuYznB1pYr2KoRFTg
         xoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256649; x=1788861449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uOoFj1fnBYzWP1dEYsJ9SaTJjzi1C6FqQt+UOHHWVdw=;
        b=Ld8WZWbO8lh2JkxQb9pE/h7pOQKvQPa2cSaE/kBXos/KDfmKzVxX+8S8fY+jjk8Xq1
         1cEH4MDMlCo64+UoeT1O2nAvIctm358hgaEdQFvDIgI+hEi8ymF2b+FgaYigLJq2BNMV
         I6uVdATF8OMNBwIi0N7PUBsHJB1T1CifmbohK1WRGndPJqyXPGebMDKdofUqE+NQSqP/
         BZIzluA2cVOTPuKPM2PQZpjByrxlNWzOeYi+WAf39MAkacl+pPWhGgjpAmiuRzBNkKLd
         QxYsqwSblJbGe0+sa3CMBCB6OwlEEiZPoVUxypPiddWHPvI26BaTXT54U01bHxVjg5Fz
         HyFA==
X-Forwarded-Encrypted: i=1; AHgh+RpO7f0Gmg5HsYR9Hyqe0l1Pn4wLmh6SbMUsVI+Wl5N2oxb2Ui5+xsmYz6+0TWRONTXrkmBv+suN8AiAKq0=@vger.kernel.org
X-Gm-Message-State: AFuF++kPhkl6y33PezoH/aFb/4W9vM4m3XSOUcAHE3uNURCxkVj3N7kx
	4jgNBPTI1GUdjj5I93gpqbNVZZW+y+EQEbimoYqQm9UKqXaYQsYEJWgcE0m4mQ==
X-Gm-Gg: AR+sD12yIwQHiBfnV1mqmF0dpyIqnx+weyePx+A2IlxCPcklLYIh9808grqwXmKEE72
	0shvtykda+IXrRYN/eP/uHfcF2GQQ7dGT4Ujq90UBOLNB2CenbGiq0yuWSmaLcuTy+Et0ebqjxJ
	VaSwW3bWUlzyemWpEeQCaFDey2orV28V4OsmL61+6wf2zXLcgl88lFZGwuMYVznRFUd2W2SuXeP
	3i80lq+IS4Z2ItHC3CvTyrjRDIylT8OT0K5aItdRjKefhuoz+Nwp3p0apsmlhZAtIg9gTEjbSsQ
	KvJFBzZnER8SfAkUBBJyemT0x8dzP01OooYq/4RNdyr5ENSNpsd25IxZrsr3n28Mbfl97KB9UAV
	zI+kl8uCVFJHVYZ1l3x/J8apXbSXMGWEtbA6GO/ojDKJaLRYbQRfG5OUYGMkz6P3WLonKM5UKZk
	BXJpghcnA5tsvm6F0POMwgSO0xdlwZVttx37Dy1qHD15XhA4GB5binGZyyP21D9j9YRDoHeVOZd
	yWomtC43sdbs/p6YUYh+GlNpA==
X-Received: by 2002:a05:600c:1393:b0:49b:12c2:104f with SMTP id 5b1f17b1804b1-49b91c2660amr461459995e9.1.1788256648521;
        Tue, 01 Sep 2026 02:57:28 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([2001:b07:5d3a:fe75:6bf6:388b:455d:27bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442c192bbsm3711478f8f.0.2026.09.01.02.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:57:28 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/6] media: ipu-bridge: Match sensor configs per IPU and add config flags
Date: Tue,  1 Sep 2026 11:57:21 +0200
Message-ID: <20260901095721.45129-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831181858.325109-6-fernandorimoli11@gmail.com>
References: <20260720163819.104130-1-fernandorimoli11@gmail.com> <20260831181858.325109-1-fernandorimoli11@gmail.com> <20260831181858.325109-6-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sakari, Dan,

The semantic I asked you both to check in this patch, where a PCI-specific
entry wins and the generic entry for the same HID is skipped, now has
hardware confirmation rather than only my reasoning, so you may not need to
spend thought on it.

A linux-surface user tested the series on a Surface Pro 8 (Tiger Lake IPU6,
0x9a19, ov5693 as INT33BE) on a machine that has INT33BE in the table
twice, the generic entry plus the flagged one this patch adds, alongside
two other sensors on other ports. The bridge connects each sensor exactly
once:

  intel-ipu6 0000:00:05.0: Found supported sensor INT33BE:00
  intel-ipu6 0000:00:05.0: Found supported sensor OVTID858:00
  intel-ipu6 0000:00:05.0: Found supported sensor SMO55F0:00
  intel-ipu6 0000:00:05.0: Connected 3 cameras

Three sensors, three connections, no double-connect and no port consumed
twice, which is the failure I was trying to avoid. The other two sensors
take no flags and came up normally afterwards, including an IR sensor that
still streams and still serves face authentication on that machine, so the
filter does not perturb entries it should not touch.

He also read MIPI_CTRL00 back over I2C during a live capture and got 0x20,
which means the flagged INT33BE plus PCI_DEVICE_ID_INTEL_IPU6 entry is what
matched and the property reached the sensor endpoint. So the path from the
table through to the register is exercised, not only the end result. That
is a second Tiger Lake confirmation independent of Jakob's on a Surface Pro
7+ elsewhere in this thread.

Two caveats on how much this carries. His tree is 7.2.2 with the
linux-surface patches rather than the v7.3-rc1 base this series declares,
and that tree carries its own duplicate OVTI5693 entry which he had to drop
for patch 6 to apply, since patch 2 adds it properly. Jakob's test was on
the declared base. Both are good, but they are not the same tree so I just
wanted to have that on record.

He intends to send his own Tested-by, and has offered to run the negative
control, the same build with the PCI_DEVICE_ID_INTEL_IPU6 entry removed,
expecting no frames. I have asked him to do it. That would show the table
entry is what makes this work rather than something incidental, which is
the one thing none of the positive results establish. I will report the
outcome either way.

Thanks,
Fernando
