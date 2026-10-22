Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792683945;
	b=hPLscS9MJVC21FkrlDICQMJU1hn2QPRpx2+T3as9jZIIG0l4caVKUDn7oWUEqmNDzXIw
	 xk/9Tv9qOiNdI+mFUDde6mWSmBGkVNPXNmqcGu1dHxyx88dOoC4krc5HfyETfccrdPwEl
	 v5GlC4hTyijnNgzbvcuCZKieuCsdCXIPOwoV1eKcjgB95O6n2Kd6hudZ3MRVcNu5KrHJO
	 lLi+JPCwbw6nhiBH0YPeVLE3UVC7WfXDgApDJjQKwWFDmRbNvh5vAQSIe0+rrWjL31IQF
	 +uptFemRj8h5uHzwQY+5KCODeaYfUOFwUA8rwlyrZFR8oBcJxeaM1kzzpsXLF/ql0SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683945;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ajpv8h5gBQio2QGq1LWsZTjKm997T/vg6CG4Dei2Gpg=;
	b=GMcej60Cvp5tZOqVaDQP6/sbf8t5ljz08x2JYfm5vYl96BpXIB2UqtWXMR97+4dZ3Hbg
	 5BvrTNjArO+QryjQbDCPqfE8Xm3YSAK+5An1dVtYLqLjRDF4/DJ/UF98s71tYuTgP2Jn7
	 QgR1Kdipia/Gqi5h6wxiF4zzQcMavQPI4gulxqDNV7bd4qEtc/89GqbGMGixTy3fAAS1D
	 D1qX4YcDNFH8rlkc3x6B64sRvIboCcfYhD8EHxnu2kAvjZldCXzNjoTBNuNlxnMBh4P8d
	 CILs337BYXYws4PNbM+kxhdyhxBWfJ3L1VdWIqrJmdJMtBN6wMtSpYFwYzW7h0c0k3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="Rr0G3T/L";
	arc=none smtp.remote-ip=91.218.175.72
Received: from mta0.migadu.com (out-72.mta0.migadu.com [91.218.175.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEA6606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AEA6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Rr0G3T/L
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=y0NAk4+1flMSEPJywC+JAVutEj2POM3y6ILJXbaBwYo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792683941; v=1; x=1793288741;
 b=Rr0G3T/LEd/M21chZONfkuVh3wTtA479aNgZ16QZzUGzTJmRrVCg/V8UL0dMbzxDOa4D/0uj
 NiUXdOExh05ow71Xv97mZrKvKj8ERDyKhLOa236fZPoNeOuu0LLNavIleeYYBGdxN9K6fxD2eIZ
 ZaXuHQGeQTuaj1BranKxJyMs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9d8d4721d428ad36;
	Thu, 22 Oct 2026 15:45:41 +0000
X-Mizu-Trace-ID: 9d8d4721d428ad36
X-Migadu-Flow: FLOW_OUT
From: Andrew Jones <andrew.jones@linux.dev>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] mailmap: add entries for Andrew Jones
Date: Thu, 22 Oct 2026 17:45:32 +0200
Message-ID: <20261022154532.1374661-1-andrew.jones@linux.dev>
X-Mailer: git-send-email 2.56.0
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

Use my linux.dev address for kernel correspondence, including for
contributions made with my other email addresses.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 .mailmap | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.mailmap b/.mailmap
index 0a0be49bc4de..86941eee2a98 100644
--- a/.mailmap
+++ b/.mailmap
@@ -87,6 +87,10 @@ Andrej Shadura <andrew@shadura.me> <andrew@beldisplaytech.com>
 Andrew Donnellan <andrew+kernel@donnellan.id.au> <andrew@donnellan.id.au>
 Andrew Donnellan <andrew+kernel@donnellan.id.au> <ajd@linux.ibm.com>
 Andrew Donnellan <andrew+kernel@donnellan.id.au> <andrew.donnellan@au1.ibm.com>
+Andrew Jones <andrew.jones@linux.dev> <ajones@ventanamicro.com>
+Andrew Jones <andrew.jones@linux.dev> <andrew.jones@oss.qualcomm.com>
+Andrew Jones <andrew.jones@linux.dev> <anjones@nvidia.com>
+Andrew Jones <andrew.jones@linux.dev> <drjones@redhat.com>
 Andrew Morton <akpm@linux-foundation.org>
 Andrew Murray <amurray@thegoodpenguin.co.uk> <amurray@embedded-bits.co.uk>
 Andrew Murray <amurray@thegoodpenguin.co.uk> <andrew.murray@arm.com>
-- 
2.56.0

