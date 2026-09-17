Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916DB529405
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660874; cv=none; b=R2F44v+nuqU56xC/Og6lXUEzJT8A2ssRbgRoCMMbgtoxXjy7jc13Pay6BQC/ZAz0sBry+FEDomSGbK1D/sOchnShQ/R8fd7EYbtv7ssomLCQmqsvHG9FzOE5gBvKx6Yi99mUjd5EdtZfXOA0AKHbftAbb20Ly4Thw8Atpmq883w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660874; c=relaxed/simple;
	bh=nIsaxXEGJbj57DSkDsEHtADfOiMllqJHu0pnBD9H3Ek=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=TCwRfTXKCWdgVADZWxHmbtCge2eRyQephI3DJ3tf4alfTOugOW5Tbw9cz+8WWiKQuhjX4ATWWwXDTG2xvYC1hQutC7UVF6AI0sZ7ITAAO2TT8sXW+PSO0QxvIWGe2ffK1ZxrleKNLNHEcuUVRD5dVdgN3A38hb6ky00hgIbAgkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZvAUYwGz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZvAUYwGz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789660871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wTMRDM3m73WNeqeVD1NhbRoJaF5Z8pZDYqQjZqS56SI=;
	b=ZvAUYwGzOOqra9g49tgSFTCMV1lt79GdNqMFRTUVjWe0TztuAi4OHtbPahN8O9anKqXVvo
	uxBZW/0Z/EX5DN79a52KGm0hzXNRx6i4b7K1g4dsHMnokEZB2cpmxsR4WbOZZQKrjuUnRc
	RCd237QzvdothByUPpVDFV4RnFZaFOs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-MXxSoYcuPO24RYj48RCRtQ-1; Thu,
 17 Sep 2026 12:01:06 -0400
X-MC-Unique: MXxSoYcuPO24RYj48RCRtQ-1
X-Mimecast-MFC-AGG-ID: MXxSoYcuPO24RYj48RCRtQ_1789660864
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9400F1955E86;
	Thu, 17 Sep 2026 16:01:03 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.32.54])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 195D5300022B;
	Thu, 17 Sep 2026 16:00:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <229fb007-8f00-455f-ab92-4d15d6b90d0f@redhat.com>
References: <229fb007-8f00-455f-ab92-4d15d6b90d0f@redhat.com> <20260914151340.3227501-1-dhowells@redhat.com> <20260914151340.3227501-2-dhowells@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: dhowells@redhat.com, netdev@vger.kernel.org,
    Marc Dionne <marc.dionne@auristor.com>,
    Jakub Kicinski <kuba@kernel.org>,
    "David S. Miller" <davem@davemloft.net>,
    Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
    linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
    David Laight <david.laight.linux@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH net v10 01/14] rxrpc: Fix lack of short-send handling in rxrpc_kernel_send_data()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <669609.1789660857.1@warthog.procyon.org.uk>
Date: Thu, 17 Sep 2026 17:00:57 +0100
Message-ID: <669610.1789660857@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Paolo Abeni <pabeni@redhat.com> wrote:

> > -	mutex_lock(&call->user_mutex);
> > +	for (;;) {
> > +		mutex_lock(&call->user_mutex);
> 
> FTR coccinelle can't digest the lock inside the loop:
> 
> https://netdev-ctrl.bots.linux.dev/build/cocci/results/823484/stderr
> 
> but AFAICS the report is a false positive, and I can't think of an easy
> way to avoid it.

I wonder if I should have a separate lock for sending, once sendmsg() has
decided that that's what it's going to do.  The lock would be held across
sleeps for buffer space, but would need to be interruptible in case the call
is aborted (or some other terminal condition occurs).

David

