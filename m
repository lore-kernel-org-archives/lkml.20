Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C915013C4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790962671; cv=none; b=dq7I2KtyfHbRzHVnX0k/21SH8Rilmuk/nvJ4bi+uHcsUCt0cmESBSkOJ0JQ1pjTakF4G6xAyTB8WKvh0Y4YgtKW66xW4d+/EMI7N5lpHl8Kxgk+hOP0CmKZcMtZ789eDSSrfRWc/4o9nU3o9JZ23lpqzF7UzUrT3S7pF+DYUwQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790962671; c=relaxed/simple;
	bh=siha9X/s8ulN2VF7hdc6xW1tHVD0UV8OJ/j+Qs7oepU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MvQHZ71GCvZYeVrLgaEWebLCNQk0uPgz89GizPVgQlV6gmMT0HDy5/rOAkzJyrFAz09ExGe/5YRKkP5rP4qr6+G5JJpnclvWp0PZjxHNPQf8Z1IeLVVVOIK/J5oOXckR6FLl2LcD+pVAHrwJHKNoXg0zecUmXZfpegg9qpuuV1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf09.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id ED5661607E5;
	Fri,  2 Oct 2026 17:37:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf09.hostedemail.com (Postfix) with ESMTPA id CDA0720028;
	Fri,  2 Oct 2026 17:37:26 +0000 (UTC)
Message-ID: <bfefed1916a675a32ddcbebcf5a23b91fc750bcd.camel@perches.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: add include/linux/hugetlb_cgroup.h to
 HUGETLB SUBSYSTEM
From: Joe Perches <joe@perches.com>
To: Enze Li <lienze@kylinos.cn>, muchun.song@linux.dev, osalvador@suse.de, 
	david@kernel.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Date: Fri, 02 Oct 2026 10:37:25 -0700
In-Reply-To: <20261001123747.634845-1-lienze@kylinos.cn>
References: <20261001123747.634845-1-lienze@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: CDA0720028
X-Stat-Signature: 348q88fdbt9su9a7hq9j7fak9p8t77yn
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18O5sdPDYTx+BSdgMTkhO/Vk7CiFlfhBWY=
X-HE-Tag: 1790962646-23624
X-HE-Meta: U2FsdGVkX19H9ajhoVGn9d8exUtin1T3k2oSe/ypqD9OqZeSa6xn1DrwZLvcIcS/pjPOFLrE2bWV1/Mug/qlshnsyFnD2bJ20tp+R+QbxrXzBqxFBOydqiDNmHuTbmHEhc763XCcvx3B/pyjTwdt7at9PNacD5UcGUKTPzETAzreDJ2L3qUnukXwKexkh7Hm7sETwZtGtL5G6FR1qYbBZm/W98L8lR0AR4hYAUCciqhDUuHT86SounqawUZNQ2kP3ENEyDwrbeGDW+UjeIsbuTHPKAP+JvqXqrrjmkSj8WQJeXUE3tY0XxnlS/xCn76SX7Z+DokXHE3FDpKcgQKmuUuMViX/kajAS2igwTj6dZS9Oqg6vo7rV5gV91fZaAGJMFGnVLqxIlrLS0JZ9HAyTg==

On Thu, 2026-10-01 at 20:37 +0800, Enze Li wrote:
> include/linux/hugetlb_cgroup.h is the header file paired with
> mm/hugetlb_cgroup.c, but it is not listed among the HUGETLB SUBSYSTEM
> F: entries.  As a result get_maintainer.pl does not attribute the header
> to the hugetlb maintainers explicitly.  Add the F: entry so the file is
> covered.

This misses another file: include/linux/hugetlb_inline.h

The current HUGETLB block is:

HUGETLB SUBSYSTEM
M:	Muchun Song <muchun.song@linux.dev>
M:	Oscar Salvador <osalvador@suse.de>
R:	David Hildenbrand <david@kernel.org>
L:	linux-mm@kvack.org
S:	Maintained
F:	Documentation/ABI/testing/sysfs-kernel-mm-hugepages
F:	Documentation/admin-guide/mm/hugetlbpage.rst
F:	Documentation/mm/hugetlbfs_reserv.rst
F:	Documentation/mm/vmemmap_dedup.rst
F:	fs/hugetlbfs/
F:	include/linux/hugetlb.h
F:	include/trace/events/hugetlbfs.h
F:	mm/hugetlb.c
F:	mm/hugetlb_cgroup.c
F:	mm/hugetlb_cma.c
F:	mm/hugetlb_cma.h
F:	mm/hugetlb_sysctl.c
F:	mm/hugetlb_sysfs.c
F:	mm/hugetlb_vmemmap.c
F:	mm/hugetlb_vmemmap.h
F:	tools/testing/selftests/cgroup/test_hugetlb_memcg.c

