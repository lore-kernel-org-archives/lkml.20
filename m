Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327636;
	b=P4wJXUsSUPmKPSkJifvt4bN9LljKfC8xgfkCp6Av2MxPH0zQkSCyW2RGd66vDQbx1DEU
	 xso4DWCIdw5/Un4OcFmO089rn2VJzpHijDHtU1o7apN+eIYoKx1RazBFiUWkW1dH7g5B7
	 VRqvjidvBHVAHkb1DlImJaBbP+gyx5vRumgvKtcP/3ToXGm/c0/+N0nMNb1+0cguUcOnR
	 kKobQxfK/ZEA7GBTexXTCJUbNwTkVaYyYcx5zUmUow8DKYSR1cMwZ14Csdu+PkBmJ7v+g
	 dcqiEw1LqXDvlNSL8IU3wKHPhHowxb0UK7cC1pg2tYxZdQYv+hak2NBOCBu3200f5Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327636;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Wn9pl2dWY0mvsidzC7ZDrdvAm0x6tULK0E6nQnzg3QE=;
	b=P6BMMVnosF09uTTCwOD002hK/rPLTeb7xcmOiUxQah9TBXUSZWb7tFKzmeS3HDc+d+7Z
	 g1NlEbh5xbqQ2JgK+QJgUho7sduNjQJyUoXMQWxiOvy5H/fF1YztjWYefIkVQmJYR+7ce
	 Zaa9TU7pvrb1IntlShS1XQgo4v6eYglN9l/HrIkThdYnnetyWHu/OgvRLCQZCm3apSS0z
	 o9iH2uBpbBruRJ2pWfVw9QM0XxcY1fGLD/cCp/HzsHBD02gi0FJVaBM+BSzhu1E51CrAp
	 aWb0Y2mPquBCuNpLq4f0ydJgdS+z3h8bqzqP8xDcHh3n9dkHAsyYN6itXhbO2a0nBYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zx2c4.com;
	spf=pass smtp.mailfrom=zx2c4.com;
	dkim=pass header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=oMYGPlhN;
	arc=none smtp.remote-ip=209.85.160.232
Received: from mail-qt1-f232.google.com (mail-qt1-f232.google.com [209.85.160.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91CE606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B91CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=oMYGPlhN
Received: by mail-qt1-f232.google.com with SMTP id d75a77b69052e-5363c8de563so22054321cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:20:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327634; x=1794932434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wn9pl2dWY0mvsidzC7ZDrdvAm0x6tULK0E6nQnzg3QE=;
        b=i6xITlxqIx9jVTAb9sxUnCDA/7EZThQouL0hS172UtYuIo8g6JfENK/mmkT0/t+O+R
         QuR07JJajcizha6YPS96xDmep4KgOudxogSwCu2fIPmjtOTuRLFTOlqnGZrNTI+zHzsd
         XBKxscY+N4lgLkEgBuSb0EAgiWclNADG6GNPlzKkOY7V0OY7T9qjwsjvfKIfWfYEnfrN
         RJfWY6UDFjOSnI7l0cYPKwN3+HCig3Q0RvthR+txEEMn8rl15od1Pyx/x/qjSCFxOArG
         7YuElaYe7if9TbtxrZxztiIEZBAEWzv+5I8eqnJqSrb2Qge5IM2b6PhrU+D85PxmjGR6
         5TIA==
X-Forwarded-Encrypted: i=1; AL+hErEQ8bh/VlsRYzXlGG0czHtJf3YzIsza9ds8NzSL6zcgCJ+vxSEIYen6FOsEAZt098mE4Cte/EjLhLQhMSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tIrykT6Lb+7z+ii+Joiv8aKZEAovT9Ew+1zsTVW1ZimdXcVma
	WH1PYrWCbIsTXpAGHBPDvEfhLyDbcH9JMzwQdBK2Mqvj2NyKEKa6Exn0AfN3fsjiN1ptkb28iJW
	QbqqA5CGKJ3Xg0rtHr7iACIzSfKV80mX9UmHCEcQ=
X-Gm-Gg: AYBFou3o38bJ3FTyNmGrayUrz556gR1YG8hHNWnuIt2s0D4U7ZytQ+BFaub6Flx1onh
	drW/gZOlXfED5N2jey7lLD48JigiKjWQAOnbvikvaLDhBkEEzGXOCidpsk2hsXSfEb57du8TZfX
	qi47vE36bBwnxMtVQCUSieYXrWsBerz4NJZURZAzh/Vs5iqi4I/I1pX5VePn1U3j0JzTIrpnRK8
	VJhN5IBTbCtNsI0mFFNoRedw9IO0BBPXsiqxGpHzxzGEoLTmFk900XaYsJhnsSgOi60BsOykaGl
	ndMI/f25XE48x5t1G9F7NvX3wFK5R1GirpFyjNIWFWzGD2l0aiJh0j5Drch5FvOvr+YQCi5VAJe
	6yg==
X-Received: by 2002:a05:620a:26a1:b0:93f:1e3c:4a31 with SMTP id af79cd13be357-9479f337933mr473994085a.61.1794327634556;
        Tue, 10 Nov 2026 08:20:34 -0800 (PST)
Received: from zx2c4.com (mail.zx2c4.com. [104.131.123.232])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9479efb239csm35618885a.10.2026.11.10.08.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:20:34 -0800 (PST)
X-Relaying-Domain: zx2c4.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1794327631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wn9pl2dWY0mvsidzC7ZDrdvAm0x6tULK0E6nQnzg3QE=;
	b=oMYGPlhN+9g4AeBDfpCGTBZvu9Avf73LXYnRU6qvPzJzuBsQ3shkH5vxk/jmMg8gWGzwbl
	iRS9Y/grD05nLAnzDqY6ePcGBUuSJekQMzyZ7RF8Z1y6YzzHA0AyatbgR2FGsdiWhRAshw
	xeD1NXhYrsxQ+z6vA0sPv74b16eUe6U=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id cd041934 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 10 Nov 2026 16:20:31 +0000 (UTC)
Date: Tue, 10 Nov 2026 17:20:28 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+de9701a2cad597c14d34@syzkaller.appspotmail.com
Subject: Re: [PATCH net] wireguard: mark racy persistent_keepalive_interval
 accesses
Message-ID: <avNETK_9e7sr-JSB@zx2c4.com>
References: <20261011102322.355167-1-ngocthang2710.1999@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261011102322.355167-1-ngocthang2710.1999@gmail.com>

On Sun, Oct 11, 2026 at 05:23:22PM +0700, Nguyen Ngoc Thang wrote:
> wg_set_device_doit() updates peer->persistent_keepalive_interval under
> device_update_lock, while the RX/TX paths read it locklessly in
> wg_timers_any_authenticated_packet_traversal() and in the persistent
> keepalive timer. KCSAN reports the race:
> 
>   BUG: KCSAN: data-race in set_peer / wg_timers_any_authenticated_packet_traversal
> 
>   write to ... by task 3648 on cpu 1:
>    set_peer+0x...  drivers/net/wireguard/netlink.c:457
>    wg_set_device_doit+0x...
>   read to ... by task 3652 on cpu 0:
>    wg_timers_any_authenticated_packet_traversal+0x...  timers.c:217
>    wg_packet_consume_data_done+0x...
>    wg_packet_rx_poll+0x...
> 
> The race is benign, but the reader also loads the field twice, so the
> zero check and the timer expiry computation can see different values.
> Load it once with READ_ONCE() and mark the writer and the other
> lockless reader accordingly.
 
Applied, thank you!
