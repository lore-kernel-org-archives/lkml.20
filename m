Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714432;
	b=4mP7b7vkWGXfa1P89L+HnwyBqYQuqSzLXezgF3vM1V2UiNDabb2RZblDsWyjJXbVS19o
	 DFUacEJmyiYQpq8BeskoJAI0AhMFWnI8RPEOmY4JHu47xeJ3bjv85CmnyCf6xqpAhvU7/
	 Z3FqKB4sTAX/wGm/oNhe+wYRUCgOswowrvLI1bnySe+EfK7Ad83ZT2FH/JmXRoOZvQEft
	 9r9JrS/VReuW37nuDhaFVRTYPsD84+B4MWO4TQJ1uchRMwSJvZzCVJhsJIjcH0xhtQmX4
	 o1cAuI85KNJLLH+JsWJ2rIWRYr3i+bdCmKJASxKNYKwHo/et0cPB0fLGYFaN8lXYiTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714432;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Organization:From:In-Reply-To:
	 References:To:Cc:Subject:MIME-Version:Content-Type:Content-ID:
	 Content-Transfer-Encoding:Date:Message-ID:X-Scanned-By;
	bh=sghhx7hUgnWBtJrOXqnImo4AESAyEK6ZOxakSdQV9Hk=;
	b=RWmmzz6hG/W5C+X9IIbDE3P5ihLiUNZvyrQyW03lFCqU2NM0aKqdaw8oD7lIWSFtF38X
	 tiGmid01X3JwoDqQese/9kyga/Ls7vmaWXqpjoBE8dzYssomcwRsoRxGdV6w4mDecsqtJ
	 aUiUBU5XeWhNzG5KTCWydx/IvdEgwAAXQpqxoVwwuRHCtY9aclM3v/e/w8uaCkNvA9oY3
	 7YdNAUdtIxpbf5aS/Ur8ur9vjpaVrWOoulWjv4D7hS3j8aUJnUImYPMA/YlDM3lPXPqrw
	 1CGkL7c89FClS0yDWoGGrXxMU/yvdlBYN4Qdo7oYuyoLp+B4FTkFBIMUPUvO4uCSHjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VJZNdVaL;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6C7606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A6C7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VJZNdVaL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793714430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sghhx7hUgnWBtJrOXqnImo4AESAyEK6ZOxakSdQV9Hk=;
	b=VJZNdVaLRo9Voz8/iChKiMQbmSyzhx4wgmZncYdM5EDxrZcD0iw8H8fcRoiwaiTMfjlHqF
	1AWavom1LYXOz3H9pmeucbgL3Vd5jueDXNuHhgePCtH7bUEr8Ltj4ms/cNcUdnjdn6hJjP
	3qMSywhNrp5zsRYTqvcFONbA2pG1PvU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-160-rJvXjCVzOPOFfXzcTVxD9w-1; Tue,
 03 Nov 2026 09:00:28 -0500
X-MC-Unique: rJvXjCVzOPOFfXzcTVxD9w-1
X-Mimecast-MFC-AGG-ID: rJvXjCVzOPOFfXzcTVxD9w_1793714424
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E98C018007F1;
	Tue,  3 Nov 2026 14:00:23 +0000 (UTC)
Received: from dhowells-thinkpadp1gen8.rmtgb.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 931947EB;
	Tue,  3 Nov 2026 14:00:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <aunNj35KmcAC4ByH@kernel.org>
References: <aunNj35KmcAC4ByH@kernel.org> <20261103030226.2685251-1-jarkko@kernel.org> <641294.1793700187@dhowells-thinkpadp1gen8.rmtgb.csb>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, Eric Biggers <ebiggers@kernel.org>,
    linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
    keyrings@vger.kernel.org, Roberto Sassu <roberto.sassu@huawei.com>,
    Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
    Eric Snowberg <eric.snowberg@oracle.com>,
    Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
    "Serge E. Hallyn" <serge@hallyn.com>,
    "open
 list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>,
    open list <linux-kernel@vger.kernel.org>
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
Content-ID: <669210.1793714419.1@dhowells-thinkpadp1gen8.rmtgb.csb>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:00:19 +0000
Message-ID: <669211.1793714419@dhowells-thinkpadp1gen8.rmtgb.csb>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Jarkko Sakkinen <jarkko@kernel.org> wrote:

> > Please don't do that.  That will cause the AF_RXRPC module to get pinn=
ed in
> > place by outstanding connections that haven't timed out yet.

Actually, it can be done if the rxrpc and rxrpc_s key types are moved out =
into
their own module upon which rxrpc.ko depends.

David

