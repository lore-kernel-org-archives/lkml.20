Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703D748821C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491055; cv=none; b=DcC7d8Z/H+HMMpQHfaoDoBmUdA5ZS/Y219DGm/Hp4jfFdIe3OgX2ybKOGX4s16M3/aN3zEUgMSaOXxfoq5xa2xCoCz9gtxgLuxBrLa3MugHaYaOTXk4VbUPi0pb95oSDYrBUBNbmAn+u6Eu/doIVTyXIznOXEsUILlJr2ggmEbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491055; c=relaxed/simple;
	bh=O4R9PW4W6s+z3xFlBUuBjGuMFpMqVv3R2aRzaj5ablw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QyOexS4rF80ATxh4y/+eLcaYina6iLnzobciM5UZsda5Ppw8qiPqPzXSmQiYOSSHkUCKqeHj2m6OmHmjIVoF/P2EZ1sVA6qdyXSflUQMIZIsxMfvjqiENTDz9E43uHbJ3+l7eY0Ll7i1aC2CI/UW6ZgXz3xNlEZeKbR6+1dIij0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I3u57rLG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bb2CXukN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I3u57rLG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bb2CXukN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789491053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yiDclPOUuZB4wifuZIMfqinOjKT1pGRb7hKV2bNRr6c=;
	b=I3u57rLGs5nmHi+ceF7V58c82OG+EUrJm6jvnKNgXFiySoRbdM/07n6Km9xIYnznfnr2D2
	+RWClYA/TBvo6nUdeRtHsBZYiHmKYCQxSz+8PJkAhzRj9CQS7XEjSMCS/UzgH/b+LUqIBG
	2EQ+wKUVuFOBOaMRvjL+UZ7ZLZbzBkg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-MFcFtN4TPgy4Q6q4tpiIYQ-1; Tue, 15 Sep 2026 12:50:50 -0400
X-MC-Unique: MFcFtN4TPgy4Q6q4tpiIYQ-1
X-Mimecast-MFC-AGG-ID: MFcFtN4TPgy4Q6q4tpiIYQ_1789491049
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49b0e6638e3so42265725e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789491049; x=1790095849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yiDclPOUuZB4wifuZIMfqinOjKT1pGRb7hKV2bNRr6c=;
        b=Bb2CXukNqEDNspiy7PlKVZNJkmhveoi5oV+4qxuDDtsjk0/Yx8Ax9+ZPrYcd35CCGM
         Jw3tbT9tbilrUCjTlvhc3P21/+GfpAHCmcTXJy9T/zmdeO9b9MccpPN5wWrbFJRJjY3L
         29Y9IKeXBD7uVKOzNNZ2uWPK7Hsh4ygb/obOnphC19i9b/zCfV0+/A1rRgiI3vTUvkQ2
         HrradPGXV1uMNQpveYtInc5svnUN++uA2zAB1U7a3bW3aj+MfJQTXZEuVPnwucNv/Rl2
         /BIGXyQ3ZLnYWSHc6qgv0G6lEAubvRPl/CGUbZVl4K0TIFcXXQuiIRXBjA9JWY5NlAJb
         gf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491049; x=1790095849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yiDclPOUuZB4wifuZIMfqinOjKT1pGRb7hKV2bNRr6c=;
        b=YsZcKG7IIxYUBsyZ5nAnOrKsVB0ygxRw4oEL7BBZUZCAwmWpAi6i4WiBSt4+IKCutf
         3FaFsfdz0HdVH36zmexSFYXYQnpJIDbFCqNTs1sKgm0rit1a7dlYI9lBXRoybXerDwbx
         yHbFgq+B/LF6IDwV4S5tLvjKgpNLzjPEDU1OeAGzZ8pbHNQOtAdel+mOGOVfGhaVUyJu
         FVR694k3zgKFRNwmCmBccjiyAP7ITBX1JZZmvEsSNWPaATBYT001YIB9uogNe3r3ZZlh
         TTazE7J1kmZOvT5W3fgY5AGGieP/oCotVZwK+RC8qQ8h9dZ1Decm9r6si1HJ0gFRRIoD
         4dOw==
