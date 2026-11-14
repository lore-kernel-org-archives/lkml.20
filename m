Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640240;
	b=2qEHDFzQXmvTD99LlQ2yox+lP0W2LaI5ivdGhVvmwY81x0u0Ge1rq93ip1atf1gslK9+
	 eYmHa+Ikeg/SqynZ0Tup9Yu2WG0DOAZ+uspK3lSa5ChiG8OGgdIvXSjsba9Xa5//n3n2m
	 ywgerY2VJXDjviciaFFs1L2Xrdar7FHTLMp/1mPQGzuH29Hvr/f6S0gc0gIBC42yXb3+C
	 OEaelj9pUOQzLrYna7/Xz/1hjCtXWcwsANFK4Ok2yRmktJ55VkdYqkPT0Nu6VOFmOTPlq
	 HIjuiUWpcR2j5Q0WyDTk4H90groFubzgn/E/C2JwDFA4VT17EgihzNSmPl2Y1uLaPlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TW0pg36vCDijleVRTyqZR6UjU0iehYYk3FdVNC+q6Cw=;
	b=uYN3nXvahZF3KM0FlTwLAwUnr3sqesq8AyMubaiBOz2wkM28KBzaAVP11VzZWSUsX6ST
	 CmM9S81/QPCY2Omw1ME0Jyli54pAOjg2VIUlFNZUU4RwI1VidVOwUd7PxPjsGKbTGR6GA
	 wrr+3pg8TbQFNB9ZsBdgPxitE7MAODuDwjEyGNHvqkhmHca6wfYSQXCJTvsWNNt+aqs8y
	 RVlAc5WiFJdOcpBu0Fp28z8ZJhF6MrXtnbXk53LUgRb2T+QTtOutOvSGl0Eh+/IA5S/XS
	 CdKKb6JOiH4osCgozoS1HsXxnug/wKW4qFWJKxUGLWCgEJM3XeZQtURB/hXqQ0+25FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Q3DA2nko;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3EE60A2615
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC3EE60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Q3DA2nko
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91f332a4b2eso5815726d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640239; x=1795245039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TW0pg36vCDijleVRTyqZR6UjU0iehYYk3FdVNC+q6Cw=;
        b=Q3DA2nkof5TccLKEKOkpoD4tlAOwkqtDIAn0I7af3oHWDqV3MDanG1m+HE/Hze03RB
         qgl3c5vxWVmkXsR09wn3vLHdDsQxs6n5d5kmh2vSTwdxhuPGurTHI/rf19CMjpalpwLk
         Bat76O/tF4T0TriwTFkD4rF4Myqr5UPy8AlQL4K/O+nVeq1syIpOIfYk8TaDUdAHd5w3
         QDiVsq+WKJug4sgJGFgXNDsZz1FuysrzHgEgwFF25lm8FzKJWbtQrAoKggIMdZvxF0BJ
         30S+RNohN7c+/TVaM/HNeDtJjy04gi9aW1TsyxUlWnJ0PK27ITnaJvWinVawe5+Yuzex
         YAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640239; x=1795245039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TW0pg36vCDijleVRTyqZR6UjU0iehYYk3FdVNC+q6Cw=;
        b=2dXI14kXVm5KBG34+uB8yHg6KPeKNA/VJFiZP+usK94KCuIECDP4XDwgeBqPCeHq4w
         MngK6d8hWaNfel4ryEVNHix3io42X2in8G7AZbqR0lcra9gPe5wxf6S4G5OFgJxKdXDs
         f2Zv88/8aGxMeyLdgVIRYQkDilxb3Nf5YEnUOfejR0YvnuA9rA5MbFu+9W0X/FWq8K/T
         j/rtl+3j79OWDlW4m5quRaUh7rw1jiZTvFmYDHsUbfFoZ/VB/0E2SEyW3JpdCK0ELrsa
         Ely48j5QVMOiqq5zhabMKUxY7gkVBgVgXBfaPiMT9PsygrunDlP4wQ0eKlLDY25Uq+AV
         5zYQ==
