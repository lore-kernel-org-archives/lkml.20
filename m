Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAD7480DE9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280409; cv=none; b=Uef9/cD+7QVwQ3DqrPV+Nvyh51Umf4OiOY5I/UoGsBnU+jFHsyLFqJ59Ti3hde4hWhDsvfQhtafAnG4tem/hYe0RdRIuU8OEuOIUC+7f4YAbBS8062mPgXK0gU5M42nFMrbeafgh6FRFkCOmbWNnv5mBjSi4KJV58vqNSP/YYiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280409; c=relaxed/simple;
	bh=/NtC7onuMLJTqq24KflS9c9O/xJJwH3ox2ObOEN2/lM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M9s3TBXkfrGD0Ae9cfeVaIRVWDuP3dOFARp/+4+rls4GU9J9jcFL8RWBAj8xPbAh9L+QPo7xCQPGiQXXWZNd7sEmRb3ybAyC39BUnJkfDcshmyWIElzz2s7QMTghUvB/Lc/fSjIPBA/i7ZRCItbH6tbLYtGuKX+iR730bzvRbTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0C+Bk4K; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0C+Bk4K"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a33307ecd9so21311fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280406; x=1788885206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ama4vcz/XSYo4+pHJyqT2hFXL9IvS3KsjPeWoufTaYE=;
        b=I0C+Bk4Ky63fOsKBnIBTPKArrA7tMJJ+UJ4rgUGF6Hik5RK0qJ5J51o8R7f6QMHZs9
         By5CnEQDI43mkclFWkC0HNK/ixtJQ2SDojtrDcgAJCKUMAg8nKcTThGsgXRQ4U0RHa6G
         BG6TR4oUwO7/LXJ9K0cKt/zfxh/swiIxiIjy8uv/KgiZJTZhszqhfZcR6W4H22FffGt2
         LvxsHBtIbC7i3+30TSA71UW6W4j+v7W7Usy8SHbBDfPr+ZJYGrNADQy2Kq3SRAx65KZF
         8opCwaX0tAfAXNLoltS1zACS3CnBd3CnVbqxJgEETmDcouCX6rzoYSFsjnG3/r3bRoxW
         66aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280406; x=1788885206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ama4vcz/XSYo4+pHJyqT2hFXL9IvS3KsjPeWoufTaYE=;
        b=KYz5iNyVZ+78x+Aj6Vh6HYv2YHf5owCG59clNZXZU6hwjSYbRhKaswsXd4p8Th0+8t
         Rjb8tB3tTljHAu9Od0argO/TQqSCASJvZER7n0Rkqw0uPP01lrD/mz+K0DjxjcBf4JoW
         JOFjgOy0BwmOpDXA/CeG3a2jN5ur2SbToYJYvfpjdpxLYorkidkl/odbuh3pC+CeX45V
         DL+NQ5lzzk8yCw3cv+MazqU9+/RaqR9AUjFKolWqpnBrg5F+FcE1S7ioMVPLT9st9HdR
         ZX915uXIZgfstXXUVxjCytlXe6uBid3sLdJrvROUDEZteBdCAGpIW5yxfE36hUo0FhdX
         v9xw==
X-Forwarded-Encrypted: i=1; AKwUvBzCFWj/gXp3gqzh6/du8kN6f75GCmM1JvbR6DW0ZBowqJgJWP3LWWnEtET63ky65Rpf+v/eGLD6rpKhOxM=@vger.kernel.org
X-Gm-Message-State: AFuF++kKI5iGN0+RZZBCcl+KsmowEX3a3V3w1ztSsvKAhoBdIfItDl1B
	JMdm9x+efj6LRBvF/XOWaR+tMUxrWGnLgo92fbUPLy6BXMrZOWUkTGY=
