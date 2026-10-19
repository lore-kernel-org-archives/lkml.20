Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435808;
	b=JBBiryF7BKvYXWy1+UQ5zbYZN9g+q0SFqAowWdR00zH1SrE3gcY5q3pdBIHmrwIVEhVD
	 utindmkLPwiadBgDja85NDpBYpDznSfyvVytsbUgKUQgbksjPYT7oh9DNGfjmHTSGhV9a
	 md2MyQqfuNJZnZj++8urbeh9BTw0NmrnB/zPmbvrx3lsal5pC2p54s2LWZ2W44435CFll
	 yT2ROi/whVP/55xarm6/m00o0SylJhTbPN1wIkV00r2v+qEo4UsdimbRfu7NEZHfIprW1
	 Iker+41ACHNWjtpumYKuwoGppc7ks9I5aFiQmGbRD+EVDGC1okeqqgjfWS9he7fBsHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qQajsp9ObyIZH1W2JtDu/mB6mPActDF2v9UueTjQ/T8=;
	b=FNIEggYv0Q3q1Jr/hngT/tMmws0YQJIp1kv6Vgs3mowPj01Qjig/REOiIW3YtQ0LRT0K
	 RkrqpOMXtADEXhE+43DWAEHbQKHfHS3K0BbbWVDW4EEoCGfHGVrqcli5h3sNjebfbGSpf
	 HSR1Z8zDUEVyYrk5rjrlgWeD5SedTy5aZXcJMBNTUujHFhUCixqMpyYfSPv7rBChPmDIg
	 MPWz0EQmulGUJ9kHTUAatNvhmymsqxbWQ6Ho2CsksjfIMhxcTLTubluI17F9EvVwg6toG
	 ZVCXwgnWpaOF3m9JxHdSISSK4a0NH7J5mAHGBs8n+ZB6GkOA+i5exGbKX7g++hmnCdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=PC4SbAoc;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08992606A328
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08992606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=PC4SbAoc
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-917c04630c2so28113976d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792435807; x=1793040607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQajsp9ObyIZH1W2JtDu/mB6mPActDF2v9UueTjQ/T8=;
        b=PC4SbAocOcKCk1olB/9Of3Mk7Qksv9J9g2B61lEgWdLNvU+Yk1s6PVk5lvuLnEx4lr
         mvmVmSWV7KSn+Z2JaGwGn9L7La1IOFjQymWkn1bzEOHufm9ZTc5KURasEQh5ElYjRbXu
         pfUjc4qrhvx9DsP/4jkQtXaZpcv3Mp6YWNCZLk3TQKeVpjmfiT5+GN3fj3zKf54x4M71
         COp8q/V0vv1J9MIAQaXyPB8ayYjoIXNHmwfy7X+Q3jY81iGkW7zlJkNKNoXeZZFxp9ZG
         gaq36sIN76PGb1mJmGGJGzCb+KRwuTdKUGb69h3rHTb9E9+eurkZ7j0jfzTeNb7aSTA3
         QUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435807; x=1793040607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQajsp9ObyIZH1W2JtDu/mB6mPActDF2v9UueTjQ/T8=;
        b=WgzN+X6U3BmbyPrKMNJLdL1LkIPhBpDjtYlm9bvWKcxP5vjt3/2LvCPsWPFj+oNrei
         ujxCCOkuDEH2WKbNKoKC8Vf7+7wsvI/aaWqTb/4ePs+4kyEZWYAXTep71XpVEJvREnKF
         AkjY/m2jcSp57XOMV5l7hjWQvxETULeea9Bx66iUR06RgGjzap0FVe2bk9dUGJIQWJub
         Jkm/O4t9OmmPh+Pcjdq9F7lIOfkwU0/gfy2nhqW2WcShjJE01qW8+WV+YMuKGWjEnc2U
         m9VYw2bUzfjxfn+pcTu70haJW3gqgcMl+rVO3SLAbKaBdhVlT6M/z+XSt/rJQnY+L1lL
         1p4Q==
