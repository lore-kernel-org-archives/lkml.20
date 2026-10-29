Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271124;
	b=l3teu9Fnh41arUgW7jzU0GX2JodLMtcIkkql2twaNoW9ka1Q5LF+L8XIuKxydP5Wep9E
	 bkD6Bc8C71+uYEAFxtKMozBqfYodveQV9kjt6U3kWMlLai1L7GkAerWe7J6TsJ4CtjVxi
	 V1k80Gwrwl2Hlb2yxCTfqcP165UpEW9P77BFQq0OyusaLkYG8E3ZbbJgdM4eHrt56vX3z
	 u30wkxUy/130mF9SmhnK5try/OWLNJtdU0GeYhWwx2hR4TihEPdOOR7ZZsT+W6vpmHKH+
	 TScRNdXW8u/pygOX0zfdgAm+treoqpQ2BbQfg00d+AK7yLkWzYFq5keXg3v5NAwa3Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iymo6yWih1u6JSkjazwtYJq1W+j31tigL1sbJo3i2bo=;
	b=2q1FGsty2+nZlRW7m4iyxSK4YsUVvNTcorm83a7+Y6ppH7oMExW7+KvnK7fWszmPdAzv
	 irmb5FFogTRQo8mpzSCigjsbc/sVSyEp8DZXX2AsZZshlIyxkVRwe790gedIDuts9pzh6
	 8LRz7VMI3acCE+Twy0L9DP9j9TIiOOaVAe9slyon2qI23CJ+RwgEWLFC3r6HJppRAL91C
	 BAVl45gaMwaijCJExHE6U5Y2rDB7w7l7h3dwkEu2gUkf4UYMxLcNu060KYDGJMJIjBoAl
	 1qQnmlnPj3WJPyzZt80YzQ4KpVSiO/RrBueBwKClDOGbeRPFidoDUJTD1BxyYP6N1bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TSZB30aS;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F115A606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F115A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TSZB30aS
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so2916248c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271123; x=1793875923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iymo6yWih1u6JSkjazwtYJq1W+j31tigL1sbJo3i2bo=;
        b=TSZB30aSZew/Y5iJpxyPAdCHSaUlGuRX0vGPWMGscUtyNdl4Gfru7VebT+uqAfmp6z
         QuRNmBliNwyit8/AV+JZGMrzS05uBUZyaJBYwcrM6V4CAEnFVG1H07Yh8XF6guXXqq/R
         0K6G6cvVOv6UxRt55KGii+YttWs6XbRYn3Y8tJ0JSK/FGkHwvCu2ElRB76I+w9muGUO+
         ehdbGY7CFuQhqr3Ct5KWUxe2bQqDJtvarrPkhglzBJlDKwFze5DOofXjDSx9NBRX5hSL
         ja5G7My3fhuw5URGr6Ba/QVGC9gd8w3GL/SZKX1gX5+fgnfevpEj7+FyT+7DRLu+RlLX
         hbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271123; x=1793875923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iymo6yWih1u6JSkjazwtYJq1W+j31tigL1sbJo3i2bo=;
        b=wRTHFW9VVZJUWFRiFAlYOIJN4gAS0IXtCxotBsi49TWCViFPfGGReIMd9MQ5SpT8JM
         M97Qw3mo2UDfBYxx+a/6beo/k5ZPMYnlypKlin3obHxLQqVEDw9PxnlnnfD2IbMPUBCB
         nuVW9dv79zQqYVJIyxSkJsjt8NR+MaAOOpxsjoc2pqyf2WZ+ddxFDP1QFdWmvCa0Jno6
         3vTzjRcCcTca8dZr/K3lkU6gfr7+b/wHPB1hY+2BkHsQ+KydAFnX2gQeZmflPyPYbUix
         LaHUwvgwzwOlxjQ5rYkzUijTInsTXkQtjSfRqm0D2v/B6NIGGmJb4EvuumQdlyrS42mh
         kk8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwhJtKlBCJPbzGB6mU4jmUMUU0aBukRxYXIXn0NZztGa3CU1Q5D3ma4Sg60cHAm1ccbF0HQOWD0zOs8/BY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqyB1Kp4oradZ2QFvcmOfE8gLiAEJkpbX/0lk8H6Vmv2YMqldj
	YNpxzX048Cv+SrjVWxvO8C8KEzwKPrQTVurWLlpLLlxh1Xp/meRGzZyn
