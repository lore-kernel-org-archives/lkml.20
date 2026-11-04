Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815743;
	b=Kxw2He1kvTUj56PfQeI4KuluuA41seFSrvUg0HkzlgWhUcU4FXrhaCb9H6xx/vRL3uYT
	 NMUSYwGTtIuwknEDNMCdXFlIJrnD0yZNmuKTYB9M9Fwki8qtD4TSFO46PgsxHs4rmIMOF
	 SleCxN+171LSdVyTJCwHIiJ8EjmGTr7Pecjx8Z5xAnG8fLOJLDHW5eDqft98Yx81YmLjX
	 aAMmzvhXdLCKN6iauA/oNDGkeknDWpZIOclV40xmf7TkyetcI8vw+SZ+SMZTphLMSWVeu
	 Mwy271PqCrEofXa2W8pfzCQaEtvNHimbbFFh+eaYUhAK1c3X1jLoo8KjxRM3ITnYWyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815743;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CVsLTmxNWfxUI2tna4xY+A80o8Oxx2HIRrZYrtR1B4I=;
	b=J7Exaty2SjcNCwt4Kt5ur9LX6UFZhdf5FOXCpF6A5UNjfRGSA6HctKbv4Qx5+jR2lM/0
	 BZgZ8czbIN+cjoS/G3yEAWdivWFm+J6OaanpZO7dJ35ad+N+w7xJXRa+/OkKIPwIEGYQE
	 56xRgyCz5Ny4iToWiPYeXt9h+PS0HoV5M4C5LFCijOhASMb+NRtKu3TIxjHS1p5IgZ0h4
	 dwgZTDsmUiP8qKCt3Qxx510ilipqfBqbI37e/jKHddDBJKt5+ppMjWTmRHDlt/FR/zoD0
	 cBvaOBaqxaLFeWo/H6kurT91GowYV6pv8wy95jSZwlDCi59T+3D/JEoUDQ+GkukFByg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jMHFvJcX;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gI3xRHBo;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5223E606A68D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5223E606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jMHFvJcX;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gI3xRHBo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793815742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CVsLTmxNWfxUI2tna4xY+A80o8Oxx2HIRrZYrtR1B4I=;
	b=jMHFvJcX8kntV+r04c9x2fHTRNwVi3bcMNz8A9vI6yMBiSAR6XEBlr+8yGKwNiZ6YP0FYI
	ECaoKrBJiLHVx4283P1yZxaEXptMVoqfbdU7YzyV0AokwJQtxFk3U9u2DVF6RmrYpEVdrT
	+3TLp34FLv4Iq/ibHeTnnkj2GMxffrM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-E6a_tLSnOrWmhB-WhjHYRw-1; Wed, 04 Nov 2026 13:09:01 -0500
X-MC-Unique: E6a_tLSnOrWmhB-WhjHYRw-1
X-Mimecast-MFC-AGG-ID: E6a_tLSnOrWmhB-WhjHYRw_1793815740
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so8155945e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793815740; x=1794420540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CVsLTmxNWfxUI2tna4xY+A80o8Oxx2HIRrZYrtR1B4I=;
        b=gI3xRHBoBPHra4uf8B3TF81iGQwj+b5ToRgFlTvBtklAGBC2R9Dm6eEFszb+QmRcPb
         gSOvDqSanECFNd4THvL5cJNGifHoD8HaF1ZIXSbvw4q76DyMt889/1I2Uxm+v3qaaLFN
         wxIJLgAOkXI0KiGaLIH+vloXauOuy8YbjHqP0xL0zzcQG3yzdUVIyP9chVWwPbkYnRxO
         TwTAScwnoDlx+w9LVa8pI9S9rwC/2h/7kHxYdP7FNtKdkceSK25cH7qEOwLwoZmzuhku
         lpzIVgIa6H2yFmr1mIrH5UFodTCF2qcAuRUiJY6VmW+RJTYXwQjXHgexrTkZ9/B5thIu
         bLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815740; x=1794420540;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVsLTmxNWfxUI2tna4xY+A80o8Oxx2HIRrZYrtR1B4I=;
        b=QJmS4DuD1fqXAyHkAGinMGt6gj9nVN9mHu06lVIdHjiZxCbo7c6mn1eLwM6OkcwUT3
         MnM8A6xAp2wF1E4ZrcWqBlxbb1J1cykm2Eg6jxiPdHuGvL/h6ZCOUB+RYgIS5HykKNkv
         rd6EgzyPrUJ5R94KemT6JzbzkYNI6j+wQE9RTpuHwIBEoQSDvjRhDkAYB/dSBTqq1mU4
         X2r8iokp/7jX8h3+kZwe87bi5MMON7v7pgZ92R0EtfOEFt74J4J7pYKy2U50EVYYrulz
         Xff9wb4Ele9E3/90uLIJxAP63GOSnAic152X7OdIp8bBvRdWzMo0lEKL4Zp2+U4NN5k8
         ucuA==
