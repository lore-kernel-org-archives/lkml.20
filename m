Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429350;
	b=5JKL6hdNG+nPkVGddtTjejaR6H9WzzA/1NiNoaxisYzgSwDDpw35WW3OX92yKw3cB16E
	 dtikxI+ZEYBbdc3XpKDPlTttn3HR7YGl16dV0IUM2d9brG+m/0BMi+Y+zpn3yeLW/f+VN
	 CK4EKeOanBoySQKJ+1C1ZDKCPXfFg6eXP+XLNq09prchpaIJabNMP3FWMJQEstpLhXTWP
	 j5quAPDUw7YalxuOEjtspUV7jKtLE4DTSCcYvcDKRATzDZ2K+nCI32XdoHbZHStMTUd+n
	 PiaTyWCWZMwI6TwGupoWzgpE4Gs1YTuzzf/P9XTfBUpsinbZpxGk5VZr71PPr8SfTKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zgafyIzMsT1pjWtIoIB1zWf6MuLMC07egBrhlZEEtIw=;
	b=cQXGc/QQplf6kxR/t599YZkEK6Z3gFW3/W2RMKprdYjnEvLNIXNGdBNXV6twhBFHGMeS
	 vqxQsjUkBaMgh2ocVYKxK64TpQ285Kr84cCKA+QYIbMerYtf6tqjiKkJ8zGiXypeC36Z5
	 M+DRprcNNftIAXwramvxJ7GEfDQJLBXMNdFdf+OER5KQBOq9FfIeULtYprQ3AfqeE3AQl
	 XbdIRs8X920VPZlBalaqkOHCLd4pSfKvuDdui9NoObqxwfxlI4xygPWIv4Zi7BiNqzZcc
	 mXAiJwB1pAgs9EHID+enkelQqszNbcoL3UIX2XwfgYj5sAco3ADOecrpevgDuELbV+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HC5cA4or;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D11F606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D11F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HC5cA4or
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso335353166b.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429349; x=1793034149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgafyIzMsT1pjWtIoIB1zWf6MuLMC07egBrhlZEEtIw=;
        b=HC5cA4oraBsT/6Cwj86YWowEwNgxxDxLSPOYc+6lXZ3rsXcwEVJvZIblo0j4CiRFvL
         jjwHY/vNZiHW1XIBeQlXHYLhCydDbpq6FiSXLNb0oKgCRacCIY8lvi2tbYk7NiPqn7Ya
         KF7bDcWlIz6e97FaTZiBx89FG2+6E27z9c6hhXcT5/RhX45xrlf+AxVc1KH7jII7dbCb
         9rcJ0/8TgY35/D50dHimFJwIB9B2OxsZpNHTssPZth/wUdSYX/h2Xww/EtbeOh9QD1yq
         feEWZccbrMnQliubCuSUyQu08pi/l0lpiW7cQlto8P6pbMiy4lZ2s3+BV9Gz2tdBt2qH
         iaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429349; x=1793034149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgafyIzMsT1pjWtIoIB1zWf6MuLMC07egBrhlZEEtIw=;
        b=rxMyo4QM//B9e/gRfFY+h6doFfbYN7DDojDIy32NccVZEOvNE39NmSbGdrKaJT29CN
         NOUmPADkEKDclAfo3NpCKrAd2+ZkanXB/6SVFRECjN3KyU/+EHzMfSUDj8iof2F+yCNf
         aXDUi78dIXEdBE1a4fJLBdG/aX8EIDYdAo42KSm41r3Fvz6LOcO/OwoFyoSbdeVKbaQf
         B3qlnNjIXP+bpNgQzx1OFdeKIRUc4dUomzRmHZQuD8J0DG2hxloMUMrM6jyxdfEVEczc
         pzTVpgn7uAC8sjW1Zf5HFWdcomEjaG0b9oQ9+w3nIhp2vYytJHOy/538Dw405ly16lMs
         fJLw==
X-Forwarded-Encrypted: i=1; AKwUvBzKk0AztX66iBNWRUlZZ9v713uycnIZs2SVFv1F+a0SAhf/Seq1I4JL30z7+SjKmE1PW11IC2lNPSdkqVM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL75DouVmJeiuPVjUbn5b45vzUA0Aj0q+TR3/gZmRKxVcRfvLqy
	Dl4jWI3ZSs4v8Y37zbKLaZvlAqvo0INBy7H/7RZNJxKJTt1uVy4oWn7J
