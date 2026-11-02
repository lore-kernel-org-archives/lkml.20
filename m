Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617042;
	b=tE3ZVUjCfWXJm9pwJgxKHVgRAfBroNBSsi8xzh+nQel2rOdJuRdLXkGjq28FjU0Vj1ie
	 hgEHhCyFQ6cIM+zWDKmK5AjzjqjBbN69tameT4DTTLr6WMstEVNiNai7+IYtofa037lwk
	 BFxxhZNioIKrrsI/YLw1mYs3/Il5TyVm5y6GR7rQ5BxVeLuKYgbSudy/OOnjfeaYZMgRu
	 AaMGiLaPm/tQaRTQ53CU4/g3SLZYs1e4C/7U6A1KzcqBymA/187vyyzKBk3RsysPnYoAQ
	 /LfrxEfxPp5E+izSQKXLLWHxjdWtjQbrQRM+zvr521/843oWHNtS0ZdciBjoWWANp5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Aa0YS/IQUjNBJsPU0/wJHEsRFIdEerQLiIg1zgEc56U=;
	b=1oR1PDxzEdKbIlyYlH0m0DYSdYD3U5EtM+9rUMTJylTPoWbpQ7d4arBPnR7DBwv561DW
	 7ddSNU5zU2PNWaHPaun/dYaBqZIAc2jEk31NKS+BohbGf0QaNf9OhY6JkcI+rYqOaCSr6
	 bMKAAaHftx9zlP68an0ioCsxlu7WJKHCWvD5p8k3nCDdSV9fPGCZygWQxvR59H+IeCuk8
	 g7JyTVXuOLXtiVWsk55oBcWle2GGEKgi8mDdobhLYid69fdOMuQIXWsX19Q9fRuJGPY2V
	 Nqkswtn46yQ1GzvQhw7loqcu0nj+ljZUoXWOFiEHuNVqAPUQi8sQdMUC7g4nKmS9w1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OZfi+NFE;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62775606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62775606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OZfi+NFE
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so18399395e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793617040; x=1794221840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aa0YS/IQUjNBJsPU0/wJHEsRFIdEerQLiIg1zgEc56U=;
        b=OZfi+NFEoqTTtCNTXjvDvQrFGnXj+9roklJuDGOywKU2iAs4WcKWgE1X7m7+Rupel6
         ze1o0i8qyhVYg1r+H+aWzjxK0BL6oUcC5E65Qe63GMxqpM7/SUoaaSvYywGF36LTQip0
         i2R/lrXH5/naR9jpGWQGgoqXNhzSFgWZ34HphBqi6eDa42hofT2tba8tghxeOpMtgjoy
         tYBpTmXVFAlrK77cfUyFPvrYsE4nJ4HQzouQoMq3iXK+IbAZq4OW+sj6OJPke8l6r+yn
         aHbqI82pybsVYXVvWvp9H1Tn4M2nVoBN1edpYreapn/E0JJCtrEeGqKao7/DaaWDQCr2
         Qs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617040; x=1794221840;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aa0YS/IQUjNBJsPU0/wJHEsRFIdEerQLiIg1zgEc56U=;
        b=XSBMsWKza+uv3vos9nl4z2U6CKZ2QGjfv/WmJfau4V3c8i4nOyfPpQg6uh52aaDz7g
         d6hDl7CMT0L1wrErehjHrTHg7vIgf5Zlsi+TjbfUXRFdKo0KRTlT8TTnlN3PGQJ8NXPW
         4ZnByEc5t/AWWHuesj2It8JhM/DII0knzb5Hn6iWbn2+eDll7ucB7B6ArLXgixcq/oyk
         3ntB3WIrjepzUZBkDIl8yxSafWxrkoA7TatRmw8IJWrT/KJXyRBXU1UIVWU7AFL5zJEs
         RKkiXgj+eHBEG6cQf44RERkdDt82ZZlELsc20MJorqDciTt+PQKpgJVnh3Qo20xbKKwF
         bs8A==
X-Gm-Message-State: AFq9FYKFWWG0NKAOrBOHXAwhcfMXmDo6ZoMoFxy6RjTTNaFUP/SHWilU
	74UvjJZzlM9iiN7KBJ6XNTec+Hzh/vCUKeuP94UP1zFtuSU8/FFtUx1kQNTHZUGNUFSQFJwHElP
	cL5KCVmM=
