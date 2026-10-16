Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFC74C6D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138541; cv=none; b=mCwF0NPo38tAz1ySQGe5cczrxU0G/pbitNwmwxQddj3PRlCBsGflFFcid8+DAK+RxhJrruyUo/WMiA8o9Bbyu1I2mq6Vi09S4avFoFqf6AiVxmqGXRYvya34T0SoIw5yvwSGhUeRL5jJoldBM5kPDBIEVehrL89B7USTCiW1VqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138541; c=relaxed/simple;
	bh=Y549rUx82KGZkIt3qwDBp9IS8fAoR7mGvTJsFiDdNL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmQYsfE1/yew74yIHdPOhJBcQlFNLMBMeWprGuiU6FYzzZtiKVBOe3+WbSptja/kwj+INlTb9M1sGlnlxcM1EsghJxG0UahtWuheFvrlU1pfaiSfAAFkPv8lcebCwM6uYbw45htMjP5WIeTtN5BS1WnrBGJP6zWUs06nXhHjjGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TahC5Cqf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=A9rkJ+tS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TahC5Cqf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="A9rkJ+tS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792138535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y549rUx82KGZkIt3qwDBp9IS8fAoR7mGvTJsFiDdNL0=;
	b=TahC5Cqf9xrXKFqeJMaPvV9SRptx5BEvfCluqaVb356mLfcJ33ZblYBPEdGuM8CIUPOIU1
	98za6Y089QZhKnGfwxKH1T5ttbtiAOOCi7UDjuDdyzqZ19cQm2XO3BpljEazPbt8SScWo3
	vBdjKavseSe2kl5pnhe+/lh8zSixo48=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-TZM9SaAnOzuzsSq5hDJ-Ug-1; Fri, 16 Oct 2026 08:15:32 +0000
X-MC-Unique: TZM9SaAnOzuzsSq5hDJ-Ug-1
X-Mimecast-MFC-AGG-ID: TZM9SaAnOzuzsSq5hDJ-Ug_1792138531
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e00f3929bso131613f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792138531; x=1792743331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y549rUx82KGZkIt3qwDBp9IS8fAoR7mGvTJsFiDdNL0=;
        b=A9rkJ+tSYKGpUFvPNTmhlzORUFAlukNM0r8SR7NtoSYCBe8+5LLOPnrLix4Id536va
         NrS9dGQCMVQW3E+upW2sK39arNviDa6RAFCP9tQg9XLfwTiOi62VvPs2dTCYf50ksNqy
         lZArJqDz24yWhIeOxBAQQOWNosNdV4hCQXdkyaDW1JUNQr09gskSSr+IxELu1869ekJF
         ajeYWW9Z8M2VfawKLFIDlRHBEvYVZpRGCUuK+liJRisSj/5MhWfnsXwkRAu0nkb3CqP9
         mmWrsu/6orC8+RPVbDF0epYU4xgzyIXPTtUYddC3wsk/klKXcXovUJDA1It6uuAHMnhm
         NODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138531; x=1792743331;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y549rUx82KGZkIt3qwDBp9IS8fAoR7mGvTJsFiDdNL0=;
        b=Ctr95F0PXT+WJqF7ZHelQIfRCVzvJXKpBPeY/R3ZZpt7do0zPyd6uPicC90G0qLdtR
         z3/kt/hmbeUDDtWWqmdi9QaiIFjvjbv+fBkbQ6wm1VRVGIgWhKPfsj6Y4AtFdHnrtflL
         a95IcWZgVyl22nvXh4qhaj8KTyHkY8yguRB3HZkDJcYk1g6IIMRdiBHA8eLqagitLc1D
         k4ez7awBk6bho4JKqWzO4/YNy7EUi13h0ShYYMDRhcGhrNxfyIka3d5xz7UfPktJFGoc
         YQBkF5xspdKihhV1u1JzHDGs7HXBTMXfUUxtGXqBy7mV7IuCQsOmD1E85ChA/5WY38NX
         bMlA==
X-Forwarded-Encrypted: i=1; AKwUvByH4wI2z3ykSnQ+e3kqiwxhPxSNR4b9wEiAVlMD/GmXPBAMEfTNjW0tttDGlx9EpEaCdrO6XYz5MBG56AM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKk8Td7PuCn1t6O2CaqMZDAlqLo6+reG0cmHB/FtEOJWr7znPCm
	v/lIj9KHxpz4A7ONwj44XMjZQK0bvIbfdm/1jyXs/l+P7CKpELMPteYVVIs+TaSnwuCg92CrDCV
	12f2/D1gdWNKc4mQFQsfPgyypb7Zx2V3YDhev4fIF4CEsxLHvQoc5vrxtCBTgCTat0w==
X-Gm-Gg: AYBFou0nbz5F1tckh63xHLVdI1KeAfp+PRaoxeIlCUbdTQag+65KEGHj8uMFReGf1Y0
	fgrD74DxSUpM+z+7K90o++nbt+DYQgO2bAvbxSA6ApCr++7o5wDROLlvVkDHVPgDY8OJvtEl/E8
	xGn6YglhwBouPKz7sxigJlQAOtIPh8wZkSjOhn/CGkmVt9bogqCdbxj3DpMBzzx2sz33ri7kEJ2
	5VdDhBoU3qmihDRzyACKMf3ygkoboCeSc7C5LsjVsxk8DCpgeM/Dqmx/cYKhfekoDh37C9TqxQm
	boDz0wa9h3H6k22FT45shoks+rby4ioL2E9f/zDI1IOi7WgVu7XoJMafy/OKyfHEXIzUESKgasG
	zF/WM
X-Received: by 2002:a05:6000:4549:b0:48d:ed0e:6bb4 with SMTP id ffacd0b85a97d-48dfadf34c1mr4227588f8f.4.1792138531285;
        Fri, 16 Oct 2026 01:15:31 -0700 (PDT)
X-Received: by 2002:a05:6000:4549:b0:48d:ed0e:6bb4 with SMTP id ffacd0b85a97d-48dfadf34c1mr4227528f8f.4.1792138530803;
        Fri, 16 Oct 2026 01:15:30 -0700 (PDT)
Received: from sgarzare-redhat ([80.116.137.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c0894sm3190609f8f.12.2026.10.16.01.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:15:29 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:15:27 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: David Carlier <devnexen@gmail.com>
Cc: netdev@vger.kernel.org, bobbyeshleman@gmail.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] vsock/test: cover SO_INQ
Message-ID: <atHdAlIdUqNIoDNn@sgarzare-redhat>
References: <20261015154334.3217358-1-devnexen@gmail.com>
 <20261015154334.3217358-3-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261015154334.3217358-3-devnexen@gmail.com>

On Thu, Oct 15, 2026 at 04:43:34PM +0100, David Carlier wrote:
>Check the SCM_INQ value after a partial receive, after draining the
>queue and at EOF, that no cmsg is sent while the option is off, that
>accepted sockets inherit it from the listener, and that out of range
>values and SOCK_SEQPACKET are rejected.
>
>Signed-off-by: David Carlier <devnexen@gmail.com>
>---
> tools/testing/vsock/vsock_test.c | 279 +++++++++++++++++++++++++++++++
> 1 file changed, 279 insertions(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

