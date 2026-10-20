Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482361;
	b=fbs5Ns+SKns3ZzNSKMaizffKIMtp+CjIxB//7ckfz2bjKc4i3yT99Tx4pc7dh8MOjazG
	 3npKinNRfvqtMSapKaVM+ZjwHUsD2hWJ7GEycRJshpwxtmsN4WpH+uoMga0SXsb6IGBKz
	 KUvuK0/HaaFZOMoujCmglaWJsBTs6bDRfA1tlIIhRdKo77aRljFipRoGAfEFXbWQOkcR/
	 tm61tRhXz4cgCAXkLf8zp8ceoIv/Zvwrgh1gXrhULpneTf/3LSZFRGD+JG/4eRKarJx1l
	 8h0hwAabDiippT00Z/5t/dstp/5QNOXiM4MjDW4EIviRXJ8nxQp1w0fhU/HUV1ubLBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482361;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Organization:From:In-Reply-To:
	 References:To:Cc:Subject:MIME-Version:Content-Type:Content-ID:Date:
	 Message-ID:X-Scanned-By;
	bh=etJHoXzss+lLgalBskXJJBLUzw7KY5e4yuY8e35KdUo=;
	b=wQ5boRvLyLj/53QVJxh4Fgi7cHqSZVcIX4PevKsfeLwjuDoky0Xh2TJ9Ubgk6L9PV70z
	 HMhUEF2L6ndTFbUISOKc6VbdOOCA5THhzrQ9ZXIYd5JE8x7tp2DwPppUAScPXuU4I0fPo
	 hBNGwYi+wy4CFm2DyROfAzvZqooNzeTejb3o6KK73biyn3irqkDVfhfOfbnvQq04oxL+w
	 fsDf2IZ+43eXwCI1XgQ1CieHZOSM1Qvi/mFDLZRg3wWeZqT89RXTbyUbvwG0qj30WX49k
	 Xj/yMf69oO4RI0jm7+XPoLhL1/9WpbDn00uwISR1cM5rjRbTVgPX2RvK6SGeVCAxFEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZzXoyqdw;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A39606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7A39606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZzXoyqdw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792482359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=etJHoXzss+lLgalBskXJJBLUzw7KY5e4yuY8e35KdUo=;
	b=ZzXoyqdw8IhlEbAKtesL47Wu/c+ZIsIV0SrE5051ND3mCBTOBrYNZQMkiMiXHkZFcDpH7N
	MfeoKAZJOE9CIpkWvZXtGBF8yseIYBmyHwPdIZ39KLaDx2Jmh2IeUM7w6bQy6PbjEdXgFh
	ftMny8OZIdxpHyZOBpqqQ5dxkBzck0o=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-672-y-UzeCQONTON4CooZ3kcPw-1; Tue,
 20 Oct 2026 07:45:55 +0000
X-MC-Unique: y-UzeCQONTON4CooZ3kcPw-1
X-Mimecast-MFC-AGG-ID: y-UzeCQONTON4CooZ3kcPw_1792482352
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B27DD1955DC3;
	Tue, 20 Oct 2026 07:45:50 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.48.11])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CED701800446;
	Tue, 20 Oct 2026 07:45:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1995693.1791971125@warthog.procyon.org.uk>
References: <1995693.1791971125@warthog.procyon.org.uk> <20261013.cachefiles-partial-zeros-trace.pchmelar@innovatrics.com> <20260910220242.2165023-1-dhowells@redhat.com> <20260910220242.2165023-5-dhowells@redhat.com> <20261011.cachefiles-partial-zeros.pchmelar@innovatrics.com> <1655268.1791878098@warthog.procyon.org.uk>
To: Petr Chmelar <petr.chmelar@innovatrics.com>
Cc: dhowells@redhat.com, Christian Brauner <christian@brauner.io>,
    Paulo Alcantara <pc@manguebit.org>,
    Matthew Wilcox <willy@infradead.org>,
    Namjae Jeon <linkinjeon@kernel.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Stefan Metzmacher <metze@samba.org>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Ilya Dryomov <idryomov@gmail.com>, netfs@lists.linux.dev,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 4/5] cachefiles: Don't rely on backing fs storage map for most use cases
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
Content-ID: <2648475.1792482342.1@warthog.procyon.org.uk>
Date: Tue, 20 Oct 2026 08:45:42 +0100
Message-ID: <2648476.1792482342@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Hi Petr,

Note that these patches are now upstream with this change incorporated.

David