X-Gm-Gg: AYBFou2qd2n8i1Mwql+GP7eOq6/JElJFXbRJcDOjZMDywSi51TA31TFyuPEfPmjDahN
	mbATHB0Nw/jpCC3vVPEzIuhw7+yFJeXlkC0oKss1XoGAAY1nKs/67vI2ZdFmXa0eMEU7hJQO1CH
	+1Vv+p1Y86M0hDOi5Kdn+OyqP5TDILIUVynTvO8mJHZR3y8L264LTCwguMjiSeN7n9JqJy04wRV
	YTr/+69loNQOMx1rbWf1RIlGXOa0qHrJrRh1ujvxHDZk5uuSFT0v3F0/G0q6tTrT57PnaOjZzwB
	/6Ur14QHxPOHZOfPg6iEAbVZH1EFGSsq8SmgE996uhmlqVV6aH831gXD1kHfvwSXZKn1/Eszjop
	zMTBKnuudHK0/zvlen8LWNW600Ks9Wvp2ucTUYy3F194zL7kLu4fvBOe2/rxUYUpS6rAZ7Con5F
	R46lmdLwdJrTP2I7b9W+KEAFvEdCkYlJNYIG1QwNfGbMz8D6qAbs9AGRRa1Viu+fY=
X-Received: by 2002:a05:651c:31d7:b0:39b:128e:ae68 with SMTP id 38308e7fff4ca-3a30175c52amr67573001fa.0.1788280405342;
        Tue, 01 Sep 2026 09:33:25 -0700 (PDT)
Received: from fedora ([92.36.3.203])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34a8ed967sm678251fa.7.2026.09.01.09.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:33:24 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: upstream@airoha.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH net v3 0/2] net: airoha: fix silent RX loss on the shared CPU ring
Date: Tue,  1 Sep 2026 19:32:52 +0100
Message-ID: <cover.1788286284.git.sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831234701.206021-1-sochnev.v.74@gmail.com>
References: <20260831234701.206021-1-sochnev.v.74@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v3: dropped the RX ring stall recovery (v2 2/3) as asked [1]. At 128 the
stall does not occur - 500 forced PPPoE reconnects over 20 h with the
detector compiled in and armed, zero triggers - and it did not fix the
bug on its own anyway. I will resend it if the stall turns up at the
larger ring.

2/2 keeps its code and its Acked-by; the commit message changed. It now
cites the register capture taken with no recovery in the tree instead of
numbers from builds carrying it, states that 1/2 does not cover this
failure, and quantifies what the bigger rings cost in memory.

v2 [2] answered the v1 review: DONE-bit overwrite hypothesis disproven,
QDMA_DESC_DROP_MASK never set, RX_DSCP_NUM default raised to the vendor
SDK's 32.

Still open for the airoha folks: in 2/2 hw set DONE on descriptor 15
while 0-14 were untouched and the driver's consumer sat at 0. Is
out-of-order completion within an RX ring expected, or is the driver
violating a constraint on RX_CPU_IDX by leaving one descriptor unposted?
Growing the ring avoids the symptom; the rule behind it is still unknown.

Tested on Nokia XG-040G-MF (AN7583) on a live PPPoE line. These two
patches without the recovery are what ran longest here: 508 forced
reconnects over 20 h 32 min, zero rx_dropped/rx_errors across 39158
samples.

[1] https://lore.kernel.org/netdev/apaA5jDYH71F0JaS@lore-desk/
[2] https://lore.kernel.org/netdev/20260831234701.206021-1-sochnev.v.74@gmail.com/

Vitaliy Sochnev (2):
  net: airoha: handle RX_NO_CPU_DSCP interrupt, not just RX_DONE
  net: airoha: grow the small RX rings

 drivers/net/ethernet/airoha/airoha_eth.c  | 16 +++++++++++-----
 drivers/net/ethernet/airoha/airoha_eth.h  |  3 ++-
 drivers/net/ethernet/airoha/airoha_regs.h |  2 ++
 3 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.55.0

