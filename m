Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640218;
	b=edNIkYvDJmaCF36AOXct1n4DneMVuePqLBUes33KaklnuaGUCz2xssLfXDk5W8XMb21J
	 nPwIlC5cpg4xPDjnkf5f3tvG9vjKHoZyKqvvglU6+WSghgVXj29LtG5VKjHXv5vy5qGLP
	 1aw0ujVZtwGClUKCTYCQaTCUQ0ME9LPc5fzyS5342xSHPLIWJJqNs1WR8/7g+EyQTeg+7
	 UgooJnBKJ6Al/IvRG3FQCD8LdBCDQL3RrbK3Qx/au7sMoB56sUJwHp2FMKxr5eNCDjx7q
	 I2kCSRUYs3M+jsOnSVct8G29L0JCTs1gEmmXQb/ljZbWHkxz+Dz6lgSG4VYXFKggaiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pld+EM/EXNXxfgZubwvob88FbJ3qDEqFg5eLGFwAxrw=;
	b=chLGItIcJoBi17FqbCKITkh0X7+LozcI8rgkrwUPGY72hjw4fcRL05y3j6Pbq5etvu9N
	 mmRXppR0YRn3msBQQ9GX24UVDlo3tGBLLhYQ/sGLfOdrue+0NmHCBSRMjrHGIWW8GZVJu
	 qEB9F2/R4q3p3j8JrPfxGW3a+GXA2AW4U+c06Clp5tB4eRhiEROn2L5pv+NY85r69muSU
	 mjwdnX546eLMbpbKp913AgDeBuz1mK9ZtJJR5uviyzRoG6NYZ6ZmeznZzV4fWpHzAO8Vd
	 DdRA252sWOB3/XdhXdyPDwBRH3fjjLRaMO4hE8giGTbU3gJbcMYQcXj7mTOIZfqxjhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=fZh2cb1L;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EB760A262C
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9EB760A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=fZh2cb1L
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91e7fc8265aso35589046d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640217; x=1795245017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pld+EM/EXNXxfgZubwvob88FbJ3qDEqFg5eLGFwAxrw=;
        b=fZh2cb1LiTzSJJuOnufVWdO5uqn8qMfsQjZkSDcuVrcFCC3Nz081OmFdRyBdfcDXeK
         PtqCPeoNuyEztLDVFQOTRjF70fsbDa/YamFvNQf9kWWfHaCXg82Zwzsa4UJu71zJVFbz
         DrH38E4lxwMsJRxFci+ewX/0oAPjtdvLPYZ5VTYhAzrtXdl3mrASJNk9oDZMBuGQX7J4
         pZnpsmYLNfNkHHM8PmVTtoIUGhudURHAF6PdA0hZAdyipbVro6zJupwZRkdKN0fw+Q0d
         ORi4tocZDqoL6xebdcxuIfScFZIYh9Xs4P3jbWKeSHPO5JkBm9C1FtrFtA0lJ4W59m0I
         fNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640217; x=1795245017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pld+EM/EXNXxfgZubwvob88FbJ3qDEqFg5eLGFwAxrw=;
        b=UJHMTSDGuB6LTz1CxrgQyknccaeNQk3XBZt4/uCw8ec5YrX9uUWaZmwcAB00dbhAHk
         pfDnfj4j23ZgV91eMTDDMJN+2/eDJJ7rzBtXFnNtoEqIXLJXIsjdMngfGAi+NiBBMvqM
         /M7CkSlwVqOmozBwM9L6rP5xpMteV8FjRtJbf6ay1g71me5WNfp+3iCGR8WTRlwugWV3
         KDX4unWF8i8ATWUVIObCU18BppP9Fse+1rYqv/ot3TPljiL7E6U+YEEoPR7IE0ngqNFR
         +YfMCA8zNxdKzkVABlxRc96aQW0uo72Z/8uxHdPqhuS2Lb2poFIKVe2hZMCh32sUJun1
         QH3w==
X-Gm-Message-State: APuU4Z8UYQjoeJqn58qFR8AbaXOYVtvl8Cxi81UVI/t8FEYyQMecXkTS
	BpqZDssMMu42aTOkIuXPc8Fga6jTizj29ETSpxz7Z37UPPAhfb1POYYlrVcoai0Dk9U=
X-Gm-Gg: AYBFou2opg6XgmTM/j6qvxxzsSqFXFaNp2cw1A35ZCpgkBSZQALCyyN5afEvoscz7Mr
	17MJaMQ0exktEAL8UXQD25A06OIUU3tiCOkX8oDEBEyovnJhBsRRSFgylMbIOKjLk0g+pMwWCpY
	wfVTPS+xV9+DpUf3PFKlEN8EE2uH5wxL6oJ00D7tuKoWHFAJ1WwBYn+N5eh6/b4XIPzaN7k252/
	+KPPB1vk12e+CL3qVQKq85+JgZ34LYjQbVvNsQwoktJovspnWe7Kg3Z8qIEk6uTlo0QI3HyIPix
	EPGXvXlIIjluhNSSu91Z16teUWyeifgMipAczRK6yHXSYL6hPsRZBmugAlnPYF098b67T30y0zw
	jGX/uQbsBen3caPQ4MVJOx20C1fP9WFIhoLlAeY3bzKLIHQ/gn1zKQytPuSq1MxlVUmHCkAOTZT
	0OiejcazRQR/9JMMsisgtOzI0EZ4e5kR9w2yoZkI0qJGA1uNAiklkT3jMtnhr7YUgghfLfV2Fcy
	kY5hf4bNjkdO9BKZ+Wi3CjVLFsi2JA2JVw8GRoJe9uNYLZEHKKhm6cXSWgLrnL4MQSvvojgbQ2W
	Sw6uwsUxZd3QasT++/pzh63wdyrTBshBb6u+hv5JzotugHNl+1kgFmiLDEFpjQiJLDtPivvyral
	fXV6uNfGGHu0Ge3Lj8ILxXYC2jdVnPRuw3Zrl
X-Received: by 2002:a05:6214:6347:10b0:91e:cf4d:f868 with SMTP id 6a1803df08f44-91f2420f9c3mr56246926d6.22.1794640216984;
        Fri, 13 Nov 2026 23:10:16 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:16 -0800 (PST)
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
Subject: [PATCH 06/22] mm: base hash distribution on common memory nodes
Date: Sat, 14 Nov 2026 02:09:43 -0500
Message-ID: <20261114070959.3490008-7-gourry@gourry.net>
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

hashdist is useful when large kernel hash tables can be allocated across
multiple NUMA nodes. The tables come from ordinary allocations, which
only N_MEMORY_COMMON nodes serve.

Count N_MEMORY_COMMON nodes when applying the single-node optimization.

All memory is common as of now, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/mm_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index b4c4dba93652d..0c076bf5bf380 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -685,7 +685,7 @@ __setup("hashdist=", set_hashdist);
 
 static inline void fixup_hashdist(void)
 {
-	if (num_node_state(N_MEMORY) == 1)
+	if (num_node_state(N_MEMORY_COMMON) == 1)
 		hashdist = false;
 }
 #else
-- 
2.53.1-Meta

