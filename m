Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793436187;
	b=xvPMvUm3AhhnjSDQ4X6oT9SQ2GUbwEqeLgCV+lTqCdoAHcApfKlJBOU4XA22PsQLVNDq
	 WLHlqyXSh2/KCeSUbcYYiQ0OHl/wWHACmvwJkW3jCqJ27eo9XBewbuNj+HZhsCDX9i1ly
	 y11sKaWm0G1gCLzpHy+lP+YsJrmalKZlZfS73hI/uJfof0MmNzraff9++3wNA15LWsV0V
	 GS1ohxEaDhv0nRYgUae8I90i0wqF7Z7sZ4YOOypEdOBimwIQHC4zngzOWHu7kg425lISE
	 cdhIrQ2iutwwTMJ0zEjviLqn1++z8c9YixoT0ARdR6YhbKe4beVFQOHUwf7VWYJ3Psg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793436187;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nXkkUyzWC+RTVIrTwIsDK9pB6UYriIk9MdsE6VCyJgY=;
	b=rVnWnQQ78w4gcJzcsyhjV6hHQOXHqsTg+7m6GpCsfFpC72a3lR4T1TDR53CfDveTg1cM
	 Ji92X1KwzjpwgPIz92Xq+ijMYM3aJ0b6bOYOVMndvZ1zRyNVQK7zuUKUFe1pqxwSdyqcb
	 05O+wRj9y7MzSmh/tqthN327o4UsWuY8s1x5t37EXPyD+AKJzDuXf0uZThVPYkNGu5CTQ
	 q6bwOZMgqyh6V6UGw32DrwbOE9EYeJnQEnr8qdIiO9K/lAwcp/IEYYIVrtQZBRGuJIeDL
	 hsGHbqgmRAvmWFeAjH3F57j/hA6zTz6uDcg/Wh1qA+JSu0WSGigBAlihu7sjwkap+0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ORlPXPgS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF4C606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ORlPXPgS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1F31F00919;
	Sat, 31 Oct 2026 08:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793436186;
	bh=nXkkUyzWC+RTVIrTwIsDK9pB6UYriIk9MdsE6VCyJgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ORlPXPgS5XwD4OguPrHtmOsXivt5T92Q84WqGkbL/0pA7y0ygtOZdpnEZaz9Xq75S
	 US82CX/J14UW4oK6p/4nAFyjft/uU881oICIH9XwGhKGyBHazPWz6+sdwVMTgTHXDi
	 OeN4YpipRkgLoSH8ULA2Z/yZC+J60LcYLxJqnz32JMX3nCWhoFA9JLZ6UbgBL9rD9q
	 lmad44Lw8D7ovPNw2Mfe4qfZwt1gWdC0eCmj58arhxqRnpb9XG2txUBAshrChHctp2
	 Vgp7xVZWatKmrEFdxi+E/33RziYGHa60Cfxb2/ehfPZvSelsPlVrqsBf7jn7qJtT41
	 PW5YyYA6B/J6Q==
Date: Sat, 31 Oct 2026 08:42:50 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Byungchul Park <byungchul@sk.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Chris Li <chrisl@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
	Dave Chinner <david@fromorbit.com>, David Rientjes <rientjes@google.com>, 
	Dennis Zhou <dennis@kernel.org>, Dev Jain <dev.jain@arm.com>, Gregory Price <gourry@gourry.net>, 
	Hao Li <hao.li@linux.dev>, Harry Yoo <harry@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	John Hubbard <jhubbard@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, Matthew Brost <matthew.brost@intel.com>, 
	Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Nhat Pham <nphamcs@gmail.com>, Nick Piggin <npiggin@gmail.com>, 
	Nico Pache <nico.pache@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Qi Zheng <qi.zheng@linux.dev>, Rakie Kim <rakie.kim@sk.com>, 
	Rik van Riel <riel@surriel.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Will Deacon <will@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/7] MAINTAINERS: TMPFS (SHMEM FILESYSTEM) updates
Message-ID: <auWpV3BHsYVLaKLx@gremlin>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
 <20261030-maintainers-v1-2-97278f8a5f54@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030-maintainers-v1-2-97278f8a5f54@kernel.org>

On Fri, Oct 30, 2026 at 10:34:26PM +0100, David Hildenbrand (Arm) wrote:
> I am not really the best shmem/tmpfs/memfd expert around, but it should
> be good enough to judge when something is ready to be picked up, to then
> pick it up. I'll have to heavily rely on Hugh and Baolin on judgment
> for the more involved and more controversial bits.
>
> Rename "TMPFS (SHMEM FILESYSTEM)" to "MEMORY MANAGEMENT - SHARED MEMORY
> (SHMEM/TMPFS/MEMFD)" and move it accordingly. Add myself as a MAINTAINER
> so people know whom to CC.
>
> Add mm/core.git as the target git tree. Once shmem becomes a high volume
> component we can dedicate it a separate tree and have dedicated people
> pick it up.
>
> While at it, add some more shmem/tmpfs/memfd related files+directories
> we missed so far.
>
> There is also "kernel/pid_sysctl.h", which includes some of the pid
> namespaced sysctl vm.memfd_noexec. But that's really more of a proc/
> namespace thingy, so it's not a good fit here.

Maybe not for shmem, but there's definitely still some stuff in kernel/ that
should be ported over to mm/ (thinking particularly of fork stuff).

>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  MAINTAINERS | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dbb5582ec1c74..0baeb37b0dcdc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17772,6 +17772,25 @@ S:	Maintained
>  F:	include/linux/secretmem.h
>  F:	mm/secretmem.c
>
> +MEMORY MANAGEMENT - SHARED MEMORY (SHMEM/TMPFS/MEMFD)
> +M:	Hugh Dickins <hughd@google.com>
> +M:	David Hildenbrand <david@kernel.org>
> +R:	Baolin Wang <baolin.wang@linux.alibaba.com>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
> +F:	Documentation/filesystems/tmpfs.rst
> +F:	Documentation/mm/shmfs.rst
> +F:	Documentation/userspace-api/mfd_noexec.rst
> +F:	include/linux/memfd.h
> +F:	include/linux/shmem_fs.h
> +F:	include/uapi/linux/memfd.h
> +F:	mm/memfd.c
> +F:	mm/shmem.c
> +F:	mm/shmem_quota.c
> +F:	tools/testing/selftests/memfd/
> +F:	tools/testing/selftests/tmpfs/
> +
>  MEMORY MANAGEMENT - SWAP
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Chris Li <chrisl@kernel.org>
> @@ -28202,17 +28221,6 @@ S:	Maintained
>  F:	Documentation/hwmon/tmp513.rst
>  F:	drivers/hwmon/tmp513.c
>
> -TMPFS (SHMEM FILESYSTEM)
> -M:	Hugh Dickins <hughd@google.com>
> -R:	Baolin Wang <baolin.wang@linux.alibaba.com>
> -L:	linux-mm@kvack.org
> -S:	Maintained
> -F:	include/linux/memfd.h
> -F:	include/linux/shmem_fs.h
> -F:	mm/memfd.c
> -F:	mm/shmem.c
> -F:	mm/shmem_quota.c
> -
>  TOMOYO SECURITY MODULE
>  M:	Kentaro Takeda <takedakn@nttdata.co.jp>
>  M:	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>
> --
> 2.43.0
>

--
Cheers, Lorenzo
