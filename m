Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792430633;
	b=daywQ0akk0Vxpp7R6+L67TfmCAatZ7VMDJz1gT/oq/W41z/ExUOhmD6Xzkb2N2IVA0sV
	 gJH2BDUhWql3kMW2c+MqKKvruvit0R+LdP+ohXk6bBDLRVbxv66Q3O/LQ0gAGXQjrGbUT
	 n47xSPT9rjsplbjOn44f5dH2IgAeXyvSjSmY/uA3gJ9DUY6E1YD5KYDoeEvvhHanYJnx7
	 Ous8lkLSkZGDY+B5yScSM2tnTO2mUKc7mku9nelwGSyRGo/W5SStbfP1C/9igj0a5SELm
	 R+nLKS4o97pWj8TircxbpCM4BuUlv0pGkpOtBSMEUX6q5s2BFP6LGZpHI5hmw28ausQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E3Lrkwg+RW4zCfUK1fUmtt4kQ0h3Wr8RlR2Q+IisBWc=;
	b=dIkQOEDuQTveGHSjLIR7613NzwnYbctugagra5CL3uzLJ/GarA4/yxg5m8er7sSOpeb5
	 K58GHe4sBRB8NtE6NWLliQvAVyaRmn11WcXonkV3+2fmyVNWxvPmunkVCvdFuUE6VFWNr
	 8DwOyzMZYG0Jdp2Zq70HEuBo3K/7lFhF+dEwJBdS9vFIlTaCxILNtGkNdYhxlbYUFEvlt
	 OrTuDSXKzJmApN4BEjtb2z+0E82LFoYjTMCx6yaoA5fjZa1ItJFgdJKXXKBnYE+yTItyF
	 Y32d7Qt4ffHmDE4lw+X7Y0pzIZjgc7wvy2nn5WDhk8Jsqs5fKlZoTx/qThzYdzN84cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="WB4/j1+F";
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83546606A325
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83546606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=WB4/j1+F
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91791ec1b83so20150466d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792430631; x=1793035431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3Lrkwg+RW4zCfUK1fUmtt4kQ0h3Wr8RlR2Q+IisBWc=;
        b=WB4/j1+F1iM/mJlwez/NRd2xWxGjEmcITZuem8/QbOWdCWFw1vKlpZtkZ4RRYEw09w
         G8GbWJi+VRyeyDiTbYI7ciQb4RcUgiyrbSS4PaqNK4HR9lDUr7imu0hgVbPFUL73YdQ4
         Yp40iwmt8wx2g0xGLD1BurD+FGMzryzHq/YJKGG4NJ05yU5W6CsGqgVCPS6tt9+xr06x
         NJu2MHHqH8K1MNC+tINP5riqAV53y7pOLkg1e1x55IMiMlPLaFAtPDN4DiSVnP8U5Jb7
         huAhwOwnmNnVShuwqmkwA/2poIiHAIQDjRncd5mT0MoZ9iviOb2AkWDvTWqnGGSTZ0oU
         YEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792430631; x=1793035431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3Lrkwg+RW4zCfUK1fUmtt4kQ0h3Wr8RlR2Q+IisBWc=;
        b=otONEjgLChrqABz7jLOxnhjIQYtgTIfvzIJBP08K0barC+JkiB6En4rKzx0G9OM+Xw
         mc+7rZirh1TciuTQaAYFiG8j5bCZQeEo0gJ3aoGnnyaSE7xcDx5vgV1h0Z4otY/CDBtC
         EUsV9QelrI2rjugGgfkEugLDVAgxELVrXOz3xGh7SD/PJIM10qKMd6rkoMaOv/Sc9sFc
         LL2zaCKoD0il463DQJiKtXTotJWup6kxO1xlm1ea0l6ysT1gs9Vrg8lY66T5kgak5+Jj
         FBAzJaV5mJgrWoNWFQOd8jdVZFGB3OLClB1dlV71USVjpnY3Zwctiz/ZbzhhncrVZ2kf
         MnxQ==
X-Gm-Message-State: AFq9FYJHQ9T6zryM5CX6Q7YmfreSCbnwcDngrZiC8UddDps0kXaC8ihL
	lnxvMsRlIX8vwnojFZzGKOTJEOYURa+DlDC3B9iSRjTV13vBW298x4mUZE3fpm87Ugo=
