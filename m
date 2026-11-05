Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883015;
	b=3p5ZhMzJGoh3ctVUpU5HLuAut/JcZJfLoSi/wQxBywIXR8R5NdDS4ZEobgTCXBzRs067
	 2KKOZXkBr5l8BNOMEhyuZ5u/JBDqoxOquYZ9ABTxCxfBkrb3wMpnfdXAR3hppIDIVhwbV
	 OLwovADRE2UYJohhOOg+vvRXMkpyoXiW/CKw8jdihKUZg9Gl9wrj1BsZa75FhmvD5dXlJ
	 5l9sPC5dEnefArAZi1q7hfIaH0mtJ91oTMevV0+7/5W1dPhfu7KaGDmbUb3oxNAV5nXo9
	 iF1A3fUhZoVjssMWPtpimToTQ2mPFTc75cPWVzSISG5cNokKiKi4ZwdHs9oXIkJLFOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RelRpHTTIUBHZAk4EQyLEmZyhVHOpEokc+ctiSQX2Wo=;
	b=O3ns3go2za+yfvwzE+oOqHuEDGp+RAVO+qcu6XPmljflB8OtTwCR9KGiQZcA8KHPhGyu
	 hQhbFFpsj/7nh+iCZuwdmxrB6dCpNcWYmNxbxdzkdZFngBlfBBL/yCO+tuhTy1hYLiTzd
	 2Mzh0haLXapbOuCNobLmfjdLs57PQ7evd68hRD5IdhaRalSqwJUi/8ADXCVktHwbuJB1G
	 a3atGwzISnLFXzrwXlS6dzcv5bsXLUHognIJO7iOVRMXQbc9ni5mSBqsGqeESDBK3gcYw
	 RMyHKmvzegUYQ4TOA3uA4BBYbK5kq75gDRKWoSnEypeBk0SFPfm+6JT5nQe9kCFOPSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=CDMyAeUq;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0940E606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0940E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=CDMyAeUq
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so555772eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1793883014; x=1794487814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RelRpHTTIUBHZAk4EQyLEmZyhVHOpEokc+ctiSQX2Wo=;
        b=CDMyAeUqIe7jsC7YScgY7JnZ3+LJwvaxTk4uhpiJFoYJe9pdC9n5sVAj/NTaF94LNL
         wtNXWAdEzqLg2VLyOg3jDgrf1/cXdIKveFPKsAM3W+Zz2DJUBd1o2UDI/6yebYXQJG8a
         l47jCAJ7MWLdrKUCMHTCRtHwiIVZ6+L3WArIVoQGBVytD0SFp0eb3pKvA62TVv98EWz5
         VgEQ3gzMKpwYBlZ0hdbXSv8cER3MJh6Qz0iSD9wFk8+sVIBiMoWS5onks6bNf/P84kfq
         kliJWTzK/vAYi2Aa3gqTrtGUBMWWvZWjMnfYVBbvwTANUa8n2vQmHLynUFJeFbwgh3sB
         1XWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883014; x=1794487814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RelRpHTTIUBHZAk4EQyLEmZyhVHOpEokc+ctiSQX2Wo=;
        b=2l1g4s22WMF2Z6V+LUPs8ggVuk2PcF1UmeqiI6SX3nKs3ndubru9L8BL9IxwlRQkM8
         ryxBOaR0VZMWMFZDVGPW5Ln/W9RxaxzX2qVIyaRwjsxVwC8anALgCCMaDgIFzJ/WI5MJ
         iHlPtK6ca3Z6rlCROdF+imknPa9LOO7lQC+MJjM8iNlVVNcLcBoJAp9Tp0ZfEibzxME9
         aGR3G6uK5CWWU+9A5tjhH/99rSm9924XH3DFtglmaxXp53I42bSBc9wN0F2fEhlWYaaz
         2D4gnHdrw2OjY9IFLHWFxhRNh6ozmEcnka/Fcl7bIrfdktjnthSCK+9qUVybjNHa+dAt
         bKyw==
X-Forwarded-Encrypted: i=1; AKwUvByLeNp6fg5tvAJ6Wn+BZ6NrFihQ06SKYBngbQxXBUOMuiyaDZJ36kkicIMNrh8cs90CayrCLPxmMdcDmVo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vZRnKbpMQxIC9pN3YKDZBk1laCt9M3PVA8IqO820kM6WP57Q8
	MjjFHUFyPO01I0YPHf72A2911SuCliz3ee2UxlP7TO2BFfGvBhyDCSxSAbtnQWOb1Fc=
X-Gm-Gg: AYBFou3NqmQiKSNUdoLMtNtUwW76q80uK7yadqVf9390h37N8RHvnTLCr+voPIRD5TC
	4jOry9Q5WbK5t2HVZ/rF4ZGAPBTCPk+KUK6S5rYTJfFROI0oG7kLpUet+Ks0NNM6quXJBCQ8lDc
	1NrOaEDsbsWBFOOed8kgwYiJJCLjV1hCZn6p//TESedjwiPGSvyLdktnXMCmsEfoCF6Q7I8OVoo
	lArEyBbdPAWxFR5w9helnDWMxA2S4Vfvt3IGXSaM0aTrIArkIAL6kApA/liXeV5awbIyJ8d/n80
	qJqnSeKIex9oj88JkMmzxOyR/3CLOoFyhmIIj7rKJwJNDgwtq/uAOJb7BlBlImAfYBr7MfFZJAA
	5ah8L3LAg1vHSsjwVAFOKW9lTBEi8wJ5de9NuYEVVJEScrvn4SUBo6FlCvwO7ViPQWOHjuedgBO
	M0XiiAYwP78spWYNxGn0a20K/wVyW9sVb+dvKfyXKQFyatYa4UXcEd25Nk7C8ioVwP+SmoeWtjg
	7sicK9hkfbDWLQy22SuvP3r7E2rRT908+c8xDEXU7eu3rSu5eSy0ovstAktBMRF5S4WnPdf4SD+
	N9lOB0b14Or6ke1T6hrcF7xjL0rIvmN52G2GWqv2Ud1sERscRR9xMn1BTKjRpXH1VyGb1fm0
