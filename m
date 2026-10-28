Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205387;
	b=1q2A+dKpqMvyY22Mdl3uR9scTY24DuGpAQ2tO1LeDgMGQEgSE39ovV2rJF9TocKfgKjo
	 vzcEEipZjvrpv+EGTwDWxoKr7VQoFXXtlqE9ToHBVjaWX/TBYcBmnkwvUKdCh97g+q4dI
	 rQcm+LsGkhcqpVS6CSaTVY2Hit/f43Jmd94CwGs5gYpm8erJ7v48f2/wkyKwCtunf1ui0
	 PH6i545/iTbThjGPRpr7xvOgrZuuMou2N9Sx6EsBoP9gp57aorhCgCe/lXZU6cynLtcg4
	 kBqZ0BvjU4bDMRjRfhcGn2JFotphn4yKsPainjZ90tpETZu+OH62ES5eGw17Xy7B4hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205387;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NcLne8HCAtZCq9m+/P9Y1sEBarLH9DBl8jrMp3FLJ5g=;
	b=stkMlTIusN0wROBIALnK9obn4JLnWkDvKhNCWkcDJ1lpiLkU+x5USwpMqQDsnWkkjvVo
	 Xsc/IkpcgHnQ2I7Tr7Hh4xtzHyQzM6yHUTS/m/kTtr7qZuywkzMstEGwwcCfYmLDqO2Gd
	 Mloq2urVXDeNdAJth8b4EuzIT4z7SWgUtS5n+6+W+WZyCsjEO4qhoxP3WjvbhvsQxI7p/
	 r8iAjygKu9smIGaRwlqH3hTvDa2cPamHH+mrbjapmS6DWjfLSW6xOlrWVJMk+V6BloqLO
	 nsvZ/WChDrUXJs746EzxTjF5o41ZvXiLNOSScmqTIaMFUrhl9PPGx+sq5XqHe1yhkRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZrSZRXug;
	arc=none smtp.remote-ip=95.215.58.252
Received: from mta1.migadu.com (out-252.mta1.migadu.com [95.215.58.252])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F09606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3F09606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZrSZRXug
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ilafpdra+kHUXQhpYmuDC5+KdKckKpZal84g7i1t7Qg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793205385; v=1; x=1793810185;
 b=ZrSZRXugLe5HFp4W0WFWvhVMfhxj7w5wdq6qB3K7gmcMOSGnL5m2TjZaUgqetF/pqAJVPYoU
 lhzammLfQZNRws8M2hg0qvUyACSQ6+50kh+X28Qkj0elDLusbCm+bcZpqss3nKbqLSQ9cPRuJHv
 yOcWbH7zTQMDZXH0nCIh38io=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id e2ea6017dd03c013;
	Wed, 28 Oct 2026 16:36:25 +0000
X-Mizu-Trace-ID: e2ea6017dd03c013
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Joel Granados <joel.granados@kernel.org>
Cc: Wen Yang <wen.yang@linux.dev>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 08/39] sysctl: store crypto sysctl bounds by value
Date: Thu, 29 Oct 2026 00:34:47 +0800
Message-Id: <646572a0e7d9153484b103dadfbdd9161bf56b69.1793204511.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793204511.git.wen.yang@linux.dev>
References: <cover.1793204511.git.wen.yang@linux.dev>
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

From: Wen Yang <wen.yang@linux.dev>

Replace crypto bound pointers with numeric limits.

Suggested-by: Joel Granados <joel.granados@kernel.org>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 crypto/af_alg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/crypto/af_alg.c b/crypto/af_alg.c
index ab84c4488a15..8c7559c3fdca 100644
--- a/crypto/af_alg.c
+++ b/crypto/af_alg.c
@@ -38,8 +38,8 @@ static const struct ctl_table af_alg_table[] = {
 		.maxlen         = sizeof(int),
 		.mode           = 0644,
 		.proc_handler   = proc_dointvec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_TWO,
+		.min		= 0,
+		.max		= 2,
 	},
 };
 
-- 
2.25.1

