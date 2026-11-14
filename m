Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794636892;
	b=s9gBaMSAqFFwgnVMAptUQn+SqSLEkTXxzyfUa9susHPLRlUX4wWzvAm4b/VBkcx8wwtg
	 sr+nBkT50sfT3JWaed1PTrRmFJ/VhgzAXl+Wb6V9niWBj/3Pc3zAwE5O50kcO2yf6KZtw
	 cMQ82cmGvnQzXv40C0EfkvnveBU49k9QRL8nGEfcg1KlB0bDGRODzXnPb/65e7UjbFC+w
	 cPVX9vR6bDLZKDtov+IwkhRI4UjN2mxfekpuAkoZbmxe7WxzQ0SYgZU2WLsOKDC6KV1hK
	 s7zQFZ9se0Rr48Qyo2yE5xXvCRuSP8pO4qKhD5F7YCNlarHGe0aXSJdNxd/mY07HM1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=rcRT1KXRxMVMkbqC0U3OtsyJos+rmMAQkFnzvfRCjWY=;
	b=E3ucu3nulLAw5i74am7ASpC1OEO7QBhUQ4TsDD5XNN5kj71GnnpQj82wP9WTiLbkKRXO
	 JUGuJq1dRPccUy+AZdLZJ6TWn+yqka0ZwN441YxBh+yGaXJ7kx8x0LI+sXbfyO9Mru3pc
	 SyhIJ2KAaS+sGmhvORwfe3VjPqYWA7bfnjdCZovfpomEFhxRgqLkRoTSkzOPOZ03RG7Ja
	 TF2Hpjk1m+sZO2qkSz+97pS2GidjJIkB1fG49Cng4Ns+GnhL5CKbuUKm9xIgfA2Mlrvve
	 eHVQdImLoNddlpEQ1rMC8TzyTxUiriGpUqJHU1VM1Q9546oIfyF5q8CTEFEVuzxgP4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AAXItUB6;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFC1606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CFC1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AAXItUB6
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b647bbf8a9so2047184b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794636891; x=1795241691; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcRT1KXRxMVMkbqC0U3OtsyJos+rmMAQkFnzvfRCjWY=;
        b=AAXItUB6nLo8Ld8relHkMakJMmcuRNIsknoR4+BEM4pSV8B6NMLHbLLbDWU9hi9tNb
         jgdzHxKTj5/DbNttUCWS/1H0D+IQKlezeFugNBvN4aDY/BrH5cd7Frj3L9D7yB0ULnfJ
         OR9HjF4GH6UYfG8ZUTCfjJwfE0Cql/Wisd9i4Ndx1F/bQqjp5kwVkKvYFV6WZ++sB7LR
         NTbv6uW33BsKh6oOwCVC9D2uSV3X851/fTC7Q0G0wly/pQF/ZlmUp+qZy9Q0qh/OpQ7C
         28IB8ztcs5lZfX3WXcO/lhJIl1bE3fnuMYrEiVXQDSWtzek+YrI2BeCzD44YzcKvERsG
         ++nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794636891; x=1795241691;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rcRT1KXRxMVMkbqC0U3OtsyJos+rmMAQkFnzvfRCjWY=;
        b=eAeECugdSJGSVyDl/USrAn2gGj2MXUorzboxsP3LC9PNK3X6yvt+YIpzhhGAYfv3NJ
         2VFP6f5hfqasEnp0ux3qnSZ+/nmjpdr1jxgnLfJ+rxJx8UtH3QSI0IFkPqsqtjX69Zgr
         Knsd3o4vjP2JGGJCakek+x/cl8pc+o3v34s7gwc7gF3rvX0mcxa3wQkSiQBaToqDmggN
         LKxpi810mRYh0gG0YOpEsXy4ecd/d2E0jzs8x8g9juLhLqhhInshgnkp8fy4jxo96mSW
         g8uKE8FWNyrcKqCg8ADNCuBtZsNBV4rE6XnF9/qBTxibPUlWDLzw7ZQbbwH0Y007GQnr
         5KvQ==
X-Forwarded-Encrypted: i=1; AL+hErGe+7IRgWerXlPwD3LypLHmTJ6XwlgF9id19l8KMFSRsKpeDq6JTDiHE0QVZedFIFEMndvFbtK3RnFBuSk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sXHckUacsWyPdwzQ1TS1RVzDI1rzvdb1NUvSjkTOlrfugKeNT
	U76OUjSWS88a+RvsuvlurmiV91Q2mRi4F+G4IHa6UfDFZ7Lxl/4SXqF/X8uveGGgfTG3gCXDrUt
	Sai/OeQ==
X-Received: from pgij8.prod.google.com ([2002:a05:6a02:8408:b0:cd3:da0f:7741])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:888e:b0:3e2:7bc3:9bde
 with SMTP id adf61e73a8af0-3f7a83b8ec2mr4021901637.59.1794636890522; Fri, 13
 Nov 2026 22:14:50 -0800 (PST)
Date: Sat, 14 Nov 2026 06:14:50 +0000
In-Reply-To: <20261111-mtu-probing-series-v4-2-6f2e484ca8ea@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-2-6f2e484ca8ea@gmail.com>
Message-ID: <avf70FWg6nSW1zhX@google.com>
Subject: Re: [PATCH net-next v4 2/4] selftests/net: packetdrill: test
 tcp_base_mss on passive connections
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Yongjian Wang <echoowall@gmail.com>
Cc: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, edumazet@kernel.org, 
	horms@kernel.org, ncardwell@google.com, davem@davemloft.net, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com
Content-Type: text/plain; charset="us-ascii"

On Wed, 11 Nov 2026 00:45:56 +0800, Yongjian Wang wrote:
> Check that a passive connection starts at tcp_base_mss with
> net.ipv4.tcp_mtu_probing=2, as an active connection does.
> 
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Somehow this series didn't reach my gmail inbox.
