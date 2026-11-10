Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323643;
	b=CI/6TzxSUva//vQGwS8uB6048oB5jJfd+n2yEwhVGV8WLn+TkyFTms1Ah8flRbxPwcZ4
	 x2zQiuJeFwlgnW5j4jV1YjUJLz7jlUiecXdkTmGpGw7CwSxUKMZ5Q+Ah4wiCU1YpZFvRO
	 2UGqmYgAQGJBvrDgXgcKq4Jh099XtEuY/+oFa0myAVEAh5b1E+m96qquY6BYcwhXOtH04
	 aMlHoUaSlXHVEAl1O4lXOXFFPDqa1ueia4F9/VN/Z00P0Le7FjY+fBYNmhQKN9g9mYgUl
	 WYSPzAEVhwICW21ktRCr/pOSdLcm3+rlXnACILp9nrCvhGI6U6SLNtDvF6jH+nZZeUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fzDtepYpPhppRO2OekG3HqAvxmazW/tXwsXJOMA5LnU=;
	b=yDOlrBwobOdzclhJsmlXVcmXldv1Lp4Lf+pz3DJHCs4R3iWjGar7O7r1kSeUK2FXso3X
	 A/t5nePmpYn7vHWDxaA1Wb875M6lGYwAt8Unmnp1xgpg4XNSjR2JqkToonE5JHDhoXFAx
	 nq53U/lPkttNgyDAEfYObQzTtnPUv8aYAPkrEmx0DvxFZ3v8rvsg7sAZBhYDoCHqWtqXt
	 vw5LyzU71h2JQKKB3Fs5I0juydLoBeTbq7t4mpET0osGn2aEKpKjqWVbD9zgW7rPV5fLB
	 btVtwTPfsNDoYfsGDDc5oO0deVueG6WdGyspZbksX70oEr0vOK1HHRmcprU+7phzyWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=djRYAMmG;
	arc=none smtp.remote-ip=74.125.231.137
