Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9BC3DDAE9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790796085; cv=none; b=K4OYQhxvqsvWfULEof738XAr7eSoLsxBzI9zuc1cm86OZCLpiwB2gPOANHIx+PMuO/NvGdlPuEPsyxooAAoFvdk32YI5xJGooV4M3of2DmCav6KE0vjfb64UUnI23CpgWk9ooLkvQ9oymehou4uvB3Hpf9AEDMFcLJFMNYlwMNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790796085; c=relaxed/simple;
	bh=OaywG8qV2zmeQmYflGw/QkJAGzejff4a8mMmROTwgrc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eoo93vURp5RO9Xn8VuTrtJw61IaJgb+XFh6/q6T6kXuQTtCNeNBcx+RDhX4MGTrEGuRm3stDYaqlyOWAb/fFR7SCYNtXT2RfF77+XdUERZaLbeuAUJZuFoHTuqsds9WWsMjSDIMGbkYkDGmnL43WUBl4oz7g2ZjVGTyqUpcRJZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEJjPHUb; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEJjPHUb"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912df756so44294315e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790796081; x=1791400881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iy6PlywfDUA0Eh+zmjEhhc7NS3KUQphzxgwcZvfITKA=;
        b=jEJjPHUbmttfA1XmPeosCkE+0BhwColxxMwMWoHG/RJnA3T2jIW6c9Zy8SeU124scU
         xXYSQh+xjdoUNWR8eAH3HM9L3BYkucbxGrRKPTghRr238IUrnGT7cmWphcnFscAbUG1k
         UjFS8JrXusvAD8p1k9jqzm/MjDH5NRvhQDRkwECFLD+AO2akMkPYRJm+SMrbogPgQL0M
         kUnKH39a7Aq9myv7Y1ZBdCt3TWIGh1i9u1lAISXXGLGxbZ98EjVyjAqhqw6F88F5AOod
         kS/Ky5OQCykhkoqycqC5cJ6mh2VOmdWwWKBapjgb5RAC2WMJycN+F+ybkcw2XxtP0k2u
         C6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790796081; x=1791400881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iy6PlywfDUA0Eh+zmjEhhc7NS3KUQphzxgwcZvfITKA=;
        b=fTC+nkae2ySSuIy0nus0rPIGG5QZLhJUEMWmG/lwX1VysOCxYd0yYLCofdZ1PmrRJJ
         QfLvah5L7E4qhH4F95a9ne6NqKc0pOlxykbOmIfzw/CfCCFuOnbO+8SICqdszesCNPgK
         aoliLF1ES1YuD5VWEuxcW7tORelXvIAcqlNCCGTU5supnyAGTb+VFYL0NddZ1N5IVbqw
         Fz0DR2Z6rm/eNbMcct7zSHkyjTZPvq4Og5DZUw/ZHMFTMqf73iIoHQ/ECIQqFdN0qmKm
         LTiICuHb7nT+nVx1mfAYKzJJFGjJ9d4A82fphCGuAwuvxqt2g1qtTXIupLpdw2s1IVH/
         94YA==
X-Forwarded-Encrypted: i=1; AKwUvBz+10ZXVmX8SB90dTO8UDw3OZioWq0H6a4XPsdFgi4vonRqg7Dz6ClFZn2l49ceMbseIFVvr0mOZrIQykk=@vger.kernel.org
X-Gm-Message-State: AFuF++nUUWg7wPHRIju1/LvTeg6Vp+veM3UH7kbLao11SUmBRmMmg2UK
	6xa+uyH4ybIfht7PsL+uTHFPfg025QKg4dmYo8bfIj+I93fgDuT2Uxaw
X-Gm-Gg: AYBFou2F41gbbUuZFbh4U1FkAv2fGlLg1E/T+b8fnmtiymrv72l4iie+Ft7QffRuiiE
	i1RueWmR1+Qg/2XeQ2z0DVbtMuA4DP4nXTiRubmsy5xS3qdMV3ETRHzECz+VlXFLVgxfnngCG6v
	u2MpzE7uJqqmJVRk6uQH33/6M4ydTZgAFxDEHLmM5R72MtTV2f3Ru0U5T5TIdNH8q81HZr5/2Os
	b9jEYjKZyoJWQWZWFXIh6FcU+t6enIUHTDiCtfpnrOY9/iOrt+OaInekAwYgvCMRXRiplgI1gzm
	rI9WiQO4U1UAcoQ1VHCh2ppbWO6Jo31CwNU10fRqgeo6uAmGeXfq/6dknTek4sE25nOL8WOaVpH
	gDqdxgIAEllfSffk+fpofO2X6EwOj/ps2esPvPoQyL9dnUanwQct1N/GrQn1W3Lhk420ay83GO1
	BDdDqIbbqlfcd02wNzgZtZddkB+KoNzsD/4SdDcgLiJRG/WDrMRGDMfgqE8u6NDXH17NoPlpvPb
	CgMHLlO0tDrjT2VYBExXg5CfwGCT+nmI1xnf+H4ia4iO/jVahZecLbV5PVICtPm4P4hKv2Yx+ga
	t+/zoOlfZ5nfrZ73VbyhdBuQZKQj+IYdfD2jKyxuxiGdick+egt/vbFhFW6CvQ6vqgs0ACPRSE3
	XCa410QiQUmY=
