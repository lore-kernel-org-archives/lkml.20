Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917238;
	b=IcuNlOAq67gyuaosk1b/pp7KDbpVQSRk3xEhZiPPKp5fo/K7aKgqu5ocRj9EGiS8BuVI
	 1CJgQMDxLQ8/jEz2HG2tQlWihmV/rxexDdX3LfCUkbJms83BvIyNM4iGtvuw3fdy9gH9l
	 P19zjZtMTCzb3sf3h9bohGkI35wAbRglAhXRQ0WkCCUmtteTrRhe6mWTiPGB/rWRFhLYJ
	 MpOCpIgDv3WcVV6ZjsBBjOeynEDxnuljQn+KEYRKbcMhtPfOO4sTXsPUmARcvmC8j9L2O
	 Pj7GlLi9kI4eb3AI9JoOH2qLNksJI4TsUj8KuNpRXOCaG7diTPuoLPoPJ4a2s1Gi0UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C2oAxC901LsFPrZY7XEv49QJustbmbWIIv6Ichi+IBM=;
	b=AqKUWrV1nQ6vmT3QbFOpHhH9GpExRTHcIgkRcQST4Li0r/TTmKC+9xxEWl8b6Pc1o09f
	 1NqUmZxDG8H2sb/7X799ybAjA487tYLTxBcOvw+3yhLZw0i11foWEM6Mfk70YdwIcU7An
	 F5wOu1ETor2mzodhzjihXOystz+WgukRutBM0tsXH+idsVgWWZO2IWAaMQPguy5TLvJ2D
	 83lckoVSsXhICyebTf9IdGoRx0DVWD59mEm5HlIbU5p/hxhOY0JkZ3HIesWtUk9CRcBG6
	 NhyZSa7Z5RiG6sYwtuCeBExWQLjC6QfqQQDyvDG0s5B/j/M9k7II8uDihxVwxrXkdVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=C99TFTwL;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6428606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6428606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=C99TFTwL
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so5384909c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794917237; x=1795522037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2oAxC901LsFPrZY7XEv49QJustbmbWIIv6Ichi+IBM=;
        b=C99TFTwLBJW1sd6zrlOB1YIkcU9S6RwNreCTRQ34WR1MEJjCfAMv87IGajeDDodEvq
         fwTcvFBXhWM+R9aDeq4lbG2SD/I6vDASe1V0OpkBdoHDnqNNNIXb4nfFFJfC9rtNt5Yo
         yoOmDvVsBw3p9fotG0CuxO15vcRUBLPf0djTXTVluXuMrUk5OYGYHggqqvK6a5PF728U
         baKbAQMjM8AEYXTbNQQksAR0ZIiOPW3ezawtXnTQd2KeT/43Qk1P5aQNwI44ylE6IZYO
         iMuROYjCAwCu2lphizlEcx8U4LogosDKQt8znAEcAf8evuDnygingk9szQ3o2MkLs/hb
         v8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917237; x=1795522037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C2oAxC901LsFPrZY7XEv49QJustbmbWIIv6Ichi+IBM=;
        b=mIYEOV8UxE7pGK4HBJ9+aGcHAjZnWWqs799upQ8rUJGdPRKKBIIp7pBpzbW9fx6Yy+
         V1AUOICPMyJRMBrqXgfnJ88tL4ipjRjs71jMUKjlH/VRSxTMvOLEKLFFEOhksA4Xi0tD
         8jjC3BoKmxJkKPcU6qP7sJWfZyK8dofG4SFE82K+K4cAVDrkeHvCmCwMJH4INyVsc7dq
         pTYt/ZdpZaL6n4kCQi3t4jIaDSpf6A1KmhN3hBVDct3QSGYzy1e2FS4ez2dHgXS27D/H
         NFKEPNotnyO5LVkWFEJggnMkXRkSyaK3JHUR8f8YL1cXLeGl7pKAUo6MPJzUEvYzbyHr
         vSGQ==
X-Forwarded-Encrypted: i=1; AL+hErGkY+kM2WABIbB68RVSBJm+AdnODm5HQ553CCUFNJOFjCaRjFO6+kHxg2OQWMAaNS2PQ8IKmU4q1P/ewXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hlPGap0a9bsSDFNUXtnXHZUVu8sIwvt2qXcds7i4touiQDjyA
	CC4KTEUO5t9foeTG11TgKAwk/Cywg6XRZF5d0NCvc9MfDnkh+RG0NL/0G4l0NKOrKPA=
