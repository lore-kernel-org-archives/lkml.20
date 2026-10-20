Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485260;
	b=5r8xQRXg9k+cpxR3+vmyAC/2IT+lNfXW0wIYmMYEmiAA1ncjcoHcYEU9x79XksWNgtBl
	 8D2vEl64KY8eeFAM9UaOBPSJ3mhxNo8jjfqHw7vsMH7eXj1tsKpXHw1n6t0eckt8HInAa
	 PTb99bLtCsqojHLKXyCui7eVjGvC4SlTyAL78YFmDO1UmKlzVV6wdseMpw9aURN1EbpO6
	 zaeXmjxHWkxIuxtKsYjhmtDQC1ZwBhVWnXUfJ2OuWAtpfQgS5ChFnmtTXxx4d8HkxxWGp
	 sw4A9Hj/Iv7WAslo4KnqiAblirFDdYWXuHI8dD292kvX9Oa0j6TwIuHdZLtCyYRlaPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485260;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=vBKNWH+6fXgb7uSlyDkZ/sbNDxzLeASFOGVrmanI1ag=;
	b=ISUVohFkTA09W1dIJKCZDtlq0oB7LoMAizvkQv4Q2LKqd0qS7Lwl52msIlfixzr/wquX
	 sjtZA4zEOJPt8ovY1MQ0ipLUKL7X3mG9x53V2KOwdsubB1GuQWJnllvR+SBeUWhcgy0XR
	 SoLWR4iIvfwOVvh04+FrpUbC9GDupxx6De0NsR+hlBBaxbHeDbrczf+L++wMO9Ox6+Klz
	 lzuBL0khiWIgTzqW464dHvYWIDPwlPmYdCWLnetJjruRJsrkX2/A0ed+/eI86xmNHBMbU
	 1nR9MveC+1HQNttZ8kdX+aW/hLvgIw/bx+OcENXO85iJLkNs1jUnAewvlj+zMeRUa0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Kk+jgumG;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D1F606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12D1F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Kk+jgumG
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=vBKNWH+6fXgb7uSlyDkZ/sbNDxzLeASFOGVrmanI1ag=;
	b=Kk+jgumG+pv7XnaPZDeeAU8MQ3LXTfm6oVnCbW8jazUZnqZ/ORtrC7JgFvxdnO+cDQzOI4t2U
	7vALOi9vHSSqoltGoZVUZISYSqkFZA0i7RhDVImMBjBBYnv3lpqm+y9AiV7PJ3swzXlcKzvnvXx
	8keUXFd5fYMskZHOl9KyGJI=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4j85L156ycz1K9Xh;
	Tue, 20 Oct 2026 16:34:01 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 0A9C04048B;
	Tue, 20 Oct 2026 16:34:05 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 16:34:02 +0800
Message-ID: <d7dc6528-4ec8-46d0-b21e-8a4c38edd4ce@huawei.com>
Date: Tue, 20 Oct 2026 16:34:02 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/14] kexec: Fix CMA segment address translation with
 non-zero text_offset
To: Mike Rapoport <rppt@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<dakr@kernel.org>, <akpm@linux-foundation.org>, <baoquan.he@linux.dev>,
	<pasha.tatashin@soleen.com>, <pratyush@kernel.org>, <ruirui.yang@linux.dev>,
	<leitao@debian.org>, <yeoreum.yun@arm.com>, <sourabhjain@linux.ibm.com>,
	<robh@kernel.org>, <coxu@redhat.com>, <kees@kernel.org>,
	<tangyouling@kylinos.cn>, <liukexin@kylinos.cn>, <zhangtianyang@loongson.cn>,
	<guodongtai@kylinos.cn>, <maqianga@uniontech.com>, <chao.gao@intel.com>,
	<kai.huang@intel.com>, <vishal.l.verma@intel.com>, <seanjc@google.com>,
	<piliu@redhat.com>, <thuth@redhat.com>, <jbouron@amazon.com>,
	<me@linux.beauty>, <mclapinski@google.com>, <graf@amazon.com>,
	<bgwin@google.com>, <hbathini@linux.ibm.com>, <eric.devolder@oracle.com>,
	<takahiro.akashi@linaro.org>, <james.morse@arm.com>, <palmer@rivosinc.com>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <driver-core@lists.linux.dev>,
	<kexec@lists.infradead.org>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <20260921090450.807575-2-ruanjinjie@huawei.com>
 <179248377975.302547.13172455257147735569.b4-review@b4>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <179248377975.302547.13172455257147735569.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/20 16:09, Mike Rapoport 写道:
>> kimage_load_cma_segment() and kimage_map_segment() both translate
>> a CMA segment using page_address(cma), which returns the CMA base
>> address. This ignores segment->mem.
>>
>> On arm64, image_load() adds text_offset to segment->mem before the
>> segment is loaded:
>>
>> 	kernel_segment->mem += text_offset;
>> 	kernel_segment->memsz -= text_offset;
>> 	image->start = kernel_segment->mem;
> 
> That's true, but since commit 751c263bb74f ("arm64: remove TEXT_OFFSET
> randomization") TEXT_OFFSET is always zero. This is upstream from v5.8,
> so no LTS kernels has non-zero TEST_OFFSET.

Yes, My concern is what if the kdump kernel is an old one without this
patch?

Should we just add a WARN_ON_ONCE(text_offset != 0); here?

> 
> Maybe we should rather start deprecating .text_offset in arm64?
> 

-- 
Best regards,
Jinjie

