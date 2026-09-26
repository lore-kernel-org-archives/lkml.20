Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C38372071
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790440558; cv=none; b=MqTLriWa3EZ6sTWqFUWzPmN+9pIxDQuk/NZclNOOHsuuqSKuvMVsrPzvg9PzJvqQFXULdsTsYr0qXCv0CG3dNDVp8z2/mTRFM7uxOBVqHK3ROGyIrTb3bQtKY0t8gU1hpLB4hBVHxFyy6Igtm/vTbeC+J80xaKvIQsgMrC2glPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790440558; c=relaxed/simple;
	bh=z8vSwDiyBuH4tzUOiupCYNY/tZi7PjC0kRQc4aVjvic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O0pXinIMhWqHoHhq6jlYun/b4G9Pri8LG8owz01fIoB1V49OYzrJBIB+fX9VpNAahUIilk4D/RYawLU88YexObGfY74njVuVXUgpvdKJtduCJ21r29DAL1LEws0OJ9Weo/ySs7PsusVEOpTLTIS1u0EMHq6z9ZOIW/K4doCVG4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUqbIWy3; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUqbIWy3"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843796e373so1032378f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790440555; x=1791045355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5pryPTOD4LdiLlKyD0wq6thMQRx5prfhqZidoKen+48=;
        b=QUqbIWy3KG+J+BTI5VvbU+iLioymBJ/bwf3G8mPllDPCUQfuqAosok/upZILgjvCCh
         9pRlTX0XjfNM2hWtl0d+Y5+1VI5WaoEsEZPrbC8MN9TfB0gfvA2NEUt/MpwOvKFu60wG
         ilDH+Kl71zLQmYN5jbOJw6wiqzg75k/+PAtZ4bInFrnP1NrNe68hL5InYA/MwgZFQ6S9
         J0aWEYXne82AwYVk9s+6GWyrD8Pbf20syT9W3rmWpcIfE3jnB3WoRbbfXLU3FenDBHWX
         5j2/ObEQeRBjRIJ2EO1ZSvY2urifxNqaghykzJ6X0jTVXaEoDicQKm+jCx79Up+fYdDY
         7B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790440555; x=1791045355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5pryPTOD4LdiLlKyD0wq6thMQRx5prfhqZidoKen+48=;
        b=P90wXxp3TxYXzBALRE/x/Qs+W9jUlLI6tC0h+aavrgcTjzkd/7df81Y5L8JnfclryC
         lYQmsXaufjE4l39WvB8+oVqBj9mKVbslrtjmXd8S41sgDx5n5m10EDzhkLI7bu0oQhn2
         Jh8syR4ZEBOt9Bdyn0/fVTTmWddZs+55R+ZgOKv0cn3OGZFksrCsHW/fuwFhbGbVQMC3
         3ojytEr7JbRRInOCmts29BRjpQNXkJDJqPsteyXho+xEejb2oidtwUAhpxge7WJ31ql/
         2AH3wAW5qo6syePByDuaq7xkgq4gPzhxp51+MuebNXYoF1I0YLnCugOH83/amFDgmW5U
         NLiw==
X-Forwarded-Encrypted: i=1; AKwUvBxu6R9qxAGdPujq+CSeJias2569ceQl0vSaqHr9ywejkZpubNEPjEE0ZWOCLBa8RrenLZojXyOFe1hdPwg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwTO0NBsOED2L7mnmGrEU/gFJq/sD31cqz84m47qpNp/95tpn8
	EY0M7CZgwO0159IOpGYRFNIfC/rMqhgpAVVPSVy9mQnVRq/U8tyB0dji
X-Gm-Gg: AYBFou2wZlO79qF0+h4fXsuMQq5lp71nUs0y1+JbK7CgkLnrdHl2fpCt8mhdR3DGpu3
	AMEmnHbQSZlN8FF5u10WTY+EAz3tVv3yqdv9eYWx5G7QRx/DRAQArmCag4g1F/pftb5hq44tTZ2
	lhzSPWhTi01Gf2fQRI+nhcEMnyHF5SDOwd0+gntEALX+Thi2AWeU1gaP1yLaBsYPykEa+UXCMZS
	EUQ39sy77Jcgc5Wi1LjPF4RhXPM0n9/b/aR1Dyx4vWUZnRHE3TbaNEjj1JjvIB4CsYpimwpkfzS
	b0JdYnniIQ89W2h6SxGd6xizib/Jdb+iBCl/J2XZWPpI/IOOJIXnvHdxyR2BQbxgaZo8iNEwfWe
	pK76eL+U8u7T5SC2TRU4wSQEL1vu9Mjie5sbK9mtcPwo7qUAIuTwkfjDtNpuW4tDK4cxtmIoIet
	xeqVwQ2qwKokoPkUNk0OHZKuoAwcf7Yfe/lFRFyhEOxwhTz9cjOKFznGxl9HufAHgzTq5lreOC6
	SZv8M5Q+Jlf2rl+fMU/mMriabRY/FVzbmrRPAepXmHHJEkr7EVD2Co1AEfK5ixF52w=
X-Received: by 2002:a05:6000:4023:b0:488:5852:6ee3 with SMTP id ffacd0b85a97d-488716f4185mr17421912f8f.34.1790440554835;
        Sat, 26 Sep 2026 09:35:54 -0700 (PDT)
Received: from moosama76.. ([102.44.245.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355d96sm16176146f8f.17.2026.09.26.09.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:35:54 -0700 (PDT)
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
Subject: [PATCH v2 0/5] rust: add DropGuard
Date: Sat, 26 Sep 2026 19:35:46 +0300
Message-ID: <20260926163551.52371-1-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Rust kernel DropGuard API and migrate the existing ScopeGuard
users in the block, serdev, and locking code.

DropGuard runs a FnOnce callback when dropped and provides dismiss() to
take ownership of the wrapped value without running the cleanup callback.

Changes since v1:
- Split the changes into separate patches for each affected module.
- Added a separate KUnit configuration patch.

The series was tested with:
- make LLVM=1 rustfmtcheck
- make LLVM=1 rustdoc
- make LLVM=1 -j$(nproc)
- git diff --check
- scripts/checkpatch.pl

Mohamed Osama (5):
  rust: add DropGuard KUnit test configuration
  rust: mem: add DropGuard
  rust: block: gen_disk: use DropGuard
  rust: serdev: use DropGuard
  rust: sync: lock: use DropGuard

 rust/kernel/Kconfig.test         |  10 +++
 rust/kernel/block/mq/gen_disk.rs |  11 +--
 rust/kernel/mem.rs               | 123 +++++++++++++++++++++++++++++++
 rust/kernel/serdev.rs            |  10 +--
 rust/kernel/sync/lock.rs         |   5 +-
 5 files changed, 146 insertions(+), 13 deletions(-)

-- 
2.43.0

