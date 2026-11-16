Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870409;
	b=N0Kf0Rllh14ueOSkDuvOiVZZi/Ffjh+wMvRKYCBtyIOxGm+N03JuhLuIRdj2n8r9nCmq
	 OWFVnHtuLgEsaFope6XUcdLcy2Fx2WYM7+1CyHc+/lmXw+BYG6ErHEhga4/fVNTdSt7Xl
	 YmDYtUxHDUBTWyCCUw7Rdfl15uqJh+M26mY1aPfu8lYRA5x/FgL01owmtsD0QJ/Owj7nB
	 iZIIgYXgAeOz8vhTlV1VwGkl3AOPLMUYaXgzRX8YXyaeFXxhlVXskBjR4lbgIkfmKRb1l
	 CfdqPyjt4iUnxiT32quXyebddnKdWzKXMCQPz9fT+/Dz4iqmRQaCA7JfbXpyKH+ScKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jGcgw87oL+/aayCG1LZRiyRs5ahRDiLzP62eRx4RAEM=;
	b=es8CfC2SebN/p6RP/eTsThcG9dkkjXhDGyWQzDHSvlKlRjufi8U3Hg6hJyPYuL4xEI9T
	 S3hYuumrlGPDiiF+GDqGTLLwLr/MpCbFqM9JRG94MZa8iawF2xlGWPlwoZkPF7QNF82ct
	 3kTST8LrduYlZwz7AWmr9ZDS/scw79i9jIBPD+cOXJrWEnowUOOlD/EwTSjHM26M7N91G
	 KDZUZq532XZQfI+vjuvSj5tavLco2o20ucTHYsF4GdgrYnr45zjSWZhGf+unMI3IbINcL
	 FPzUDoBhIZ2PQRkOdBT0UByuj8VgdokpaNLh30deD17gbZZjQY6hPfl9hbe4pwCGlMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kk6K2Mds;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5609606A8A4
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5609606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kk6K2Mds
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdda6625e2aso221891a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794870408; x=1795475208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGcgw87oL+/aayCG1LZRiyRs5ahRDiLzP62eRx4RAEM=;
        b=kk6K2MdsQgdCogkjrc1s8JbIoFQAiggPJV7wUYjqOZ6QuiZpbJJvKe9lzn7JrPs2BS
         XjdRRTRvTuEkLTTU0BybV3HCSYy8668HmwSRmTX/PQgwdZujyZiZT2sd7WxcQHk2u1Zp
         xhfLBrYKJ8E8wCfRTNb8MH5R9pBQK8BDFXS3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870408; x=1795475208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jGcgw87oL+/aayCG1LZRiyRs5ahRDiLzP62eRx4RAEM=;
        b=ggjMRLjqQMDM4OLbMT1b/Ws3KVwmx1zbv8jTODPChGA3XpTjl4nyH4ggg5DfCNi0JV
         6jKbPlixZVvaS6nz9PyuJCw9/x7x7ysclybB/Wb42PbYfUp2T+cvKCJ/4tgxUuOlrPit
         mYfe7UbqiISPoTGd8kyYEzql8yhGKBBfTvNntIpXTu5tMlAp7nSihHdvfiMzuaOtuAjR
         03Psgxaz0XgLk9NfsxrE/dscBNrY2GocGjyQv1AYETAbq5XbHnJN+PgpfgoxrSA3Sg2q
         ZsOKM9MgVDz33ZaROGFg9ax4H6vKY2l9L7N0ZVEJdViEYzyNxQaC2Yb8wHgNhXWNJ5nR
         pmzg==
X-Forwarded-Encrypted: i=1; AL+hErFE/Aimf//WuAyAEIrEqYYupFmC+F+MJoIiPiGG2IM+ixtlyemLereYcyA7UaNjIN7S4CPCW42WvlBSekk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GRoikdNo5OepfoihpLGOaZiKfS/C1E08PQXY4mwoq+GDnyDHd
	3lTwiAhzcqOZhaxiQZpfzaFt4/ZVzxE8Da3lXyDvSin1pyd5jgQNtUrP5n0KD4r4bg==
X-Gm-Gg: AZFdTZe4r8+TbCoEPHjKGrzSEMgKRqeld2EDsurOidbIfLvJE1Ms6+z8I2O7E91JKxj
	NYKwY+gkskIenFJfJsyhLApn6RR6Hz99QQpv5VGFa9x7LjxIiuW6H/SBffWgEOsMsrVJDTF9KSn
	3+tMQlQnEoOFDhtEH4iCMcYohXyk/Etl/l1nsKqr9QIeNY9aUvrAM13eI0uobPX4GHEvmM2ZiEP
	cCGQmtUeQi4Y5c2cNYXPRnfeSnJZ5F1Q1cUAE8/6L5VkpY6NuMJmRLlLwzvK7zcz2f6CDjqdGqH
	qkGoJptxt3XcmtmHBjrflKVBQ+SdMs3u8HOQQchX+nWSzlVRDBU7fWYwDqDid63xkW7LoEtJASF
	7j0V+m9lh/ctgShPBY33OgudjTMJPY7XNo50x2fmXB7H9Dukb+fun22e3Pp9Z7qew8fQFgNKm6a
	RrdkNYdSe4TMsxP8w8dbvM9BlRW/rzp42WrSZYuoNitZ2/2v70xfcMGCgI33uwVo1vLed7hJ8Qb
	QWteVhbZ8kvhIPClgJuE5xZJsR2n+V2aGKa2DrZGA6aat++wIcB6bxtUai+Yg7bieuW3eCwjVjo
	k33vkp2gvDZOqsZJcksekfc/qseRtsZxrIcFIESsFS4w99KQPTlOI6jRcPvWjegPK3xGoiw=
