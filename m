Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640250;
	b=cF7CmGbOwVNQ81FXqin7WunxnNbjUP4cOdBTWnqPPqyRmgVMs/oKdKlI5aUvWKohIPvH
	 JOkAAGZ269i+ZFJIEWi8ZP9njS8VEvpePJBHCKHBh0USQCrf5EBBIEaflSOUJnpl0U6ll
	 25a8BeFkbwONs6rC5WH86W9zOaTrb8RmcPAq4xB2sNWnsUulO63aJNZyqJDysFo4l+DH1
	 n+i2ApGUcXVnMZxjmZcKlRAUvuEjmRgrkkjWIwqIxf6PL66MKcakzQqPKImgvsSjUA0mz
	 NPXDWNBTM4SLviJPJ0JLhImN50XSdkoDAfjSHK5JB5E7EkMPmQbPlgPHtj/hhikTU7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SG9odMntLujN1bfv7U8SkJUk66Dld0t8e7Q+mOyqXTQ=;
	b=w8vzwUpXD6RagNanMF6x35zzz+Qp2hpdl/n2Vp38qRmJDiI1jKiMdPE/XMeZsFirvKWB
	 d1qJoRJAPiATM3UKhUIp1o7favk+Kdd/e8BtrQ8hRknB36He64v3KsZ/18C4LSiv9hm2v
	 kD5Hx22p3vV5MaPkktg9ZYdUX1FFwo7Sj6UmYkd4FKdxk2pjK31tDkyi0EbH4yndcwwnx
	 JvLZzITlTWt5P0VK5UEgE8hqb0F/2hMzWdqvESWasDP6blnIoIIhM1bq55r2NTEK5PePD
	 1wPe5f/FSeWrtCWDTssGrlUO5BxmbBMc0LfiyY+PyIUuwIh/4GxV2hTb75caPhN5ugA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=nUe3qafv;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0FB606CD9D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF0FB606CD9D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=nUe3qafv
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91ea2e29d90so38114936d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640249; x=1795245049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SG9odMntLujN1bfv7U8SkJUk66Dld0t8e7Q+mOyqXTQ=;
        b=nUe3qafv9syivid2So3rSgvuH7DZPXQ+C2hNnSKPxSgCSgNstQOq5ZauJDPuC8EzGe
         EPc3rvJ8i7VX8Vx4z3rdkuz4b5/v9ZapBbQpvdki/go/ijbQrxbYSU1NDWob3cDW97LD
         LnMvjnQ9of22Wo+EjgkaA7b+zyM2DJPnxYp2a89EeFLotBMzHlXVjFeFCTHrKTeY5NcQ
         91ghXJtB51aOfQmHtaFyRmryRQlu5a3ABAK7+f8sC33jgP5MHGfXKYht3G8gkN0Q90UI
         KipjlM6Ftuf2DaQAouZwIsVVWwkNGIDa3kAx+zcyykQArICxW/XrYq3vejy92XQ0eKEp
         S3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640249; x=1795245049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SG9odMntLujN1bfv7U8SkJUk66Dld0t8e7Q+mOyqXTQ=;
        b=vlOIocJm140NqcJCHtvTT6n2i58y9rHXyDuQCdrE3vKZx7ItX7V2m1hJe7xBsdtwwl
         ktwcI39gUsgCjQQiMcriybOZvYYAmrQ8ClyDkv7/gd2uEKMvFncxUANeMBlIRs4PjQHL
         j7Oh+xITXFPnYL2NgfGSYUc1k3kN151ml789i3qVArf2V3b781nuq5/THF5LGTRzBBbI
         rjghaK82dDVvsX6VgoAV+4d87pzeTA2EV+rJJs0PGCo2uafwVfSh/EQHXZxX3/unhc9A
         hUKW/vA7PAlzINz16FSkhI+ylq4FQLmJ27Ivk/UScDuTHUwnAbsPK4BKTQMQmb/5PJTB
         7pSw==
X-Gm-Message-State: APuU4Z/s3DGXzX6ALWL02vpg0T2r7I82fyyTz6XiDFjDoUViKKNDCpjh
	kCr92ChR1yv1i3xW7TooARlz573lDd0X+bAJ0iniszPWbcAemZDY9FhbDWGOZwGC03U=
X-Gm-Gg: AYBFou0He52W24kwb0Rae7MVbSnzUyMEk+UCoEUDbg2fXghLBB+57RiDYrnJ7WDci2h
	QlIzQ+XG34SACDmUewSl7oZd/R3Kd4/jKp5Ky22lxuoI+3fMXKQ1Rh88uLY3+7/NTFAYrbymhu0
	3I7/eYXQa4Y4zzQI98FdXJvyg9kgWbIKuj+tP8PC9irpWAzTU0ik+IJwYhwiWTiFnq5JSIhRn7y
	G2a4JPS2ep/VVezdRK+hXMT52HlIIdM0dvAPFjD1xSJUy47dXvcweQYFOKXwrxhj8lV8FLYKlJi
	JQHt4nk6nvO02by9VnvhvowkgZdtOwSMhdgaiR5fBYf7WhiI7ujg5IPx3At2xh0RLAan5ePuCSC
	vw4SdTCZ915Qpt0FBxENdnKlubGSDRMFg+tWYxGZwGRgifE7mROC4RcH+HvGTkWAaNmQ98wZ+7u
	4BlpxH1BdJP7RLgoevBaS37SXJmm21xkeusrt5ps9N10tfrEhf/UMhB+zezQpuqi4m/9wMdExdc
	U6ZqB3kzep7flZ11i20cT34653IQhRZ46jlElQ/ysKGtmlWqFw0biwTUMA6CSYWekGdqgpxxw8j
	VOot33uoNMWcj9eh+PjL9v8eET+v8abGSWiL331DsGt0YFRcTq2vWQZVojVZrrkfwLLQKmN4v5m
	LhfzYewNyUAx7R6Dw
X-Received: by 2002:ad4:574d:0:b0:91c:913:462c with SMTP id 6a1803df08f44-91f23f211e7mr73834306d6.0.1794640248788;
        Fri, 13 Nov 2026 23:10:48 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:48 -0800 (PST)
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
Subject: [PATCH 21/22] mm/khugepaged: base the recommended min_free_kbytes on common memory
Date: Sat, 14 Nov 2026 02:09:58 -0500
Message-ID: <20261114070959.3490008-22-gourry@gourry.net>
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

set_recommended_min_free_kbytes() reserves two pageblocks per populated
zone to help THP allocations avoid fragmentation. The reserve serves
ordinary allocations, which use only common memory, so count only the
zones on N_MEMORY_COMMON nodes.

Every node with memory is common, so the recommendation is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/khugepaged.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index b4bd29f25c145..fac314b89a234 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -3149,7 +3149,7 @@ void set_recommended_min_free_kbytes(void)
 		goto update_wmarks;
 	}
 
-	for_each_populated_zone(zone) {
+	for_each_populated_zone_state(zone, N_MEMORY_COMMON) {
 		/*
 		 * We don't need to worry about fragmentation of
 		 * ZONE_MOVABLE since it only has movable pages.
-- 
2.53.1-Meta

