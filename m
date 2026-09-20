Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D86471CF0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928093; cv=none; b=JRyN7ORbnZOmQp6XzDOvuWxYXZ9i92xSfBq44Ct919b85Dx3NUjewaUEZ48Hj15vX6g3SOqamsiH/rkWtPyZw/V8CgbN3Ui8V7B/iJBQ+OXSFK5B6YIat6cH7GEG+I5RCOJ2MjRiQ4S25vObfFEzPiLP5myHzta74V8ILCY+iC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928093; c=relaxed/simple;
	bh=6e9PYLcx4cb/dyobaeVKbSLjYmejZQhCAXkUBmR+0NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+1+uUoIzRAuHpCo4UMgbo4gkoBgS0zUatW5Qvz1HaV2z0E4GpAFwcz3kD4TfK+OcacRX454gqCif4NweWiPECKnJn0sP3UorUZPtWlt5wM53v9ZmzHhuM5AsoAlPgr3NxrcKV7soSUbwhzSpfaFPp2YWPFADHnHmHX0N+Brpzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ehmszl29; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ehmszl29"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddaa08c890so20566255ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789928091; x=1790532891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=78MZgf5P4Kpkmmf2WHQZAsRyEnedhA8FT/mxKha/EbY=;
        b=Ehmszl299AiMP6R6FtjdKNg2D8SMLMfgtThMR8Ou6Cq9duepUTSo217WKjnI4TeZlJ
         7GfmTyXpTd8Sd5ZBjO9785c0tXp8KUHMjkfzCAu8vVRwqRwxxPj1v1qafcxbKCIKCjC4
         lODOoJf0/kuo9neabiFcaVeUVT5MA1+9doKTEIvhdPLPSZiExKTRbomgVc7NPw/sUTGl
         j2kbV9jhcGDAzCjgRmlr3LPNTPfVxAkqMTRvaB8+CYwIqqwKmcKfc8QAlVB2ZDcJscHc
         GjbpHWxIsTYEgNZ3VNKHqCQMRGHFcPomU9FPDM8HHP8fTEcm6bBRaVehKz6xTI3vlbGC
         hqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789928091; x=1790532891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=78MZgf5P4Kpkmmf2WHQZAsRyEnedhA8FT/mxKha/EbY=;
        b=rlX+PXEYoFB3/1iESjtMbE6NYN2XEfxUtBaVmjlObuA4OhmY+5eY7LVndpRS7Y0jrq
         AkDJHg/2BaL6yWXADKa9qluhPO06JnO4sWmq1WBTr2/gV3RULOQYkav+MNlhboGiFIa0
         p5eaD+rXIiJcloQxfUuwTR7QsSzNl9aJctVVyAGVJKMJRPMckbCP6KyVz9VGYHcfQkEy
         5SGLED0dX6VgYw3oP3Ysqte5X8gjWQ+S/TjSDsXn8trbcYzHtlfkR5ReeBOXvpoxWnVI
         9BqZ/eeBwxSJ0202hljze8dr8+HeI5GldxOc2Q46uIj6ScSjjdH6puBLWqVy+XapKEbA
         i/Hw==
X-Forwarded-Encrypted: i=1; AKwUvBzDWfohotABiKv/7JYGywG6MkXNsQfJ0ih/I3Lx+lzg8meYmc9i5suoUQxUnFOlmPtwbUGrgHbShBtO3qY=@vger.kernel.org
X-Gm-Message-State: AFuF++kuytsl24nkmwotXYkbMZUOuOUZM5zkOXv+wv5KVlxv1oLjBQug
	06M/W1/MzSv683VuAubuY4ZR8RHrnzMO4uOG4cOH67VUHo87yMcGsCt8
X-Gm-Gg: AYBFou13lu/Hw5696IwpRlCekYUs/2pMP7WU71GLblu2L4RtstJldRA6fAxaXxjGw8T
	Ny/BTx3lvdCis3THMNt3ld0DSRdDSnm0LxWkfhMKkrIvI/EJxfbx4d6ILA/r9Z6r9c501pu9rHu
	eJK9YoXfZE6Kp3oAq8MeFdV+ag7KEBpx35sNvw3LwWywyQ+BPQ35m8kaWz3myW1ThEmj+fgbKLW
	76bVkxS5Fe+7XV/wcvpD44jlAnBGqGAid1OMJCnDGPFbr/bBKbkuzQ7VzTcF0rGyNtsCIYTvc7P
	PZdOXjyUeXHo8J8MgivjCC7OBLARb/4i7oTJWEp31hGMTtH9e37eU5bDIM0IKEKLJxNxSG66EHo
	NgXGUeRB2v8EH92Vcgc2B3rqZZjO42KTWnJwonQrtGmc2Vlnzt9FqQHu1+ScdiOpTXamZInJFr4
	KuJV3us6fQxYFVjqi5IPnP/fZEKi8n/7roFhwWVbwD+wwasKZw+EUHTdbqdjecleiOeUUeFTvvI
	2xJS8QfEsGH21CkLSPbohMdPBNh/6Q6enRdQkRVA5d0F3UxRAoxGpfBorchfcjXIrvQ5+8w7qta
	VcW0JkMGc0SIBG1BB2EM
