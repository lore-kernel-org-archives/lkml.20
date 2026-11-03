Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793700200;
	b=BnsZL+HlRxVSFXvLtLtou7YJ6jChkI6sEhUVus/+X4BZs+kqKUuBMzJsYwlgDVusN2pK
	 HTX84Bov0+pZWJAfi3se6yBdze5pzZ/feiyVlR6PLlQMyr922FeiKVtFt5QNMeoQitKGn
	 GPjigjIoaNcNBLZFBGBLz21z0tQX4CirXXDD/m0n0dvPznMAdO4iL1py5JAemnet2dnpa
	 dU9qW6VTjFVwTsqxLD+sw0KAXxiGm4yZ614+/nIrf0MwBV1wwGGcog49otnpWnGIdHZb6
	 CdbnPhAJxrQvBlmR31cT5OldhIIDVXgcB62DhyqeP4ME0djtjrG0I8zLXTJi6YW5YSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700200;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Organization:From:In-Reply-To:
	 References:To:Cc:Subject:MIME-Version:Content-Type:Content-ID:Date:
	 Message-ID:X-Scanned-By;
	bh=OTEmd9f41wMG+18kcGlnpl8UhbldgzXmqe8LN0msAw8=;
	b=lsKEHNf7cUXbN3m3YMieKEy2vFvHfWUklBjTwFDyLMlsT4NW60XwVOf3xeicFG/bGIQ1
	 P8od/7irxa41IZYcsaH6Sb5TYrN1uqbLZxjI6awpZ8MnRg2THz8jNMVGRjRXGgiVlscwj
	 heGSvBMup78BNVYIuce8T2gQfuch2erF7I5P+PzS2madyQMYJJ96of78hsD6U4SwV0+Lq
	 pQEQXuqMVhtopu7klBTEddKBNlnAIxlaTSobAvOQPckY4jHy/GpWpWICeK8aEZ4LosDyj
	 m0Hl3r+ph1Rnsy2VgZESrovav7Q0eK54BIb562jmIWtaLKLDv/8E9MQpt9NC568k4jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AatHd+zX;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ADA606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86ADA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AatHd+zX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793700198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OTEmd9f41wMG+18kcGlnpl8UhbldgzXmqe8LN0msAw8=;
	b=AatHd+zXxj5lLwDbtDeY1NrMTqI3sXjSquyiGeyBaGyQxpGkwW4OBXwuTHDQpoO6K+GJLu
	IkejeghODfuSEqliN6r8i0+rkhOXU807VBEuGGyqdwfg0mw2Ipj7F3+3NQ+GmG1l0awucG
	fe5Fo/FS7liJUGQRNglFowzVQomp4vg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-271-bVG1b6y6N5y4cdL06X-BMQ-1; Tue,
 03 Nov 2026 05:03:15 -0500
X-MC-Unique: bVG1b6y6N5y4cdL06X-BMQ-1
X-Mimecast-MFC-AGG-ID: bVG1b6y6N5y4cdL06X-BMQ_1793700192
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A20DB1955EA1;
	Tue,  3 Nov 2026 10:03:11 +0000 (UTC)
Received: from dhowells-thinkpadp1gen8.rmtgb.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7D029195608B;
	Tue,  3 Nov 2026 10:03:08 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20261103030226.2685251-1-jarkko@kernel.org>
References: <20261103030226.2685251-1-jarkko@kernel.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, Eric Biggers <ebiggers@kernel.org>,
    linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
    keyrings@vger.kernel.org, Roberto Sassu <roberto.sassu@huawei.com>,
    Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
    Eric Snowberg <eric.snowberg@oracle.com>,
    Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
    "Serge E. Hallyn" <serge@hallyn.com>,
    linux-security-module@vger.kernel.org (open
                         list:SECURITY SUBSYSTEM),
    linux-kernel@vger.kernel.org (open list)
Subject: Re: [RFC PATCH v2 00/11] KEYS: Sanitize the garbage collector
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
Content-ID: <641293.1793700187.1@dhowells-thinkpadp1gen8.rmtgb.csb>
Date: Tue, 03 Nov 2026 10:03:07 +0000
Message-ID: <641294.1793700187@dhowells-thinkpadp1gen8.rmtgb.csb>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Jarkko Sakkinen <jarkko@kernel.org> wrote:

> The first change has user space visible effect: rmmod semantics will change
> from always succeeding into returning -EBUSY when keys or restrictions have
> the LKM pinned.

Please don't do that.  That will cause the AF_RXRPC module to get pinned in
place by outstanding connections that haven't timed out yet.

David

