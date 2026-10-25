Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.235
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792964931;
	b=hglu9f/o4dGMkJX0Bp2j3HAXTdPobmy8lTPyU1aR2YoHIY5d2BEFO/+Yf4hkQzUrcjTf
	 YRAUhDK7799xK/O4MMflwZwnC+oLjMRlu1zqjxW/m8vijooE73Mi70K50x+X7ewatZED0
	 bYnrq/DmvdrC+brBpK/kEduU61YhWVL9l0tx8OxolR53Iv7n3Mltv7jNI1J9y35f5gA5p
	 I6KOMMof6+uMecg39clDtJBrHJMgTgBKLn+ew/AWj3igfjnE3DmiAU9yzsvCSK9Kjo6V8
	 2wPdieDJmpRfPKu0klTKu0AkTa83XdSl8xxQT6NkndRi+qaTs4Ra62/7kTghy9JeVEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792964931;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7wQNgAvrV53M6g73xXbn+Hsa5Wpgb9uHDA2CEi88MY8=;
	b=DFh9jW6FoCDqYgP4pSSWGSmq7HZ6Bxv6ohCZeRM0YqOJm9WxGUSGL97Usy2fafU4aLz3
	 Sl25J7u716GwQ88/AFiBJYUO5dIH8u7lpd/+5PUnDHM9yU5XeWueqH33sc3/hh3czRttu
	 n2CUywNa3A0BFps6Apal2VBDqkAcNRH9ue30asZcGrVEIoiwNKQO/tD7nlh9XegDbExdo
	 k6qbLcH8H4b1WvuJSRN5BAlX84ygTvVCTUL/Wd8OJHYCyNUfumf5XiQvKrY+UqRgggTvN
	 /3ZOcB19kexCz1A5UVYpcvL8XRADQEvzHJ7LnbIyHiON10wM+f3bs7SQtVJW1SvY6Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gWkUhUFU;
	arc=none smtp.remote-ip=95.215.58.235
Received: from mta1.migadu.com (out-235.mta1.migadu.com [95.215.58.235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAF1606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CAF1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gWkUhUFU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FW93I9g2tFhlVSvMbZvJhIsiJI9bo4PZOSNREMcmxDA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792964928; v=1; x=1793569728;
 b=gWkUhUFUyP2n9w1XqfxuzV06+ZqN3YN+wNJCYBrB4HxP5Nwf4YoA/Ifr7LPlYyKV633fnYzN
 ZQA0k94WlZsm0a64RNpARKHYrHVnMTF+ivYvmRNLgLaeOBang+tBO6hINmNWwGhQVq7MrwtftlD
 8ilzZwtbnrH9kXJ2kDI26e2M=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e5eed0b9c945e22a;
	Sun, 25 Oct 2026 21:48:48 +0000
X-Mizu-Trace-ID: e5eed0b9c945e22a
X-Migadu-Flow: FLOW_OUT
Message-ID: <e865f7f0-087c-4fe5-b729-6e6946cd20f6@linux.dev>
Date: Sun, 25 Oct 2026 15:48:43 -0600
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
Subject: Re: [PATCH v2 1/2] mm/huge_memory.c: skip zero-page remapping when
 underused THP shrinker is disabled
To: Barry Song <baohua@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Yu Zhao <yuzhao@google.com>, Xu Xin <xu.xin@linux.dev>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Usama Arif <usamaarif642@gmail.com>, aarcange@redhat.com
References: <20261025-b4-ksm_fixv2-v2-0-8b61ad0491f1@linux.dev>
 <20261025-b4-ksm_fixv2-v2-1-8b61ad0491f1@linux.dev>
 <CAGsJ_4zUVpBJazRxc1CzN6u5XvpUaGnaf-_7JMz-rGK_ZTYMtw@mail.gmail.com>
Content-Language: en-US
From: Nico Pache <nico.pache@linux.dev>
In-Reply-To: <CAGsJ_4zUVpBJazRxc1CzN6u5XvpUaGnaf-_7JMz-rGK_ZTYMtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/25/26 2:28 PM, Barry Song wrote:
> On Mon, Oct 26, 2026 at 1:40 AM Nico Pache (Red Hat)
> <nico.pache@linux.dev> wrote:
>>
>> The zero-page remapping in __folio_split() was added to support the
>> underused THP shrinker. When the shrinker is disabled via
>> shrink_underused, gate TTU_USE_SHARED_ZEROPAGE on split_underused_thp
>> to avoid scanning subpages for zero content unnecessarily.
>>
>> Suggested-by: David Hildenbrand <david@kernel.org>
>> Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
>> Signed-off-by: Nico Pache <nico.pache@linux.dev>
> 
> is b1f202060afe a correct fixes tag? as
> commit b1f202060afe has no even "split_underused_thp" there.

I believe so. IIUC these two series were merged together. While 
81d3ff3c6f7 introduces the toggle, b1f202060afe is where the behavior 
started.

I guess you could argue that the Fixes should include both?

Not entirely sure!

-- Nico
> 
> it was introduced by 81d3ff3c6f7 ("mm: add sysfs entry to disable
> splitting underused THPs").

