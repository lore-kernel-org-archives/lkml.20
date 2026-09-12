Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF6735AC1E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789201532; cv=none; b=JkFBUFLyblYcn3ejbMPo48N3v8CC4m+nFb8TJCTVVPO2tQZlWAefG6e6iedQUjYmDL8QaPiAz1fNMpqF0rvMgy5fDddWQYin29VGSbgl38SQF+HCQKlRT9H9Ul6eSfVqYGTsDRaP2kEGdF03sHpZDmMbU6MH4PH1lbU23yS+WKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789201532; c=relaxed/simple;
	bh=1fZwNjFgiv1iwilnK3XMfsjBAKCokGbGyTYW29bcql8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CAPdFHmvY3CWFsaXLJ3gxmDUrdhtpFf25HCHYyH0ECnrDR3q4sdnDZnYveRs6qKnqqVeAaAQuS58xBs32oaCJzOKbG5pfS8I+zHmTsOLRSGVExyBHbCt+shGpGazYqgUxU/xMPjZEKkEeN+lmKdikmrpBetWA1IdPeTxSBw0wuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hyctaT0u; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fBTy3Xoj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hyctaT0u";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fBTy3Xoj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789201530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1fZwNjFgiv1iwilnK3XMfsjBAKCokGbGyTYW29bcql8=;
	b=hyctaT0u06UBQlPw5f9suxZ+gEpZ8Nh1r6kRL+mObqeNDgQhEg6z5HzrcLyzDye0WKLGBN
	WfSKEw2Yff9ObTHK0CT6RRR3laVEQTV2y8CIz4jXR9+P+H+ZLKvXNbwJLnYYesqGoIIHbT
	gE/ZedWsL+4A45Ib0uJUb4KYm3c73jE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-ScJ0nWWeMeSpYifEuxPDXw-1; Sat, 12 Sep 2026 04:25:28 -0400
X-MC-Unique: ScJ0nWWeMeSpYifEuxPDXw-1
X-Mimecast-MFC-AGG-ID: ScJ0nWWeMeSpYifEuxPDXw_1789201527
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e6683d48fso11143005e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789201527; x=1789806327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1fZwNjFgiv1iwilnK3XMfsjBAKCokGbGyTYW29bcql8=;
        b=fBTy3Xoj8rrGohZufZw+lscoAoxqTwmmv15C+YefjVczI/Ah1rjGcn012CceOLlWza
         yG7enn9Ec+jxhPj6pEizfr5ZzqV8utplHL/6bpKAUF6TQDnLVrPjG+PTPn3ZBvL63M2T
         NHvEnxzmjvCXoXiL7qVchvY3v6lcPpkwQxMrDvbPxIj3g6hy/6L+UMFaIjB36AFk0n8X
         2n6QZgFo6ACz0GOx3OnQ6yAiu7qWjNfmFpKMo8teXii/5H1lGrG5Sv9GKlQkyDPAmNix
         p77mZyzGNMSkzPG9eViZTfBmLshEJX5GJIUMPsm5dMEdKjqTb8xcrO8jHHAfecLL8U0H
         CyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789201527; x=1789806327;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1fZwNjFgiv1iwilnK3XMfsjBAKCokGbGyTYW29bcql8=;
        b=BAiVWo3WYN0uJwAoZ2fnblYU0w7hxWDKyhh/efBsCxarzI+Fn6HUqRSWP/w5WaPfWa
         RFY7ybEwkNTNLiRfpvCfOupwg1YAwI04ZmnrOHiv91ZW9Ure05gmXkGkJvQs6qP3ek/I
         ocB1TdI577NjaXH8piFCQZaqVciZzMkkUX41UjSpsHumbUsL20TopF3aGizKTXEx/J5G
         7RR20MNTK+KWko1YPMyG4I0eL54XbTw0hFB7TkkzpG9Xv6CYrcAcy8QCam3P3LVjH2bD
         XECdHzHaJt3QvWkCerFflOWmEx6pF4wQbexU/laCPqYbeo3sdUrf9COo7VzVQA3tSdi/
         qVGw==
