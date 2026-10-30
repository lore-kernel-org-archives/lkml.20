Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396176;
	b=MU8XRbj8P9hV+M44GXpVisOa/4PR5AJrjioYoLbZdpyNDaIC44aUOxRxVsVVVApKnMw7
	 dNc8pi9+KnNwj2FvDZxnopyPvMmUzNof3cDV8PoFfewDfdSP7ZK6Kq+O1s12+2QPHpyWF
	 0/8WXIB80Gw/MCr2DksVS/dqxq6713Ax1unpFEFJsMauSMKgL7+130p2s2KqxHfSvTIIP
	 daz7I4CyzUaWLhHSKG4fvL/3y6YJ2A/mKk12V/SxQ8F+bSvKXb1TYLTA8XHCxu4H8/xPr
	 fg1A6UfggEP0G8006RlZEln92rv1tbQCX+I4GOIYdYTOwz89dFJADylfJt4LoNMDH+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396176;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=uffWnCX+dZCMC5zfqHz8EFOq57RMKg2oGaNPtOTb0ak=;
	b=tFwZsSCRIVgVTkLKUHJf90F42R2FZEfmSZiRCqTPCFFxYz4t0438C1+yGN2HZHMciN1J
	 +Se78Dg/LF3WGTCSr3iZfiKqDXUAFl/dOsmLs7oaCE8GSJEytbg0t5boGUJv0qGGovgnk
	 V7SUjlnweLWUuOXAj3t0HHV2z/UnarObBtM6DGIean0sSWYm5oqdQX79O4xT/ykEU676e
	 +Mg2/PAVN/kz15rjW2cESBNpn7IAZq9CekcCcLCgRfkJuNQxm2qObY0/YPZlbf6TCrCEA
	 deZeqwJ19V1OzUL6R4lYZ6RsvX3LWjIAyhS11T78kJUeG99RJh/1/LYwSbN1wNzNzMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b66erMyA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30C0606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b66erMyA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE89D1F00A02;
	Fri, 30 Oct 2026 21:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793396175;
	bh=uffWnCX+dZCMC5zfqHz8EFOq57RMKg2oGaNPtOTb0ak=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=b66erMyA/4rcHH7GTtaplkrXxXXnjafDpQRaA1GC4RN+7mG+xzJmMHXZM1yhFlOgq
	 xzhqlzmNfp88yGqMF5+YP1g9iQiGaQKD4PdQInnhKmv9e0PwiXI5IyD1W0rzoj9wdE
	 rNRctA5HgnG4x0svvzuPckqP+1Y87OACM+zxWZdxgiquzhNw8+3pXnJ+74s0phHaM+
	 Yxfx0qeEbctJJ5fBezlaDHzTTaZln5WtUaYEx2NBbQCETpZhBZvySP1xDboZxG5+qK
	 LogiGw6Y+fmgYHDIjiq6Hlgp52tmugZOxqa2lfxIeeupLTPxX+IXCyE4zNWWv1DR9I
	 l6m7uqhjQ3bFw==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 30 Oct 2026 22:34:30 +0100
Subject: [PATCH 6/7] MAINTAINERS: rename and move MEMORY HOT(UN)PLUG
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
Message-Id: <20261030-maintainers-v1-6-97278f8a5f54@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1918; i=david@kernel.org;
 h=from:subject:message-id; bh=S2+gMbb/eCTDH7Pu2Zb0zjeGPfd0pSGk5ktePYriPXo=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLKe8uZNbl0X/LffO/el9IcrXDc+nNy8LSjw4MxU8QkG1
 ts3nLdR7ihlYRDjYJAVU2QJCr5v8PLlutpqNz5mmDmsTCBDGLg4BWAiTDqMDL8W9cZefrsxqkXR
 +e0DF9P3klcM3x3yfGy4iY/ToPScxDWG/94HdfQunNpva3Ezk5FxbZhPy75jK020lft+/XH8p+m
 ZzQoA
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

Prefix "MEMORY HOT(UN)PLUG" with "MEMORY MANAGEMENT" and put it into the
right spot in the MM component section list.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 MAINTAINERS | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 98948d159173b..0adc674304987 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17423,22 +17423,6 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git
 F:	drivers/devfreq/tegra30-devfreq.c
 
-MEMORY HOT(UN)PLUG
-M:	David Hildenbrand <david@kernel.org>
-M:	Oscar Salvador <osalvador@suse.de>
-L:	linux-mm@kvack.org
-L:	linux-cxl@vger.kernel.org
-S:	Maintained
-F:	Documentation/ABI/testing/sysfs-devices-memory
-F:	Documentation/admin-guide/mm/memory-hotplug.rst
-F:	Documentation/core-api/memory-hotplug.rst
-F:	drivers/base/memory.c
-F:	include/linux/memory_hotplug.h
-F:	include/linux/memremap.h
-F:	mm/memory_hotplug.c
-F:	mm/memremap.c
-F:	tools/testing/selftests/memory-hotplug/
-
 MEMORY MANAGEMENT
 M:	Andrew Morton <akpm@linux-foundation.org>
 L:	linux-mm@kvack.org
@@ -17576,6 +17560,22 @@ F:	include/trace/events/ksm.h
 F:	mm/ksm.c
 F:	mm/mm_slot.h
 
+MEMORY MANAGEMENT - MEMORY HOT(UN)PLUG
+M:	David Hildenbrand <david@kernel.org>
+M:	Oscar Salvador <osalvador@suse.de>
+L:	linux-mm@kvack.org
+L:	linux-cxl@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-devices-memory
+F:	Documentation/admin-guide/mm/memory-hotplug.rst
+F:	Documentation/core-api/memory-hotplug.rst
+F:	drivers/base/memory.c
+F:	include/linux/memory_hotplug.h
+F:	include/linux/memremap.h
+F:	mm/memory_hotplug.c
+F:	mm/memremap.c
+F:	tools/testing/selftests/memory-hotplug/
+
 MEMORY MANAGEMENT - MEMORY MAP
 M:	Muchun Song <muchun.song@linux.dev>
 M:	Mike Rapoport <rppt@kernel.org>

-- 
2.43.0

