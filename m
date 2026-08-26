Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A6246D2C1
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762267; cv=none; b=clP+uEo9DsolNjst0JkWaGDNQY9Ru9MnfIuyKnIKTeHYaRNwD7U5JXbFVCqBnkMdxOtsUQT6keYHxozCJbdlggJu9t4AJZL+WDbVrXtFqIJepzShAfB0KJy1lFnO09Fs+nfX1KskfTu108HIsBKvfWGBELCyTWtQ2IsbpD7lfik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762267; c=relaxed/simple;
	bh=8B2TFfI057wykZuicacH8tAGgEjX68YKbGd6fEx7mxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tPt1mZ2Kd96BtqDdyDVyoMY0JgUP2mz5Wb+8SJw1fsv+LrDRo49S6RGUbaKF4lvWqZcX0gTRjtGODsOkUWlLzJnrh8L3kdSjA38lR7cmVXQ+Y+iGq1gX3uqpgKotUasr74BXXaFRYzTyyGI/d7fzoOPVX07/Ve6ddrBUkXWQch8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=DAxDMLLL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="DAxDMLLL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49557167508so9273065e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762245; x=1788367045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9qJ3fgTR4cimq6G1HyqzaxsMwSXV5Ik1jB7vizkJsw=;
        b=DAxDMLLL5tovdJj19wqq4lfhlKytPJRX6PxeDWd0z/eYLg997eFAonLYIFWNKhXLpz
         OrwKzbcjqfaiA0AE6Mcqku7+KAGMyRgqf2nihVNLUFLWBDPD7Gf2Q+sXQGVsElONSmMZ
         SMw7sR1eIX3WROAtOKeHAX5roKQaY3/aXknEbZOtoKpGkCfLmwM1VxMJF7dTeShPtWw2
         ydXUxfB45uily7wThpBLM/1aZ4ZLLHInA2vtqLLMADvnkuRmwnbL3rQaottHiG6vD4UA
         d2SqaOyYS7HsSZ5e7tbD4rJAyoOB0rjqvGk6Ruz53UkYnmD/eB2GQUAouRQQ+fkdCgtm
         n9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762245; x=1788367045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9qJ3fgTR4cimq6G1HyqzaxsMwSXV5Ik1jB7vizkJsw=;
        b=LIk6Z/EnxQlhT0AM8cSM4p+GDC1Nd4qHRQ/UT0Rc2yQM71OUmJefUNmGUhCwXsGxXX
         5J1WTE/C3z/K7BxI/EWXJK6ck7q8EG8K66ZcYXClUHcS2tLgjCEz7pLv7YlLylh1tb+o
         CGeA8rrSD7ooI4tnmj3+QwiyPlELZeOFn5lnhefERCvoHZlDksaSnyeKaKulZ+upuNVm
         9LyaUUkrNN/3PY02kyGdSFHOC8CFZ4GLsFNq5X2oJtWSvmmz13r0qjt1Qv1+6hu+STT3
         Nkypn72j1B1aXZqnbHvLQxlGCW6F7dv0Ri3YVyXP83lieR5gpZAFpxtBzRd332Nl7E14
         YwIg==
X-Gm-Message-State: AFuF++no5WeEjq72EECnSIESPKDc76dIQ9QYwSXrz76fLU1AST5YRf87
	5T4/EIbgwyiQ0UFJdPDzdp5oJjAeND9xrHpqktv7Qm7+md4euo/sAijBy8j3iPD/mPbLxxbs4CV
	sI/kXKmSa
X-Gm-Gg: AR+sD10hDkCjWUJt+Z9c0zSm9LHv9n8LX3d0bb0f0suNkE8mXd7OaxlWivAGqvTgrf4
	T6rq7276CCRjsH6qf4Srwe4Cy1pctPnX18exb0dCzXEKZAD7bYsDJiyDvD0iicaJOroffMIb+o8
	zJkjUvVpb1204Ut9J0Qho1VXnSJ+arq+w4B1zacTJEbi7aaKAovEsizRwFGEm6esZv50xwIcSq1
	PyjmpamXxIREaylt+MaACV/0oZhYUS9VxC8OX3os4L6hzK1z7qipa/Sfy0/73SMhag1VtitKe/v
	kboV+mc2Jd3YBcp6zm6e/7aiZOFUwuy7lKVvptm/osVB3T/ef6ixP8K0QA0KRVxO2C891Htgb9w
	q3dakwa7UO85Q7tYEIOuRKvG27pm5FZNKlcN9cz+XCh90GDtBJHpb1AFFVobuyDGPyWxwLBwWAr
	AJl90B9Y8mGnSxiypSTpWaoZiZTkc3PHhthekUpbTOeoLzxK+KIS/EX8oM+SfH1aeTNQPeD4+Wl
	WNsxj9bcqjvXlnXUl4U4lzvaloMJ0S5LD2op4B/VgJsWMYd
