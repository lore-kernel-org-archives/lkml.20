Received: from mailrelay-egress5.pub.mailoutpod3-cph3.one.com (mailrelay-egress5.pub.mailoutpod3-cph3.one.com [46.30.211.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E10F3D75C2
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792228337; cv=none; b=CaK3tGTDF4XXS3PakRwNedNkticdFfCRUalAiMuiPXsn6OlWAcc5rOz4s37Gp9jdgvkxuYA3AQjydpM93wKVhaXq3jUlwxAuEilpxQu5pgJfwdux0vBq8CyIyp2AbIp7X2QPYeeBbziyFPzxGN2tXBwsTHH6QgNQfmAqrTFP0zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792228337; c=relaxed/simple;
	bh=2t7pKGKUYwqXfjKaI64MZzmpsLIS8lyb3nB4PZJN9+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ecpsSeA8+6h4RPQV7h32vMl0dB8PqvK1tLVfgDgOzZZl9e1furTdn7Vwlowr5i8+7VCvjv+oDH456htIM8tOYV4VGEmhH5GNhNNXloysVpMjLg3ffhXAnOP9CB6HsZ865rI9NZLZDRE5UixkcW132D5Odc7MzDcmD85NTKaqGmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=fDfiYByx; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=Pqd8QaO2; arc=none smtp.client-ip=46.30.211.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="fDfiYByx";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="Pqd8QaO2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792228324; x=1792833124;
	d=konsulko.se; s=rsa2;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=UU3pr7YlPujtztfaD5rEaSu3Gsw2VOPeWtM6bSVkPs8=;
	b=fDfiYByxn7BKxdtzcZP0RauvFkLWvt3oaWHOmoJ3kaB3ljcKi5MNUqAsLi+DPEgMD3PlWDOJeeH65
	 mzORubIgvS/ur80grURXjG5BuDfXb01cEqzVSrHJoANR9FWEZeDDTlic61ysbunIMUEUcDJ6bD09CK
	 JEpKmorhpfgSUhAl0tzZb5RnbpjqH6EpUzeyruRHcXbV/n41zqSeAIGPC10+yIOQKMYipBGQyS9/t0
	 HdgePQQ2qINzHz1bAHo4Mbtj2q7+bLxnhM8aXvvyChaXOLnIh6GtmZ6iqpnd+1ggSEzHg2gvN8E91K
	 JlzV9Y8PpeBOWMLTr4UJ1/xi30YI2ig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792228324; x=1792833124;
	d=konsulko.se; s=ed2;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=UU3pr7YlPujtztfaD5rEaSu3Gsw2VOPeWtM6bSVkPs8=;
	b=Pqd8QaO2poBfgaYIAQczbKMpKMUWowQreCw5yPVWOLhhNPk1Q6AMk9mVYP3opIDkRr5WDGBPPTyYQ
	 UYxBMW0Aw==
X-HalOne-ID: d10c5096-ca0a-11f1-b1da-7d3e33f7de26
Received: from localhost.localdomain (c213-102-77-204.bredband.tele2.se [213.102.77.204])
	by mailrelay1.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id d10c5096-ca0a-11f1-b1da-7d3e33f7de26;
	Sat, 17 Oct 2026 09:12:03 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: Christoph Hellwig <hch@lst.de>
Cc: Harry Yoo <harry@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Roman Gushchin <roman.gushchin@linux.dev>,
	David Rientjes <rientjes@google.com>,
	Christoph Lameter <cl@gentwo.org>,
	Hao Li <hao.li@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	vitaly.vul@partner.samsung.com
Subject: Re: Re: [PATCH] mempool: optimize mempool resizing
Date: Sat, 17 Oct 2026 11:08:02 +0200
Message-Id: <20261017090802.1423681-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261014130301.GC15407@lst.de>
References: <20261014130301.GC15407@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > Imagine you have a mempool with 10000 elements, and you have to reduce it to 3000. Then
> > if you at some point want to go back to 10000, you'll end up reallocating the elements

> Who is "we" and where is the code?  This is a highly unusual, not to
> say most like broken usage of mempools.  If you need changes to support
> such a use case you should include a link to the intree user (or bundle
> it with the submission of the new code).

This situation may well happen in the block layer (zoned). The numbers will
be different but they were arbitrarily chosen in the example above anyway.
