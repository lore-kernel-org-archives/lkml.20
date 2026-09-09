Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3323E4FB9AE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966213; cv=none; b=ql18757oT6gL+CXIEJQZhN6EzlT1aVo3X1EL2j5A54Ko8AecsIpo2AMYvdd6UrGAOpfskwUOrSi2ZcoLYJvJntQbuYYWJNLEHuhaaTZKV0npZHs+61SQfKzKSpcYFjVpUz86BoYEUvQDt++xFM93WUxZVciG8dT13NXXSdvE1FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966213; c=relaxed/simple;
	bh=HHNm5/zc77jcYLLmGgqPDR+NQaIoL0CJyojjLcJtZKc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=iRcuYoS6gVKnGd8goS1Bvu7+0qVhNiO0IJQsWpSvNiruqh0a0Op/2PXQ6slXDE162h8Ws1pNQ1KKBaPqW7PMcu0ttygPKq4QkAwjYD+DvM7pKpQxH5COwlKj2nAWtUMMegchtx9RlbIJs0uFe69i+0DVk+OiobNP2ChtrpjKkuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pe4eIKu1; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pe4eIKu1"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e56a1b327so1176607d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788966211; x=1789571011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=08HkDWgh1+HEX92rfdOLS5P3VBFy/7LtpPCQPcLhVmk=;
        b=pe4eIKu1NcigxbYAhfQnp88yJbDzdBiP5VV/aE31+JK7IdCbd1L4QsQb2xQLMRr9k3
         +Fqatxp0DXKcVvUb3E3kmU+YLT1WF9jXPx32jZSnDU9TJpg4BXW0XAq2ztqfNzXccuDu
         KzUZ0L5jEZJVam0tlzVAhiSqIO2ZNachSXJJvgHkRn1P2Fm5GSYDBd/wk7jhV6MZAS5i
         ODan5nEmAplPSPIsBenby5tTpO2eKhGVMh7UNuPeLB0GgtP1d32CZn1CvdFinc7XK1/N
         Rf+qwkh6p4U4I3ZTHDQOYNJ0WkdIWWOgh1ejZTFa+QtvvhYV4dKyCargmcK8Sz/XY0HA
         eAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966211; x=1789571011;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08HkDWgh1+HEX92rfdOLS5P3VBFy/7LtpPCQPcLhVmk=;
        b=PyMBU/fgQPHn89HTclsj8qtHn1OT5jSN7N8fFpp84BXgs6W6IOieoL3zy4x3010iXQ
         WtjAS/hHVqbK6CHyLYwM3lYhE3irlLPMvSFn0qERZSmqk6kppAS/QCO+yiZhSsTlGlAq
         Q6bXxYy9/7jL5xAC6idO7y3mIHaX5s7UMydqna7386vZd7TzLZ21GwbidAMRQredCx3L
         12oinPD5uQNH0xxDbhurSOvAADvIxOlIAECOaT3Ls3S+cPm7/E6bD3E0fjAqeZEH69kc
         uCRqppbZb3yTmxA/fF5pDqZS1e+O+/cXyLlAtZHTcoQNqhK3WdddTBw51Pp/YGJlg2DC
         WlLA==
X-Forwarded-Encrypted: i=1; AKwUvBx92/TcayJ0ILaTk+preL9K09RrL6KxVBsr2nL+7cAE3mYx2VLYWZgFRayzU7sBOKW0XhofZ0Hl+RtYVo0=@vger.kernel.org
X-Gm-Message-State: AFuF++lW72Os/U9pAOGM3R+2iANgzGkwecej/34TLwUW5ETEtj49/Hgl
	VKYrdPgZs+CxDpbUOiBKgg4Rn+BFF9xqCQTT6qAVjMLF5CKfNQ7iX0MD