X-Gm-Gg: AYBFou3wSdjvcKV5uYWd4CB+uvFMRzCkh5U1LS8CJG+WQgStDzDuBHcKn/iA9oQ0pEN
	I4fC3QmgRqhvlb374bTXs6W9JZVDFA0mfnQoIpfZdvyKHsx1r+Si6LaluqftSfgaZ0BuP5pLeBr
	z19goy583XmnhO+TRVMCtMaK8mpjuncY5roKHuRPBt6cJB2meCqhikGvl4bc8+YJwuKeTYVtcyZ
	Jtm0H340civeNOu13b4Vs+nfd8C5AGwQ6LmHPNFv/GjwEJ4Xm1hBmGTuuXyxGIhUILj754sJvdA
	3220bUFrXWHjGnDRqS0nVy/kwP0Llc77+tNvrUbXw1agjubc1GflMsp7snPooLmSGkyqGXGGFu/
	d8ij+5NePDpXmrLRGB2I7G+S9sSKOQMhGGBqf6M8ql5MOGO2zKl20k3svOkJI4tzMvQlujfJ6GW
	vacXzdIsnDe80EWDxZDeQfGlrBMauQXcfQH24jV1a/KdMkT7kuvTqsZWBpBCpUr1nVxWww4utbF
	FLwi5/nkmEXiIySUSc4K9ETN7qVh3/kxxv4AmRcmxAlmGOL+s7LKzofLvxh98LYrMj2PrxY6T8a
	1w+Q+c4cd8BvCNDuFiNrBKDHWEfbXtI8/mb+NGuisKBUqRAC5pVt
X-Received: by 2002:a05:600c:8b55:b0:4a1:ddca:8b66 with SMTP id 5b1f17b1804b1-4ac19234a06mr214806565e9.31.1793617039764;
        Mon, 02 Nov 2026 02:57:19 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm363171175e9.1.2026.11.02.02.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:57:19 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	MD Danish Anwar <danishanwar@ti.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mika Westerberg <westeri@kernel.org>,
	Mingming Cao <mmc@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Petko Manolov <petkan@nucleusys.com>,
	Richard Cheng <icheng@nvidia.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Roger Quadros <rogerq@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: [PATCH net-next v5 0/6] net: Move system_long_wq to system_dfl_long_wq
Date: Mon,  2 Nov 2026 11:56:50 +0100
Message-ID: <20261102105703.111844-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Currently the code uses the per-cpu workqueue system_long_wq to schedule
long running works.

Unbound works could benefit from scheduler task placement, to optimize
performance and power consumption. Another good reason to have this unbound,
is the "queue_delayed_work()" function, used to enqueue the work item.
More details on this will follow in the next section.

Recently, a new unbound workqueue specific for long running work has been
added:

    c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")

~~~ Details about queue_delayed_work ~~~

system_long_wq is a per-cpu workqueue and it is used as a parameter of
queue_delayed_work(). This function schedule an item that it will later
be enqueued (once the timer will fire). __queue_delayed_work() does the job
receiving as "cpu" WORK_CPU_UNBOUND:

    if (housekeeping_enabled(HK_TYPE_TIMER)) {
    //      [....]
    } else {
            if (likely(cpu == WORK_CPU_UNBOUND))
                    add_timer_global(timer);
            else
                    add_timer_on(timer, cpu);
    }

The timer is global, so can fire everywhere, and the work item will be
enqueued where the timer fired.

Since the workqueue work doesn't rely on per-cpu variables, there is no
obvious reason that justify the use of a per-cpu workqueue. So change the
workqueue with the new system_dfl_long_wq, so that the used workqueue is
now unbound and can benefit from scheduler task placement.

Thanks!

---
Changes in v5:
- rebase on v7.4-rc1

- add Ack by Mingming Cao on Patch 1

- fix commit log in patches "ibmvnic" and "net: thunderbolt"

- addressed workqueue change related to "icssg_prueth_sr1.c" where
  queue_work() used system_long_wq.

Lnk to v4: https://lore.kernel.org/all/20261012095452.135828-1-marco.crivellari@suse.com/

Changes in v4:
- rebased on v7.3-rc7

- added review-by Sebastian on 5/6

Link to v3: https://lore.kernel.org/all/20260720100902.155605-1-marco.crivellari@suse.com/

Changes in v3:
- rebased on v7.2-rc4

- added "net: ti: icssg-prueth: Move long delayed work on system_dfl_long_wq"

- changed also the workqueue in ibmvnic_reset().

Link to v2: https://lore.kernel.org/all/20260706134033.244295-1-marco.crivellari@suse.com/

Changes in v2:
- rebased on v7.2-rc2

- dropped the RFC prefix, kept Ack and review tags

Link to v1: https://lore.kernel.org/all/20260511092846.120141-1-marco.crivellari@suse.com/

Marco Crivellari (6):
  ibmvnic: Change system_long_wq with system_dfl_long_wq
  net: ti: icssg-stats: Move long delayed work on system_dfl_long_wq
  net: ti: icssg-prueth: Move long delayed work on system_dfl_long_wq
  net: thunderbolt: Move long delayed work on system_dfl_long_wq
  net: usb: pegasus: Move long delayed work on system_dfl_long_wq
  net: usb: r8152: Move long delayed work on system_dfl_long_wq

 drivers/net/ethernet/ibm/ibmvnic.c               | 6 +++---
 drivers/net/ethernet/ti/icssg/icssg_prueth.c     | 2 +-
 drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c | 2 +-
 drivers/net/ethernet/ti/icssg/icssg_stats.c      | 2 +-
 drivers/net/thunderbolt/main.c                   | 7 ++++---
 drivers/net/usb/pegasus.c                        | 9 +++++----
 drivers/net/usb/r8152.c                          | 7 ++++---
 7 files changed, 19 insertions(+), 16 deletions(-)

-- 
2.56.0