X-Received: by 2002:a5d:4cc9:0:b0:482:a9d7:7ced with SMTP id ffacd0b85a97d-482e26f2d68mr8304486f8f.14.1787762245027;
        Wed, 26 Aug 2026 09:37:25 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eb11sm3350111f8f.8.2026.08.26.09.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:37:23 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 0/1] rust: firmware: the firmware upload abstraction
Date: Wed, 26 Aug 2026 17:37:14 +0100
Message-ID: <20260826163716.6274-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

request_firmware() covers "pull an image from /lib/firmware".
firmware_upload_register() covers the other half: userspace hands the driver an
image to write. It publishes /sys/class/firmware/<name>/ with the loading and
data handshake plus status, error, remaining_size and cancel, and is what a
driver uses when an image has to be written on demand rather than only when a
newer one happens to be on disk

This adds an Upload trait mirroring struct fw_upload_ops, a Registration that
unregisters on drop, and an Error enum whose values are the fw_upload_err codes
userspace already reads back out of the error attribute

rust: firmware: add request_into_buf() reached drm-rust-next this cycle and is
not a duplicate of this: that is the pull direction, and upstream still has no
binding for the push one

The consumer is the DisplayLink driver at the end of the chain, which writes
dock firmware over DFU. This has not been posted before, so it goes out
unversioned even though that driver is on its third round

The rest of the posting, which is one series per subsystem:

  rust-core, 9 patches, rust-for-linux and linux-kernel
  https://lore.kernel.org/r/20260826162851.2497-1-mike@fireburn.co.uk
  rust-crypto, 2 patches, linux-crypto and rust-for-linux
  https://lore.kernel.org/r/20260826163004.3365-1-mike@fireburn.co.uk
  rust-usb, 5 patches, linux-usb and rust-for-linux
  https://lore.kernel.org/r/20260826163101.4168-1-mike@fireburn.co.uk
  rust-drm, 23 patches, dri-devel and rust-for-linux
  https://lore.kernel.org/r/20260826163359.4998-1-mike@fireburn.co.uk
  rust-firmware, 1 patch, this one
  drm-vino, 13 patches, to dri-devel, not sent yet

Vino is the user for all of them. The abstractions themselves are generic and
carry no knowledge of DisplayLink

The whole thing is one branch, base and prerequisites included, which is the
quickest way to read it:

  git clone -b vino-v3 https://github.com/FireBurn/linux
  cd linux
  make LLVM=1 rustavailable
  make LLVM=1 -j$(nproc)
  make LLVM=1 -j$(nproc) modules

CONFIG_RUST=y and CONFIG_DRM_VINO=m are the two to set; DRM_VINO selects the
rest of what it needs

It is the exact tree these patches were generated from, at 4c9ba407018e, the
drm-rust-next tip of 2026-08-06. drm-next has moved on since, and this follows
drm-rust-next deliberately: the KMS layer underneath this work lives only there,
and that tree picks up drm-next on its own schedule

Two commits on the branch are not in any of the series above, because they
enable no part of Vino: a scheduler call site that stops compiling under the
locking-guard series, and the Kms associated type Tyr needs once the KMS
registration trait requires one

It applies to the base above on its own, with no unmerged work under it, so it
can be taken without waiting for anything else here

The reference branch also carries Boqun Feng's counted interrupt disabling
series, which SpinLockIrq needs. One patch of it is already in tip locking/core
as e901c1510e24

These patches were written with the assistance of Claude (Anthropic), used
through Claude Code as an interactive coding assistant, across the design, the
implementation and the tests. Every patch it contributed to carries an
Assisted-by trailer. The Signed-off-by is mine: I have reviewed and tested what
is here and I stand behind it

Mike Lothian (1):
  rust: firmware: add the firmware upload abstraction

 1 file changed, 237 insertions(+), 0 deletions(-)

base-commit: 4c9ba407018e8deb06dbc643112bac8f40404f95
