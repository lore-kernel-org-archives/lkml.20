Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539A43D5C26
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946051; cv=none; b=bGgZDkBYHmTjVwo7yDoIQ9nmfqJILFK0Mze6H36GPXM7sPLl1qYbNUvDkbhOL59/QVxx+ieX5tNAh1wOdINyc9CRQIx3/HTaQ3G3lLJ/GWKNCMfAZxDh9tlx8nr6O0GO+ng0QqvcJdDfiLF5ZPRc+VsDihzQjNV7kn02QUIlcdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946051; c=relaxed/simple;
	bh=ZcLSLvkBF6ozJekkfIc7TNhqA51pJFNoJ7IKNcYF6Ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vBMlxNPicoHCWtJj821HnTMeut5MXhr4VgUxODYzZalI/aEabni4PIfW518zmWovHw3vnTZoTxK5D2WOehHIbm4K+LFZLUuSUVqCnQUI4Tn+OR02PptK2d2/veYYg9zY0vke7/DzbcfnQ4VT550ydO7EVOUYPULhFJxT81jPS4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isnO0f97; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isnO0f97"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso60731055e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788946046; x=1789550846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lsdKs0VobuM4XI3gIi1gCgynRI1C45G2dcgah+Cu3mM=;
        b=isnO0f97dV2yRvpBkjb+GqrzvLj+5Is7RYGn+XomlxYmcO/WrShU30gFKzVqrHyiJt
         YCNX9k1VuN2mcsa/MU25YHxl7jXjspKc/bYq9OcviM6e5VutOidesNcdvkT2sg3kvEA+
         1mH+4du8qxuJnmIlxQYA3YtuY/eK5uHRY6OGbzDgRBrTu+tzpZBjc9oIpqXkuG445WRB
         GDJ99GhDgiRgHlQrcDLvUBT7YEVAdVEHw5/wabGM6VXANtwBExg5PYwm1eHIJEeHMpDx
         AXVeseSADkSvKYbROwgKkLQ4qorIAWukPmok2YCHWosSds4wz+iS3Cv1bjS+iP9sweUe
         gKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946046; x=1789550846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lsdKs0VobuM4XI3gIi1gCgynRI1C45G2dcgah+Cu3mM=;
        b=RbCCR/nF7wPP6WrH0CkiaCg6F3L4krJwSZOsAGsz+iSOmn/2/gpw+x26fPttkLcdat
         O2KwLtiSMer0h6yav0QSI/u5DPtnUM+HLr5II8+iQM6bbCxjkDZAtDilUNahDYv0nSRu
         9323QC/Q7fbYSWAEbcDsfGHXr9Kn3PROPFu704PzWP6W8VSMvCfP/IOoD51BpWTF2Ob6
         HKbtEM4SxiNy1GiKs8FBPkzO5c2G7wh6a/NNyByJLpSqSD2Re1IgIAl0Mo5OtM3m5/eR
         gv550nkACRXHBSQxvkdbAn9NVhMfhST49qSPId813tNFXaoiWYrxZgu6L3DjGMURh57O
         aSaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuBYYDQSEj5oE2t6U2LyV5495OSgpK6DV3tzJYMdEdqIneSP5PdgWl1JEnIoT/v50xiTpRLvVsPYdQyFk=@vger.kernel.org
X-Gm-Message-State: AFuF++lgfmYdPP5wW7d7nTCuUQ2oEnlNRQzgLHxV+Kk0UR6l+MzXHOyL
	dXD/JPlYvN462OtcuIf7OOOZ12PESBQZXcLPnqnZ/pcslGOhvK0kVeqi
X-Gm-Gg: AYBFou2JlnL+5GY9+2EDeln3AIlw+bC+SLtoOJQSRK+0M5i3q1BgJ8s24eyUPk+Z0tD
	rUauoe6fDXLaS0rcwU0+G2yMlLI/rPuGhQKGjaKiIZCo7v3jRBfXkS0YDK2JzW1l092GAZGLypy
	ieCoThxCwIcJ7gbmWExL5OaKYxe2XPeGM5rNBH5QPsw2vkOAkmoBw0IaCX2VD5fv4lRoSFb7DlG
	WTjvOb62QM309U4uMcGEZ88QsOOJTsPK5IEWUejegoVjUJsG36fqjXNji+BOOdkvAV1k1rrH/z8
	B84mmC3Def7wCuz4rDTrcdo7P0TcAy4Dtr2AJPgs4PFq9L7XikiBvZJ9Gz5axeAAartsBvVcSvc
	FfM8BDpM5s4ibqgh33XGAqJKGbZLIRoBzib9tXh3AByA0I8Tl9xgZ3XLmLPeogz/Bq+Kpq2scNX
	p4l4rCv1DMBLIsH9jC9CGUoZ8Lea4ClAnrcO7pSaAMFZjU9m8qA7j5JzV9iCydYpMGrUIJDqUtf
	tHEof+GZ96ongijFe/yi/Zw
