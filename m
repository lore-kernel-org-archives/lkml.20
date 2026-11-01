Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793533505;
	b=gCuow9Q88y58X3fQlRSvcpAiXuwa5EI60lYmPbrQVzPXdZsxBSY7HfP4QAhUp1jQQeoA
	 6xLqgiafIaDa5xHVTBocGtL51wXHMm1qXdiFGM2LsHAepYbaeTZrr2uPRxASRJDcWFCnQ
	 mQvyFZjimwC6k6NEQPnYecxcNjuq7pWsbDfY5aUCkjM0EZJFE+RS+24XvBaeaBS3zCXMk
	 dfIQrpAy49OWso8ollppzsBjR5Ya3i4R72t/w0kWdCXSHOhbI+MLMz5fLeiz+ua+Chqbg
	 pZB0I5Js1KpHGIFNEfMRU7D07u8P42hRAYrcix1LZ4FamgEt4GgWL4InhXOJhlBmksQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793533505;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=52Mb0SieUZGcAbpImPllQtaM7cC3W0vYtmFV0/PQ+bY=;
	b=hpDUeM1edQApdfuF0sM/bIGtscCMoKBP9h9/maWkU9p6eH2gZu+qer6oz8J1EhewvJIQ
	 g0u3s5zx/akih5Xw2DhQHw9AP64gX8nSf0UOCNFLJ4hJq9aEXs33VitUbdfo6YAj/qPkj
	 2O0RvEth3zaGD7TgYcqsoOg7CH0W2T2Ra9mryHgXt4geukMC0hBc0wLZCcRE/ThaiZ7ua
	 KtIHBzi4Ie0glOMJSz66XiVTNh26cDuq7jSAAQNe1z/9c5LOAs/ix6iLYEsIh9OyoJXEr
	 SepqklLOplBA2cN7iSmPgjCQG14iBbdvMfowGI+GRbBjOwDIO9QNt1/YojUcZFXCIJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xepePMzE;
	arc=none smtp.remote-ip=91.218.175.145
Received: from mta0.migadu.com (out-145.mta0.migadu.com [91.218.175.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037B6606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 11:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 037B6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xepePMzE
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mKXG4s48Cea/weAYc6oxABnfCFvbfykC7zPLW+/SpLA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793533503; v=1; x=1794138303;
 b=xepePMzEGrJ5rr0OY0uHAXW+MJWAprs6AC0xyUA2YgVcLv3l2YNJniOSkjoDHYpHKtJvh6rp
 yo32iRVv7elan90ZunGuQEgYcUdhwfh9qpcxPr3WDf19c8H009/Su5ALa7DtAvCNVGZcvJzcIHy
 UIPBqprbeY6BXHioE5uLCM3s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 27a4b692cad0f5ab;
	Sun, 01 Nov 2026 11:45:02 +0000
X-Mizu-Trace-ID: 27a4b692cad0f5ab
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	"Michal Koutn?" <mkoutny@suse.com>
Cc: Guopeng Zhang <guopeng.zhang@linux.dev>,
	Ridong Chen <ridong.chen@linux.dev>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ridong <chenridong@huawei.com>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [RFC PATCH -v4 21/22] cpuset: remove prs_err clear when notify_partition_change
Date: Sun,  1 Nov 2026 19:42:05 +0800
Message-Id: <20261101114206.2434398-22-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101114206.2434398-1-ridong.chen@linux.dev>
References: <20261101114206.2434398-1-ridong.chen@linux.dev>
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

From: Chen Ridong <chenridong@huawei.com>

The prs_err should be properly set when partition state is set, it
doesn't have to be reset in notify_partition_change(), just remove it.

Signed-off-by: Chen Ridong <chenridong@huawei.com>
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 kernel/cgroup/cpuset.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 29bce718ef92..4fd8b0025a5a 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -262,10 +262,6 @@ static inline void notify_partition_change(struct cpuset *cs, int old_prs)
 	if (old_prs == cs->partition_root_state)
 		return;
 	cgroup_file_notify(&cs->partition_file);
-
-	/* Reset prs_err if not invalid */
-	if (is_partition_valid(cs))
-		WRITE_ONCE(cs->prs_err, PERR_NONE);
 }
 
 /*
-- 
2.34.1

