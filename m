Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AD14582FC
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928095; cv=none; b=HW3ZnJ9aeI2tFhmDhPhNTXhdKpz5esbw2fBRiIOfATc5fNeM0ckfPMTAZpBUFpHBd9eB9LCRaLoHeHB4/onqHsH+WMA/5qnwcdL+FX8L84LjPEPSV/9MxbAQE2xnopE03I5+2nI5t9GZK69F3GUkthvaTd3culV9vPhTViKcijY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928095; c=relaxed/simple;
	bh=ljrqpukr3NP5yrDjkb+Jpb6Ys4RNZtVj2TiTWC404Bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DRXeynKQ0COragSR1BriID8U3qxmpQHo/qhOPXUAWiN2BxVdaAmaReJRVnZ/lKWe90kxQK9Cnm/tKrVZ0gssQDhkLWZ0SHCIuJqlFTeWy+hNOTHnE4/YgwcNuIeoAitTv2eWqKTP+YF5RQ1CPagFxBOZPwxoME/xX+/vflESNg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s0tG/0/1; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s0tG/0/1"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so368505ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789928093; x=1790532893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIGxyqhgDCJxQrUSlOVUsvnBCPzikecf8ZgHQx68EUQ=;
        b=s0tG/0/10XJx/mcuXgliPlt13qzin7Ife58BuWPaA8GnB7oHnfF2uQ0khztArpRVGN
         m/pvCDSQs2O3UygsCyyPCucGMYS6o6laGb/UmOyfNiuTHaFkriExNuCYT3bIm0PUyrO5
         CANDNEAzWsUaXAlceZn31C/hnzvGUF5cdrImyQXU8bQN9LsdHQGNI8arPKnfuD6sLmZw
         cJyRg8eEoPICrdsD1d9/R0mX7PhaFDXqupWQ5lBHoorOvj0GOrdGebydMvmqJdrKOA50
         M+mealyN4BAZYqkv6vKMrsHZJk7Fn8U6bxF//Ai+goL8YVSCO+KhyJGw/dt3KwGZPc8w
         5iKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789928093; x=1790532893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIGxyqhgDCJxQrUSlOVUsvnBCPzikecf8ZgHQx68EUQ=;
        b=xVqZfixm5N5tIIHQ8Y+uXz3wQpt/z28NHkL9zhCunXW/7B9pjpHH53M13dWHoyiN/R
         8ixh7fLR6v6tWEzMGYvft4FqfuRyexPOiqkJepQ5Th3Jl2XVSDdK4tGxEDF+Y880eB0I
         AbCjauGovv6SKIGvERSWhLV+z4jTlIntMaIeNoE7D3jSc/dEJrXQ8KaPXwvNYcxArJjD
         pI0JjlEMaR9g2opBChkuHYOpbdfEpLJqtc9msdPyqW4XMIGRQ3l3kfnKA1G+6xOjUBA/
         1fQXOGBeBvxTzOl6fPR5HX8Uyq+TaLPfGvVYK5I3Vii0rQX+NZRBsE6yApGPjEKMAYwy
         WYBw==
X-Forwarded-Encrypted: i=1; AKwUvBxMt8gP2R4TJXNYL2AVwjx69ag5+EmCG2RPAeGdnEeVEFrdCmKPfFy87siDf4h/bx3YkhZyAjdUK+RqlrA=@vger.kernel.org
X-Gm-Message-State: AFuF++lmrkrVsvSWFiPUcIjqVD0/A+NoU7hKPpgVZwBNhZPYWJz8tDhX
	sPpEdILdCbbhe1SGJZhnUaoiMi1edRG695o74RfMIzX1VwIlLz5Ry23a
