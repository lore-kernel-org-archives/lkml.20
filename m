Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396132;
	b=fcUDxITueMKETrG/3PTHkwX6f6Cu6sCxuCm9nmkUN+KAlb7jTEnf8hGOJkfj4liLS2ZZ
	 cbwQWC6YcW6ZbuGW6D6Et+6pqWlDg6j86sdwxwCoNR97EVmEDdTVDW78yucB/WDv7P/XR
	 4Mbc8NXFEah9Ee0yRjr+i9IgQ7tSRKqzT5/5PkMJxdm/knNYL14Vne50HpM0UfTKVAO7G
	 hc0tec28DZkB35nrL3LtvlcVtCx9/EMyVcfFUQ4wqEO3viha0x/hek2PFHQJXe4w/vjrU
	 HT5MSz7R1uVVNEx6CgzrFp5MlW5D3xg+T0asXpP+4rSHpx19EDPJxDXizg//8q9bT0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396132;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=NFGvX1O5XH40DuwZagPTb2HzVcVMR0CH+Fn3DV65/+Q=;
	b=v76yTzImm3c/yUXR/RoeHOzoYbC7SqnfLFsd8/49CRFszkJAY6yTHuKxS/6QPk//bgz6
	 zxfzdyC5ySJrHkW+h3n5zw8DdQ+lwIJdOmv2G/lFY2X0t9WYYcWI/RikqSUIqAvUJcLM9
	 uLax9cZZ6ZnCAsKIvDMOQXsq2Bd9vo08sMgKMCf7Gdci345JWK5kzrwjtFdzpfqn49/QM
	 /rtG9bIzJG7scvQlDF0K888k1tptRTsEwZthF5Nys3WqLCPzbrWTfh/APbf1xH4LQGoOg
	 CPgncb+qqvH1ZP9eWopNz75uwhtkrfhvfca3+rp0eM9s8LA97kYFOpp4vEvn9DGPydA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K+Uul3RP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539AF606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K+Uul3RP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4828E1F000C1;
	Fri, 30 Oct 2026 21:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793396131;
	bh=NFGvX1O5XH40DuwZagPTb2HzVcVMR0CH+Fn3DV65/+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=K+Uul3RPxqnQzKU/UJSlg8IcNV2km9MXmAb21nyK0G+TPZTX4wr+9B7Qkb1LQlRGN
	 8atZJJn2WqeKvHMRl1PtNJBQWwNZHJy1N/pb3nlqVRLrMw+7KL0hwY7c09/g8otQja
	 zJuLUktQ/hOEsgLp9nO9YHK7xofG/cDDn4FndojTwIqluTGCW2vyPHNZKtSQFqtybV
	 RnE0RQe1bPoRVRHh7Ow/VD2k1HR1rnvnHA9LPw+A2gmuLH0wY9PjNEt2OCFk7lLe6P
	 GRA2K2++J3LWjRAh+o5qvKzvzwPbhq8yxbqruTeSlChYj9Xzq0m+xLHxp0l6SA4WJZ
	 Cb+CTMluF3X/A==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 30 Oct 2026 22:34:27 +0100
Subject: [PATCH 3/7] MAINTAINERS: add Zi Yan as co-maintainer for MEMORY
 MANAGEMENT - THP
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-maintainers-v1-3-97278f8a5f54@kernel.org>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
In-Reply-To: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
To: Alistair Popple <apopple@nvidia.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Byungchul Park <byungchul@sk.com>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Chris Li <chrisl@kernel.org>, 
 Christoph Lameter <cl@gentwo.org>, Dave Chinner <david@fromorbit.com>, 
 David Rientjes <rientjes@google.com>, Dennis Zhou <dennis@kernel.org>, 
 Dev Jain <dev.jain@arm.com>, Gregory Price <gourry@gourry.net>, 
 Hao Li <hao.li@linux.dev>, Harry Yoo <harry@kernel.org>, 
 Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Kairui Song <kasong@tencent.com>, 
 Kemeng Shi <shikemeng@huaweicloud.com>, Kiryl Shutsemau <kas@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
 Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, Nhat Pham <nphamcs@gmail.com>, 
 Nick Piggin <npiggin@gmail.com>, Nico Pache <nico.pache@linux.dev>, 
 Oscar Salvador <osalvador@suse.de>, Pedro Falcato <pfalcato@suse.de>, 
 Peter Xu <peterx@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Rakie Kim <rakie.kim@sk.com>, 
 Rik van Riel <riel@surriel.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>, 
 Uladzislau Rezki <urezki@gmail.com>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
 Xu Xin <xu.xin@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097; i=david@kernel.org;
 h=from:subject:message-id; bh=LO3W/epE8pnx/LXnvCnHeDTK5RYQxoY93j4IZ+I1qVE=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLKe8ubpPVTqWF8q5NO9LVJQby63+NKA5cenhzlXL/x81
 Gvr+5IvHaUsDGIcDLJiiixBwfcNXr5cV1vtxscMM4eVCWQIAxenAExkRQHD/7ID5nGrXuRa3deY
 FNN6p3Az06Ew5uwMb9uzy9y2fN8vGszI8HCbWnOY74n8G6EfW++XX5tqOttvXdWzxvY8uzCF/t1
 N7AA=
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

Zi has been contributing to THP consistently and reliably over many
years and is considered one of our most valuable THP experts. As THP is
an especially active area lately, having a single dedicated THP maintainer
is not sustainable.

Fortunately, Zi volunteered to take on more responsibility by stepping
up as a THP co-maintainer. So let's do exactly that.

His placement in the MAINTAINERS entry is very convenient to perform
this change :)

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0baeb37b0dcdc..02b5b542f81ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17817,7 +17817,7 @@ F:	mm/swapfile.c
 MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	David Hildenbrand <david@kernel.org>
-R:	Zi Yan <ziy@nvidia.com>
+M:	Zi Yan <ziy@nvidia.com>
 R:	Baolin Wang <baolin.wang@linux.alibaba.com>
 R:	Liam R. Howlett <liam@infradead.org>
 R:	Nico Pache <nico.pache@linux.dev>

-- 
2.43.0

