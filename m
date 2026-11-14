Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640246;
	b=za0lJEVMMm4U2swfhBTE46BlbHUpVbYmes9z6jrHX2JzaoiqXyGaZ/UnNWJqJXj38a1p
	 ptF8ArTrHFt2WaRflKci+m/xey6SN4Rm1eckrPNdZyGUzLjc4vIdR3Cg9nd/2PajHJBSG
	 LDMOeIGHiGzlYRCYDdjI0JulSawW7N/x8YmFykl+bZHNPmnPQssS16KwHGKoCBgAmQxHz
	 orHhjuX6jiZJbTGdPHJtzFTKEF8n7+wJ/ChBVo5hvOQnNU2r2+Od0EEOJB018OAM8Hvib
	 sD9sh6wYjSZ/GXgJyYk+SauVnavfPDXyP0hMEVZDiYvS05ElBiTSTNJ56A+3IBTrwrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YEak+iwgBd7H+tAUDcNraVIKxkIkqE3kGPmkcYQNtnc=;
	b=w8HbeyXgLAfu1QRZLDdPoGDnDThHgCcqL72m9AaiZEbM/24ek3P4KYntJy045D14lPqP
	 kc0RbnFHY/Uh1KIvW45LGZ98rsHNog5rmIIl/2b3yV9xA+6LY7pcrggGxqfI6yWOSx6FN
	 i3z5Mp4JS3NR6Nkk1mIRVR61yXlZ+u9T1XwQD9Fgljfm7Hy2Fpuk2FrME+iaIQM2TKQP9
	 7FgPxsFXChGmu8s4pVx8seRITDTKxfwqlxk16ObsC8PT3toPfQqc1idN7PQwxWIu5cCj4
	 i/1rTuRf4zkKGyswP18FniD74WdyNa+momgBuTbWhG5jrKac0xVC+DTJ+9UC1EAILeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=vA6Z457O;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B239C606C0F9
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B239C606C0F9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=vA6Z457O
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91ea2e29d90so38114576d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640245; x=1795245045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YEak+iwgBd7H+tAUDcNraVIKxkIkqE3kGPmkcYQNtnc=;
        b=vA6Z457OaKIInkkgqCLFmLHWy8VkPxMPUJrmpqeT4EKmn4j55dJGJtm+KTlKszz4wA
         UVrXxbHJUqTl2q4EWTfsddFD0AVrEgctyu7/vealCMDaACIsjVaRi6fltMovNlc/ghTa
         MZxX0LaX68Na8PnWlYi+EO7zzd8dcS8Jgcy5MuKBon/qrGxyjrHOWRez095sA3iW/r3i
         BnupImPHFtuPKI6KKpj+dxkyO29yAsiGaFeOIXhXHt/49b+fLZ6RmF7WRM1rxS8LQxHZ
         Z3iuplIcBrJiSL7Vvv0lbDuimSfZhQq6LtlRDtpKViJ9Yo9UH/x4VBFOcBISh0iqvNYA
         6IsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640245; x=1795245045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YEak+iwgBd7H+tAUDcNraVIKxkIkqE3kGPmkcYQNtnc=;
        b=W+WHGSMKC2Zvpd3BbOkWYtxkU0W6dbT6n9Q1WP86pnxAgEM036AnAtA2dEz5gpkzK0
         mUJqGBYY5NT5HgNBV+Vox0quIUR/esPzaTmpPSAqjfSkFg10bWsO/SOQdCW7tF9g85Zq
         5D/xT5ih0HH6oDT6nooDf1zb5o6qKEMpjY+FmkntQg0w/whbHYXcFss0lQEFLNm2mQBn
         FyMrBnLOzDYItQhL/qH843j24paQzJ+HGgSsHntN4FOCCBrmw92GacOgkRszxUf65CEt
         lrV418qNYHqbrAVViXQdKWgdDvmA5ykSluh1D3po/P8AtF/krvxi+db1tGlYGUGQEbxf
         wBYg==
X-Gm-Message-State: APuU4Z9GHXTSKhP0lwZOOjVVtmjpS567XTA5EY/dEKQLf38me7O73r85
	LH5+C3R1NozIqgEZvfflg5GJbbB1hW/2oNlPxGxFyzxNIUfA3ZOd2tgXcbtR42Zcm80=
X-Gm-Gg: AYBFou2L3Gj4HvjtA72S4SuTUxo0k3Rqv2BCBpuvOV9FSvGA8w1rTxUByIXivk75C8X
	hKC3U+6zjgo8aTOR5Di91MK2GtI+TUzxv376CtuYgR592Zv9AVmYSuydlUivf6w/wWBNWZ6/QpE
	cEL7LwCf3KYgq8cEPhhaKXNPT8X/tbSozkR3HTJHIXoRXhZB37rETdhBfUVkOLSNZzI6bOXN9Uz
	rViXUOItT2x1fkSXX63YYtxYLcx2W6j0xbU3cYgEen9ktTfxnQeZq5iSWWiAlVI/F1/ONu/COhJ
	Akn3I/+t7vErNAWyRVzv/QMyKlEuHBLXNOe7AXyRNAJ/tYOMcFrlgKsewCFImIblK6A/4pK3NIP
	MGngTahxhjl7IrWu0zYg6ZyvNG+saj74FnQWuu+ORloxyPdEM/hANx1crz3M4XaMfHtGr1jXOTJ
	9bGl8bAd68jsfZFhTruyyNlwYiJGeC90jTZoTMBM42MbZgFGErOPuuAexlSyD5EyvjT4Zv7TKTe
	8F6GPhBBpUuWLkwjNZZIOWlzINjpgMHG2cjntXqesbYiJq84VP6c+uGlbiJzJ/V8oRc1uY94NB7
	sR4AmYmoF+fClSwGfvDqPJ9yegtKqm4wCIS4VwOMUwkOhZvV7DAcbzd9U9ht59OqtAbHLKJ8w8d
	9+qxWu0DywiJODdE=
X-Received: by 2002:a05:6214:2f93:b0:91e:b7fd:8ce7 with SMTP id 6a1803df08f44-91f2425d524mr70448086d6.28.1794640244861;
        Fri, 13 Nov 2026 23:10:44 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:44 -0800 (PST)
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
Subject: [PATCH 19/22] mm/migrate: restrict move_pages() destinations to common memory
Date: Sat, 14 Nov 2026 02:09:56 -0500
Message-ID: <20261114070959.3490008-20-gourry@gourry.net>
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

move_pages(2) places user memory on a node the caller picks. As with
memory policies, the destination should be general purpose memory.

Reject a destination outside N_MEMORY_COMMON with -ENODEV, exactly
the same as a node without memory is rejected today.

All memory is common at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 28a8d7734735b..fed910c9ba9ee 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2400,7 +2400,7 @@ static int do_pages_move(struct mm_struct *mm, nodemask_t task_nodes,
 		err = -ENODEV;
 		if (node < 0 || node >= MAX_NUMNODES)
 			goto out_flush;
-		if (!node_state(node, N_MEMORY))
+		if (!node_state(node, N_MEMORY_COMMON))
 			goto out_flush;
 
 		err = -EACCES;
-- 
2.53.1-Meta

