Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640252;
	b=UwetFxps1mxScgoid8NmrwAt1LOMZIOVGG4VdL8L0pVPK/cuZT7ROyg4orOR5rhQRvCK
	 817e1Do+Lwr79+0zZWVJXvOi+2Bzb/101gj7bf2eS2wkTd7Q8Dbmy9bOY1cBOuh1dC97X
	 8h25thV+ob7lhGTQQ2n3fSgS+PpIJorVfWooq48caXE3RSrnibibgyXQxBVqSde6695x8
	 feXtovCe/hgDC+FxFYPrFr8pbqD/0OArbJr/Tqhhf32k6TL9HTLRSi9hRubp+6SfqIy61
	 etEn64ISTqVRBQc/6lV/g7+SxMoUBa5zbXgirawPbLoo1s4FygVaAsvAXy0miw5MpTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+HAKXNFyWuVVus4jyGRYSZgEnC6sp/o+JpWnVYJ3k8U=;
	b=hjq+kyp5ggwsR4aZXcTX+oFTXks8IJfD/cm25havrgX0TZ46Ch/EWei1knRPwDoLwjs4
	 cq4SH8H7H1kwmlk179i/tAeqoHIG9X+D7dacXjvT+24gBIn/D77r8ZQjgrzD/6IKrVu/X
	 tP5ejIquQjdsOBWvP0TNWus+LABwBo2uVGnbQrZEkm3BUKBswCzUM6vHtwSzGYvkibcBR
	 WDwh93q7y2o0rlsAV8yCQlmgw20iDlcLArzWzcO3/oXFo9Mb0D8qXiYl6/b2cI+HCUhC3
	 xCddSWYFyE5bY3r29m7qPsrr+deVmmBLON1e84f6Q75p8lATVcDoNOQtX4CwdmUNh2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Ok0h8iL2;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24C9606CDB1
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B24C9606CDB1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Ok0h8iL2
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-55b8cd4e2abso17327881cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640251; x=1795245051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HAKXNFyWuVVus4jyGRYSZgEnC6sp/o+JpWnVYJ3k8U=;
        b=Ok0h8iL2T10cI+PFEuVIRGMDCQ8NRP8Fvz/7tqv55sIqhrJCRGSWcCpReX+dtqSuP2
         ju0VM52/CASXF7CQSnL43mof+7dO6XSHI47KpeBuNSnTQDrqrEnd3GcKgPAUVOYGauxT
         de4vnDF+SMAr6UXzmWg3c28ZY4rCoWGd8RqnhDnP6NM0npTcE8VtLbuilixq0g2CEYxs
         +svzoJS5VfpJRygWBIcrxBCy0d2NU/KdVMysL9vxlhdsh6BofY6ssX6fsKSm1C5oxNGX
         mwozWZkGrlxN/J/oH5CRgxpsxUUGABpZxa67EC7pTOlS0qAduZMHCi3ioVdjNWNK0FG5
         e9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640251; x=1795245051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+HAKXNFyWuVVus4jyGRYSZgEnC6sp/o+JpWnVYJ3k8U=;
        b=HgYVjxEQpylFwAte9lrbJX13wGVt1JDqFzytRRInZWD5RHlo/tOQEPFzpMf3+g4gx3
         xeG97OaeAw0ivNn/YOZHImDZw6XFARnZ+Azj5kE+L8USqqu8ETkC5XY9S24OKjrt6blC
         jb2uQGN1kcVlPcTK7MM/qIx1rtzPYpU90xQ8uGVyMEO6t3bu+8FiutiyHhZj3arKAXkr
         U6EciPoNmD4V9YYqC845nJEgqCDUGSSPk48Xt/6/T4HwXY1yyp1VpxqLGzTKrKQfNc6j
         0KYRPzYGKsoTnXV+eAQc5R+I0piL1fYCbONfeCX4835UzVfRdraDoHgYOqiemMxStzw5
         DeqA==
