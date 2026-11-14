Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686219;
	b=pbaKzvxoj/TOdi/VLvNpnDYmTg2/I7j40HqLtMtgX6+RcQ/MWW4K1ZdychzUuvtD1b6D
	 sXBU7+cAWuTbhlnFKTSX1YBw8e5Yi7+o8PO8wjP3QNQ8MEaITEh4u+msWqeYV1S0+zrTR
	 HGh6uwGVsjG6pZacAkdltdr0RhN4fIWVVL6B5zJ1Ce2baCHpnVy7MEw7c3IU+QMBgTTCr
	 6S+1b35kQQ8bnChplJh2WHZOzEdBNs4SuX7JyyQlr4uLvUUOLnfoZ+ncWCPrU0gBDNxPL
	 t3kFJjlS3VJX/ih0fPukDaqvbNMqA+nMjA0L2ed+2Dwxq9fh6hwciiM1iGzR8sEh0Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=YJV/kOno9dtsXAkcAOQfE/oQzfJxocwLJi3WPYE6qNI=;
	b=LjdKwQUOEqrZYtWqkm6uOwN4tNaMNYVrgC1a9nptax4vsHbMGzqHkH/flKGaL3nYNDF3
	 QIWZ6re7VYux5TD/D7A/uTF/rZuNLo36AGMnYQ2agqGuALhH0IglzWQm0qU+msb1URx1h
	 7Enx9XjbJZWrtM784LvS6slD/w34ibATX39ch6Jl3Y/drkfaD9CIV3JHkNhWBE13syCAO
	 iTNKBSN5xO8hO3IyucB8wZb6RJ9nJLtxRsN5Dv5Dfo+X0H6ovTHutSe2cD6/NUyZS1QYg
	 HcuLnRSLq8JM1AQWDFWi9JsQ0pQY1N7uvnKHb+TvzewQc5gyFgLGMYjyA1JfOd3kfkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=vCIej0PX;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95AE606A335
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B95AE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=vCIej0PX
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ed1e9ae5a8so7675255ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686218; x=1795291018; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YJV/kOno9dtsXAkcAOQfE/oQzfJxocwLJi3WPYE6qNI=;
        b=vCIej0PX9dOhvVI1XQrPg3zB8HDYKWUKJUfIIUezj8rzlKXOq0OMq3pe4wQ6XpdOmS
         NYBcf2KVLtwBMAKAy6dCSHE3G6Ij1MQMaxPUZxuqz0NduffBv7xLdt4vIZKfYghEMKCw
         nsMry00kZ+7KCUIo2gRoP8PU2opDqLwVR/xnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686218; x=1795291018;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJV/kOno9dtsXAkcAOQfE/oQzfJxocwLJi3WPYE6qNI=;
        b=VfjNeelVmqGVs9HttfvIJgZbWFo7qK6IiZbQLVQMeNSKkk5L76TTsU52DrtJZ7n/We
         KIXSkSEjaK/PVlXSBbiRFtv+mUgxVJ2GdOp/zOx6pVb94nFzrj8UL1iYUB7FA4SlDITZ
         8QAGEg6SrZoA/W31Yu5sXL7nkyA7f8Qu+SzpBd2SidDHjJZdRCECM6e6Rfq3e05tpkXh
         5+++Ja5uQRipp5ymGgk0mLk8mExGEMW2o/a3f0ouOu/qklOAtMm3XxvTBJ877sL7nCzS
         R7c3X3UNzyIFVkZFFK9s0wUn25rIfT+vrh5NzpM02wbA6zhYDM8VBwvEzjEfhSW1RXFS
         5zSg==
X-Forwarded-Encrypted: i=1; AL+hErEU0d2NUn8rxT/gZNIaa08VzzhYoeZWiMJIjx429mJ+S0N9MlffbhIrJorQNQebQiR+6gymFOa/h/74buI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jIm8Y5yv5rxUwaTUWU2RD54c4l5n5Gu/rb7OaDNEfXBO/kQry
	ebYd33H7oVwjGAH8cALaHpPPsXmhcv34/yA3ypBxb3XKMy8ew8kprSpkHysq7hPpzhw=
