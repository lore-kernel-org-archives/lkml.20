Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870416;
	b=tqxNUBFrSyPMICJd+4wN0Rsyl8T6DiHLD2rGMwB+1RuoY3tNb+2eh8cJ62mZ0kfH43jt
	 nBIuiCJA1xCLbSVKzMfevFbNDllZsjCatURmv7410PV2YIm6+UbjzkroZLhYE/CU8tCpK
	 gp9fqBjF2L34PBmx846Kbkw9nNYBqBWjfbRQfZAN2FVWOhNXzAUuN2eo3PQTzcAfs+ZOg
	 AMBe48MF/IFO56Mff4nnpI0DSBWTIzmnQbH5ASe55UWT2W7S76Vj+sx0WuyHGBgunY1ui
	 v3UdRg7tLJGiXyJMZAg2hm9IYq8gWxsPHM8HjCB25/N+oA1Nadhi6kovZ9J7lcqNZ5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zVQdcEYHvCyjprjE26wtkXBdOfSzxTsxBRAupk9G74A=;
	b=RmX2JQTxkMiagwA03BplJmMl2+3eKewTIgVv37koKlYEHQyVCUutamfgmDrZLT7UtFUe
	 N0baPlHc9yxB+gyjhNqSoWR9qaVxU00M16WU1CGxpao8+STBPOigkumIPr+iW/NtDRAVG
	 ggd8C49v7JRZ+IV5fqoRpNtE80C+w37ffpeQGYts+RVRadBgE7iGxaMbKG1N2Bg1eVKvu
	 xEr145c/Ag5rODuQBEdsLNGfri6uhyuR/ugy2Uc62G1L6Eoti0P7yfPcBfldUiAMY+wZ+
	 ZQYTyLxVnFVTJSWPXvtApfjrfyexwcfVMZyLBc8a2MLuPnWuvjrq2IdGSP3unztYb8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="kBxS/UZT";
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E0160A380A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73E0160A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kBxS/UZT
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8bddb1172a4so452036b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794870415; x=1795475215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVQdcEYHvCyjprjE26wtkXBdOfSzxTsxBRAupk9G74A=;
        b=kBxS/UZTglZmGP9tKhITS6JKD8E8PGQDBl6jSDCVWWoYBxwYzsjGicqjnxQFifZ0tr
         kJR6FMqKqG1TshLoJTdhpL+quw3/mgoQKQ8q5SBBquA+mXrP9gJA6yn0sJr2qE85i2cZ
         cfwXg/GLROiqLF6lM4lj+f6UdqUy2/ledI/Ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870415; x=1795475215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zVQdcEYHvCyjprjE26wtkXBdOfSzxTsxBRAupk9G74A=;
        b=KaCJ7WZavLkhpkJR+fhmZbt+k/QT2PpKwnufmVQIYyLAY/0Z44f7/rI1UikC8HtRke
         U2I89xAKO/eIC1OCOuWmgf0VFoLXGRPvWnpgP6GpZpWRV4YnhTxjqdyMqrWN+rVOKe7y
         MGByeY/VLOq4tN79C7sZNxYi0GzvU8aXZra43cr6w0ySHtZNak60mrknUPD/5VRJceTg
         4JiuORA54rQj78hyTJRj9cZlf7CfgMcaLJC7NoIHk7qvG8m8UNhMCjC7CYOOs0uqq2g5
         KAsf9xRbCPYG7L/TiwvgVJwsxgJVn9/QYz3eCWtjHQ3JG9y4szsnl/2oH4l8pskjIDwC
         9hxw==
X-Forwarded-Encrypted: i=1; AL+hErGRPuZVP2grt2zCapOsbO2dA/2U8Cxf5rzy9YB9NoNKjWz7h5t2PMGnSwJuPUNiZbND7DUp02lSWbsR8BY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zyDL4tAKsjmlLgm9WfC1mwTqZVqAxz0JHjy6C2m/6wPSTv8e+
	IrO1jaNK/p8xWJBbDZxo8RvUo8/XY6m+zaIGgrMXgmLoANPbNtgaKQPE/Jmvw/MYXg==
