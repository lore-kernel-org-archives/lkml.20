Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218333;
	b=PDQemWah4/7qJCzoiDvTZ17NZxNUstcI3/E1yIJVW7vZMqqlUntzwvr9ciK4n/YvRm+b
	 ByB0XpkWIsLbWlogr3sxkP5JK3Qvirk7JqIYtVihS1f5+TsAlg7SzdoIQkpsUNm+i5njK
	 B3VmE3Uuf+mKTvvgNn3Y4kOlXZbjRDXeZMCoOuV5CNwhs8fP6G5QpTfRlBFXSEllr6loO
	 L79pWbWufYwPxy7yTE9QNA94p5pL4tSqbGyWO0wwDqtN/svxL3nFLjwE/hHerucUcuZi9
	 nXZEGA9viY5NHgW2aGMZPYpbABPwPUAJd2MK6jzi737Jexi4gUEO5v5s1pXM0UFC7LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y4ad9iSYAjg8cfVMtDYUd7UWF/8ViTzGKSWLP7GmA/I=;
	b=XjtpRre2PxhSkx52VxHXm2oKFEIfUPx2/u+N80o2HeIK3Ow0OW6IunF+94ruvTeQ0Qcn
	 MWrDvcPZFHoA/kD3f6SY8P5FD/stj4Sq04i5W21mXU2vwytxqasstuhN0zBiyw1v7jBKF
	 prvkxT4ky/Q7uixa7uVg8G1EJ0qBMexvCzEuzeJILH3tlc8otHmJZ80DeSCdqfgWupSoX
	 OxkZAfzX4pzJe6Vz2Ehe13376EkKuu0K7E/62jYQKwRv4oCQRFevjA/ABZ65YFcqplPKZ
	 dJkd1+lmDNoLrRup+/gsKfVMh1EqJwHLoHPuuRW7eK6WU+kRcNHBgAjF95hqWt5i/+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=XMcRWYwi;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3106082BD6
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F3106082BD6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=XMcRWYwi
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3ada81853so391441c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794218332; x=1794823132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4ad9iSYAjg8cfVMtDYUd7UWF/8ViTzGKSWLP7GmA/I=;
        b=XMcRWYwiTtNQ96tNTzHytJnlW6lUycxE+og/Cpy99xIkTbpYbMHobt9p8JcOJLqM2R
         hfYwogzjSerb3bvxVxpU2OwiClCIjmOCZ4mdIlo5B/G6N3yAuWQyag5fjil04zwS2Uxt
         exLdGg6Ou2kd2k6SnXXOn+EvzIBPU20E1OAZC37cPuqBgDL0LxX3D3Hpzl8Eqb+2I3rh
         BWLxDcxnPMTMcbZfpwKZ4NCyS/cC2zQd51cZh/iLuQfEYsVUiHbggdSwJfQUmzgAk+x/
         7/rrV+vE0Uq3zdb/tGU21GC+H9aUYlx/0E4yCgIAFnBjo2Og5p+/MKXUNPs6VTvlxOQl
         MDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218332; x=1794823132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4ad9iSYAjg8cfVMtDYUd7UWF/8ViTzGKSWLP7GmA/I=;
        b=2pprXlkMV1ZHoa7GNFUff4kBfXFKXppxU+ZSfFi0rHUZ7hMxAHsO4n8pFDvdQdKHT0
         v5VvOmsELLh1FRbHfr8s44+lr9agROMkHjSWezEe76MCRokzygWuJTCDZLhivLqn1h5j
         UGt9XaKa8zrl+ixhgBgSjFRXa69LHOSYXgYlnUQmC7jp+gjDRsn8BOAxKJERvTnDGSoz
         4ELemXUf7ctya1NZyexNyKoz4smPaTwsTeSMEUUn1gZQwJovF5CmzALV6qVAl7t8ygjF
         FFSUTl7mTraYgSpi9dfUUNbNe7A82mE13VaB1YIAJDUSY1itZa2/BIbBqmv/hhiwjfEr
         +cnQ==
