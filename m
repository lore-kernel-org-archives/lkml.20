Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218303;
	b=EKN0KyfJJBP36KRaS5hhCL3cwvB1EVpMbINeykVuI75wuZltO+TPCg5DPtsW24HCV9k/
	 O3fQ7FsiJ0erZgWPAZ2g/p/oUhSM+3KQDfF5fNRrW7mWo9rTKgRZ7Cu4C9V2OWQXUUgze
	 QAXlmCF9oIGe97ufgOKXpreMz31LfLswN4XcDATzk67uQNS54zVcczR/3GWLgaAV9GsrZ
	 10bEDbyXupfZphpS6V5LxP3XyY66/xWPRZS/O0+tP7R4Gm1bPZMQm+5TJ+FxpVNK8mgXH
	 2xx1idS++eRqle58iOW/d3FriclHdLBueFloXAQ6nY5kwMbkz/bHrLvZbMJMJPCZrJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1oy4Sqnm7F3cOGv06qj6Z3Ixjl/LADzL4b+dbql4rc0=;
	b=AfTnTcXkVpDxyvqrexBcHk/6HRLm9IHKZatQwyQLUlyn4eJ9EarhmHDLwmEGrAmUdkR3
	 WrKErZxIX9ugaxbtB+1L9HLNuRuEFxw7X1B7c1clsOj80Ris7mvDBnbJF227FAU/WKj/d
	 B2x5gwXbVZPpWFwJCq/0BR1iu6LVWkH+8z8rLP8Iulzls/CO0qi4B2AePwrrqHj4KVLJ/
	 nYupbLA1Sx0rlCJPeKCL7aoluey7ld8+1QR43TyI8xVklw11JAVscIauGfCOX9XOlZvuU
	 E/HvZTjdT/waNJ6JG4awaLpWn55GrefHty70tOrW/zj+akd0rIw0jIDuK95zocNxX7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ejvgiy5X;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B517606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B517606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ejvgiy5X
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b244fb7fffso752455c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794218301; x=1794823101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oy4Sqnm7F3cOGv06qj6Z3Ixjl/LADzL4b+dbql4rc0=;
        b=ejvgiy5X88l8ocx2wSI44EzVPzr0genF3maHiXufCK9nfb46o0Dw54ubu+UqXBLOjy
         Olp3+F+pyUZIEs9+COiX2oDi1BD3/KNL6MuqI2VE2j7iOZ2DYdQeWijDI8CJzY65Qlz1
         lM4rivu39+cDLZt30VlgI9oRYErqyckwFh15lCdWuHkIvmQjzen0kSba4hbco0ZlCoRE
         aYla0u7ItCEz1/F6kcIeE3CsaONKo8dxg6lYOOWjdxmgVSIbLrL03zPBhboeEEpqdzad
         pHP9IfvlGgfoG7oSPbl9V6WKIYMUrp9lklN7wTUTepFXy3yqXvNHsHEPYL0RkFbQEuOw
         gh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218301; x=1794823101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oy4Sqnm7F3cOGv06qj6Z3Ixjl/LADzL4b+dbql4rc0=;
        b=P5R8fG4Poye5M4WMQc0StplzarBa+0Qr0mBLOxOt1StIRrWlt/X4YNbwfbGjZ91mD7
         73R5kEbs+WxuSFtw2YcHpACCFTuEbWDATij9gDG5tF0/Rf5kuLehweTMybTyTiTJPc01
         dPqTrOUdjgWAKmzgLZmLvbloIfDOZ3GrCfI4Bu/4IFwa2PzEqY5gnNVMwB2ZiIqv8nvB
         1itMd6xVNPBRkbyqI9N3W3oTUyGBr0Nh9v8OLyjqu9qCUMZiuCW+LJNrWD4Xhrhivpsn
         yVL2HUAj2RaJr5KNxnwK8aTZ2Our2wQwgnT/BxuqtMkJaJFb5xokG64536Qya7zCXYI5
         LjWw==
X-Forwarded-Encrypted: i=1; AL+hErGDt4OyHERT3H05clJhLO9+ghrz+cQJ3eYEKOyZzyCaKw7C9d5Vps8DVuMVttoxXq/BlSZz9YcWk9d0nQs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qW9vuNFy3CRMBs3TNx+Q8YQLx8GjBXRKm+Fzh6Q8bbODlS6kJ
	lnaHn24kDbWQsPfc5UTyXxStDq2acQRNwOjIL8fbDOFf8UCwZMIQ9REtlIuCpYZvYLU=
X-Gm-Gg: AYBFou07GgpvR/qVG9LdhE14Yn+61pTIosujTg7lyyLwwc9FszOxS8NcGAEMS9vP9aw
	v40nUW65OmbzTRcnE+NVy+9h2sQ4LSRiWpvAFAn+m0jcjwqTjewTLZvPmGz+GZJzq37GlHM+WJi
	mVM+xuWkPBuZSzyoBYST0svQNi/y4chczVv8bkFeHSgYqQ19hk/Yd+OHK26DkVHwulD+ZtKPmEJ
	tO8WwvKJiNfGAlbfnt2Wtkl0wMOetHqudYvathjAXHz4srqrET1Dtl6AQ+20YP52xvMlWxZm2ec
	KqOXBxuTDSf5J2kNMQulcDR65sXbGtv3d/y2y6ymgXstF10rt37EZm9z5joPBau0V+gHnAsj5WK
	Dik9rNMBwuQNyBY2gdURfyUDcOIGq4JnaBk23jYuL2t6HDH8aKHCjuxoKMETTKo9FeBICgYCsn2
	MqPm7xecrN0KT0L0YbbEsreGV29ogKjHjtMou/ZWH55GUJpB4/zapNnEwrN11H3WIPECzv6KrgC
	9lH5R57gKHakk9zZrHAzHHipQcNPvgKi6+NLqExD+GOJg7f8i6NR+UUXZM734afm3lC7KEoJU4T
	es0lxIT+xgiTaPc2z032n+H54gGpo6JSWLzyivtHgXXmcgS/mTCjuDe90PNLNihqeNilq5PC+T6
	d3ajHpl8=
X-Received: by 2002:a05:701b:2054:b0:191:444:425 with SMTP id a92af1059eb24-1b39fe2dd86mr5786268c88.2.1794218301076;
        Mon, 09 Nov 2026 01:58:21 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm12841684c88.5.2026.11.09.01.58.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 01:58:20 -0800 (PST)
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
Subject: [PATCH 01/11] mm/mm_init: verify zones for template-initialized pages
Date: Mon,  9 Nov 2026 17:57:56 +0800
Message-ID: <20261109095807.41547-2-songmuchun@bytedance.com>
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

Template-based ZONE_DEVICE initialization bypasses
__init_single_page(), which means copied struct pages do not run the
vmemmap zone consistency check.

Verify each destination after copying the template so the fast path gets
the same validation as regular page initialization.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/mm_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index a9d848c92678..0129152b74d8 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1082,6 +1082,7 @@ static void zone_device_page_init_from_template(struct page *page,
 		set_page_address(template, __va(pfn << PAGE_SHIFT));
 #endif
 	memcpy_nontemporal(page, template, sizeof(*page));
+	vmemmap_optimization_verify_zone(page);
 }
 
 /*
-- 
2.54.0

