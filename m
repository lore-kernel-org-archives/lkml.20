Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.253
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794287015;
	b=GvLEId/FEAG47NvetrGtH1L0t+D4bJn2Li5wFPjk0SeyJXBgF/ZG/SMn9sXS2RMbntqh
	 1jEk3mXFPwinT1eU3ssJ+Mm3l3v24WLwANta2+nPe72Li0gLS4k2FTlEjomFfbbE/bfsy
	 FMsKPf8pstTFVU9o6SaR086BtfqWcrNwraJEyPaIUgAHKcGJq2l+v26V/y/HoUisYXQCa
	 q45jQDkYRajZBz5bak5gD2CZJTxxcprixpfcmxgGvrEWaFpgNvtLC28xALYSSYku6M8pC
	 uc8rNOps72Law9gooeuBziW6HCkZY7c/0ScBJC22RFon3sVqFIoLfLEijiw3LLB3TgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794287015;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sgTYq8Z+zb/9G+ukAwbTsP6zjarbUmQuFNjBPBC3j9g=;
	b=3ez4E5DH34p3mXY9Rj/BVczt4jEEO/XXVKWAmdALTapULZD1bzkEXlFpEH294mmy3ypn
	 sYWBDmyuomQlPUUOjuq2HrwPcqkuEg945hCDR8efaaUmXnTahSMXFwhhxtzPkWweUharc
	 vXAZZ97Y4PH6htmzYj/z3+BF9nBIwW/LT04ULO+k5BJcatsl8sTK00RB6wYgKhsM7SgwL
	 qbPq5rjZgtS0HGBI8cACl/MhmAEvsXxEB0L4iiqwJ2iWNHHa9Kussa+9B++uKpmvib94r
	 0t7x3xnifmVoYBbL8PEhtaql59EwjG+FIYRpJhsbEt97AUxVXLLZJAHFVKRs7/39FXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cZcfx0qV;
	arc=none smtp.remote-ip=91.218.175.253
Received: from mta0.migadu.com (out-253.mta0.migadu.com [91.218.175.253])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CCC606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45CCC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cZcfx0qV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sgTYq8Z+zb/9G+ukAwbTsP6zjarbUmQuFNjBPBC3j9g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794287009; v=1; x=1794891809;
 b=cZcfx0qV+dEpYe5WAWec+0Thjmeu1uV8oS+V7CwBHB4AtgUChUF3rz6lKiYVoSLBYxPlCar8
 3EWvGHiIr85WGyV8BIp+vwsKz1t4oarkSXh8yT8MTeEMwZtibquZbVKJjUKrJ8xK0YlXnuAHkC4
 HGy1b1iOnTl5iarO6BKfOl1A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 77ffe16c7a4271bf;
	Tue, 10 Nov 2026 05:03:29 +0000
X-Mizu-Trace-ID: 77ffe16c7a4271bf
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	kasong@tencent.com,
	baohua@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	ljs@kernel.org,
	muchun.song@linux.dev,
	lance.yang@linux.dev,
	ridong.chen@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MAINTAINERS: MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU) update
Date: Tue, 10 Nov 2026 13:03:23 +0800
Message-ID: <20261110050323.88803-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
References: <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
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


On Mon, Nov 09, 2026 at 07:31:53PM +0100, David Hildenbrand (Arm) wrote:
>MGLRU is currently the only MM component without a dedicated component
>maintainer. Fortunately, Kairui and Barry have been actively
>contributing to MGLRU and have volunteered to take on more responsibility
>by officially taking care of it.
>
>Given that Kairui is already an established MM component maintainer in
>a related MM component (SWAP), add him as an MGLRU maintainer right away.
>
>For Barry, the idea is to transition him towards a component maintainer
>role over the coming months, starting by moving him to the top of the
>reviewer list.
>
>Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
