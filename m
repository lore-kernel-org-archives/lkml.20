Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222390;
	b=zBFwC80daCbRQapYwfFc8ny5kOzYg4lNMpQe9G5Zj7iGIsz5Mjhd/esfNQnmn3r3JHlT
	 YDaB4rSXAJWvcdOc7smARcODLpo4CQWiU94a1In4TdBnrP1HTdgLI60FX30t3EqxxK7Jh
	 S2lZX/ZhJrh3/Fop7wCYZFu/9TvyRWXcgHjN0nsljLalnffK1U+Tz4ISB+0MPHDyc75XS
	 PRRrVtsnCO3gp4LPQHa699YUI+YAOSl1Hi0t8VZ6DIHZtRBkLNlN2Tcr6nkUJu2nvBLhh
	 8JCkNhQevcoTNBVkBaSGt9q5hgaX9J8Q+lqfjgpYoLhU8LXyCRVelh2AYGR4YWigIYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RAcEs6XFMJPdLRK7Qq6ZCf1PAdLxwqRv800fWic7tw0=;
	b=PVr7b88sl2mlDXMFCfdTz+nInwdLyofg+KAHElFPBnoOWpGq+JZCIkS4GBUao2eJLM2c
	 LBMwQqtUhUav6Nby3FbL0SmzmR/6rjA2J00fzPWjoXlW8xQtmsi7J76tvKhLbjYq3CAf8
	 mzEqja3enx8J/RTDbCcpEVYGJtpaN2DnPwA/cofGaNhebkNEepZte5J2++NONhEIiQvHn
	 qVG0XHYyD9jiErKqd2sbCBWwdGFaewlrG3gwkM2iYtkOy5PQJRoehBSwpqm/6W8Pmotlg
	 5GC3QXAIyWznSP5Wd3Z6ND/28nHxP/RVXTK4frmCXWqNaTq0H0UAJcCstzB8q+cJXOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=RnHwox2h;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B932260A2621
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B932260A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=RnHwox2h
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91b9e758c50so1503736d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793222389; x=1793827189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAcEs6XFMJPdLRK7Qq6ZCf1PAdLxwqRv800fWic7tw0=;
        b=RnHwox2h084q4Od74REWhA2412YVYFFiHiMvqSTsggjvkG9IbFTJmnPZvnrKrDrtLi
         Yt32aXMzGBgIeAvNegs2NMRwbVTBd5WBYzM8auhaKNL7vWf8/x4XLy7olhGJlRU/Hied
         oNlMR9iaixMCjCp+wB8jwgTMqkI6qsB7xAVygqVveE1L4jh0buR77Rvwk+6Cqr6ZoBV9
         PPT0HWPjVPh/kVcaxj+1Tqw13SOW3uG6+v6NP4NqpweB9XU88xK28SM9UEDRONM3X+ds
         J5bAWB5+1KxrKfsXfSD5hm/qgaGm3Fv0m5wKWWfcj4GYrlT9bT8hUV6n2kgaj53P/7Zg
         sO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222389; x=1793827189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RAcEs6XFMJPdLRK7Qq6ZCf1PAdLxwqRv800fWic7tw0=;
        b=Oh3akZWizlMBeZHP3FU9twlpkc16L5c3EBMEzl9pqswbIuIhAXTAn+2kpGZqHFiSkl
         tM20GxMfbrNxZiGEV3Ycj0uRzs2wUTOH2OgTGkR1RkwPwdP8buXddBGArUXLPOdUNw4n
         WuD8EDe75Oappn5KZQJ+gKRPZbuJrOnI/B+chS1s1pevYXS98Pcx1AsozcdSR63pR4fp
         cj2NxpmsTOR/mY/GuQ9zqDC+AJg0pIFRkir4gLUf5ZdzLPnF7+4Gn0EnNqlSxeHfDn8u
         YKRFqUAmz+wvNgYU/Oe3nn0or5Yz3rOlARxuN2UpPBv4vnf1a8fmXn2+HvZQStT4hoH7
         0drQ==
X-Gm-Message-State: AFq9FYJKtMbLZrzVzi8+Japkpj0lfuO184ghQVS0INVKCUBb3rG3dGlw
	lwFsOXk9AhhAwHKAxmxSPfdZYr7BeHUiX4lADT3PwCkEf4rExoAGhC5UM9yt95w0SVA=