X-Gm-Message-State: APuU4Z999QiNuZ8YO0toZ5Htc63oczYKStMvM8w7FmpF7ABujNjqsgGw
	V4lRX3DXrGUZ5nWdICMDXjCH2tNqjlO2grFkMQMp7UUFL/5uX5pDpXD9bfRRX/lM5ME=
X-Gm-Gg: AYBFou1buuJv+YvNfh6if83hOJdHI4jsPoM9pdle08/RFwl3OFe1ZbL/GsmT8BGCVf3
	S7XakZ8lPn48e8ZzAIgcb1RA+mpmOy6Ry2MZrTLjmjig2nNRlK/+cYMSeJgvYwQDeghgIPIuzPh
	wCJWfUc6+z2Dq8gAlCODPEfl7cqKWfEShfxDSzZtQOp0BF4hBcV0XOrQe/eGMroqd6eDkAFMARg
	o3xkwCuprK3BVUvmPOhXQwIU3dXLMFoFdVcl5d+5bVLqukJ8X29a7YUM9+p7SeRIkyJR6Nvfnsp
	P8L52OJ2cOFEAL+bym+9bRG0C+XBQBIXu5cius3RXV2wG1jwSDYZWT1AAeJp5cKeoLgoN5vxdAY
	qFP4Am0WbpZ91VUIUhkHUdgceP2hpz9LGZHzTBE3HRQTPMMF+J8OHJf24PXpKOo4+HThOYBglWm
	Utmm9FyOhV9fyyLQfuyA54QxhGAZaHbjAMaG7hOVz4hMoPtREouGcYL+i3rMujD9pCKh3nJCFtS
	Ls5BJ4R64z4EhrbY1Vv+oC850kPFIkyViTlgZUdEGM1Rss9PMmaANOFcqnD1R02615IGFS4lfum
	vLA/x1hRxqdzR5ORER4X17/B3lTewxX8yLuYJ1M8E+N4MNk9TLfl+xQcXmFU4C3JZ5b3wxNseSY
	S7YJkQU7YccenJRDlE0JwH2fPVp3dYB42ds9e
X-Received: by 2002:a05:6214:1311:b0:91f:2208:b683 with SMTP id 6a1803df08f44-91f2428c6aemr76715686d6.55.1794640238785;
        Fri, 13 Nov 2026 23:10:38 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:38 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-serial@vger.kernel.org,
	linux-pm@vger.kernel.org,
	damon@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	jirislaby@kernel.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	pavel@kernel.org,
	lenb@kernel.org,
	hannes@cmpxchg.org,
	brendan.jackman@linux.dev,
	ziy@nvidia.com,
	sj@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	rientjes@google.com
Subject: [PATCH 16/22] tty/sysrq: use common memory for the manual OOM zonelist
Date: Sat, 14 Nov 2026 02:09:53 -0500
Message-ID: <20261114070959.3490008-17-gourry@gourry.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114070959.3490008-1-gourry@gourry.net>
References: <20261114070959.3490008-1-gourry@gourry.net>
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

SysRq-f constructs an OOM request with GFP_KERNEL and supplies a
zonelist for allocation-constraint checks. The request represents an
ordinary allocation, whose fallback domain contains common memory rather
than every node that happens to have memory.

Select the zonelist from the first common-memory node instead of the
first memory node. All memory nodes are common at this point, so
behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 drivers/tty/sysrq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index f4571d05b4962..824f5836b47d7 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -386,7 +386,8 @@ static void moom_callback(struct work_struct *ignored)
 {
 	const gfp_t gfp_mask = GFP_KERNEL;
 	struct oom_control oc = {
-		.zonelist = node_zonelist(first_memory_node, gfp_mask),
+		.zonelist = node_zonelist(first_node_state(N_MEMORY_COMMON),
+					  gfp_mask),
 		.nodemask = NULL,
 		.memcg = NULL,
 		.gfp_mask = gfp_mask,
-- 
2.53.1-Meta