X-Gm-Gg: AYBFou3F+0Lb4STDdN/TO7aBrrIA8Bw4V9T7RBN7ECXrE6A7P3g6icMM40sngDFeblX
	Yxj2/P5EocOi9kuh4UgvClc5w3h8ygIO1e/hQOh+ODgDdzYTtxHDwxjmxWsCvOfPX2vhcFzQs/T
	YJE8WPUFu8pI49+0Ys7Bw3DI/muFytx7JWeXVFf/xGSI//ZyyYNrFkb7M7J8s6nJIYbY/GctPX2
	ulyeC5cLgHUzJk2THRypmG9vYZhd8F6g0hrJvzspKx0H8Ffmj5YkdS1yvVe2/a7m1lgTy3Ub9y2
	IOC475Zu7HEgw/AozxGIE+8pb5cLlSUZEdhKUUuHTm/x0z8TbbRpmns0jZ/WlGTLuvWEzUIHYHB
	QfAKc3OU+KBCNuDmgOGSGZSth3TY6GpgOvEZEVi7qNZwyhSj1wl3dMN5lCuFiD/i0kxHIaLI/oS
	QxORiFOL7Zw6/vKuzKDrL9TNzsS260RAyWMReHFzX5t0dhgy88AMaGVONb8mC7WrXHhGclrmxzi
	fUm6oBvptYzsgGpB18X1HNaSpVaklES81lUycAXxQAWud54jP0Nh7y8v883EqRkKCoVLVGS6nlp
	yLolnhYWQGMc41DqjdV7QNZAwjeg+GG1LbncKhZDvOvFCpM/0VlIySi5c+dTiUB0dbCYMNzDdST
	kttSMcP0mJahXq8BuEe/DIbkwDfDgY50UdF6BEc95tdSxM1CAS8nf7WSd0HUzqm1gpBx9i9EsXF
	20Y/sBXV/SWuLj6dVwJmDOcY9DGbEt+OgkvBUR89DbfKJFiZXLsZDeGQ==
X-Received: by 2002:a17:903:2b04:b0:2e9:4d43:d58a with SMTP id d9443c01a7336-2ee0d65fb59mr62764435ad.1.1794686218088;
        Sat, 14 Nov 2026 11:56:58 -0800 (PST)
Received: from [172.22.0.2] ([4.16.0.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8dc955sm22202275ad.62.2026.11.14.11.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:56:57 -0800 (PST)
Date: Sat, 14 Nov 2026 11:56:51 -0800
From: Chris Down <chris@chrisdown.name>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>, Usama Arif <usama.arif@linux.dev>,
	Kairui Song <kasong@tencent.com>, Balbir Singh <balbirs@nvidia.com>,
	=?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
	Kiryl Shutsemau <kas@kernel.org>, Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Peng Fan <peng.fan@nxp.com>, Josef Bacik <jbacik@fb.com>,
	Chris Mason <mason@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	"Borislav Petkov (AMD)" <bp@alien8.de>, Mark Brown <broonie@kernel.org>,
	"Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Josef Bacik <josef@toxicpanda.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 07/13] mm/migrate_device: look up fault folio after a
	split
In-Reply-To: <20261113-mason-migrate-et-al-fixes-v2-7-50a2ed382b61@kernel.org>
References: <20261113-mason-migrate-et-al-fixes-v2-0-50a2ed382b61@kernel.org>
	<20261113-mason-migrate-et-al-fixes-v2-7-50a2ed382b61@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114115651.2b3100f5d9444151@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Lorenzo,

Thanks! I've tested this along with 06/13 with the HMM selftests that
split the fault folio, and it works well.

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Chris