X-Gm-Gg: AYBFou3ea2ehL9NMQElxgEKvWmvpKA4IctQJbQRdhaZCVcepTDX97dp945Ko5P9YZcA
	GPmNMOJDng1pwjeFqar/mG38Ht4XVetRHjmtO6sfNzJ2Xp0mH33yse58KAXtkpPE5S4zbTKkzA4
	1ia5L32i23q051uNHnn25fSNUMhn0/VADA8uJ7M738waFfWteowOpwDlzUIicc5HfjskNnBFm6l
	TlhdLh3pscki/Qpy63nNNyCvQXLrp49AWNZtTPKTpRag69JoGesAFLVZq8gAJCSSHkhhx5w5X+b
	GGiEZsU+uPxn8LkMC78TqRc8FI393OhxxKolI+vjS/hLsOGsvmgevGlJkjOjwq+P++RC6Tsg78L
	n5tLQqhAREbzPGr7x08KGxQQ6yz1ys3N91Ou0O9R2aRy0kLn42hRaFtfHoaUJ8Ik+4Bk0XZEeAH
	MZvmKMQhnlZ3UtFeM5/8VMgmJdYMQa7tXMTOSKGxbN08c/VuQUZkbfhtLncCt3mhO3gTp3uxQXL
	xRjdq431NvVVlh99JYuOJu2sC/vc45naUj0QibZ7Zt3n/JDrZPn7XXa9XfLbPTjC+o2SBhaV5M1
	ipqGK6fSMQ==
X-Received: by 2002:a17:903:1a26:b0:2dd:89b1:7fdb with SMTP id d9443c01a7336-2ddb1aeea09mr127586005ad.9.1789928092709;
        Sun, 20 Sep 2026 11:14:52 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc179df35sm22087225ad.40.2026.09.20.11.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:14:52 -0700 (PDT)
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
Subject: [PATCH v3 3/3] cgroup/cpuset: check sibling effective_xcpus in cpus_excl_conflict()
Date: Sun, 20 Sep 2026 18:14:49 +0000
Message-ID: <20260920181449.3122336-3-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260920181449.3122336-1-benquike@gmail.com>
References: <aa90bb73-c2af-4d13-8f2a-0435aa528058@linux.dev>
 <20260920181449.3122336-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cpus_excl_conflict(), when a valid local partition A1 uses implicit
exclusive CPUs (cpuset.cpus set without cpuset.cpus.exclusive, so
sibling->exclusive_cpus is empty while sibling->effective_xcpus is
populated), a sibling cgroup B1 can still set cpuset.cpus.exclusive on
the same CPUs because cpus_excl_conflict() only checks
sibling->exclusive_cpus.

Fall back to sibling->effective_xcpus in cpus_excl_conflict() when
sibling->exclusive_cpus is empty, and add a regression test case to
tools/testing/selftests/cgroup/test_cpuset_prs.sh.

Tested in QEMU on Linux 7.3.0-rc3 using
tools/testing/selftests/cgroup/test_cpuset_prs.sh.

Fixes: 2a3602030d80 ("cgroup/cpuset: Don't invalidate sibling partitions on cpuset.cpus conflict")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v3:
- Split out from the validate_partition() fix into patch 3/3 and add the
  Fixes tag for commit 2a3602030d80, as pointed out by Guopeng Zhang.

 kernel/cgroup/cpuset.c                        | 5 ++++-
 tools/testing/selftests/cgroup/test_cpuset_prs.sh | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 7c5b4a8f1f3a..f46a51f07938 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -713,7 +713,10 @@ static inline bool cpus_excl_conflict(struct cpuset *trial, struct cpuset *sibli
 		return true;
 
 	/* Exclusive_cpus cannot intersect */
-	return cpumask_intersects(trial->exclusive_cpus, sibling->exclusive_cpus);
+	return cpumask_intersects(trial->exclusive_cpus,
+				  cpumask_empty(sibling->exclusive_cpus)
+				  ? sibling->effective_xcpus
+				  : sibling->exclusive_cpus);
 }
 
 static inline bool mems_excl_conflict(struct cpuset *cs1, struct cpuset *cs2)
diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index f4d1822d4e21..f62155cf6162 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -445,6 +445,7 @@ TEST_MATRIX=(
 
 	# Changes to cpuset.cpus.exclusive that violate exclusivity rule is rejected
 	"   C0-3     .      .    C4-5   X0-3     .      .     X3-5   1 A1:0-3|B1:4-5"
+	"  C0-3:P1   .      .    C4-5     .      .      .     X3-5   1 A1:0-3|B1:4-5 A1:P1|B1:P0"
 
 	# cpuset.cpus.exclusive cannot be set to a superset of sibling's cpuset.cpus
 	"   C0-3     .      .    C4-5   X3-5     .      .      .     1 A1:0-3|B1:4-5"
-- 
2.49.0
