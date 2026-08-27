Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F17364927
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815888; cv=none; b=SkfhJw6KK5IGERiAgIevKdC4GcgCXm2/TTceqa5rQZCrlG9D3izd7kuorNX4UM68N6RETefDZgKr8nwUW+Ga+ZkCbuN3PlWTLQ6ccYYXLUBAwopj5MGjcRWlf8qe86jfL5qhLL2IiVAziMJ9eEpqhijCFSM+RX5Ej+h5Wkym3rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815888; c=relaxed/simple;
	bh=dTuINozwG9joSC97GQsXhMUT+ewKHw6RgCslDQk67Z8=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=VlB/Tq4NE0BhZIh58T6VoOC27iiKRKQ3PWAbjYxm5L/g++/MOVY2iDALqifXylzikhNeGgqKS6tS08APQX4C6f33llR29N58AmhZGW5HUC84wHnQ6UOP9lvX4XzBf6AZhIRJQIqW5xKK+yiNiDm15zoh1r3rbl6STZemN73GcH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QCqIys1H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QCqIys1H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787815886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aAROWPm5/31lHiZNsRSHfM8LDc55TKe+pyp8HbdvD0I=;
	b=QCqIys1HlqLbF6Fl6/smUNGBDe/ZVCGucI6y+3qCeQnx6Axn1dGqqcFWAKkL4MiZma56xS
	5RjcZTCih8d5zW3ONa5KM4Lk6keMXWUUi/asuNWtFoRuqkV86crVZTgo9cTuOM7bJyyQOs
	g5+MNr20jUUy90cfoKY3QCJr+D3d1FI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-652-HjkHOimGM2i-eShqLCE8JQ-1; Thu,
 27 Aug 2026 03:31:21 -0400
X-MC-Unique: HjkHOimGM2i-eShqLCE8JQ-1
X-Mimecast-MFC-AGG-ID: HjkHOimGM2i-eShqLCE8JQ_1787815881
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 815F91835AEB;
	Thu, 27 Aug 2026 07:31:20 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.22.88.47])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 498B71800641;
	Thu, 27 Aug 2026 07:31:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20260827061444.2404961-1-chenyichong@uniontech.com>
References: <20260827061444.2404961-1-chenyichong@uniontech.com>
To: Yichong Chen <chenyichong@uniontech.com>
Cc: dhowells@redhat.com, netfs@lists.linux.dev,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cachefiles: fix out-of-bounds read in coherency trace
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1924987.1787815878.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 08:31:18 +0100
Message-ID: <1924988.1787815878@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Thanks, but I have a patch for this.  See patch 9 here:

https://lore.kernel.org/linux-fsdevel/20260825132045.1000787-1-dhowells@re=
dhat.com/

I don't want to call memcpy() like this just for the purposes of a tracepo=
int
that is almost certainly not actually be active.

You're also moving buf->content into a variable rather than using it direc=
tly
- is there a reason for that?

David

