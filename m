Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793419288;
	b=n4DnCoccydp0odt4EVab/ytlPgnjWtk6xjNheBHtNWbQU08Xt1I0mxJ7/DVTBhvZgSjp
	 goW8qnwqWqZDAjlcSsJdHN9jCnD2dADj3kgoSD1qXnL2hMzp7E3HkpjrwlrA4+tdE44oN
	 FUFdzfNzjBg3ewmZBGpKT06OzMSn1PLtunVw9T0IfqdCm/zmDxV72T0gAmMLQwNNuC5xP
	 /cmW39qSLY5vt7dlXUg3FXJrFbILOUtA2GesGLw92VkljX/LHzN6psmtbOIBcmdsod7df
	 1i7RH+YBF6pNaBdv3NL1CNIi4/YOn99vyq2qzDKZM1zyGyaiY0YsmmQDNgJToMrjJoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793419288;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SVfa0gIfJ0mFFHTR1txtm9nrtHNlGhjBAfd3nh/ZFDo=;
	b=kx5JXNE3MjSVRhf/dQg+L0TzCMKlNZwD+CQ/hYO/2Bxpbrh3/HvIbcYuVBvPqp0Jxft7
	 IwyLfZrPJ6uDARdKSTlwiXf0c6awFmGY216/38EAKGb48o2A1FeRfm88Z+2T1yXPN45oC
	 bzbWtNhVm3wAnVEENcYAm743foc3KWhIIK4B3YmSXMQz24QOpL1+W2RhdgWxNkfyUIKIE
	 R3ulK5IviRwE4aAhNOuiom9OxuNxy8h55GWp1eFHuEP3ykk/BvcBhFmwl8ckS1bTG9+Xg
	 47WpVuARDpm3uz0PHODkCPaSzS9Aa6Qb5/ba6wIGrRSPeCwYsLUZxI1juv862eeEVYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="ME/E9smf";
	arc=none smtp.remote-ip=91.218.175.9
Received: from mta0.migadu.com (out-9.mta0.migadu.com [91.218.175.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD53F606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD53F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ME/E9smf
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XfEaAPgAHtnFtcCOsY1hz9YOxl0K/jzQz3+QJgV86BY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793419284; v=1; x=1794024084;
 b=ME/E9smfnqc3VhfPxpLpOIMFEZ9+HuzSrewiJmPQlI/Mrf7qI/IwjcHzcYxyHGXpBrMAHrgM
 lgOmzHNlCudQtntnDt/THr+8520JTCwJKoHS72MUnMoE5OATYa0fc/rbCKUtwx0PJlfl3LdhlVK
 UJUZTLll9FYApsN7tQwHcWls=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 31186c4904888d22;
	Sat, 31 Oct 2026 04:01:23 +0000
X-Mizu-Trace-ID: 31186c4904888d22
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org,
	ziy@nvidia.com
Cc: apopple@nvidia.com,
	akpm@linux-foundation.org,
	aneesh.kumar@kernel.org,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	brendan.jackman@linux.dev,
	byungchul@sk.com,
	chengming.zhou@linux.dev,
	chrisl@kernel.org,
	cl@gentwo.org,
	david@fromorbit.com,
	rientjes@google.com,
	dennis@kernel.org,
	dev.jain@arm.com,
	gourry@gourry.net,
	hao.li@linux.dev,
	harry@kernel.org,
	hughd@google.com,
	jannh@google.com,
	hannes@cmpxchg.org,
	jhubbard@nvidia.com,
	joshua.hahnjy@gmail.com,
	kasong@tencent.com,
	shikemeng@huaweicloud.com,
	kas@kernel.org,
	lance.yang@linux.dev,
	liam@infradead.org,
	ljs@kernel.org,
	matthew.brost@intel.com,
	linmiaohe@huawei.com,
	mhocko@kernel.org,
	rppt@kernel.org,
	muchun.song@linux.dev,
	nao.horiguchi@gmail.com,
	nphamcs@gmail.com,
	npiggin@gmail.com,
	nico.pache@linux.dev,
	osalvador@suse.de,
	pfalcato@suse.de,
	peterx@redhat.com,
	peterz@infradead.org,
	qi.zheng@linux.dev,
	rakie.kim@sk.com,
	riel@surriel.com,
	roman.gushchin@linux.dev,
	ryan.roberts@arm.com,
	shakeel.butt@linux.dev,
	surenb@google.com,
	tj@kernel.org,
	urezki@gmail.com,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	will@kernel.org,
	xu.xin@linux.dev,
	ying.huang@linux.alibaba.com,
	youngjun.park@lge.com,
	jgg@ziepe.ca,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 3/7] MAINTAINERS: add Zi Yan as co-maintainer for MEMORY MANAGEMENT - THP
Date: Sat, 31 Oct 2026 12:01:18 +0800
Message-ID: <20261031040118.53610-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261030-maintainers-v1-3-97278f8a5f54@kernel.org>
References: <20261030-maintainers-v1-3-97278f8a5f54@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Fri, Oct 30, 2026 at 10:34:27PM +0100, David Hildenbrand (Arm) wrote:
>Zi has been contributing to THP consistently and reliably over many
>years and is considered one of our most valuable THP experts. As THP is
>an especially active area lately, having a single dedicated THP maintainer
>is not sustainable.
>
>Fortunately, Zi volunteered to take on more responsibility by stepping
>up as a THP co-maintainer. So let's do exactly that.

Nice one!

Couldn't think of a better candidate to step up as co-maintainer.

>His placement in the MAINTAINERS entry is very convenient to perform
>this change :)
>
>Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>---
> MAINTAINERS | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 0baeb37b0dcdc..02b5b542f81ee 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -17817,7 +17817,7 @@ F:	mm/swapfile.c
> MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
> M:	Andrew Morton <akpm@linux-foundation.org>
> M:	David Hildenbrand <david@kernel.org>
>-R:	Zi Yan <ziy@nvidia.com>
>+M:	Zi Yan <ziy@nvidia.com>

Long haul, hard work, never quit. Fully deserved.

Acked-by: Lance Yang <lance.yang@linux.dev>

> R:	Baolin Wang <baolin.wang@linux.alibaba.com>
> R:	Liam R. Howlett <liam@infradead.org>
> R:	Nico Pache <nico.pache@linux.dev>
>
>-- 
>2.43.0
>
>
