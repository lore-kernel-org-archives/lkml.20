Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019528;
	b=J7P0/FHcNqH0CR+/vJ2DevNWYo3tltQ0wdi44Mnn2slXaXYQ+pIVoK4Tw/+NaFg/5PCR
	 x9QwNspl78W7W2qMZbbZ3JL3gjaO1nHjWYuhEvDGckGtzUrLWG0DVE55NDcz1d5G4EUoN
	 lmm7R9wXZ4krJ+l18tTJrLqc43Yi+wkxaBir3TCjesKSbFpWvwdG9FGILSYArICocApXs
	 vBqWvtk9qTdSWSSKybOWmuWtiyyJ45mYA9HPrWTvQmsQ3cURzoz2ku0M6Lyh8ZK1UEWoW
	 DMTA/MYP1HDw+/OlGDpHn67FrSfkJbjFN43X7f7e65ehGNc+fdGNkEIPJlYgiC3xseg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hJ/SYKhAn1a9lgb0/Tt8+Whtj6gtrvQsNMbp1FojAP0=;
	b=FDXXZsZYf/lq0ooXTeP8ZYrMusdGK7d/Y8+edBJeUZP7WTFJwLFS0daWS7kEUwaBxHcx
	 e27gwhmHHfMOzHqxGLbF0Dkg5/808OZ9r/2DbBXUns4bzemDtVKIlclCgJ6MnQ5PuVJ46
	 hp9hifyKcYQwNq3P4pNq9r9cku6mvOcsnpu0ARxrfPCVSEpErp17/eYN/mEnquuHbTw9A
	 ih+npdMJ9l8ygaCnLns7udeywjl2vmdvwf4tXXBAqIE1N2O0sAGS2HWmN3YBZHOHgtuLA
	 zKQP573W9iUl9M4B1iPP2anWZMcLRllNJcunNe9TbqvUZ6fSxpsP/0tzyYAtzSPqMQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eOB4hGd7;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E99606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9E99606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eOB4hGd7
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so2073245a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793019527; x=1793624327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hJ/SYKhAn1a9lgb0/Tt8+Whtj6gtrvQsNMbp1FojAP0=;
        b=eOB4hGd7a+7p/NtfB9f9beDKn3/rdOL/CiPqC+Afv6fIoiwvfkLTRNd8az+73pyHzl
         Twj8nv/RiSq6kgpeb3u7BjOcHFAKEddpnY/jliAadSGJ5Ib+wf2YkWNMxbU5stTBA0Fc
         zqeaEFJBm5Pdtu2tkA5eBYKJUaAVxqv1h6/3YOgQPNb4B2a1B1FhUwzidU/+kWR63Gt3
         cPlzDj8Z3j+og4OxZw9e8AyYddiNd471fN7FBjwgpYeRVGL2LR23zeOieXIhxSE0YV31
         yw9CiBJMzTbM9Y1L3Mg00LcPs/p9Hv7JXA1hEqiY6u4mo/OWN7pM7WLjHDvY+jJnJvLZ
         R32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019527; x=1793624327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJ/SYKhAn1a9lgb0/Tt8+Whtj6gtrvQsNMbp1FojAP0=;
        b=fxTtjEu09hp40vRFYbJ8G6TNbcTaY3V+JJ5u12yXbGBnsHfqmNgjxe5n2RNB1x1d0E
         slzsLFDAA8Zqj6zpx9D1aSillWrCu3gebzj8FSxw12yj4PbvZydQV+x7zBXljMOvQlQW
         L2MRuP9DPq1MztSDcT/9fr1V9mLRb1ZbS/W/bePegj4qdgdZTIWssuBEneP0BLwlnzs4
         QbmiuU2J84Dn30askDsycIkQr5t3McoKHI75WpgncBBoXk/M9UgXTAxpSJ2XgKt6nq5j
         h7+cmH1OY/J/rghUbivniHY1cpAiwyuW8EogKtaOTJd7oDRYoIsoNNnujBJ5zAqJlBOf
         oI6A==
X-Forwarded-Encrypted: i=1; AKwUvBzurEA7lxeSJrHYrthhJyqCfXAegIt7sOqS1dr32HUu1887rJbzJCHtKuUVCINPc7NYU+YrvZtGF5ZY7eM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEHjDzzjWKHj0r/sZbzzOlNhMOHTAlXVWmHMDhM1nyypUrtRPg
	uW6GwFdwljESnpmrENyMqKC2gmKAOFwj97P+nSIF66wOkwIYE4CcfbZF
