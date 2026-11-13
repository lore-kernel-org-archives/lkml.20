Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794598011;
	b=0YXplck6A+7sJgtLtYQ7MldRwmhwIauVEB/C3GKnh450vDAzXP3WkmF5d+dl6PgJnYpv
	 WddUXr7p4QEtgelqryHFAqli57iK9eMKKYY8JPjSxfXM3i1KINYQnrQbCt7D12xBDKVLv
	 R93RCbJFzOYidlFwjVRLMyZhhbKdM/4V1+OnemgekiZ5P6nxmuGk+xpXVITnpYRx0OoOu
	 7qcdNOD5FTcGPdXjHVEuw77zn4j0rQEVxuaDWbwRuZ7KHDHZmfh7uwW+ApmHtqOcCFFcV
	 zqUinDAo7T4MpIL7LmfYpzYgjtq/pY8IjxxpVLJsUTXQK2nIXNtzXrMtGpJt0rXryiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=DxM3tUlrWqef1Vb8Me+krOFyTuYnMoIMiKuZH3CS+yM=;
	b=F7Ql7VjWYFDEX73n2rmrr31bxR2dqEMkGLM/LquEHYLycS+3ZHji+F+DW7KOPTKW9i3U
	 8kSOSUt31uoChrd2I/RydLlqugeiPrEEFYX+SXWNzEBT6POnO2BrWtkoUFTKUTPGLbWwY
	 GAj29yPYAhH85gn7a0TWCLXD4A7NRrOuif42Faq4bf7JhURS0i6gCpF7AFJiZ9xx+pdVz
	 d9NdhIb1YFuzovJoq0c0safGi+s6tXi//OY//rGJK9jZPNjoRhgI6JLoOEGEktMXbOmG4
	 r0qqQSy92l3q+lUwXWDGyxSRbS4iZtE5ut14XKFK2sM2Cz5EqMGbOsu+xCRRkYkrR4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=hIVxwI0M;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C561C606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C561C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=hIVxwI0M
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-94959217274so179566885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794598009; x=1795202809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DxM3tUlrWqef1Vb8Me+krOFyTuYnMoIMiKuZH3CS+yM=;
        b=hIVxwI0Mv3tq33X/KnPKtJ73JiQ9IHVA76ZB+px5TWyGh2FRFMeXx8iWHF6NPX/APj
         Y2IBWB/u4QkC6SAiPxlFUXAN/oiNQ99N0g76RvWI/wpD5ycZH9YZCg/Vhk7jUlbiOmum
         43uBXJRr3ueN0NfvFRtTISI/2UvHa6SHcDUyZbe1f4m5QF3QiY8ghCiwCpiu8Swi/ZmF
         DjYrPvg2hoSu1te2flf7V0Nq13U6orsv3edZEhUqBuJnUJ4cVNls1vbx7dUMb+w3SqdY
         ZOqI/TUv+65X4ZfcAu4JQFV9lcbdpyi5Ix+phym6rFGQ/ySQEuKltrIddf0bMN7vjToT
         krfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794598009; x=1795202809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxM3tUlrWqef1Vb8Me+krOFyTuYnMoIMiKuZH3CS+yM=;
        b=aMixdPGEWrbJWoWQz8B0G/n9RL2DYsK3o7oXGWlL+sjJVIVvFsU4qVP4zq46UKjSwe
         sqLFJdbnI3RpVOQRD1DXLjMTbV0nx08uyZLRdYmZ+6sONLH48PhbkZu4lqBwyOR5wnPi
         khr+R9MTTARAXAAdWw8BxB45bnpeURWWFHY0h6fAN8RWcZnGPYlamwdC+j3tdLZlcG3o
         GB5LcmqY4eDBvkNnB4bBwG9i9/X0IXIF2PeEP2SyG5HMHgWaAm7lUB/tzT2Iy/Ad07C/
         UEMoS8Mz3dSFplaGta7t9UCMyZOyrWWAe744KDW/RFgXyeJYa+HyH9EjOvzVdcCFtMJQ
         m2iA==
