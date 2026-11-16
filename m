Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794804047;
	b=pPBFS0AaV+ZIj2dzZ34hi8mNtlnwA0SRN0RwUSyY65dQLm8l8V56+qimGX5GaWYju0ty
	 quX4BJWWogomhf+ho+z5mN1kFNwKKb+nnS2HWOWS5UJMHl8igHh/D7kRIrCqelLPsHUsz
	 gwuNSDTQowT9FyALZEnlS4x+s+r1BfXP1lzjPm6b4UIxEk6v0wutjBEVt409qmMpwkEQM
	 WPetKMPl7Ly+5EIlcHcOBMUSOnEWHzFeX8Jfuzax/3aic76fRXkrrLO6c01hPb14XMnos
	 rYWfZYrLaRR6pJzX2cdls4EQMnBdtnwuQyzAyB1GADrGUFMXUHpsJVgmKL7qeH9CGWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804047;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lowWXPPa6IhhrsA8lYkt58nukDSxiG64mEXkGZf5zlQ=;
	b=xMH+PCDYyCZeGjQcFtlMmlAhGcLmXv2rkUCCflAolv/QxINplHH3D7sYGuP1+1VPUVeM
	 ZBUu9cMsW9ZD8Oosh+6kbXeqEYyyzMhQIWCuUot/RsGgp/8ydfCQJ2lgsNVylwCi77isE
	 +4jizb4z7xb8uFNKVREHzb6O7qMUgCHmYwCcgYDj31Tgb1/twdCq58CYzV4YvPUp2JIAe
	 QxMB+w8+s9Dlw3eLsoWn0dVxwo9WfI619dJsR+qXXWYVgVxPRuyedvC/CP/bmX/2KL6xE
	 yIfQ6z++zebm2n33xh6ATURWmaOjrsAYniUbyjPM2y116IPkBksbAYLa53+W9t15M0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="oigd/Phg";
	arc=none smtp.remote-ip=95.215.58.73
Received: from mta1.migadu.com (out-73.mta1.migadu.com [95.215.58.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB34E606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB34E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oigd/Phg
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wkYROWez3KV9qDm5oG/7+0bZbBndD+X98UIdC3VnWrA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794804043; v=1; x=1795408843;
 b=oigd/Phgsyk4OdqUgWyH+NzqwVgcNesOTcLQHok640M6/nfd01ErO4WGRF+dS7lOAIrNOeZI
 Xgjtrd2Sb/rhrs9hN7fI6vkBWztPRJXdqEZb9EedrtyXDB6r59mKKhQxO2COvc7xn+4v/gAeRsk
 p+E4iNTKznE8274Y8ogswcQc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 44426cc0f36867df;
	Mon, 16 Nov 2026 04:40:43 +0000
X-Mizu-Trace-ID: 44426cc0f36867df
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	osalvador@suse.de,
	rppt@kernel.org,
	lizhe.67@bytedance.com,
	apopple@nvidia.com,
	balbirs@nvidia.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	muchun.song@linux.dev,
	jthoughton@google.com,
	lance.yang@linux.dev,
	qi.zheng@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/14] mm/mm_init: factor out memmap_init_page_from_template()
Date: Mon, 16 Nov 2026 12:40:33 +0800
Message-ID: <20261116044033.26591-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261113033442.62970-2-songmuchun@bytedance.com>
References: <20261113033442.62970-2-songmuchun@bytedance.com>
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


On Fri, Nov 13, 2026 at 11:34:29AM +0800, Muchun Song wrote:
>From: Li Zhe <lizhe.67@bytedance.com>
>
>ZONE_DEVICE memmap initialization already uses a reusable struct page
>template when initializing compound tail pages.  The template mostly
>contains invariant state, but a few fields still depend on the target PFN
>and must be refreshed before copying the template into each destination
>struct page.
>
>Factor that operation into memmap_init_page_from_template() so other
>boot-time memmap initialization paths can reuse the same helper.
>
>No functional change intended.
>
>Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
>Reviewed-by: Muchun Song (ByteDance) <muchun.song@linux.dev>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
