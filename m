Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641595;
	b=2VUQ3huz5xjzTMnWGSjrJz2CSbSQrmnhcg6Y8Tho5wAsAAulDPfAL21MF6e2h11UZChk
	 UXbRyc2qNf10f8Ies+3YDM0n5QzYmU+hZBUipNO4dD+XDLRm8Lhyx+prY3eemfzjvQSIC
	 l/9v0ekSPuHpzEkSqX2obMubt4cvrnsIOAdTqpdQ9OHAWZv1+dMaF1GNR4gkI+DdtBrPH
	 a6HiozrSJ2pZWHR3Y9b/qwOzAueiOmnP3vcX3IOVDo40/d0B+ea4YkyrXdMuoaTg4yLXT
	 cbQ3VbDUylxmohfqyb3gp9TgkEuwqXtHulXztWeLkNk1n6v3bvYSCj0nilqWFYQ7tDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=mIqG4gDjs7qWgNSrfHEZi4r8CEaK0H3ibIoVTKmXC9M=;
	b=iEy4JSWsq9WnXX9LiwhGEAQKyd1VTWAXhRAnvZEqKH/Ty+5PxOGayqDsDvY2JGuzmrBX
	 6ueHvLSgkzyohbEfgadHn6vqq/SQfyrKbGxgW+QboMhqA+0MMChHZKthU3XEYf8CsobYG
	 00VSgRBWGGWWYvfjGS2Q1tpCLH2iKZ8k+896xzhxR6IClb0HgmrbkcLNjE00CVUsek3AV
	 dHS+qVoS78sxKyQyEWkQ4NsOmlk/3SZloB0gXJRL6rzjDDfWvOYiDqzDgh4OKyOI1EOrt
	 iDLeiGEOP0VMToATSKXY8uULBFB6UV++vTKogYA3VsurtUK/BviAMNjDPz5xfdWoClw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="VjnO8/qN";
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207CB606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 207CB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VjnO8/qN
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eddadcce7cso10051585ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794641593; x=1795246393; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mIqG4gDjs7qWgNSrfHEZi4r8CEaK0H3ibIoVTKmXC9M=;
        b=VjnO8/qN9HKKidM9JOEQtM25OmpQbG9qTz6MeThIgpFMuFrsLGP5A2Ope4XO8oexDk
         3DTLgeaGoIyBAFfTct7K/xq6oBMghIIf3kA6wc2ekKMvnxtP8OtAHEctJN8Ca3Njo8q6
         wWdirrbEtPSSIH3IQ0ZDBTRqZr4lkbhYqTNhlOZsEUK10dAASj0RTp5Kb0HlJNf3cN97
         SddPzafva9uw3iJPrfMzoprpWtzVrf3YzGqPpsvB1MrWIDRrM+xtmmQ2K7V1iLwRbsoX
         s1yqn5QaTTfR/RXTvolCbveFU/tgSiDDHHoMPVwypBEPIfzqbdpqReapPTMntsSuxaHH
         wh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794641593; x=1795246393;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mIqG4gDjs7qWgNSrfHEZi4r8CEaK0H3ibIoVTKmXC9M=;
        b=TlG1moOeXy9p/GtlBujPAqCow6rDB1FlNxjU+X/Nu4sAyjqUK8GhTVctrPYwapL3Le
         0W0yF7qamOkLOGfda7MuctdC6u+5QKdC6buD0JKnZIb4xKT4qpcBPnyfXGxPjXGsKHTC
         QfpJec8LtUMb0HgLeFG6IsQyG7OMxkmhg4i0oEf0JwwdU35lwoR1C/UJCEtEwQKkx3hz
         IzJROn/kk6syIHbL7ePAe588LDwOCn4oqPQ633Pe92CrWZVRaPwIKVsD9vEUDEaNMNHR
         G/2nn0LEbCvy4XRFT01j+OiVOHLMS3uitnItD9KjtZoUrmeikq0rRTq/KilusSucl+9X
         Jh3g==
X-Forwarded-Encrypted: i=1; AL+hErHRlca5bfHeKNntuwvjyrFHMVfyKJG/DxW2z/WqiHT2MBLI2BCVm+uGUzQl28w356tzpl0Zr0W/t9QxT4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z875MqxP8MyA0Beyx21zuYYQ645O2lopYBWv/LqacZh0vjBMWRI
	yxht1vpRc3tdTA9bCHsrgskArQYhtEbQCE7SoFmSRm6Ek+jmGBvXOgLTeaOGiGV9cxxlA4gRd85
	0TTbEQw==
X-Received: from plbl7.prod.google.com ([2002:a17:902:eb07:b0:2eb:2db:b93d])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d54e:b0:2e9:6790:212c
 with SMTP id d9443c01a7336-2ee0dee857emr53512405ad.30.1794641593150; Fri, 13
 Nov 2026 23:33:13 -0800 (PST)
Date: Sat, 14 Nov 2026 07:33:12 +0000
In-Reply-To: <20261111225148.88506-2-sidchintamaneni@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111225148.88506-1-sidchintamaneni@gmail.com> <20261111225148.88506-2-sidchintamaneni@gmail.com>
Message-ID: <avgOk7BctoXaaoZx@google.com>
Subject: Re: [PATCH net v2 1/2] af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Kirill Tkhai <tkhai@ya.ru>, apais@microsoft.com, 
	hargar@linux.microsoft.com, rlmenge@gmail.com, egoriluk@gmail.com, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, 11 Nov 2026 22:51:47 +0000, Siddharth Chintamaneni wrote:
> When a connected SOCK_DGRAM socket disconnects (e.g. via connect() with
> AF_UNSPEC), reconnects to a different peer, or observes a dead peer in
> unix_dgram_sendmsg(), unix_dgram_disconnected() purges all unread
> datagrams from sk->sk_receive_queue via skb_queue_purge_reason().
> 
> Because skb_queue_purge_reason() frees each skb without calling
> scm_stat_del(sk, skb), any SCM_RIGHTS file descriptors attached to the
> purged skbs remain permanently accounted in u->scm_stat.nr_fds (reported
> as scm_fds in /proc/<pid>/fdinfo/<fd>) for the remaining lifetime of the
> socket.
> 
> Move scm_stat_add() and scm_stat_del() above unix_dgram_disconnected(),
> splice sk->sk_receive_queue onto a local list under the queue lock, and
> call scm_stat_del() before kfree_skb_reason() on each purged skb.
> 
> Fixes: 3c32da19a858 ("unix: Show number of pending scm files of receive queue in fdinfo")
> Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
