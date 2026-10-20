Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792469528;
	b=DLNw1ahcuUyompdbRF9jBz1cvW8nQlAdm/aDDu6hLxOPTE8AorgsGI/CA4yki5KZ+1a3
	 dPKZfv3tHyPZb6Ly9fUTyXijSGeq+m89PbIaC9JktUo/W/VgOZ0ao9FGI8Duy1y4aqw0B
	 KdITTA1qF5Z/ebZrIq7z5jaI46uVFPxHt8WQwNiCuJSkx8vtFK8fqGdZdJoIMt5AAFkDt
	 7ys1VmUGuA97KktnUoUwJMwOz45djMcxQse9dC0MhTEx/gpBn5AeKD2zv6HARu562HjUv
	 SkACwvjdYAIp8ve328Vi3ytPx2iP8KKFt284BrzjA6JffECHwCcHiIPCJh7TEziv+6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792469528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=uAQVeBdqF8iBjUZznDFAjUGvJNEGAa606+53oDaEyLw=;
	b=4fziOgOC9CDrxfwEc/Ao/yfw0dEdkTdWxdHxaZg8kXbF9kjlK1x4zW7TW9Q02bX8K7Pw
	 aj7HpP7vwybXbX6GIAeHI+inGmAAm7075fmPt8Z+lrseSP+5lNWHI+Q0N37hWt6kThrgO
	 IJICaXhCICznb4aI7WT+WkWed7hfF78itz8R36x0bOHYSYbtZrZkFajf8T11XlGMuqffa
	 iC3HVNRqpwNrlLpCe3385edm8XgGe0RV9sXxcSKbu8NzYGDYELjkoXO+h6P5h8KkbeXrB
	 VFt3zZExtM+HdPYeTu3Ox47FuRwW02tmnChqZycg2bh/4xXod021vjX96WqgHjtHP8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bREnexKh;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EFE606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23EFE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bREnexKh
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a06bc723b1so1992974b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792469527; x=1793074327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uAQVeBdqF8iBjUZznDFAjUGvJNEGAa606+53oDaEyLw=;
        b=bREnexKhXahp6Bc9honRucDCkEreBwjOPgqmKVZi1KCtuI8Gi6q1oSNXOTDgPw0cp6
         fXmDAVsHL5jwDGgSRHn5ZAEAkzYoPmRFdw/ut6rUhCb9zgKHLTbN4PdY4IBClV/rvIhZ
         5oDaJr055lhCGmZnScl2BHVfWPcY9PtiKAvDA7WiFmAVgGMI/ID+lEUv/hyplMT2jz7Z
         p51zsTmvLAgXQGfVLGtENWquS6NPwrLqY3n5OOb0hWGX5HDnxJEfhpGPy2PZESQu1Q7C
         hd9k0FXu7q3vcN4/DUUXA2/ekGm4LWjYRkXqaHx4zoh4iusbjor2W9B3eBU12mdugD4t
         U0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792469527; x=1793074327;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAQVeBdqF8iBjUZznDFAjUGvJNEGAa606+53oDaEyLw=;
        b=ylcR73PT8axY5bfcO0sblxW/DJoSMP98FCwe7jZfPkmsnzQCgT9gYmxCvZcOOFoR11
         kPbSFXxVmZOH9FxAkxBLrrfMwpXY7Ux5VQOvZHSpwV9XeUAWezs9AshXnw3ZYCrl2psd
         8g3ujTJbz68kg0g/tK7hFgSz2AMj4bMiImTSip3RKlEfOOHgJHzd5QZZ5h1xWBXqF3Hn
         T0DmHxTg1wEl+TlLB19UU5UVTc6r7T6JrM7eU7OflEMVNMtRKy0QpzL3y9IfWDvsVEW0
         79orx8n1xoC7CMPnBc8lArtfs8MAiEqqvpoJu4GiByUZXlFCIBq8w/8oCx5IoBj/7+Gw
         /jfA==
X-Forwarded-Encrypted: i=1; AKwUvBwVx3ijEVrcNgAJ9metAhj/HHjsqup9jgRmwR3y0cC54LxxcI3wDRS5r1V/oRrxeHHxcJdwy3e9/wfAmKc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl/2LvZ64EUlnY+d+KIcJmWRCgyJSL7tax+EDuIM97YXFmK/4h
	Iiis8pP++bWbv/WUXYxlHCGB+8VOibUKsIXa93yiLy4KWLndwxrSwdkuBY0tWyUfbdieaK+UyEy
	05DABYQ==
X-Received: from pfbcj24.prod.google.com ([2002:a05:6a00:2998:b0:889:4fa3:fafc])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1f12:b0:89f:9da8:1b66
 with SMTP id d2e1a72fcca58-8a04cc2adfbmr7226294b3a.33.1792469527213; Mon, 19
 Oct 2026 21:12:07 -0700 (PDT)
Date: Tue, 20 Oct 2026 04:12:06 +0000
In-Reply-To: <20261019174152.2932829-1-cjubran@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019174152.2932829-1-cjubran@nvidia.com>
Message-ID: <atbp-Zxbm_Os6-mT@google.com>
Subject: Re: [PATCH v3 net] net: skbuff: don't copy alloc_cpu in skb header copies
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Carolina Jubran <cjubran@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jason Xing <kerneljasonxing@gmail.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dragos Tatulea <dtatulea@nvidia.com>, "=?utf-8?B?QmrDtnJuIFTDtnBlbA==?=" <bjorn@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 19 Oct 2026 20:41:52 +0300, Carolina Jubran wrote:
> Commit 68822bdf76f1 ("net: generalize skb freeing deferral to
> per-cpu lists") added alloc_cpu to struct sk_buff and placed it in the
> headers group copied by __copy_skb_header().
>=20
> This is wrong for newly allocated skbs. For example, skb_segment()
> allocates a new skb and records the current CPU in alloc_cpu, but
> __copy_skb_header() overwrites it with the value from the original skb.
>=20
> If the original skb was allocated on another CPU, the segment may later
> be treated as remotely allocated and unnecessarily deferred there when
> it is freed.
>=20
> Move alloc_cpu out of the headers group so it is preserved across
> header copies. Copy it explicitly in skb_clone(), which allocates
> the skb object directly instead of going through __alloc_skb().
>=20
> This was discovered while investigating a throughput regression with
> software IPsec. The load used 512 IPsec tunnels carrying traffic over
> VXLAN, with 512 parallel iperf3 flows and an MTU of 4500.
>=20
> Before the fix:
>=20
>   16.09%  queued_spin_lock_slowpath
>              |
>              --15.90%--_raw_spin_lock_irqsave
>                        |
>                        --9.37%--__slab_free
>                                  kfree
>                                  skb_release_data
>                                  napi_consume_skb
>                                  mlx5e_poll_tx_cq
>=20
> After the fix:
>=20
>    6.84%  queued_spin_lock_slowpath
>              |
>              --6.57%--_raw_spin_lock_irqsave
>                       |
>                       --5.00%--__slab_free
>                                 kfree
>                                 skb_release_data
>                                 napi_consume_skb
>                                 mlx5e_poll_tx_cq
>=20
> Fixes: 68822bdf76f1 ("net: generalize skb freeing deferral to per-cpu lis=
ts")
> Signed-off-by: Carolina Jubran <cjubran@nvidia.com>
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
> Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
> Reviewed-by: Jason Xing <kerneljasonxing@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
