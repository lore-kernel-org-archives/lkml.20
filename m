Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792425564;
	b=LAIVIMi/8hQBxSyAt7f7Gc2X2J/UQOinlZU7wg6l0LHQKcspPA+oOBrZXi7F5V8VHGLL
	 OD08UYV1tO4CyavallVy3Kzerfw/uuA3bhYWeBLDBd4oqS815Lf1Ef4w4wo3ftb5PGP15
	 cgrVoPuPwG891uO6jZS5DVSP1P2gJQBDaLlGOSFQkXq77m0Xfq2WA0mDSUq9M02i4dhvU
	 Rt1Hc+kLQ62rLDhjF+j/J8ECnpSQUekej8dABUlf54W1GFFgEF3JW8Ol2+SX9uVYar/3u
	 zPi1dlxWUAPKKeN61aXlKYPMq4NSCTsM36ug8Q36cEfjrtx9UQG+fGY3ENkjpXIKg7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792425564;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Organization:From:In-Reply-To:
	 References:To:Cc:Subject:MIME-Version:Content-Type:Content-ID:Date:
	 Message-ID:X-Scanned-By;
	bh=mxDUftepPPOUZ/7SCslBnNQlYRdDOMe7AAGS48la1a8=;
	b=O39+P2oFhiDtQuq0B1BVxTzb873LgaHluRqKUWWmjQZD3aHxkJuEnnAc6GkprQOz6/JA
	 JolDDEBG+qetq9XVO3BwhrErV8D0mxnBVbc39G6h4jcPepbHoq5CYK/rSS/oM6l7hmf9r
	 ycteSJA6DfiCe0mUOvXKXNYtFnOwPJ9jKDy7/uCwLELmg0M4Ei87gcxd1SsvnXXnqeTpb
	 HsQVN5DrzGzbUyFcwC6upPYHApGKZSNi3hNLa8NYQGTSQYnCcSDYZ1lRQQq3k0/hehqy8
	 CQ45Wj2uRSr+XiMB8LpPBeZ8FDcfDpBa6RWguWnTntkVv/ZGOy75dAv09iZRStMRDqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GwjjAmxc;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA511606DA5B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA511606DA5B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GwjjAmxc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792425563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mxDUftepPPOUZ/7SCslBnNQlYRdDOMe7AAGS48la1a8=;
	b=GwjjAmxcPacUMf3nHdk1janj0qAR1xYPse47ori4tZ8vFpgp9gXc3Xov9HspwUbkDC09oJ
	fWdTwmmxE+vY+WuVGxblD8Ka0Pth8tI/dpZKfdoSTQpepGk8G1Kx+1P5B5Yr1Atk9i/+TB
	fvhBEBnex36nKVyH06i5r2P5joRy9cM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-213-I0xvQN0zMnCVxghSPcACeA-1; Mon,
 19 Oct 2026 15:59:18 +0000
X-MC-Unique: I0xvQN0zMnCVxghSPcACeA-1
X-Mimecast-MFC-AGG-ID: I0xvQN0zMnCVxghSPcACeA_1792425556
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0F64A1954ACF;
	Mon, 19 Oct 2026 15:59:16 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.48.11])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0AFCA41B;
	Mon, 19 Oct 2026 15:59:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20261019145624.309790-2-jarkko@kernel.org>
References: <20261019145624.309790-2-jarkko@kernel.org> <20261019145624.309790-1-jarkko@kernel.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, keyrings@vger.kernel.org,
    Eric Biggers <ebiggers@kernel.org>, stable@vger.kernel.org,
    Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    Randy Dunlap <rdunlap@infradead.org>,
    Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
    "Serge E. Hallyn" <serge@hallyn.com>,
    linux-doc@vger.kernel.org (open
                         list:DOCUMENTATION),
    linux-kernel@vger.kernel.org (open list),
    linux-security-module@vger.kernel.org (open
                         list:SECURITY SUBSYSTEM)
Subject: Re: [PATCH v2 2/2] KEYS: Reject keyring creation with overridden credentials
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
Content-ID: <2610819.1792425550.1@warthog.procyon.org.uk>
Date: Mon, 19 Oct 2026 16:59:10 +0100
Message-ID: <2610820.1792425550@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Would it make sense to just reject KEY_LOOKUP_CREATE at the top of the
function if the creds are overridden?

David

