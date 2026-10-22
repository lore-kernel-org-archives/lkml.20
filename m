Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792643990;
	b=as/N+SNNbt0sVecc6pZqxFAxknaiGQdQNTdLW3qtyh3dCwUzNqYB1iR2+LONYCykQWHt
	 xTSUhokbyh1vXfSfyXNDfGirOC5oQVundReGRg7EqxpTZTAy4gKCWPnVGbSyUIHTz2155
	 UYNRymM8yLSfiihDYJCDCjDrorES8NGI5rhUpLEMeF3IXiLB1hdT+izeAJQjcahAAE+T9
	 pDMF/h3oqNHHS7Ixo1TIi6cLCPAYl+sTPu5u23cKsjuoAFHHSt91bMHGrfjBhx4ZoK86S
	 ZzgbLxS0Qkz8UZ1u+tQvPYVCLpmKQC+2DpocBYUlO9OZGB07QFbyIjc0BR2DsGywB4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792643990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=w4GGR4RrI+WpSu23nEixIdxqCGs3LYn4cbTByEwGCuA=;
	b=g95PLoD/RtjT4TzrIu/EAL0K9+zt15Zak43HZGRX4GIoJNRMJ0r3iNYC9RUR3b8DjiEc
	 Q3eybE1j7i7gISh+FuZPxxwoGxlE1o0r3d33uFsJ6F6R0WVmgZoHZxtKIUYc6tjH83MfC
	 6Z5gExaUp6hDVuKFZZvJ6dYhsXFPLBMecinDsQxFQlTugVdvxhb4lpYQMkk8mMHfpr5f+
	 r6gVAcurwEsm+fx04ihz6dbSjRjaEp8toHJ452TfPKIdZyH0/nAewULebssmrtqRzhWId
	 0h9RWIwKvNrMQ3jT+zOI2Dfk76O3hq355UXr1Q4zticqLFZg+f0EToDxpDkWWajxwjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="CEGZ/Rqn";
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA8A606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCA8A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=CEGZ/Rqn
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-917997ab0d9so14742096d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792643989; x=1793248789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4GGR4RrI+WpSu23nEixIdxqCGs3LYn4cbTByEwGCuA=;
        b=CEGZ/RqnDCh/Cjrx7zrC8NcjDbFgpF/Hc18KhdRGn25giAXeGbKq4J9Z397XrpKcq/
         RkduEHQZYkAZxRoG6j0+crPE865xnwo6nDdRcXBiXUsJfvc10kEGPgOZXI14KBU0Aw7E
         jaLLpivDmxNyt9t3ZwoMvUUudDFeUigP7K+i34cf2IVlQp6msRIwfuZrO8/3df4fQWqb
         uvAhBdjTWvLkM+lq653jXRkl2jwhgPmTXN6A9WtSgByHLrYh8rxBu9ein/cz1PQyH4gL
         +KL0zrPREQMrc+wX8vCnR4rmRVI4okX0/0M5F/NuN/kzPCcYaeff8gXC8TqYmOtxUD7e
         29yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792643989; x=1793248789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4GGR4RrI+WpSu23nEixIdxqCGs3LYn4cbTByEwGCuA=;
        b=x0Ul2gRip1MNqptJuw4ErGge4M+5g0KGNRPk5PO3bmS5y34gQNpE9C7K9csUXbu/Ko
         YRpTC2yR+fca50NNFe+DaeDWEn3tmcEY8gYAi9qvPYzqOBYhpA2klqFHGff2ptHF5HPU
         0WX3/XLgwLQ/cAlqLOOQ/luNfkrDgroEihwAlRxFF+BWPPOdbeGFoVzGZBINJ9sQdRrL
         Tc5XYO5hxJF2EDIwE4CyorNEODOn5uW/fZNRyXcmwJ0cot8QnGru02X+otgcw45hJUG7
         sbwIz7wMaEKxkWZW55sbczwblPoVuUvl7WW8vuKzf0yVXOL4QarLu3gRmwY23ghC30xR
         UkzQ==
X-Gm-Message-State: AFq9FYJpLqmNZXVi7OYu9OS2MHLPTiZTh9qMvO/JJ7xRrdyOxdpw4hmd
	/a7h1idw92uusQzB+9OIoaKCgm0aic3NaeebNxVnjyNCw9ftTJoTzwEWEkUnjPmIWKc=
