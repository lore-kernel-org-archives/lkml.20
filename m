Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977463;
	b=zX5rzVZYOcWV8HzdTTqHDfLeBUVQipnd3YQSTdukslIxmSvY9KmZTmsFfEcebHwoeVP2
	 vT3m3IECMhDr8h/pmLIyyLVR95JnYQkn4Jl2TWsRDKK3HB0JUycjCM/uZFW2qHHoS1MVV
	 g06OojZV0UIOZnJpWdA9BNL+tooxXm5MmDfvx7bZDg3r7XGEuiGIinvfu6UwTC8eqCgvA
	 y0KbZ8fnBkEcT3v+/lDvhm5gI+mrHCIrbtmR7HrTkNuJjtMFOkT3Jz7qnaEH8rnRH6uKT
	 uWvWyuSA3tsAKbUeZu0LH1uxz7UlDd5917eRHtQfKAfMhdrUDt0kPYYfOn74KszvPJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977463;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VFHEfM7uSHxmbeEDYFc714iPr6SLeYV/p8Cpk1n20G0=;
	b=U5kJHQv1MTQ5owRxiNMscj5NUHU+IuI/lDFVHosHoErWqfNbBgawRBzzb1Z3tm3ThYQp
	 D2iiV9lGjtuihkS7w06sVhjQSSMKyhecoInfZnIpdWNeAgn2rMUnVf/dLP5oq82Jvjbbz
	 CovOOckwyWeEF4cBceB3L0joTTKw9mBFjy4Fkf9o+qoEm38qVqP/NzQN3ypMHhYUJmO/k
	 m2TpT1h2vbEmR1skuBDtycYeEicvpS7++znZCjjHlouvzIijvsY+WnXLKFnNwy610904L
	 MAewwKTnU/ZrjdsaxuPOmrlMN/XBXCR7t3/RtfMSI1GRvfZODXHlEpBJPviBaDovQ4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YWJI0aR8;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lH6F5qDZ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BE0606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19BE0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YWJI0aR8;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lH6F5qDZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793977462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VFHEfM7uSHxmbeEDYFc714iPr6SLeYV/p8Cpk1n20G0=;
	b=YWJI0aR83JkRMYKC0xUEf5vevtX22MosZC0Oecjg+f3OnI1AzAu5y0AbeQ+nnnrl0dbVTy
	zZ4ilrR9UXX3PZMpj4qOjXR5a9A0numo2IMEuW0CPNvW8VecPl3lo+CsGzCfyrSNrE7V84
	Y4IO5afjsaMgUNEZKHibuxJSXkSqjpM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-4wqnm3mzN-a7BUfRlMPWmA-1; Fri, 06 Nov 2026 10:04:20 -0500
X-MC-Unique: 4wqnm3mzN-a7BUfRlMPWmA-1
X-Mimecast-MFC-AGG-ID: 4wqnm3mzN-a7BUfRlMPWmA_1793977460
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso8096505e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793977459; x=1794582259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VFHEfM7uSHxmbeEDYFc714iPr6SLeYV/p8Cpk1n20G0=;
        b=lH6F5qDZFAW2R8WRj/bfdN6KSiZ8hocg3KZYkH+5e7o/rAOjOz8TDo+8xuKLci11wC
         XOD0efolga1GHdS5wVPvsygwjf5mJkNywIGTmf3NtJ6D59I7qD2xgaZE/MUncSyOsvqp
         Cu5GufZasYC0x4y8kTR0gxk71rhIoGT8rjA3otvK67uWuWJ+ounZ/8G3LEy2QaBxkw04
         zg3besPy9b154j5dH4lSk8E92Y6IdxilLaT8KrTJHeiOaHLIhReUJF/JgpUtv25/9EZ+
         GxwSthaMDdbqU+qQSipE/V3/Fr+JcXtFrtkHr3Pf9pyiDaeY3+PICsRjrFxaWzRLXnjv
         fdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977459; x=1794582259;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VFHEfM7uSHxmbeEDYFc714iPr6SLeYV/p8Cpk1n20G0=;
        b=TqChzCmYc1ODFYrOoHHwV+RE0q6Sd8B3JT8y1luD58YuraBc8sUuUcdYTPryh/Shel
         yOOL6Ywst2vFEfQctpi/DmMwoJmB8mtPNJpIYJHomgh5X5TR9VN60TUsu3ACXewQ86ji
         yZkAwYsnybbc76dFSWbajft1cy4hF4RgsUZKXPr1er1n8fhPvm3eFaitp1cuYcSyq3Zg
         tIbE3AZMxCl6Q2FRMQUfTyFxZ/0UfWDNWQCSsSlb6OgZzvICuB0wHegLwcjtiqOnQuTQ
         /WLriuFijv5tpogxQZ8lDhnWAm70nrqvsgMz7EbXV1kz4oj+B5Sa5alCtTGGbXBBdr/M
         Zyug==