X-Received: by 2002:a05:7301:2a24:b0:36d:48e:82de with SMTP id 5a478bee46e88-36d049e0895mr9351265eec.12.1793883013470;
        Thu, 05 Nov 2026 04:50:13 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm22527257eec.27.2026.11.05.04.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:50:12 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH net v5 0/5] amt: relay tunnel lifetime, validation and request-path hardening
Date: Thu,  5 Nov 2026 12:50:05 +0000
Message-ID: <20261105125010.1107546-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
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

This series hardens AMT relay tunnel lifetime, validates gateway input, and
keeps unauthenticated Requests from consuming relay state. The problems
fixed by patches 2-4 were found during the AMT IPv6 outer transport
work, which is not included here.

I am using the existing IPv4 AMT relay and gateway implementation in a
multicast delivery network, where gateways on access networks send IGMP/MLD
membership state through a relay to reach downstream receivers.

The first patch closes the gc_wq re-arm use-after-free and makes teardown
safe for RCU readers and delayed group/source workers. The second rejects
Queries and Data from 0.0.0.0 before relay discovery and revalidates deferred
Queries. The third requires exactly four bytes for IPv4 netlink address
attributes. The fourth makes pre-Query drops visible, avoids counting
successful reports as drops, and uses concurrent-safe TX statistics. The
fifth keeps Requests stateless, authenticates Membership Updates before
allocation, keys state by address and port, bounds per-source admission, and
silently drops failed endpoint admission.

Each commit message now says how its problems were found. The problem in
patch 3 was triggered while writing an IPv6 selftest; the others were
found by review or code inspection.

My reply to Jakub on 2026-10-20 said I had reproduced the lifetime,
authentication, teardown and input-validation issues. That overstated
it: only the problem in patch 3 was triggered at runtime.
https://lore.kernel.org/netdev/20261020105410.7dccf739@kernel.org/

The 2026-10-20 posting was mislabelled v4 in its subjects; its changelog
already read "v5 changes". This posting is the next revision of it.

Changes since the 2026-10-20 posting:
- Patch 1: flush the deferred group/source GC with flush_delayed_work()
  instead of cancel_delayed_work_sync(). Both GC works re-arm only
  themselves, so cancelling them on tunnel expiry or device stop stopped
  periodic GC for good after the first expiry. The flush only reclaims
  promptly; lifetime rests on RCU and the cleared owner pointers, and the
  comment and changelog now say so.
- Patch 1: clear snode->gnode and gnode->tunnel_list with WRITE_ONCE().
  Neither pointer is __rcu, so RCU_INIT_POINTER() drew two new sparse
  errors.
- Patch 1: keep amt_group_work()'s single out: exit and move
  rcu_read_unlock() below the label, instead of open-coding
  rcu_read_unlock() and dev_put() at three exits. Every exit still
  drops RCU and then the timer's device reference.
- Patch 5: drop the paragraph about tunnel liveness checks, which moved
  to patch 1 in the previous revision, and fix one continuation-line
  alignment.
- Patch 5: copy the secret generations in the Update path under a
  seqcount, amt->key_seq, rather than under amt->lock, as the Sashiko
  AI review of the 2026-10-15 posting suggested. Forged Updates now
  take amt->lock only on PREEMPT_RT, to wait for a writer. Requests
  still read key[0], nr_tunnels and max_tunnels in one O(1) amt->lock
  section.
- Patch 5: say in the commit message why one address may hold at most
  16 tunnels.
- All: state how each issue was found, and put Signed-off-by above the
  "---" separator (it was below it in the previous posting, so git am
  dropped it).

Testing: on base-commit below, each patch builds without new warnings
with W=1 C=1 (sparse) for IPv6=y and IPv6=n.
With KASAN and lockdep enabled, tools/testing/selftests/net/amt.sh
passes (6/6) with no splats.

v4 (mislabelled, 2026-10-20): https://lore.kernel.org/netdev/20261020002557.3984927-1-omar@blockcast.net/
v4 (re-posted 2026-10-15): https://lore.kernel.org/netdev/20261015220648.1545576-1-omar@blockcast.net/
v4: https://lore.kernel.org/netdev/20261013175407.947606-1-omar@blockcast.net/
v3: https://lore.kernel.org/netdev/20261012125943.558629-1-omar@blockcast.net/
v2: https://lore.kernel.org/netdev/20261009201455.1904698-1-omar@blockcast.net/
v1: https://lore.kernel.org/netdev/20261008003606.3666617-1-omar@blockcast.net/

Assisted-by: LLM

Omar Ramadan (5):
  amt: fix use-after-free when a Membership Update re-arms a freed
    tunnel
  amt: reject a gateway Query or Data from 0.0.0.0 before a relay is
    learned
  amt: require an exact IPv4-sized IFLA_AMT_{LOCAL,DISCOVERY}_IP
  amt: make pre-query report drops visible
  amt: harden relay authentication and teardown

 drivers/net/amt.c | 550 +++++++++++++++++++++++++++++++++++-----------
 include/net/amt.h |  33 ++-
 2 files changed, 450 insertions(+), 133 deletions(-)


base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.47.3