X-Received: by 2002:a17:902:f610:b0:2dd:c100:7cc2 with SMTP id d9443c01a7336-2ddc1007e37mr70989615ad.62.1789928091439;
        Sun, 20 Sep 2026 11:14:51 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc179df35sm22087225ad.40.2026.09.20.11.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:14:51 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Guopeng Zhang <guopeng.zhang@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Waiman Long <longman@redhat.com>,
	Ridong Chen <ridong.chen@linux.dev>
Cc: Michal Koutny <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v3 1/3] cgroup/cpuset: return PERR_NOCPUS in remote_partition_enable()
Date: Sun, 20 Sep 2026 18:14:47 +0000
Message-ID: <20260920181449.3122336-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <aa90bb73-c2af-4d13-8f2a-0435aa528058@linux.dev>
References: <aa90bb73-c2af-4d13-8f2a-0435aa528058@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 6da580ec656a ("cgroup/cpuset: Don't allow creation of local
partition over a remote one") updated update_prstate() to prevent creating
a top-level local partition whose exclusive CPUs conflict with an existing
remote partition.

However, if a top-level local partition A1 is created on CPUs 1-3, has a
non-partition member child A1/A2 with cpuset.cpus.exclusive = 1-3, and a
grandchild A1/A2/A3 is then enabled as a partition root on 1-3,
update_prstate() sees !is_partition_valid(parent) (since A1/A2 is a member)
and calls remote_partition_enable(). Because remote_partition_enable() does
not check whether tmp->new_cpus intersects subpartitions_cpus, A1/A2/A3 is
enabled as a remote partition on CPUs already owned by A1, triggering:

  WARNING: kernel/cgroup/cpuset.c:1594 at update_prstate+0xbef/0xd70

Return PERR_NOCPUS in remote_partition_enable() when tmp->new_cpus
intersects subpartitions_cpus, matching the error code used by
remote_cpus_update() for subpartitions_cpus conflicts, and add a
corresponding regression test case to
tools/testing/selftests/cgroup/test_cpuset_prs.sh.

Tested in QEMU on Linux 7.3.0-rc3 using
tools/testing/selftests/cgroup/test_cpuset_prs.sh.

Fixes: 6da580ec656a ("cgroup/cpuset: Don't allow creation of local partition over a remote one")
Suggested-by: Guopeng Zhang <guopeng.zhang@linux.dev>
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v3:
- Split the series into 3 patches (one per logical change and Fixes: tag).

 kernel/cgroup/cpuset.c                        | 4 +++-
 tools/testing/selftests/cgroup/test_cpuset_prs.sh | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index c8ab89cfbe3d..7381fa8502e7 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1678,8 +1678,10 @@ static int remote_partition_enable(struct cpuset *cs, int new_prs,
 	 * Callers must have validated that effective_xcpus is not empty.
 	 */
 	spin_lock_irq(&callback_lock);
-	if (cpumask_subset(top_cpuset.effective_cpus, tmp->new_cpus)) {
+	if (cpumask_intersects(tmp->new_cpus, subpartitions_cpus) ||
+	    cpumask_subset(top_cpuset.effective_cpus, tmp->new_cpus)) {
 		spin_unlock_irq(&callback_lock);
+		if (cpumask_intersects(tmp->new_cpus, subpartitions_cpus))
+			return PERR_NOCPUS;
 		return PERR_HKEEPING;
 	}
 
diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index a1f42ef64bc1..b732078bf319 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -298,6 +298,8 @@ TEST_MATRIX=(
 	" C0-4:X2-4 C1-4:X2-4:P2 C2-4:X4:P1 \
 				   .      .      .      X1      .    0 A1:0-1|A2:2-4|A3:2-4 \
 								       A1:P0|A2:P2|A3:P-1 2-4"
+	" CX1-3:P1 CX1-3  CX1-3    .      .      .      P1     .     0 A1:1-3|A2:1-3|A3:1-3 \
+								       A1:P1|A2:P0|A3:P-1"
 
 	# Remote partition offline tests
 	"   C0-3    C1-3  C2-3     .    X2-3   X2-3 X2-3:P2:O2=0 .   0 A1:0-1|A2:1|A3:3 A1:P0|A3:P2 2-3"
-- 
2.49.0
