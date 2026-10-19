Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792447596;
	b=YukZeae0N0Uj/jG3Oe7c1AXKaKwAP5vTjePuszJpO0Y1bRHAqkLJlRos0JF/X4wQJnVa
	 83xCxFQuejjffWGFbRJZxUXQ/IYAjlYZxOUjXDkGDilfqgxnqi4pgbYCZzxBBanaQZIrk
	 se/86x7TcpNphUVa1eeKKg0z6IR+NucUmnrOcq66DTw2aDFGsUaZCSSuuApJHQRaOnf/f
	 Pp7O+m6OQr3Evi40hqMyVTzyz1hbIxfnO277dAoZfYwtOq0P/fRLWINfLrmsrNGt1oahB
	 TKhxyptXp75Zd6yGQtWEnLVnVT5+Kz4T8FJux1fTL82oLYhCea22g7/fpDa4TjNE+mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447596;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wIBD55LUoHoDATJCGVof+4CgALz8EVmNkMYBhtvyd6Q=;
	b=aHY+Pi7+GiY9iiJ7QLrcIBDg3sN7A4M58lEgS8Skp0A4jfOETVYmYxwKr/wkHZO2VMOT
	 w8uCAtYJUOjxsdY0hKDQLUD1gJ7D/JocU2tobCh64DC0vhZhv/yeR9XPZlvqFNZ/mFsj/
	 Z195Z88uTwEB19JDM0015E9IWFmmlGm0mWGO48j9TsbeaN0A6ya5jDBUEAMU9vhokCxRQ
	 RifrqzskPdx4fgj4a96iXkA29pClVSOguuTNFMLgvCvqn13LJnvX9GcMLoJ4Mzv4RyIuy
	 iyOnGbSZj7g2gM5Y2yCJx9Ak/KA+mlaXfO0R4WPouQY26qtamr950Cik3dBXCuBUUng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.12
Received: from mta0.migadu.com (out-12.mta0.migadu.com [91.218.175.12])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672D8606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 672D8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GhC0senqgW9jk2iZrX/Oeif4+RMjrpYmvR16vIm3Y84=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792447592; v=1; x=1793052392;
 b=RGd1WEcy6qUGkInqsO6UQsWxpSvK+GCUSBAFheBJNPOMDkx2Wm6h3ooFMF3h2XC9eBo1/JXS
 mGwIUxbHAIB1I8DpG2ajAUb0Kc/0FxArxX1xbPeubnS+lc1j6hxvD5faGh3cgPyTEupWpX3uNsc
 Z8FyFfQficBtcqQvYNYy4FcQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c4935393cb2a0c10;
	Mon, 19 Oct 2026 22:06:32 +0000
X-Mizu-Trace-ID: c4935393cb2a0c10
X-Migadu-Flow: FLOW_OUT
Date: Mon, 19 Oct 2026 15:06:29 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, baohua@kernel.org, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, baoquan.he@linux.dev, 
	baolin.wang@linux.alibaba.com, hannes@cmpxchg.org, david@kernel.org, mhocko@kernel.org, 
	ljs@kernel.org, dave@stgolabs.net, roman.gushchin@linux.dev, 
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/vmscan: reclaim every zone in per-node proactive
 reclaim
Message-ID: <ataUUbN1leyRVVQ1@linux.dev>
References: <20261019185002.3428594-1-gourry@gourry.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019185002.3428594-1-gourry@gourry.net>

On Mon, Oct 19, 2026 at 02:50:02PM -0400, Gregory Price (Meta) wrote:
> user_proactive_reclaim() limits per-node reclaim to
> gfp_zone(GFP_KERNEL), which is ZONE_NORMAL. Proactive reclaim serves no
> allocation, but that limit makes shrink_node() skip every ZONE_MOVABLE
> folio, so writing to /sys/devices/system/node/nodeN/reclaim never
> reclaims a node's movable memory. A movable-only node, such as dax/kmem
> or hotplugged memory onlined movable, reclaims nothing and fails with
> -EAGAIN.
> 
> To reproduce, fill a movable-only node with clean page cache and write
> 200M to its nodeN/reclaim: the write fails with -EAGAIN and the page
> cache stays. The same write to a ZONE_NORMAL node frees 200MB.
> 
> Scan every zone, as memory.reclaim does.
> 
> Fixes: b980077899ea4 ("mm: introduce per-node proactive reclaim interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