X-Forwarded-Encrypted: i=1; AKwUvBzaIgZzst55RqehDSOcUTp7EvbZzIl52d+mSFrvirraWO33Ce82huxtdJ6M3JXpWads52PgWt7NlgSYf2k=@vger.kernel.org
X-Gm-Message-State: AFuF++kQQaSDZ9J8gKmg/ZxwDDLcwbbxTMYUgyAzvk0NYzEfKK1dIZAv
	oFCWKmw/wTEsDf75VZHipnMdxrGui9BP/VQspsJKeMWP7NjOs2TzpQjacN8SCHkJwnaQlQtf0uN
	if3Ue9PS3RSfC3aVJp2SBh1Ax8lRCgxWgsj8qs9wU7L2IkkyCb6jvUfk+9+f1UiPBag==
X-Gm-Gg: AYBFou2Oz97Y3l2Ebf5AhUp6BmQFrh3zXP3IRHE/PScUs6c8PLzbW0ElcSyqYps9dOz
	nqnrGGgXUHS3JZXwQ0Z1wNzTIOltD6yUY85pYQos7Vq6Mh31er2rThevI5GxMM/Rl2ACPsk9hMD
	dA7MfZSN3bJhaMsf8lQyCiO0Ui2TgafjvCa/2IcXAyTvqGaYBqfFUYzn0hdwMfj2qvSkJD34llq
	SS6FpAJjUOPRpO92yiw3tOLhCeQiqJfioAfHhMZEHJDZke2vmCacq2E+5cTAxIo06V9ERup9co3
	EB1oDI7g3LQt1fdZGGdxFTYj0AmrKGhV/4dUhO7HI6r5F6FqkiH8Md+IsaWqEmTbZb9ezIEnJMw
	rYCl/qs7rXuOvXdhkplFnW0SuZ1A=
X-Received: by 2002:a05:600c:4583:b0:49c:fc6e:8cbb with SMTP id 5b1f17b1804b1-49e619e148fmr89799175e9.31.1789201526779;
        Sat, 12 Sep 2026 01:25:26 -0700 (PDT)
X-Received: by 2002:a05:600c:4583:b0:49c:fc6e:8cbb with SMTP id 5b1f17b1804b1-49e619e148fmr89799015e9.31.1789201526524;
        Sat, 12 Sep 2026 01:25:26 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (alrua-x1.borgediget.toke.dk. [2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c0cb676sm46482905e9.14.2026.09.12.01.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 01:25:25 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 897FC9B9A96; Sat, 12 Sep 2026 10:25:24 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?=
 <ast@fiberby.net>, netdev@vger.kernel.org
Cc: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?=
 <ast@fiberby.net>, Jakub Kicinski
 <kuba@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, Danielle
 Ratson <danieller@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, Jamal Hadi Salim
 <jhs@mojatatu.com>, Jonas =?utf-8?Q?K=C3=B6ppeler?=
 <j.koeppeler@tu-berlin.de>, "Matthieu
 Baerts (NGI0)" <matttbe@kernel.org>
Subject: Re: [PATCH net-next 09/10] netlink: specs: tc: fix typo in cls-flags
In-Reply-To: <20260911214148.1184806-10-ast@fiberby.net>
References: <20260911214148.1184806-1-ast@fiberby.net>
 <20260911214148.1184806-10-ast@fiberby.net>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Sat, 12 Sep 2026 10:25:24 +0200
Message-ID: <878q56dggb.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net> writes:

> Fix a typo in the naming of a cls-flags constant.
>
> The correct name for TCA_CLS_FLAGS_NOT_IN_HW is "not-in-hw",
> not "not-in-nw".
>
> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>
> CC: Jamal Hadi Salim <jhs@mojatatu.com>
> CC: "Jonas K=C3=B6ppeler" <j.koeppeler@tu-berlin.de>
> CC: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
> CC: "Toke H=C3=B8iland-J=C3=B8rgensen" <toke@redhat.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

