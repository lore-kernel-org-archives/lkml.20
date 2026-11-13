Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596234;
	b=ZH1Vmm0sb9agrdNb/sgqphFf/V6crvm7mnkE/JOa6RjhyEM2V9x2DiviOdNDG2CuunKH
	 KewF6qJySUOLJP1CuQrP51499gCrUBPL9DrBSLlXrDWVDLk0Y7VFzx4WuFTmqtiybxB78
	 B9ONHq+pHpY3yTKpgU25CMIMdZauO5tPkONtNFSg0P3oAFvnxa+zwychWmIwydMQ+1km4
	 rvYJRadUFp+LuLJNhy15q36rUwNma0S7HqLFeMdNzClYncs4uwbUAuUw6alHYqAAS5CC7
	 iUtGURqWPfB61MZKmNrwCWs8De28lujGyLxdPsIGbN4MOHp94aMwcx7jFPlx0+LiQkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TvCJCDZ1w+NnQ3WWtAE5fKPBEjh4gdc9x1Sa5mH/xTw=;
	b=DuwFCj5gDs+LNnEs6EdSo+ogqT6V98cCVSjLDYagceQa7u6Q796TRbshVnsKBZxLZuOk
	 ZN9m+4B9LBZAhSl3hYOsJBdaYYqnKfDpUzD7xGENYmcCLs03whl8CmOPTRhbZN3kwJbCx
	 b7qNQxnxpcFWptuevLW8iUIn4uDwRJ+0UuGAbGSz5hk/9J53C3TtY3acKBvJrkBfDXHzR
	 ExVKnfFGQji7pnyFpCDQuLKialvaBP+nG5+Bvx00tijzSegddbdm9ujqSzcxpu0DeN4TG
	 1jdbaGDxPlhgML2vfgvVbeFID9MSJnnq34zb3O19EVV1LIpqFQnB8dtar+UJyhjlA/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AYDY8SGL;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF7B606B63B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BF7B606B63B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AYDY8SGL
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so672286f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1794596232; x=1795201032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TvCJCDZ1w+NnQ3WWtAE5fKPBEjh4gdc9x1Sa5mH/xTw=;
        b=AYDY8SGL+CPIlLer8lbVk2sFfRWvCcg3DXVRfT5jdpRV3gaE2x3qYhDvF/0+rOa889
         rUxhPWWXq6jKggfhSSuKitGS/OqbPGcTdNA1MQIUwfXjjVyziTmVpsiO5Ki21Q+h8tSy
         rsUWZjp7vTOpmICVpbET11dvtI4A9NB7wWmSYXe6xSrcPoRrRDWCuvezdbqOlRDfLNoz
         moh4c3o0r2r7F96TITy5K+541KMTh2n5YttWk0wUUEzLkKQeiaO96GyJHCXRixslzUKZ
         4KaNNy9WwXm5fXFe94WCQ1G7qQz7jELE8dBnJeZBmum0CrGt84r2Vp/DrWoAoJgPJpVr
         m1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596232; x=1795201032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TvCJCDZ1w+NnQ3WWtAE5fKPBEjh4gdc9x1Sa5mH/xTw=;
        b=qjsIkzCwHkd7lOv0rjRAp9O9gGY8/vXLgF2IjwwlyBN8qvB+yVqf8IhOtURcveU2aT
         uVSblnYiKhJu4/Q/Jr19x+oTX4HAozX3cxGdyx70tCuNQ+jEG+HIn/8xTjBuBX3qE1Lj
         HsHr5HoIUdB1YYUuHIrnHhAfUFCLkdvosZjvrEmJcOGbhNfVHHfMkmW2LT1XZzsQqaLv
         76zZE+d6GK0Btc0/xp+KB+V6A9fIMhrwkPDSJCnQSIRVts5wXhhefv0vddmh3aARX/MY
         UUQTPsXOjjzCEkT++vMMlZpzkjHXAybF1gpw6cJmUcrjtjzL2IMN63hD2vZWVNSyIIEf
         M/lw==
X-Forwarded-Encrypted: i=1; AL+hErHqnCmnqN6ZxjgZ6WLFX04LUnsSgwgaL704jSwCd2XnAqyEjt8DinV3uLtVB9E3IMIfczRECjglgvszKTw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0M9GQObymuT8J8oo4ymIs0mi7v9vjtmNEx9IE/MSrDF2vi79c
	WtJFqXTPWsWO3NLQDhBuO8c2z4hKG/gwTsV4rec8iNdTI7vk6z7MCw44X60PQ6j924c=
