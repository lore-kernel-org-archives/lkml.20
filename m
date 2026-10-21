Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792563036;
	b=Sm741hwtH7jvWEw8yTb8jkBQicMpYH2XEZ3ecw/dgJ7jttgjpiGq618cQwXKrp/PWRAc
	 JWWkTGuFhkfN5PFagVwBekD5TONnLA3kNPJpgSloxLzH2q7ymLUmkB1Ed/YH8gU2Kgqef
	 to3Vp6lqXK+9r6O3yATD8B/GchCNCAjZGbOX5kqvYf7LJC5zPur8lAHwRRbIL3/j1GrB3
	 AQgPTAgdbrn9ES3Bn1veP50dooI6816OcCMWRxCex5Bdy6+0nTxOKDA2H40fSFzk2MSmJ
	 srVEGYAjzCNy6kz8El+AYCBpG/7PrPtinC8B6c+UaPvmLDOOcf0abbjylYgO51DXU6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563036;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Organization:From:In-Reply-To:
	 References:To:Cc:Subject:MIME-Version:Content-Type:Content-ID:Date:
	 Message-ID:X-Scanned-By;
	bh=GuuDOm0BjSie9cFo6lFAftu5W8QXWJ6WU57HDoPu4Ao=;
	b=eaLsEQzp2yv4Wf9p1Jv8DGwEcDObV3+YE5oIxd05cr10wrZ03c0loBBtVtsspAsmWH5j
	 +Gr0I8r7kvNQNB4rTEEvrNum5YrgbZEka0prhfdFrf1um2ngYS9S01RVwjF16sz3+UU9m
	 mWuwp1EZDjEZPKD3Qyl+KuvlViY4exI2AtouphzGk3QB+cS7UO6HbXc1AO55gNEGZ7miB
	 nvOtXkRfYsnk6UiJJboJEPvBfmYuyR0MnTDg/SRMfVlxclsTaENcrCSQK1/nalK0GcNU8
	 qmOSozKe/y5Po2XQ8S2YrdMdDNbgNV47o6Z+OaPlheOCf+aUJN10jRjBGZRlWghUFCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V1o046VE;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45A9606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E45A9606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V1o046VE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792563035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GuuDOm0BjSie9cFo6lFAftu5W8QXWJ6WU57HDoPu4Ao=;
	b=V1o046VE4H8sKvyEi8yvHpT9K2DYLse9QxDE4a93MyCxym0ntHeD/NIyxgxd3BcCThFS3B
	rdOXKkswjVCmWpD3VS3lb/e28/ADHXxeM+Ij2GN8jWWjtXa1T/Lm/4gJHhv65dKqaEsDHb
	CDQJg9EVHfLE173iV/9F/4hjEIWS/PI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-589-LqN27gqEOv-3PX80p2xKgw-1; Wed,
 21 Oct 2026 06:10:31 +0000
X-MC-Unique: LqN27gqEOv-3PX80p2xKgw-1
X-Mimecast-MFC-AGG-ID: LqN27gqEOv-3PX80p2xKgw_1792563030
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2D8EC1955F0F;
	Wed, 21 Oct 2026 06:10:30 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.48.29])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2DDFA1800446;
	Wed, 21 Oct 2026 06:10:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20261020201258.290827-1-dhowells@redhat.com>
References: <20261020201258.290827-1-dhowells@redhat.com>
To: netdev@vger.kernel.org
Cc: dhowells@redhat.com, Marc Dionne <marc.dionne@auristor.com>,
    Jakub Kicinski <kuba@kernel.org>,
    "David S.
 Miller" <davem@davemloft.net>,
    Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>, linux-afs@lists.infradead.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/3] rxrpc: RACK-TLP fixes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <311751.1792563025.1@warthog.procyon.org.uk>
Date: Wed, 21 Oct 2026 07:10:25 +0100
Message-ID: <311752.1792563025@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Note that patch 1 might better go via net-next.

David