X-Received: by 2002:a05:600d:8490:20b0:49c:f89b:f82 with SMTP id 5b1f17b1804b1-49cf89b1bc2mr525615555e9.12.1788946045572;
        Wed, 09 Sep 2026 02:27:25 -0700 (PDT)
Received: from kali ([169.224.126.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c074asm41558442f8f.23.2026.09.09.02.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:27:25 -0700 (PDT)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	razor@blackwall.org,
	roopa@nvidia.com,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net 0/3] vxlan: vnifilter: bound the VNI range per request
Date: Wed,  9 Sep 2026 12:26:42 +0300
Message-ID: <20260909092645.3105263-1-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907141001.GA708129@shredder>
References: <20260907141001.GA708129@shredder>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A single RTM_NEWTUNNEL or RTM_DELTUNNEL message can currently ask the
vnifilter code for the whole 24-bit VNI space, and vxlan_vni_add_del()
loops over that span under rtnl_lock creating one VNI node and one
per-CPU stats block per iteration. That is reachable by an unprivileged
user in a user+network namespace and it costs roughly 2.1 GiB + 1 GiB
per possible CPU (128 B slab plus 64 B per possible CPU per VNI): on
2, 4 and 8 CPU guests every full-range request
ended in a global OOM, with no errno returned because the caller is
itself OOM-killed, and with unrelated root-owned processes killed on the
way down. Because rtnl_lock is global rather than per-netns, it also
stalled network configuration everywhere: a plain "ip link add dummy0
type dummy" in a different network namespace takes 0.011 s normally,
4.472 s while a 1,000,000 VNI request runs, and never completed at all
during a full-range one. Patch 1 caps the span of a single request at
4096 VNIs, which closes both. The cap is on one request, not on the
device: a device can still hold the whole VNI space, it just takes more
than one message.

Patch 2 charges the VNI node and its per-CPU stats to the caller's memcg.
With the cap in place this is no longer the primary defence, but nothing
limits how many capped requests a task may issue, so an unprivileged user
can still accumulate VNIs 4096 at a time with none of it charged to them.
It is also the same class fix as commit 1beb81947eb4 ("net/sched: account
classifier filter allocations to memcg"). One limitation is worth stating
up front: try_charge() reclaims and then invokes the memcg OOM killer
rather than returning -ENOMEM, so accounting confines the blast radius
without producing a graceful failure.

Patch 3 adds the selftest coverage Ido asked for, in the existing API
test: a range of exactly the maximum is accepted and one VNI more is
rejected, for both add and delete.

The limit is a driver-local constant rather than VLAN_N_VID: the values
coincide today, but a bound on a VXLAN netlink request is not a count of
VLAN IDs, and coupling them would make a change to one silently change
the other.

Patch 1 does tighten uAPI: a request spanning more than 4096 VNIs used
to succeed and now returns -EINVAL. Ido's assessment was that the limit
is unlikely to break anyone, since vnifilter is mainly used on bridged
VXLAN devices where the VNI is derived from the VLAN, capped at 4094.
I am sending the series to net because the stall is reachable by an
unprivileged user and crosses namespaces.

What I am less sure about is that Fixes: in net means this reaches
stable, where a script issuing one large range would start failing
across a point release. If that is the wrong trade, I am happy to respin
patch 1 against net-next without the Fixes tag.

Two things the series does not address. A single-VNI request with
START == END >= VXLAN_N_VID still passes the span check, and
vxlan_vni_field() shifts without masking, so such an entry is silently
truncated on the wire while holding its own rhashtable slot. That wants
a netlink policy range check, which I will send separately to net-next
as a pure uAPI tightening.

Measured worst case at the cap, on a 2 CPU / 2G guest: a request of
exactly 4096 VNIs takes 0.031 s to add and 0.022 s to delete, and the
cross-namespace "ip link add" blocks for 0.024 s during it. The old
full-range request is now rejected outright with

  Error: VNI range spans more than 4096 VNIs.

for both add and delete.

The whole selftest file passes before and after: 27 tests passed and 0
failed on the base, 31 passed and 0 failed with the series applied.

The 4096 limit follows Ido Schimmel's suggestion:
https://lore.kernel.org/netdev/20260907141001.GA708129@shredder/

Ali Firas (3):
  vxlan: vnifilter: limit the VNI range of a single request
  vxlan: vnifilter: account VNI node and per-CPU stats to memcg
  selftests: net: test the vxlan vnifilter VNI range limit

 drivers/net/vxlan/vxlan_vnifilter.c           | 24 +++++++++++++++++--
 .../selftests/net/test_vxlan_vnifiltering.sh  | 13 ++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)

-- 
2.53.0

