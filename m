Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363674;
	b=gtpJIo23SRE+4oSpmNuBHwbeSIbxKFMDx2aIP+mU6Z0prB1mnWXutA91w4TLlKk5qwNT
	 tKV6o5nRxTnpouEMooGrEtAE6u6NydYlcn7LUnzC3r7ZWo+il+YOFMQ/6qjtB3R3VVlRc
	 obv0tSpRkM5nG7qSr7WnGrPafCSWDb1lYQznImR+MUyOzkiH81jcU5BNADPRTxBa3ERRN
	 c/zAdKcvo0SS+PXremnXseXWbqlwbeE3PwFMzoJeC+65xMgsTMQBUneqZL4nB8YwDh3Cb
	 XPMOAqxPHjaKcn3OJBaEL5pSo1O8y4r8Yf+IZXj+8/I3sh6g+J3QobmGnu2TzIdn56g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363674;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=I4GBhnkL8TbOzob3Wovtp6qk4K24+RzN6Xk5hbAk0Ak=;
	b=ct6A6eB5wTveLNrc2aJc6UAdydETXsIViQp/XDOd9mCyHoxNXOCWfVwwGouUUrPLRIR0
	 4R5URd89r8KIixMTnCwjDnrG0F/2t3KjiIyqEHrqYgx+rjOWI41sbRWDWxrWiyL1Jljds
	 7zvnH35MEdWzvGVvejdmyODfHfzCPiYbUCW3MvYxe5giLHWTq3AVPgNC7BRkiw4UyFsP/
	 xHXQ0Cff01xtBphMTEmg8B8xgx6qUc+3+7bMt7qGYq7Hw/IDSnSc+z+TiDAruat5YjFgK
	 9OvM3RlRH2Wl7KraiCOW9iYEOj6dQwM+pAFFu4nUP2UKFwW2+GfATrrgJUA4e6i3Ycw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=QtmdzpEM;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCDA606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BCDA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=QtmdzpEM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794363671;
	bh=I4GBhnkL8TbOzob3Wovtp6qk4K24+RzN6Xk5hbAk0Ak=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QtmdzpEMtcHmZ6A20VSY0hFQyy2l3PaT6QOvQSjHOMW5g2fwf8UwTuzDwbDrkWmut
	 rkKVFDBBPILMrE3J0DDA2hQ1GV2iH7z+SeNsDaNI6x4XQKkf+MHll++OI01OGjESc/
	 s/3HM4eMKetqfi8Qb+BuLaJlt3/3MYevt9keBTQFmNuHBB0TcDjR0DW0QVJAnnVBSv
	 6eD2HCQXI3KDkeUCyHzJWOsNH+rRqsVGHQn10PhYM5QmsNjVV+DUsx1Dp3KyIEAlFv
	 NbzDTTylft2VJ9iv0egTDwWwPIjyq7e9QAmYqdP+PVIWmfy+lff2yy//B0OYucvu8h
	 dcLWBzvlTxt9Q==
Received: from [127.0.1.1] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A78E964C3C;
	Wed, 11 Nov 2026 10:21:11 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tan Siewert <tan.siewert@9elements.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260819-aspeed-reviewer-myself-v1-1-bec3874cfcd7@9elements.com>
References: <20260819-aspeed-reviewer-myself-v1-1-bec3874cfcd7@9elements.com>
Subject: Re: [PATCH] MAINTAINERS: add Tan Siewert as reviewer for
 ARM/ASPEED
Message-Id: <179436367163.2554644.7658720316949803236.b4-ty@b4>
Date: Wed, 11 Nov 2026 12:51:11 +1030
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Wed, 19 Aug 2026 14:26:12 +0200, Tan Siewert wrote:
> I'm volunteering to help review patches for the ASPEED SoC support.

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

