Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0F722A4F1
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792199371; cv=none; b=UW8ZWatMjXcpcpHa+QX9UDpfraum27RJygGwv20OFrouiTiJ5kwff1oYh6RqyTSgUcVs3bY9YVmenlqSJnm6EAtFqJ5gNBOMw4Co/cu6l3Ac7M07wvHztUlWVTj8NmRj4Zkst/tESRdFDYtLY/48sQGAudDignrR1dBT9+im/2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792199371; c=relaxed/simple;
	bh=XVP7VgwmFS1l8OgeV7xL1TtOBdkcTzkbgWgi4SDvNdM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=qJLj6Qa8wuxUNV2uc50m/tl4DZfDPLYUjh1/ErqIElCuwNuL3LCQRsiaORDT0URWIi5AAOnB4cCPY4jkau5J1qkUfxLKy4r/rHrmZ3EKfESv3ezdGRCqYrJmXPbeHdQxqHkzezg9LNJeFznk4vR4zip6RglA5fpmYXb5Yh/zn/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEe0dia3; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEe0dia3"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9905d61449cso110808241.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792199369; x=1792804169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XeNbXablXhJqiCV04B7oY6//U0VnicAkT7qj9GdtyP4=;
        b=dEe0dia3Mdf/S8bZmbbckpmr1BS/t02+Du5YqjSBunSK21yoq5LvMdrOu2wzs9K7Ue
         95nUfax4fZTXDHNqyMX3IIrJN3Qh722NT/Uy9HBAIRE+JIg7OI9sU5iIjgOKNDUf1uoL
         eMy1vnEmRyTbIQjo8rES85/qcVaLX9MDyPSIqkmKsv0a54SYRF4AmraJR+G9Ffo2yS/8
         gncIUR/kv/o+VI8JioT2hyk1omYRGYdHQM6obDjc68Bo8T7EN2EwizL0gzjUJyQou2u0
         pgesZbmkoGcpwcmgk8hD+pdwJxraugQ3CRnc08DnjAArJviTPcgLIgQ8g6SKMZznJMIL
         jf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792199369; x=1792804169;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XeNbXablXhJqiCV04B7oY6//U0VnicAkT7qj9GdtyP4=;
        b=Fzu+Zq4TzQFR5BmC8/G79UQHu1gyaCTcCI/32bGg0+Zb4P8npsbAXDiK0VlrUZy7T9
         p/93GSbwpOQoUoRc8TxR3zVUQu5enljG5dKZjVpGHyV12FaDNI3HPqi8dQZPKoNd3PiE
         MHle8stdaoBSw9Um3ZL5R5ejff2h8Pk8Clz0e/KEa2OZYGSwdXyvDCPKbKz2je3c2dQD
         H0o8Pbb2DMgkFZaw2okqwDqo32R4j5wzDrStwGWq+hXcdop5zQDpUWWAaEdFxKyuoZA6
         Ry9vONf9sbyhU4V8GZZ6egoUjXJpk7e7bRlcrJGbxV+O3OpS2xxOKz0BnskTo6CblXod
         /Hww==
X-Gm-Message-State: AFq9FYLncuIfu8rAJh0z50exbQjPc7noSCVY6mAVeExIUwqOjsE5Vus+
	jDSqGzOj6FYzGo9ACq/fbOIg/3kFQIs7SrFkueURhJzJuoOuFBaLMPL0
X-Gm-Gg: AYBFou1aUwz+NR/r6SVUBqXdF6hXxaLD8Vvt9OlFGZTtl0fT8RHt47Dn2EQlj8q1/m7
	MVWuwmAVLeBK8d5pguaV2wsXo/dK0KOMoZxkZ6RnneQigH1uVAc3oUiM19LS7anGtXtlMKZavKs
	E1CDehX+KkhtFJryj5pq33DILof5otzQRywJ2la8gsuG1cvtNxWaTm1SJUkaeAxF5oEwrwmfwIq
	khqWaia5/MJd1VSCjhB2oQ9SAXX/ZjL4ejSpfNaCYw5DwcHPnRGf89m69kdk5Bbaz84WffbDeA7
	31PL/+IxHYw6mT+2ejeEffnuomV7/cq+ugi7zoutWWmZjOQFIcFGCMMolMjYIZDA2RWYVbgcRts
	QdbrY2Vko+MWwEnVLls6o471yLcNKUVvcU4U/MR6AdnNuMLEQ6s5bX88EiR5kSXoQoxDZrLOA5P
	P05C3FeU19P5mGQXqAK1O7zsskt1lV1xVdniFKfVJ5BhqoyK1EGpFla8TfYpI6D2YomgR80DS55
	5FwxfzgGiyatubx5GKX6PGd2WqOkRdlY+lAcgq/iTgGUI8VEm6YfUe9xZ1YbBLGkJ9edWMQh0qp
	GClXGaD5wH5FYnFW89v8c8fIf+9Y5+ixo4fVaVs=
