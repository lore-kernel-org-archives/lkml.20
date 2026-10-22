Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678408;
	b=PpMrMFk2tWhKhky/GyZ7FHeFtLfebdChCKNiomB35mNdqZrV69hzxWLYoakWcZDdXNtP
	 piwEhAyuNw1K4jVtkkQz+hu1S9R2X/LNvZdushljJGs7RB6tZ2mM1SibgdDbH7i9GmHlT
	 ozRPW24M+Bng+qvM/zC2pskbWePfRc1ezO7hMG+vP1jQI5jTLIxk4vrlc2S5Vajm+7w95
	 YxesGw0IxA3YS3cHxb7deUaiAPHMyrn37EhLYA5xGBRk/FtZRlSR1ku8UKweC8TymD/WP
	 fO/MRFqAHyibq+uGt+tRlB84IvowBouyOSlWsuJjkI1z92RN1pRsLWqQ4goO6ERK2aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678408;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PdhZn7CyLLfXqOnmVKxKZBj/YTRaUhV2EDj2sHvGsgc=;
	b=uuCDRN0pAHiufbbbfuWQnJ97sYADMNzvkqOtFeCDQopjds3c2nIZLk72Qj8v/hygLj6E
	 a6DANXAtea8AKyD51MsaZSvl3Azh5T5fGqhMMJWnrWhBFaC4cjX6WniUcOeBiYzLzqIpI
	 fBi80izz+nudNlXTQIT8GMIQbdtZkv4l4zlYmlR6KEfdTmw4Hq0cHYgDyMQKIsAdoUqjF
	 d6a/0fBGEbQJRRMAr5K3lCt/16j2QCKeNHIDhZ+wfGVcWay8cci45KCzT3coaz5CT7yU+
	 xe8LDK9PVD7lbNMatYN816eOda+YwI/NEMFt71AkC1vs89j54NPotAGhhKtPw0FFryQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rVLy5bGW;
	arc=none smtp.remote-ip=95.215.58.153
Received: from mta1.migadu.com (out-153.mta1.migadu.com [95.215.58.153])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57417606A325
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57417606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rVLy5bGW
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8Nnmu8yc7fJqwqFKszkvhpTU7dkwk0e3GPEf/tKxENA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792678405; v=1; x=1793283205;
 b=rVLy5bGWIQnKiigfrx+5FAZm/0/HajZXg43AWqOEgOvbDkqrWdeTGy5BunxkxwKQ4sWccDdp
 0MtHchZToCdD2j8/jXzhZGt6cgwSQvwsXDqwnRL4yxGJpCxTzBYQz/W13NojaDGZnj07UACNRXl
 wfvwJ4mkR/RaBVh1o1KQjgM4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3ffcb66275dee17d;
	Thu, 22 Oct 2026 14:13:25 +0000
X-Mizu-Trace-ID: 3ffcb66275dee17d
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: osalvador@suse.de,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	lance.yang@linux.dev,
	jthoughton@google.com,
	david@kernel.org,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/12] mm: hugetlb_vmemmap: unify writable vmemmap page preparation
Date: Thu, 22 Oct 2026 22:13:19 +0800
Message-ID: <20261022141319.91913-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261020115824.823278-4-songmuchun@bytedance.com>
References: <20261020115824.823278-4-songmuchun@bytedance.com>
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


On Tue, Oct 20, 2026 at 07:58:17PM +0800, Muchun Song wrote:
>Installing a writable vmemmap page requires consuming a replacement page,
>copying the current contents into it and making the copy visible before
>publishing the new mapping.  HVO currently splits this sequence between
>the page-table walker and its caller depending on the remap path.
>
>Centralize the sequence in the walker so all writable replacements follow
>the same copy-and-publish protocol.  This keeps page preparation with the
>mapping update and removes path-specific handling from higher-level HVO
>code.
>
>No functional change intended.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

Was wondering if moving the copy into the walker could lose the optimized
flag, but it's already set before the walk, so it gets copied too :D

Looks good to me1

Reviewed-by: Lance Yang <lance.yang@linux.dev>