X-Forwarded-Encrypted: i=1; AKwUvByW0py90GAtvDPAuVzbhfcdJmGeCPGpr4kXi2uKcbyEbPl2s7K4FZMuZfUE/769OhqyWGSbSDG8jF5IFe4=@vger.kernel.org
X-Gm-Message-State: AFuF++kYTW9oT++rcRsLKGoQjhqYegOoSzuiF6Gk9e4bwXOzh+qae+cw
	d680OWYoQkF5Wswm/qkRDVYwAhbd7FbPGHHvb5fJnNpF7vXnxURH6TasdWccFeMVDyFRcjqqh69
	4VONUhakNdJBTisG73lMQv/H2S0RO1pOfTEz2De7UaOX4rdy1ebEgO6XqWWM91a703w==
X-Gm-Gg: AYBFou24lwLcqtTDzxwQy8fbiIQzA//Z4LebTLOvvC2BPALj5NgVfy0UHQMcU1lqRit
	nrJ9mHlURMrj9pmJkZCPM4HmA8f+TgZYVNm2RQB2PEtfP7sGBXKOYnlTuYUdaJLeF0ukGb0TKX3
	4h+v6afvCL6usejg0xO1KXdpmtADB8mHk5TPU28K0cb8FIRaQtLGQGxq3uIjWvxh7sWjtjnOv6C
	nzicNFZ+UwIsEH0tb3IbvcWujSaWhpZiE02PbOnrX6iFj3d7cnTWbLP6/Ko9iH9mV14usLrexWi
	+hSP0iCE8VVlDWj1RZkxRH1CkAh5SOdBjA4E955sC1mjBizwLxPfNWy43XueWsdlYqllS+Ro5vL
	OeonLjai5TRARLA8hiCPrELlq+epT0Fb82rMRiRFXBQnZgA==
X-Received: by 2002:a05:600c:4f16:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49e7a65cd80mr116938355e9.1.1789491048794;
        Tue, 15 Sep 2026 09:50:48 -0700 (PDT)
X-Received: by 2002:a05:600c:4f16:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49e7a65cd80mr116938035e9.1.1789491048354;
        Tue, 15 Sep 2026 09:50:48 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83f43ed9sm1438985e9.0.2026.09.15.09.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:50:47 -0700 (PDT)
Date: Tue, 15 Sep 2026 18:50:43 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH v2] vsock: ignore empty child namespace mode writes
Message-ID: <aqlo-DLHC39UlmgE@sgarzare-redhat>
References: <20260915111417.2726515-1-qwe.aldo@gmail.com>
 <20260915141547.3010692-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260915141547.3010692-1-qwe.aldo@gmail.com>

CCing Bobby (and I guess you're missing several maintainers in CC)

On Tue, Sep 15, 2026 at 11:15:47AM -0300, Aldo Ariel Panzardo wrote:
>__vsock_net_mode_string() returns success without updating new_mode when
>the transfer length is zero. Its caller then reads the uninitialized enum
>and may permanently store a stack-derived value in the write-once child
>mode.
>
>Return before inspecting or storing new_mode when no bytes were
>transferred. This also prevents an empty write from locking the current
>mode.
>
>Fixes: eafb64f40ca4 ("vsock: add netns to vsock core")
>Cc: stable@vger.kernel.org
>Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
>---
> net/vmw_vsock/af_vsock.c | 2 ++
> 1 file changed, 2 insertions(+)

A changelog after --- or a reply to v1 to explain why sending a v2, 
would be nice to have.

>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 622dbd0467..816d25b314 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -2883,6 +2883,8 @@ static int vsock_net_child_mode_string(const struct ctl_table *table, int write,
> 				      vsock_net_child_mode(net), &new_mode);
> 	if (ret)
> 		return ret;
>+	if (!*lenp)
>+		return 0;

Better to move this before calling __vsock_net_mode_string(), no?

That said, __vsock_net_mode_string() needs some cleanup IMO but I guess 
something for net-next.

Thanks,
Stefano

>
> 	if (write) {
> 		/* Prevent a "local" namespace from escalating to "global",
>-- 
>2.43.0
>

