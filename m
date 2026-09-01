Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423D827FD76
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265617; cv=none; b=sPENS4CSKp/2YSWsrUTsHz2V/NfFcaRYHdmgtr25DTA6OiisWXdAz0BJu1DCM1+lAGXB7njQ1aZwli684oNkFrKMlo0xq7GZlTHNK5sYG99kNC0OTsJZXHbwdS0Zy5oQgUV0guHOxHDCfE9er3v3A9r/M7ORG9fK/SEQY4ih+54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265617; c=relaxed/simple;
	bh=7Q34ACZX39BwIgyh4m+8rA64bsnZpabLgc3mbIx2n/w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Mhb5bqgM/6F0bwARM4MRzG3tBM7LiNc3EANfE52UhpUYgv2smNsBN3YEILKERg25Z37YzyYy9hmZMmbu4bkZ5c87A+A5FPCrbS6Qm0p4Hro3yV3d0aksaGLKYM1Mr6NbrahfPrkJ/zOnCrRpJcIFL57+xHdAG2nj5o3uHiXSrvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+V8iEj1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+V8iEj1"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4843750de83so553487f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788265614; x=1788870414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f6qpjX7WWAJ2cweV8AeFtOfMeKDPxjEBYU+hvHsVykk=;
        b=W+V8iEj1SYJmqTRgLxIijEMnL3aHNyuEuY4C2dSOsK7dH1KZjC6zDmRM8n5GMKp1ZK
         SuX6ipU35B4rp7XVbnYm0cBV55Ix7kF7RniaYVbPHukcutZRJSknGi1lgZMhRNV589AU
         yszNSj4AlRy5PQxP6DeAIAE/paCn+pbNgUdFQ3EGAxZUMN+u810xqmPbUssZsNxE3QeV
         ydG1Ymkt+m2UNRaiuZ4epxzi99Ddl5Iu1SMCyiHWoRhJurLoIiRLoFmMAlVbREgm7xAe
         9gHXPwEEPXrkBB4q4nr95hcW0m3x/3EEoPac5ITr/zek8JWVnxkYBK+zl+dqcJoRHmpb
         LcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265614; x=1788870414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6qpjX7WWAJ2cweV8AeFtOfMeKDPxjEBYU+hvHsVykk=;
        b=HmeX0lMqbAJ7pzK/9/eDb69Duj7hkgmJeU8DINV7AV+L3UDlWxEG7Iqai1oPEj4KlX
         L/XfTmofH9/Nx99Pgma6e/jm9JMcHcsQzRZkJbqK2mGhVLT4YT1GoqxByKfiEtjAt5o4
         wmWT0WALhusPB1IvtfZUhusKg1zsF/B/dMfehoNVwk0R8UdLOxLBEZ5oG0CYZDDVuX9C
         kNXSa3YN+3xOXbmdpJeAhOfqUdek2t3cQyLOMb6JNwTYWL8tzXM+y0Qd+2hX9Ee5XpgL
         MMb/erRpnq8yD/HBbHq8H18qJ0Tq6BbDRrJzMQcpyhrkNRyk5PqPGZvJlbfV8m723+Gu
         PGRA==
X-Forwarded-Encrypted: i=1; AHgh+RrnhXvaJ6eX5CmAbWbXNwsNaNnfFxI0WRCc/VgyQs37kM8tmq4iuaSvia2pfDt89kouPemi2cGDFrBlTfU=@vger.kernel.org
X-Gm-Message-State: AFuF++mYF7c3u6KW6CO0ibkpFuG3F/ukMq5DlTloWoDO+T/ZWfTa1kUE
	M9xgO5i6smT3aK4ozj86M3KCpFLuUnGKTOnzvwbmGodSSOVtevgt5FNa
