Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E7538236C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788212850; cv=none; b=WHTER2H0llun6CkpKcS67LmW/ka3D5CgZ4uR3ni0E5adfRFh5Ago4PgS3B34h0T09aPN3tTxBokuliHiNKjzhrfx+tUKDoRXBKn6UIHwKpTh4UFXw8h8oTM/beGqsQx4m1/9jEzg7Y/8xJy7gdisCZRp+9uqJGWfm0G1mgz7iJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788212850; c=relaxed/simple;
	bh=awICWfP5Crv12Zem60YQIlXrQEZuMo5huZS7Mncb56k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QR0NifXxxBJ6NXb5OiTy7E+VJc6PiZGavSDoXh26UvUbfp0WyJcvgHxv2QP9ynDNdgm6JQgQ+N000NJlU4PUjmdd/YbkbFHw49rLcOKnEmPzYtfSyybkIQfOS4Y4P31KzJGCZy0AUJVY/cIBquu4CVZzvMDDUrrHkwuqBaLVJJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWRNzFQx; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWRNzFQx"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a20dec69f9so31418891fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788212847; x=1788817647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4N2Z9Nu76llWCIDOn2i9yQBrPhlyiZyTva3R2V2uoo=;
        b=CWRNzFQx0N+sGJqYoid78J1ZjBzIOBJETJR81kfva9vLXlM15PDbdx7vxx1ipL/Fxe
         Tym5kKoPORGJXrBo2PdL+v8D0LJOUXEqr1hxZb55tLDG+NCbSljSUsKGvhG9Xg/0X2Ip
         u+7C+M1RDaEvbLlLYx3KUNleD3yUPB8hK6rO972Pb2voquA4ysuDxwjxhss2QTrMsk1x
         taZJ+rGDeMbkaqT5B3ILfroufvbgVgVsKzCryxquu1B1YPVQKNK1Rxk3JWjam81SGokX
         T9ZE0Wl7r2bxGN8PYDOJmU32qAD72GuRJs32Cg6lffac8ZLpczg1x6FcPWv2uVfjxrAt
         b79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788212847; x=1788817647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E4N2Z9Nu76llWCIDOn2i9yQBrPhlyiZyTva3R2V2uoo=;
        b=U/4nq2kgbLKN8GVBmvZXSSO4isvT19Yp4SAhCsSfLcCj/WCScPP2U43kTiyiZAGQ6g
         ON4ToD/nZCqGxycnrUT3C/d9AFZ8eVmde4FS3MN9oj4To1iKCjPJFfcb+sQ8KFbw7/Pb
         21Q2mHQdzvoj4bFSCNa2Vdc+Kqpgvb0nyk4WWgvox4C/2pFKrKtr4mPzsHWHofq6m386
         ko3Y6CmiD7besIyYhbJsTkanWFRx6MA6mcWculF/sJQpAnct0jO1AMQPicun17tN6nu1
         NB7TiEPdbYGa2+Mbz2jZFZNBSIhb4tgjKtraBhM+/n1cwYiHOL4mpryxo/Cj0c7oqKED
         fiMg==
X-Forwarded-Encrypted: i=1; AKwUvBxVo9YdHlqZ6PYfh3xTGRmrt58fNpM9c8NJTjoIH3ngnhe4IWcMZGS6ikFrjAAAUgVejHk2lNrDzS1mqH4=@vger.kernel.org
X-Gm-Message-State: AFuF++msOtyIIhbkbQvwuQ37IB/HXxL1uoYKaLEf/I63b9D2ov1tZCny
	EKXe5bq7onu7EnL65sKm26rNKoF83wIJwLoe6loy15Y/ATV6JgmrDgk=
X-Gm-Gg: AYBFou2l0Rp0P2udBW8yU8S/kE4Rq8oqlIzVRG+TsddsYdcuIQvnRqK6JBekZYMdQsk
	ut2D0Ki4osEZ6FVYMUvk85JZodgxNHLM52VQl6XyGrsM597pwMtXCrDECBnB9bGHdy9z7YjA9r5
	n8wUUYpywWY9/FBu7w9SlbQYBW0U+R1wcboW64GTuBt/rYaZUoLCJtCWlQyYgPrginyo8v9OXI/
	1PC8z3j104SVJfDi1EkiGDGIJGVloV+AJjKcZyWj8c936mSMCM1LToQNoBXVNp+2e4a1sHb52Bv
	qoQBWTW8SBZpHD4BTtePSZ4Yskdr4HST1P2hKz5GYA0/Ks5BoxE/ddussq0wgmrlFa3lGOGVWV9
	x3FT7oaLjPZdmhoMR1WjLPjoJeq2fI98HA9GnFNt6SS1PBZyMxJ/OeNvJHzu1CgKlZsp3SHtNv3
	S95zdFVE6G/C/1wJyopsN2Ya72ruyJF+0PimVFU+Kzcjtry9QrtWVFI3QU44mi
