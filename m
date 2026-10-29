Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259105;
	b=TVJQ3y8ebA1vg+ycdJoo70vXyzEc3B6P/bitwvUYjYrCR3OVzfr/zRwrRFUI7mXOCPZ6
	 68j08rz8cVbBfQtDw4da58gIQ+MKijTHwRUyTVVwOJQvITU6NC0U8PhkQWL+zJBge+tx4
	 ZZDUd18qPR8jVdCowTnMMZUAsYcgfYNpoEZ1tyGdPhSPwRHdGpP3PzjGQ8jwkyKUp0vmQ
	 l5IHyxsInWuWcHAgmdiR5OEwVVB0skd+1MGDhTkd9obRLe9m+16Tv0uyFFHL2h8XZ/F2E
	 TvCtChHlU51nMWdx5PSfqdJU+6q6qs8jjJfet27UQqktwiHYm0I3lDT9a0fzkhmRCKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259105;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=SjP7vXEfBmu5GFwxYK7lYChg0d8nniaqmFaSK+SgEpk=;
	b=0a6wTR4t6WzegX/VYVzOCvy6vzLkD9ZugIURKKiKNcEe/VgmbERnoCuYlOcOZ5neidTB
	 qvUHa5psTUY8fDQmDba2JXZ/qgVvwuI39jnTs8PbrQwrdhJSG5jZp1p36ktTrxNBdhVbz
	 IGQEYmWihWuGW2DMGOKw315u/YSRL47F6nSMLy2hjEQXTt5w+0LD0VGQFi4jeFs4C2s1w
	 PHkT1S/nbVyutfGq8uC/hxbBE+otq6i9Xmzc5QH4wdqCrI9nR0sksh1ZbK9zG4mqsmPBG
	 u72JyFETuMzd5s0Kt+FY11VHbs/WYB3PHlDLb1Gy3AwGTEiHtP8r59FJI+Mw3d/9NwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.170
Received: from mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B08606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96B08606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DXEk7qFnkBiqsaHKOXTg9XIqQu7fTyhLlV1PlmWC7w4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793259100; v=1; x=1793863900;
 b=Jc8DaRNRuV7sUsRRCf29I0aef6P7zPJYdi3W115kdfpYv4v5EgWorsqy5pjSISuh6odkhk3x
 dXEoSiVXt6tvM2W0GxvQzDOcHJp2eLioFEW60AAkr4mjGrVEvOsK1ZqZ6w/hUSn4lBb6BHufaTe
 iTEoujkDldKZ6aWbKnyx4UKw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id bb58316c57a2d4df;
	Thu, 29 Oct 2026 07:31:40 +0000
X-Mizu-Trace-ID: bb58316c57a2d4df
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 3/4] mm: add shared read-only vmemmap support for FS-DAX
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261029071206.19059-1-trilith.zheng@gmail.com>
Date: Thu, 29 Oct 2026 15:31:20 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <djbw@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Pankaj Gupta <pankaj.gupta@amd.com>,
 linux-mm@kvack.org,
 nvdimm@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 linux-cxl@vger.kernel.org,
 Vishal Verma <vishal.l.verma@intel.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Mike Rapoport <rppt@kernel.org>,
 Ira Weiny <iweiny@kernel.org>,
 Jan Kara <jack@suse.cz>,
 Matthew Wilcox <willy@infradead.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Michal Hocko <mhocko@suse.com>,
 Qi Zheng <qi.zheng@linux.dev>
Content-Transfer-Encoding: 7bit
Message-Id: <F2127C8C-BBA5-4AC5-8F12-577346FB7F31@linux.dev>
References: <20260903122128.12264-1-songmuchun@bytedance.com>
 <20260903122128.12264-4-songmuchun@bytedance.com>
 <20261027065723.66564-1-trilith.zheng@gmail.com>
 <4c9741cf-ac62-41d4-9c7a-7d5ceea4a8e1@linux.dev>
 <20261029030511.12004-1-trilith.zheng@gmail.com>
 <2E5C10CF-F3E0-4694-965C-B0E432A1A962@linux.dev>
 <20261029071206.19059-1-trilith.zheng@gmail.com>
To: Yilei Zheng <trilith.zheng@gmail.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 29, 2026, at 15:12, Yilei Zheng <trilith.zheng@gmail.com> wrote:
> 
> I forgot to mention the tool execution case in my last mail. Those
> microVMs start, run a small task, and exit. DAX is there to save
> memory, but the vmemmap is allocated for the whole image. A 2 GiB
> image pays 32 MiB of vmemmap even if a microVM only reads a few MB, so
> for those microVMs the DAX setup can use more memory than the same
> image on virtio-blk. That is also a case this series fixes for us.

Thanks for sharing. I think in this scenario it also saves boot time.
I'm not sure how significant that is, though, since the number of
vmemmap pages isn't large enough to be noticeable.

Thanks.