X-Gm-Gg: AYBFou3DSSk2r7RqHDh0M7qNQOc22vIJ9Da0ukQZsslhymIYxqkg56roGvGxjS7sMIg
	//Ohya5nVLJZolK2wPf04DUG92snFK/bBsxlYaOpLa4HMgUezGZu+Nu4MZD2j3q6JlZc7uENrIf
	KG4vP7og+agrE3RESgBEv4VTI/UBN5R1Rqw9BQ4yU3daNJmgLylhJCCv+ix1d+keug3ftdUKeSC
	86B3VYaNA664y/k5mgrtaDASMEmhcStxRL9OSGvKK817tAaraG1i/a8QYOuRiOisJ3VxOldTcEh
	QZ+jarcpS0ghTYMrT3UlMxmDJWGDUda7/iGP4tfS3ZmP1q8LfT0EMwjqQkJpd5UgEfcA097fjO0
	/hMmNhW26F5UGJxxq6gPonLAXAQHRK3Mo8efQdXOhe1ONXQ+NkEbYa2juq4juVlHQcYrqR9Add1
	xSikuTSt9rHRHpIlsrZg4lqmy65VCmR1+WYdzNljL8RpNJOnhm2mLzEhQbOYyLOWQQpoeSz8ahG
	Z29NB7PhVVoSQ0CcstgYeZ6p9c4THjnh/OB8kvOfcE7S1p0BOdKCupG8vRq8qm0jQHlE1z4sEXN
	GGO+TYGdp2g1Iqc4T3eu1BnKsyHEgmU+ktU3Z0hKmJtA
X-Received: by 2002:a05:7023:c081:b0:14f:8e70:fad0 with SMTP id a92af1059eb24-1a6cfb045camr6418261c88.33.1793271122885;
        Thu, 29 Oct 2026 03:52:02 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c9fd2b4sm14692245c88.6.2026.10.29.03.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:52:01 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	christopher.lew@oss.qualcomm.com,
	deepak.singh@oss.qualcomm.com,
	pranav.phansalkar@oss.qualcomm.com,
	andersson@kernel.org,
	effeffe99@gmail.com,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH net v2] net: qrtr: announce local services again once our HELLO is sent
Date: Thu, 29 Oct 2026 19:51:57 +0900
Message-ID: <20261029105157.2553-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <at9mFUv1flg-6aMB@debian>
References: <20261022163116.1042-1-26rote@gmail.com> <at9mFUv1flg-6aMB@debian>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 26, 2026 at 08:11:56PM +0530, Manivannan Sadhasivam wrote:
> > +	if (cb->type == QRTR_TYPE_HELLO) {
> > +		/* Pairs with smp_load_acquire() in qrtr_hello_work() */
> > +		smp_store_release(&node->hello_rcvd, true);
>
> smp_store_{release/acquire}() accessors are only needed if there is an ordering
> requirement. But I don't see that exist with this 'hello_rcvd' bool flag.
> Wouldn't {READ/WRITE}_ONCE() suffice?

The flag is ordered against node->nid. qrtr_endpoint_post() assigns the
node id with qrtr_node_assign() before it sets hello_rcvd, and the
replay reads node->nid after it sees the flag. For an endpoint
registered with QRTR_EP_NID_AUTO, the id is only assigned when the first
packet from the remote arrives. With READ_ONCE()/WRITE_ONCE() the replay
could see the flag and still read QRTR_EP_NID_AUTO, which has the same
value as QRTR_NODE_BCAST, and the name service would then send its
announcements to every node.

The flag cannot be set under ep_lock instead, as qrtr_endpoint_post()
can be called in atomic context.

> > +		to.sq_node = READ_ONCE(node->nid);
>
> There is no READ_ONCE() in the earlier read. So please justify why you added it.

node->nid is read again here because the earlier read can come before
the remote's first packet and still be QRTR_EP_NID_AUTO. That is fine
for our HELLO, as qrtr_node_enqueue() takes the destination of a control
packet from node->nid itself, but the replay needs the assigned id.

The READ_ONCE() is there because qrtr_node_assign() writes node->nid
with WRITE_ONCE() and the other lockless readers, qrtr_node_enqueue()
and qrtr_bcast_enqueue(), use READ_ONCE(). After the acquire the id no
longer changes, so a plain read would also be correct. I kept it in v3
to match the other readers, but I can drop it if you prefer.

> > +		qrtr_local_enqueue(NULL, skb, QRTR_TYPE_HELLO, &to, &from);
>
> What happens to the return value?

It was ignored, and a failed replay was lost for good, as the Sashiko
review of v2 also points out. In v3 the replay is retried 100 ms later
if the allocation or qrtr_local_enqueue() fails, without sending our
HELLO again, and it is queued under ep_lock only while the endpoint is
still registered:

https://lore.kernel.org/all/20261029105142.2503-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