X-Received: by 2002:a05:6102:6d0:b0:7cc:285d:4df7 with SMTP id ada2fe7eead31-7cc3699ca12mr344286137.16.1792199368918;
        Fri, 16 Oct 2026 18:09:28 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc1987c95csm3579604137.11.2026.10.16.18.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:09:28 -0700 (PDT)
Date: Fri, 16 Oct 2026 21:09:27 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
 Jason Wang <jasowangio@gmail.com>, 
 =?UTF-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, 
 virtualization@lists.linux.dev, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Max Krasnyansky <maxk@qualcomm.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Simon Horman <horms@kernel.org>, 
 linux-doc@vger.kernel.org
Message-ID: <willemdebruijn.kernel.32f6b1ecd121a@gmail.com>
In-Reply-To: <20261016143944-mutt-send-email-mst@kernel.org>
References: <cover.1792067836.git.mst@redhat.com>
 <ad05a40681719a579691a1da6413f0dd7064f2a0.1792067836.git.mst@redhat.com>
 <willemdebruijn.kernel.3a7d04e1c306e@gmail.com>
 <20261016051827-mutt-send-email-mst@kernel.org>
 <willemdebruijn.kernel.1d7ce6b64753a@gmail.com>
 <20261016134823-mutt-send-email-mst@kernel.org>
 <willemdebruijn.kernel.2deaddfb31bd9@gmail.com>
 <20261016143944-mutt-send-email-mst@kernel.org>
Subject: Re: [PATCH net-next v2 5/7] net: add a sysctl to opt out of virtio
 net hdr checksum validation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

> > > > > > Should this be a global sysctl, rather than per netns?
> > > > > 
> > > > > 
> > > > > For customers I work with, it would be much less useful.
> > > > 
> > > > Third option: make it an integer rather than a boolean.
> > > > 
> > > > 0: no validation
> > > > 1: current level of validation
> > > > 2 and beyond: if we have to extend it later
> > > > 
> > > > Not pretty, I'll admit. So fine to keep as is too if you prefer.
> > > > But I do foresee more changes in this area, if history is a guide.
> > > >  
> > > > > 
> > > > > > Even if per-netns, most likely do not want it writable by netns root
> > > > > > with user namespaces.
> > > > > >
> > > > > > That is the equivalent of ns_capable(CAP_NET_RAW), which is the cause
> > > > > > of many crashes due to bad packets ingested by, e.g., a packet socket.
> > > > > 
> > > > > Hmm, yes i get that. Two knobs? a. verify b. the per netns value ro? Both
> > > > > on by default?
> > > > 
> > > > A single system wide field is simplest.
> > > > 
> > > > Is there a benefit to making this configurable on a per netns basis?
> > > 
> > > As I tried to explain: a specific container breaks, you decide to trust it,
> > > you do not need to trust all.
> > 
> > Ok
> > 
> > > > If so, that's fine too. As long as root-in-namespace cannot modify it,
> > > > so readonly indeed.
> > > 
> > > 
> > > Right. So I envision along the lines of:
> > > 
> > > net.core.virtio_net_hdr_validate_all - validate packets from any netns,
> > > netns root can not change it, only host root
> > > 
> > > net.core.virtio_net_hdr_validate - per netns
> > 
> > Then skip the global option, as it's just a convenience: the same can be
> > achieved by iterating over all the per-netns settings.
> > 
> > Per netns validation, but only settable by root, not by root-in-namespace.
> 
> Hmm I don't know how to achieve that. Are there examples of such
> options?

Two examples, both basically make the sysctl writable by root-in-ns,
but then add an extra capable() check in the write handler.

ipvs max_conn: in proc_do_conn_max()

        if (write && !rc && val != unset) {
                struct netns_ipvs *ipvs = table->extra2;
                bool priv = capable(CAP_NET_ADMIN);
                int max;

                mutex_lock(&ipvs->service_mutex);
                /* Unprivileged admins can not go above the hard limit */
                max = priv ? IP_VS_CONN_MAX : ipvs->conn_max_limit;
                if (val < 0 || val > max) {
                        rc = -EINVAL;

ns_last_pid, which in its original commit b8f566b04d3c ("sysctl: add
the kernel.ns_last_pid control")had a direct capable check (it was
later relaxed):

        static int pid_ns_ctl_handler(struct ctl_table *table, int write,
                       void __user *buffer, size_t *lenp, loff_t *ppos)
        {
               struct ctl_table tmp = *table;
        
               if (write && !capable(CAP_SYS_ADMIN))
                       return -EPERM;


