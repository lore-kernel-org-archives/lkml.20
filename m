Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398014;
	b=4EAQXqj2mK+Sz99ETbsOVQ3nRxOcOXxmLXUDbvO6Kd/icWj30BiNWpxi/9MDpHHVX4H2
	 HxHS5SJpCKXj5XT/lfkXAVrROi7gs90ob1LpMRoku3drRx3U3nY/F3LJy2t0dDTZlHtSJ
	 V6vBpzvx6HV3PVttpBlIGEYAgHbt6+pGXcF0oHRujuFgRcr2Qjs0/oAeC9WWE4jYVqTkf
	 JLH+6HseGyE10+xb1KtB1/POjPEMreupEQKvwTRCmxVGI9qEyKtrWW4HMT5+uHuVmV57l
	 BGRJ8R9JbO01H0nsgX1RcSaaK97OAoXmJiGs3Y3AE0jugYoubYzbe7iExsdURy2YCHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=1lovXTBTesNzrZjhYYZnRpEWhMn2C97Lh0f0GxPOO9M=;
	b=sipYEIV/M7F3tfFYw4PVRPhTeDvAwrbvRlzKNq4SSuA97q7cqnfqvURvsbPWi6F+Jh5k
	 WLQycIZkYE4UDu3mpEXp/NIbhBKr3cUThlv0tN6eeAnhzzVY64LxvuAoJ1+u2IPt//sVl
	 3gifiw2sMXn0p4k8Z1tOe/bf7cr3ACqZzut525On6H5l1/0HLMN+MEf6jvFldgzPmN0EC
	 cJWZmmGuH2peKxqv+9LTO6k6BUXpHHYnncY5HZBZ5ZN08PbJzKkx5xAxAvHozwP40V2QR
	 QqBRJVDrWJsFLxGzucA7UqrZNT38eS5/u21BJ9yrxXOG47u1twYA2q9Zw0felEmWAhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="mQeEA/v0";
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690D5606A88A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 690D5606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mQeEA/v0
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdd769cc9deso1607661a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794398014; x=1795002814; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1lovXTBTesNzrZjhYYZnRpEWhMn2C97Lh0f0GxPOO9M=;
        b=mQeEA/v04wDHYZXQHXJp6+Yj8QXt9MVbmAKWCtCRNRq0b+TEQ8SM3wltK9S15GIlBC
         67RWyBh8aOkhD2VwVra+n6QZ3dRbFwa0QzktebDyWW4lviuHEo1D/6vf5XQprQhmVHSL
         H2rNU11hKT/0SebeEz4BW436Sfl3blhGyEXyC69weJdX3UfmfH5aHA6e+UDdth9BQ1pW
         Anpmw35QFMo0CRLKYSSx+hGbXqFRYGvAOr3L+nC8bEUnCl/+AmBwCwxf+1s+SUCkS609
         FnDM6FO+JeVWc+gT2jntoq7VzvRCnBhkWTrruWfxcOOcXHzEPvpDjCh/P/qHTyJds1/l
         QrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398014; x=1795002814;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1lovXTBTesNzrZjhYYZnRpEWhMn2C97Lh0f0GxPOO9M=;
        b=TgJXfpqeB6bX9oWrNSClBBf5FEN8q2wOm/5DyIWYl+J6Gjhg4IpNXJNJ8m6h4bbjzA
         mpLNx0N3vYOF+sRwFcZqwelFEGhJcU7kVM38YpuM4r2Lgazgt4witIXbm6z7oZhsqNfs
         I+5ErxaCOQU4+1g5zdH9u9899ZD9466rU/cf5pTz6+p8B0SVM02i2fHlC6tg7KJow02R
         T6bEJScfbVZ8drwpAeWVloB3xBN5Yb2pZ1npr50gFIM62yAilONRJBwEC5zjqh716o0O
         8KTxoHguhCumn2OM5dYhPoifOlZRoTlADK8hQGWro0Ai+aBKjHUu37tlRlQvP11bHCTA
         IOMw==
X-Forwarded-Encrypted: i=1; AL+hErFh0bhYlkOQvUh3Bjzc3uFyls2yVmM+Uj9r606oe0JCZsq4eCAllVxY4GZo4izLRoGcdKxj/AnNftIcREo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5+otHI21wwV7oJOmGaNlxA3TGdGUqm2arC8zQw2JIP9GwQ/ti
	3DsKsbAvArqtygzVdictdr5+agJIo8mZBE7yYdwoXvVn50oxf4+tDA+YgehTj2wJuELpm2cCypb
	SIGYj2PnY11A59y+PotnHfw==
X-Received: from pgba19-n1.prod.google.com ([2002:a05:6a02:6453:10b0:cc7:b17d:4d13])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:a0a:b0:3e8:b7fd:6294 with SMTP id adf61e73a8af0-3f2fc99f99cmr2221312637.16.1794398013463;
 Wed, 11 Nov 2026 03:53:33 -0800 (PST)
Date: Wed, 11 Nov 2026 19:53:30 +0800
In-Reply-To: <2052256418.81794387787276.JavaMail.epsvc@epcpadp2new>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <CGME20261111082303epcas2p180a7cf157dedd181634550630fe78df5@epcas2p1.samsung.com>
 <2052256418.81794387787276.JavaMail.epsvc@epcpadp2new>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111115331.1144901-1-stanleyjhu@google.com>
Subject: Re: [PATCH v10 0/4] scsi: ufs: core: Avoid redundant link recovery
 from the error handler during PM
From: Stanley Jhu <stanleyjhu@google.com>
To: HOYOUNG SEO <hy50.seo@samsung.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bvanassche@acm.org, mkp@kernel.org, stanleyjhu@google.com, 
	peter.wang@mediatek.com, alim.akhtar@samsung.com, kwangwon.min@samsung.com, 
	kwmad.kim@samsung.com, cpgsproxy1@samsung.com, h10.kim@samsung.com
Content-Type: text/plain; charset="UTF-8"

For the series:

Reviewed-by: Stanley Jhu <stanleyjhu@google.com>
