Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316886;
	b=Lx5+wzhzSTw5pKZMixXgbr6PSq4N1N+tkR4JPU7xlKi6DyobOVtcsbZJxXaRhCgM5rRC
	 8qeSyC/fCTgFYjn219j3osSsVEXIjavqHNnsQuDVQz2tfYCUfwjEt1k/3OE6w+p+s4x+l
	 oSEzyI2m0TXaLQr0SBfV9HtlOQyV+mbte9k2DLz5QZ1dApvHnHBnoQl5XChT9OaggNl5n
	 s54lB0BKCSIDI0JtUQppCSvnJFaQNbOKXlngiU0s2cX+yScxGWd4Q5tdlfbjrinU47y/v
	 2NFDQ0iCFybmo2MHd3FiEgFusODCsSD2zJYLzaWB+idclp3bsBKFxlt3eD37p4hNC5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NxwBGzcXaXgnefRAG/4qRjMQWaL6ukmbK7qp5Voj4t0=;
	b=pz4U3tpZjrlFPz6KIm2L50OpoDM01XMIleZD1KXEdS7ciXp8GLBCvc4P9Y01IRETrl5m
	 Tg29VKH22B1oLgyir0F82NSd4aqAw6RqchaibPv7nhl17FnREIO1Tss+uoYNXQfx/giQY
	 deJFovTl2PNRjOIPbBiX6MJA9c//NTL4/t6ASrmkQf/8Lq2tUOquQw+u9KVP6OyH5RgvO
	 6zlcVCh5rUNDPeEB/Tm+o2KfyOEwFZ4z6KWN7ZPX437KtMg9Na8Guqb1cZOXTfQUYyk2D
	 OToMho0KoZxt+9maUyHs55nlzJCmVin2+PHPg1rSqAawgNJ7/AAlCkbNou421MNm0bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jeYpwYYL;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97B6606A7EC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B97B6606A7EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jeYpwYYL
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e946155442so16100595ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316885; x=1794921685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NxwBGzcXaXgnefRAG/4qRjMQWaL6ukmbK7qp5Voj4t0=;
        b=jeYpwYYLbvK1HPyHxcBX8OWsMd3edbuKi2dytd5QqO8RXPzhdcQzHD7rAWpzjhEX5+
         Ln+3X6ErsiEU3mf9Wp3yZqU0RcrKUK3sn4WBiFMU9wj5G6JEp2QYhj48hbNuYkc9Pfz2
         CjqGTc5bH0Yh653wfKWHyc0WVCZc0JyyOaBfV4Bppix8xKztgWb36o7MmKjyFfnapZZ0
         /aTKswkzFZkYbf4FR6FtcVboSuZW9F+R0N4+2vk+IJEhx7QEq02GJVdv2olA58qecNsT
         b3D8T5/k2gQDHMhV7iR/EL/+h/yclbRkhL1RQ/Rb/xMtdSm2AlC+sOXrTRwvbZINnhbb
         CmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316885; x=1794921685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NxwBGzcXaXgnefRAG/4qRjMQWaL6ukmbK7qp5Voj4t0=;
        b=OydglMX3tKI3vF59X9UWjFYwYp3Vb18qGv6Aar4KCSKTTmC5RbcPyEpJ2ptcY4PvXd
         aZ5ckPMYhuYLTW037xDXfXFNJCDkWyOSV6YSxSsVIMcJVEixToJoCXgA5u+R5KUXFlNr
         e9csnkmYxUk8rgdpt9EkoOMOxT6CVRF4pToiFh5AV951e2XkffEJaprADAqDSp/PFUI9
         U0Z1c69iUv9bBgE2lLWCd5jbDrAKTGAJLR3LZRqVGPrlLoaqFySbWlCdIoOt2Vo0adEt
         ci4zu5/eRET2xSRoEc+/IUj/hP8O6MCPoNBHeWy8a1b8Wk2S3vEJ1PFA12r3BtyxM3K0
         oDdQ==
X-Forwarded-Encrypted: i=1; AL+hErFahTN7O61FxpXaemZWel0pyGK06TNAK99YTtQ344ijAedbEw/PNOVLkqNkNShjQ3WzIQ6iyXRWsBCJe/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k6MhUXBFIkqzySGtJQEIJIEfPcY33jUPix4r7B0OYDXkpsT1j
	m2jhl9ZdrRRGGJ6GQOCvIbKYqwE7xdLp5jWZ/K278GQ60FahDOw2+J7X
