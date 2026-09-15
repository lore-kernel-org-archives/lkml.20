Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731A348821F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489988; cv=none; b=hzDbRKSj+iCkjETPf4hnpddGh6UwptjOTz+XZKBJaRFpfjIr9rsHCaGuyvz01s79KP8qvIOmWNjNW0tGnRaEeefOvOgjoaEOErEui+RBuQWkBtM3LbenMlPUgBIXE/6AcImt7KV9cZbxrIEu8qMHdIDn2XFsCU6UZ0wJc7HezGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489988; c=relaxed/simple;
	bh=Xzgz+4tsqdIJiJ44u0qBX2B1GLvXUOfXVH0aIZzJ9Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2rZ7yX13Tsc69dS2jSp/QlGoWtSvd3Rkpkb+U6RXYe9XRRypZFmWKLl4qjiL/4uM4FgFBUFxFwF/90a1Gu3ccGI10PUZcvR7Z3IATBMotsY9iiT030Ua5O+1xSrXmESugsD6yO3jsJDBHi9He30IHlwtnmWX466Q+6vItD3bv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EMuy/4E5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NiyXGILZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EMuy/4E5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NiyXGILZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789489985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zGgRa3VPDYgehvQnqiC0LfcNhzBWNqGieMYcbjfd6B4=;
	b=EMuy/4E5cIH/zpPjsfVnZ+f5iluwYV677C8HfFeKeG3iEOEdWFUFD6XYcEO4kVRTG365m4
	tj52mKho/n8mdZIwPPwwDHwU7AxHJQjeaIWqZ4mkS7XEEONP4wlsRoL+EmcSGTYq1blYZ9
	cY1wlFYBiMLi0iA7CLJkoK0mpSb6GHI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-X_QUg94UORKJXEB_7EPWWw-1; Tue, 15 Sep 2026 12:33:04 -0400
X-MC-Unique: X_QUg94UORKJXEB_7EPWWw-1
X-Mimecast-MFC-AGG-ID: X_QUg94UORKJXEB_7EPWWw_1789489983
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e6683d48fso40406195e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789489983; x=1790094783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zGgRa3VPDYgehvQnqiC0LfcNhzBWNqGieMYcbjfd6B4=;
        b=NiyXGILZXXkYsKiUM8gekg0NdAkMrNWfZPRNbtbyW0Jch4fUcvZyglEloXy0rv3pmg
         fjTxNQAxhRHszyeHFb53qxpBptHq1S+TL73LcZ8Mmprmzjt2kd8xVqN1oRPcw0loo1JT
         Y++A4c5bTIrSGd1vjjI1mIDIRhZh92dXxs/T7TyKmYNqMmW6LBqVnffvpvK4NYQiCncs
         IxjWdBOIfo0s5uB6DyklvFZWg8iXUfenDDoOK7p2jo6YbcAK5XmooCbDw1qLiN6Z/S3M
         dkjLid/MZfcr4KGHRvmdPpOWFRxZ8P7bPMdWByyUzKFIrFhE7p56InXjyfjlNLtzb2oQ
         H9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789489983; x=1790094783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zGgRa3VPDYgehvQnqiC0LfcNhzBWNqGieMYcbjfd6B4=;
        b=HHVq7PwnsCd/aeV5sz2hC5BE6ynw+JsiqWbtSGgpEokkkw1MLlcDwMkDzwh+pXRrXC
         vakrDRb4GygSJAmptRdri/iPEkk3diAG2RKOuh/bo3EL5SDSbwc7XZz4TUcGQ+vJnvu9
         i1QzQajEskS/5jQ+dfcuCKKXlsV39O2QfGjFeWWj9YqSOx8hrPPJ5i5DhyzHuNR89zW/
         QfG456uyILCKOR72gSUZMw8xQSEkirvY7LYOD9tJ+fDwxucS9oXCxaBXt9386KM2fDKS
         HGQeXrmtqiUZhoOiQqK707BMZEbSBBLObqW/zbcxlkphnr5s4mlDYM0fhuqq3N0vzPtO
         hjbA==
X-Forwarded-Encrypted: i=1; AKwUvBzgfrQvEhaddyPdT6570z1cZwkjTvyNbwNr969nQAC7oA3uHO0qs8emWBLMwKDiJLThtBhiK5yU19n7ssc=@vger.kernel.org
X-Gm-Message-State: AFuF++l4HvIvq0Ogu6+CGibs1HmzIhXWkuRVZbKzxPKVF22Fl6sYhT0V
	eHs92vT7xbJbwA9WTt1aSSE/IsLPwScIAIRKfxp0DOuBWxVLRFRUVaMtwEx9IkJW5mwlUTg4mdp
	lrCTcYmbIwA4EVOVNuUIuUnkQPuKu6Bxd/wqF28n843mB1RCo3O/k0B5noT00yPi1cezfjrlSKd
	Ac
X-Gm-Gg: AYBFou0lgbp54u24UdvEU2YJ+TRmw/ZHmFSoq15yL5piJWGKvIzpewtcyHbfEzodfiN
	Ishau2PmXjdIII4wIE+NRrl0E0Fc5NV+TbgEhISWUQQ+TKO0sxY2LzvT7MhiTdKSTilYKsnW/1N
	wNCryTagPWjNFFiV7gL1vDKH4W97FF6vrsQyFEp+KwwjjC0RSAcNtjLBsOiZjjz/xCQ3y9zfPzM
	FO0uF+Nn3JCb5rBmPbs0OcmVlbOkjdB7pyGTZe2sin3rDchvwNIVcmal8GmB62b6fXqF2loBGe/
	ypAULZtwoL8gC30p6Zj/+g3N15UoSaTYNFCa3ZKwmklbXem9esM1pbqS6hYV4XumJGIRWpbu9zJ
	n0mslkqH0ZJis0z/xDu9AUR4v7HAqDc010ec=
X-Received: by 2002:a05:600c:548b:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-49e8227eb75mr26724415e9.19.1789489982820;
        Tue, 15 Sep 2026 09:33:02 -0700 (PDT)
X-Received: by 2002:a05:600c:548b:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-49e8227eb75mr26723975e9.19.1789489982463;
        Tue, 15 Sep 2026 09:33:02 -0700 (PDT)
Received: from leonardi-redhat ([151.29.41.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dba8f4sm1920305e9.13.2026.09.15.09.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:33:02 -0700 (PDT)
Date: Tue, 15 Sep 2026 18:32:59 +0200
From: Luigi Leonardi <leonardi@redhat.com>
To: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2] vsock: ignore empty child namespace mode writes
Message-ID: <aqli0Mq_jv28h7eW@leonardi-redhat>
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

Hi Aldo,

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
>
> 	if (write) {
> 		/* Prevent a "local" namespace from escalating to "global",
>-- 
>2.43.0
>

Code LGTM.
Reviewed-by: Luigi Leonardi <leonardi@redhat.com>

To reproduce it, I suppose we need a kernel that does not come with
`CONFIG_INIT_STACK_ALL_ZERO` set.

@Stefano do you think it's worth adding a test for this case?

Just out of curiosity, how did you find this bug?

Thanks,
Luigi

