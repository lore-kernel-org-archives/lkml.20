Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640224;
	b=ibwkgrNjitXGpfHjo9Aj9NbrAAnovzFMxp2yZvW2tKTx4RUXi24gGFYhEseEBtQPi4Qi
	 7xjSEpB+RJwApmxm6Sd1jWkzpQ4RoJQMwHoL4ROrDnYZjEHjAcTutrtxFPokKlyjfQRYI
	 IhOeHe+rC0gfWhprnR6HUJhOS8EvG3VXlfCn7+X1m1ulSfUKtqr77gO81AKEEuI26dvVu
	 KHpuewakW7Y4PIkYhNjkhZsDsUYHH2M49FwF4Zr1vULpWl9gylJFlH/iBPCazYKD+XDnl
	 BscspP4v6idAvD5jgk3BJyjfGwbizGnFl5iUBCfrz3AW0Grnhrk7k20VTzivAt7XUXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y6oxwUC9/qQIZVXuymnHKur3Vt67CPiMCpmdjljurXM=;
	b=qY9VdxCx7DeiveNjD/WipXloY54i/kDtj9z0678CilbvCplx8JyM3uEtUeooKeOvI49a
	 D83A9M/AlH/6wvR9cr/0Zz4Ue8WVaZoSwJHEDlmX+HKj/XDdcWUZ+hBs769UftCkehLMh
	 nnCKVhKdWTUVep7Fof/582j2qrKSYZWvqUolP2786v8WpCpHaHyV+uuEHrbMp1bYiOWg+
	 zZKzS3JuL6/1hb3QGzAULbTxBGk2dhIqeDuQ3NJuPzeJPdmU2aXOC7mbNQD16F5xamXAV
	 6H/ufBE7VOZ1SWS8vFn+eSwcodZDkf5w8LHwyC9WQCuec105GAghNWIIeYCxG9ZR1fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=XlayBPV+;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2763A60A5BCB
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2763A60A5BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=XlayBPV+
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91ea2e29d90so38112026d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640223; x=1795245023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y6oxwUC9/qQIZVXuymnHKur3Vt67CPiMCpmdjljurXM=;
        b=XlayBPV+6O94G4EvOv/apyiTo3m5/u93nKnLcvDMZ5IZPd0h+zJdRRruMsVEzi3WoC
         z+Si2hEa+Ua87rapVuCjiDYM3x1e6qBeqGGKaT+0sgS14MzxbWyx2Ucw9pF8mizmV1OF
         i/t/Oeuq2KCow2Q0aWnwaQcVV2jadem/GeVnEOD0NFZfkI+oaWFfXNpjKd+lsCUarnli
         6377+lF8LMdQhAtCoZ7vh4YMKQp23DrTIh9X0RMqS66GPLHgLk13lDoRAz5VubUIW3tN
         IQtaAGEJaTre22tDiHAkUzUrRrP/waHscFQx+6pylgrnkPGeI2Z6Qg3IFhDHNBbaaDlL
         nLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640223; x=1795245023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y6oxwUC9/qQIZVXuymnHKur3Vt67CPiMCpmdjljurXM=;
        b=UruxlOga3AKC7MHDA2bjTXKVG3B/5ShWQYEcLAB/HND/We0QFxiOLC9Tug5+Y3iSAk
         ODJuH1IV9JSW5R3EchX0lCuOpbDGueeU1Tlf2k4Ka/MAI5k4wAW0ffuznSL/2kHADiKy
         wpKlILacBB0NYFT305oZ3m0qyxV0o7Fa7ueQjWVfBFBvZGcHckgyG8vGkpRZ8LlkMVFO
         fM2FTamSFYJv3RqJc2GOoEjjfntHu+Kq9WsfovFj+eNhDFWIO+aJIHDP9CQWLCPS/4ip
         GTyv6Lxmx04AZKN3p3flo+W5w4gz7AkWrCHZ1MhMqjwxjOk6r2473fKuTyeZ+2R+ONDd
         ILxQ==