X-Gm-Gg: AYBFou2VDWXd3NmYK+T6xKrn71peZqnCaFiqhqj3WfeOcaUMZ+7C59ONY99co/spBrh
	VzppGuSjcQkbOODETtBkuEpGqly2ePYDAsZkdyNcbjmZkge6GTh0G0RDYs7Vedi0WEEfxHzIqmI
	GBp7BnE9OGj2zdXWAKhKTU1ticgE+EZ4/cACynzdz9gDjilyS6FQWtbHfsBejUhfJl7CShPuMJt
	h9xR0kjCsns9yVOI1+rkS557L/MDtjSOvclUxO2RsTE5Hg6KXOoIP2QUlBLAmC7n2skTzH/IURQ
	fR2BEOq1v2wBzNuVMYA4JQN5KFG7/ivPbjZYhyll8fKfDY1eK6wW3qnyaM84QOk/ZYc93NYwZ0H
	Ei62dXxxm3D9L3uy52mfjhqu4kPQ9oyl0H5d5Qiz+inS9o3EyGXt33GjaQ+VMK7BVvJxD+OXKKn
	D5yH7qOSvk16rj1rrmQBbudkRtGY0E6t8pByA/R+rGFf117LcpGy9Xq4LcICHhMA7D884p3MOLv
	IoialydFUdKjOtPQ6oZY6PATj0Lk3jLHoBQ3L06K6JgepVCiGyQCQB4Spx4UBytU7W1g70q/s+3
	Spo8gjkjaebkJ9xAdzLlb8lOEYXKRj1MUubGmOIu/hJi6f2mwYCJJoyBKzicEIc=
X-Received: by 2002:a17:903:943:b0:2e2:cc25:b232 with SMTP id d9443c01a7336-2edb92cf2b5mr25368335ad.42.1794316884965;
        Tue, 10 Nov 2026 05:21:24 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:21:24 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [PATCH v5 1/7] fs/resctrl: Report a temporary RMID shortage per CLOSID
Date: Tue, 10 Nov 2026 21:20:48 +0800
Message-ID: <20261110132054.3702-2-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110132054.3702-1-ruanjinjie01@gmail.com>
References: <20261110132054.3702-1-ruanjinjie01@gmail.com>
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

From: Jinjie Ruan <ruanjinjie@huawei.com>

An RMID that is freed is held in limbo until its cache occupancy drops
below the threshold, after which it returns to the free list. A request
that fails because of limbo is thus temporary and worth retrying, which
resctrl reports to userspace as -EBUSY. A request that fails because
every RMID is in use is permanent and reported as -ENOSPC.

Where an RMID is only meaningful together with a CLOSID, a request can
only be satisfied by an RMID belonging to the requested CLOSID, so the
distinction has to be drawn per CLOSID. Instead it is drawn system wide.
-ENOSPC is reported when the free list holds no RMID for the requested
CLOSID, even when that CLOSID has RMIDs in limbo. -EBUSY is reported
when the free list is empty and another CLOSID has an RMID in limbo,
even when the requested CLOSID has none. Userspace is thus told to give
up on a shortage that may clear on its own, and to retry one that cannot
clear until it removes a group itself.

Architectures where the RMID is independent of the CLOSID always match
the first entry on the free list, so neither case arises there and only
MPAM systems are affected.

Draw the distinction from the number of RMIDs the requested CLOSID has
in limbo where the RMID depends on the CLOSID, and from the system wide
count otherwise. Drop the separate test for an empty free list, which
the search handles on its own.

Fixes: c4c0376eefe1 ("x86/resctrl: Allow RMID allocation to be scoped by CLOSID")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Babu Moger <babu.moger@amd.com>
Cc: <stable@vger.kernel.org> # 7.1.x
---
 fs/resctrl/monitor.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 04e4ea612b7c..b8f4e1ff4083 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -207,9 +207,6 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
 	struct rmid_entry *itr;
 	u32 itr_idx, cmp_idx;
 
-	if (list_empty(&rmid_free_lru))
-		return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);
-
 	list_for_each_entry(itr, &rmid_free_lru, list) {
 		/*
 		 * Get the index of this free RMID, and the index it would need
@@ -225,7 +222,17 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
 			return itr;
 	}
 
-	return ERR_PTR(-ENOSPC);
+	/*
+	 * No free RMID matched. If this CLOSID has RMIDs in limbo, return
+	 * -EBUSY so userspace can retry. Otherwise, the CLOSID is genuinely
+	 * out of RMIDs. When RMIDs are not per-CLOSID, any RMID in limbo
+	 * delays the allocation.
+	 */
+	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
+		return closid_num_dirty_rmid[closid] ? ERR_PTR(-EBUSY) :
+						       ERR_PTR(-ENOSPC);
+
+	return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);
 }
 
 /**
-- 
2.43.0

