Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315087;
	b=G6rqaiOAfxAKZyhx7AFnyiYH+GCbZ5j5MWeOP6bcxEsau0x31PW4n6UQqAHl+Gsuhph+
	 JMFFdwprB7SvsFHvvGFEyx+lvOHpNmreNbLA9I4PvRH3Y7dsz+9YG8ypG7e8cn1IccJO3
	 ocXvG1GXdk+JUH+f+UCd9LansKCaiJ5dUceZh0NXlkpRbipCvCrp6/hN+Z0an4ZJ0hJOG
	 s8pwBE27y50ofjFq3BDtv9vK8Z+mzngwSy301GichSEphkt20zgFk7ocb3xvGpGYjrJ8z
	 ARKSv+ioS51Fau5ho4lymPKRRhteZc+Tg41qrcTyLHDcyR63jMRwgjLtHzSz8VJWfaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315087;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YtUog58RhMWjgehHF7aLMPWxr8semA4Q1u+XbhAMUSA=;
	b=2nsWQerI+yp8yxnZrpyp6qiqL9ByMS1o/T0FMAzjvTQQPfQtJt64ILyUYr6pJUUvJP2p
	 1VBabCSQMX7NIJpawxoeYsCNVAXiZFB5wRLmrhuRVHnWXBOxd1+luvVOqyuwqe7JdSTmB
	 X25/+ZCLy9xTEj/sfCwZrTGDeL9Ba+/oOS0kuy+BMv5t48YhohUOcn0dKkn8eDnn8FVeo
	 9pJzeLAnmBCOaghnf/DcEJtReQjIqkb0VHL30qpH6E63cYmqHTzz0iGeM5NfXZBuqddb7
	 Ot2iDEFdG/ES4Ir340wuMpN1jfxSpUnw5opwAGbvDbvIk6Gw5HlFh7Adccmi9vm9xXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P74bo2ZZ;
	arc=none smtp.remote-ip=91.218.175.149
Received: from mta0.migadu.com (out-149.mta0.migadu.com [91.218.175.149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C437460A2605
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C437460A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P74bo2ZZ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=y+OXQ3R1bQ6Jl5nULn+5Yppe6hOkihdq++4CRdIcUFI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794315084; v=1; x=1794919884;
 b=P74bo2ZZMEAHqxp2P3Y0AU23JIQa0uaMINXltVUoYy7M6ILA94f7fpuJtESNSh+QxT5e1qaf
 cxDSnisjCkMvtQ8aTUTdOPWBsXGnStGg6QZR7HitLWUe7DGmfgi7Mk8Qr1SrBncipXpilmJJeSV
 EUJdb29gZ9Fq9hpltyV1EjtE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dc7b68f0a2315fc4;
	Tue, 10 Nov 2026 12:51:24 +0000
X-Mizu-Trace-ID: dc7b68f0a2315fc4
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: tj@kernel.org
Cc: void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	liwanwu@kylinos.cn,
	devnexen@gmail.com,
	zhaomengmeng@kylinos.cn,
	emil@etsalapatis.com,
	yphbchou0911@gmail.com,
	mingo@redhat.com,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH 6/9] tools/sched_ext: scx_qmap: Add the missing options to the usage synopsis
Date: Tue, 10 Nov 2026 20:49:58 +0800
Message-ID: <20261110125001.4167503-7-cui.tao@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110125001.4167503-1-cui.tao@linux.dev>
References: <20261110125001.4167503-1-cui.tao@linux.dev>
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

From: Tao Cui <cuitao@kylinos.cn>

-C, -B and -q are described in the option list but missing from the
usage synopsis. Add them.

Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 tools/sched_ext/scx_qmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/sched_ext/scx_qmap.c b/tools/sched_ext/scx_qmap.c
index fe2f206f5c8a..f44802247069 100644
--- a/tools/sched_ext/scx_qmap.c
+++ b/tools/sched_ext/scx_qmap.c
@@ -47,7 +47,7 @@ const char help_fmt[] =
 "\n"
 "Usage: %s [-s SLICE_US] [-e COUNT] [-t COUNT] [-T COUNT] [-l COUNT] [-b COUNT]\n"
 "       [-N COUNT] [-P] [-M] [-H] [-c CG_PATH] [-d PID] [-D LEN] [-S] [-p] [-I] [-X]\n"
-"       [-F COUNT] [-i SEC] [-R MS] [-J MODE] [-v]\n"
+"       [-F COUNT] [-i SEC] [-R MS] [-C MODE] [-B PPT] [-q US] [-J MODE] [-v]\n"
 "\n"
 "  -s SLICE_US   Override slice duration\n"
 "  -e COUNT      Trigger scx_bpf_error() after COUNT enqueues\n"
-- 
2.53.0

base-commit: 5b740a72b55c4267ba4d8010f17dde26b26f52d3
