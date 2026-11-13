Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581201;
	b=g8SIbxWo92MPscwX7HhqDMECzFHsbOANf+2m7qmCaBt5IKXBVj05YiwthCYxWU4PFnr+
	 /1SCibEKF1H4CUcVcuxrFQqEUtZLCOPDfVcYMQwnTAbAqI1klIGeqdFR1IZd1YgoKx5TX
	 qNvKCMXqlcvHqnTl7qWOPC+eYmu5BNRzaGnmA2Mu8BgZtqT6R6MdWzr5yxV8zz0twVQjO
	 TyUpGQVCiGPNNEbkpmf08NjXFNBh3JyEqSJFteDOgceLZspDCpGgV8jJ2tNJuDwqv0ld9
	 vl1prRjDhE3SEH8LbtoxWi86qRuOKlK2jacnJVbhPkxQLT6d6ZvmhEpmKI1QjARaEGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581201;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=ORnc2vjUi42S6adRltdclowGph/QU1FbRMOu/4qe8uo=;
	b=2DA52kP6Alxs0sS8pS8Z7ZHofkmAJek4Wp7e5Ev3uT2OY4chqZjhrviBwXyRMFXD40kR
	 7IyoAuk8h7ZM7rGwoHBmb4Ilhk6kBn8VmBohi6V+NV2mM4XiIf4CuA/Olun1ipYJYj82K
	 UMG5n7XxdPvJDvvlgAfjqKGtufMPvdeMfd6Nj3XEGW4WRA38h+xkneSoJUq4kMx5nZ5AV
	 cGZ48lyUqhpOPI+3RGgZI45PPSOWqjpS9UIU2aImyDDrYppLTURVfYgGwK1G2tMnAej14
	 iMboFh7NJEkxaX04nnblzVUgXHzCzeoE6IEIbZAY9X4ANfQmW9xPJ9GaC+7xcAvyxtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="URjAU/6I";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD724606A335
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD724606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=URjAU/6I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794581199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ORnc2vjUi42S6adRltdclowGph/QU1FbRMOu/4qe8uo=;
	b=URjAU/6IhEBD7e0mm6ibo+WQuaw9ijYzz7zEeGgxNpNlxh0CC5y3HkAcx9Kk24W2lq3XM4
	WpphEbq6AC7nylx2XrRZ7LIAq7/kmDXj+e7XPdlfGAlL16z6jSqQBXi7ngZD7S7GUifWeZ
	y7yssCja+4PhMo9zGgPyBXNNItqASBA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-671-0kZciE90P9Sb8qOm83I1XQ-1; Fri,
 13 Nov 2026 09:46:36 -0500
X-MC-Unique: 0kZciE90P9Sb8qOm83I1XQ-1
X-Mimecast-MFC-AGG-ID: 0kZciE90P9Sb8qOm83I1XQ_1794581194
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 98275180047B;
	Fri, 13 Nov 2026 14:46:33 +0000 (UTC)
Received: from jocolema-thinkpadp1gen4i.rmtusco.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 085071955DB9;
	Fri, 13 Nov 2026 14:46:29 +0000 (UTC)
From: "John J. Coleman" <jocolema@redhat.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	peterx@redhat.com,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	zenghui.yu@linux.dev,
	audra@redhat.com
Subject: Re: [PATCH] selftests/mm: fix uffd move-pmd test crash on 64K base page systems
Date: Fri, 13 Nov 2026 07:46:21 -0700
Message-ID: <20261113144621.1447739-1-jocolema@redhat.com>
In-Reply-To: <bf163c58-a884-4164-bede-974b78f032b3@kernel.org>
References: <bf163c58-a884-4164-bede-974b78f032b3@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

I wanted to follow up on this thread.  Subsequent sashiko review I have 
made a significant change in the patch, hence I sent in a new patch
rather than continuing on this version path:

https://lore.kernel.org/all/20261113040045.1439391-1-jocolema@redhat.com/

No rush, and thank you!

