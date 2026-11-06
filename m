Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959785;
	b=Z0Sfqbw/yrFDbbccFM9js5FsZgF1wazQYZ4Lo2P15GoekGuu6W7y7oKUGfO6ni7L4dvM
	 KCs026sdHzst+pjQUkHUuOyJpYWYY9m60J5BKnALYXy89omympRYYPx4ZJxIOZ9iEU81f
	 D/m6hjUwFe7v/calTVGPA1CB/Q5f9zgUXcJcr8Q4HTo+TtKOEnrViWXgH01xtRTpQqtqj
	 VTkvSE5QlpyRldoYn0kjNw93X3pTKMpTwhqG1dvxSCg5ZGouKYqnnAjqp67SBeaw4FhoC
	 SwkDEmB3PmffQGuujwXfqW+XmkXsNxkOp6dinjY2IsFcQ9DCP6Tkr/YLs6XsTM+5k4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959785;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=S8nYPHZ5sRm7H2t5xmzRj8iBg0Moiw8TSdKlr7ve9cg=;
	b=VICtuSR9kHnwx31o58K6Tu0yArn+EXAkyYFnH9Oj0J5Uwx4CHUvN3U9ta+o9d8JJJb0J
	 F0UYIjgnlLi68XNCTJXCD0xwdlIH59vBZA7F9U0+wbcpPwUW1oZz+4NbNozaqN+oM0lR6
	 tO4Nh2jR22UQjjauQvBOFsftYqSVZOagI2G0kxaoF8pLwaPG8Ozyron4HKKk3/Ydq1AAy
	 autnJg4lQipamfHRFN28r6r20ju/tfl5z9I08fY2AFh1YJe2alrW9WW1yypsFXK81sAms
	 HFSS6oc/ydr38KuVFEX2vZyBjxnjG9klI4cCyUW1Y96NZsQUn+UrkP6Q2XIffWDcTww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87932606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87932606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jLZfH0c5MzBpFyL;
	Fri,  6 Nov 2026 18:09:27 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jLZfD3NTjzBpFyL;
	Fri,  6 Nov 2026 18:09:24 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 550BD308158A;
	Fri,  6 Nov 2026 18:08:46 +0800 (CST)
Received: from ws.local (172.25.64.90) by cncheex04.Hygon.cn (172.23.18.114)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 6 Nov
 2026 18:09:25 +0800
From: Zhiteng Qiu <qiuzhiteng@hygon.cn>
To: Ying Huang <ying.huang@linux.alibaba.com>
CC: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Zi Yan <ziy@nvidia.com>, Matthew Brost
	<matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul
 Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Alistair Popple
	<apopple@nvidia.com>, Xin Hao <xhao@linux.alibaba.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm/migrate: don't batch the TLB flush when there is
 nothing to batch
Date: Fri, 6 Nov 2026 18:09:17 +0800
Message-ID: <179395975709.1235605.1971486611419119070@hygon.cn>
In-Reply-To: <87zevmwbaj.fsf@DESKTOP-5N7EMDA>
References: <20261106041628.1177963-1-qiuzhiteng@hygon.cn>
 <87zevmwbaj.fsf@DESKTOP-5N7EMDA>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ClientProxiedBy: cncheex06.Hygon.cn (172.23.18.116) To cncheex04.Hygon.cn
 (172.23.18.114)

Hi Ying,

"Huang, Ying" <ying.huang@linux.alibaba.com> writes:

> IIRC, after commit b99a342d4f11 ("NUMA balancing: reduce TLB flush via
> delaying mapping on hint page fault"), we can avoid most TLB flushing
> caused by do_numa_page().  Could you check why it does not work?

Thanks for looking.  b99a342d4f11 is in effect here: on success
do_numa_page() returns without rebuilding the PTE, so the PTE is still
PROT_NONE when try_to_migrate() runs, and both the batched and the
direct unmap path should skip the flush because pte_accessible() is
false.

The numbers disagree for the batched path.  On the same workload and
setup there are about 200 TLB shootdown interrupts per migrated page
with TTU_BATCH_FLUSH, and about 13 with this patch applied.  So
something makes the batched path flush where the direct path does not,
and I don't have the answer yet.  I'm instrumenting the unmap path and
will follow up with data.

Thanks,
Zhiteng

