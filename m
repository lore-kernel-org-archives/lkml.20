Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAA6360EF3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332659; cv=none; b=B6mpKfuLwvBebTcVWvSXn8r24TreqcczjMTGMi/AnvPXyZfWP/oLaW/XH8xXPAfL0o7S4d/Tja9V6ujXxmmuJPFPd/yqf+3N0F+/y/CGlxo0OmTQ4ixX2Gzra100/Rs6/pNPH/ZglQo8MvZ0+8I5JGR4GZRi5YrKJJyFH7kJpgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332659; c=relaxed/simple;
	bh=IlL8iaYajV3Wj9aNQbzvNV52XA7cB91i8FwkXwg1dmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d79VT90Q+j7p3XfDUra30v2NFoAyb6Y7amqpSs0IVe5chNSwPuQP5bKsuUkmC4n9ungMA2A2kv22DnIifyDIEbwE6VZGPnXzJ1CMoFEoqH4IOGIC1UrBcOkzC9U437X+D+4kRM7Y2wOgrjjmUv/X9bNWRb4Lq8kuzyeCZfQhVSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKDJmYOy; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKDJmYOy"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc149372c14so547657a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788332657; x=1788937457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsDRbeSR3oPdTok/4rtWnAh/uOJC6hXbk8Fr43qwD/k=;
        b=jKDJmYOy5yv1PDwexMbEsnBG+iWxa6e37d9yEf2CItzzGBReLvKwDVjlUFzctzfsVf
         7JuIpufXBsQ4IhkhurVyuUnmt28QXeforDWu54Ar3gtFej6OLrJhimyh6T1llc9MzDby
         hlsYSE8Fu8fwrSFDaj9UZr8klUPEgkDFhEAQgvN7AKZAwXQVHeNOV8Tfgy+gJ2+StROQ
         HlQl0g8fSMMWKxLnWNEEv8dm+2wZA9KsxHXrEJC0FeNaKlh7YnA8KjpetqREzzAZbO/S
         5pHf7osdhcFRKYYHf8eeAxBwRSX1qhGJNORaPVTxZKM15csJvnYSrViywU6gGBxgZI/w
         0GTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788332657; x=1788937457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EsDRbeSR3oPdTok/4rtWnAh/uOJC6hXbk8Fr43qwD/k=;
        b=mNMvqOSKYi6lu0ICepqukiJuQqiGzxIlNFr1Vq9GaqvClxDLi3b767nDTx/6sZzktU
         /8EohUru0NbUlR8NjadEBgVHSP98yQASmw/oKaj9J0iVq+JYTFMtbEYMKBWP3henU/LS
         90zU1waKERXdNLYpWKK4IdnFvSWADJWYDvF0eq8+PUA0AEltPUKMBeu8MfzlPT5gxwI4
         vaeCCyg8QOiyIWA4qxlfvCDA6sAoenEL3pmKOjyz2ZiODWZRGaabMiJaJ9VP8vSPQWNw
         AlSVN4241O6KQ0+n8xAwNVclP01E9EMwAZkNYhArfBZrWL1USMe2FCpYR23o3sU+pHGl
         tM7g==
X-Forwarded-Encrypted: i=1; AKwUvBxmww50dDSWkXMsHZESHuhvdr8GNbEPOOFu/f9sIVcIR9Fqj2/9JOKylnh2O2vH46vJm19dJ6AwLwDHGQA=@vger.kernel.org
X-Gm-Message-State: AFuF++n2UJ+ssrwXsoMqn4ebJ4ahREWvgbnFNGo/d+VocpPdW+ujyKg3
	WYKOYsCW1S3RN4eNne5btPxL5otrcVSA2gSoQZBHxikOr+9ZlCpQ1ch/
