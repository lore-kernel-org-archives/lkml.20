Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED1F4AD7C3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016708; cv=none; b=grmjlX9bq+94Wc+Vr1YfY0UHBUhlzbjHm6dyEhwrMS8UxObLInfNx82Z+20C+sIbZQgKK8GujyPProbUaMdx+32gW1Ec6ee5XhfKngK/qykouc3E2fcDkuzSiibgof31ZdOjiUcDZzqepeRo8WrhmUc69Qu4DoCs08Z2qO2VD40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016708; c=relaxed/simple;
	bh=hfvB5WHRTQozrNyoakBODE3S1Lb68W/sTFfmK2qbwAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OLF9O4CZyejuaRttytmvwevNDXugoZ1h/Pt7mq3Q63ApbpFUZc7T2fl3SUo/LDkPpaSl9VLSTNq1/whpR1uccTBVebGUJ4/veZHEpKqP9rDIpPUMHoQmwy/0q+bQ/+SPCO36L+F0SGxK3I2qv4IHZ9MBdaCoUmJrM6lpn5falLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=OVuqGwNi; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="OVuqGwNi"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5339199d8c3so44729741cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792016705; x=1792621505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pX7eJVw8NKbWVjClJVlyeDcXYqLdmF7XB6xKTvch9pw=;
        b=OVuqGwNi4olBPQQ7eVfJm/3nIHV83c2rvUSx4MtDBlFar9mCtEx+XaDLxE/J90jjLC
         gBzi+GoN8QStnsG0H0V51vL77no2K/Ogw5SfkVYbPQAS0ghOL7vWyLpfPY03HvofowQr
         th1ngCnOazhTMNgMeT6v1iDa7+OFZDZCAaNbKVcfJ5bZrdGYzJyK2V6sDJNz1Kmyc6Hf
         /xrHw2Qkr5cdipNimW9BEG8xIBfgL78ZgUcQLmtlEgFSf1CnWaHu8OSBjN/3HhIMni7u
         zmUyUvSSwBl+g2NgUyiuq3arMKREaYE0py4C2ri/hlJ8I0llFYqna6ifW2b5f8qeA5Rf
         qijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792016705; x=1792621505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pX7eJVw8NKbWVjClJVlyeDcXYqLdmF7XB6xKTvch9pw=;
        b=CapGm74yiiDosP7iDhKaO77BizuzoW9Z0zLn0T1Qm1DsrFf/CcxPs9m3AxuLKq5+xC
         v1mb2mIXLKM90QUqI1kmdgV4N72veguUqW9eqDtsNNqqRciPiXNkXepoYyR37zt9obxO
         yy6qO36922+iKplVcDaTPvprowjARCiQN65CHawm0gJhHpGLalQ1bJivCL/gB7VD2AxN
         LsTVtP+BCnRPU3s7yxO2Dd7BAq1cRPcIf9bTjC17C7tKqvxTsMqzjBhx+QtfcM84rQbW
         ugf5CNF74dsU5I8TEIBbYi+uGr2gnk6xvwMC9WYVyDUL/NjhKctI1Ts6RRZQPpLIYShx
         4x9g==
X-Gm-Message-State: AFq9FYJFl/wogQarvgrQw/gjAGQxIuQQm4KDG7Xdl2JmXAhctmsIgE/6
	yQ8DQZ2dpeXoEfJqRYNSlaPudKdNIMG87wYnPM4N74XJD0FKMfNDrgbsClgigkI3azw=
X-Gm-Gg: AYBFou1qTsiStesumWJ2fHV50plErvZf+dXB6sypayxxSUnjA1pRtgcyNtu1cROzxGj
	7MlNKCUPyx4ImIH/TZocKseLvXRufQSydrr/GkfU8sFh5xR0PiajigXXE9sMQSFUDvhMXf6DsYo
	4AfAq7uDvSSTgRPgo4b28h4867retHhiUnIxsECehyBboqBmgfOAkKbh3hFqrzD6pj6PH+Is78y
	r8F/WXtLSpFF35iBN8w+i+sRfD8venkGXgqHJIyl8TH6HNHRPoyHYXRXxv8bX0qtWRSGf+OZ3BT
	EbY/MJWmHgvBmSWwYgCbX7wtGWLOJMMhJEPqgPw8WMV7ssMF0TqUnkZw0UarQ1DAXYL6QSoNHrX
	hezM4Zpf53zBLu0+ry24emDLYBEndtbtBL1FcbM2ObpJsJ3nDPxhfyUN9tei5QP85NdBmwH3u7W
	rWc9ezozdahjE1RD0w93zYtDf7HRY0VV/IG2he8On49nAZ+kS7+bVxZu8mRJBL0eHHkg5qb2sfS
	uZBAqklVbkMjdvA8DMTVyzcQOw3Fju/pFSD7G59upLuae9bYoq+fobQTWh6
X-Received: by 2002:a05:622a:13ca:b0:535:25db:17ae with SMTP id d75a77b69052e-5359f48cabdmr289086201cf.11.1792016705227;
        Wed, 14 Oct 2026 15:25:05 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536128418b2sm8652601cf.30.2026.10.14.15.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:25:04 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org,
	cgroups@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	longman@redhat.com,
	ridong.chen@linux.dev,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	akpm@linux-foundation.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	ziy@nvidia.com,
	david@kernel.org,
	mgorman@techsingularity.net
Subject: [PATCH 2/2] cgroup/cpuset: use mems_allowed_seq when checking a policy nodemask
Date: Wed, 14 Oct 2026 18:24:56 -0400
Message-ID: <20261014222456.2318284-3-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014222456.2318284-1-gourry@gourry.net>
References: <20261014222456.2318284-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A cpuset update changes the task's mems_allowed and rebinds its
mempolicy in separate steps under mems_allowed_seq, but the check
reads both without it.  This can cause a spurious numa placement
miss under some cpuset/mempolicy combinations.

A reader that loads one mask before the update and the other after
it can see a spurious empty intersection and drop the nodemask.

For example, a task with cpuset.mems={0} and MPOL_BIND={0}.  If the 
cpuset moves to mems={1,2}, the policy is rebound to {1}.

The allocator can race and compare the old mems_allowed {0} against
the new policy {1} - which will result in a dropped nodemask and a
misplaced allocation on node 2.

Simply retry the intersection until mems_allowed_seq is stable.

This covers the task policy, which is rebound under mems_allowed_seq.
VMA policies are rebound afterwards by mpol_rebind_mm(), outside
mems_allowed_seq, and are not covered by this change.

Fixes: cc9a6c877661 ("cpuset: mm: reduce large amounts of memory barrier related damage v3")
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 kernel/cgroup/cpuset.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 3f52717c19654..8ee239d5c6b48 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -4354,10 +4354,21 @@ nodemask_t cpuset_mems_allowed(struct task_struct *tsk)
  * @nodemask: the nodemask to be checked
  *
  * Are any of the nodes in the nodemask allowed in current->mems_allowed?
+ *
+ * A cpuset update rebinds the task's mempolicy and changes mems_allowed in
+ * separate steps, so retry if an update raced with the check.
  */
 int cpuset_nodemask_valid_mems_allowed(const nodemask_t *nodemask)
 {
-	return nodes_intersects(*nodemask, current->mems_allowed);
+	unsigned int seq;
+	int ret;
+
+	do {
+		seq = read_mems_allowed_begin();
+		ret = nodes_intersects(*nodemask, current->mems_allowed);
+	} while (read_mems_allowed_retry(seq));
+
+	return ret;
 }
 
 /*
-- 
2.53.0-Meta

