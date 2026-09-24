Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005EA3E49D9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790244034; cv=none; b=aw0rOexxbpVRSC0APGEXPZXgEzQ8EP3DQdv2QD1+KAldz/QxRYaRxTGT90SX6gw8BoT0GO9vd2cXhi3nKzlhfEYRNC2aPRek8apfCB2bzt3DrQf7WJrIraaWnRHaShKH0ttR0wwYxROvQ18Xu6t/f1cFKiNLVWjDZi1/6cRh6ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790244034; c=relaxed/simple;
	bh=SLSQjZywF7+Lc6VeIM/QlV47NxBvlyxdZos75W9Su5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bVtDNbeJ/EBdZ6Wbha4/eY/wB4KEvbVNwT11jcDQvbTu8joRWZ3mwF4f4tWqlga8BukRgYVvfgII5f8XAvOALaVGzUfqU2mvDC5rXtS1xe8y4/xxNAvFRjD3sE5O0WemDLRqBtwR/UXdZr1t8Lwzi+JRLBVEP7YQhF2p5jNTS+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNvct2yg; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNvct2yg"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d90ba1d807so17612255ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790244022; x=1790848822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcRsvehqcHDvG/4dqBrJDWSUw7cpSxyb7LT/W2jFI9I=;
        b=lNvct2ygVv3DqDELlGOywB6edSm/wDdZffceCZA5S88K8yG/fxtkGb6yXeao/zuTUf
         hiI0r7fHlvUPE4A9Iysz5oEqtb27e64DZwqX4XmB2wmFEoN/exzKFUnYoLGPTetEmYSW
         TX+PRikmLD8l5BRXHnufx/sscz8zmu+4cZYXnaI3V7/WOCR0NsNvVA0emqtWz/ojHc1R
         S44Or9bwt3Nh2zOaf94pI6xDcjSIjo81Ku5sAatvaY+qJxfBXwu0luIJgrwSurXvrRcE
         hTYIGyvcE5bgO0vTbSpBJt5bmX89szmcqf0UoP9lX0X1B8DUfBOM6SRE1LexqAa0qnZo
         53NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790244022; x=1790848822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bcRsvehqcHDvG/4dqBrJDWSUw7cpSxyb7LT/W2jFI9I=;
        b=T+SZMWwKbya19msvWbfAm5ircfXGUaU1VyrOhc7xia+wT60f8qxXnU79YTPWPzoB7U
         75Y7QDO/QltoelyqhmFF7Pr4lEt8vvGIhmluuAKndxOvj7Dj+fHi5XiwqAvcpjtQ9hUD
         yKybV40hGlM9Z0ehnpNWp3i1LCKOf4Mkv6itmLTHQc93TOtTruEdZCkqBdz2tiJxmhUW
         a1184Tt9ZrphvQoWT+N1FRA7oebYvYhBg/VBn12NViZP9ELqSAjTB15R/d2cyuoU0qo5
         30WigVWf00gD/6qflLajf9rHQKW0e1M51ktKvYzo1INNb/gw44mP8lmUeAbeQNTVvybm
         8SvQ==
X-Forwarded-Encrypted: i=1; AKwUvByTgYNQV1PLtglMtVw4EwdG0BGIpPHN9hIIs7Sxg6WU0z67BQgoISBBzBJAjbmocp0WAmYuSxxjaQ68aSQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mAMcOhbVjWa73Sz6UDJbkHzW7SeDLQbNa5oQsoHo/TOS0VEzfX
	SUmtoupc+rIt8h14Y2OX9FUaaST4fiHKTATrP+UwqmuKO4Z1o5si8ErK
X-Gm-Gg: AYBFou0fBpaB2wBGVYOAYiybiI277GsoYkuShJ3zWrV/wo/7dcd3itk1a50jz8V5lM6
	yI+k3l5dI/JUeC19Z2WogBmLPts/B3+vD0pFp5WH+gD7xt0t4mVqUSoLE/ZiZjLqomqlfdrcxWa
	pBv6arJSSBcdJ1TD1qt5/a8ELuq4vZ1/KVwtN9jWiUr7KThdjK8ogIhAJZNOi20xTGRrmIGiUIE
	KkeVTbgtHM/qNLZzXlI03Mp6LNKQe61KWjMxUN43IeuwdT+4ZKcRvQEH9qxAWbDdEkJFpnce8et
	cFUPB98AL8qbExgMch+5KaBfBW2GJrHfwr3psFdPJP7a9zYGc6AbfwJIVgnbvHBrA9nH5tPqEDC
	8VXbCcBALt9hL3+Foi15rm4BWBp3tXDJilhUIyjPnYuMeaSSL9t9FsqXofe/W6+Nhn9DEzdulPT
	pVSuixvmKdpXzRHolKTJ5KBXNSfoUhcs7auFI7IecW2aI0uoudpgLCsbg/NgnbcauRQrY2POKIX
	GiL9jnoSHZcQWS2X7CRysVkTUOTKHkWdUhu78IEaYgQRZjw/3SfANhrnMAH+ZFXkJXBdP5ne6OG
	SDfHfMipx3c=
X-Received: by 2002:a17:903:90f:b0:2dd:c100:a5de with SMTP id d9443c01a7336-2df7dd6d6d3mr17119355ad.50.1790244021513;
        Thu, 24 Sep 2026 03:00:21 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516d58sm24409255ad.11.2026.09.24.03.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:00:21 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	maco@android.com,
	brauner@kernel.org,
	cmllamas@google.com
Cc: maco@google.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2 0/2] binder: fix premature fd_install() and buffer leak on read -EFAULT
Date: Thu, 24 Sep 2026 10:00:17 +0000
Message-ID: <20260924100019.3389555-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260919213650.3316812-1-benquike@gmail.com>
References: <20260919213650.3316812-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two error-handling issues in binder_thread_read():

1. Defer fd_install() until after put_user() and copy_to_user() succeed,
   preventing file descriptors from being prematurely installed into the
   recipient process's file descriptor table when userspace copy fails.
2. Call binder_free_buf() on -EFAULT error paths in binder_thread_read() so
   the transaction buffer and associated node/ref references are freed.

Changes in v2:
- Split into a 2-patch series with separate single-purpose commits as
  requested by Greg Kroah-Hartman and Carlos Llamas.
- Added Reviewed-by tag from Carlos Llamas.

Hui Peng (2):
  binder: defer fd_install() until after copy_to_user() in binder_thread_read()
  binder: free transaction buffer via binder_free_buf() on read -EFAULT

 drivers/android/binder.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

