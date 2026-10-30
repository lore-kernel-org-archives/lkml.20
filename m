Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396119;
	b=IA+dQiQ4WcrFInl699qKrLXAHjDJNUdk4a/oJCEaJ6Hl5BG49Qoq2fLdKwkXdRqVi6CY
	 PDzVr77J0OVCnC5cK8VuanIE++LPO1jKzoy0zAVGvDYs+oFqetp4p5Vcdx48ehor0Emge
	 lFL8I8avSQgJhWXTzvjxdhpadLMin3xlQkRahGUAEgjsGvQ5d2bCou1hSQXQgbSeHkBa6
	 bfi6pzb8D2D47lWYDmnGhMk5FVUzyveBBZPTRAvYE+qFjJ0s1XIWCEWatU+agF/nsKF57
	 k1dyKR9M5p0pcCFBY1D3ncWx+rnWbMxpTKV0/tp9S4m7HvxZ8p+qhg02YV2Nw4ckWtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396119;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=q0ROzhyVWpaAD+zcRsivDjlq++3aMe3aJhf6SnEDbsg=;
	b=AD0J52Ez8vNFxvxF+cqzt4Jf1zdZPiYPgzDHVwqp9Ojf+mBQQB1T6eW1h3xvQxVjvChl
	 6Ss4mmTdhGPHvATc6eM9Sxqz4XDdhBE3LoH6E7yPdE36OMAS6zgPHgx7KAp51s68eXiL3
	 zPaqGQrwklgAJGpxPitY9Qp+lI4xEQOxLMAV5oeVITO2F9yWCm7d5EENX7qNLS/Q18hv4
	 XezfOyaBWBXhruxqI+dOB3CyoElMC48MPHvGcbnbOfJ9wykNBB6vuxLcqfNjRuTBgE/Bv
	 KQIwDmUR35ac/9p6rV1H3S93jnBYvlOwnAM4uUVkdOXbFYS9nyAZp2LLzJNFC1dTBgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZoTtl5Wn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F673606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZoTtl5Wn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10001F0093A;
	Fri, 30 Oct 2026 21:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793396118;
	bh=q0ROzhyVWpaAD+zcRsivDjlq++3aMe3aJhf6SnEDbsg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZoTtl5Wn+RQqFla8r3LjDKV+bAtFXOeegK5eNCIUCgycmQVrcSSjkYE9jQ+AC/9v3
	 xYHrgenAy3jbwXbjPeZiHCVacwTobYW7Di5R/FSNKH7BVJqE+eIkvGpbyT98IFq0Gz
	 96p6zIwxsTabga3thwvR8w/dl//OuCo6xapDVJacUt/Lk0F2Mf1bBsB2tiVMYo50Sj
	 8ZLTCgrchSkz4EwF6OPUCgw/8dolpsJFlRT/EauLpyLe+tKnH/AlpMaBfcoC/Deicm
	 77P0HQAgmAQ69rF6/V2oW8OVFE+dOBK4+Ume4mPw38dvbw4cvMyYcsjPg18plX2CjM
	 gSBwSyAE4GIoA==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 30 Oct 2026 22:34:26 +0100
Subject: [PATCH 2/7] MAINTAINERS: TMPFS (SHMEM FILESYSTEM) updates
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
Message-Id: <20261030-maintainers-v1-2-97278f8a5f54@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2535; i=david@kernel.org;
 h=from:subject:message-id; bh=YpR5XrhWeYStaaeRtOb6nKhSn1uNGhC94VBBnUzwKd8=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLKe8ua9aA2fIvM4ZMvmI2+X/D96bZLdRFajH5NDJz8wa
 j9xa8mNlo5SFgYxDgZZMUWWoOD7Bi9frqutduNjhpnDygQyhIGLUwAmsqiKkeEaD8Oilid6KywW
 Zd/2MC+yz/Ioc14i/CBu1sGktzEqMi2MDD2f/rBO3rR0964/H/4+cy+TMVnblruv99eP/J/c+gq
 q0twA
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

I am not really the best shmem/tmpfs/memfd expert around, but it should
be good enough to judge when something is ready to be picked up, to then
pick it up. I'll have to heavily rely on Hugh and Baolin on judgment
for the more involved and more controversial bits.

Rename "TMPFS (SHMEM FILESYSTEM)" to "MEMORY MANAGEMENT - SHARED MEMORY
(SHMEM/TMPFS/MEMFD)" and move it accordingly. Add myself as a MAINTAINER
so people know whom to CC.

Add mm/core.git as the target git tree. Once shmem becomes a high volume
component we can dedicate it a separate tree and have dedicated people
pick it up.

While at it, add some more shmem/tmpfs/memfd related files+directories
we missed so far.

There is also "kernel/pid_sysctl.h", which includes some of the pid
namespaced sysctl vm.memfd_noexec. But that's really more of a proc/
namespace thingy, so it's not a good fit here.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 MAINTAINERS | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index dbb5582ec1c74..0baeb37b0dcdc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17772,6 +17772,25 @@ S:	Maintained
 F:	include/linux/secretmem.h
 F:	mm/secretmem.c
 
+MEMORY MANAGEMENT - SHARED MEMORY (SHMEM/TMPFS/MEMFD)
+M:	Hugh Dickins <hughd@google.com>
+M:	David Hildenbrand <david@kernel.org>
+R:	Baolin Wang <baolin.wang@linux.alibaba.com>
+L:	linux-mm@kvack.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
+F:	Documentation/filesystems/tmpfs.rst
+F:	Documentation/mm/shmfs.rst
+F:	Documentation/userspace-api/mfd_noexec.rst
+F:	include/linux/memfd.h
+F:	include/linux/shmem_fs.h
+F:	include/uapi/linux/memfd.h
+F:	mm/memfd.c
+F:	mm/shmem.c
+F:	mm/shmem_quota.c
+F:	tools/testing/selftests/memfd/
+F:	tools/testing/selftests/tmpfs/
+
 MEMORY MANAGEMENT - SWAP
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	Chris Li <chrisl@kernel.org>
@@ -28202,17 +28221,6 @@ S:	Maintained
 F:	Documentation/hwmon/tmp513.rst
 F:	drivers/hwmon/tmp513.c
 
-TMPFS (SHMEM FILESYSTEM)
-M:	Hugh Dickins <hughd@google.com>
-R:	Baolin Wang <baolin.wang@linux.alibaba.com>
-L:	linux-mm@kvack.org
-S:	Maintained
-F:	include/linux/memfd.h
-F:	include/linux/shmem_fs.h
-F:	mm/memfd.c
-F:	mm/shmem.c
-F:	mm/shmem_quota.c
-
 TOMOYO SECURITY MODULE
 M:	Kentaro Takeda <takedakn@nttdata.co.jp>
 M:	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

-- 
2.43.0

