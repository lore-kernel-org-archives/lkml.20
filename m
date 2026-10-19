Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424462;
	b=0BDZkz0sc/iC4Z06U7CSc7dyZgsOAID1eL+llo03uHRuQQbUvkNYVCN2bfSMcEIJNjTB
	 iKkmIGfy8//fqeacE+JFJ04m2vSvB++7xyAqtkbRvj6pSjR3g2rLqlq5xES9qO2jAk35R
	 5vuCh0GHpyAPKX1tbNACN2GyYDsHsvrot7Up0NgzykVgIq1ISjFuakygzvNkWOW/bEs6m
	 c5REYRLkuXlmkapEbf5BFwoqI8TaDGCkpffHu2n/2uyluJkOurQUfEhWGK+v+RADb8Yai
	 CRzGbMs/h/iUxD1RNMZ6hTQh4u/UGhszqSOK6ZQLNNp4RPYCkROwhBaXA3Nj7T9lvqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424462;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Organization:From:In-Reply-To:
	 References:To:Cc:Subject:MIME-Version:Content-Type:Content-ID:Date:
	 Message-ID:X-Scanned-By;
	bh=yziQSCxdp7ps3qMUbiHDhum2cL5ZNoqGNN2WDzodKHc=;
	b=a8JRHcqrzWgH91iH2P1eQicboX/zti/p7Bn3WNB/ksBmkz3XcIEEAFV9L9OR9/SovUum
	 8mL3Q3/vsYgMi6XffnKEz5oLMeMLF1LL9Drz26xUJrCzXz+SXReJb5XD9sy7P9RWPA7Y8
	 2+LKt4b+tc/AySKKYhhyKfs9vrtEA8/OZShG9MAR/URa80fmivrs6Av5Fvgxa9JplXdwS
	 8uPvnYGVY0F8aiazJPa6q6GNaEiHiPYjNOZqJZ51xCQpzJ1lXfkxXX+6YfU+aCYQRZ8gm
	 BuSVWLNqUxKXSVxIKTnoHsEkdLLyLh3ArK59yhdaXFWfuzUohBs/CDBvizKMHEIBN5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xv0BTLil;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034D66086070
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 034D66086070
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xv0BTLil
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792424461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yziQSCxdp7ps3qMUbiHDhum2cL5ZNoqGNN2WDzodKHc=;
	b=Xv0BTLilkXGFFfs4U2zhzCCzQM7KHdNNxU7p+LYZQzufrycGvdbPXlLraEkFCLlaGMgLa8
	Tmx+Xv3tIWqVF3SIgnNuuXxkZX01PXOVbfwHnRkLRnkMBTxCrqHREOqcnKTSHxvqr2lhIM
	XR2H7z6VsQPyFC2mgGOxal2idvq1MZ4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-414-SMnf-nxSMaCCQN_0EplOqg-1; Mon,
 19 Oct 2026 15:40:55 +0000
X-MC-Unique: SMnf-nxSMaCCQN_0EplOqg-1
X-Mimecast-MFC-AGG-ID: SMnf-nxSMaCCQN_0EplOqg_1792424453
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB9731955F03;
	Mon, 19 Oct 2026 15:40:52 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.48.11])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A3A501803A44;
	Mon, 19 Oct 2026 15:40:48 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20261019142516.300040-6-jarkko@kernel.org>
References: <20261019142516.300040-6-jarkko@kernel.org> <20261019142516.300040-1-jarkko@kernel.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, keyrings@vger.kernel.org,
    Eric Biggers <ebiggers@kernel.org>, stable@vger.kernel.org,
    Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
    "Serge E. Hallyn" <serge@hallyn.com>, Andrew Morton <akpm@osdl.org>,
    linux-security-module@vger.kernel.org (open
                         list:SECURITY SUBSYSTEM),
    linux-kernel@vger.kernel.org (open list)
Subject: Re: [RFC PATCH 5/8] KEYS: Prevent overflow of quota in key_alloc()
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
Content-ID: <2610079.1792424447.1@warthog.procyon.org.uk>
Date: Mon, 19 Oct 2026 16:40:47 +0100
Message-ID: <2610080.1792424447@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Jarkko Sakkinen <jarkko@kernel.org> wrote:

> -	if (desclen > U16_MAX)

This should also be KEY_MAX_DESC_SIZE.

> +	if (desclen > U16_MAX || type->def_datalen > INT_MAX - desclen - 1)

That looks awkward, but I can see why you did it.

Reviewed-by: David Howells <dhowells@redhat.com>