X-Forwarded-Encrypted: i=1; AL+hErFA23dWp1wkkBbyJ+2hkmMhcZpUaGh4d7AkZWE7By+bTWUeitOenPh8mYye5dMeltyc6/3lmxMRJD63FlQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e6JN7A913fvkYCQkQ1zn4oaLlOmqNXYbvQSnmtTTN3TBPshTM
	F4gtNCY1BwZyAnetyk12Q7+azjIJbA9gFQNsrWF3Y6KwdXS9MoYb/94iGu+7jnJmu+0=
X-Gm-Gg: AYBFou2tpTuij8RoryeTJCvLRbHvhdCj5kCCEvmz1Br/1oDQztAgnwwtsBW6Yk/SnUz
	lt2pWXaMKsBe8mP0jLRF+1ExXN6D5VScujXKuPC+pdMjBabZlwO2D5x8B+31NSAXgsjiTljy5nx
	1ix/mfoq1A+VsJSdcAtyUzo1TH4aIy+xA9BP8Ux4F4chDFXxn0h5kxF2zX+J/fKuA/DwP6CI4VD
	n/9SWE2gsZiceHcwXDXk306UrOtzaOKEHlFTfUABlrIy806TWvzG1dq1+qdEmy9nknJGPa3uDGI
	JVoORIzmE3u4CmWhPMaHC/W/km1Fy3fLQXIvczQlj5xm0BCnQbtfE/vn6sZuugATJohOYPpJ/F5
	ml2fswxyDKhSt3nsMFBtwxhnWKyW8BgHJDxMDIoC7JKm40Q0r4nveZ/OhG7AcQAUPZPbl6fdiAe
	oBvC+o6G7Hdk3Ag1zvlS5LrHJEyUkhFi/UhpB+akoNCniTO30yiMtohyD8kK14jGpq9VreFeSKQ
	CMvfLm+edW2LXFwM3CqFaZ/5hOW/T2vdcSPK0dojVyvzhe6fxluiOUbqQhJgy8lmktNNuqAxMgo
	C1nnY+9/w1SsVmLCVkDTdeMuDVr1DeWWNsz2L6moX35CMcDwgQcwF816XS04qg==
X-Received: by 2002:a05:701b:4294:10b0:1b2:6c97:fecd with SMTP id a92af1059eb24-1b39fecea0amr5786944c88.42.1794218332192;
        Mon, 09 Nov 2026 01:58:52 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm12841684c88.5.2026.11.09.01.58.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 01:58:51 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 08/11] mm/mm_init: make __init_single_page() static
Date: Mon,  9 Nov 2026 17:58:03 +0800
Message-ID: <20261109095807.41547-9-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109095807.41547-1-songmuchun@bytedance.com>
References: <20261109095807.41547-1-songmuchun@bytedance.com>
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

__init_single_page() is only used within mm/mm_init.c, so make it
static.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/mm_init.c | 2 +-
 mm/mm_init.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 458496271a44..b719e6f82d66 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -618,7 +618,7 @@ void __meminit memmap_init_page_common(struct page *page,
 #endif
 }
 
-void __meminit __init_single_page(struct page *page, unsigned long pfn,
+static void __meminit __init_single_page(struct page *page, unsigned long pfn,
 		unsigned long zone, int nid)
 {
 	memmap_init_page_common(page, zone, nid);
diff --git a/mm/mm_init.h b/mm/mm_init.h
index 1560ac9e9286..1a1cde5126c3 100644
--- a/mm/mm_init.h
+++ b/mm/mm_init.h
@@ -111,8 +111,6 @@ void memblock_free_all(void);
 
 void __meminit memmap_init_page_common(struct page *page, enum zone_type zone,
 		int nid);
-void __meminit __init_single_page(struct page *page, unsigned long pfn,
-				unsigned long zone, int nid);
 void __meminit memmap_init_compound_page_frozen(struct page *head, unsigned long pfn,
 		const struct zone *zone, unsigned int order);
 
-- 
2.54.0

