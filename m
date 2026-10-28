Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205447;
	b=p5rr8TH2uxVAu4WCoQwxodnJzc5Wv8V3NGr1kqjEKimG1WkE47HXdWnC7LqcmSLRAwWW
	 M7T94J2FAJNWOHJJV/ZYil1VyPRqDvF7a4YCasd6e2Vqpm1GPQbFFV+QjjokbFZIyTB7d
	 mPP0HK5FBaaVcwP2FBZY3T6aYv09WJ24DGqqWQbJVgTIqV9+jo6pcI/f7VQQcp+YH2P9+
	 gIamUQbXdvCZ0CZCRreHVCiiyq/9fGEHxwMhqcrWuLyFEmP5nTe/TklahGttpZEnXRoZh
	 SxaJSP3w7CZvkdh7jE/x9RRy1Xnqfhab10QYRJWC+3Zf44d4y8aBcG5e2FU+/QLoWKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205447;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ziTA5YyeX+ARWxi6+ZKerOzzoxnyIvGTm3FXaPm8avI=;
	b=eQdcOxSQBM16LDlkBiNJTNRm4cUIKs2VBzI5ynvipCGIpEPg4BU8eFUnjJJQOUqqn1vY
	 /Q2lCuj0pwq2A11y67r4aOGqHpHLmuBvow9Ojg4lYffN6uz5iiPJZDFG30YXpyjBo9vTv
	 8xnkN3bvapA8svNUgoqy4ElMsqxm6eeYlHvsgGk9IoHAcqrgcrW9NDWFENF3Jl23FPbPu
	 jGQlNAZ5kB0lSeWMvzn7tPVc3YkKDnGSqrASs7i7H2t1h/5e/S+1EHxlqB03Taced1vgC
	 Cz/v2TGOrJzf/vhX+ukAgNB8gUAekhVba0NPkK69V1tvxDbZzw7eRQZbumJIf4sxS2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u5AcJK6P;
	arc=none smtp.remote-ip=91.218.175.45
Received: from mta0.migadu.com (out-45.mta0.migadu.com [91.218.175.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F965606A333
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F965606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u5AcJK6P
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wcqq7Xz1JG2ZSY/vCdYGSSzvFVRnKENm17H5OGY6WWU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793205444; v=1; x=1793810244;
 b=u5AcJK6Pqbb4fy9KB3YtVP910kE4CpKe538ehpUHjPm9pvtPNOOR3IUAcOEq1vDcCvxMzRWU
 TkcnyTcVrKa27fV9mFlKgsj7RRM607JML5Kdn2/V4aOXQCuDWTv2nA1pAlYuEAikUaLbA7KXhFk
 o3Xep6aSjrJ4MMxeZC9l5vyw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 8a18951985fddca6;
	Wed, 28 Oct 2026 16:37:24 +0000
X-Mizu-Trace-ID: 8a18951985fddca6
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Joel Granados <joel.granados@kernel.org>
Cc: Wen Yang <wen.yang@linux.dev>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 19/39] io_uring: store its sysctl bounds by value
Date: Thu, 29 Oct 2026 00:34:58 +0800
Message-Id: <1e4216f3c4e1971884be5a048c291077ce95995c.1793204511.git.wen.yang@linux.dev>
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

Replace io_uring bound pointers with numeric limits.

Suggested-by: Joel Granados <joel.granados@kernel.org>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 io_uring/io_uring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 8ffe0c9a4e29..48e03c3c066c 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -138,8 +138,8 @@ static const struct ctl_table kernel_io_uring_disabled_table[] = {
 		.maxlen		= sizeof(sysctl_io_uring_disabled),
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_TWO,
+		.min		= 0,
+		.max		= 2,
 	},
 	{
 		.procname	= "io_uring_group",
-- 
2.25.1

