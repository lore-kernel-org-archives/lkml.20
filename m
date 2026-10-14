Received: from mailrelay-egress5.pub.mailoutpod3-cph3.one.com (mailrelay-egress5.pub.mailoutpod3-cph3.one.com [46.30.211.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A8C1FC0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967778; cv=none; b=npXU1rELS86Ye/5YKRjVDB3c61MFMEz2UsPCNkaPghdZwxAE6RBsCUVmQnHo2qe81BsbqWuhnHqyw4ZflHfycMevBJnQulaEmkdwxnuwMpoIMh+HWWhsXPuT/xMk7j6/0lnav7Zs/Obgdv1YeWYB+foqXhEReZUWS3oINrCflg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967778; c=relaxed/simple;
	bh=MWCkujr8hLFgbZbKuvlWlIRSrlh/AtHwsryCdkhc2u0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qme608s/zqgUKvdA0rBThsk85lxjvSQam+qmOVay0Gox14lvGH0i82F+7oeYivVSs9NF2BMqfJCxils9++AC6n+1sdPzwpc76HVrn3erYO3FqrqeVD6ZTHUin21CaLSpgRcEaL8a5M+vmeQvrP4PvVtH8hpw98+J39TmiO2fhRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=LkEOXQud; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=bIbav1bI; arc=none smtp.client-ip=46.30.211.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="LkEOXQud";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="bIbav1bI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1791967769; x=1792572569;
	d=konsulko.se; s=rsa2;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=7DJ/UGFLzwkNS66PIQWaKVeCgpvTQiAHc2IYYxMeEEk=;
	b=LkEOXQudpR7YBHQNagzX86LoHvGegnuJ1Gu5RxUEDhlcBxxo2s/sZP012YrJf82F33vj+vLXZLALU
	 8sGt2U6V6Pgpx0gH1eypu34WzANOq/GTujeADsvXIdjkSl4iuWRRk4SZtX7oUvSKWUBNRE6CoELquI
	 NxqJAMJ78sQgBL98jTCjE2lxLHua9lY+31HlbmWYl8Hk0h+b8IyrON2ultRuJGX56Xv93E8wKcpqHQ
	 TsvAntC3wPRflAQdRRZY2DYttNCuRMGXLUGyYnunJnjHKB4sCMuRYbnIn/D11CI+TrlObmsWAZsYgL
	 XTipH9IhT7K5IoafI6soKSSeXvkpsBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1791967769; x=1792572569;
	d=konsulko.se; s=ed2;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=7DJ/UGFLzwkNS66PIQWaKVeCgpvTQiAHc2IYYxMeEEk=;
	b=bIbav1bI0PGlwbDa+he/557iLLxhcswMt8jNeVjOCL17i2zBnInehWQq1n9276Fvc+U0QQy6NMPf8
	 8bV1vlWCQ==
X-HalOne-ID: 29a8c86c-c7ac-11f1-9ee7-310a91e02fd3
Received: from localhost.localdomain (c213-102-77-204.bredband.tele2.se [213.102.77.204])
	by mailrelay6.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 29a8c86c-c7ac-11f1-9ee7-310a91e02fd3;
	Wed, 14 Oct 2026 08:49:29 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: Harry Yoo <harry@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Roman Gushchin <roman.gushchin@linux.dev>,
	David Rientjes <rientjes@google.com>,
	Christoph Lameter <cl@gentwo.org>,
	Hao Li <hao.li@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	vitaly.vul@partner.samsung.com
Subject: Re: Re: [PATCH] mempool: optimize mempool resizing
Date: Wed, 14 Oct 2026 10:45:28 +0200
Message-Id: <20261014084528.1280968-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261013091408.1231786-1-vitaly.wool@konsulko.se>
References: <20261013091408.1231786-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> I think this has unresolved feedback from Christoph [1] and Damien [2],
> so adding them to Cc list.

> [1] https://lore.kernel.org/linux-mm/20260626042252.GA7997@lst.de
> [2] https://lore.kernel.org/linux-mm/9104ac5d-ed2b-409d-8220-512dd4581966@kernel.org

The first version of the patch was changing the API and the behavior, this one is a pure
optimization that is transparent to all the mempool API users. Therefore, the feedback
from [2] doesn't apply to this patch at all. [1] is answered below.

> On Tue, Oct 13, 2026 at 11:14:08AM +0200, Vitaly Wool wrote:
> > Resizing mempool to a bigger size currently requires a new allocation and
> > a data copy to a new larger elements array which doesn't go well with the
> > idea of having a fast and deadlock free memory allocations during exreme
> > load.
> 
> Please elaborate the problematic scenario more in detail.
> Have you obsesrved the problem in practice?

We are using mempool to store a large set of preallocated rather big buffers. In case
of memory pressure we'd call mempool_resize() (via shrinker callbacks) to reduce the
amount of memory occupied by that set, and when the situation stabilizes, we'd go back
to the original set again.

Imagine you have a mempool with 10000 elements, and you have to reduce it to 3000. Then
if you at some point want to go back to 10000, you'll end up reallocating the elements
array and copying 3000 pointers, which is in fact totally unnecessary becase the array
can still hold 10000 elements but the mempool implementation has no knowledge about it.

Setting mempool to the max from the start a) doesn't help here b) is exhaustive with
regard to the memory usage.

~Vitaly