X-Gm-Message-State: AFq9FYJjnMg5YHp+7Hj09BkOE2diUQ5mfpfckG9CMHnd2SMIn/S/o9h3
	SFjkIyzk2uAvw6/u6CAC5YU9xfrGG4zAf9xPM0AX/QLygF2sDc5QI59QNgyjFbwFLhSxK3CNThw
	+o1gqeXI=
X-Gm-Gg: AYBFou02zVuYEGtajYbEpFT+xpdNHir+ElS0y2qi7LEqJHJzoxx33VmBvOx33MZkJyq
	c0XtkVS/T2BaqCFbeC9Fq2a9p8OuysvNcZocfUYUmNVmBtakt58lbCBNggDRiOLd72IyPVOPaf4
	iRs7gP4N/tmt8VgbYFk2Z5TKCXT2Lijif513uT1TlY2ggDW1E6OpNzA0cOaj++KRyn815kXTeTg
	nCksqGojDkbWOGy4j0AzWZqTHbhRRveWj51m+Vu96DPcyVhTeQqlOiXvoRkDG+Scll/pUG4lx5D
	aDN6MCXg38H8MwoUL1WgPIVYm6ZxNeMuOCFr2TkmenwoCCg+Z5QyKZlRQUlEvneOU+y0b6kwPbS
	hiDOyHTViJ7kojn3tqZKmuh9SDmnWJyRn1RGL66/gzfQVnEPlZvFcTiuViSBTK1O9yhfCEZ9ARL
	GaZL2MZJoPSThJ9k4REeDXecAtLpPiIcajPwaITeM+mOYtw+k7Ch2iZPHwAjGgwO/SbZIcVpW+8
	Ta2QGa8HLdkQ6ABo96iMuQ9oL2Wr1Va4T6hGXK5v+gCtIZ3WpnyAGPVaXSZ5pbfhF906dmJEGH2
	4h1X+Iqi8UyAy/L9rybpQYaVpvoaYVqAge1EzErTrQ==
X-Received: by 2002:a05:6214:5d02:b0:917:a2ba:e478 with SMTP id 6a1803df08f44-91bdf01992dmr155941286d6.23.1792435806990;
        Mon, 19 Oct 2026 11:50:06 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c0411586csm3122706d6.44.2026.10.19.11.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:50:06 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	hannes@cmpxchg.org,
	david@kernel.org,
	mhocko@kernel.org,
	ljs@kernel.org,
	dave@stgolabs.net,
	roman.gushchin@linux.dev,
	stable@vger.kernel.org
Subject: [PATCH] mm/vmscan: reclaim every zone in per-node proactive reclaim
Date: Mon, 19 Oct 2026 14:50:02 -0400
Message-ID: <20261019185002.3428594-1-gourry@gourry.net>
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

user_proactive_reclaim() limits per-node reclaim to
gfp_zone(GFP_KERNEL), which is ZONE_NORMAL. Proactive reclaim serves no
allocation, but that limit makes shrink_node() skip every ZONE_MOVABLE
folio, so writing to /sys/devices/system/node/nodeN/reclaim never
reclaims a node's movable memory. A movable-only node, such as dax/kmem
or hotplugged memory onlined movable, reclaims nothing and fails with
-EAGAIN.

To reproduce, fill a movable-only node with clean page cache and write
200M to its nodeN/reclaim: the write fails with -EAGAIN and the page
cache stays. The same write to a ZONE_NORMAL node frees 200MB.

Scan every zone, as memory.reclaim does.

Fixes: b980077899ea4 ("mm: introduce per-node proactive reclaim interface")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/vmscan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index e82ba737c028d..90f7a7bf4e426 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -8180,7 +8180,7 @@ int user_proactive_reclaim(char *buf,
 		} else {
 			struct scan_control sc = {
 				.gfp_mask = current_gfp_context(gfp_mask),
-				.reclaim_idx = gfp_zone(gfp_mask),
+				.reclaim_idx = MAX_NR_ZONES - 1,
 				.proactive_swappiness = swappiness == -1 ? NULL : &swappiness,
 				.priority = DEF_PRIORITY,
 				.may_writepage = 1,
-- 
2.53.0-Meta

