Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424520;
	b=LueL6y9Sp2BMvcV49CKk2WJdhylG19PNUMXKRtsfOI/wOsx6KKIZTALTU6GDNIoP780S
	 YIdFCz8N6+ZYqphEYRkonq15K2U6jLuxyr/LFHAfEZ3efdNXksSOKJKTg9h9cyA1cl/GJ
	 Wv0p7XA05y2xJCFBrfGc3cFpoh/ITBIaZUpzjw1rGS+WiYmCAzyB7FftD7hudhKNUY9ho
	 PsATM+01795rNGbXk11NnGaQGttUFfNHjlLc3lUUhrg/6+D4YvlvLGdOpdsN2LVr+U3X+
	 oe8JLlIB04c12vH6v7SgxzfEUfPTAuhd8OJDCxo8pKTfNb1TSkHtzoYWV99a605nQDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424520;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Organization:From:In-Reply-To:
	 References:To:Cc:Subject:MIME-Version:Content-Type:Content-ID:Date:
	 Message-ID:X-Scanned-By;
	bh=NaN+mCZydYoju135pw7TWTUw+J0RdYin2G9nyjNDB/Y=;
	b=oADG+VGkqXCYuHcrz0q8z3XV4jX1C580PWPY6ZzvO72LKHbNg5oLDuV8i9zeolqVHQf/
	 +87/ZWA1s7aBTRtKukygwtzyDAqioAu6bJ3zf7kblyNH/zf46/KEeLSZf8QJ3KzKm+W0J
	 6PIg+8yAt/6AzQM7TUttWzIvV0+/5XMj8teZ3S7zqy7A6cEac9mdpzqcJEO7gd1IG/mth
	 60dI8yKoCWIss6puQ9N2k1MiaizmFFpeEc6IkonHV7OpjjrOVUXb2hX2Sk1sZeVcthcDp
	 yHwOWSYbirxHWxlHgh1zFmAeK6mlOB03M2VIYOve8UAx8l6sFjZ2tRi8fwudmHR5EGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="i0Mkbpm/";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E80606DA62
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09E80606DA62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i0Mkbpm/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792424519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NaN+mCZydYoju135pw7TWTUw+J0RdYin2G9nyjNDB/Y=;
	b=i0Mkbpm/1dQcWduFThUq7flwMpnIF2CodNevxp3hX8HfomEJUGVREYPFzXkxfTfRMAXG0V
	uODqOOQzrwEnJnnkBDiAHJ3SY425LYqY0uxoOkzzfwozt9y3JhXECUdsxnb5c3EETNkwPx
	COjEJpa863dX1R7Z7iiQSJ2Hl0TYN2I=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-177-FPDmvhMOPueC8vIQAl0fXg-1; Mon,
 19 Oct 2026 15:41:52 +0000
X-MC-Unique: FPDmvhMOPueC8vIQAl0fXg-1
X-Mimecast-MFC-AGG-ID: FPDmvhMOPueC8vIQAl0fXg_1792424510
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 467561955F7F;
	Mon, 19 Oct 2026 15:41:50 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.48.11])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 32C9D30000E3;
	Mon, 19 Oct 2026 15:41:46 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20261019142516.300040-7-jarkko@kernel.org>
References: <20261019142516.300040-7-jarkko@kernel.org> <20261019142516.300040-1-jarkko@kernel.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, keyrings@vger.kernel.org,
    Eric Biggers <ebiggers@kernel.org>, stable@vger.kernel.org,
    Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
    "Serge E. Hallyn" <serge@hallyn.com>, Andrew Morton <akpm@osdl.org>,
    linux-security-module@vger.kernel.org (open
                         list:SECURITY SUBSYSTEM),
    linux-kernel@vger.kernel.org (open list)
Subject: Re: [RFC PATCH 6/8] KEYS: Prevent overflow of user->qnbytes in key_alloc()
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
Content-ID: <2610122.1792424505.1@warthog.procyon.org.uk>
Date: Mon, 19 Oct 2026 16:41:45 +0100
Message-ID: <2610123.1792424505@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

I suggest merging patches 4 and 6, then add:

	Reviewed-by: David Howells <dhowells@redhat.com>

