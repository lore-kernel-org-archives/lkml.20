Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9306755C333
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573138; cv=none; b=HA65zau5+HDOJyIsUwjTob1vaM1uG7PJZ3hCAUMVQ8D+Yel8NPVIQ9RGIkT0k8/n4mNFJM+Hdldn2hPKCItI6SjPC+4hNrLCK4fvdcn96YqAQT4fz7+8tF9Hq2ulQSX5idDv4EfO2ZM8nF3qKGFs+OEiWsx7E+e4drlhg+dXM8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573138; c=relaxed/simple;
	bh=huEs+LEHo8cFHfOkkR7JHzzpk8mAxFJ2h/PPE9NkvtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDyWu6RXErU59ZGlE5Wwb/U5s7xbCPFGPvco/lyKi+mo4jHSyi1LEHqxzl1GR7v2A6Rqn5Z9cKJ40JHPzwCRCRzHDyN2FM87IkHBFefawPS+bP5nUGtnXE5XpPd1u9L8i1Fxdhv9kBK4E2NTidx+9T8/d559nnJHrTHaKAS+hks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BqWM01rr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cOe2/Vn1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BqWM01rr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cOe2/Vn1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789573123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QJCqqA6Q4AOgIHS7UBKFb/3fKqTDi7g5pa0Z96svO8U=;
	b=BqWM01rrJQwkns/Ue7qeVG1W4Mv2Bh1DEPQKs5cCvIjaTR1waUyVQXr/Ps2zE3cqyHJqf6
	iJ/f8ROTnODICBz8RshJcc+5BqMK+yJ4RzIw7MX7eaXkrAi5Nz/s+h6fPHbryJ7sBmAPog
	3aMB9x93xGDRZkr9mDN/3tn0Tm4zh3Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-C_v6jy3MOHGO4taq0zb_nQ-1; Wed, 16 Sep 2026 11:38:42 -0400
X-MC-Unique: C_v6jy3MOHGO4taq0zb_nQ-1
X-Mimecast-MFC-AGG-ID: C_v6jy3MOHGO4taq0zb_nQ_1789573121
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-486f3c0d896so2941339f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789573121; x=1790177921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QJCqqA6Q4AOgIHS7UBKFb/3fKqTDi7g5pa0Z96svO8U=;
        b=cOe2/Vn170kHRte8QHpTEwRT0IGE6bNpHwsgcDSTrDNKlxg1DaMWVpOopu8uj/JNY2
         4q7Lv3421UqsGckKANvR3YbYA+CrzqYL+MC8vvBx8UdFQwrwDAwlpJnYTEq0Shr+0PMn
         fqtmDzko+Xu+fCdbLWSafAAWBBdx/oYBl23qCChtL72+6NFHUXMSlQxzrwfHl/l2WbVz
         jJs4vBlUMPN3lEkzmHxFTamcl0dgzXm9hSnabfXsQk/lNPVC0uuoDil59R6y8Iatw6VT
         sYHYWzQ4fzyQkEIbhK8Tllwe2Q2jzJGNaHsN4OYv8YYYE+IJ75eCtcg7KT2Lhwxz7PnV
         SDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573121; x=1790177921;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJCqqA6Q4AOgIHS7UBKFb/3fKqTDi7g5pa0Z96svO8U=;
        b=h1MXxSMEqflGXB/CeFN7TuNDsO2pbLIy1RH26clIsfbmdMff6ESI4cQdTz/vj6zQRE
         j1F/abHw+OWN8Eo02xwiThvECsCqkTO5BxH+vdFSM+zVHoN8M6zWZJdr/JbTJFNGiDP3
         c7bM9bgSPvU1aJM8dk8D9SpnkNiNEIaJ+ZAp6GCmWnt5y0Px/38J4kzQ4JUp0hEYW9fR
         i0zwV+vC6pp9yvb/3+unqFtTCmedioKemOhwfqvWw+LBzteJV68WKhnQvAlVKSHk+6KG
         bQmFRvCj5VpksFoRaSZwqdRuwqvz+o6v5XT1VW1YZBTj1R2Pr95vquJM02Crz0X3xgk0
         5UTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgjA9yKexfO/64LQEW6zHghb80ew9KqYT21amOPeR/+/KW1TpArMwvwxhbIXr+i9Rr+XilGHUk62cXFME=@vger.kernel.org