X-Received: by 2002:a17:90a:9f98:b0:3b3:b15f:eb89 with SMTP id 98e67ed59e1d1-3b3b15feeb1mr321766a91.1.1794870408006;
        Mon, 16 Nov 2026 15:06:48 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b3ab9f3c5dsm1108222a91.0.2026.11.16.15.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:06:47 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Jeff Xu <jeffxu@chromium.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chia-I Wu <olvaffe@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Evgenii Stepanov <eugenis@google.com>,
	Ian Rickards <ian.rickards@arm.com>,
	Jann Horn <jannh@google.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	Jeff Xu <jeffxu@google.com>,
	Kees Cook <kees@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Collingbourne <peter@pcc.me.uk>,
	=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Will Deacon <will@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Allison Henderson <achender@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	kexec@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/7] mm: add GFP_HIGHUSER_KASAN
Date: Mon, 16 Nov 2026 15:06:21 -0800
Message-ID: <20261116230627.3537051-2-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261116230627.3537051-1-jeffxu@chromium.org>
References: <20261116230627.3537051-1-jeffxu@chromium.org>
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

A later patch in this series adds __GFP_SKIP_KASAN to GFP_HIGHUSER, so
that with CONFIG_KASAN_HW_TAGS its pages are neither tagged on
allocation nor poisoned on free. That suits pages whose contents belong
to userspace and are mapped there.

Some GFP_HIGHUSER users allocate buffers that the kernel itself fills
and drains through kmap_local_page(), such as pipe buffers. While such
pages are tagged, KASAN can report a linear overflow out of the page
and an access to it while it is free.

Add GFP_HIGHUSER_KASAN for these users, so that they can be converted
before GFP_HIGHUSER changes. It has the value GFP_HIGHUSER has today
and will not gain __GFP_SKIP_KASAN. The two stay identical without
CONFIG_KASAN_HW_TAGS, where __GFP_SKIP_KASAN is 0.

GFP_HIGHUSER_KASAN must not be used for memory that userspace can map
with PROT_MTE (anonymous, shmem and hugetlb pages). Userspace sets the
memory tags of such a page, while the kernel keeps accessing it through
page_address() with the KASAN tag from page->flags. The two do not
match, and kernel accesses are reported as KASAN faults. arm64 does not
reset the tag in page->flags when the page is mapped; it relies on the
page having been allocated with __GFP_SKIP_KASAN. Nothing checks for
misuse at allocation or mapping time.

No functional change. The kernel-doc describes GFP_HIGHUSER as it will
be once it skips KASAN tagging.

Assisted-by: LLM
Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 include/linux/gfp_types.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
index c1331bf0b239..567c93fc1cfb 100644
--- a/include/linux/gfp_types.h
+++ b/include/linux/gfp_types.h
@@ -356,6 +356,16 @@ enum {
  * move once in use. An example may be a hardware allocation that maps
  * data directly into userspace but has no addressing limitations.
  *
+ * %GFP_HIGHUSER_KASAN is %GFP_HIGHUSER for pages that the kernel itself reads
+ * and writes, such as pipe buffers. Unlike %GFP_HIGHUSER it does not skip
+ * KASAN tagging: with CONFIG_KASAN_HW_TAGS the pages get a KASAN tag, which
+ * page_address() and kmap_local_page() return in the pointer. It must not be
+ * used for memory that userspace can map with PROT_MTE (anonymous, shmem and
+ * hugetlb pages). Userspace sets the memory tags of such a page, so the
+ * kernel's tagged pointer no longer matches them and kernel accesses to the
+ * page are reported as KASAN faults. Nothing checks for this at allocation
+ * or mapping time; those reports are the only sign of misuse.
+ *
  * %GFP_HIGHUSER_MOVABLE is for userspace allocations that the kernel does not
  * need direct access to but can use kmap() when access is required. They
  * are expected to be movable via page reclaim or page migration. Typically,
@@ -377,6 +387,7 @@ enum {
 #define GFP_DMA		__GFP_DMA
 #define GFP_DMA32	__GFP_DMA32
 #define GFP_HIGHUSER	(GFP_USER | __GFP_HIGHMEM)
+#define GFP_HIGHUSER_KASAN	(GFP_USER | __GFP_HIGHMEM)
 #define GFP_HIGHUSER_MOVABLE	(GFP_HIGHUSER | __GFP_MOVABLE | __GFP_SKIP_KASAN)
 #define GFP_TRANSHUGE_LIGHT	((GFP_HIGHUSER_MOVABLE | __GFP_COMP | \
 			 __GFP_NOMEMALLOC | __GFP_NOWARN) & ~__GFP_RECLAIM)

base-commit: 4b028d0cedf95f66b8c5294fde2d7d698bf830da
-- 
2.56.0.611.g1030f0b940-goog