X-Gm-Gg: AYBFou2DwPJgmFTmxmDcJ59rVvrWXqG953ENnPGEr2RWvb2Kh0ppTISAB/o35psF2xO
	tDfqVxgrriS1HnF3Y9BCWUKlHIp2ZqCijbb4oEHSNxDOJCWmJP9Tq+B84Zf5ODVQedWRbjfURsC
	eswAI/YQ6GPejuC/WiZ1tREIqPZmmDytU51ckAi7qauSWi79VwtPKierpA4y+I5yexoehRwqioT
	heaINUN7SUlI+QfrDfbUITIf/FuWXctza1jHTQZKoLBZnzpHog6mO9C5OrOFg90AQ5riPKjoKer
	3KghetYJBVKN+e8bkKF0KC/jbVCa+U8LCc+5nVyre8s4/2XKwo1dJdUpNYyg+gmGgeFk8mPB2/d
	7rZ4VpwK6NMNe3NMUB2T6A7b1jUiot+xmE6PrzeruigymVucFNJLbK+rGokxaIUwFjMvxNVbHJI
	KW7CRP2pltrJUGG6N20KYC1N6JO1d7q0pJz5YKoLsyff79nlXjQeYEN9rigMuP08WK
X-Received: by 2002:a17:906:1012:20b0:c41:b4e4:7958 with SMTP id a640c23a62f3a-c41b4e47ad3mr361011966b.0.1792429348652;
        Mon, 19 Oct 2026 10:02:28 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:45::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0402sm391036266b.61.2026.10.19.10.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:02:28 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: netdev@vger.kernel.org,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Davide Caratti <dcaratti@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	Nilay Shroff <nilay@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Vlad Poenaru <thevlad@meta.com>
Subject: [PATCH net-next 0/2] net/sched: don't wait for RCU when destroying qdisc lockdep keys
Date: Mon, 19 Oct 2026 10:02:23 -0700
Message-ID: <20261019170225.729789-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Vlad Poenaru <thevlad@meta.com>

On kernels with CONFIG_PROVE_LOCKING, every qdisc except ingress, clsact
and noqueue has a dynamic lockdep key, and destroying the qdisc calls
lockdep_unregister_key(), which waits for an expedited RCU grace period.
Replacing an mq root destroys one qdisc per TX queue under RTNL, so a
single "tc qdisc replace dev eth0 root mq" waits for that many grace
periods. Commit 7a3cedafccf8 ("lockdep: Speed up lockdep_unregister_key()
with expedited RCU synchronization") made each wait shorter as a
temporary workaround until hazard pointers are available.

The wait is redundant for qdiscs: the qdisc is freed with call_rcu()
after its key is unregistered, so the key's memory already outlives an
RCU grace period. Patch 1 revives Bart Van Assche's
lockdep_unregister_key_nosync() [1], with the grace-period requirement
spelled out, and patch 2 uses it for qdisc keys, as Eric suggested [2].

Boqun was concerned that a nosync variant is hard to enforce and review,
since a later refactor could move the free [3]. For qdiscs the RCU-deferred
free is not optional: datapath readers find the qdisc under RCU, so
freeing it synchronously would already be a use-after-free regardless of
lockdep. Patch 2 also documents the requirement at qdisc_lock_uninit().
The hazptr-based replacement for the wait is still under discussion [4];
if it lands, the nosync variant can stay as the no-wait path or be
dropped.

On an x86_64 KASAN + PROVE_LOCKING kernel (64 vCPU KVM guest, 64-queue
netdevsim device, 214K lock chains) this removes 5.3 ms of grace-period
wait from each of the 65 qdisc destroys in "tc qdisc replace dev eth0
root handle 1: mq".

A separate lockdep patch, sent to tip, makes the zap_class() part of
lockdep_unregister_key() cheaper [5]; the two are independent. Nilay
Shroff's pending "lockdep: Fix subclass resource leak in
lockdep_unregister_key()" [6] touches the same function as patch 1;
whichever lands second needs a trivial rebase.

Peter, Boqun, Waiman: if patch 1 looks fine, an Ack for taking it
through net-next with its user would be appreciated.

[1] https://lore.kernel.org/all/20250203175939.3133477-2-bvanassche@acm.org/
[2] https://lore.kernel.org/all/CANn89iLvu_ijSV+FnrZ6qei_Ty2c9V-RjwLMk24+oOS91bNjaQ@mail.gmail.com/
[3] https://lore.kernel.org/all/Z-OPya5HoqbKmMGj@Mac.home/
[4] https://lore.kernel.org/all/20261005171529.1378809-9-kunwu.chan@gmail.com/
[5] https://lore.kernel.org/all/20261019170018.699298-1-vlad.wing@gmail.com/
[6] https://lore.kernel.org/all/20260727182312.3750145-1-nilay@linux.ibm.com/

Bart Van Assche (1):
  lockdep: Introduce lockdep_unregister_key_nosync()

Vlad Poenaru (1):
  net/sched: Don't wait for RCU when unregistering the qdisc lockdep key

 include/linux/lockdep.h  |  5 +++++
 include/net/pkt_sched.h  |  3 ++-
 kernel/locking/lockdep.c | 36 +++++++++++++++++++++++++-----------
 net/sched/sch_generic.c  |  2 +-
 4 files changed, 33 insertions(+), 13 deletions(-)

-- 
2.53.0-Meta