X-Gm-Gg: AYBFou3kKNFndiluDaJ4pFVdThN/2Fy1/MQk91QkhO4UgVZf1b71X+DPaOB4o9VY9A3
	g9dH0eJ5ITx49vkz3MStJfUvI7gxfaZjyWsAPxFHCuDK95BQfxR7OFfvfkNh8HHVd3+DS5V91pr
	geDadaPW2BNynq2cGEEskec0mhfY60BWpQT1wfwaDkvRK9Edmr8Vv1Z2pyz9FwkqQfF6p/mjuWp
	7q8P8UPQqI9mdu4dK7/kuJrxuXobknDH23Nx8cLVnSWDpuex+9Gi1nZ0uGYGaLA4K+B/RzGtiAo
	+XfXuuTV3wnocmruDarK9U7kkhk4gEHD33nz/kHumtMnMC58ELxQF5g98AOQ2GjqRZ6SbpnN6c3
	Z6viBnwIbooLldNQ6F+kVj7ifBxMAfWzz72NQ6AGrMYMd+dE1KL8keHBXOBvCMGe6dwNi9c7SJ6
	5CHcUgUQ7YFflizYPWZwAsyNSltcw0y65UIloGjigaevGtWwqreL629fShBrSH0AcTQ+iAaMg1S
	TwnUeVoIvl36FdKmxds+X7ePrFdQlMeUaqwvB5JkUFUB5LJtLt3D6GkSnvIa9p/4LHldQ6vWXa6
	cssghN1YdsacnIuRCVsJWZf/kLjadnRzHnbchHtjCo1ZgSFVaEY/SAJ0vCR/3RQ=
X-Received: by 2002:ad4:5745:0:b0:917:92c7:ce45 with SMTP id 6a1803df08f44-91c12f05914mr70612446d6.37.1792643988805;
        Wed, 21 Oct 2026 21:39:48 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10b72c02sm42190176d6.11.2026.10.21.21.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 21:39:48 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: cgroups@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	longman@redhat.com,
	ridong.chen@linux.dev,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	akpm@linux-foundation.org,
	feng.79.tang@gmail.com,
	mhocko@suse.com
Subject: [PATCH] cgroup/cpuset: check effective mems for a movable-only configuration
Date: Thu, 22 Oct 2026 00:39:43 -0400
Message-ID: <20261022043943.3125239-1-gourry@gourry.net>
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
Content-Transfer-Encoding: 8bit

check_insane_mems_config() warns and enables cpusets_insane_config_key
when a cpuset's tasks can allocate only from movable memory.

In cgroup v2 the request may name a memoryless node, which has no zones
and cpusets reports it as a movable-only nodemask.

For example, with node 2 a CPU-only node:

  # echo +cpuset > /sys/fs/cgroup/cgroup.subtree_control
  # mkdir /sys/fs/cgroup/test
  # echo 2 > /sys/fs/cgroup/test/cpuset.mems
  # cat /sys/fs/cgroup/test/cpuset.mems.effective
    0-1
  # dmesg
    Unsupported (movable nodes only) cpuset configuration detected (nmask=2)!

This is a bit confusing, especially consider mems.effective ends up with
a valid nodemask by-design (cpuset.mems is treated as-if it were empty).

Check each new effective mask in update_nodemasks_hier() instead, as the
hotplug path already does. The allocator's bail-out tests the task's
mems_allowed, which comes from the effective mask.

A request naming a movable-only not present in the parent's nodemask
no longer warns (since, again, the cpuset.mems gets overridden and
treated as empty). However, it will warn if the parent's mems include
the node later.

For Example, with node 3 a movable-only node:

  # echo 0 > /sys/fs/cgroup/test/cpuset.mems
  # echo 3 > /sys/fs/cgroup/test/child/cpuset.mems
  # cat /sys/fs/cgroup/test/child/cpuset.mems.effective
    0
  # dmesg
    { empty }
  # echo 0,3 > /sys/fs/cgroup/test/cpuset.mems
  # cat /sys/fs/cgroup/test/child/cpuset.mems.effective
    3
  # dmesg
    Unsupported (movable nodes only) cpuset configuration detected (nmask=3)!

Fixes: 8ca1b5a49885 ("mm/page_alloc: detect allocation forbidden by cpuset and bail out early")
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 kernel/cgroup/cpuset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 8ee239d5c6b48..70fbece1b9399 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2795,6 +2795,8 @@ static void update_nodemasks_hier(struct cpuset *cs, nodemask_t *new_mems)
 			continue;
 		rcu_read_unlock();
 
+		check_insane_mems_config(new_mems);
+
 		spin_lock_irq(&callback_lock);
 		cp->effective_mems = *new_mems;
 		spin_unlock_irq(&callback_lock);
@@ -2848,8 +2850,6 @@ static int update_nodemask(struct cpuset *cs, struct cpuset *trialcs,
 	if (retval < 0)
 		return retval;
 
-	check_insane_mems_config(&trialcs->mems_allowed);
-
 	spin_lock_irq(&callback_lock);
 	cs->mems_allowed = trialcs->mems_allowed;
 	spin_unlock_irq(&callback_lock);
-- 
2.53.0-Meta

