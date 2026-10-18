Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F9D3148CF
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792289512; cv=none; b=IsKoMqhrwcWt8Z4Uc4bp3nr4jbOgdttrSs46n26MlrcrC6BV2cVhztXA39bwlv8wmzCKstQHMH4HTcSGHOzS+U2h2ibAYPB5Wu4fvpIyzpNc4z1DqWUP2boz2JFuZcY1ltuQNR+M45+NItFihO9XDN3Bi3SvVBLA3gH7rDkdfaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792289512; c=relaxed/simple;
	bh=quR7zaG5HvFKkoAcyflM6P6NFsJA2yI0PSyMysQvzs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bPljZHcZGU8dYUAt7utcMewQYMtJHGWqbH7BclyinzkK9KG7T+yhTIdg8uinIfbcYtPeawpUIa/TdrSelEKhXLf1LoP0gRAwIAi30fnenqj2wXuNSDrp81zj2VXSAZle41hUcfuL/x993HshG1S0mBZXHqJ4LZjFX3KuXM+oqMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=QQIw8NTp; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="QQIw8NTp"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso149433366b.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792289510; x=1792894310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quR7zaG5HvFKkoAcyflM6P6NFsJA2yI0PSyMysQvzs4=;
        b=QQIw8NTpx0NQVnPaElOZevzSeEGsEd1HNJUlehuDS2MEursrdpPIEapiL/nlrwPAE/
         vq1GtTOJLBBFzsy2D0eKUgVaMXkXNnlc9hM9pcp+OFhy1Qqea/tzUdKQb4PA1t6akFN/
         cHtMznWJFCw4lQ27SP+Fn0vLmmQnDzceYS703/4CVpDi+IOwlQpwy+l/6eu2+UseMIPO
         ag5rkYqKZqUJYwHjnvtlCMlqbB16c80fXFZqqfGFY+Fc8LCAzS1UAKU7KONBsC0sLibl
         4CEkkS5xkd1WiCOa1QExUiKXoKCDozL1d7rLPQHNqv3/HHW6ctYc2n7SAyJEMueDqmDm
         DxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792289510; x=1792894310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=quR7zaG5HvFKkoAcyflM6P6NFsJA2yI0PSyMysQvzs4=;
        b=w/yw0PS7urjiYLJHTog8EfyxWzLGrcDKPJGzJ/FUtmisSWF1UHTXwacPTnLFQbwNBV
         HX0rYPgw1zosNxc6YJFGJylnGku0sy39zEVDoD7pcWV4FbNtgMJEcc0JP+kZS5ac1zJD
         Ns3skdX5PGNr5ZLbC87NO7yzQ/Wc4FNSJ1eYWuO+XTiMhmODwjTVC4nrk8F/qlDXAwdY
         GG0cLq2f5tUOa6l8MceB78maL6am86jha1EUK7mQN3z+TYlGLg3BkdohCJARZjkWR2Pz
         58MG4TPIyYaIyprvR4cDKhf2ruq7PN+7RDMMN0HZuhQeKt4KJCkepdhym3719os4Y1gb
         v7dQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSPECHIZ+J6us3OpC/qQrjC6lAeDzRoXp1HB8/YtS1DDuu62sKHD6iLqBL1UU0SBgs7Y4q2uCx0x5CioU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbSU5BP8qYB2h77iSjLQFKT5AE0RiQuzplTh8QblbEGr3cG+iC
	vAXsOTTm6ZQmd6SbTF5JWXjYRz7Y2fbFyzGD1jIDWMsTFrk9QQ/N01bHnptjPjzYNg==
X-Gm-Gg: AYBFou0vB2hlpKk8i6OsW0fxAoi8z/lPR9FAfDqza1l9WSQcT0X/8PwgCfFWWgf1yVe
	oPXwC19rQ7WMflumOkm/G0/JoEhoJg5lrGWCLi0Sebyqz0IRY5tqUhubx34Tpqr7dJnuzFVar5x
	Od75MPTF7fdGacavNw/9DQapq7Z/YCwX5KR8vdSPfiy0Hl0ufmmcuP7eG6HXWToCiE6s3iFlIg7
	7duwysA6gCDpQ/2xCPttX8TpHsWsN7Wg3p8BbqvLMgvT8BKFbWZ8KDDNlLVZ72aXerjlw+w65EI
	N17JyO8/e/fvW9E6TUPJLZl0RWnbx1vZmF6Bi05G9J9PO/va5yHakix3J2BE1A2ZxY0XqKoHWTr
	o9TsbE5kGadL5NPq+Dv7I+eE120/GN0qMVVxLoXp7b67oX6QwSMPGaw5hVnPGryT914rKN9p1HA
	LPaeofs+Ezad6isKIew659Mg6gx1+UmB257Cr8Q6lOJDJrmlYE59LxlBlWBoearEss3Cv6lkmDg
	HJnf8wzowZEnCVg1pPwWpTCokdltAJKjYG0WgZQRVhgsVhykdU/9d2oxOoTCuf44yder/gM7wWZ
	YFF23Cs0c53UGrlHTT/IMxueU7nBBFlEAmA/svX11OtiY8ug/AWPTSnEF8w9ZLXQxTxh8vsbNyO
	n0tauWkU3fq2enbdPFvGF4wc9RsgiC7VlaIkPHLjB+yjrvpE6UQNdLnWFFfmzbE4Zwt9J4MhM0V
	IP6iIUSwlsKYQOvJKp84EPvJBPkplf8iDF/HEfd4fusdkRsxbRYa2ndnu7qCUA+Q8fEdAjiNpdl
	qzSQjtX
X-Received: by 2002:a17:907:c48b:b0:c35:d50a:1356 with SMTP id a640c23a62f3a-c41a08dc5fcmr283934966b.42.1792289509761;
        Sat, 17 Oct 2026 19:11:49 -0700 (PDT)
Received: from Desktop.fritz.box (p200300f247424f103187cc9af620d661.dip0.t-ipconnect.de. [2003:f2:4742:4f10:3187:cc9a:f620:d661])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb1835sm224698366b.79.2026.10.17.19.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:11:48 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org
Cc: fw@strlen.de,
	phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf-next v3 2/3] netfilter: flowtable: carry a priority into the offload
Date: Sun, 18 Oct 2026 04:11:45 +0200
Message-ID: <20261018021145.3769432-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atQkUoH3aa-J5-vf@chamomile>
References: <atQkUoH3aa-J5-vf@chamomile>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 18, 2026 at 03:43:46AM +0200, Pablo Neira Ayuso wrote:
> I think we already mentioned this only works for hardware, this is a
> no-go.

It works in software too. nf_flow_offload_forward() and
nf_flow_offload_ipv6_forward() set skb->priority from the flow, see the
nf_flow_table_ip.c hunks. The selftest checks it on veth, without
hardware offload.

Julius
