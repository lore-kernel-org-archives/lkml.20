Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362201;
	b=0XsJ4neVmVspa0z7XYAO1xguWr2i9rhPC1KNsf+wDSFmUsJ3oXBFKPzaKTMtYgIXxUGn
	 F7Y/mV/LJ7Gm1dfEG1DFH/bDLbrSOt2PAJpzx+o3aCFmjS9FqOL/2AOyiexp1AoNf+v3x
	 BuN7YarWrPLFfImi6CJxf1fjGwuPfck05gBHjAmiVhcdpM/G3go8uSBtRw95qo5TyYG5N
	 1SL8EyjSALlgo8D7VO1L6VANDifkWGASss+TtraUSApczwzae6p8npK6b3ksr1qFta1yY
	 AHoCwyPXaIpnhqD4/+URphUUaT3dmSyG9H3TKOABndjHy23Elv53DkLIc/xG33pLZSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362201;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hdnZT0z7davEfnf6scqYwmgfFD2zK/8ZHhv4LP8xp6I=;
	b=1n1bPXUQgQ/UjL8d4gX9B1qlZ6GFD0qlj77jP+3rwz9VzBHbgCfpUeIMvCqSa3As4pa3
	 53UjCwFZozvUueJ/XxIM64Bpm99qhojRQxIHIFeuYRKlKLRtJYzsiq3vDyhLoqM6q6Qq6
	 RCnaPt9kglFpgOQFFu1Hjo0PvAh2GKg3Bt6fY4L8/Nb6kujoWzcIdMTp5EVlR6Ez6BNVL
	 TSacjSDV3CW4OuzNEFaNq5HJXL5yl9V6lsWF6t7nbG6GIozfJEmr9BNe+AcM0G01kYU2T
	 UPEFwh9Hgvtfqd6lD4NHZRrsS5SNJW+w3wm3K9GlqLI+lffUePz4S42MTLNXNE5aMsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BqOf8diA;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=btKxDoL3;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B5D606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36B5D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BqOf8diA;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=btKxDoL3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793362200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hdnZT0z7davEfnf6scqYwmgfFD2zK/8ZHhv4LP8xp6I=;
	b=BqOf8diA9nKyv0sLv0Kmau5iUYUmdWBgvT4UnRHRpDY/OwJvF9RFPMjBgUJ1EdIa/XKVdy
	4+XTbQsp8mS7qFeOwBMi4C/NI1WiVdpCUUwJKXqbd+r7tWa1LiESkgC0Xb6Sow+SP7VcCa
	K6V8oxceSDBFFgwTgK0+BXhmTH8W+WQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-sEgFuphTMEyCo7ApeMeW6g-1; Fri, 30 Oct 2026 08:09:52 -0400
X-MC-Unique: sEgFuphTMEyCo7ApeMeW6g-1
X-Mimecast-MFC-AGG-ID: sEgFuphTMEyCo7ApeMeW6g_1793362191
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a318cd95e8so5881525e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793362191; x=1793966991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hdnZT0z7davEfnf6scqYwmgfFD2zK/8ZHhv4LP8xp6I=;
        b=btKxDoL3d9ODnAsVLbkTV6f/9SYd54SrOrF1/xXSp25TaA9ZWhcjwjZSRsW1A5ckhW
         zhrBjJpLOl30HHyx7wze1VjvU8RxxQ6mh7jRDYkwQwlooRp46PhgxM8JuIsilmVabW9f
         D3+g3VTI3YiPF3lDjoNlxk1amcS6pnBC8IcBlwqi6gXh4uGXv5Jkm09LbqbDa5Ih6IAp
         aBpibP1l+NfW9OaNF23sfkW65ry6RjJsngStBHzByIo4IN3+f8slPaM6OmI4QVw9/I2G
         Vd7Yb1zLXcbOY4WErusHcAUIzC2Ivls5jyh8vG89XM8a3a1iEzixclCPontDridybVw+
         OJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793362191; x=1793966991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdnZT0z7davEfnf6scqYwmgfFD2zK/8ZHhv4LP8xp6I=;
        b=UPT9JF1WAGj+Es15/X0smIT3+aEPWHY0aokAABFJRH0TZQpH7cEWWhGsJYmmTH8yIs
         YkZUOmMkuSZWAdWEwUnfr0xru8pnoYh6xITQUxUpmZYmMzPCWYAUylqdQIRtBQzV7/Tq
         HihBLqgTPDMd7BgTsMAtsr9o+3JkQLE7PKO5D8htD2l/Gq/lgWt4lRBL4Jsgn2TOPpAJ
         5T079G2Zk6hEml+Z3omQuq6xP5AEUX1HFVERYdfYT/wPR4eS03vnyv8BM10Km9tzjGow
         pO4qjjBuvBgqx6UFyD2cOHEp7iHBB4jOxta+BOPk/TgfAXpSv09OEZ1k+YUntIgN3zrU
         gXNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEz1ZwwnJFXHedJ/XWCFeYygSdfHx8Xq2KnkMUCawN5fkZ0hMvkv8HciLmfmwir2sA8zMGaJC2bYcZDNQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/KescztNPNDjZD12Rfbyl4PzKxRIFBGNHTJ9AYqbFCt5cvAks
	97NE9K4HpBllsNuDtfUGrV8++NW7nQ7KPg8VSxW9pyBNIXCGlO9vHywHr3LouPMRu8zFoyIz7iH
	qNIMASwr5f7/Z/F4AwEUWF8TPnKBiPJ1pxcQzV4HQLOvxUDSecKMvTRfxsCcv1ON1NQ==