X-Gm-Message-State: AFuF++kn//vYQf2HYaNhf3Z/KsqjzxraPMhyUciCqXxJKT8sFE9qeDaF
	9jKB9vJ4bFTwnwwSXH0ZohxqAF65cTOzOKGTWQdlRw7e2B7QtaeuPgHGB25S+KJp75mPqDN1YR4
	uO6jKn0K0JhlrAuKmi/ef4JF4BGylZNesIkCUdgeLgBsshZjU7HRTlGPAT78yeNbxaA==
X-Gm-Gg: AYBFou2QIkgx9BZCKAEkHWyzkQslQbUBvRubkpi1YWn3E2jt+DHOrBENJsJbnVYcxD1
	9R8DNIx2w7LzvH7jdUxe8r+erEH05ArTCwTJexl+eCdAFxz74qY31pAgDKIvdUsWKZbbtSZw60N
	ZWfo/YJ5yXrzRo6kvP3heuisP+pgUuCk0jpNqOoyslhizvBe8crhgJ1P343u4QjMPFBnmc3fWgq
	/gw1AyVERwzhw+97G2Plj9B6VHxTnV7lqIAN9GuDO+oGTEb09fgyNtvPj+xNWwVMKsAZcaLAmHi
	zluA7acUPmtzQc8XrlJxnQ6A+hmIiY0HBFie7xZ3cO48KcDSalsmNDzG3yz176qkLIbYrGViDIZ
	2uP3iERKwNnlQf4JjRPU4Z69T4glA6JVRhZmYIhXQiBxSYQ==
X-Received: by 2002:a05:6000:4711:b0:487:fb0:9ff with SMTP id ffacd0b85a97d-4870fb00af5mr2913400f8f.22.1789573121082;
        Wed, 16 Sep 2026 08:38:41 -0700 (PDT)
X-Received: by 2002:a05:6000:4711:b0:487:fb0:9ff with SMTP id ffacd0b85a97d-4870fb00af5mr2913360f8f.22.1789573120615;
        Wed, 16 Sep 2026 08:38:40 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fad3sm7165977f8f.12.2026.09.16.08.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:38:40 -0700 (PDT)
Date: Wed, 16 Sep 2026 17:38:28 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@meta.com>, 
	Luigi Leonardi <leonardi@redhat.com>, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] vsock: ignore empty child namespace mode writes
Message-ID: <aqq3t5p0hN2jsSpT@sgarzare-redhat>
References: <20260915141547.3010692-1-qwe.aldo@gmail.com>
 <20260915173050.3176344-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260915173050.3176344-1-qwe.aldo@gmail.com>

On Tue, Sep 15, 2026 at 02:30:50PM -0300, Aldo Ariel Panzardo wrote:
>__vsock_net_mode_string() returns success without updating new_mode when
>the transfer length is zero. Its caller then reads the uninitialized enum
>and may permanently store a stack-derived value in the write-once child
>mode.
>
>Return before calling __vsock_net_mode_string() when *lenp is zero so
>that the helper is never invoked with nothing to parse and new_mode is
>never read uninitialized. This also prevents an empty write from
>locking the current mode.
>
>Fixes: eafb64f40ca4 ("vsock: add netns to vsock core")
>Cc: stable@vger.kernel.org
>Reviewed-by: Luigi Leonardi <leonardi@redhat.com>
>Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
>---
>
>Changes in v3:
>  - Move the !*lenp early return before __vsock_net_mode_string()
>    instead of after it, as suggested by Stefano Garzarella.
>  - Add missing maintainer CCs per get_maintainer.pl.
>  - Add Luigi's Reviewed-by.
>
>Changes in v2:
>  - Return early instead of initializing new_mode to the current
>    value, which would silently consume the write-once transition.
>
> net/vmw_vsock/af_vsock.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 622dbd0467..XXXXXXX 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -2879,6 +2879,9 @@ static int vsock_net_child_mode_string(const struct ctl_table *table, int write,
>
> 	net = container_of(table->data, struct net, vsock.child_ns_mode);
>
>+	if (!*lenp)
>+		return 0;
>+

I would have moved it even before the net assignmet, but in any case, it 
doesn't make much difference:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

