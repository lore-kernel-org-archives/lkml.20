Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575471;
	b=aO7POjCnSc71RM/BLq2aTXHTj6t1ceapb+QtjfOUvg7XbHiqfgb5JMdWyX35C7CVjWvg
	 ygYeA8vFN8uLZdL9RemyU7jrvl6Nq9D/NYznvP7C8wk9HXB+Ioth83CrYw565kXEdwyaf
	 DL/HxUyl/YFQ2fhfJJW9eBy+sHrAkfZ1OUtv9/7lv5e3xKOyZnmtdSFqiT5V+oRN3JFvV
	 73DLXdtOtpcBjvGXQI7OHw+iRgWN6aQozFbZFVDT+O4vfdop6F7uixjBmR5a052PJJi9P
	 PV1lz7Qi6sXoibVNr951zTlvNNb6kwp6t2wt67s/UacPtvU1ZpT5x89FSqHLBnGnHeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575471;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=zYYaJ3Cx83d1i6W0tWGXSMXeldqRUTYijFYdQSWTCqk=;
	b=VWWARsxDFUIkJOv6UKzHuExURzP01C0/+CO7yRtXnhEDj03NBGYdLI/hWK1vrr2tvBJh
	 Jxu//calZ/z8D5aCJivDTnI5VvCA8ki/3736yraH+Mj/zUe1QFurpFZnPTyt+ZL3Ap03u
	 yVCRVRmFKxzSO78fbK4AG2cuzoBlqVwigqdpTBwnZq3NANzzWivABaEdgSQ1YeOkYWqcD
	 7VtYUPu8fd3Ezux6g7zXFF6REeC/02Wo3nJg3dnpbRSwq7q4/8BG1xssrWpfudC73wwy7
	 HQTP0OYJDbwwsb/mO7xeq59MVfWacXZZWr/hHXMWzC6WZKAff1oYL2utpT2sL/j9Tgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cgHOGJgN;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C07606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C07606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cgHOGJgN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792575465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zYYaJ3Cx83d1i6W0tWGXSMXeldqRUTYijFYdQSWTCqk=;
	b=cgHOGJgNDHQVftR29sZ0Y8W3uymfxOZ+PpcOBOJTkNNPmFV5j/ClsawhkJkyJi3YkR0sLZ
	P9dKxHC+Ax7IMn0ckxA+pUEX+iIAPQuKXXjVjJEyrQzDAuWnsBsbTBZfGX7A7G1nigD6Rx
	Xp3PEQNmZ+pv8WLEqclCCFdGIIS3MHc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-613-_u7xX48KOf-yVVlOyNLt4A-1; Wed,
 21 Oct 2026 09:37:41 +0000
X-MC-Unique: _u7xX48KOf-yVVlOyNLt4A-1
X-Mimecast-MFC-AGG-ID: _u7xX48KOf-yVVlOyNLt4A_1792575460
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 826651800847;
	Wed, 21 Oct 2026 09:37:39 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id D87471956087;
	Wed, 21 Oct 2026 09:37:35 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Wed, 21 Oct 2026 11:37:39 +0200 (CEST)
Date: Wed, 21 Oct 2026 11:37:34 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Allison Henderson <achender@kernel.org>
Cc: Joel Granados <joel.granados@kernel.org>,
	kernel test robot <yi1.lai@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org,
	wireguard@lists.zx2c4.com, rds-devel@oss.oracle.com
Subject: Re: rds_wq UAF
Message-ID: <atiH3sYO8XvnP-Vn@redhat.com>
References: <202610190310.9737b2e3-lkp@intel.com>
 <atYB0bm9eEXp8A2g@redhat.com>
 <atYW0K3t57puHeLW@hobbes>
 <atYuE1xnVYe0BDG4@redhat.com>
 <atY42k00k0Waj6o4@redhat.com>
 <42964fa071bd8dcafd418c89be6d66856def4dc5.camel@kernel.org>
 <atdoGiW_sHlWgOwt@redhat.com>
 <e7888169bdc76ea40fcfe782c2bc9b70e037dfc6.camel@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7888169bdc76ea40fcfe782c2bc9b70e037dfc6.camel@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 10/21, Allison Henderson wrote:
>
> On Tue, 2026-10-20 at 15:09 +0200, Oleg Nesterov wrote:
> >
> > Let me try to summarize.
> >
> > If rds_init() fails after rds_threads_init() for any reason,
> > rds_threads_exit() will destroy/free rds_wq.
> >
> > If rds_rdma_init() is called after that, and rds_ib_init() fails
> > after rds_ib_mr_init(), rds_ib_unregister_client() will try to
> > flush the already freed rds_wq.
> >
> > But we have
> >
> > 	module_init(rds_init);		// net/rds/af_rds.c
> > 	module_init(rds_rdma_init);	// net/rds/rdma_transport.c
> >
> > and IIUC the order of these initcalls is not defined. So if
> > rds_rdma_init() -> rds_ib_init() is called before rds_init(), it
> > can do flush_workqueue(rds_wq) when rds_wq == NULL on failure.
>
> It is sort of defined.  When built as modules the order is enforced by
> symbol dependencies. rds_rdma and rds_tcp need symbols exported by rds
> (rds_wq itself is one of them), so they can't be loaded unless rds_init()
> succeeded.

Yes, somehow I forgot that rds_rdma depends on rds ...

> So the rds_wq == NULL case can't happen.

Well, in theory rds_threads_init() -> create_singlethread_workqueue() can
fail too and leave rds_wq = NULL. Nevermind.

> So I think the fix belongs at the transport init: if the core didn't
> come up, rds_rdma_init() and rds_tcp_init() should return early,
> before they register anything.  I can send that along with the
> sysctl change tomorrow.

OK, thanks.

Oleg.