X-Gm-Gg: AYBFou1q5mL0sRfq/KnGnAzcH3iPCTudW5OgUUeXnWhXcHveXbxhxj/ovdmenopYpzR
	ImrvbWh6RfcOFA0aCGcVtfcJG4FSiuxBWR2lmVNUH+5nETHQ7eY6MTjx1bsJiHADevjjavwttFG
	oFnMVAsj0jk0hQZqpNut31btc8h5vf+d31OQFcCkiB55KTMYXLXGkhKyt12eF0rKM6Fzw5KI1WO
	FR9ArAmZGtjz1/z7gztwQgRojRfVP/q6oel0ZhPD5dL2iBkaNCu7irhZ3qIFbWWQATECYtw9f7V
	DUTv4lCdkmR8b8UqO9pclcAhxhCnxJNRtD0OytxPUVj+QTUmRRwc/AFf6R0rp+rpTFB5t9V7l3P
	ejiA6N1kUZXuOjM9VRnI1umFmqZpsYuU+Vg50zVXv7sx8+0AOY+KOklpyowhVeGWR2OEy06N84j
	bsJg9QbTGqSeF+hLk=
X-Received: by 2002:a05:600c:37c8:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4ac16acd93cmr47054025e9.6.1793362191519;
        Fri, 30 Oct 2026 05:09:51 -0700 (PDT)
X-Received: by 2002:a05:600c:37c8:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4ac16acd93cmr47053415e9.6.1793362191072;
        Fri, 30 Oct 2026 05:09:51 -0700 (PDT)
Received: from sgarzare-redhat (ip190-139-192-82.pool-bba.aruba.it. [82.192.139.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aa704sm54507825e9.8.2026.10.30.05.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:09:50 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:09:42 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: phind.uet@gmail.com
Cc: Bobby Eshleman <bobbyeshleman@meta.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	George Zhang <georgezhang@vmware.com>, Andy King <acking@vmware.com>, Dmitry Torokhov <dtor@vmware.com>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vsock: reject negative tv_usec in
 SO_VM_SOCKETS_CONNECT_TIMEOUT
Message-ID: <auSIGIZctLp1oOhf@sgarzare-redhat>
References: <20261030064428.73930-1-phind.uet@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261030064428.73930-1-phind.uet@gmail.com>

On Fri, Oct 30, 2026 at 02:43:50PM +0800, phind.uet@gmail.com wrote:
>From: Nguyen Dinh Phi <phind.uet@gmail.com>
>
>The timeval validation checks tv_usec < USEC_PER_SEC but not
>tv_usec >= 0, so a negative tv_usec makes the timeout computation
>wrap into a bogus value, later tripping "schedule_timeout: wrong
>timeout value" instead of being rejected.
>
>Fixes: d021c344051a ("VSOCK: Introduce VM Sockets")
>

This blank line shouldn't be there, maybe it can be fixed when the net 
maintainers apply this patch, so please wait their comments before 
sending a v2.

>Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
>---
> net/vmw_vsock/af_vsock.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index d0508887a2fb..1d7d53542724 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -2156,7 +2156,8 @@ static int vsock_connectible_setsockopt(struct socket *sock,
> 					     optname == SO_VM_SOCKETS_CONNECT_TIMEOUT_OLD);
> 		if (err)
> 			break;
>-		if (tv.tv_sec >= 0 && tv.tv_usec < USEC_PER_SEC &&
>+		if (tv.tv_sec >= 0 && tv.tv_usec >= 0 &&
>+		    tv.tv_usec < USEC_PER_SEC &&
> 		    tv.tv_sec < (MAX_SCHEDULE_TIMEOUT / HZ - 1)) {
> 			vsk->connect_timeout = tv.tv_sec * HZ +
> 				DIV_ROUND_UP((unsigned long)tv.tv_usec, (USEC_PER_SEC / HZ));
>-- 
>2.43.0
>

LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