X-Forwarded-Encrypted: i=1; AKwUvByLz4ka90PCz7O5eVCWAXyzSH6+6dT0ONhx+tqiOb2MZsBHI05wFl4gSqm++m8vqnd5qMa4jioHUoPNy24=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nH4EfIo0u2M+NL189/u67eWVXYexq2kqghqa+0aJ9j8NEDEEm
	h+uDapLKkUxDPgRZf7qT2cNLxfuBsY4AMh2QWQWoZW9ecrVbbH1kkzYc73YetsEQ6rNgW9EC5+W
	25x1xqQ/y/AWj2cakdPlamlkcTWd5m4J9BxQAGFtYk/AZrTt+Z+7fgwwie/sYa5Mryw==
X-Gm-Gg: AYBFou0/1c23DLOSB9WrcFgG0qvFHWNqu/ckzU8KO1qsld3r2moJIqiZZ/2QKxgwkwX
	d0DHaWx+riKbWMCHsY9bUaG52HBACRU2RTRUzeClvoS4e9KYq+b/f+zUJGctqY5ScEp9k3mnQh6
	h3y93OysWEnqHe6opzdvPPfHXL8dBA6mxQT7Y7KVxPpBzbmX2LTyX8FRkzVkpBnqpuc/QW6O9En
	1zkwpkp95vbPBi16YXGAp/saoORFiKL3PAfYya6LYIx9TG7Ku8/lWd2Fw1DR0kQBKyqMs0J02v5
	fWDaHb0LWFZbccd1J7wNPC/y8+e476FeOZxazUFZdU1uvWnwz6w49gd1ssP9AG3BV35kMwGu7fn
	A7QtoQpTkZFAzQJWTjzrohmtQ1czk/jcByr0AQ2Ru4WssBuYD22H4El5Un5DCp3sVdUWFZR7CpS
	7e4p/gO7SnfH7Iyit9ccLUcHkJ6Q==
X-Received: by 2002:a05:600c:3d05:b0:4a1:faa1:3813 with SMTP id 5b1f17b1804b1-4ac187a6960mr382690305e9.27.1793815739737;
        Wed, 04 Nov 2026 10:08:59 -0800 (PST)
X-Received: by 2002:a05:600c:3d05:b0:4a1:faa1:3813 with SMTP id 5b1f17b1804b1-4ac187a6960mr382689845e9.27.1793815739327;
        Wed, 04 Nov 2026 10:08:59 -0800 (PST)
Received: from debian (2a01cb05923c9a00ac19e47fa8c3a9d7.ipv6.abo.wanadoo.fr. [2a01:cb05:923c:9a00:ac19:e47f:a8c3:a9d7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae73csm2041325e9.1.2026.11.04.10.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:08:57 -0800 (PST)
Date: Wed, 4 Nov 2026 19:08:55 +0100
From: Guillaume Nault <gnault@redhat.com>
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org, horms@kernel.org,
	jchapman@katalix.com, tparkin@katalix.com,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v2] l2tp: only return sessions of the given tunnel in
 l2tp_session_get()
Message-ID: <aut0txiHZnAZjad8@debian>
References: <20261030032617.4065353-1-hengyul@cs.unc.edu>
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
In-Reply-To: <20261030032617.4065353-1-hengyul@cs.unc.edu>

On Thu, Oct 29, 2026 at 11:26:17PM -0400, Hengyu Liang wrote:
> Commit 5f77c18ea556 ("l2tp: use IDR for all session lookups") made
> pppol2tp_connect() and the netlink session commands find sessions with
> l2tp_session_get(), passing the socket of the tunnel they name.
> 
> L2TPv3 session IDs are unique per network namespace, except that
> sessions carried over UDP are only unique per UDP socket, the socket of
> their tunnel. However, l2tp_v3_session_get() only checks the socket when
> another session has the same session ID. Otherwise it returns the
> session, whichever tunnel it belongs to. As of now, a session command
> that names the wrong tunnel acts on a session of another tunnel, and a
> PPPoL2TP socket for a second L2TPv3 tunnel fails with EEXIST, because it
> finds session 0 of the first tunnel.
> 
> The issue can be reproduced with:
> 
>     ip l2tp add tunnel tunnel_id 3 peer_tunnel_id 3 encap udp \
>         local 127.0.0.1 remote 127.0.0.1 udp_sport 5003 udp_dport 6003
>     ip l2tp add tunnel tunnel_id 4 peer_tunnel_id 4 encap udp \
>         local 127.0.0.1 remote 127.0.0.1 udp_sport 5004 udp_dport 6004
>     ip l2tp add session tunnel_id 3 session_id 7 peer_session_id 7
>     ip l2tp del session tunnel_id 4 session_id 7
>     ip l2tp show session
> 
> Before that commit, the delete fails with "No such device", and session
> 7 of tunnel 3 is still listed. After that commit, the delete succeeds,
> and session 7 of tunnel 3 is gone.
> 
> This patch will make l2tp_session_get() return NULL when the L2TPv3
> session it finds does not belong to the given socket. The receive path
> calls l2tp_v3_session_get() directly and is not changed.
> 

Acked-by: Guillaume Nault <gnault@redhat.com>

