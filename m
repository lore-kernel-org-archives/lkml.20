Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550387;
	b=rvSBrW3w4PfdT+rdziRoVupMNg9raUK9jBOLMHZarIVtJGxvsiK0Gge6CPYJ8RYfQNs2
	 x+W0zFvPRMnq4icvufG4XoMxYwIOT+m3pf1pjCjAs5wnpPsZ6poHx3Ks4WO7Sf0YwM2UI
	 CBl3bnSMdnVNVIrD13/ajxBjjOwzuulerlxXnUDoIrLM12ydCv3eEtQo+5SQnfMMjtQ+H
	 Doo8G/PiSQFOznykoODlSokXf06YYHeJ3AX7ILNOVDuj0wVH3dj24VyzdaS7m3+DzMZ0J
	 SAoUE5uNPjBWn9BtTjTV/C6WMmiI2OTX4i7HtEH/6xfDrXSEZ/47sY8z/zVfvOu03RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E3Lrkwg+RW4zCfUK1fUmtt4kQ0h3Wr8RlR2Q+IisBWc=;
	b=R7N8bppL5nIuuO5iT78GtlYINXA35Ceps/jnuOXuco7NBXzeMJNYJAjzBfAOxx1SDlY9
	 mZPpjCKHw0eeq1sfTz3pBrCdf/z/elCizWXTCrQOc2YVqoAXdQpDs9Fpdc1yjBLN1geZu
	 pRehSCE6xWFclL544Scl32ovau80PaKI4nDpn7Is3h7e3Tf3K+ZUvvJplDhFJrrn6ImQM
	 mS3ZtMKNDxekKQTR+rQ6brSKXB1VvmrUQspZUv95Ci8toDl2tSc9/u3YqVFaTiVtait+a
	 UlLcw4IPeTuAt/gdCNFxX0gUInf3nS7af8K+pFgF8dyeMKrWq4j/0NZRuL45Gof2mPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=DlBQVqmd;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01073606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01073606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=DlBQVqmd
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-9196d8543cbso2197636d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792550386; x=1793155186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3Lrkwg+RW4zCfUK1fUmtt4kQ0h3Wr8RlR2Q+IisBWc=;
        b=DlBQVqmdggJzMLtVctYMORoaOfmN3U64fiq356uSAOANZVzdQ9oXHdCA96fpkln0YW
         jbjerg8i3RIUGPPHhNsiTruLigBMA7zORq/KYkzeEoJT6eBDrJAZZNDq/deZQlW3u4cq
         ceHB1ClEmbYMlBds20UE8TCR0KAU+T6PttWRFREuWdJXvHGJf93DduBoT/ObaZC3l5vj
         VVaj5po5s1U6oo9fftDJoRDKJGY24THmSDgk9gldIp3GI4HTLEFmCwRVonUcJcdQrO5x
         BSM6CXIQAYjRrdEUu4h4jfl6bUB4gcqeFIl7UkXuDmxnrVCW8UPWgEBjSMHA5u9l6/1P
         K8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550386; x=1793155186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3Lrkwg+RW4zCfUK1fUmtt4kQ0h3Wr8RlR2Q+IisBWc=;
        b=fsfe9agKtt1JeOpjFSHhJInk/opT6yPMah2iNTSNSJP4G1Ma+y7eRWb6sxDCObaSJV
         haRhnVderJHE/ynIk4vkGF1+SySRdm26kFgLEPpG27S3BW755tS5AOUAN7kaUfLMfrJY
         VriK5YJp/vFem9T0nPjujXn+2xGOdB1bKzD4NI47gyTATki+2bszGfApY3BaAQtM7FqQ
         Vcy4onNYEdvDWVXdX5hV2e4p3lrWt9NcVtiiihvATg6PWYZ/hAm3vNMcuUCLGjPxphwN
         GYLElJEuE0yOb75vANMj86OfI/XeBCYexd7JjPFfFtJCclHNPmjfGIgEfbwD8my8CMht
         /O0A==
X-Gm-Message-State: AFq9FYIWjR4e87IIrARwdI3iDX+I2mMR3hP2O63jbk8ml6PD598OLe5v
	nQU7E35WZ17cyRoYDGqUpoxniB4eaRqzj8K+iC89JJpvg/zkrbbLP9eukUWT3pbHPVc=
X-Gm-Gg: AYBFou1LMKrgjLTc35G6a0ZrcWEOQazQyVwe7j06Vydwr2cNsPPutRmSCZRXunUIBnL
	3zZz+VZgV7mqGVr/KK9RkzSdNvtotB3fAF8SrqtVZIVeTVa7iK54LTpzoHSn5TuuULIQRclTClP
	n9vB3VeiOBsHY3+G/FyEplUgiUcuTx25CY1atg5w+tyGyxHhMjaCA50ZVGmQDZViKsY0tD05ETY
	UzfTOmx+NzFU9IPBcDj2bYo7d8IOQlB/uH2d/qleeDiwjQmU99E72GEtNJt2nyYUu/5NmJEM2p7
	VORdQoVK/ZP0Mqa5ykGcbNzMZmWdybusozKaKobey7pld6pW5SPfzkIxsJpEejDWrEHdaHOZUA+
	Ue4zcYyOj4nPj+S1M02hgssCwb5/57FvhTlqmHYwtjjJ7enEQdIHAJDMmPBpcXWF8qXGrYkdo1u
	EbyFY5zY2D4YBIyQZB5cWtpnN5AXjUZSgms2YTTHUKhUt2muGzgFfI2Tbpz9nk1u4QkGStq2m2K
	SacSdjHZGr3vACvGQj9BYyiVR9ia7SbKaG/rpk3/q9LsPEWdVPoOAB9ff9BMZN5jDknc8YyRn6N
	nESqcQYFkaPkSH94PPaJpd/9E468PK1Y9+AvLpW3Zg==
X-Received: by 2002:ad4:5aaf:0:b0:917:9cd8:f26f with SMTP id 6a1803df08f44-91c12ed7e09mr12120496d6.25.1792550385953;
        Tue, 20 Oct 2026 19:39:45 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10a45336sm13819426d6.3.2026.10.20.19.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:39:45 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	mhocko@suse.com,
	rientjes@google.com,
	shakeel.butt@linux.dev,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	mgorman@techsingularity.net,
	anshuman.khandual@arm.com,
	Bessel.Wang@huawei.com,
	jiang.liu@huawei.com,
	stable@vger.kernel.org
Subject: [PATCH v3 1/8] mm/page_alloc: detect zonelist rebuilds from memory hot-add
Date: Tue, 20 Oct 2026 22:39:33 -0400
Message-ID: <20261021023940.1940971-2-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021023940.1940971-1-gourry@gourry.net>
References: <20261021023940.1940971-1-gourry@gourry.net>
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

