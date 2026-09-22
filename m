Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B324A440B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062145; cv=none; b=Ux5G1K2cnF6vnaYN/JODhVsvwO0MGKokdUlfTcNU7PLoNsLWkZkMQ3BhsRkX1voKS2M/sRE63zUHzWXQILjUfdLmgUrkCbJRiKoiFpf1EWz5idHS+oe2YF08f62KR5DTe4+tK2qBoDOI/R/JPsRCGoTLsc9yOW0A9SZ9dhBbFkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062145; c=relaxed/simple;
	bh=XPp/PcjFWgVB5+Bw5ABOkUP0IsKJws4n3xxxAV9CNdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLt8P2AVVtKHwTjWYoUHQqQ9aDIA0ExHUuEBhj3FFI+ajg11pijUbLmJbzeIgnZzK1anXCQrFUygBtBXv0lz4r+GHcqUuAjbf9qnqC+1gwLHRWTfBVlDejcM89xIcNMt5R3GEKtPxH/KGseysWHWDIJXtCW4+ldMQpPx/Yfl1VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Om1zxZDL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Om1zxZDL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790062143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1nV4OYi178lUeQW0YjjIgpTN9nSwgzP2y4G9yO7aqk0=;
	b=Om1zxZDLFdQUnAc3vb0GgwD3J964eZKSk0BXoKQN+LlMWa4tHM1fmB9YZFDzAZWb2ienHr
	htmg7Lr7ogBaE4rJ7XmeNpQ6rTztTgxmyBq/F4c2DAkqm5/7MfKDpvY9ljaUNusJL12PgB
	eFj3xPKllxE2y2Xkitlyi73Ts5vJrFM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-387-JtQeQhCuOTOpX21smiv1SA-1; Tue,
 22 Sep 2026 03:28:57 -0400
X-MC-Unique: JtQeQhCuOTOpX21smiv1SA-1
X-Mimecast-MFC-AGG-ID: JtQeQhCuOTOpX21smiv1SA_1790062136
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E74F0180A94D;
	Tue, 22 Sep 2026 07:28:55 +0000 (UTC)
Received: from fedora (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 0492D1956041;
	Tue, 22 Sep 2026 07:28:52 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 22 Sep 2026 09:28:55 +0200 (CEST)
Date: Tue, 22 Sep 2026 09:28:51 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Danish Khateeb <danishkhateeb03@gmail.com>
Cc: Andreas Larsson <andreas@gaisler.com>,
	"David S. Miller" <davem@davemloft.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Masami Hiramatsu <mhiramat@kernel.org>, sparclinux@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sparc64: uprobes: use kmap_local_page() in copy_to_page()
Message-ID: <arIuM7PdJ9gi222t@redhat.com>
References: <20260922023111.49951-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922023111.49951-1-danishkhateeb03@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 09/21, Danish Khateeb wrote:
>
> --- a/arch/sparc/kernel/uprobes.c
> +++ b/arch/sparc/kernel/uprobes.c
> @@ -33,10 +33,10 @@ unsigned long uprobe_get_swbp_addr(struct pt_regs *regs)
>  static void copy_to_page(struct page *page, unsigned long vaddr,
>  			 const void *src, int len)
>  {
> -	void *kaddr = kmap_atomic(page);
> +	void *kaddr = kmap_local_page(page);
>  
>  	memcpy(kaddr + (vaddr & ~PAGE_MASK), src, len);
> -	kunmap_atomic(kaddr);
> +	kunmap_local(kaddr);
>  }

Acked-by: Oleg Nesterov <oleg@redhat.com>