X-Gm-Gg: AYBFou04O/+u/l5Mm6dvxw2KEzwa7bgzTKoO7uDJrPOcaFXPF6WlgGjLISE6oX2Z62f
	RgDmQzlrp5svxPcuMN0guCWz9AcbB0Bwkzw5tysB2yVx082tGHfNncs2EucW+VYm0I5xadu+MOS
	sdPMS3WD/eLSdMXjmi6PTHEhBlgWgS911FPRNZRx7h6caoRMELUZIl6+MpwCs4MVcQPCoCktdyl
	CJCl7LFEzcMGwawna2CU3oH3kJI7bHEPi9ZVZVlJOfEhDGOfwzr8kU+0sE1K3dOW0IoajlJZ9Wv
	2Z4jnSd3MyrdaAOCLz/QCso/2JRyzccId38fKZF/+CoTXOVUEQOApASRvN4vBenUIGMubs+maxN
	IpBYWTAivizod5nElxY4gp1ILMSUVZtWc1GO52P65VQ7Jj4epo1UVNVwMjuVAPXMxaRcoYKdvR+
	bIHmpUsaaxdVjcBQ3vdnjAJjwJyfW7yG0CtTLlNf1Ei8G04vFAbJ5OoKwhPDcrJvUVJcIjrz4Ol
	ZEt/k4dnrYiKuhtnszig3uXqzPz4mez4PnZvaqeeiYL97pAC8jjn5iLjCV6eOkUtgOwxMLjDKEZ
	Y//11T8hWAzL56hHXHCcwe5g/ziGwaE0/qfWK0aXeZWKtLo1g0nYTN2Tyz3AP9G2Itk+zNw=
X-Received: by 2002:a05:6a20:3247:b0:3ed:b9c5:df15 with SMTP id adf61e73a8af0-3f7a6aa5facmr12150421637.1.1794870415604;
        Mon, 16 Nov 2026 15:06:55 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8bed1a6dbbdsm4310921b3a.24.2026.11.16.15.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:06:55 -0800 (PST)
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
Subject: [PATCH v1 4/7] net/rds: use GFP_HIGHUSER_KASAN for message pages
Date: Mon, 16 Nov 2026 15:06:24 -0800
Message-ID: <20261116230627.3537051-5-jeffxu@chromium.org>
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

RDS allocates the pages that carry message payload with GFP_HIGHUSER:
the receive fragments in rds_ib_recv_refill_one() and the send payload
in rds_message_copy_from_user(). The kernel fills and drains them
through copy_page_from_iter(), copy_page_to_iter() and kmap_atomic(),
and they are not mapped into userspace.

Allocate them with GFP_HIGHUSER_KASAN, so that they keep their KASAN
tagging when GFP_HIGHUSER starts to skip it later in this series.

No functional change: GFP_HIGHUSER_KASAN has the same value as
GFP_HIGHUSER at this point. Build tested only.

Assisted-by: LLM
Cc: Allison Henderson <achender@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-rdma@vger.kernel.org
Cc: rds-devel@oss.oracle.com
Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 net/rds/ib_recv.c | 2 +-
 net/rds/message.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/rds/ib_recv.c b/net/rds/ib_recv.c
index aa50b85b0f99..907bf2977583 100644
--- a/net/rds/ib_recv.c
+++ b/net/rds/ib_recv.c
@@ -316,7 +316,7 @@ static int rds_ib_recv_refill_one(struct rds_connection *conn,
 
 	if (gfp & __GFP_DIRECT_RECLAIM) {
 		slab_mask = GFP_KERNEL;
-		page_mask = GFP_HIGHUSER;
+		page_mask = GFP_HIGHUSER_KASAN;
 	}
 
 	if (!ic->i_cache_incs.ready)
diff --git a/net/rds/message.c b/net/rds/message.c
index 47d5e9ab9b10..80171ae2f40e 100644
--- a/net/rds/message.c
+++ b/net/rds/message.c
@@ -515,7 +515,7 @@ int rds_message_copy_from_user(struct rds_message *rm, struct iov_iter *from,
 	while (iov_iter_count(from)) {
 		if (!sg_page(sg)) {
 			ret = rds_page_remainder_alloc(sg, iov_iter_count(from),
-						       GFP_HIGHUSER);
+						       GFP_HIGHUSER_KASAN);
 			if (ret)
 				return ret;
 			rm->data.op_nents++;
-- 
2.56.0.611.g1030f0b940-goog

