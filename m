Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792801107;
	b=oXwKRkPwHvsqvd0calrv0K6V3HEAN2wLzrFBT00pNL8dRsOjlulBRbErN/HXVQC5qM7j
	 WJ5raBnazczoNFQPXtwtYR2rOfrHvMpiXfelLqVSO6lJkVYzHTIOpGgJS+I4zoVt8d5U2
	 IHhKuAfnBU4zgb4uuFL+k0iJoSjXEZFWA5Qhyk3ZA/CdKgXY3GCQexunkhfcDvBtgZwzx
	 Hxg1/U6QsYJdSYT7Fq7u7VbqWFE7W66RuElX7m26MfxyOPUoPAG2/lYbHa3FdDuRb1osn
	 2b/QMEI+17TEXTzByoxEmSDxkBLsS1miW/fFP9OjHmDF5iMF7boUtzTcZ9L6hds0GPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792801107;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=q3p7xV5H+PTultXl1mNwMnr7GJaX/h6Y8PqBUyBRi0M=;
	b=F0fUOQlK/WBhvtxaFquc+YypRl+4fQfizIl/qq1ov9TaVbJKI+SidOx/nkj8wWPrRCjk
	 eRYW46/pQCw+wuWz6WWGFR806KUDi6+PBfnA4FwIb7yMbdU1mS3j276nZxka+p2JA172W
	 GeigdbIVZB+bMDffwIQW/bp+plHDDd+Eetm0AvyfrIYQ19MvExVhscgpuCmqA33ZXysK1
	 kTjE43wdMZrGJ/N5BZlQWzOvHQlrhFdZcyWxOagoRx1qYxKGAmAmNQOM9s4v3u1MQUZDv
	 cI3NQR2BbECRDgOY5WoazPwb1qAJFzcfvvfe86EOVbhKdtC9qPY1z06LjyWnAYmYJqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=RItYEAWg;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0DD606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E0DD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=RItYEAWg
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90B011081B2;
	Sat, 24 Oct 2026 02:18:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792801100;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=q3p7xV5H+PTultXl1mNwMnr7GJaX/h6Y8PqBUyBRi0M=;
	b=RItYEAWg4ihIQlAh5mITs+PU8pJKQdRduw8dNgcqOw54xHQ/Y0dx3uvzenymbKVMV/pLCc
	MshIjoEf6kDplYfNVj+23Qf7BkRWnCMef0D9zCPMnLCmYcdg476FAFUyVwMSbnu6txD8Hs
	VbEnpmU/iOKL9sJP7+036YUZPM9FIBhrmDNdZvyQ3jGrcTmgH11Y+sqhFVl+HiCUOSCDX+
	vMS0CBKdWuSAEhQOA5sS2TOZgxCLPumShZ64BFja3g3aQO/EcPm7gduDUzVxFCq5vSr2NN
	4bx5Jh/FOKHPZe4kuKQnwqGh4HKkQod3wnpTdmEdQUl44SYYbow6gYM2F/J6RQ==
Message-ID: <8ee5b312-80bc-4584-ac35-cc76c2812c5d@nabladev.com>
Date: Sat, 24 Oct 2026 02:18:18 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: Describe locking support for MX25L51245G
To: Cheng Ming Lin <chengminglin@mxic.com.tw>
Cc: Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20261024001658.222147-1-marex@nabladev.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261024001658.222147-1-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/24/26 2:16 AM, Marek Vasut wrote:
> The MX25L51245G part has similar 4-BP locking mechanism as MX25L12805D,
> however, the TB bit on this part is OTP. Introduce support for Top-only
> locking in case the TB bit is not set, and disable locking in case the
> TB bit is fused i.e. set to Bottom mode.
Cheng Ming , can you (or someone from Macronix) please have a look at 
this patch and confirm that it is OK ?

Thank you for your help !