X-Gm-Gg: AYBFou1NkEUOsTcwDriiMOntRvbrGx4WlkeIiuxU1obrwT8As42RBieiY5S6cLs7oA5
	Wa7Gx65A+OBwdSjwgHKgTDOtLgCTHkNNIKIYbXuAV5NzWinaFyTxeJgxlj9XNeREoFtRDGvejcU
	v7pFFpBYaEP3+1hLQtL5Xk7/TtMmf4usVFGodjy58cvxJVDl5Agxuy2oJ3Q+iORdWS1xUd1FNCd
	5KRKryWCtaa9xNDPydNlKbWoLyopj3NhalV6ZnqiWYAj4DxBNUkFy+aXcvYkoGBTO2zhc9gSAqi
	3uUTcje2wUFSeHx1NfK9S2yh2TPbYrmtyJGHjJ/f7LQAkaNt11QxG15GwC2nt+DchtUcK4cM2d6
	BF/7nKcd0dFc7fx7W7NIosNlpg2NLOP0OuO6HDrhVG64rwetcWZHLPKhPaQFtlnmq1p9AhHH+sC
	bGy+SK7F9LFaTZfAbpE+3KoIfsDQ8zR5mJu6AJLECZf6pmSD8ZTvFbzsLUGhy6831xeI/+qjdfV
	akqtuBIIbZUFq1TJy8WvLBADVFQTYIVQIibJcosFLby5oLJ3sIwknEiFb3O2M3Ht9H+6JFjritM
	QGf0b19Px074YECgmerCRJ3cKYmY8PurKTC6S6XZu6SYic8F1OezvSNnbGOy8Pzu9M7+UsVNMZM
	yG9hMQHWdQ+Y=
X-Received: by 2002:a05:7022:1583:b0:1ac:1343:fa54 with SMTP id a92af1059eb24-1b503112a8cmr14843601c88.14.1794917236797;
        Tue, 17 Nov 2026 04:07:16 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm47347116c88.5.2026.11.17.04.07.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 04:07:16 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Chris Down <chris@chrisdown.name>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>,
	kasan-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 2/7] mm/page_ext: fix client data alignment
Date: Tue, 17 Nov 2026 20:06:22 +0800
Message-ID: <20261117120627.50601-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117120627.50601-1-songmuchun@bytedance.com>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
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

page_ext lays out client payloads consecutively without aligning their
offsets or the final entry size. This happened to work while the active
payload sizes kept the stride naturally aligned, but IOMMU debug page
allocation added a four-byte payload after data requiring eight-byte
alignment.

When page owner and IOMMU debug page allocation are both enabled on
x86-64, struct page_ext, struct page_owner, and the IOMMU payload use
8, 64, and 4 bytes respectively. This produces a 76-byte entry stride,
leaving struct page_ext and page_owner data in every other entry only
four-byte aligned instead of eight-byte aligned.

Derive a suitable alignment for each payload from the lowest set bit of
its size, capped at unsigned long alignment. Align each client offset
and round the final entry size to the largest active alignment so every
entry preserves the alignment required by all active clients.

Fixes: 466ae6978a5b ("iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC")
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- New patch to fix the existing page_ext client alignment bug
---
 mm/page_ext.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/mm/page_ext.c b/mm/page_ext.c
index b679a8c1f7d7..dbc1bfa258f1 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -116,8 +116,22 @@ static int __init setup_early_page_ext(char *str)
 }
 early_param("early_page_ext", setup_early_page_ext);
 
+static inline size_t page_ext_data_alignment(size_t size)
+{
+	if (!size)
+		return 1;
+
+	/*
+	 * A type's size is a multiple of its natural alignment. The lowest
+	 * set bit of the size is therefore at least that alignment. Cap it
+	 * at unsigned long alignment to avoid excessive per-page padding.
+	 */
+	return min_t(size_t, 1UL << __ffs(size), __alignof__(unsigned long));
+}
+
 static bool __init invoke_need_callbacks(void)
 {
+	size_t max_align = 1;
 	int i;
 	int entries = ARRAY_SIZE(page_ext_ops);
 	bool need = false;
@@ -126,6 +140,7 @@ static bool __init invoke_need_callbacks(void)
 		if (page_ext_ops[i]->need()) {
 			if (page_ext_ops[i]->need_shared_flags) {
 				page_ext_size = sizeof(struct page_ext);
+				max_align = __alignof__(struct page_ext);
 				break;
 			}
 		}
@@ -133,11 +148,17 @@ static bool __init invoke_need_callbacks(void)
 
 	for (i = 0; i < entries; i++) {
 		if (page_ext_ops[i]->need()) {
+			size_t align;
+
+			align = page_ext_data_alignment(page_ext_ops[i]->size);
+			page_ext_size = ALIGN(page_ext_size, align);
 			page_ext_ops[i]->offset = page_ext_size;
 			page_ext_size += page_ext_ops[i]->size;
+			max_align = max(max_align, align);
 			need = true;
 		}
 	}
+	page_ext_size = ALIGN(page_ext_size, max_align);
 
 	return need;
 }
-- 
2.54.0