X-Gm-Message-State: APuU4Z+Rc5J6uJQ80IUHXccW0CUsOCh9PdLjP5wRpzm7HeStnjOycxHO
	k5huFKyrCtfwedz8pFDpe39Aj8tO5uaNIlm2Tqti1TrN2KnzBIZ9oi5sk4A3VZ+/OcI=
X-Gm-Gg: AYBFou009NCqvgwvISrWIFVhsB56J7VeegUfh9OqAm7nwoCNpwhqFXpNV69KZXIztCs
	B2CFIt0lTh/t0gcoQSVq6/rL9n3g3mNeNaiXGJ3JrjJZjv1T2Cg7sF7Jngox6OsSOc5JVmCfid8
	YT/oHVzO49sFQuV92w9RBSM/+kD6qeiBLNaEwyT0JSLkmIAu3trd9maT7HrYNVbpi1mXhmekNMC
	9BuY7zNpvMYvPwKcMf10BzRkSWRl8LH7kNf8CU8MnK9g/DzD4JYJCPKTdlzXnIyzOaZw7pEKtmU
	4Q/9brF9SFtt2Nvn0rf/b0323jV04skU6eDvC3O7y+WlrcsbW30JtqywOR81U72g08flMGZmRFX
	Qlx99Xw1Bsm8BJhi2JttaGn0rMcq5xZM9KyYNI18sDig1H8leCfL0gRU874A2NQap3imxiIeN8z
	5YMImKFSG/DEkt7Q5pY3oicTQAfA8+ZbBqgarxVaxKkdv4Abfs3prrEXILKXRQWnlugIets5ZnZ
	C9UY6BErt+OrBscMDz8oNPCOxkdPxOZ7SM4iXVW8zj9p9GSueDf2cSjra4j7zE1jwzpUWnVT1s/
	n9+jInd+BLfy1wZoVENto4Sswi7YYpiWjyD0Aik759sv6xYZFeKdNVvAfcAOo789ISlXti654Ej
	Q43lq+i2P3M5T1LA=
X-Received: by 2002:a05:620a:1b90:b0:93e:bcbf:4ad with SMTP id af79cd13be357-9494bbbdf65mr506105685a.33.1794598009479;
        Fri, 13 Nov 2026 11:26:49 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23dc1a60sm26421556d6.45.2026.11.13.11.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:26:49 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com
Subject: [PATCH] mm/mempolicy: ignore a bind policy whose nodes have no memory
Date: Fri, 13 Nov 2026 14:26:42 -0500
Message-ID: <20261113192642.2618878-1-gourry@gourry.net>
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

apply_policy_zone() assumes that policy->nodes intersects N_MEMORY, so
it reads a bind policy with no N_HIGH_MEMORY node as movable-only.

On systems with CONFIG_CPUSETS=n, nothing rebinds policies when memory
is removed, so offlining all memory on the nodes a bind policy names
leaves it with none. The policy is then treated as movable-only, and
movable allocations are restricted to nodes without memory.

This results in allocations failures, a VM_FAULT_OOM leak, and then
an infinitely retrying fault that hangs the process.

  page allocation failure: order:0, mode:0x140dca ... nodemask=2
  Huh VM_FAULT_OOM leaked out to the #PF handler. Retrying PF

Ignore a bind policy whose nodes have no memory. policy_nodemask()
already ignores a bind policy that does not intersect the cpuset.
This covers hugetlb's policy_mbind_nodemask() as well.

If the nodes regain memory, the policy applies again.

CPUSETS=n with HOTREMOVE=y is unlikely a common configuration, so this
isn't marked for stable.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/mempolicy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index ca7e744727b1..5dc2d7ef1544 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2096,6 +2096,10 @@ bool apply_policy_zone(struct mempolicy *policy, enum zone_type zone)
 
 	BUG_ON(dynamic_policy_zone == ZONE_MOVABLE);
 
+	/* Memory hot-remove can leave policy->nodes without memory. */
+	if (!nodes_intersects(policy->nodes, node_states[N_MEMORY]))
+		return false;
+
 	/*
 	 * if policy->nodes has movable memory only,
 	 * we apply policy when gfp_zone(gfp) = ZONE_MOVABLE only.
-- 
2.56.0