X-Received: by 2002:a05:651c:b23:b0:3a3:314:8c8a with SMTP id 38308e7fff4ca-3a3031499camr62394581fa.14.1788212846426;
        Mon, 31 Aug 2026 14:47:26 -0700 (PDT)
Received: from fedora ([92.36.9.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a31550cefbsm18299201fa.9.2026.08.31.14.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:47:26 -0700 (PDT)
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
Subject: [PATCH net v2 0/3] net: airoha: fix silent RX loss on the shared CPU ring
Date: Tue,  1 Sep 2026 00:46:58 +0100
Message-ID: <20260831234701.206021-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830095717.37218-1-sochnev.v.74@gmail.com>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All three target net. v1 split them across net/net-next; with the ring
size now shown to be load bearing, they belong together.

Answers to the v1 review:

- "fill_rx_queue() overwrites the DONE bit written by hw" - no. I
  implemented that check anyway (bail out in fill_rx_queue(), clear the
  bit in rx_process()) and it never fired once, while the ring was
  demonstrably stalled: the descriptor at q->head never had
  QDMA_DESC_DONE_MASK set, so there was nothing to catch. Worse,
  clearing desc->ctrl outright also wipes QDMA_DESC_LEN_MASK, which
  fill_rx_queue() writes as the buffer size and hw reads back - RX then
  delivers poisoned pages. That version is dropped.

- "have you tried to just increase the queue size" - yes, and that is
  the fix. Ring 4 at 16 stalls roughly every 35 s under repeated PPPoE
  dial-up and negotiation never completes; at 128 nothing triggered
  across 500 forced reconnects over 20 h. Patch 3.

- "is QDMA_DESC_DROP_MASK set when the issue occurs" - no, never, for
  the whole duration of the stall.

- default RX_DSCP_NUM raised 16 -> 32 per the vendor SDK, as asked.

- recovery pause measured at 986-1131 us over 13 events, against the
  50 ms read_poll_timeout() ceiling.

- style: RCT, verbose comments gone, and the !q->ndesc check dropped -
  the bit is only set from rx_process(), which cannot run on a ring
  without descriptors.

One cost worth flagging: the detector adds an uncached REG_RX_DMA_IDX
read to every rx_process() call that ends on a non-DONE descriptor. airoha_qdma_rx_napi_poll() loops while the last
pass reaped anything, so that is once or twice per NAPI poll, on every
ring, not just the one that can stall. Gating it on the previous poll
having reaped nothing would keep it off busy rings and only delays
detection by about one poll, since q->tail is frozen from the moment
the stall begins. I left it ungated as I have no profiling either way -
happy to add the gate if you prefer it.

A question for the airoha folks: during the stall REG_RX_DMA_IDX keeps advancing while
REG_RX_CPU_IDX stays put and the consumer never sees another DONE. Is
there a documented condition under which hw stops writing completions
back to a ring, or a constraint on RX_CPU_IDX that the driver is
violating by leaving one descriptor unposted?

The rx_stall_recover ethtool counter from v1 is dropped here - new ABI
does not belong in a fix - and will follow for net-next.

Tested on Nokia XG-040G-MF (AN7583) on a live PPPoE line, in both
configurations: as sent, and with stock ring sizes so the recovery path
actually executes.

Vitaliy Sochnev (3):
  net: airoha: handle RX_NO_CPU_DSCP interrupt, not just RX_DONE
  net: airoha: recover RX ring after hw completion stall
  net: airoha: grow the small RX rings

 drivers/net/ethernet/airoha/airoha_eth.c  | 114 ++++++++++++++++++++--
 drivers/net/ethernet/airoha/airoha_eth.h  |  11 ++-
 drivers/net/ethernet/airoha/airoha_regs.h |   2 +
 3 files changed, 120 insertions(+), 7 deletions(-)

-- 
2.55.0

