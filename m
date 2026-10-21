Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792565423;
	b=exWXUz7a8S5LJQDiD7dhLPL233gJeznQXnNABnjZsHzelg6Hu7bNruOguN3i3cotzWUA
	 4YhWbPvThSDrTu6IyZoGGcHL7WYcHwft/cPHlL7oA6OqZcqaZu3dqfrhwHqEMdM/1+n7N
	 HWB/ic6gBdLrKj76QCBVSCjitgJZ3aUeThf+gNRJnxslbrGhDmkJOya7F5bysszewxDJL
	 m576TP2mrv9By3frWwTY60H+Ma/MGSA6y6XAdFsuiHAtdA8sIaCzgb3mInOCxTysrcyTY
	 1bpcBv/09ad441BQeW1mLeM70lgrQwrXCf2T3PWQmRwffRSbB3qDes/quF0VG67tDcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565423;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=WwwExcr/LG80T6XsKe08wkKUEA98uezWSYWGcqxQGis=;
	b=EZx6Ef7L68zHWLEE5oo+HYxqAGBdPk8r/TuRZVG9ZgDMOxnuSkVttAT2yJ53e4/yMGCo
	 AHYGM44HLGQa7eHbPVVxPBrLFffwkJDjd3EJOXX4QbtjgUBKJPxN2CEuLS7zn8vurA+cV
	 cU4CV2YDkv5L4ITQGFmbIZAQERrklrrtLRTzhhco0vJovrQe5zQTBTsh1i618i3NXxxS0
	 y4s7ooH6onobqas8JRu1UZrSIpdMWDCORrQc/6F4zC3x/g4oQyB6yfUsV6ixPQMI/QKSV
	 P9zsP/vY1Kv0v/+QfhX9KsIhpI9Nla4KBHl0uC44tIem5IJaeYw/BlN5a8eUvR3hmVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=DHUPqVY5;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0C7606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B0C7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=DHUPqVY5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ww
	wExcr/LG80T6XsKe08wkKUEA98uezWSYWGcqxQGis=; b=DHUPqVY5dgVNTJvVUk
	582G3u5xhblvXrk2PdYfwbKeSDflilNtpulTmOr8azX5BKETl1ZxkqXWRw3aPYwe
	ajDINnAgjb86OmP9M8gpuIjmXCNQ72tu5hYrUQPAYroaMg8Tl+PO6XwIz+7doeja
	yCKZ0rWrC1B732FshMs1q51kc=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD331+KYNhqD4CZBQ--.21269S2;
	Wed, 21 Oct 2026 14:49:47 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH] sched_ext: Reject oversized automatic CID shards
Date: Wed, 21 Oct 2026 15:49:46 +0900
Message-ID: <20261021064946.1445728-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
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
X-CM-TRANSID:_____wD331+KYNhqD4CZBQ--.21269S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw4kGw1UGrW7CFy8trWUArb_yoW8Xry7pF
	sFkFWDGr4j9ayjkw4UJ3WxKr48Wan8Cay2qFyDGF1kGr1DKryIqF1Yyw4xur12grs0gryI
	qr4vy3sxKFyqyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRsmitUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6gsLamrYYIu3JQAA3L

Automatic topology packing starts a new shard before adding a core when
the current shard would exceed its target size. However, a first core is
always accepted so that cores remain indivisible. An indivisible core with
more than SCX_CID_SHARD_MAX_CPUS CPUs cannot be represented without
exceeding the hard shard limit.

Per-shard state uses fixed-size inline cmask storage sized for
SCX_CID_SHARD_MAX_CPUS. Passing an oversized shard to alloc_pshard() can
therefore make cmask initialization overwrite the following fields.

Reject an indivisible core larger than SCX_CID_SHARD_MAX_CPUS before adding
it to a shard. Existing non-empty shard splitting already keeps the total
within the hard cap, while an indivisible core may still exceed
cid_shard_size when it fits within the hard limit.

Fixes: e2c841b91bf9 ("sched_ext: Add CID sharding")
Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/ext/cid.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/ext/cid.c b/kernel/sched/ext/cid.c
index 4b08866d75f6..3c38650d78d5 100644
--- a/kernel/sched/ext/cid.c
+++ b/kernel/sched/ext/cid.c
@@ -287,6 +287,9 @@ s32 scx_cid_init(struct scx_sched *sch)
 				 * empty shard.
 				 */
 				cids_in_core = cpumask_weight(core_scratch);
+				if (cids_in_core > SCX_CID_SHARD_MAX_CPUS)
+					return -E2BIG;
+
 				max_cores = cores_per_shard + (shard_local < nr_large ? 1 : 0);
 				if (cores_in_shard &&
 				    (cores_in_shard >= max_cores ||