X-Gm-Message-State: APuU4Z++qy+WMq/VeIMhXi4JUv2koEswDxCVT5OzHa3PK370BuJFRT1E
	QQd0itqZIoRxotdEwVWY6ulXtqhm8Os/NxwhVyJKyjlMR46zVfj/BeIJ5O4m3XPlpYs=
X-Gm-Gg: AYBFou2qNUIFJpfftudQX/6qICfpDCA3/g9M1hypm5704TDnwlx64PoXZUHvkEwr1gX
	3YQFQVgw6Rt4PAwCQ5g1goTWUoxoGMO7Jpy11fzf5FMPFcI77FVIHnYXojuKgkoQfMiObMDUrUa
	AEGLoGkjqi/TZEiAATQSF8+Dr8GiKn3qHeLNZFDmQjmlvbC7dWIUUK7mGXqlQ39ERHXDDWk6r81
	N81pUkrdOEO7ElyjT+L/nxh/0YZeThMgFt5rS7kfTEMrPUPaP/Kis8aA44uQqZhf0VNhuKKarOA
	tWfHtljB0A/9LKkCS/BGJNqY9LX9EtHk5FJLeyQRVPDKGhbvX7RKk8Jq+WnLkCaku3VWPieqF2B
	/r0l0UhdN60JdO1iRqIpBL6moqo9Vw9qLuurW73pw8hWPgLYbx/GvFyyg9haI6RTlvUDSRi5FrW
	ooFUBgR9LTY2eBIPNdLjA9OvfnAb1n2DOj9A6LT09QO+JMPb6Wels89NYSST125Nh18rJNJJuBn
	iusqpMTkeeb0EgCUIjxNr4AI4g0FEe6BO/o4Or1+YcwxEOeZtE5H1Z2KacGJlkc6q+KxErPReAK
	W+vBbTwuPNpkuZhE1DO1sQtSCDsLiZrgcpXbSHI688ESriy7MQHmfLuRGlCj6mFksZhrGU592kh
	Hwyc/W5HP9bIQco8=
X-Received: by 2002:a05:6214:2462:b0:91f:3182:e94e with SMTP id 6a1803df08f44-91f3182ea72mr35908656d6.8.1794640223087;
        Fri, 13 Nov 2026 23:10:23 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:22 -0800 (PST)
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
Subject: [PATCH 09/22] mm/ksm: restrict merging to common memory
Date: Sat, 14 Nov 2026 02:09:46 -0500
Message-ID: <20261114070959.3490008-10-gourry@gourry.net>
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

KSM is an opportunistic MM service and should leave memory outside
the ordinary memory pool alone - as it already does for ZONE_DEVICE
folios at each acquisition point.

Use folio_is_common_memory() at those same sites, which still rejects
ZONE_DEVICE folios.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/ksm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 623a2cdb39242..25b2c2f944862 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -831,7 +831,7 @@ static struct page *get_mergeable_page(struct ksm_rmap_item *rmap_item)
 
 	folio = folio_walk_start(&fw, vma, addr, 0);
 	if (folio) {
-		if (!folio_is_zone_device(folio) &&
+		if (folio_is_common_memory(folio) &&
 		    folio_test_anon(folio)) {
 			folio_get(folio);
 			page = fw.page;
@@ -2571,7 +2571,8 @@ static int ksm_next_page_pmd_entry(pmd_t *pmdp, unsigned long addr, unsigned lon
 				goto not_found_unlock;
 			folio = page_folio(page);
 
-			if (folio_is_zone_device(folio) || !folio_test_anon(folio))
+			if (!folio_is_common_memory(folio) ||
+			    !folio_test_anon(folio))
 				goto not_found_unlock;
 
 			page += ((addr & (PMD_SIZE - 1)) >> PAGE_SHIFT);
@@ -2595,7 +2596,8 @@ static int ksm_next_page_pmd_entry(pmd_t *pmdp, unsigned long addr, unsigned lon
 			continue;
 		folio = page_folio(page);
 
-		if (folio_is_zone_device(folio) || !folio_test_anon(folio))
+		if (!folio_is_common_memory(folio) ||
+		    !folio_test_anon(folio))
 			continue;
 		goto found_unlock;
 	}
-- 
2.53.1-Meta