X-Gm-Gg: AYBFou244agSfPZYBX6L6tq8obI0SEea1mehTrz6XGzGjkxF0F9ms+48KoVfSIgrJ4I
	hNrGFMBps/XUNTEkWu9fcBB8cithq8QKnjYLt6+wygxHRTok02lwwrDaT6fgviP9LWS5VBw/K2o
	3nXJrCF2rr7Jy5pSQEuKeSKkaHIAG8ufWSTmHOWbGvFSbcfVWgvkc6G/Pyoks9jJ9jiHK4f1X64
	qB3WJQl3R2Ozd1xE5ymRt2RSjxOAbWvFvnXhWrN7n1Yjfoj9t6juf2LlBGYE5dak6bVC6ujIx9O
	SSb608yyBLWL9xuNbnL93eZiCaYnqq3nIjlIgUP0VsUlh18zq9QuanB/uRy/VakmxPw/HUX2zu+
	NcvyJlKdK69mgFSt7fQLhQLwNWPLXOranyZhcYb954CLK5WnvpPjbjXeL/DARGQM+s92CaSIBA+
	Gqd5rkUMwk5M0abZtGToOE753o4thoCx6u+O/QfjYU1dc0cStc/oESbtl8evKTMZ52W6tABpv3g
	YNgALEL2vVXU57KVB5/Ah4NdjWtQ34W1HE7gZm7kRJ/8POTsVzZTgSg8QL+
X-Received: by 2002:a05:620a:1b82:b0:93f:a63:15f8 with SMTP id af79cd13be357-93f29b7fb31mr1250130185a.8.1792430631371;
        Mon, 19 Oct 2026 10:23:51 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4adb28c2sm14615385a.0.2026.10.19.10.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:23:51 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	mgorman@techsingularity.net,
	jiang.liu@huawei.com,
	Bessel.Wang@huawei.com,
	stable@vger.kernel.org
Subject: [PATCH v2 1/5] mm/page_alloc: detect zonelist rebuilds from memory hot-add
Date: Mon, 19 Oct 2026 13:23:41 -0400
Message-ID: <20261019172346.3344005-2-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019172346.3344005-1-gourry@gourry.net>
References: <20261019172346.3344005-1-gourry@gourry.net>
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

The zonelist_update_seq retry was limited to CONFIG_MEMORY_HOTREMOVE,
presumably because only hot-remove takes zones out of a zonelist.

However, build_zonerefs_node() rewrites the zonelists in place, so
onlining the first block of a zone shifts the entries that follow it
in every zonelist containing that zone.  This can cause a spurious
allocation failure for a __GFP_THISNODE caller.

For a node with only ZONE_NORMAL, onlining its first ZONE_MOVABLE block
rewrites the node's ZONELIST_NOFALLBACK list as:

  [NORMAL, NULL] -> [MOVABLE, NULL] -> [MOVABLE, NORMAL, NULL]

A concurrent GFP_KERNEL | __GFP_THISNODE allocation can observe the
intermediate list, skip ZONE_MOVABLE, and find no eligible zone. With
CONFIG_MEMORY_HOTREMOVE=n, check_retry_zonelist() returns 0 and the
allocation fails even though the node has free ZONE_NORMAL memory.

Gate the sequence checks on CONFIG_MEMORY_HOTPLUG, which covers every
configuration that rebuilds zonelists after boot.

Fixes: 3d36424b3b58 ("mm/page_alloc: fix race condition between build_all_zonelists and page allocation")
Cc: stable@vger.kernel.org
Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/page_alloc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 2daf358269ae7..c7125f6693574 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4404,7 +4404,7 @@ static DEFINE_SEQLOCK(zonelist_update_seq);
 
 static unsigned int zonelist_iter_begin(void)
 {
-	if (IS_ENABLED(CONFIG_MEMORY_HOTREMOVE))
+	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
 		return read_seqbegin(&zonelist_update_seq);
 
 	return 0;
@@ -4412,7 +4412,7 @@ static unsigned int zonelist_iter_begin(void)
 
 static unsigned int check_retry_zonelist(unsigned int seq)
 {
-	if (IS_ENABLED(CONFIG_MEMORY_HOTREMOVE))
+	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
 		return read_seqretry(&zonelist_update_seq, seq);
 
 	return seq;
-- 
2.53.0-Meta