Received: from mail-oo2-f9.google.com (mail-oo2-f9.google.com [74.125.231.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB58606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CB58606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=djRYAMmG
Received: by mail-oo2-f9.google.com with SMTP id 46e09a7af769-85f2bfd7a07so805206a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794323641; x=1794928441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzDtepYpPhppRO2OekG3HqAvxmazW/tXwsXJOMA5LnU=;
        b=djRYAMmGefMtb6wren78btruzNJSKlkMMEb/G2ViFnFtspnoWA1dl4sdezgK2VT7Eq
         yYJmh0Mo6NTfElX/oLUNEcTf5MuQfm2X+0a8nJeTlVO4sGRjWmW/Kt5t7OkzFsqyeHA3
         7giS0wwyxd03nfRo+Ubja7En2wnKVVgYIaWBPV8sqTdNJcwHWHbfetjVzjCXcZIf7i1a
         pL/AqLsKSRP5xdtseVarYmC4XmxOvTos7PpB+gt5E+rQX0o9shmQVW3RXvgWGliOn0jv
         DpKA0zZ+19SYCLc465NMVpM5iNkjo5nbk6vkM6uCJp/iV6z87RSixobqXrFYRNyOLoCS
         XwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323641; x=1794928441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fzDtepYpPhppRO2OekG3HqAvxmazW/tXwsXJOMA5LnU=;
        b=lrEtfWb/ft65WRNDI1Y1lVtRdxw3cuGWH344trOaq9QLJAU2OUN+mfIkC/BbsA4o7M
         p35JyOMlvRsOZJcP2UZC3s27fx75M7ilqPqCxJXAx0MemA17tqzko91Z8rpaBVQ7at0w
         AnEgc64jRTSG7oUp0bUcKYexahCB4t0SOCFVDapxvcYjBfJFbgd1AJY6l+IskUnDj3KR
         Ssa0dzDT4jD/qTOIoNCyUusfTZpsojq91AwGBseWQu9G/U0y3lA/MNFKeOkvQByQwFTr
         ZPnLvVHdjopnhleQzbqF1updvvnsZxyA0ti6O7iUr820zCH66ERgRTgMCLZG8gHNO09h
         /iRw==
X-Forwarded-Encrypted: i=1; AL+hErFR91gQUOqkcYXp/IgltaobnOiDhhWzGewzIDbP0yvlEXJ9c7jSYnVAab56VEesZqJwMUCkSg9DhaYY//Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PN/7q6v1c0QsAx0LAiU6DDiXkMKyKZVNsyPkNgmZbhEYVYh3/
	Y/VjTFU86m3RWZqo6+1N5ZDxz4m0Ze1T3yYeIp3is57kGOJkRD/qCNErdhkM4zSP
X-Gm-Gg: AYBFou26PzS+qfos+ljb59+oedMnd9imrUiQdPWObJAZpMH+Xgk5NEY5sGEsKnbyJBu
	GR5v5SCPAE1574Buo2eAddl0I0jhCxe2uzd2lQNsQBfNuERxSJ/+GDAWYP9fDjPtYNXRmwnZMDo
	HtMFTmWHKkoqCG/U6uXYDnmfhlM2VEMxgtAbMqhYld+HswuELdmHVKyCcHwSD8U2kdRttzVt+bN
	TZOfbC98xZbJMVCjgXdwCCzsS9tfnVocGrMMGr+jCdVrjRufwiBlXJu6qQ1HzIHdI2+aPvgUl9P
	cCYg//liMcxgAjpMEvRLfp7zSuPU2BWLDscDjDZL+Q/LkmIYHqd3jn+HMiWlWonM0QCrTXwQOIF
	0zlccaD9iVFszK13WYeXY+e830vqWRn1uxWHvA5hzc/LuOOBtbqA/lGKPNGF2eVZCs2hR4VTgeE
	xJ1c0KKqzt3/lNA5Uh7SyUNlZKKLmvJMUHWMy/D/s1TI165U/n8vXGN8W59Z0cVdDdG+sOCkEiM
	uMqN6hfUX6huRA5kWwWqm7Zg9Wb2YkspWXW67hheje1wrEnstPZUjrMBzPxDelhVk7uofV4G5JB
	XoQ0mrN4Q9UPREFVm0o0OcaBWUT26Bz2oM8GB0qVonsd80siww1DbrfxOoS2NwY=
X-Received: by 2002:a17:903:2a84:b0:2e9:ca71:45f4 with SMTP id d9443c01a7336-2edb91d4de7mr23669695ad.33.1794316927647;
        Tue, 10 Nov 2026 05:22:07 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:22:07 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [PATCH v5 6/7] fs/resctrl: Disallow monitor group move when the RMID index changes
Date: Tue, 10 Nov 2026 21:20:53 +0800
Message-ID: <20261110132054.3702-7-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110132054.3702-1-ruanjinjie01@gmail.com>
References: <20261110132054.3702-1-ruanjinjie01@gmail.com>
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

From: Peter Newman <peternewman@google.com>

A MON group can be moved into the mon_groups directory of another
CTRL_MON group to move its tasks to that group's allocation while
keeping their monitoring data. Where the RMID is only meaningful
together with the CLOSID, as on arm64 MPAM where the RMID is a PMG that
extends the PARTID, the move changes the RMID index of the group. The
move succeeds, but:

- The group's monitoring data is reset. Its counters are identified by
  the CLOSID and RMID together, so after the move the group reads the
  counters of the new CLOSID instead of the ones its tasks used.

- The group uses an RMID index that was never allocated to it. When
  the group is removed, free_rmid() puts an RMID index of the new CLOSID
  into limbo without checking that the group owns it. If another group
  of that CLOSID holds the index, the limbo handler tests and frees an
  RMID that is still in use, while the RMID index allocated to the
  moved group is never freed.

- The tasks are not moved. mongrp_reparent() sets the new parent and
  CLOSID of the group before rdt_move_group_tasks() looks for the tasks
  to update, and the search then matches on the new CLOSID, which none
  of the tasks carries yet. The tasks keep the old CLOSID and the old
  CTRL_MON group's allocation, and the group does not count them.

Fixing the task move does not make the move work. The RMID index is the
hardware ID the counters count for, so a group whose CLOSID changes
cannot keep its monitoring data, and it would need a new RMID index
allocated for the new CLOSID, which fails when every RMID index of that
CLOSID is in use. The documentation promises that a move keeps the
monitoring data, so the move cannot be supported, as decided in the
thread at the Link tag.

Reject the move with -EOPNOTSUPP when it changes the RMID index of the
group, and document that a move is not allowed when the monitoring data
or assigned tasks would be impacted. Where the RMID does not depend on
the CLOSID, such as on x86, the move keeps the same RMID index and is
still allowed. Renaming a MON group within the same CTRL_MON group keeps
the CLOSID and is still allowed everywhere.

Fixes: 3e9b35823aab ("arm_mpam: resctrl: Add rmid index helpers")
Signed-off-by: Peter Newman <peternewman@google.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/lkml/3a637631-c8ec-4e26-a03c-5ac80d16fab3@arm.com/
---
v5:
- Retitle as the RMID index changes, not the RMID, and a rename within
  the same CTRL_MON group is still allowed.
- Describe the RMID index that is freed without having been allocated,
  and why the move cannot be fixed instead of being rejected.
- Drop the parent and resctrl_arch_mon_capable() checks, which the RMID
  index comparison and the MON group check already cover.
- Use the resctrl.rst terms in the last_cmd_status message.
- Drop the stable version range and the Link tags the changelog did not
  refer to, and link the decision to reject the move instead.
- Link to v2: https://lore.kernel.org/all/20261105123524.2282090-1-ruanjinjie@huawei.com/
v2:
- Drop the Suggested-by tag.
- Describe the systems by whether the RMID depends on the CLOSID rather
  than by MPAM, in both the changelog and resctrl.rst.
- Explain that moving a monitor group is already broken on these systems
  because the tasks are not moved, so no existing user relies on it.
- v1: https://lore.kernel.org/all/20261104101913.586595-1-ruanjinjie@huawei.com/
---
 Documentation/filesystems/resctrl.rst |  8 ++++----
 fs/resctrl/rdtgroup.c                 | 13 +++++++++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index b52795e03303..fecb2cd2b343 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -551,10 +551,10 @@ will automatically remove all MON groups below it.
 
 Moving MON group directories to a new parent CTRL_MON group is supported
 for the purpose of changing the resource allocations of a MON group
-without impacting its monitoring data or assigned tasks. This operation
-is not allowed for MON groups which monitor CPUs. No other move
-operation is currently allowed other than simply renaming a CTRL_MON or
-MON group.
+without impacting its monitoring data or assigned tasks. This operation is
+not allowed for MON groups which monitor CPUs, or when the monitoring data
+or assigned tasks would be impacted. No other move operation is currently
+allowed other than simply renaming a CTRL_MON or MON group.
 
 All groups contain the following files:
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index b702fe6dbbec..2dfb3b54338a 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4403,6 +4403,19 @@ static int rdtgroup_rename(struct kernfs_node *kn,
 		goto out;
 	}
 
+	/*
+	 * Moving the group to another CTRL_MON group changes its CLOSID.
+	 * Where the RMID is only meaningful together with the CLOSID, this
+	 * changes the RMID index and the monitor state cannot follow the
+	 * move. A rename within the same CTRL_MON group keeps the index.
+	 */
+	if (resctrl_arch_rmid_idx_encode(rdtgrp->closid, rdtgrp->mon.rmid) !=
+	    resctrl_arch_rmid_idx_encode(new_prdtgrp->closid, rdtgrp->mon.rmid)) {
+		rdt_last_cmd_puts("Moving a MON group to a new CTRL_MON group is not supported\n");
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
 	/*
 	 * If the MON group is monitoring CPUs, the CPUs must be assigned to the
 	 * current parent CTRL_MON group and therefore cannot be assigned to
-- 
2.43.0