X-Gm-Message-State: APuU4Z+NtdBCtI1drgevgM0MvT4GbD1VioZfpIS72+lV2LLxngWvUX3h
	tnS7MnoppT4g458NdYs/+Dk0qeOk26NgXj41RteolhfYgqjENz044Tn+eJMsi2ByLEY=
X-Gm-Gg: AYBFou2Yip5cjMYF3XQm9HwxsLwS66ecSj7x8zq+xN98WBV7jOkiKVpvjbU7q9E4npQ
	DbEZy4MdbA6atFsXCEaEJRaWz+CfRp4ZRI7t5JO+XvbtzkzAv5wGkle/HzYpwgVbZfW30azIKr7
	QxP3VbQWxtncatuA0WaOZm5CKx1DrRcY/sMgAWBnYUg8pY00ocbuFCBeRthCPIqGjzU7LyygZav
	OjisIeYOwLpT40pvLx0EIl5Agn8fOS2tFW97MYmakukMiPOX89/dbvRFE3K7thMegCjbf6t8hN4
	yOZKHH81OuUWTODx4ydNqszFfRxUnkGsXE6bbbEQeRdSi4CJwga6CsJtpUtEnkavabqfjb3eWlk
	xzefURmAqjlbgLlf3EtzcG+kOi15WlzCqRxqpdc8XiskcqP4fsiBs0EF2FNr6jaCiT4HVn22wxN
	CHGLSizLZCG0/T8F4DfgANis8tl7ie/w0MBAbe/bdNYb8HFfbtOV2k3saZGdHbziv0a/wiQWCEj
	Su/zfuo7JV0Au3mIwL4JvXaJx0bQ97rRT0ChMIZ2FmcslOVFXuuP4TS6yXkfR1fT88EDqZp+wo7
	Uzai+up3RIUxxpYaJGeLfl/JUgnPi7Fy/vJqmQN6DCs4BE/I8mssOfN1GygArkVMKxF/7jg1zOv
	uykj6Zn3zYvPTXDc=
X-Received: by 2002:a05:622a:191b:b0:535:a5fc:3b58 with SMTP id d75a77b69052e-55ac8b9ba4dmr73074831cf.68.1794640250752;
        Fri, 13 Nov 2026 23:10:50 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:50 -0800 (PST)
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
Subject: [PATCH 22/22] nodemask: remove the now-unused first_memory_node/next_memory_node
Date: Sat, 14 Nov 2026 02:09:59 -0500
Message-ID: <20261114070959.3490008-23-gourry@gourry.net>
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

Both helpers hard-code N_MEMORY, which says only that memory exists.

Every caller now names the state it means, leaving no users of either
helper. Remove them so new code has to pick a node state explicitly
rather than silently getting N_MEMORY.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 include/linux/nodemask.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index 7ace610bdd654..eea0ff7601303 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -457,15 +457,10 @@ static __always_inline unsigned int next_node_state(int nid, enum node_states st
 }
 
 #define first_online_node	first_node_state(N_ONLINE)
-#define first_memory_node	first_node_state(N_MEMORY)
 static __always_inline unsigned int next_online_node(int nid)
 {
 	return next_node_state(nid, N_ONLINE);
 }
-static __always_inline unsigned int next_memory_node(int nid)
-{
-	return next_node_state(nid, N_MEMORY);
-}
 
 static __always_inline void node_set_online(int nid)
 {
@@ -509,9 +504,7 @@ static __always_inline unsigned int next_node_state(int nid, enum node_states st
 }
 
 #define first_online_node	0
-#define first_memory_node	0
 #define next_online_node(nid)	(MAX_NUMNODES)
-#define next_memory_node(nid)	(MAX_NUMNODES)
 
 #define node_set_online(node)	   node_set_state((node), N_ONLINE)
 #define node_set_offline(node)	   node_clear_state((node), N_ONLINE)
-- 
2.53.1-Meta