And your suggestion is:

> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -12097,6 +12097,7 @@ F:	Documentation/mm/hugetlbfs_reserv.rst
>  F:	Documentation/mm/vmemmap_dedup.rst
>  F:	fs/hugetlbfs/
>  F:	include/linux/hugetlb.h
> +F:	include/linux/hugetlb_cgroup.h

but:

$ git ls-files include/linux/hugetlb*
include/linux/hugetlb.h
include/linux/hugetlb_cgroup.h
include/linux/hugetlb_inline.h

so maybe:

F:	include/linux/hugetlb*

or maybe:

X:	arch/**/*hugetlb*
F:	**/*hugetlb*

and remove a lot of other entries

$ git ls-files -- '**/*hugetlb*'
Documentation/admin-guide/cgroup-v1/hugetlb.rst
Documentation/admin-guide/mm/hugetlbpage.rst
Documentation/arch/arm64/hugetlbpage.rst
Documentation/mm/hugetlbfs_reserv.rst
Documentation/translations/zh_CN/arch/arm64/hugetlbpage.rst
Documentation/translations/zh_CN/mm/hugetlbfs_reserv.rst
Documentation/translations/zh_TW/arch/arm64/hugetlbpage.rst
arch/arm/include/asm/hugetlb-3level.h
arch/arm/include/asm/hugetlb.h
arch/arm64/include/asm/hugetlb.h
arch/arm64/mm/hugetlbpage.c
arch/loongarch/include/asm/hugetlb.h
arch/loongarch/mm/hugetlbpage.c
arch/mips/include/asm/hugetlb.h
arch/mips/mm/hugetlbpage.c
arch/parisc/include/asm/hugetlb.h
arch/parisc/mm/hugetlbpage.c
arch/powerpc/include/asm/book3s/64/hugetlb.h
arch/powerpc/include/asm/hugetlb.h
arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
arch/powerpc/include/asm/nohash/hugetlb-e500.h
arch/powerpc/mm/book3s64/hugetlbpage.c
arch/powerpc/mm/book3s64/radix_hugetlbpage.c
arch/powerpc/mm/hugetlbpage.c
arch/powerpc/mm/nohash/e500_hugetlbpage.c
arch/riscv/include/asm/hugetlb.h
arch/riscv/mm/hugetlbpage.c
arch/s390/include/asm/hugetlb.h
arch/s390/mm/hugetlbpage.c
arch/sh/include/asm/hugetlb.h
arch/sh/mm/hugetlbpage.c
arch/sparc/include/asm/hugetlb.h
arch/sparc/mm/hugetlbpage.c
arch/x86/include/asm/hugetlb.h
arch/x86/mm/hugetlbpage.c
fs/hugetlbfs/Makefile
fs/hugetlbfs/inode.c
include/asm-generic/hugetlb.h
include/linux/hugetlb.h
include/linux/hugetlb_cgroup.h
include/linux/hugetlb_inline.h
include/trace/events/hugetlbfs.h
include/uapi/asm-generic/hugetlb_encode.h
mm/hugetlb.c
mm/hugetlb_cgroup.c
mm/hugetlb_cma.c
mm/hugetlb_cma.h
mm/hugetlb_internal.h
mm/hugetlb_sysctl.c
mm/hugetlb_sysfs.c
mm/hugetlb_vmemmap.c
mm/hugetlb_vmemmap.h
tools/include/asm-generic/hugetlb_encode.h
tools/testing/selftests/arm64/mte/check_hugetlb_options.c
tools/testing/selftests/cgroup/test_hugetlb_memcg.c
tools/testing/selftests/memfd/run_hugetlbfs_test.sh
tools/testing/selftests/mm/charge_reserved_hugetlb.sh
tools/testing/selftests/mm/hugetlb-madvise.c
tools/testing/selftests/mm/hugetlb-mmap.c
tools/testing/selftests/mm/hugetlb-mremap.c
tools/testing/selftests/mm/hugetlb-read-hwpoison.c
tools/testing/selftests/mm/hugetlb-shm.c
tools/testing/selftests/mm/hugetlb-soft-offline.c
tools/testing/selftests/mm/hugetlb_dio.c
tools/testing/selftests/mm/hugetlb_fault_after_madv.c
tools/testing/selftests/mm/hugetlb_madv_vs_map.c
tools/testing/selftests/mm/hugetlb_reparenting_test.sh
tools/testing/selftests/mm/ksft_hugetlb.sh
tools/testing/selftests/mm/write_hugetlb_memory.sh
tools/testing/selftests/mm/write_to_hugetlbfs.c
tools/testing/selftests/powerpc/mm/hugetlb_vs_thp_test.c