X-Gm-Gg: AYBFou2mlJfdrAQ5Zpu7c7Pakgf3B7JnTXZxR7PoeYmpp0e03KNIKd/WVUMG/5Qc1nR
	TzVQXWrmBEAYDcKk2b090vAobEB+bqm/r2jCvlziimBiIsIa2npC+EuUQv/GJBXxk6M26Rt/7+M
	rk8VFUp91KhJ40lynzpoBb6ZpttZ7r46Up4Cvl4SlTxbm+bBt08EvfZLEgycu3Oo9cNsSDq0Zrw
	NdLIsmv/M5InmXSYxy/R7b0uSeYWQNBMLLu6X7JmjY+pWKYzgY7pzUX8Q+BvGr3Ta0+V2MBb/aS
	Fia7r0KU8a0mTQYg77+XuRG+Ou3k+4hUDKNykYq3a3SvX9hK+gzouhbp7nh5XhiOs9uLesByt2A
	atJSWRsOOliNgs3VopaJ9z4l+nMTdllWYKgx8xumAlHIgS8Akprgh3mDBTI8uX1s3CJzPWRVwPN
	PdNStMsjm2o+e6VLWDzyPn8bsahZhITAAUGxv0Hh0hEmdbsmceXz5GTr+QHlbViLEL+MF4zEIO9
	O5vSEOMaPmp0LBfXfbWXFTXYR65jb7wndb4qU83dpWG36kvP57B
X-Received: by 2002:a05:690c:9:b0:836:ec9b:b468 with SMTP id 00721157ae682-87f2a0de993mr31193367b3.34.1788966209661;
        Wed, 09 Sep 2026 08:03:29 -0700 (PDT)
Received: from gmail.com (234.207.85.34.bc.googleusercontent.com. [34.85.207.234])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149316347sm113552517b3.15.2026.09.09.08.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:03:28 -0700 (PDT)
Date: Wed, 09 Sep 2026 11:03:28 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Bjoern Doebel <doebel@amazon.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bjoern Doebel <doebel@amazon.de>, 
 stable@vger.kernel.org
Message-ID: <willemdebruijn.kernel.e4612d16d68@gmail.com>
In-Reply-To: <20260909085542.3370986-1-doebel@amazon.de>
References: <20260909085542.3370986-1-doebel@amazon.de>
Subject: Re: [PATCH net] loopback: orphan zerocopy frags before releasing the
 sender in loopback_xmit()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Bjoern Doebel wrote:
> AF_PACKET PACKET_TX_RING transmission over the loopback interface can
> silently corrupt packet payloads in flight. tpacket_fill_skb() builds
> the transmit skb using zerocopy frags. loopback_xmit() then calls bare
> skb_orphan(), which runs skb->destructor (tpacket_destruct_skb()) and
> marks the ring slot TP_STATUS_AVAILABLE, telling userspace the buffer is
> reusable while the in-flight skb frags still reference that buffer.
> 
> This is ok if the packet gets processed immediately in loopback's xmit
> path before userspace gets a chance to reuse the frag buffer. However,
> if the packet gets redirected for instance to another CPU (via RPS),
> this opens a window where userspace may already write new data into the
> frag buffer before the receiver reads the original content.
> 
> Reproducer using txring_overwrite from the net:run_afpackettests selftest:
> 
>   ip netns add ns && ip -netns ns link set lo up
>   ip netns exec ns sh -c \
>       'echo 100 > /sys/class/net/lo/queues/rx-0/rps_cpus'
>   taskset -c 0 ip netns exec ns ./txring_overwrite
> 
> Commit 5cd8d46ea156 ("packet: copy user buffers before orphan or clone")
> is meant to trigger this copy from the skb_orphan_frags{_rx}() call
> sites, but loopback_xmit() calls bare skb_orphan() before any of them
> run. Address this by taking a kernel-private copy of the skb frags
> before going down the receive path.
> 
> Fixes: 5cd8d46ea156 ("packet: copy user buffers before orphan or clone")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjoern Doebel <doebel@amazon.de>
> Assisted-by: Kiro:claude-opus-5

Thanks for the report. We're receiving a number of these.

This issue is not limited to loopback. It is indeed possible to insert
skb_orphan_frags(_rx) statements before skb_orphan in specific
callsites.

But that is not sufficient in all cases, and a game of whack-a-mole
where we may miss instances.

I'm reviewing the options. The alternative, a deep fix in tx_ring,
appears to be non-trivial so not without risk itself.
