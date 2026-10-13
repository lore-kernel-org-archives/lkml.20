Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD05C3DEFF3
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883151; cv=none; b=WtH1RAV42JM1IukBWLk0EeQqcogyK/nTve4xW8Jv4DNx8HdHubrSlK/kLMM4B2NOCPJMBb2cXZUstaproVJu4B70Q2A5eWsU2Zu+PWQJ0pJ4EtdfqVO3ERzvFMTGyAuWu8cHtYJ9uo965uUXUaEAN03GBdpYucT+Zy61KIrXHCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883151; c=relaxed/simple;
	bh=9ifxJXmHIdOpbrwVmaxz9CH5L1s1R8aDY8bfmqlUzMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHXu24chA43ZVanBs2I0nie6qA1pCKF9dDyveagpwveWg20+BoqtNBf7US0Fb/UNL0pz8+4Id9ZcvgriliDlaAjA+YiuKCJYa4z0CWbrTOdAKRF26BMZqT1nGG+L+gDcP2jarCkr62nRp31R3gfxixY++SAb/NoR+E4xsrzVa14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bqOpV/KT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lLtyGA2q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bqOpV/KT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lLtyGA2q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791883148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ifxJXmHIdOpbrwVmaxz9CH5L1s1R8aDY8bfmqlUzMI=;
	b=bqOpV/KT5yv9659dEiYYELjQo3V/pITRYC+tsilBTIjCL1/qQb6P6vtP8EkDuXjRShKkXH
	jlfq69P+wPSXgxbCScEzJUpOoBxtydqw44kW/Cjx3IguqEjtc7Z66MMg4fmVsri9+C7UE0
	Zv3STkxuDy94kmxzsUWjBKiNghDWUAE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-0ZK2yxMZPquGi30k9pE3sQ-1; Tue, 13 Oct 2026 09:19:07 +0000
X-MC-Unique: 0ZK2yxMZPquGi30k9pE3sQ-1
X-Mimecast-MFC-AGG-ID: 0ZK2yxMZPquGi30k9pE3sQ_1791883146
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso22061795e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791883146; x=1792487946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ifxJXmHIdOpbrwVmaxz9CH5L1s1R8aDY8bfmqlUzMI=;
        b=lLtyGA2qfs1FtYCSfcwC6xDHa7fRYIYKmkjAQdzIdRx4KQwBGW0ewSyWLoF37tq0m1
         FRszzSMj9Q3vTc3cWpVCjEKPgWfvtFcZMPMS7edla2ZbzHZfgQBtBivvY7PO4cd7cRr5
         9QFHx3WYsoGPvKMAKeKhOOZpq3b9R4Gyty0ta/32T6cPKN1WpTiMZnXldjUdXUf4WebX
         px0UYBX1NwGsCt23gSu444LRzKa3+sYab2Q+zxqYsYzdJimKGidUBD7HjaAa2wMqCxig
         /8UMQQ94FPeLFFWf/12EIQ9JwNi7lcJrARSU7P+lvaGlmZBrO5cETSsj+ZRrLqx0af5k
         g2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883146; x=1792487946;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ifxJXmHIdOpbrwVmaxz9CH5L1s1R8aDY8bfmqlUzMI=;
        b=eMBetUAksv4oCULEF3ksgx42SIovjsO4k/GSkzTmwU+pi2ABVN3qINSZ8M5wR4oVGt
         r/y7qAiEHO0argiLxrvCUp7jXDHSL5Z5EtfPW0PprBK5ZzkojYvU7tHY2eILTggr/Zgz
         3skau/yUkAIo8tpWjfujPd350gEh5Of4wiN8tZ+OTB99aQF0DJwPi4w0YV9NUhPL9sbK
         039A57xLjOqGigbNqQV8ji8T7YVgwBhS6Ayl1gzgbQOXKGTLDGicazYKRbAOcBviqyh/
         Ll4Di47ZOiEECHMBkUuziUe8SUrv10io0CL5NmjXUzFMlBkWaf0zDrx+ygVRL2Fu0Nor
         6I1Q==
X-Forwarded-Encrypted: i=1; AKwUvByEHkI68n+JVIOac0bxluzz8aVRgTiRD93ctxs8B2yxI+9srM1VttT6VDQKFZPzpYv615IUydA4Z7AM5ZA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyAZaK/AN0YLUJ4IiXHM6aFZ5wxo+Xc6fC/JmPaKOOLlAZqqck
	cYlotTp6lvQVDbxA9d06gpC4Q6oRdyYpFHWcwYwJY4yFrbzXa0MhytkXT5o1DkAFgVbg6YCMZng
	WXBnHEYKmRLuIpn+ufMPjbS6eRX6W3pWIvlAU7cjrVq9Pt0ffbzqp8BsZzv3jcsf1ig==
X-Gm-Gg: AYBFou3YW/AZUdK66oU/c/uT+o4aOTd3JdLdXQZmXeTTtbgGuDIaId6bJTGcW0eIWQI
	d/F5gikJ8kEMTzfcZjKnIrfs2M94eFBbHzG/vMzI9OATeH2gQ1CjH/8Jr8XYK0tGb8sXsK4/9PI
	9jxwbZpTlPQ4WRqm+juXdz+l0xATiNMnLesbU2hkre27QFiHdA12eTfD8ypp8FGMugbFDkpHmEQ
	sz6UoofN58SYGV5odbV6tIHdSP1p+zyrqn7wmw7zbwIHWeZKRl/A7TW8b+Ug/rnNiZ6IXNCmn3B
	6BIxjSIOdiwx91CHmlvtzu9N9OIyUwxOX54x2dHeFJtQTEmyJPcMkw71Aw1dOnqas0vjv1NNrwE
	vFlcmsg==
X-Received: by 2002:a05:600c:4e8a:b0:4a1:78dd:dd28 with SMTP id 5b1f17b1804b1-4a18e4d2b31mr237237615e9.27.1791883146073;
        Tue, 13 Oct 2026 02:19:06 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8a:b0:4a1:78dd:dd28 with SMTP id 5b1f17b1804b1-4a18e4d2b31mr237237135e9.27.1791883145585;
        Tue, 13 Oct 2026 02:19:05 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.127.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea0f1csm508318675e9.9.2026.10.13.02.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:19:04 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:18:59 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: netdev@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	linux-kernel@vger.kernel.org, Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: Re: [PATCH net] MAINTAINERS: add Bobby Eshleman as vsock reviewer
Message-ID: <as32zxVBpgdtMUOU@sgarzare-redhat>
References: <20261012-add-maintainers-v1-1-ef0488f460db@meta.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261012-add-maintainers-v1-1-ef0488f460db@meta.com>

On Mon, Oct 12, 2026 at 12:58:08PM -0700, Bobby Eshleman wrote:
>I've been reviewing vsock via lore+lei for a while now.
>
>Finally adding myself as a formal reviewer, since vsock will continue
>being stuck with me for the foreseeable future.

Thank you so much for agreeing to help when we met at LPC xD

>
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
> MAINTAINERS | 2 ++
> 1 file changed, 2 insertions(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