X-Received: by 2002:a05:600c:4f8e:b0:49e:745d:c317 with SMTP id 5b1f17b1804b1-4a01b0087a5mr39314065e9.12.1790796080524;
        Wed, 30 Sep 2026 12:21:20 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2b3-0101-b51c-a607-3dcc-3979.310.pool.telefonica.de. [2a02:3100:b2b3:101:b51c:a607:3dcc:3979])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9248ccsm3513165e9.3.2026.09.30.12.21.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 12:21:20 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: netdev@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH net v2 0/2] netpoll: fix PREEMPT_RT deferred transmit locking
Date: Wed, 30 Sep 2026 21:21:01 +0200
Message-Id: <20260930192103.62973-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260928064239.32456-1-kmehltretter@gmail.com>
References: <20260928064239.32456-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

netpoll's deferred transmit path can acquire two sleeping locks with hard
interrupts disabled on PREEMPT_RT. One is the sk_buff_head lock used by
the sender and worker. The other is the device transmit lock used by the
worker. They produce independent atomic-sleep reports.

Patch 1 gives the deferred skb queue a dedicated raw lock.

Patch 2 makes the worker try the device transmit lock and defer the skb
again when the lock is busy. It uses the queue helper added by patch 1.

Testing:

- Arm64 and x86_64 PREEMPT_RT W=1 builds passed.
- An unpatched Pi 400 emitted the queue-lock report five times during a
  one-hour run. Ten boots with the complete fix passed, including one
  3,606-second run. Every trigger and post-trigger marker arrived, Wi-Fi
  remained usable, and neither atomic-sleep warning occurred.
- An arm64 PREEMPT_RT QEMU control reproduced both warnings under forced
  transmit backpressure. Three boots with the complete fix passed.
- An x86_64 QEMU control reproduced the queue-lock warning on PREEMPT_RT.
  Three fixed RT boots passed; the non-RT control and treatment each
  passed three boots.
- An arm64 QEMU A/B test held the device transmit lock while queuing 64
  skbs through a synthetic CYW43455 SDIO device. It used HZ=250 and ran
  with PREEMPT_RT enabled and disabled. After releasing the lock, the
  HZ / 10 version completed in 128-178 ms on RT and 108-109 ms on
  non-RT. The one-jiffy version completed in 59-114 ms on RT and
  28-55 ms on non-RT. All 64 skbs completed in every run.
- The exact v2 series and pending brcmfmac fix passed 10/10 counted
  physical boots across a Pi 400 and Pi 500+: three RT and two non-RT
  boots per board. Every lock-contention run freed all 64 skbs without a
  timeout. Each board and kernel flavor completed a 1,800-second stream,
  ten TXHI stop/drain/wake cycles and a Wi-Fi reconnect. No counted boot
  reported an atomic-sleep warning, new lockdep splat, stall or lockup.

The A/B test applied the same pending brcmfmac netpoll fix to both
variants. The driver recorded zero or one dropped packet per run, and
host capture lost the same number; both netpoll variants showed this.

v1: https://lore.kernel.org/r/20260928064239.32456-1-kmehltretter@gmail.com/

Changes in v2:

- Retry device transmit lock contention on the next tick instead of
  after HZ / 10. Keep HZ / 10 for a stopped transmit queue or a driver
  which returns busy.
- Add the arm64 QEMU A/B results and combined Pi 400/Pi 500+ RT and
  non-RT hardware results.

Karl Mehltretter (2):
  netpoll: use a raw lock for the deferred transmit queue
  netpoll: avoid blocking on the transmit lock in queue_process

 include/linux/netpoll.h |  1 +
 net/core/netpoll.c      | 83 +++++++++++++++++++++++++++++++++++++----
 2 files changed, 77 insertions(+), 7 deletions(-)

Range-diff against v1:

1:  b95097f73f29 = 1:  b95097f73f29 netpoll: use a raw lock for the deferred transmit queue
2:  bb9c0adcd8a9 ! 2:  30f5c80cea9c netpoll: avoid blocking on the transmit lock in queue_process
    @@ Commit message
           process_one_work
     
         Use HARD_TX_TRYLOCK() instead. If another CPU owns the lock, put the skb
    -    back at the head of the deferred queue, restore interrupts and retry
    -    after the existing HZ / 10 delay.
    +    back at the head of the deferred queue, restore interrupts and retry on
    +    the next tick. Keep the longer HZ / 10 backoff for a stopped transmit
    +    queue or a driver which returns busy.
     
         Fixes: 3640543df26f ("[PATCH] netpoll: fix netpoll lockup")
         Cc: stable@vger.kernel.org # 6.12+
    @@ net/core/netpoll.c: static void queue_process(struct work_struct *work)
     +			netpoll_txq_queue_head(npinfo, skb);
     +			local_irq_restore(flags);
     +
    -+			schedule_delayed_work(&npinfo->tx_work, HZ / 10);
    ++			schedule_delayed_work(&npinfo->tx_work, 1);
     +			return;
     +		}
      		if (netif_xmit_frozen_or_stopped(txq) ||

base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
-- 
2.53.0
