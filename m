Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0219D4D8DAB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451640; cv=none; b=qrVwNjZIX/pIAh9yIijeoj3UUcIhWAaHVLDBsMDw1xKpWQSr+qsg53zRoUx+uuntgA79Ah6SaYtAhubukL1jKkuic/SZz1Jzyai72Ndn6e5y7odJzmVvJBnr+TiuUE/0WVBYhLBqHHKltXji8iYHUEkrSTP1sqcDE7GJxy7wlbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451640; c=relaxed/simple;
	bh=4nfVwGbxhCKSpPCmUf2T+tRIUDg90eQLoFxKdHwqJyY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=euV4nnwPl2TvXJprf8ZHz6hNXmWaTnM1p3Sn2bmGZXq2g04PaTJd7wUFcaiS3F4yGJc1I26oGrKeLcRzjtyzOXqqbDwru+gp/yJohO9ouEYRNEvt3SxAGgKrAMZvQEHTUv7SYIFMpjz8PhSEMVnWitXH+wWeVxKUjDavK6ipMnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyqA4QAY; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyqA4QAY"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1cbb64a1fso112882a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788451636; x=1789056436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G6hrH/lA3aA7eJREheWu7J/A2b4LUsrs+Hdunm8t3Ac=;
        b=KyqA4QAY2rKUszlkyZi4ovuEXZjYUFB/yr3ZWJTstgICFJb2MhlsxkORXh877+MXHk
         m5wrdHoAB5eXp65Q/JUQ3owvBRc1oWx5Dh5SCmJgW8BzLp1inhX5e/5FRh+G3xDCYb8S
         wkSldCSKMQGMPYNbAhTNYsymnYRfC8nUF9rMFZCEknjdNU0BfjCb6TOlcVaMmGZmXkn9
         792k4RfIphUM/figciL6bjxV+fAthZrq5mFVWLV3Oa9+1eJnkejjZ0vaOqvlDfzwXQFe
         ozllDBU5svGEOHLyFDc4KRPDLwkzUedyY1q8SXV68rqt/07b/IjiGo3sjkszWmXWVI5e
         dKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451636; x=1789056436;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G6hrH/lA3aA7eJREheWu7J/A2b4LUsrs+Hdunm8t3Ac=;
        b=ivCD0UpClxdsezmsq93kz5DdBiB/fLvNTmu8YEtV+YZxvw3NB6zNx3T8LMZvbkFMZA
         6l+gC8mTkdTtcPeG7Tlv+1NoZum5LRVyU6MbO7g7ayUJj9qUy6XyOb8xi1MFznM69i96
         PTVMkBumzq0vRBnuYZshil+fl4OAKcNc9AWEMOOJ2gMojLrcTdPuAATzlHl8KMUN4a6s
         pB/T+Kgj2n+tMpXt5WUunpMMCT4yrARLEXLAWzQdvAUj2JYlpT0CALoSO24G+bYMHxgn
         nZ8CRPiEohnHwaWvoeaIGwlENabBRb+UF9KsNVusSme+aLQJKmQEUrZ973QV0lEY/PQO
         NL8g==
X-Forwarded-Encrypted: i=1; AKwUvBzSE/MMJA+tY5AzKm88j/SUnRbsRffkuiEBe//+AvSXF5tAEKfac2+yXsBntorpOitIbf/BenQyfswrWgA=@vger.kernel.org
X-Gm-Message-State: AFuF++lq6TIv6+RbgC9PhZ0MckFYpzl6EO7vfa6mZ4u+ExbP6VmYH7um
	lcmBJod/itgzHctS2jvDkzIr9/4qfyCzr/VHkL5NpRVWqrpVCXiS/IoI
X-Gm-Gg: AYBFou0JkFR8rIZGm0+UhkE7KDOtq51q8qxcxM3AW0deyihnrXvtLxW60p84K/wJJRR
	/3d0328elG9sSeCswii9g7R60hsbzNXaIJXY30dsS9cEEqqTsvuLsAfwkQKAhYSdqzp0VYvYKXy
	/cAHFrrvy/KJ6KI1DKm4GG3pEL5so/8PVqu2gyuPYoTBcwvHdGdcIFX0wYR+nlEx4TxG4mYGsYK
	8fefsUQm7wqc2se6/g6PoCIqj7LmH8vfUP+Rh8WLB0/MiHsKzBHRZUqctg2qfDDQZLksVK/RDkl
	S72bsb8IIxc8vxrxM9twirEa4XwKZX0/0uCUx6CuAqOa1eg9W4weAZ2xyMiyX+XXkpQ3d84Nk5N
	xd9/x4a78eARfDI8hnkbjloqK8x0/bdhnROIDLHP5BzLzSy+259StxEOvPCasFTSmItciT1NeF5
	JeCqJnKDXEuIR00Ofl5woDk1PnI94fpkfxjXm8US7TIcL3K4ZPXNdvWH2j3R8E2s9KiA==
X-Received: by 2002:a17:90b:4fc6:b0:398:c315:fa6f with SMTP id 98e67ed59e1d1-39aee04acdamr22881454a91.14.1788451636126;
        Thu, 03 Sep 2026 09:07:16 -0700 (PDT)
Received: from mhkubun.mshome.net ([50.34.2.22])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8ccc72fsm3702020a91.2.2026.09.03.09.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:07:15 -0700 (PDT)
From: Michael Kelley <mhkelley58@gmail.com>
X-Google-Original-From: Michael Kelley <mhklinux@outlook.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 0/2] hv_netvsc: Fix leaking of send/receive buffers after GPADL teardown error
Date: Thu,  3 Sep 2026 09:06:49 -0700
Message-Id: <20260903160651.1637-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a Hyper-V netvsc device is shutdown, the GPADLs for the device's
large send and receive buffers are torn down. If the teardown fails,
Hyper-V retain access to the buffers and may continue to read or write
them. Consequently the buffers should be leaked after such an error.

Leaking the buffers used to work correctly, but was broken by a
commit applied in the 4.16 kernel. This patch series restores the
correct leaking behavior.

Because the large buffers are allocated with wrapper functions
that allow allocations larger than MAX_ORDER_NR_PAGES, leaking the
memory is not as simple as setting the memory pointer to NULL so
vfree() or kfree() does nothing. Patch 1 introduces a new
vmbus_leak_buffer() function that causes vmbus_free_buffer() to
properly leak the buffers. Then Patch 2 uses this function in
the netvsc driver.

Michael Kelley (2):
  Drivers: hv: Add vmbus_leak_buffer()
  hv_netvsc: Leak send/recv buffers if GPADL teardown fails

 drivers/hv/channel.c        | 26 ++++++++++++++++++++++++++
 drivers/net/hyperv/netvsc.c |  6 ++++++
 include/linux/hyperv.h      |  4 ++++
 3 files changed, 36 insertions(+)

-- 
2.25.1

