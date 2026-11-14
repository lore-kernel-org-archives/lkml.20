Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640229;
	b=MH4RAQ15iPoD1sBim+lkPqm4RyImryTo/StolIemr1laX1+0ry6b94jWkqo+ObwMYMTN
	 pWETDMUYM3IhJahJNxY0089vvtIzmw4howf3Uz8Ga/vqypTP8IZ+XJbWi/sMIY+2fT+Gb
	 XyM7VfQ3CQMpUaddm2ugCe248xNhwmX3Wtar51qscrnrcuHj8uf65NGrZprKK6wAyDFvP
	 ZjXRMSDXA6QVcjZS8R905VzJn805K1R6s25BvlSfZ3dsfTY5BkmQEwZ8NowXycCMtebVt
	 aVAzpyYcEOjcUjCAf+FteyhIWfwADJ/c2Zgwk3UOs2M2c+E8URuKcSXMP7q/rIp6sog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ug/CLwAsG6XPyYIr9OCoTcVisBprjwnxP+sIccpst3I=;
	b=RDe45b3hoGQpONP23Xvvc0sO2/vSGngxAAIunoZNIQ4NdMR0Mgq9fjbeQ+dRflfzN6y0
	 VqGj6IH1EuoSEpW2MB/RxG+/nzQd4UJ/5kMFsMU245kEXO9J80vKfthxTwtISwf3opIrA
	 QJ6HmtOiu+sp3nET/u6Mjr+QNAbE5c2I0CJT+Ipa9bqkB4q4Q9TAcQZmsvZPfv3p3rF/6
	 oxeaKMxxXp3kzWb/1/YaRoKCV8sB6iFcxmeaE8fy96Wsm3qmLriofv3sQ3iMH9+m7DGts
	 HymUnSm4j+Xi9dErB59srfVivPAkd79yI7r+O46E7Z9jr8HwmbSARijrxsuyfQlAOOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=e0f1NE1E;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC1260A5BE3
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DC1260A5BE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=e0f1NE1E
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91e8938fd01so29667686d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640227; x=1795245027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ug/CLwAsG6XPyYIr9OCoTcVisBprjwnxP+sIccpst3I=;
        b=e0f1NE1Exmdl9VHCTyMwen0H8NFFA5ewM0qJqz9IIPFvpUDfghWuuQsLrxK1SzRsz7
         hUQ5k4c56+KPd+CCYf2/vIqRWl8gHz2BKZUrM5Ij4T2/PSEWok0NnE0FUoNCiSoWO8Mq
         GMGUsUR317UBvVBakiAaXs2gi4djBungqVsPEPVmsCYYKAXaOtbrEV2mN7H/GYUItFZG
         FKQhip0+198HqCVpa7oWo0gCnkVC8uPd0d1wG9uCGO/6pyKs254gzQjdaZ9eM/glICrr
         l+E2ixDmEv243sGYSgL1CoNQGZsrUgbQgXYKwaNyBH+knN+wWZHgnaTTI9p959iurBvU
         zUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640227; x=1795245027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ug/CLwAsG6XPyYIr9OCoTcVisBprjwnxP+sIccpst3I=;
        b=o1+1INRKzlmvOLoZn3lU9BiaV7q8Rj5dIpd1aE5vSKg0Z7M15wRaYMW9q28JBL/qGb
         dLHnL8/h6+Di3uS8kL+CfXtcMYNHvQOb+bQrPiKTrKdFshIlQ3REi/457gevDZ8xXAC9
         x2GxDi64ndjWpQvjB1PzkB63R9KNvbs5Z3XohB7ypHxqIRlADF1slC4JBIjEf94qeX79
         EmZn1/aCoI4g/j7g+K2RRXL5r8J1g7w3rgvknqu0Tc847mX/pNROBzGmmNC90xUkVoLD
         /U0OEnDUC9SuLcYAAPZiI1Tio3PWca8CiTmP3e9YCBoijEo+8rKuOr5NI3tiK3zDrwWN
         8PVg==
X-Gm-Message-State: APuU4Z89QTLh9qjroz9+jNEbekbUjPCDmlpCNbFPCu1+X2oFdGnIh1kP
	Ywfm7KknascuAQd4TqQftH3kZ31Ak9/8jagF8asITAdZmjea3bHPDowiadHsVr1TodM=
X-Gm-Gg: AYBFou3Iry5YN5YPyiT+KqSWLgAOZIx94du4k4gdUGKvvFsWXk/p51aV0YvEUeUqBrI
	POCieGJP7CBZJVne400k2JSD8VWbRjEezhc6eY7hNzSArdfqzxp1of8CTk+e6Gnfd7Ojv/jDs27
	frOhCwE7emtZCwxYItfsgnUtiTjVHlQ9+JGZMSlXHIeb7PtEV5OAH7OM17TZGWyTcl/bpJSl7G1
	jRE2SN52IND8ZBKL0CXvOhmblsO8C68Y+EDe5BZbpoPAusaJKJofHq0/J6LtVKWb0j4wVntxT/E
	cQ/UEkE01/J+6xpdzoFK7joBHUvvcwWb4cn+V45WOnBk5A+GZooOVsVNGcQLWIYB44Aq5MnJggY
	PCyVWfqf4Vy73dMqOIdQNwy61WAGn/rXxztDTw8+yC3QJETI8G92CV6NyuRk2YaXDgaB4cCaYCV
	8mVtTdHlHHA7gSZIUa++OtKuy22rTJOB9baEdPF9mg9WKDPbIpu5MqlsvuCekoFlPS+silIKwXg
	qyjomadGK6cerrGbcv5AWINnywn+vuP/JIvoo8a4ls2H9rbMb2bkQ7zC8Jn3WyY1xUYeyJouiWB
	n8aiugxBhl81ZVMZbStK/83AGmRyiQAFgxQTKrWCznW5x2gU6YiDWoTWQGWlr17rFCjfr5i8LkE
	IGXxJtjJchZDZP3g=
X-Received: by 2002:a05:6214:dc1:b0:91f:1bc7:b779 with SMTP id 6a1803df08f44-91f24251f4dmr78714166d6.56.1794640227399;
        Fri, 13 Nov 2026 23:10:27 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:27 -0800 (PST)
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
Subject: [PATCH 11/22] mm/mempolicy: don't NUMA-hint folios outside common memory
Date: Sat, 14 Nov 2026 02:09:48 -0500
Message-ID: <20261114070959.3490008-12-gourry@gourry.net>
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

The NUMA balancing scanner installs PROT_NONE only on folios that
balancing may migrate.

folio_can_map_prot_numa() already skips ZONE_DEVICE folios. Skip folios
outside the common memory pool (N_MEMORY_COMMON) as well. Do not inject
hint faults on those folios or migrate them.

Convert the zone_device check to a common memory check (which includes
the zone device check explicitly).

All memory is common at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/mempolicy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 662ab420fe03c..619970f0eb954 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -863,7 +863,7 @@ bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
 {
 	int nid;
 
-	if (!folio || folio_is_zone_device(folio) || folio_test_ksm(folio))
+	if (!folio || !folio_is_common_memory(folio) || folio_test_ksm(folio))
 		return false;
 
 	/* Also skip shared copy-on-write folios */
-- 
2.53.1-Meta