X-Gm-Gg: AYBFou3cCoa79Q7vLa7Do/YCLe3WVN0LZjcGqGYhGgWHUawwe4t3F8zrGPfzpZk2lZk
	tc6cLOPUsVyxkIq66qn9nGNM6qob9B5CGavbZelzKgfKQrSaMf+lhKBtmRb+w53D++A7x/BnlIR
	gIENt2iaJIR9L/sdioCCCws/WteQpI6hjyj8ls9EM0vEAddeYxCOK+iVVxUacxKhgZE9cmdBCD0
	aQE71ZLpqsC0I91PwSZKQGS9FArGkUemwtJHeSAe4PRTgD8zQWuzfjtjykLjo+jyfqdn8eD+5dw
	mgVXCqZQ9znWM4TNT8uCYBCeXVkNDrFMAJ4QLGEN0zXyLiA1sA8yQQSwQytMKsuEGMvgyRhkD78
	1s/wz8RD2oAjCzgE25pimrURs813UlTqBIlA4AghKr2ZzsH1kU8BzqH46vTIiXFFoHzfSsAQkFj
	CUx9Dtblo6+Y/Vp/MNCWOnKyscuAOs/TcW/rggkUqqsZQJnlK9q8nMe6TBKVDTWF4+FDZIr1H1J
	vFqT8sbt3s=
X-Received: by 2002:a17:90b:4e8c:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39aee0840d5mr4219200a91.13.1788332656800;
        Wed, 02 Sep 2026 00:04:16 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae610e5b2sm747155a91.0.2026.09.02.00.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:04:16 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Jan Kara <jack@suse.cz>,
	Miklos Szeredi <mszeredi@redhat.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] fanotify: destroy/add race leaves a mark on a detached connector
Date: Wed,  2 Sep 2026 16:03:58 +0900
Message-ID: <20260902070359.4163607-1-4ncienth@gmail.com>
In-Reply-To: <CAOQ4uxjbEY12XMmfCXTPTpASmECCXcGBQR+bS93k=4vgqzFDZA@mail.gmail.com>
References: <20260827045007.3831259-1-4ncienth@gmail.com> <yjfqzckumtd32dgqidi5sndvth2t67mjwah4kt4jiahlx2a5uf@if55sinfv5o7> <20260828042421.964822-1-4ncienth@gmail.com> <ptco7s5x7tjzp42dzlsitibdigpwucl2whwrq37tknjpo7x2lc@b7q27ldlorak> <CAOQ4uxgB9anyJcWem04w65VCJdxbbb2cQDZ_u8qMusw3xpB9Gw@mail.gmail.com> <63aj7jbfaoamdmcurlge2c2kqpliaifgq4vbythrrxpfyr5vtm@z64myom426zd> <CAOQ4uxh-NZ76hEFoNNGjyhodr9U=dvZuGVmYHVPGZ_=jRxCAsA@mail.gmail.com> <67hq7zqnvp6onwwjp24axucgxbzsko2dphielupdfzmfyk6x57@bdeef7fjkqfa> <CAOQ4uxiQF4M_YSBMW3h8VCKR15GV6g_K5nf=2odtYetEwKHm9A@mail.gmail.com> <6n6r5zvcu5ojihyb52rhejlky7xrn2a2p4l2cgfut5lsscunek@bcnpy7bifjrs> <CAOQ4uxjbEY12XMmfCXTPTpASmECCXcGBQR+bS93k=4vgqzFDZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Amir,

I tested the exact attached patch (SHA-256
9fa187507909ae14c8de8a117e775122e3daa425c69081b7115b3dc979fca14d)
on Linux v7.2, commit 8d3ae59288f1, with an x86_64 KASAN kernel.

The capless prerequisite probe passed as UID/GID 65534 with CapEff=0 and
NoNewPrivs=1. I then ran the original reproducer command

  fanotify_destroy_add_race 10000 1 1024 256

in three fresh 2-vCPU boots. All three runs completed 10,000 iterations with
10,000 successful adds, zero add errors, and 10,000 fdinfo reads. The complete
serial logs contain no fsnotify_conn_mask() warning, other kernel warning,
KASAN report, Oops, panic, or kernel BUG, and both guest and host exited 0.

This tests the originally reported race reproducer. I did not yet test the
new permission/pre-content, duplicate FAN_DELETE_SELF, open_by_handle_at(), or
NFS/export-filesystem semantics discussed later in the thread.

Tested-by: Daehyeon Ko <4ncienth@gmail.com>

Thanks,
Daehyeon