X-Gm-Gg: AYBFou35NeftVHQaIVLfrteYjoeQ4W/K+hrGJvCOISWFNOR9xhsY23oeDMieWBpBcpJ
	NIIplNu8kK9ozTYkDkfvYDggKX9qULxsq9zLcvtMfjHA0t1vl/6JcUa76Q2itrd7q1T3iI9g1+B
	rbXeNht+yuRGC4YO4fibaTg8Zu1eybBUHoednk3pnigztfFDA1FUmRurZVQJOI0baXS6vaWEFxg
	0v0lpocT4T8XfC+jAPpRMzB8o3Pm7C+BNE5DOehLl8mxh4G4iz9ND3wJSQ5kwR+3cpsb47oSw0X
	9NK6xWR3hFjubI7wZJqt7I1e25TyeXMZVFVyDv6tKZPBaZ0ttZ1dlOpEg1RwFerWkQ3Zfij5gDT
	U02pjTzlkcx6yhArhK0tG8JKWusHKjag2S3bKwV4hDWvihZqBNsbpJHCCFGI5tewz+4htpp7j5/
	3f9pu6Ao/k3AmXi1G0ol01to5P3VdUWobM15wy9mYS1bbhHqh3blJOJvsF6XREAXSfV1M1zeYDW
	HbMR936Ni3c+Yp//qKPqqxjrJI3yE8gTfGM78/VQdIwTncVS7xz6XE+lWFZn5c6gQynS4mTb+iR
	p2u+vZgN1AjClk/my930XGJjbRJ+hZ0BL2nVmbOmFV7uzNsl8cdrPreat+hbYNUENekcqTAWX9+
	80y5kmcmsyC9v/ZKNcCMc7rNRucxp
X-Received: by 2002:a17:90a:dfcc:b0:3ac:d79f:8229 with SMTP id 98e67ed59e1d1-3adeafc6fe1mr5863465a91.61.1793019526660;
        Mon, 26 Oct 2026 05:58:46 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b2209basm15764415ad.73.2026.10.26.05.58.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 05:58:46 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [PATCH] nvmem: core: balance the layout module ref in nvmem_cell_get_from_lookup()
Date: Mon, 26 Oct 2026 22:57:09 +1000
Message-ID: <20261026125709.73500-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
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

nvmem_cell_put() unconditionally calls nvmem_layout_module_put(), which
does module_put() on the layout driver module when nvmem->layout is set.
of_nvmem_cell_get() balances that with nvmem_layout_module_get_optional(),
but nvmem_cell_get_from_lookup() - the non-DT lookup-table path - does
not take the reference.

A consumer that resolves a cell of a layout-backed nvmem device through a
cell lookup table therefore drops a layout-module reference it never
took. That underflows the layout driver's module refcount and can let the
module be unloaded while still referenced.

Take the layout module reference on the lookup path as well, releasing it
on the error paths, mirroring of_nvmem_cell_get().

Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/nvmem/core.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d4cce8..34ec7d6 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1324,6 +1324,9 @@ static struct nvmem_cell *nvmem_create_cell(struct nvmem_cell_entry *entry,
 	return cell;
 }
 
+static int nvmem_layout_module_get_optional(struct nvmem_device *nvmem);
+static void nvmem_layout_module_put(struct nvmem_device *nvmem);
+
 static struct nvmem_cell *
 nvmem_cell_get_from_lookup(struct device *dev, const char *con_id)
 {
@@ -1350,15 +1353,24 @@ nvmem_cell_get_from_lookup(struct device *dev, const char *con_id)
 				/* Provider may not be registered yet. */
 				return ERR_CAST(nvmem);
 
+			if (nvmem_layout_module_get_optional(nvmem)) {
+				nvmem_device_put(nvmem);
+				cell = ERR_PTR(-EPROBE_DEFER);
+				break;
+			}
+
 			cell_entry = nvmem_find_cell_entry_by_name(nvmem,
 								   lookup->cell_name);
 			if (!cell_entry) {
+				nvmem_layout_module_put(nvmem);
 				nvmem_device_put(nvmem);
 				cell = ERR_PTR(-ENOENT);
 			} else {
 				cell = nvmem_create_cell(cell_entry, con_id, 0);
-				if (IS_ERR(cell))
+				if (IS_ERR(cell)) {
+					nvmem_layout_module_put(nvmem);
 					nvmem_device_put(nvmem);
+				}
 			}
 			break;
 		}
-- 
2.43.0