X-Forwarded-Encrypted: i=1; AKwUvBz1pZAoNDGM11jJTT/oLzlSsnesQxbrDgwMsO6hwpiQPMN7lac9kUwHWuShhik0bKTPK2fYmu/3Hphx3XU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n7RYDJFv5oyMtpiSJ0yQFEQ/NMcmoXuAyfnf3Bd927vp2ddH/
	cA6uLJ0vE8O0py+IMbsqCunEJ2jmYLMRZj80PSsDQXNZVoS0hTOso0bhOaSp28mnfv+lRC+zhg/
	UWkY9bxJDdEH+mjItQIw6oNSLcB/su4Jl5JRP+JSROQiZA4uA0EP/ojAcya7R/nuStA==
X-Gm-Gg: AYBFou1i0whfYjvkVmqX1ubnOTDQmDhXd7MykZtCvAh3nrHg1EWd5Pm5w67NSoj/AOq
	0pfP3Jw8WNL0mzizKIxgpmQ6OAjAzXIA6U90XHPL3/vbGKZKS+8g44WeF7HxpPw1F/rQFmVoAMB
	wjI1+uEDMQi7sbB+pxVuMxQeXS6OQ0pDOrRr7GmJh/400buVboKOw79HZSIDBte2fK1CfC7zyL6
	DKBLLzesgFBzq7t/PoSEehu7jLirh5/naQ/eTcpqWYoF+yJqtD1SvxVBgNOCzfe0AU3K0Dc5Gzo
	AqcQRitgtFeGSxSZj3ceuSSOT6cskLWyMCbNDt+wxWQNgIbZxYgy8cmfKQmtTEYhND81myTm426
	H262ld5B+79KhltsXc4mQfWlgjHdFKmz8po5XNa2+mHB7DkJqbHy2m78SG79ydMKYBkjQL3QZRI
	RUD23zqimP
X-Received: by 2002:a05:600c:37c9:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4b6df8c9cbbmr42830035e9.21.1793977459539;
        Fri, 06 Nov 2026 07:04:19 -0800 (PST)
X-Received: by 2002:a05:600c:37c9:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4b6df8c9cbbmr42829535e9.21.1793977459116;
        Fri, 06 Nov 2026 07:04:19 -0800 (PST)
Received: from leonardi-redhat ([176.206.36.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7626a2804sm29251095e9.4.2026.11.06.07.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:04:17 -0800 (PST)
Date: Fri, 6 Nov 2026 16:04:15 +0100
From: Luigi Leonardi <leonardi@redhat.com>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Simon Horman <horms@kernel.org>, 
	Xuewei Niu <niuxuewei.nxw@antgroup.com>, linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] hv_sock: Report no unread data before a channel is
 available
Message-ID: <au3sW3i2qjKDLMzq@leonardi-redhat>
References: <20261106123920.162131-1-parri.andrea@gmail.com>
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
In-Reply-To: <20261106123920.162131-1-parri.andrea@gmail.com>

On Fri, Nov 06, 2026 at 01:39:18PM +0100, Andrea Parri wrote:
>The Hyper-V transport is assigned before the asynchronous VMBus channel
>offer completes.  Its zero-initialized hvsock therefore has a NULL chan
>until hvs_open_connection() associates the channel with the socket.
>
>SIOCINQ can query the assigned transport while the socket is connecting,
>or after connect() fails once the transport has been assigned.  Unlike
>poll(), that path does not check stream_is_active() before calling the
>transport's stream_has_data callback.  hvs_stream_has_data() then passes
>the NULL channel to hvs_channel_readable_payload(), and any user in the
>guest can trigger an oops:
>
>  BUG: kernel NULL pointer dereference, address: 0000000000000178
>  RIP: 0010:hvs_stream_has_data+0x23/0x120
>  Call Trace:
>   <TASK>
>   ? vsock_ioctl+0x74/0xf0
>   sock_do_ioctl+0x42/0xf0
>   sock_ioctl+0x27d/0x310
>   do_vfs_ioctl+0x700/0x810
>   __x64_sys_ioctl+0x7d/0xf0
>
>Return zero unread bytes when no channel is available, before accessing
>the receive state or ring.  Leave the existing channel-backed receive
>handling unchanged.
>
>The oops was reproduced on an unmodified v7.4-rc1 kernel in a WSL2
>guest with a small user-space program, available on request.  With this
>patch, the program reports zero unread bytes and the kernel logs nothing.
>Other vsock_test cases were not run, as most of them need a host-side
>peer.
>
>AI assistance was used to identify the issue and develop the fix.
>
>Fixes: f7c722659275 ("vsock: Add support for SIOCINQ ioctl")
>Cc: stable@vger.kernel.org
>Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
>---

oops, thanks!

Reviewed-by: Luigi Leonardi <leonardi@redhat.com>

Luigi

