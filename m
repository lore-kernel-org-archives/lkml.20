Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB0B4DAF8F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686351; cv=none; b=qckQSLSZbIYCAtBxBafFODYdKmiv9g9nrTbsfT2eLLo3/i7ItQCMoo2BBH3p2HtleOVHeAEmZIw8OoO5PAkdPvuug92AybI94cyF/zBBuKTksKZiOI1OPI+CSFb9mMcrUuzLYbvx3agWwd0dF4FAisJEMndXa21kwz4o7oBf9B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686351; c=relaxed/simple;
	bh=Z3kbtPEfllJjrVcxV4Wsk7nVwVhApu945emFW2VOZ5s=;
	h=From:To:cc:Subject:MIME-Version:Content-Type:Date:Message-ID; b=RB1wDXSGlGj62exLLOg5CEx6kNJiCdw0DOeydFBS71EvFVDdGep0j2C3B6L52XewtameiwKJtofKV0DyLH5p2mVKg6WcXhw+TGBdHfsD2Q+0MGdRljJA1QW5fWb1zYNpafQmzHl9xo99TzQFJ1XM1aOpbWrYPjz9aMrZYYp2Wz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KP2dAK5o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KP2dAK5o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790686349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=I1tT4w3UHin/AieBETFD0ZCHCtjCAxTz0zUFSdGN+NU=;
	b=KP2dAK5onvvddkS+d9DlMflS++OStL86E6mThZ6uefZ7RXje4I1oHbp2PfJnYPfrEdmFN6
	DuG3IykUwIb8eWmbnkbyoq8zjXsE3AhZPia8GQELF6jGO/qxBcvUkgO2NHHz73xyJ6th1u
	ozzbqaaDEnG1oHAWzOGhTMVU+L9hGTU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-204-n9oqEOOHNASfTz54GBFy3w-1; Tue,
 29 Sep 2026 08:52:28 -0400
X-MC-Unique: n9oqEOOHNASfTz54GBFy3w-1
X-Mimecast-MFC-AGG-ID: n9oqEOOHNASfTz54GBFy3w_1790686346
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 93C871964CE6;
	Tue, 29 Sep 2026 12:52:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.32.54])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1C4E430000E4;
	Tue, 29 Sep 2026 12:52:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Matthew Wilcox <willy@infradead.org>
cc: dhowells@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
    Christoph Hellwig <hch@infradead.org>, linux-block@vger.kernel.org,
    linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Folio-related bug in __iov_iter_get_pages_alloc()?
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2810984.1790686342.1@warthog.procyon.org.uk>
Date: Tue, 29 Sep 2026 13:52:22 +0100
Message-ID: <2810985.1790686342@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hi Willy,

I'm looking at __iov_iter_get_pages_alloc() and when it's extracting from an
ITER_BVEC, I see:

		for (int k = 0; k < n; k++) {
			struct folio *folio = page_folio(page + k);
			p[k] = page + k;
			if (!folio_test_slab(folio))
				folio_get(folio);
		}

Isn't this wrong?  You can't assume the page you're looking at is a folio, and
so you shouldn't use page_folio() on it until you've checked what it is.
Granted, it's quite likely to be a folio, but not only could it be a slab
page, it could also be a randomly allocated page used as a buffer, a network
receive buffer or something allocated with a fragment allocator.

Can we actually safely use folio_get() with all of those, or do we need to use
get_page()?  (I know, at moment, get_page() is a wrapper around folio_get(),
but that's likely not to remain the case).

David