X-Gm-Gg: AYBFou3gYaNGxbtfHctjvGIu5LijSoS5oBudvVobhJ3OI7OwzQYEELLHHqw3bGO11b6
	vALizxTFw4MFLpkQkSDby3r+ZiZCQ3PAGaZTP7cSRwLSPZLqKlLTic/5YKo58qkBzvEu/P3I0jf
	N2+7vr5voBlUCW0ULhsWbhSiEcFbUTRpocMmGtZ4xIGVT11OuZ76RjjYENxbvYss5aOv3nkGDzr
	M9xuGG/dBZWYD7EAK3x+XTW+weE18X8qLsCkK/pnVThToAmxqaW0V9+OTPAOnMAIOKI9t6dsH8A
	DRjno1rL2aRsE8vRk8c5P5MtscoPNYXYugTFYT2y1BmutZejiy2nagLNvAL8NgMgnRswMm57ecL
	NNveKRPYilsGIQViFl88gcnXBaxEqHVfM2UqHSK6ZpxaQic8ucBVfGgrf6L5Q/JCOwiaLJxq5AQ
	CEfiXMdfdWunZJXPu5hDHYu1nwCMCFtDPkcYpM4tmu+KI2vKDHQGTQpqjmEoh3/ZhSSi/c4WCRx
	bXt90u7alf/+faCcvKc6CPK1Gp67rQdIOJpML9yynnbogMZxHhl9BxniAka5z9J4X+6kU9a3cJh
	HNnFtqCBqiEhCcO45GXb3r3020enPA==
X-Received: by 2002:a05:6000:228a:b0:48e:3647:c35d with SMTP id ffacd0b85a97d-49c7381ade0mr8401708f8f.21.1794596232455;
        Fri, 13 Nov 2026 10:57:12 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:ec8::179:1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm6417589f8f.21.2026.11.13.10.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:57:11 -0800 (PST)
From: Matt Fleming <matt@readmodwrite.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@kernel.org>,
	Caleb Kan <ckan@cloudflare.com>,
	Caleb Kan <calebkan1106@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	kernel-team@cloudflare.com,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH v3 04/10] mm/slub: use stack_depot_fetch_into() for owner tracking
Date: Fri, 13 Nov 2026 18:56:56 +0000
Message-ID: <20261113185702.1332171-5-matt@readmodwrite.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113185702.1332171-1-matt@readmodwrite.com>
References: <20261113185702.1332171-1-matt@readmodwrite.com>
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

From: Caleb Kan <ckan@cloudflare.com>

SLUB owner tracking stores allocation and free stacks as persistent stack
depot handles. Compressed frames must be decompressed before use, so
__kmem_obj_info() and the alloc_traces and free_traces debugfs files
cannot use stack_depot_fetch().

Use stack_depot_fetch_into() with TRACK_ADDRS_COUNT-sized local arrays.
This matches the save-side limit. Keep the existing KS_ADDRS_COUNT copy
limit and debugfs formatting unchanged. Continue
to copy or print no frames when the fetch returns zero.

Signed-off-by: Caleb Kan <ckan@cloudflare.com>
[mfleming: reworded for compressed frames]
Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 mm/slub.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index cd671b934719..32e6597a5c03 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -8328,12 +8328,12 @@ void __kmem_obj_info(struct kmem_obj_info *kpp, void *object, struct slab *slab)
 #ifdef CONFIG_STACKDEPOT
 	{
 		depot_stack_handle_t handle;
-		unsigned long *entries;
+		unsigned long entries[TRACK_ADDRS_COUNT];
 		unsigned int nr_entries;
 
 		handle = READ_ONCE(trackp->handle);
 		if (handle) {
-			nr_entries = stack_depot_fetch(handle, &entries);
+			nr_entries = stack_depot_fetch_into(handle, entries, ARRAY_SIZE(entries));
 			for (i = 0; i < KS_ADDRS_COUNT && i < nr_entries; i++)
 				kpp->kp_stack[i] = (void *)entries[i];
 		}
@@ -8341,7 +8341,7 @@ void __kmem_obj_info(struct kmem_obj_info *kpp, void *object, struct slab *slab)
 		trackp = get_track(s, objp, TRACK_FREE);
 		handle = READ_ONCE(trackp->handle);
 		if (handle) {
-			nr_entries = stack_depot_fetch(handle, &entries);
+			nr_entries = stack_depot_fetch_into(handle, entries, ARRAY_SIZE(entries));
 			for (i = 0; i < KS_ADDRS_COUNT && i < nr_entries; i++)
 				kpp->kp_free_stack[i] = (void *)entries[i];
 		}
@@ -10031,12 +10031,14 @@ static int slab_debugfs_show(struct seq_file *seq, void *v)
 #ifdef CONFIG_STACKDEPOT
 		{
 			depot_stack_handle_t handle;
-			unsigned long *entries;
+			unsigned long entries[TRACK_ADDRS_COUNT];
 			unsigned int nr_entries, j;
 
 			handle = READ_ONCE(l->handle);
 			if (handle) {
-				nr_entries = stack_depot_fetch(handle, &entries);
+				nr_entries =
+					stack_depot_fetch_into(handle, entries,
+							       ARRAY_SIZE(entries));
 				seq_puts(seq, "\n");
 				for (j = 0; j < nr_entries; j++)
 					seq_printf(seq, "        %pS\n", (void *)entries[j]);
-- 
2.43.0