X-Gm-Gg: AR+sD1010mpbsDlSAMCOljMgwwFyupLTmXEiHxBBkAtDendD9TrjaoPEp4DVw/qQtzY
	g3vKhKlRmL2A4rH/QWWfLJdLDdEqesnY9k+C1Po8xdB7w6jkre99JO3oasuFe4t+13TfyvBflRA
	nZTt2MK218WnITLRcFYQEJkb+1MEeyyiVIduinfuBImmYdrgNACLwFcqhzJYWsjcZoKnn8O9262
	wL2ZvPXGjYL7Az0huV4ETw2uetP0LnunTOXqzJ0e1HlyWRS16ZU6CTOd13HvbNorfyfUdn8ZlzM
	HlxssjjY8kdN/A8KI9mc19txfL2VZ38EbMhLElQ5tHGX4Xl1y99Gqvm9KO1z6MOJ1KcXjI02Mul
	rnfW3ofINze0r5XN0tJoPE/9k4ANExL1BiZH5ofbuh1/+gL82j2DaqlvJ9QL2EJnULY6V8es1uh
	1Ye9Kj9UfFJVwZ+i8rVYSXTtHbj+a/pcLFTADnjp/8x2Ps6cAKwlFVS1F1/7Mbe13MBINutDlx1
	XFr89uSe2Cxn1vwJcqHpgOSMSMoUSjInNCL/PVKgbFwyG4gsU0a7DWHZdCEjYEhFOtuu/Fq0LmU
	h9+VBBYiX87Maf06THv8cZdMUzyRcbgv7LiimDfqvW8ec4llMaXVxWPAYhGnCsBEwtw=
X-Received: by 2002:a05:600c:6091:b0:49c:d60c:74e0 with SMTP id 5b1f17b1804b1-49cdc44a420mr156178575e9.13.1788265614057;
        Tue, 01 Sep 2026 05:26:54 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a16a-7801-fd8c-4b37-36b4-e53a.310.pool.telefonica.de. [2a02:3100:a16a:7801:fd8c:4b37:36b4:e53a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce089c2sm64755395e9.2.2026.09.01.05.26.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 05:26:53 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: stable@vger.kernel.org
Cc: Waiman Long <longman@redhat.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>,
	Chen Ridong <chenridong@huaweicloud.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 6.6.y] cgroup/cpuset: Fix misplaced DL migration reset
Date: Tue,  1 Sep 2026 14:26:42 +0200
Message-Id: <20260901122642.11571-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mainline commit 4a39eda5fdd8 ("cgroup/cpuset: Reset DL migration state
on can_attach() failure") puts the common error cleanup in
cpuset_can_attach().  The 6.6.y backport instead placed that hunk at
cpuset_can_fork()'s similarly named out_unlock label, while removing
cpuset_can_attach()'s two existing targeted resets.

If cpuset_can_attach() fails after accounting a SCHED_DEADLINE task,
cgroup_migrate_execute() does not call cpuset_cancel_attach() for the
failing subsystem.  The temporary migration fields remain set, and a
later successful migration can consume the stale state and corrupt
deadline-task and pending-bandwidth accounting.

Move the reset to cpuset_can_attach()'s common error exit.  It is not
needed in cpuset_can_fork(), which never accumulates migration DL state.

Fixes: 14897ef9341c ("cgroup/cpuset: Reset DL migration state on can_attach() failure")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Applies to Linux 6.6.155 and 6.6.156-rc1.

A controlled QEMU A/B on 6.6.155 forced an attach error after accounting a
real SCHED_DEADLINE task.  The affected kernel returned with
nr_migrate_dl_tasks=1 and sum_migrate_dl_bw=104857; both fields were zero
with this patch.

The equivalent 6.1.y correction is submitted separately.

 kernel/cgroup/cpuset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index f9c7178f51ada..bb413045d1744 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2630,6 +2630,8 @@ static int cpuset_can_attach(struct cgroup_taskset *tset)
 	 */
 	cs->attach_in_progress++;
 out_unlock:
+	if (ret)
+		reset_migrate_dl_data(cs);
 	mutex_unlock(&cpuset_mutex);
 	return ret;
 }
@@ -3462,8 +3464,6 @@ static int cpuset_can_fork(struct task_struct *task, struct css_set *cset)
 	cs->attach_in_progress++;
 
 out_unlock:
-	if (ret)
-		reset_migrate_dl_data(cs);
 	mutex_unlock(&cpuset_mutex);
 	return ret;
 }
-- 
2.53.0
