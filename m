Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BFB1BD9D0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789626791; cv=none; b=US3PQfHEsXIy59FdM6kh9X6j2vQaY4HxDw8pW/3doaofUkRvtjk3XrGEhtCta7CyRA3AWzJxKwCVfpvEJxT6zcSVFPMfI6Aaw2N5+/NwrimoThQfROi+AZkk8ZDv+Te9yZXjsXt5MbIx6u7d0lks/O4ZcW9HnEeca7s1Y9t3/+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789626791; c=relaxed/simple;
	bh=G3gh9xfQo/aWe9NTkMuu8d6h2PqoLGornjU7sCJIkzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bDNFt7ncCt/DxQepf0+Igz1a1QKwLEibUzpd0riUJGHNY4Qk63ZaE8bCwC/nFse3YUqneDcYYyRxTO2rIw+zrcixUHt3J5+5KKChdjsUbcShQmBf11wgAgi9VCwjxyqMaTDZsA5nePratHPPnNuveS+FP+JdwV+fd/2gqMX2WeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=isztPWKn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="isztPWKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789626788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3gh9xfQo/aWe9NTkMuu8d6h2PqoLGornjU7sCJIkzs=;
	b=isztPWKnpWqLDJWsBBGcHywlQInoFlaUmJpGIxfgzM77DMAr3uqaCRdhofZK48vizOt4Qv
	q9nRDgtYdWmFm3oHrfbakj3EEX+Rlc/R62YlDbzuXdZuwerapr5gr4n3VBE6nJKqRz+NKw
	jP6+wcCnS8wLNRdDAdOqV9LN2F1AA4o=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-53-tlbqaWevOFyFAdsXmJOHNA-1; Thu,
 17 Sep 2026 02:33:04 -0400
X-MC-Unique: tlbqaWevOFyFAdsXmJOHNA-1
X-Mimecast-MFC-AGG-ID: tlbqaWevOFyFAdsXmJOHNA_1789626782
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 589DD19541A0;
	Thu, 17 Sep 2026 06:33:02 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ECB661800352;
	Thu, 17 Sep 2026 06:32:59 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v5 4/4] wifi: ath12k: implement custom wake_tx_queue with flow control
Date: Thu, 17 Sep 2026 08:32:57 +0200
Message-ID: <20260917063258.11886-1-jtornosm@redhat.com>
In-Reply-To: <170a200e-f0fc-4e8f-a7c6-72294beb185a@oss.qualcomm.com>
References: <170a200e-f0fc-4e8f-a7c6-72294beb185a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Hello Jeff,

Sorry for the late reply, I was on leave as noted in the v6 cover letter.

> Yes, but if that outer spinlock is ever removed, the inner spinlock would no
> longer be correct. So the defensive pattern is to use _bh in both places, and
> both of my AI review agents concur with this practice.
Ok, changed to spin_lock_bh() in both ath11k and ath12k for v7.

Thanks

Best regards
José Ignacio