X-Gm-Gg: AYBFou25XRm3lc8wiOgfJHlKVFsd5rqm4rDebKRarsrbh65ngtPQb2TFxxYlWHyLG1w
	UtfL6im1bHkK+sPMF1qduPBEHTLiWXxr0xKTospikfpQwKnPsGDW9wFHOSU5syrpn/ajtmIUpcZ
	iEdcG9AqKqGF0Z73mfN8jqsyvwKoa+c8CF65tk3YZ3hALCMC9h/UnvNnqW+XHTRYqwHraW3124d
	yehOzOBnZ42kJ42RnSWeRcgbaemANKLWrEdIoKafb+8D4TSBgwaY+G8XB9nZWuIJXAYrIq5brVp
	34ddWtsxyyjIylk4+DYX14aBlyGTEEvgqtMgoIVbsXL8h1TjxPfyuLRMZRsVklhHQAX3qELS1zr
	0Skej2ibyvWavD497YLn9p7stqSdJlmBt0N9M9YXp+5PJN0sGyUIFAIbrbnDohL3p6fs2vrXeBT
	fXLtTzL+C/yDjNLMnqtzmUZg2Xa1N5hh1mJTGP5qakNh1KPhrOWvLYhHlKBMj/IpWlW1I/c1F6g
	N5E9bjpP5vjNI1Bp45ZTPcJ+JC1OC6Gvm0bnHakZZ5om6AGiNLbPsAQMV9CbrbNGgswl9+nejhj
	T+33jMNreTejmUnSzk3PIoxtPVkvWDuslf9VGlKMXo7sHhYwyIoOF1lmL7AplohCrJA7E2oEcRe
	rU+F7ZjqUmi7zrOCFQAP1w3RGX2h5HCdaeV/r
X-Received: by 2002:a05:6214:ccf:b0:91c:7ae8:fa2c with SMTP id 6a1803df08f44-91c90431fcfmr12968936d6.14.1793222383945;
        Wed, 28 Oct 2026 14:19:43 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a6d598sm139778966d6.3.2026.10.28.14.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:19:43 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	mgorman@techsingularity.net,
	anshuman.khandual@arm.com,
	stable@vger.kernel.org
Subject: [PATCH v4 8/8] mm/mempolicy: read the zoneref slot once in mempolicy_slab_node()
Date: Wed, 28 Oct 2026 17:19:30 -0400
Message-ID: <20261028211930.3504634-9-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028211930.3504634-1-gourry@gourry.net>
References: <20261028211930.3504634-1-gourry@gourry.net>
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

For a bind or preferred-many policy, mempolicy_slab_node() tests the
first matching slot's zone for NULL, then reads the slot again to look
up the zone's node. Offlining a zone's last block rebuilds the
zonelists in place, so the second read can return the terminator:

  CPU 0                             CPU 1
  mempolicy_slab_node()
    zonelist_zone(slot 4)
      = node 2 NORMAL
                                    offline_pages()
                                      build_all_zonelists()
                                        slot 4 = NULL
    zonelist_node_idx(slot 4)
      zone_to_nid(NULL)

Current GCC merges the two reads, but nothing requires it. With
mm/mempolicy.o built with -fno-inline -fno-ipa-sra, holding a bound
task's slab_strict_numa allocation between the reads while a movable
block earlier in the zonelist goes offline oopses every time:

  BUG: kernel NULL pointer dereference, address: 0000000000000060
  RIP: 0010:zone_to_nid+0x0/0x10
  Call Trace:
   kmem_cache_alloc_noprof+0x294/0x610
   do_getname+0x34/0x230

mempolicy_slab_node() and zonelist_node_idx() are tail calls here, so
neither appears in the trace.

Read the slot once and use that zone.

Fixes: 11cd8638c37f ("mm, page_alloc: remove stop_machine from build_all_zonelists")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/mempolicy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 0884c629670d..cd63c3e2c029 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2176,6 +2176,7 @@ unsigned int mempolicy_slab_node(void)
 	case MPOL_PREFERRED_MANY:
 	{
 		struct zoneref *z;
+		struct zone *zone;
 
 		/*
 		 * Follow bind policy behavior and start allocation at the
@@ -2186,7 +2187,8 @@ unsigned int mempolicy_slab_node(void)
 		zonelist = &NODE_DATA(node)->node_zonelists[ZONELIST_FALLBACK];
 		z = first_zones_zonelist(zonelist, highest_zoneidx,
 							&policy->nodes);
-		return zonelist_zone(z) ? zonelist_node_idx(z) : node;
+		zone = zonelist_zone(z);
+		return zone ? zone_to_nid(zone) : node;
 	}
 	case MPOL_LOCAL:
 		return node;
-- 
2.56.0

