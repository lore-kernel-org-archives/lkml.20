Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792716940;
	b=jv77odyL7VIczJHtj049Yr9tIZqNHkQKJbRsN1FBNW3KxYITvPfmcA+BC82WeyqvZrIr
	 iB5McXbutukT0Gz0yGfoJrG7Spcv2m3NWhgRDY50C3DqGaJYARIW5NCbpl7rxys0PEZt5
	 uA+kXpuXixhFiM/+OIL2Vuv4tNdLs3OJZWqNKfklcm86osYZD52a3hHP/FcXg2Dju8vww
	 wQNO2pxCtPGCdx/JcFxCObc09EzCpFDOrF6W+VRyVRigDyrIEUZWAZ8A70PwWuZX99O5b
	 ZUNUCGeth1qX4cuNpIAKlgHO3+jyQ53oimA8rCJr7k40MeEtSPg/xwdHVay0hnBqXmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792716940;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WQcd0l67AxhO8WSZviozv+Pddw80RChcSdimzj7mciM=;
	b=aoHdzrRJyPYESSIFsqqcAm/rJLK7XZUFJq5cDFB8DQcYnn0NAHB0UwiKe59YrLLQVoVP
	 HUL+4rSqSwNoa9+pHzJeinj5beptOSu5dvu1ORzXci527LFmV24vsR3DZsF2ubifzOECs
	 ari2kBcoyvHMABK/zwU5zHiiPF6Mb8nJuQLiRyiq3Ou7N7JbJ2vej3yKg7f7JPYAOCJoc
	 yEwVHLi5L4sbJ2S1laiJHy32mBovH251n6mAStbcdZjrD7ST3mBgbvrehImoJlGxzgcnW
	 qYTqt1dAJ7EF+aWDEfRVI6f+igwFx9FjoFppLm7cTqCiuv+LTgasTUgABpbC25q73CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a6CBw2n2;
	arc=none smtp.remote-ip=95.215.58.19
Received: from mta1.migadu.com (out-19.mta1.migadu.com [95.215.58.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D7E606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6D7E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a6CBw2n2
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=e2fjOiLeTWrJYYpS60xcbzkTmUkNJmvgx/KCtZ72os0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792716936; v=1; x=1793321736;
 b=a6CBw2n2L5svXcNXVxtRaqzX2z6L+DOaY5/huwtiZ1P1LX3xBGlYYaTE8SZEPvmAkbRfj935
 ON0MXmOZxU0H+FS38Uxionx55+UxyHKmdGZdFJNTaUTLaOBDGvbfxYeyojI3L+H+VS3sD3+rFjk
 dotOc2UpUZhUisAI59UtmG5M=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0f9dfc49a1afc88e;
	Fri, 23 Oct 2026 00:55:36 +0000
X-Mizu-Trace-ID: 0f9dfc49a1afc88e
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
Subject: Re: [PATCH 06/12] mm: hugetlb_vmemmap: rename vmemmap_remap_pte() to vmemmap_optimize_pte()
Date: Fri, 23 Oct 2026 08:55:26 +0800
Message-ID: <20261023005526.20560-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261020115824.823278-5-songmuchun@bytedance.com>
References: <20261020115824.823278-5-songmuchun@bytedance.com>
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


On Tue, Oct 20, 2026 at 07:58:18PM +0800, Muchun Song wrote:
>Both optimization and restoration update vmemmap PTEs by remapping them,
>so "remap" does not identify the callback's role.  Use "optimize" for the
>optimization callback to match "restore" and make the two directions
>explicit and consistent.
>
>No functional change intended.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
