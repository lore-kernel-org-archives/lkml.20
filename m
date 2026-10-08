Received: from mta1.migadu.com (out-25.mta1.migadu.com [95.215.58.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968B83F6C3B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444678; cv=none; b=us3pmaDbtqHI6GDsEt9ZPgxtG9OVaOngrBNRV49VytGr5i81MqXzsZjhTkd5YkpqDM24jGwMBD26dw7x9kMEo66IDRjXvfi06/tXqWxy0KpGwNBHrKbKcgDxsBS6EAh6ZQbZERTY4QUdWlgOHcuTCv7dYGaVEw1//0a17vWvOEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444678; c=relaxed/simple;
	bh=JEx2OLckwemutil/MN151E8aEqCJockn3ZT2A2YL1GI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J9NAV+EGZ7H5ieEIL1d+dXEyrhbpRuDL303u7kXDsgDsB80gUpbfO6wYYKKdJMG67FqHGbLFRTk724R265sAjPA8OZr8MncOVuLqo8DtPbijpFBm9cUt+/TYogyOcCSji+a4OkDz7ozDkIGURRKBJguCLmEjQ3n89Bcn01hPTFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SvdQLdlm; arc=none smtp.client-ip=95.215.58.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SvdQLdlm"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JEx2OLckwemutil/MN151E8aEqCJockn3ZT2A2YL1GI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791444668; v=1; x=1792049468;
 b=SvdQLdlmjfOSkkKc+vEMfA3TnDMTTpuRBGosa9xoewYqU7OPlc+R54cHuhuLwSweZUcjdJHZ
 kmiYb0Kq36M+If4bAB9Pl78K12cQTH8z6zPiqc09Wnlh4swJvLmOU/qGQPp1uaYuW9CxRtSPrlu
 jfYkGRZb4MUNI6xm/kCX4kvE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0f9abccb4081472f;
	Thu, 08 Oct 2026 07:31:07 +0000
X-Mizu-Trace-ID: 0f9abccb4081472f
X-Migadu-Flow: FLOW_OUT
Message-ID: <85b3725a-6dde-4a57-b303-4ae2b53b60a5@linux.dev>
Date: Thu, 8 Oct 2026 15:30:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/19] selftests/mm: add khugepaged race harness
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Muhammad Usama Anjum <usama.anjum@arm.com>, Usama Arif
 <usama.arif@linux.dev>, "Nico Pache (Red Hat)" <nico.pache@linux.dev>,
 Zi Yan <ziy@nvidia.com>, Barry Song <baohua@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Hugh Dickins <hughd@google.com>,
 Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
 Michal Hocko <mhocko@suse.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Shuah Khan <shuah@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, kernel-team@meta.com
References: <20260919002451.496763-1-kirill@shutemov.name>
 <20260919002451.496763-17-kirill@shutemov.name>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260919002451.496763-17-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/19/26 8:24 AM, Kiryl Shutsemau wrote:

> +		} else {	/* madvise */
> +			while (now_ms() < end_ms && !corrupted) {
> +				for (i = 0; i < nr_shared_areas; i++) {
> +					madvise(region + i * hpage_pmd_size,
> +						hpage_pmd_size, MADV_COLLAPSE);

I got the following error when compiling it:

khugepaged_race.c: In function ‘main’:
khugepaged_race.c:506:23: error: ‘MADV_COLLAPSE’ undeclared (first use in this function); did you mean ‘MADV_COLD’?
  506 |       hpage_pmd_size, MADV_COLLAPSE);
      |                       ^~~~~~~~~~~~~
      |                       MADV_COLD
khugepaged_race.c:506:23: note: each undeclared identifier is reported only once for each function it appears in
make: *** [../lib.mk:225: /data/code/mm/tools/testing/selftests/mm/khugepaged_race] Error 1

Thanks,
Zenghui
